Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C4E10E201
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 12:05:26 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Jun 2023 17:28:57 +0530
Message-Id: <20230619115858.2013195-18-bhanuprakash.modem@intel.com>
In-Reply-To: <20230619115858.2013195-1-bhanuprakash.modem@intel.com>
References: <20230619115858.2013195-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 17/18] tests/kms_async_flips: Add XE support
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_async_flips.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 5cb797dec..9bea54027 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -229,7 +229,7 @@ static void test_async_flip(data_t *data)
 			 * in order to change the watermark levels as per the optimization. Hence the
 			 * subsequent async flips will actually do the asynchronous flips.
 			 */
-			if (is_i915_device(data->drm_fd)) {
+			if (is_intel_device(data->drm_fd)) {
 				uint32_t devid = intel_get_drm_devid(data->drm_fd);
 
 				if (IS_GEN9(devid) || IS_GEN10(devid) || AT_LEAST_GEN(devid, 12)) {
@@ -600,13 +600,7 @@ igt_main
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
@@ -654,7 +648,7 @@ igt_main
 	igt_describe("Negative case to verify if changes in fb are rejected from kernel as expected");
 	igt_subtest_with_dynamic("invalid-async-flip") {
 		/* TODO: support more vendors */
-		igt_require(is_i915_device(data.drm_fd));
+		igt_require(is_intel_device(data.drm_fd));
 		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
 						       I915_FORMAT_MOD_Y_TILED));
 
-- 
2.40.0
