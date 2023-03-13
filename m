Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431CE10E5F9
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Mar 2023 18:02:26 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 13 Mar 2023 23:29:27 +0530
Message-Id: <20230313175928.1159426-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/i915/gem_engine_topology: list
 engines specific to gt
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

From: Riana Tauro <riana.tauro@intel.com>

Add a function that returns all engines belonging to a gt
Currently the function is specific to MTL and returns gt id
based on engine

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
---
 lib/i915/gem_engine_topology.c | 73 ++++++++++++++++++++++++++++++++++
 lib/i915/gem_engine_topology.h |  6 +++
 2 files changed, 79 insertions(+)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index ca3333c252..6c8929ec59 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -350,6 +350,79 @@ struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags)
 	return e2__;
 }
 
+/*
+ * MTL has two GT's, one containing render/compute/copy and the other
+ * containing media engines. Return gt id based on engine.
+ */
+static int
+mtl_engine_to_gt_map(const struct i915_engine_class_instance *e)
+{
+	switch (e->engine_class) {
+	case I915_ENGINE_CLASS_RENDER:
+	case I915_ENGINE_CLASS_COMPUTE:
+	case I915_ENGINE_CLASS_COPY:
+		return 0;
+	case I915_ENGINE_CLASS_VIDEO:
+	case I915_ENGINE_CLASS_VIDEO_ENHANCE:
+		return 1;
+	default:
+		igt_assert_f(0, "Unsupported engine class %d\n", e->engine_class);
+	}
+}
+
+static int gem_engine_to_gt_map(int i915, const struct i915_engine_class_instance *engine)
+{
+	igt_require(IS_METEORLAKE(intel_get_drm_devid(i915)));
+	return mtl_engine_to_gt_map(engine);
+}
+
+/**
+ * gem_list_engines:
+ * @i915: i915 drm file descriptor
+ * @gt_mask: gt mask
+ * @class_mask: engine class mask
+ * @out: returned engine count
+ *
+ * Returns: the list of all physical engines belonging to the gt.
+ * Caller must free memory after use
+ */
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
+	igt_assert(!__gem_query_engines(i915, info, size));
+
+	max = info->num_engines;
+	engines = (struct i915_engine_class_instance *)info;
+	for (unsigned int i = 0; i < max; i++) {
+		const struct i915_engine_class_instance *e =
+			&info->engines[i].engine;
+
+		if (!((class_mask >> e->engine_class) & 1))
+			continue;
+		if (!((gt_mask >> gem_engine_to_gt_map(i915, e)) & 1))
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
index 987f2bf944..89642c3172 100644
--- a/lib/i915/gem_engine_topology.h
+++ b/lib/i915/gem_engine_topology.h
@@ -61,6 +61,12 @@ intel_get_current_physical_engine(struct intel_engine_data *ed);
 
 void intel_next_engine(struct intel_engine_data *ed);
 
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
