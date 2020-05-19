Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3926E89F6E
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 19:13:48 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Tue, 19 May 2020 12:13:46 -0700
Message-Id: <20200519191346.17210-2-ashutosh.dixit@intel.com>
In-Reply-To: <20200519191346.17210-1-ashutosh.dixit@intel.com>
References: <20200519191346.17210-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_addfb_basic: Skip tiling
 subtests on device without fences
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>

Skip subtests that are testing interoperability of FB modifiers and
hardware tiling if the device does not support HW tiling.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/kms_addfb_basic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 666e7165e..1f637a61b 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -132,6 +132,7 @@ static void invalid_tests(int fd)
 
 	igt_subtest("clobberred-modifier") {
 		igt_require_intel(fd);
+		igt_require(gem_available_fences(fd) > 0);
 		f.flags = 0;
 		f.modifier[0] = 0;
 		gem_set_tiling(fd, gem_bo, I915_TILING_X, 512*4);
@@ -304,6 +305,7 @@ static void tiling_tests(int fd)
 	igt_subtest_group {
 		igt_fixture {
 			igt_require_intel(fd);
+			igt_require(gem_available_fences(fd) > 0);
 			tiled_x_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
 				DRM_FORMAT_XRGB8888, LOCAL_I915_FORMAT_MOD_X_TILED,
 				1024*4, NULL, NULL, NULL);
@@ -450,6 +452,7 @@ static void size_tests(int fd)
 
 	igt_subtest("bo-too-small-due-to-tiling") {
 		igt_require_intel(fd);
+		igt_require(gem_available_fences(fd) > 0);
 		gem_set_tiling(fd, gem_bo_small, I915_TILING_X, 1024*4);
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
 			   errno == EINVAL);
@@ -502,6 +505,7 @@ static void addfb25_tests(int fd)
 	igt_subtest_group {
 		igt_fixture {
 			igt_require_intel(fd);
+			igt_require(gem_available_fences(fd) > 0);
 			gem_set_tiling(fd, gem_bo, I915_TILING_X, 1024*4);
 			igt_require_fb_modifiers(fd);
 		}
-- 
2.26.2.593.gb994622632

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
