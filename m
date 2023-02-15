Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDC010EA06
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Feb 2023 00:46:56 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 16:46:30 -0800
Message-Id: <20230215004648.2100655-14-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
References: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 13/31] i915/perf: Add support for oa perf
 groups
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

With multiple OA buffers, we need a way to group engines per OA buffer.
Add support for oa perf groups for tests

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf.c | 169 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 90c78929..727eaf4e 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -39,6 +39,7 @@
 #include <math.h>
 
 #include "i915/gem.h"
+#include "i915/gem_engine_topology.h"
 #include "i915/perf.h"
 #include "igt.h"
 #include "igt_perf.h"
@@ -238,6 +239,8 @@ static int pm_fd = -1;
 static int stream_fd = -1;
 static uint32_t devid;
 static struct intel_execution_engine2 default_e2;
+static struct perf_engine_group *perf_oa_groups;
+static uint32_t num_perf_oa_groups;
 
 static uint64_t gt_max_freq_mhz = 0;
 static struct intel_perf *intel_perf = NULL;
@@ -5312,6 +5315,167 @@ test_sysctl_defaults(void)
 		if (e__->class == I915_ENGINE_CLASS_RENDER) \
 			igt_dynamic_f("%s", e__->name)
 
+struct perf_engine_group {
+	/* exclusive perf fd per engine group */
+	int perf_fd;
+
+	/* gem context id passed to perf */
+	uint32_t ctx_id;
+	uint32_t oa_unit_id;
+
+	/* perf engines in a group */
+	int num_engines;
+	struct i915_engine_class_instance *ci;
+};
+
+static struct drm_i915_query_engine_info *query_engine_info(int i915)
+{
+	struct drm_i915_query_engine_info *qinfo;
+
+#define QUERY_SIZE (0x4000)
+	qinfo = malloc(QUERY_SIZE);
+	igt_assert(qinfo);
+	memset(qinfo, 0, QUERY_SIZE);
+	igt_assert(!__gem_query_engines(i915, qinfo, QUERY_SIZE));
+#undef QUERY_SIZE
+
+	return qinfo;
+}
+
+static int compare_engine_oa_unit_id(const void *e1, const void *e2)
+{
+	const struct drm_i915_engine_info *_e1 = e1;
+	const struct drm_i915_engine_info *_e2 = e2;
+
+	return (int)_e1->rsvd0 - (int)_e2->rsvd0;
+}
+
+static struct perf_engine_group *default_engine_group(uint32_t *num_groups)
+{
+	struct perf_engine_group *groups = malloc(sizeof(*groups));
+
+	igt_debug("using default engine group\n");
+
+	groups->perf_fd = -1,
+	groups->ctx_id = 0xffffffff,
+	groups->oa_unit_id = 0,
+	groups->num_engines = 1,
+
+	groups->ci = malloc(sizeof(*groups->ci));
+	groups->ci->engine_class = default_e2.class;
+	groups->ci->engine_instance = default_e2.instance;
+
+	*num_groups = 1;
+
+	return groups;
+}
+
+/* Until oa_unit_id is exposed from uapi, work around it */
+static void populate_mtl_oa_unit_ids(struct drm_i915_query_engine_info *qinfo)
+{
+	struct i915_engine_class_instance ci;
+	int i;
+
+	for (i = 0; i < qinfo->num_engines; i++) {
+		ci = qinfo->engines[i].engine;
+
+		switch (ci.engine_class) {
+		case I915_ENGINE_CLASS_RENDER:
+			qinfo->engines[i].rsvd0 = 0;
+			break;
+
+		case I915_ENGINE_CLASS_VIDEO:
+		case I915_ENGINE_CLASS_VIDEO_ENHANCE:
+			qinfo->engines[i].rsvd0 = 1;
+			break;
+
+		default:
+			qinfo->engines[i].rsvd0 = UINT32_MAX;
+			break;
+		}
+
+		igt_debug("class:instance = %d:%d, id = %d\n",
+			  ci.engine_class, ci.engine_instance,
+			  qinfo->engines[i].rsvd0);
+	}
+}
+
+static struct perf_engine_group *get_engine_groups(int i915, uint32_t *num_groups)
+{
+	struct drm_i915_query_engine_info *qinfo;
+	struct perf_engine_group *groups = NULL;
+	uint32_t id = UINT32_MAX, num_grps = 0, i = 0, j;
+
+	qinfo = query_engine_info(i915);
+	if (!qinfo)
+		return default_engine_group(num_groups);
+	igt_assert(qinfo->num_engines);
+
+	/* Currently only meteorlake is supported with engine groups */
+	if (IS_METEORLAKE(devid)) {
+		populate_mtl_oa_unit_ids(qinfo);
+	} else {
+		free(qinfo);
+		return default_engine_group(num_groups);
+	}
+
+	/* sort so that engines with same oa id are together */
+	qsort(qinfo->engines, qinfo->num_engines, sizeof(qinfo->engines[0]),
+	      compare_engine_oa_unit_id);
+
+	/* create groups */
+	for (i = 0; i < qinfo->num_engines; i++) {
+		struct i915_engine_class_instance ci = qinfo->engines[i].engine;
+
+		igt_debug("class:instance = %d:%d, id = %d\n",
+			  ci.engine_class, ci.engine_instance,
+			  qinfo->engines[i].rsvd0);
+
+		if (qinfo->engines[i].rsvd0 == UINT32_MAX)
+			continue;
+
+		if (qinfo->engines[i].rsvd0 != id) {
+			id = qinfo->engines[i].rsvd0;
+			groups = realloc(groups, ++num_grps * sizeof(*groups));
+			j = num_grps - 1;
+			groups[j].perf_fd = -1;
+			groups[j].ctx_id = 0xffffffff;
+			groups[j].oa_unit_id = id;
+			groups[j].num_engines = 0;
+			/* alloc max engines, trim later */
+			groups[j].ci = malloc(qinfo->num_engines * sizeof(ci));
+		}
+		groups[j].ci[groups[j].num_engines++] = ci;
+	}
+
+	igt_assert(num_grps);
+
+	/* trim engines */
+	for (i = 0; i < num_grps; i++) {
+		struct i915_engine_class_instance *ci = groups[i].ci;
+
+		ci = realloc(ci, groups[i].num_engines * sizeof(*ci));
+		groups[i].ci = ci;
+	}
+
+	*num_groups = num_grps;
+
+	free(qinfo);
+
+	return groups;
+}
+
+static void put_engine_groups(struct perf_engine_group *groups,
+			      unsigned int num_groups)
+{
+	int i;
+
+	for (i = 0; i < num_groups; i++)
+		free(groups[i].ci);
+
+	free(groups);
+}
+
 static bool has_class_instance(int i915, uint16_t class, uint16_t instance)
 {
 	int fd;
@@ -5382,6 +5546,8 @@ igt_main
 		write_u64_file("/proc/sys/dev/i915/oa_max_sample_rate", 100000);
 
 		gt_max_freq_mhz = sysfs_read(RPS_RP0_FREQ_MHZ);
+		perf_oa_groups = get_engine_groups(drm_fd, &num_perf_oa_groups);
+		igt_assert(perf_oa_groups && num_perf_oa_groups);
 
 		if (has_class_instance(drm_fd, I915_ENGINE_CLASS_RENDER, 0))
 			render_copy = igt_get_render_copyfunc(devid);
@@ -5604,6 +5770,9 @@ igt_main
 		if (intel_perf)
 			intel_perf_free(intel_perf);
 
+		if (perf_oa_groups)
+			put_engine_groups(perf_oa_groups, num_perf_oa_groups);
+
 		intel_ctx_destroy(drm_fd, ctx);
 		close(drm_fd);
 	}
-- 
2.36.1
