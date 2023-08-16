Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5043C10E38D
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 16:40:18 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Aug 2023 22:02:02 +0530
Message-Id: <20230816163206.402705-17-bhanuprakash.modem@intel.com>
In-Reply-To: <20230816163206.402705-1-bhanuprakash.modem@intel.com>
References: <20230816163206.402705-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 16/20] tests/kms_async_flips: Add XE support
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

Add XE driver support for kms tests.

V2: - Update XE blocklist

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel-ci/xe.blocklist.txt |  1 -
 tests/kms_async_flips.c         | 12 +++---------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 81599c778..b89b0b951 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -66,7 +66,6 @@ igt@kms_legacy_colorkey@invalid-plane
 igt@kms_flip@2x-flip-vs-fences
 igt@kms_flip@flip-vs-fences(-interruptible)
 igt@kms_addfb_basic@clobberred-modifier
-igt@kms_async_flips@.*
 igt@kms_plane_multiple@tiling-(4|x|y|yf)
 igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-(atomic|legacy)
 igt@kms_rotation_crc@exhaust-fences
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 2a317a9ef..45c38c590 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -254,7 +254,7 @@ static void test_async_flip(data_t *data)
 			 * in order to change the watermark levels as per the optimization. Hence the
 			 * subsequent async flips will actually do the asynchronous flips.
 			 */
-			if (is_i915_device(data->drm_fd)) {
+			if (is_intel_device(data->drm_fd)) {
 				uint32_t devid = intel_get_drm_devid(data->drm_fd);
 
 				if (IS_GEN9(devid) || IS_GEN10(devid) || AT_LEAST_GEN(devid, 12)) {
@@ -663,13 +663,7 @@ igt_main
 	int i;
 
 	igt_fixture {
-		/*
-		 * FIXME: As of now, Async flips won't work with linear buffers
-		 * on Intel hardware, hence don't run tests on XE device as XE
-		 * won't support tiling.
-		 * Once Kernel changes got landed, please update this logic.
-		 */
-		data.drm_fd = drm_open_driver_master(DRIVER_ANY & ~DRIVER_XE);
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
@@ -717,7 +711,7 @@ igt_main
 	igt_describe("Negative case to verify if changes in fb are rejected from kernel as expected");
 	igt_subtest_with_dynamic("invalid-async-flip") {
 		/* TODO: support more vendors */
-		igt_require(is_i915_device(data.drm_fd));
+		igt_require(is_intel_device(data.drm_fd));
 		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
 						       I915_FORMAT_MOD_Y_TILED));
 
-- 
2.40.0
