Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0C36E840
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Aug 2021 12:00:16 +0000 (UTC)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 19 Aug 2021 13:59:41 +0200
Message-Id: <20210819115942.23920-3-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210819115942.23920-1-thomas.hellstrom@linux.intel.com>
References: <20210819115942.23920-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_addfb_basic: Skip tiling
 subtests on device without hw tiling
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
Cc: apoorva1.singh@intel.com, zbigniew.kempczynski@intel.com, Vanshidhar Konda <vanshidhar.r.konda@intel.com>, Uma Shankar <uma.shankar@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>

Skip subtests that are testing interoperability of FB modifiers and
hardware tiling if the device does not support HW tiling

Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
---
 tests/kms_addfb_basic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 05c8b5f6..f5a15298 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -138,6 +138,7 @@ static void invalid_tests(int fd)
 	igt_describe("Check if addfb2 call works for clobbered modifier");
 	igt_subtest("clobberred-modifier") {
 		igt_require_intel(fd);
+		igt_require(gem_has_legacy_hw_tiling(fd));
 		f.flags = 0;
 		f.modifier[0] = 0;
 		gem_set_tiling(fd, gem_bo, I915_TILING_X, 512*4);
@@ -340,6 +341,7 @@ static void tiling_tests(int fd)
 	igt_subtest_group {
 		igt_fixture {
 			igt_require_intel(fd);
+			igt_require(gem_has_legacy_hw_tiling(fd));
 			tiled_x_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
 				DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED,
 				1024*4, NULL, NULL, NULL);
@@ -511,6 +513,7 @@ static void size_tests(int fd)
 	igt_describe("Test that addfb2 call fails correctly with small buffer object after changing tile");
 	igt_subtest("bo-too-small-due-to-tiling") {
 		igt_require_intel(fd);
+		igt_require(gem_has_legacy_hw_tiling(fd));
 		gem_set_tiling(fd, gem_bo_small, I915_TILING_X, 1024*4);
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
 			   errno == EINVAL);
@@ -565,6 +568,7 @@ static void addfb25_tests(int fd)
 	igt_subtest_group {
 		igt_fixture {
 			igt_require_intel(fd);
+			igt_require(gem_has_legacy_hw_tiling(fd));
 			gem_set_tiling(fd, gem_bo, I915_TILING_X, 1024*4);
 			igt_require_fb_modifiers(fd);
 		}
-- 
2.31.1
