Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BEE10E60E
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 15:00:40 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, petri.latvala@intel.com,
 ashutosh.dixit@intel.com, umesh.nerlige.ramappa@intel.com,
 arjun.melkaveri@intel.com, krishnaiah.bommu@intel.com,
 igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 20:22:09 +0530
Message-Id: <20220421145211.464313-5-priyanka.dandamudi@intel.com>
In-Reply-To: <20220421145211.464313-1-priyanka.dandamudi@intel.com>
References: <20220421145211.464313-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/6] lib/i915/gem_engine_topology: Add
 helper to list engines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Add helpers to check the region of an engine and
list the engines for a gt of a given class.

Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/i915/gem_engine_topology.c | 118 +++++++++++++++++++++++++++++----
 lib/i915/gem_engine_topology.h |   8 +++
 2 files changed, 113 insertions(+), 13 deletions(-)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index ca3333c2..9029a491 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -25,6 +25,7 @@
 #include <sys/stat.h>
 #include <sys/syscall.h>
 #include <unistd.h>
+#include <limits.h>
 
 #include "drmtest.h"
 #include "igt_sysfs.h"
@@ -89,17 +90,30 @@
 #define SIZEOF_QUERY		offsetof(struct drm_i915_query_engine_info, \
 					 engines[GEM_MAX_ENGINES])
 
-static int __gem_query(int fd, struct drm_i915_query *q)
+static int __i915_query(int fd, struct drm_i915_query *q)
 {
 	int err = 0;
 
-	if (igt_ioctl(fd, DRM_IOCTL_I915_QUERY, q))
+	if (igt_ioctl(fd, DRM_IOCTL_I915_QUERY, q)) {
 		err = -errno;
-
+		igt_assume(err);
+	}
 	errno = 0;
+
 	return err;
 }
 
+static int
+__i915_query_items(int fd, struct drm_i915_query_item *items, uint32_t n_items)
+{
+	struct drm_i915_query q = {
+		.num_items = n_items,
+		.items_ptr = to_user_pointer(items),
+	};
+
+	return __i915_query(fd, &q);
+}
+
 /**
  * __gem_query_engines:
  * @fd: open i915 drm file descriptor
@@ -112,17 +126,13 @@ int __gem_query_engines(int fd,
 			struct drm_i915_query_engine_info *query_engines,
 			int length)
 {
-	struct drm_i915_query_item item = { };
-	struct drm_i915_query query = { };
-
-	item.query_id = DRM_I915_QUERY_ENGINE_INFO;
-	query.items_ptr = to_user_pointer(&item);
-	query.num_items = 1;
-	item.length = length;
-
-	item.data_ptr = to_user_pointer(query_engines);
+	struct drm_i915_query_item item = {
+		.query_id = DRM_I915_QUERY_ENGINE_INFO,
+		.data_ptr = to_user_pointer(query_engines),
+		.length = length,
+	};
 
-	return __gem_query(fd, &query);
+	return __i915_query_items(fd, &item, 1);
 }
 
 static const char *class_names[] = {
@@ -133,6 +143,16 @@ static const char *class_names[] = {
 	[I915_ENGINE_CLASS_COMPUTE]       = "ccs",
 };
 
+const char *gem_engine_class_to_str(int class)
+{
+	const char *str = NULL;
+
+	if (class < ARRAY_SIZE(class_names))
+		str = class_names[class];
+
+	return str ?: "unk";
+}
+
 static void init_engine(struct intel_execution_engine2 *e2,
 			uint16_t class, uint16_t instance, uint64_t flags)
 {
@@ -350,6 +370,78 @@ struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags)
 	return e2__;
 }
 
+static int has_region(int i915,
+		      const struct i915_engine_class_instance *engine,
+		      int closest_gt)
+{
+	int min_distance = INT_MAX;
+
+	for (int gt = 0;; gt++) {
+		struct drm_i915_query_distance_info info = {
+			.region.memory_class = I915_MEMORY_CLASS_DEVICE,
+			.region.memory_instance = gt,
+			.engine = *engine,
+		};
+		struct drm_i915_query_item item = {
+			.query_id = DRM_I915_QUERY_DISTANCE_INFO,
+			.data_ptr = to_user_pointer(&info),
+			.length = sizeof(info)
+		};
+		int err;
+
+		err = __i915_query_items(i915, &item, 1);
+		if (err < 0 || item.length < 0)
+			break;
+
+		if (info.distance == 0)
+			return gt;
+
+		if (info.distance < min_distance) {
+			min_distance = info.distance;
+			closest_gt = gt;
+		}
+	}
+
+	return closest_gt;
+}
+
+struct i915_engine_class_instance *
+gem_list_engines(int i915,
+		 uint32_t gt_mask,
+		 uint32_t class_mask,
+		 unsigned int *out)
+{
+	struct i915_engine_class_instance *engines;
+	struct drm_i915_query_engine_info *info;
+	const int size = 256 << 10; /* enough for 8 classes of 256 engines */
+	unsigned int max = 0, count = 0;
+
+	info = calloc(1, size);
+	if (!__gem_query_engines(i915, info, size))
+		max = info->num_engines;
+
+	engines = (struct i915_engine_class_instance *)info;
+	for (unsigned int i = 0; i < max; i++) {
+		const struct i915_engine_class_instance *e =
+			&info->engines[i].engine;
+
+		if (!((class_mask >> e->engine_class) & 1))
+			continue;
+		if (!((gt_mask >> has_region(i915, e, 0)) & 1))
+			continue;
+
+		engines[count++] = *e;
+	}
+
+	if (!count) {
+		free(engines);
+		engines = NULL;
+	}
+
+	*out = count;
+	return engines;
+}
+
 bool gem_engine_is_equal(const struct intel_execution_engine2 *e1,
 			 const struct intel_execution_engine2 *e2)
 {
diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
index 987f2bf9..760b6ab3 100644
--- a/lib/i915/gem_engine_topology.h
+++ b/lib/i915/gem_engine_topology.h
@@ -61,6 +61,14 @@ intel_get_current_physical_engine(struct intel_engine_data *ed);
 
 void intel_next_engine(struct intel_engine_data *ed);
 
+const char *gem_engine_class_to_str(int engine_class);
+
+struct i915_engine_class_instance *
+gem_list_engines(int i915,
+		 uint32_t gt_mask,
+		 uint32_t class_mask,
+		 unsigned int *count);
+
 bool gem_engine_is_equal(const struct intel_execution_engine2 *e1,
 			 const struct intel_execution_engine2 *e2);
 
-- 
2.25.1
