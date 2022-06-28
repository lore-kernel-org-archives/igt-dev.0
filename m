Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF25F10E062
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 13:14:54 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: matthew.auld@intel.com, priyanka.dandamudi@intel.com,
 igt-dev@lists.freedesktop.org
Date: Tue, 28 Jun 2022 18:34:12 +0530
Message-Id: <20220628130412.1723424-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,
 v3] tests/i915/i915_module_load: Test resizable bar support
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

New test named resize bar has been added which tests whether
bar gets resized with different supported sizes.

v2: Added code to check for bad bar sizes.
Modified code to check for support of lmem_bar_size modparam.(Petri)

v3: Added test description.(Kamil)
Updated driver_load_unload() name to driver_load_with_lmem_bar_size().
Used for_each_memory_region() to check for lmem instance and some minor
code modifications.(Matt)

Note:Test gets executed when
1. modparam lmem_bar_size gets added.
2. small bar bits gets enabled.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/i915_module_load.c | 87 +++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
index 4705f3d6..cd036b95 100644
--- a/tests/i915/i915_module_load.c
+++ b/tests/i915/i915_module_load.c
@@ -38,6 +38,9 @@
 #include "igt_sysfs.h"
 #include "igt_core.h"
 
+#define BAR_SIZE_SHIFT 20
+#define MIN_BAR_SIZE 256
+
 IGT_TEST_DESCRIPTION("Tests the i915 module loading.");
 
 static void store_all(int i915)
@@ -260,6 +263,45 @@ static void load_and_check_i915(void)
 	gem_sanitycheck();
 }
 
+static uint32_t  driver_load_with_lmem_bar_size(uint32_t lmem_bar_size, bool check_support)
+{
+	int i915 = -1;
+	char lmem_bar[64];
+
+	igt_i915_driver_unload();
+	if (lmem_bar_size == 0)
+		igt_assert_eq(igt_i915_driver_load(NULL), 0);
+	else {
+		sprintf(lmem_bar, "lmem_bar_size=%u", lmem_bar_size);
+		igt_assert_eq(igt_i915_driver_load(lmem_bar), 0);
+	}
+
+	i915 = __drm_open_driver(DRIVER_INTEL);
+	igt_require_fd(i915);
+	igt_require_gem(i915);
+	igt_require(gem_has_lmem(i915));
+
+	if (check_support) {
+		char *tmp;
+
+		tmp = __igt_params_get(i915, "lmem_bar_size");
+		if (!tmp)
+			igt_skip("lmem_bar_size modparam not supported on this kernel. Skipping the test.\n");
+		free(tmp);
+	}
+
+	for_each_memory_region(r, i915)
+		if (r->ci.memory_class == I915_MEMORY_CLASS_DEVICE) {
+			lmem_bar_size = (r->cpu_size >> BAR_SIZE_SHIFT);
+
+			igt_skip_on_f(lmem_bar_size == 0, "CPU visible size should be greater than zero. Skipping for older kernel.\n");
+		}
+
+	close(i915);
+
+	return lmem_bar_size;
+}
+
 igt_main
 {
 	igt_describe("Check if i915 and friends are not yet loaded, then load them.");
@@ -320,5 +362,50 @@ igt_main
 		/* inject_fault() leaves the module unloaded */
 	}
 
+	igt_describe("Check whether lmem bar size can be resized to only supported sizes.");
+	igt_subtest("resize-bar") {
+		uint32_t result_bar_size;
+		uint32_t lmem_bar_size;
+		int i915 = -1;
+
+		if (igt_kmod_is_loaded("i915")) {
+			i915 = __drm_open_driver(DRIVER_INTEL);
+			igt_require_fd(i915);
+			igt_require_gem(i915);
+			igt_require(gem_has_lmem(i915));
+			igt_skip_on_f(igt_sysfs_get_num_gt(i915) > 1, "Skips for more than one lmem instance.\n");
+			close(i915);
+		}
+
+		/* Test for lmem_bar_size modparam support */
+		lmem_bar_size = driver_load_with_lmem_bar_size(MIN_BAR_SIZE, true);
+		igt_assert_eq(lmem_bar_size, MIN_BAR_SIZE);
+
+		lmem_bar_size = driver_load_with_lmem_bar_size(0, false);
+
+		lmem_bar_size = roundup_power_of_two(lmem_bar_size);
+
+		igt_skip_on_f(lmem_bar_size == MIN_BAR_SIZE, "Bar is already set to minimum size.\n");
+
+		while (lmem_bar_size > MIN_BAR_SIZE) {
+			lmem_bar_size = lmem_bar_size >> 1;
+
+			result_bar_size = driver_load_with_lmem_bar_size(lmem_bar_size, false);
+
+			igt_assert_f(lmem_bar_size == result_bar_size, "Bar couldn't be resized.\n");
+		}
+
+		/* Test with unsupported sizes */
+		lmem_bar_size = 80;
+		result_bar_size = driver_load_with_lmem_bar_size(lmem_bar_size, false);
+		igt_assert_f(lmem_bar_size != result_bar_size, "Bar resized to unsupported size.\n");
+
+		lmem_bar_size = 16400;
+		result_bar_size = driver_load_with_lmem_bar_size(lmem_bar_size, false);
+		igt_assert_f(lmem_bar_size != result_bar_size, "Bar resized to unsupported size.\n");
+
+		igt_i915_driver_unload();
+	}
+
 	/* Subtests should unload the module themselves if they use modparams */
 }
-- 
2.27.0
