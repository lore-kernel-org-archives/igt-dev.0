Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2CF2010E631
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Nov 2023 13:36:30 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 22 Nov 2023 15:36:12 +0200
Message-Id: <20231122133612.973677-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] kms_addfb_basic: Skip not relevant test for
 Xe
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

Skip following tests for Xe:

tile-pitch-mismatch
addfb25-x-tiled-mismatch-legacy

They are not relevant for Xe as tiling information is not encoded into
backing object.

Skip following test for Xe

basic-y-tiled-legacy

As Xe supports y-tiled format on legacy addfb.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/kms_addfb_basic.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index fc16b8814..426277422 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -396,7 +396,7 @@ static void pitch_tests(int fd)
 /**
  * SUBTEST: basic-%s-tiled-legacy
  * Description: Check if addfb2 and rmfb call works for basic %arg[1] test
- * Driver requirement: i915, xe
+ * Driver requirement: i915
  * Test category: functionality test
  * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
@@ -410,7 +410,7 @@ static void pitch_tests(int fd)
  *
  * SUBTEST: tile-pitch-mismatch
  * Description: Test that addfb2 call fails correctly for pitches mismatch
- * Driver requirement: i915, xe
+ * Driver requirement: i915
  * Test category: functionality test
  * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
@@ -478,8 +478,8 @@ static void tiling_tests(int fd)
 		igt_describe("Test that addfb2 call fails correctly for pitches mismatch");
 			f.pitches[0] = 512*4;
 		igt_subtest("tile-pitch-mismatch") {
-			if (is_i915_device(fd))
-				igt_require(gem_available_fences(fd) > 0);
+			igt_require_i915(fd);
+			igt_require(gem_available_fences(fd) > 0);
 
 			f.handles[0] = tiled_x_bo;
 			do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
@@ -488,12 +488,10 @@ static void tiling_tests(int fd)
 		igt_describe("Test that addfb2 call fails correctly for basic y-tiling test");
 		f.pitches[0] = 1024*4;
 		igt_subtest("basic-y-tiled-legacy") {
-			if (is_i915_device(fd)) {
-				igt_require(!gem_has_lmem(fd));
-				igt_require(gem_available_fences(fd) > 0);
-			} else {
-				igt_require(!xe_has_vram(fd));
-			}
+			igt_require_i915(fd);
+			igt_require(!gem_has_lmem(fd));
+			igt_require(gem_available_fences(fd) > 0);
+
 			f.handles[0] = tiled_y_bo;
 
 			do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
@@ -682,7 +680,7 @@ static void size_tests(int fd)
  *
  * SUBTEST: addfb25-x-tiled-mismatch-legacy
  * Description: Test that addfb2 call fails correctly for irrelevant x-tiling
- * Driver requirement: i915, xe
+ * Driver requirement: i915
  * Test category: functionality test
  * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
@@ -752,6 +750,7 @@ static void addfb25_tests(int fd)
 
 		igt_describe("Test that addfb2 call fails correctly for irrelevant x-tiling");
 		igt_subtest("addfb25-x-tiled-mismatch-legacy") {
+			igt_require_i915(fd);
 			f.modifier[0] = DRM_FORMAT_MOD_LINEAR;
 			do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
 		}
-- 
2.34.1
