Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FE86E227
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2019 05:59:27 +0000 (UTC)
From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Date: Tue, 17 Dec 2019 21:59:23 -0800
Message-Id: <20191218055925.705070-9-vanshidhar.r.konda@intel.com>
In-Reply-To: <20191218055925.705070-1-vanshidhar.r.konda@intel.com>
References: <20191218055925.705070-1-vanshidhar.r.konda@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 08/10] tests/kms_addfb_basic: Avoid tiling
 subtests on device without HW tiling support
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
Cc: brian.welty@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Skip subtests that are testing interoperability of FB modifiers and
hardware tiling if the device does not support HW tiling

Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
---
 tests/kms_addfb_basic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 666e7165..2e39ffe7 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -132,6 +132,7 @@ static void invalid_tests(int fd)
 
 	igt_subtest("clobberred-modifier") {
 		igt_require_intel(fd);
+		igt_require(gem_has_legacy_hw_tiling(fd));
 		f.flags = 0;
 		f.modifier[0] = 0;
 		gem_set_tiling(fd, gem_bo, I915_TILING_X, 512*4);
@@ -304,6 +305,7 @@ static void tiling_tests(int fd)
 	igt_subtest_group {
 		igt_fixture {
 			igt_require_intel(fd);
+			igt_require(gem_has_legacy_hw_tiling(fd));
 			tiled_x_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
 				DRM_FORMAT_XRGB8888, LOCAL_I915_FORMAT_MOD_X_TILED,
 				1024*4, NULL, NULL, NULL);
@@ -450,6 +452,7 @@ static void size_tests(int fd)
 
 	igt_subtest("bo-too-small-due-to-tiling") {
 		igt_require_intel(fd);
+		igt_require(gem_has_legacy_hw_tiling(fd));
 		gem_set_tiling(fd, gem_bo_small, I915_TILING_X, 1024*4);
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
 			   errno == EINVAL);
@@ -502,6 +505,7 @@ static void addfb25_tests(int fd)
 	igt_subtest_group {
 		igt_fixture {
 			igt_require_intel(fd);
+			igt_require(gem_has_legacy_hw_tiling(fd));
 			gem_set_tiling(fd, gem_bo, I915_TILING_X, 1024*4);
 			igt_require_fb_modifiers(fd);
 		}
-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
