Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F363310EC60
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 06:13:39 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Apr 2023 11:38:02 +0530
Message-Id: <20230428060818.2446308-31-bhanuprakash.modem@intel.com>
In-Reply-To: <20230428060818.2446308-1-bhanuprakash.modem@intel.com>
References: <20230428060818.2446308-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 30/46] tests/color: Add XE support
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
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/chamelium/kms_chamelium_color.c |  2 +-
 tests/kms_color.c                     | 10 +++++-----
 tests/kms_color_helper.c              |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index b7c84ae4d..26239a6b8 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -680,7 +680,7 @@ igt_main
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
-		if (is_i915_device(data.drm_fd))
+		if (is_intel_device(data.drm_fd))
 			data.devid = intel_get_drm_devid(data.drm_fd);
 
 		igt_display_require(&data.display, data.drm_fd);
diff --git a/tests/kms_color.c b/tests/kms_color.c
index cd03c1354..fdc7120c7 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -499,11 +499,11 @@ static bool test_pipe_ctm(data_t *data,
 	disable_gamma(primary->pipe);
 
 	/*
-	 * Only program LUT's for i915, but not for max CTM as limitation of
+	 * Only program LUT's for intel, but not for max CTM as limitation of
 	 * representing intermediate values between 0 and 1.0 causes
 	 * rounding issues and inaccuracies leading to crc mismatch.
 	 */
-	if (is_i915_device(data->drm_fd) && memcmp(before, after, sizeof(color_t))) {
+	if (is_intel_device(data->drm_fd) && memcmp(before, after, sizeof(color_t))) {
 		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
 		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
@@ -813,7 +813,7 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 			 0.0, 1.0, 0.0,
 			 1.0, 0.0, 1.0 };
 
-	if (is_i915_device(data->drm_fd))
+	if (is_intel_device(data->drm_fd))
 		igt_require_f((intel_display_ver(data->devid) >= 11),
 				"At least GEN 11 is required to validate Deep-color.\n");
 
@@ -833,7 +833,7 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 		igt_output_set_pipe(output, p);
 
-		if (is_i915_device(data->drm_fd) &&
+		if (is_intel_device(data->drm_fd) &&
 		    !igt_max_bpc_constraint(&data->display, p, output, 10))
 			continue;
 
@@ -1054,7 +1054,7 @@ igt_main
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
-		if (is_i915_device(data.drm_fd))
+		if (is_intel_device(data.drm_fd))
 			data.devid = intel_get_drm_devid(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 2f9950f80..b01c38ef6 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -181,7 +181,7 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
 	uint32_t max_value = (1 << 16) - 1;
 	uint32_t mask;
 
-	if (is_i915_device(data->drm_fd))
+	if (is_intel_device(data->drm_fd))
 		mask = ((1 << color_depth) - 1) << (16 - color_depth);
 	else
 		mask = max_value;
-- 
2.40.0
