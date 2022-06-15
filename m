Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82A410E8B2
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jun 2022 05:52:01 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: matthew.auld@intel.com, priyanka.dandamudi@intel.com,
 igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 11:11:46 +0530
Message-Id: <20220615054146.1175662-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/i915/i915_module_load: Test resizable bar
 support
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

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/i915_module_load.c | 64 +++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
index f5f98acc2..b334ef612 100644
--- a/tests/i915/i915_module_load.c
+++ b/tests/i915/i915_module_load.c
@@ -37,6 +37,9 @@
 #include "igt_sysfs.h"
 #include "igt_core.h"
 
+#define BAR_SIZE_SHIFT 20
+#define BYTE 1024
+
 IGT_TEST_DESCRIPTION("Tests the i915 module loading.");
 
 static void store_all(int i915)
@@ -236,6 +239,28 @@ hda_dynamic_debug(bool enable)
 	fclose(fp);
 }
 
+static int driver_load_unload(struct drm_i915_query_memory_regions **regions, uint32_t lmem_bar_size)
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
+	igt_require(gem_has_lmem(i915));
+	*regions = gem_get_query_memory_regions(i915);
+	igt_require(*regions);
+
+	return i915;
+}
+
 igt_main
 {
 	igt_describe("Verify the basic functionality of i915 driver after it's reloaded.");
@@ -286,5 +311,44 @@ igt_main
 		/* inject_fault() leaves the module unloaded */
 	}
 
+	igt_subtest("resize-bar") {
+		struct drm_i915_query_memory_regions *regions;
+		struct drm_i915_memory_region_info *region;
+		uint32_t lmem_bar_size;
+		uint32_t small_bar;
+		bool bar_check = false;
+		int i915 = -1;
+
+		i915 = driver_load_unload(&regions, 0);
+
+		for (unsigned int i = 0; i < (regions)->num_regions; i++)
+			for_each_if(((region) = &(regions)->regions[i])->region.memory_class == I915_MEMORY_CLASS_DEVICE) {
+				lmem_bar_size = ceil((float)(region->probed_size >> BAR_SIZE_SHIFT)/BYTE)*BYTE;
+				small_bar = (region->rsvd1[0] >> BAR_SIZE_SHIFT);
+				if (small_bar < lmem_bar_size)
+					bar_check = true;
+			}
+		while (lmem_bar_size >= 256) {
+
+			close(i915);
+
+			i915 = driver_load_unload(&regions, lmem_bar_size);
+
+			for (unsigned int i = 0; i < (regions)->num_regions; i++)
+				for_each_if(((region) = &(regions)->regions[i])->region.memory_class == I915_MEMORY_CLASS_DEVICE) {
+					igt_assert_f(((region->probed_size >> BAR_SIZE_SHIFT) == lmem_bar_size),
+							 "Failed to set bar size");
+					if (bar_check)
+						igt_assert_f((small_bar == (region->rsvd1[0] >> BAR_SIZE_SHIFT)),
+								 "Small bar is not set properly");
+					else
+						igt_assert_f(region->probed_size == region->rsvd1[0], "Small bar and"
+								" lmem bar values need to be same");
+			}
+		lmem_bar_size = lmem_bar_size >> 1;
+		}
+		igt_i915_driver_unload();
+	}
+
 	/* Subtests should unload the module themselves if they use modparams */
 }
-- 
2.27.0
