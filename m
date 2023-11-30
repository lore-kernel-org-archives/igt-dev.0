Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC78310E025
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 16:13:40 +0000 (UTC)
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Nov 2023 08:02:53 -0800
Message-Id: <20231130160253.3787505-3-jonathan.cavitt@intel.com>
In-Reply-To: <20231130160253.3787505-1-jonathan.cavitt@intel.com>
References: <20231130160253.3787505-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 2/2] tests/i915_query: Add
 query-l3-bank-count subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Add a subtest to query L3 Bank count for each engine.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/i915_query.c | 140 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
index e9cc495973..5d61e15041 100644
--- a/tests/intel/i915_query.c
+++ b/tests/intel/i915_query.c
@@ -25,6 +25,7 @@
 #include "intel_hwconfig_types.h"
 #include "i915/gem.h"
 #include "i915/gem_create.h"
+#include "igt_sysfs.h"
 
 #include <limits.h>
 /**
@@ -121,6 +122,18 @@
  * SUBTEST: test-query-geometry-subslices
  * Description: Test DRM_I915_QUERY_GEOMETRY_SUBSLICES query
  * Feature: gem_core
+ *
+ * SUBTEST: query-l3-bank-count
+ * Description: Test DRM_I915_QUERY_L3BANK_COUNT query
+ * Feature: gem_core
+ *
+ * SUBTEST: query-l3-bank-count-invalid
+ * Description: Test DRM_I915_QUERY_L3BANK_COUNT query fails when an invalid engine is passed
+ * Feature: gem_core
+ *
+ * SUBTEST: query-l3-bank-count-support
+ * Description: Test DRM_I915_QUERY_L3BANK_COUNT query fails when it is not supported
+ * Feature: gem_core
  */
 
 IGT_TEST_DESCRIPTION("Testing the i915 query uAPI.");
@@ -1473,6 +1486,111 @@ static void query_parse_and_validate_hwconfig_table(int i915)
 	free(data);
 }
 
+static int __get_l3_count(int i915, const struct i915_engine_class_instance engine, uint64_t *out)
+{
+	struct drm_i915_query_item item;
+
+	memset(&item, 0, sizeof(item));
+	item.query_id = DRM_I915_QUERY_L3BANK_COUNT;
+	item.flags = ((engine.engine_instance << 8) | engine.engine_class);
+	item.data_ptr = to_user_pointer(out);
+
+	i915_query_items(i915, &item, 1);
+
+	return item.length < 0 ? item.length : 0;
+}
+
+static bool query_l3_count_supported(int i915)
+{
+	struct i915_engine_class_instance *engines;
+	unsigned int engines_count;
+	uint32_t class;
+	uint64_t val;
+	int ret;
+
+	class = 0xFF;
+	engines = gem_list_engines(i915, 1u << 0, class, &engines_count);
+	if (!engines) {
+		igt_warn("Failed to get the engines list per tile\n");
+		return false;
+	}
+
+	ret = __get_l3_count(i915, engines[0], &val);
+	free(engines);
+
+	return ret == 0;
+}
+
+static void test_l3_count_support(int i915)
+{
+	int devid = intel_get_drm_devid(i915);
+	bool supported = intel_graphics_ver(devid) >= IP_VER(12, 0);
+
+	igt_assert(supported == query_l3_count_supported(i915));
+}
+
+static void test_l3_count_invalid(int i915)
+{
+	struct i915_engine_class_instance engine = {
+		.engine_class = 0xDEAD,
+		.engine_instance = 0xBEEF
+	};
+	uint64_t val;
+
+	igt_assert_eq(__get_l3_count(i915, engine, &val), -EINVAL);
+}
+
+static void test_l3_count(int i915)
+{
+	struct i915_engine_class_instance *engines;
+	uint32_t class;
+	unsigned int engines_count;
+	uint64_t expected_bank_count;
+	int num_gts;
+	bool unchecked = false;
+
+	class = 0xFF; // checking for all 8 classes
+	expected_bank_count = 0;
+
+	num_gts = igt_sysfs_get_num_gt(i915);
+
+	for (int gt = 0; gt < num_gts; gt++) {
+		engines = gem_list_engines(i915, 1u << gt, class, &engines_count);
+
+		igt_fail_on_f(!engines, "Failed to get the engines list per tile");
+
+		for (int i = 0 ; i < engines_count ; i++) {
+			uint64_t l3_count;
+
+			igt_assert_eq(__get_l3_count(i915, engines[i], &l3_count), 0);
+			igt_debug("class=%u instance=%u l3 bank count=%lu\n",
+					engines[i].engine_class,
+					engines[i].engine_instance,
+					l3_count);
+
+			if (IS_METEORLAKE(i915)) // ARROWLAKE (ARL) to be added
+				igt_assert((l3_count%2) == 0);
+			else if (IS_PONTEVECCHIO(i915))
+				igt_assert((l3_count%4) == 0);
+			else if (IS_DG2(i915))
+				igt_assert((l3_count%8) == 0);
+			else
+				unchecked = true;
+
+			if (i == 0) {
+				expected_bank_count = l3_count;
+				continue;
+			}
+
+			igt_assert_eq(l3_count, expected_bank_count);
+
+		}
+
+		free(engines);
+	}
+	igt_warn_on(unchecked);
+}
+
 igt_main
 {
 	int fd = -1;
@@ -1570,6 +1688,28 @@ igt_main
 	igt_subtest("hwconfig_table")
 		query_parse_and_validate_hwconfig_table(fd);
 
+	igt_describe("Test to check DRM_I915_QUERY_L3BANK_COUNT support.");
+	igt_subtest("query-l3-bank-count-support") {
+		/*
+		 * This test can be run on all platforms as this test
+		 * simply verifies query_l3_count_supported reports
+		 * correctly on all platforms.
+		 */
+		test_l3_count_support(fd);
+	}
+
+	igt_describe("Basic test to query l3 bank count");
+	igt_subtest("query-l3-bank-count") {
+		igt_require(query_l3_count_supported(fd));
+		test_l3_count(fd);
+	}
+
+	igt_describe("Negative test for DRM_I915_QUERY_L3BANK_COUNT");
+	igt_subtest("query-l3-bank-count-invalid") {
+		igt_require(query_l3_count_supported(fd));
+		test_l3_count_invalid(fd);
+	}
+
 	igt_fixture {
 		drm_close_driver(fd);
 	}
-- 
2.25.1
