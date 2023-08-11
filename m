Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD4110E704
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:55:26 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:16:06 +0530
Message-Id: <20230811184655.157060-33-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 32/81] tests/kms_addfb_basic: Document each
 subtest for testplan
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

Add documentation for all kms tests which is used by IGT testplan
documentation.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_addfb_basic.c | 193 ++++++++++++++++++++++++++++++++--------
 1 file changed, 158 insertions(+), 35 deletions(-)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 065f21975..68e4ed3fc 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -26,8 +26,9 @@
  */
 
 /**
- * TEST: Sanity test for ioctls DRM_IOCTL_MODE_ADDFB2 & DRM_IOCTL_MODE_RMFB.
+ * TEST: kms addfb basic
  * Category: Display
+ * Description: Sanity test for ioctls DRM_IOCTL_MODE_ADDFB2 & DRM_IOCTL_MODE_RMFB.
  */
 
 #include "igt.h"
@@ -66,33 +67,52 @@ static int legacy_addfb(int fd, struct drm_mode_fb_cmd *arg)
 }
 
 /**
- * SUBTEST: unused-handle
- * Description: Test that addfb2 call fails correctly for unused handle
+ * SUBTEST: unused-%s
+ * Description: Test that addfb2 call fails correctly for unused %arg[1]
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
  *
- * SUBTEST: unused-pitches
- * Description: Test that addfb2 call fails correctly for unused pitches
+ * SUBTEST: unused-modifier
+ * Description: Test that addfb2 call fails correctly for unused modifier
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
- * Functionality: kms_gem_interop
+ * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
  *
- * SUBTEST: unused-offsets
- * Description: Test that addfb2 call fails correctly for unused offset
+ * SUBTEST: clobberred-modifier
+ * Description: Check if addfb2 call works for clobbered modifier
+ * Driver requirement: i915
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ * Run type: FULL
  * Test category: functionality test
- * Run type: BAT
+ *
+ * SUBTEST: invalid-smem-bo-on-discrete
+ * Description: Check if addfb2 with a system memory gem object fails correctly
+ *              if device requires local memory framebuffers
+ * Driver requirement: any
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
- *
- * SUBTEST: unused-modifier
- * Description: Test that addfb2 call fails correctly for unused modifier
+ * Run type: FULL
  * Test category: functionality test
- * Run type: BAT
+ *
+ * SUBTEST: legacy-format
+ * Description: Check if addfb2 call works for legacy formats
+ * Driver requirement: any
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @handle:       Handle
+ * @pitches:      Pitches
+ * @offsets:      Offsets
  */
 static void invalid_tests(int fd)
 {
@@ -310,6 +330,7 @@ static void invalid_tests(int fd)
 /**
  * SUBTEST: no-handle
  * Description: Test that addfb2 call fails correctly without handle
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: kms_gem_interop
@@ -317,6 +338,7 @@ static void invalid_tests(int fd)
  *
  * SUBTEST: basic
  * Description: Check if addfb2 call works with given handle
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: kms_gem_interop
@@ -324,6 +346,7 @@ static void invalid_tests(int fd)
  *
  * SUBTEST: bad-pitch-%i
  * Description: bad-pitch-%arg[1]: Test that addfb2 call fails correctly for bad-pitches
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: kms_gem_interop
@@ -378,6 +401,36 @@ static void pitch_tests(int fd)
 		gem_close(fd, gem_bo);
 }
 
+/**
+ * SUBTEST: basic-%s-tiled-legacy
+ * Description: Check if addfb2 and rmfb call works for basic %arg[1] test
+ * Driver requirement: any
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: framebuffer-vs-set-tiling
+ * Description: Check if addfb2 call works for x and y tiling
+ * Driver requirement: i915
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: tile-pitch-mismatch
+ * Description: Test that addfb2 call fails correctly for pitches mismatch
+ * Driver requirement: i915
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ *
+ * arg[1]:
+ *
+ * @x:        x-tiling
+ * @y:        y-tiling
+ */
 static void tiling_tests(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
@@ -460,6 +513,7 @@ static void tiling_tests(int fd)
 /**
  * SUBTEST: size-max
  * Description: Check if addfb2 call works with max size of buffer object
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: kms_gem_interop
@@ -467,6 +521,7 @@ static void tiling_tests(int fd)
  *
  * SUBTEST: too-wide
  * Description: Test that addfb2 call fails correctly with increased width of fb
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: kms_gem_interop
@@ -474,6 +529,7 @@ static void tiling_tests(int fd)
  *
  * SUBTEST: too-high
  * Description: Test that addfb2 call fails correctly with increased height of fb
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: kms_gem_interop
@@ -481,6 +537,7 @@ static void tiling_tests(int fd)
  *
  * SUBTEST: bo-too-small
  * Description: Test that addfb2 call fails correctly with small size of buffer object
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: kms_gem_interop
@@ -488,10 +545,20 @@ static void tiling_tests(int fd)
  *
  * SUBTEST: small-bo
  * Description: Check if addfb2 call works for given height
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
+ *
+ * SUBTEST: bo-too-small-due-to-tiling
+ * Description: Test that addfb2 call fails correctly with small buffer object
+ *              after changing tile
+ * Driver requirement: any
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
  */
 static void size_tests(int fd)
 {
@@ -611,16 +678,42 @@ static void size_tests(int fd)
 /**
  * SUBTEST: addfb25-modifier-no-flag
  * Description: Test that addfb2 call fails correctly for x-tiling with given modifier
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
- * Functionality: kms_gem_interop
+ * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
  *
  * SUBTEST: addfb25-bad-modifier
  * Description: Test that addfb2 call fails correctly for irrelevant modifier
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
- * Functionality: kms_gem_interop
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: addfb25-x-tiled-mismatch-legacy
+ * Description: Test that addfb2 call fails correctly for irrelevant x-tiling
+ * Driver requirement: any
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: addfb25-x-tiled-legacy
+ * Description: Check if addfb2 call works for x-tiling
+ * Driver requirement: any
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: addfb25-framebuffer-vs-set-tiling
+ * Description: Check if addfb2 call works for relevant combination of tiling and fbs
+ * Driver requirement: any
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
  */
 static void addfb25_tests(int fd)
@@ -705,6 +798,28 @@ static int addfb_expected_ret(igt_display_t *disp, struct drm_mode_fb_cmd2 *f)
 					  f->modifier[0]) ? 0 : -1;
 }
 
+/**
+ * SUBTEST: addfb25-y-tiled-%s
+ * Description: Check if addfb2 call works for y-tiling %arg[1]
+ * Driver requirement: any
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: addfb25-yf-tiled-legacy
+ * Description: Check if addfb2 call works for yf-tiling
+ * Driver requirement: any
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @legacy:               with default size
+ * @small-legacy:         with given size & modifier
+ */
 static void addfb25_ytile(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
@@ -771,6 +886,15 @@ static void addfb25_ytile(int fd)
 	}
 }
 
+/**
+ * SUBTEST: addfb25-4-tiled
+ * Description: Check if addfb2 call works for tiling-4
+ * Driver requirement: any
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void addfb25_4tile(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
@@ -810,33 +934,23 @@ static void addfb25_4tile(int fd)
 }
 
 /**
- * SUBTEST: invalid-get-prop-any
- * Description: Test that get-properties ioctl call fails correctly for invalid object type
+ * SUBTEST: invalid-%s-%s
+ * Description: Test that %arg[1] ioctl call fails correctly for %arg[2] object
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
  *
- * SUBTEST: invalid-get-prop
- * Description: Test that get-properties ioctl call fails correctly for fb mode object
- * Test category: functionality test
- * Run type: BAT
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
+ * arg[1]:
  *
- * SUBTEST: invalid-set-prop-any
- * Description: Test that set-properties ioctl call fails correctly for invalid object type
- * Test category: functionality test
- * Run type: BAT
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
+ * @get:           get-properties
+ * @set:           set-properties
  *
- * SUBTEST: invalid-set-prop
- * Description: Test that get-properties ioctl call fails correctly for fb mode object
- * Test category: functionality test
- * Run type: BAT
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
+ * arg[2]:
+ *
+ * @prop:          fb mode
+ * @prop-any:      invalid
  */
 static void prop_tests(int fd)
 {
@@ -903,6 +1017,15 @@ static void prop_tests(int fd)
 	}
 }
 
+/**
+ * SUBTEST: master-rmfb
+ * Description: Check that only master can rmfb
+ * Driver requirement: any
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void master_tests(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
-- 
2.40.0
