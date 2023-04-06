Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE5F10EB02
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Apr 2023 07:52:42 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	karthik.b.s@intel.com
Date: Thu,  6 Apr 2023 13:18:13 +0530
Message-Id: <20230406074815.463965-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20230406074815.463965-1-bhanuprakash.modem@intel.com>
References: <20230406074815.463965-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 4/6] tests/kms_addfb_basic: Add XE support
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

Update/fix necessary subtests for XE driver compatibility.

V2: - Fix invalid-smem-bo-on-discrete subtest (Zbigniew)
V3: - New patch to re-group the subtests (Karthik)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_addfb_basic.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 4c498a40937..a66ccfa6bff 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -41,6 +41,8 @@
 #include "igt_rand.h"
 #include "igt_device.h"
 #include "i915/intel_memory_region.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
 
 static uint32_t gem_bo;
 static uint32_t gem_bo_small;
@@ -122,7 +124,7 @@ static void invalid_tests(int fd)
 
 	igt_describe("Check if addfb2 call works for clobbered modifier");
 	igt_subtest("clobberred-modifier") {
-		igt_require_intel(fd);
+		igt_require_i915(fd);
 		igt_require(gem_available_fences(fd) > 0);
 		f.flags = 0;
 		f.modifier[0] = 0;
@@ -140,10 +142,17 @@ static void invalid_tests(int fd)
 		uint64_t size;
 
 		igt_require_intel(fd);
-		igt_require(gem_has_lmem(fd));
 		igt_calc_fb_size(fd, f.width, f.height,
 				DRM_FORMAT_XRGB8888, 0, &size, &stride);
-		handle = gem_create_in_memory_regions(fd, size, REGION_SMEM);
+
+		if (is_i915_device(fd)) {
+			igt_require(gem_has_lmem(fd));
+			handle = gem_create_in_memory_regions(fd, size, REGION_SMEM);
+		} else {
+			igt_require(xe_has_vram(fd));
+			handle = xe_bo_create_flags(fd, 0, size, system_memory(fd));
+		}
+
 		f.handles[0] = handle;
 		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EREMOTE);
 	}
@@ -324,7 +333,7 @@ static void tiling_tests(int fd)
 
 	igt_subtest_group {
 		igt_fixture {
-			igt_require_intel(fd);
+			igt_require_i915(fd);
 			tiled_x_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
 				DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED,
 				1024*4, NULL, NULL, NULL);
@@ -492,7 +501,7 @@ static void size_tests(int fd)
 
 	igt_describe("Test that addfb2 call fails correctly with small buffer object after changing tile");
 	igt_subtest("bo-too-small-due-to-tiling") {
-		igt_require_intel(fd);
+		igt_require_i915(fd);
 		igt_require(gem_available_fences(fd) > 0);
 		gem_set_tiling(fd, gem_bo_small, I915_TILING_X, 1024*4);
 		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
@@ -546,7 +555,7 @@ static void addfb25_tests(int fd)
 
 	igt_subtest_group {
 		igt_fixture {
-			igt_require_intel(fd);
+			igt_require_i915(fd);
 			igt_require(gem_available_fences(fd) > 0);
 			gem_set_tiling(fd, gem_bo, I915_TILING_X, 1024*4);
 			igt_require_fb_modifiers(fd);
@@ -827,6 +836,9 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_ANY);
 		igt_require(has_addfb2_iface(fd));
+
+		if (is_xe_device(fd))
+			xe_device_get(fd);
 	}
 
 	invalid_tests(fd);
@@ -848,7 +860,7 @@ igt_main
 		size_tests(fd);
 
 		igt_fixture
-			igt_require_intel(fd);
+			igt_require_i915(fd);
 
 		addfb25_ytile(fd);
 
@@ -858,6 +870,10 @@ igt_main
 			igt_display_fini(&display);
 	}
 
-	igt_fixture
+	igt_fixture {
+		if (is_xe_device(fd))
+			xe_device_put(fd);
+
 		close(fd);
+	}
 }
-- 
2.40.0
