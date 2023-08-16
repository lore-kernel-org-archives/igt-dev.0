Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF4C10E38F
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 16:40:00 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Aug 2023 22:01:50 +0530
Message-Id: <20230816163206.402705-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20230816163206.402705-1-bhanuprakash.modem@intel.com>
References: <20230816163206.402705-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 04/20] tests/kms_addfb_basic: Add tiling
 support for XE
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

Remove the tiling restrictions in Xe specific tests

V2: - Update Xe fast-feedback testlist & blocklist

Fixes: 8c3b02be3 (tests/kms_addfb_basic: Add XE support)
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 11 +++++++++++
 tests/intel-ci/xe.blocklist.txt          |  2 --
 tests/kms_addfb_basic.c                  | 17 ++++++++++++-----
 3 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 311f90c79..26c09ab8b 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -183,7 +183,13 @@ igt@xe_vm@munmap-style-unbind-userptr-inval-front
 igt@xe_waitfence@abstime
 igt@xe_waitfence@reltime
 igt@kms_addfb_basic@addfb25-bad-modifier
+igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
 igt@kms_addfb_basic@addfb25-modifier-no-flag
+igt@kms_addfb_basic@addfb25-x-tiled-legacy
+igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy
+igt@kms_addfb_basic@addfb25-yf-tiled-legacy
+igt@kms_addfb_basic@addfb25-y-tiled-legacy
+igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
 igt@kms_addfb_basic@bad-pitch-0
 igt@kms_addfb_basic@bad-pitch-1024
 igt@kms_addfb_basic@bad-pitch-128
@@ -193,7 +199,11 @@ igt@kms_addfb_basic@bad-pitch-63
 igt@kms_addfb_basic@bad-pitch-65536
 igt@kms_addfb_basic@bad-pitch-999
 igt@kms_addfb_basic@basic
+igt@kms_addfb_basic@basic-x-tiled-legacy
+igt@kms_addfb_basic@basic-y-tiled-legacy
 igt@kms_addfb_basic@bo-too-small
+igt@kms_addfb_basic@bo-too-small-due-to-tiling
+igt@kms_addfb_basic@framebuffer-vs-set-tiling
 igt@kms_addfb_basic@invalid-get-prop
 igt@kms_addfb_basic@invalid-get-prop-any
 igt@kms_addfb_basic@invalid-set-prop
@@ -201,6 +211,7 @@ igt@kms_addfb_basic@invalid-set-prop-any
 igt@kms_addfb_basic@no-handle
 igt@kms_addfb_basic@size-max
 igt@kms_addfb_basic@small-bo
+igt@kms_addfb_basic@tile-pitch-mismatch
 igt@kms_addfb_basic@too-high
 igt@kms_addfb_basic@too-wide
 igt@kms_addfb_basic@unused-handle
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 805939507..358f44e6a 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -70,8 +70,6 @@ igt@kms_big_fb@(4|x|y|yf)-tiled-.*
 igt@kms_flip@2x-flip-vs-fences
 igt@kms_flip@flip-vs-fences(-interruptible)
 igt@kms_addfb_basic@clobberred-modifier
-igt@kms_addfb_basic@.*-tiling
-igt@kms_addfb_basic@.*-(4|x|y|yf)-.*
 igt@kms_async_flips@.*
 igt@kms_plane_multiple@tiling-(4|x|y|yf)
 igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-(atomic|legacy)
diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index f415300b6..f6c27a3d3 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
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
 
@@ -487,6 +489,7 @@ static void tiling_tests(int fd)
 		igt_describe("Test that addfb2 call fails correctly for pitches mismatch");
 			f.pitches[0] = 512*4;
 		igt_subtest("tile-pitch-mismatch") {
+			igt_require_i915(fd);
 			igt_require(gem_available_fences(fd) > 0);
 			f.handles[0] = tiled_x_bo;
 
@@ -496,8 +499,12 @@ static void tiling_tests(int fd)
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
@@ -1118,7 +1125,7 @@ igt_main
 		size_tests(fd);
 
 		igt_fixture
-			igt_require_i915(fd);
+			igt_require_intel(fd);
 
 		addfb25_ytile(fd);
 
-- 
2.40.0
