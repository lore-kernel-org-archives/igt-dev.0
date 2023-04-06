Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909CE10EB01
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Apr 2023 07:52:40 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	karthik.b.s@intel.com
Date: Thu,  6 Apr 2023 13:18:12 +0530
Message-Id: <20230406074815.463965-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20230406074815.463965-1-bhanuprakash.modem@intel.com>
References: <20230406074815.463965-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 3/6] tests/kms_addfb_basic: Code cleanup
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

Cleanup to re-group the subtests to avoid redundant checks.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_addfb_basic.c | 61 ++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 31 deletions(-)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index b4526eee6d6..4c498a40937 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -42,8 +42,9 @@
 #include "igt_device.h"
 #include "i915/intel_memory_region.h"
 
-uint32_t gem_bo;
-uint32_t gem_bo_small;
+static uint32_t gem_bo;
+static uint32_t gem_bo_small;
+static igt_display_t display;
 
 static int legacy_addfb(int fd, struct drm_mode_fb_cmd *arg)
 {
@@ -395,7 +396,6 @@ static void size_tests(int fd)
 	struct drm_mode_fb_cmd2 f_16 = {};
 	struct drm_mode_fb_cmd2 f_8 = {};
 	struct drm_mode_fb_cmd2 *framebuffers[] = {&f, &f_16, &f_8};
-	igt_display_t display;
 	int i;
 
 	f.width = 1024;
@@ -414,8 +414,6 @@ static void size_tests(int fd)
 	f_8.pitches[0] = 1024*2;
 
 	igt_fixture {
-		igt_display_require(&display, fd);
-
 		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
 			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
 		igt_assert(gem_bo);
@@ -578,24 +576,22 @@ static void addfb25_tests(int fd)
 			f.fb_id = 0;
 		}
 	}
+
 	igt_fixture
 		gem_close(fd, gem_bo);
 }
 
-static int addfb_expected_ret(igt_display_t *display, struct drm_mode_fb_cmd2 *f)
+static int addfb_expected_ret(igt_display_t *disp, struct drm_mode_fb_cmd2 *f)
 {
-	return igt_display_has_format_mod(display, f->pixel_format,
+	return igt_display_has_format_mod(disp, f->pixel_format,
 					  f->modifier[0]) ? 0 : -1;
 }
 
 static void addfb25_ytile(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
-	igt_display_t display;
 
 	igt_fixture {
-		igt_display_require(&display, fd);
-
 		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
 			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
 		igt_assert(gem_bo);
@@ -618,7 +614,6 @@ static void addfb25_ytile(int fd)
 	igt_describe("Check if addfb2 call works for y-tiling");
 	igt_subtest("addfb25-y-tiled-legacy") {
 		igt_require_fb_modifiers(fd);
-		igt_require_intel(fd);
 
 		f.modifier[0] = I915_FORMAT_MOD_Y_TILED;
 		igt_assert_eq(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f),
@@ -631,7 +626,6 @@ static void addfb25_ytile(int fd)
 	igt_describe("Check if addfb2 call works for yf-tiling");
 	igt_subtest("addfb25-yf-tiled-legacy") {
 		igt_require_fb_modifiers(fd);
-		igt_require_intel(fd);
 
 		f.modifier[0] = I915_FORMAT_MOD_Yf_TILED;
 		igt_assert_eq(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f),
@@ -644,7 +638,6 @@ static void addfb25_ytile(int fd)
 	igt_describe("Test that addfb2 call fails correctly for y-tiling with given height and modifier");
 	igt_subtest("addfb25-y-tiled-small-legacy") {
 		igt_require_fb_modifiers(fd);
-		igt_require_intel(fd);
 
 		f.modifier[0] = I915_FORMAT_MOD_Y_TILED;
 		f.height = 1023;
@@ -657,18 +650,14 @@ static void addfb25_ytile(int fd)
 	igt_fixture {
 		gem_close(fd, gem_bo);
 		gem_close(fd, gem_bo_small);
-		igt_display_fini(&display);
 	}
 }
 
 static void addfb25_4tile(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
-	igt_display_t display;
 
 	igt_fixture {
-		igt_display_require(&display, fd);
-
 		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
 				DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
 		igt_assert(gem_bo);
@@ -689,7 +678,6 @@ static void addfb25_4tile(int fd)
 	igt_describe("Check if addfb2 call works for tiling-4");
 	igt_subtest("addfb25-4-tiled") {
 		igt_require_fb_modifiers(fd);
-		igt_require_intel(fd);
 
 		f.modifier[0] = I915_FORMAT_MOD_4_TILED;
 		igt_assert_eq(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f),
@@ -699,10 +687,8 @@ static void addfb25_4tile(int fd)
 		f.fb_id = 0;
 	}
 
-	igt_fixture {
+	igt_fixture
 		gem_close(fd, gem_bo);
-		igt_display_fini(&display);
-	}
 }
 
 static void prop_tests(int fd)
@@ -764,9 +750,10 @@ static void prop_tests(int fd)
 		do_ioctl_err(fd, DRM_IOCTL_MODE_OBJ_SETPROPERTY, &set_prop, EINVAL);
 	}
 
-	igt_fixture
+	igt_fixture {
 		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
-
+		gem_close(fd, gem_bo);
+	}
 }
 
 static void master_tests(int fd)
@@ -804,9 +791,10 @@ static void master_tests(int fd)
 		igt_device_set_master(fd);
 	}
 
-	igt_fixture
+	igt_fixture {
 		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
-
+		gem_close(fd, gem_bo);
+	}
 }
 
 static bool has_addfb2_iface(int fd)
@@ -845,19 +833,30 @@ igt_main
 
 	pitch_tests(fd);
 
-	size_tests(fd);
+	prop_tests(fd);
+
+	master_tests(fd);
 
 	addfb25_tests(fd);
 
-	addfb25_ytile(fd);
+	tiling_tests(fd);
+
+	igt_subtest_group {
+		igt_fixture
+			igt_display_require(&display, fd);
 
-	addfb25_4tile(fd);
+		size_tests(fd);
 
-	tiling_tests(fd);
+		igt_fixture
+			igt_require_intel(fd);
 
-	prop_tests(fd);
+		addfb25_ytile(fd);
 
-	master_tests(fd);
+		addfb25_4tile(fd);
+
+		igt_fixture
+			igt_display_fini(&display);
+	}
 
 	igt_fixture
 		close(fd);
-- 
2.40.0
