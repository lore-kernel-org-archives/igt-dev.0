Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2574E6E0E8
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Sep 2021 00:04:08 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Tue,  7 Sep 2021 17:04:00 -0700
Message-Id: <20210908000400.14579-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_addfb_basic: Skip tiling subtests
 on device without hw tiling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Vanshidhar Konda <vanshidhar.r.konda@intel.com>, Imre Deak <imre.deak@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>

Skip subtests that are testing interoperability of FB modifiers and
hardware tiling if the device does not support HW tiling.

v2: Don't skip basic-y-tiled-legacy even on platforms w/o fences (Imre)

Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/kms_addfb_basic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 082f10ee9ee..0f641e7dd78 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -138,6 +138,7 @@ static void invalid_tests(int fd)
 	igt_describe("Check if addfb2 call works for clobbered modifier");
 	igt_subtest("clobberred-modifier") {
 		igt_require_intel(fd);
+		igt_require(gem_available_fences(fd) > 0);
 		f.flags = 0;
 		f.modifier[0] = 0;
 		gem_set_tiling(fd, gem_bo, I915_TILING_X, 512*4);
@@ -358,6 +359,7 @@ static void tiling_tests(int fd)
 		f.pitches[0] = 1024*4;
 		igt_describe("Check if addfb2 and rmfb call works for basic x-tiling test");
 		igt_subtest("basic-x-tiled-legacy") {
+			igt_require(gem_available_fences(fd) > 0);
 			f.handles[0] = tiled_x_bo;
 
 			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
@@ -367,6 +369,7 @@ static void tiling_tests(int fd)
 
 		igt_describe("Check if addfb2 call works for x and y tiling");
 		igt_subtest("framebuffer-vs-set-tiling") {
+			igt_require(gem_available_fences(fd) > 0);
 			f.handles[0] = gem_bo;
 
 			gem_set_tiling(fd, gem_bo, I915_TILING_X, 1024*4);
@@ -380,6 +383,7 @@ static void tiling_tests(int fd)
 		igt_describe("Test that addfb2 call fails correctly for pitches mismatch");
 			f.pitches[0] = 512*4;
 		igt_subtest("tile-pitch-mismatch") {
+			igt_require(gem_available_fences(fd) > 0);
 			f.handles[0] = tiled_x_bo;
 
 			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
@@ -516,6 +520,7 @@ static void size_tests(int fd)
 	igt_describe("Test that addfb2 call fails correctly with small buffer object after changing tile");
 	igt_subtest("bo-too-small-due-to-tiling") {
 		igt_require_intel(fd);
+		igt_require(gem_available_fences(fd) > 0);
 		gem_set_tiling(fd, gem_bo_small, I915_TILING_X, 1024*4);
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
 			   errno == EINVAL);
@@ -570,6 +575,7 @@ static void addfb25_tests(int fd)
 	igt_subtest_group {
 		igt_fixture {
 			igt_require_intel(fd);
+			igt_require(gem_available_fences(fd) > 0);
 			gem_set_tiling(fd, gem_bo, I915_TILING_X, 1024*4);
 			igt_require_fb_modifiers(fd);
 		}
-- 
2.31.1
