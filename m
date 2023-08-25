Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5843310E625
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 07:38:59 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 13:00:47 +0530
Message-Id: <20230825073059.856371-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20230825073059.856371-1-bhanuprakash.modem@intel.com>
References: <20230825073059.856371-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 04/16] tests/kms_addfb_basic: Add tiling
 support for XE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Remove the tiling restrictions in Xe specific tests

V2: - Update Xe fast-feedback testlist & blocklist
V3: - New patch for blocklist & BAT testlist changes
V4: - Fix testplan documentation

Fixes: 8c3b02be3 (tests/kms_addfb_basic: Add XE support)
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_addfb_basic.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index f415300b6..e9a116c3b 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -420,7 +420,7 @@ static void pitch_tests(int fd)
  *
  * SUBTEST: tile-pitch-mismatch
  * Description: Test that addfb2 call fails correctly for pitches mismatch
- * Driver requirement: i915
+ * Driver requirement: i915, xe
  * Test category: functionality test
  * Run type: FULL
  * Functionality: kms_gem_interop, tiling
@@ -444,7 +444,7 @@ static void tiling_tests(int fd)
 
 	igt_subtest_group {
 		igt_fixture {
-			igt_require_i915(fd);
+			igt_require_intel(fd);
 			tiled_x_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
 				DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED,
 				1024*4, NULL, NULL, NULL);
@@ -463,7 +463,8 @@ static void tiling_tests(int fd)
 		f.pitches[0] = 1024*4;
 		igt_describe("Check if addfb2 and rmfb call works for basic x-tiling test");
 		igt_subtest("basic-x-tiled-legacy") {
-			igt_require(gem_available_fences(fd) > 0);
+			if (is_i915_device(fd))
+				igt_require(gem_available_fences(fd) > 0);
 			f.handles[0] = tiled_x_bo;
 
 			do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
@@ -473,6 +474,7 @@ static void tiling_tests(int fd)
 
 		igt_describe("Check if addfb2 call works for x and y tiling");
 		igt_subtest("framebuffer-vs-set-tiling") {
+			igt_require_i915(fd);
 			igt_require(gem_available_fences(fd) > 0);
 			f.handles[0] = gem_bo;
 
@@ -487,17 +489,22 @@ static void tiling_tests(int fd)
 		igt_describe("Test that addfb2 call fails correctly for pitches mismatch");
 			f.pitches[0] = 512*4;
 		igt_subtest("tile-pitch-mismatch") {
-			igt_require(gem_available_fences(fd) > 0);
-			f.handles[0] = tiled_x_bo;
+			if (is_i915_device(fd))
+				igt_require(gem_available_fences(fd) > 0);
 
+			f.handles[0] = tiled_x_bo;
 			do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
 		}
 
 		igt_describe("Test that addfb2 call fails correctly for basic y-tiling test");
 		f.pitches[0] = 1024*4;
 		igt_subtest("basic-y-tiled-legacy") {
-			igt_require(!gem_has_lmem(fd));
-			igt_require(gem_available_fences(fd) > 0);
+			if (is_i915_device(fd)) {
+				igt_require(!gem_has_lmem(fd));
+				igt_require(gem_available_fences(fd) > 0);
+			} else {
+				igt_require(!xe_has_vram(fd));
+			}
 			f.handles[0] = tiled_y_bo;
 
 			do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
@@ -554,7 +561,7 @@ static void tiling_tests(int fd)
  * SUBTEST: bo-too-small-due-to-tiling
  * Description: Test that addfb2 call fails correctly with small buffer object
  *              after changing tile
- * Driver requirement: i915, xe
+ * Driver requirement: i915
  * Test category: functionality test
  * Run type: FULL
  * Functionality: kms_gem_interop, tiling
@@ -710,7 +717,7 @@ static void size_tests(int fd)
  *
  * SUBTEST: addfb25-framebuffer-vs-set-tiling
  * Description: Check if addfb2 call works for relevant combination of tiling and fbs
- * Driver requirement: i915, xe
+ * Driver requirement: i915
  * Test category: functionality test
  * Run type: FULL
  * Functionality: kms_gem_interop, tiling
@@ -757,9 +764,11 @@ static void addfb25_tests(int fd)
 
 	igt_subtest_group {
 		igt_fixture {
-			igt_require_i915(fd);
-			igt_require(gem_available_fences(fd) > 0);
-			gem_set_tiling(fd, gem_bo, I915_TILING_X, 1024*4);
+			igt_require_intel(fd);
+			if (is_i915_device(fd)) {
+				igt_require(gem_available_fences(fd) > 0);
+				gem_set_tiling(fd, gem_bo, I915_TILING_X, 1024*4);
+			}
 			igt_require_fb_modifiers(fd);
 		}
 
@@ -779,6 +788,7 @@ static void addfb25_tests(int fd)
 
 		igt_describe("Check if addfb2 call works for relevant combination of tiling and fbs");
 		igt_subtest("addfb25-framebuffer-vs-set-tiling") {
+			igt_require_i915(fd);
 			f.modifier[0] = I915_FORMAT_MOD_X_TILED;
 			do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
 			igt_assert_eq(__gem_set_tiling(fd, gem_bo, I915_TILING_X, 512*4), -EBUSY);
@@ -1118,7 +1128,7 @@ igt_main
 		size_tests(fd);
 
 		igt_fixture
-			igt_require_i915(fd);
+			igt_require_intel(fd);
 
 		addfb25_ytile(fd);
 
-- 
2.40.0
