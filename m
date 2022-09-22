Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83E610E14F
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 05:14:37 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 10:41:39 +0530
Message-Id: <20220922051142.2003118-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20220922051142.2003118-1-bhanuprakash.modem@intel.com>
References: <20220922051142.2003118-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 5/8] Revert "tests/kms_color: Test Cleanup"
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

This reverts commit 1a3ffecd400b8f82c35745fa2e07992f6bdeede2.
---
 tests/kms_color.c        | 96 ++++++++++++++++------------------------
 tests/kms_color_helper.h |  1 -
 2 files changed, 39 insertions(+), 58 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 0b03fb9a..85f3b32d 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -37,7 +37,7 @@ static bool test_pipe_degamma(data_t *data,
 		{ 0.0, 1.0, 0.0 },
 		{ 0.0, 0.0, 1.0 }
 	};
-	drmModeModeInfo *mode = data->mode;
+	drmModeModeInfo *mode;
 	struct igt_fb fb_modeset, fb;
 	igt_crc_t crc_fullgamma, crc_fullcolors;
 	int fb_id, fb_modeset_id;
@@ -50,7 +50,7 @@ static bool test_pipe_degamma(data_t *data,
 	degamma_full = generate_table_max(data->degamma_lut_size);
 
 	igt_output_set_pipe(output, primary->pipe->pipe);
-	igt_output_override_mode(output, mode);
+	mode = igt_output_get_mode(output);
 
 	/* Create a framebuffer at the size of the output. */
 	fb_id = igt_create_fb(data->drm_fd,
@@ -83,8 +83,7 @@ static bool test_pipe_degamma(data_t *data,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
 
-	/*
-	 * Draw a gradient with degamma LUT to remap all
+	/* Draw a gradient with degamma LUT to remap all
 	 * values to max red/green/blue.
 	 */
 	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
@@ -95,8 +94,7 @@ static bool test_pipe_degamma(data_t *data,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
 
-	/*
-	 * Verify that the CRC of the software computed output is
+	/* Verify that the CRC of the software computed output is
 	 * equal to the CRC of the degamma LUT transformation output.
 	 */
 	ret = !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
@@ -129,7 +127,7 @@ static bool test_pipe_gamma(data_t *data,
 		{ 0.0, 1.0, 0.0 },
 		{ 0.0, 0.0, 1.0 }
 	};
-	drmModeModeInfo *mode = data->mode;
+	drmModeModeInfo *mode;
 	struct igt_fb fb_modeset, fb;
 	igt_crc_t crc_fullgamma, crc_fullcolors;
 	int fb_id, fb_modeset_id;
@@ -140,7 +138,7 @@ static bool test_pipe_gamma(data_t *data,
 	gamma_full = generate_table_max(data->gamma_lut_size);
 
 	igt_output_set_pipe(output, primary->pipe->pipe);
-	igt_output_override_mode(output, mode);
+	mode = igt_output_get_mode(output);
 
 	/* Create a framebuffer at the size of the output. */
 	fb_id = igt_create_fb(data->drm_fd,
@@ -173,8 +171,7 @@ static bool test_pipe_gamma(data_t *data,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
 
-	/*
-	 * Draw a gradient with gamma LUT to remap all values
+	/* Draw a gradient with gamma LUT to remap all values
 	 * to max red/green/blue.
 	 */
 	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
@@ -184,8 +181,7 @@ static bool test_pipe_gamma(data_t *data,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
 
-	/*
-	 * Verify that the CRC of the software computed output is
+	/* Verify that the CRC of the software computed output is
 	 * equal to the CRC of the gamma LUT transformation output.
 	 */
 	ret = !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
@@ -210,7 +206,7 @@ static bool test_pipe_gamma(data_t *data,
 static bool test_pipe_legacy_gamma(data_t *data,
 				   igt_plane_t *primary)
 {
-	igt_output_t *output = data->output;
+	igt_output_t *output;
 	igt_display_t *display = &data->display;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
@@ -220,7 +216,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	drmModeCrtc *kms_crtc;
 	uint32_t i, legacy_lut_size;
 	uint16_t *red_lut, *green_lut, *blue_lut;
-	drmModeModeInfo *mode = data->mode;
+	drmModeModeInfo *mode;
 	struct igt_fb fb_modeset, fb;
 	igt_crc_t crc_fullgamma, crc_fullcolors;
 	int fb_id, fb_modeset_id;
@@ -234,8 +230,11 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	green_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
 	blue_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
 
+	output = igt_get_single_output_for_pipe(&data->display, primary->pipe->pipe);
+	igt_require(output);
+
 	igt_output_set_pipe(output, primary->pipe->pipe);
-	igt_output_override_mode(output, mode);
+	mode = igt_output_get_mode(output);
 
 	/* Create a framebuffer at the size of the output. */
 	fb_id = igt_create_fb(data->drm_fd,
@@ -268,8 +267,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
 
-	/*
-	 * Draw a gradient with gamma LUT to remap all values
+	/* Draw a gradient with gamma LUT to remap all values
 	 * to max red/green/blue.
 	 */
 	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
@@ -285,8 +283,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
 
-	/*
-	 * Verify that the CRC of the software computed output is
+	/* Verify that the CRC of the software computed output is
 	 * equal to the CRC of the gamma LUT transformation output.
 	 */
 	ret = !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
@@ -301,7 +298,6 @@ static bool test_pipe_legacy_gamma(data_t *data,
 
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
-	igt_display_commit(&data->display);
 	igt_remove_fb(data->drm_fd, &fb);
 	igt_remove_fb(data->drm_fd, &fb_modeset);
 
@@ -330,7 +326,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 	uint16_t *red_lut, *green_lut, *blue_lut;
 	struct drm_color_lut *lut;
 	drmModePropertyBlobPtr blob;
-	igt_output_t *output = data->output;
+	igt_output_t *output;
 	bool ret = true;
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
@@ -339,6 +335,9 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 		degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	gamma_zero = generate_table_zero(data->gamma_lut_size);
 
+	output = igt_get_single_output_for_pipe(&data->display, primary->pipe->pipe);
+	igt_require(output);
+
 	igt_output_set_pipe(output, primary->pipe->pipe);
 
 	/* Ensure we have a clean state to start with. */
@@ -347,11 +346,9 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 	disable_gamma(primary->pipe);
 	igt_display_commit(&data->display);
 
-	/*
-	 * Set a degama & gamma LUT and a CTM using the
+	/* Set a degama & gamma LUT and a CTM using the
 	 * properties and verify the content of the
-	 * properties.
-	 */
+	 * properties. */
 	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
 		set_degamma(data, primary->pipe, degamma_linear);
 	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM))
@@ -387,11 +384,9 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 	if(!ret)
 		goto end;
 
-	/*
-	 * Set a gamma LUT using the legacy ioctl and verify
+	/* Set a gamma LUT using the legacy ioctl and verify
 	 * the content of the GAMMA_LUT property is changed
-	 * and that CTM and DEGAMMA_LUT are empty.
-	 */
+	 * and that CTM and DEGAMMA_LUT are empty. */
 	kms_crtc = drmModeGetCrtc(data->drm_fd, primary->pipe->crtc_id);
 	legacy_lut_size = kms_crtc->gamma_size;
 	drmModeFreeCrtc(kms_crtc);
@@ -429,7 +424,6 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
-	igt_display_commit(&data->display);
 
 	free_lut(degamma_linear);
 	free_lut(gamma_zero);
@@ -456,7 +450,7 @@ static bool test_pipe_ctm(data_t *data,
 	igt_output_t *output = data->output;
 	bool ret = true;
 	igt_display_t *display = &data->display;
-	drmModeModeInfo *mode = data->mode;
+	drmModeModeInfo *mode;
 	struct igt_fb fb_modeset, fb;
 	igt_crc_t crc_software, crc_hardware;
 	int fb_id, fb_modeset_id;
@@ -467,7 +461,7 @@ static bool test_pipe_ctm(data_t *data,
 	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
 
 	igt_output_set_pipe(output, primary->pipe->pipe);
-	igt_output_override_mode(output, mode);
+	mode = igt_output_get_mode(output);
 
 	/* Create a framebuffer at the size of the output. */
 	fb_id = igt_create_fb(data->drm_fd,
@@ -521,15 +515,13 @@ static bool test_pipe_ctm(data_t *data,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hardware);
 
-	/*
-	 * Verify that the CRC of the software computed output is
+	/* Verify that the CRC of the software computed output is
 	 * equal to the CRC of the CTM matrix transformation output.
 	 */
 	ret &= !igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &crc_hardware);
 
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
-	igt_display_commit(&data->display);
 	igt_remove_fb(data->drm_fd, &fb);
 	igt_remove_fb(data->drm_fd, &fb_modeset);
 
@@ -711,12 +703,17 @@ static void test_setup(data_t *data, enum pipe p)
 	igt_display_require_output_on_pipe(&data->display, p);
 	data->output = igt_get_single_output_for_pipe(&data->display, p);
 	igt_require(data->output);
-
-	igt_display_reset(&data->display);
 }
 
 static void test_cleanup(data_t *data)
 {
+	igt_plane_t *primary = data->primary;
+
+	disable_degamma(primary->pipe);
+	disable_gamma(primary->pipe);
+	disable_ctm(primary->pipe);
+	igt_display_commit(&data->display);
+
 	igt_pipe_crc_free(data->pipe_crc);
 	data->pipe_crc = NULL;
 }
@@ -727,13 +724,10 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
 {
 	test_setup(data, p);
 
-	/*
-	 * We assume an 8bits depth per color for degamma/gamma LUTs
-	 * for CRC checks with framebuffer references.
-	 */
+	/* We assume an 8bits depth per color for degamma/gamma LUTs
+	 * for CRC checks with framebuffer references. */
 	data->color_depth = 8;
 	data->drm_format = DRM_FORMAT_XRGB8888;
-	data->mode = igt_output_get_mode(data->output);
 
 	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
 		igt_assert(test_t(data, data->primary));
@@ -763,7 +757,6 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 	data->color_depth = 8;
 	delta = 1.0 / (1 << data->color_depth);
 	data->drm_format = DRM_FORMAT_XRGB8888;
-	data->mode = igt_output_get_mode(data->output);
 
 	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name) {
 		bool success = false;
@@ -830,6 +823,9 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		if (!panel_supports_deep_color(data->drm_fd, output->name))
 			continue;
 
+		data->color_depth = 10;
+		data->drm_format = DRM_FORMAT_XRGB2101010;
+		data->output = output;
 		igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 		igt_output_set_pipe(output, p);
 		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
@@ -838,15 +834,7 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		    !i915_clock_constraint(data, p, 10))
 			continue;
 
-		data->color_depth = 10;
-		data->drm_format = DRM_FORMAT_XRGB2101010;
-		data->output = output;
-		data->mode = igt_output_get_mode(data->output);
-
 		igt_dynamic_f("pipe-%s-%s-gamma", kmstest_pipe_name(p), output->name) {
-			igt_display_reset(&data->display);
-			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
-
 			ret = test_pipe_gamma(data, data->primary);
 
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, max_bpc);
@@ -854,9 +842,6 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		}
 
 		igt_dynamic_f("pipe-%s-%s-degamma", kmstest_pipe_name(p), output->name) {
-			igt_display_reset(&data->display);
-			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
-
 			ret = test_pipe_degamma(data, data->primary);
 
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, max_bpc);
@@ -864,9 +849,6 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		}
 
 		igt_dynamic_f("pipe-%s-%s-ctm", kmstest_pipe_name(p), output->name) {
-			igt_display_reset(&data->display);
-			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
-
 			ret = test_pipe_ctm(data, data->primary,
 					    red_green_blue,
 					    blue_green_blue, ctm);
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index f0ae30e3..2ea15bcd 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -51,7 +51,6 @@ typedef struct {
 	igt_pipe_crc_t *pipe_crc;
 	igt_output_t *output;
 	igt_plane_t *primary;
-	drmModeModeInfo *mode;
 
 	uint32_t drm_format;
 	uint32_t color_depth;
-- 
2.37.3
