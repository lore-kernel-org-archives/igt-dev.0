Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D119113774
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jun 2022 08:57:21 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kamil.konieczny@linux.intel.com
Date: Thu, 30 Jun 2022 14:25:23 +0530
Message-Id: <20220630085523.291024-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20220630085523.291024-1-bhanuprakash.modem@intel.com>
References: <20220630085523.291024-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 2/2] tests/kms_color: Test Cleanup
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

Sanitize the system state before starting the subtest.

V2:
* Fix multiline comments.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c        | 96 ++++++++++++++++++++++++----------------
 tests/kms_color_helper.h |  1 +
 2 files changed, 58 insertions(+), 39 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 85f3b32d..0b03fb9a 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -37,7 +37,7 @@ static bool test_pipe_degamma(data_t *data,
 		{ 0.0, 1.0, 0.0 },
 		{ 0.0, 0.0, 1.0 }
 	};
-	drmModeModeInfo *mode;
+	drmModeModeInfo *mode = data->mode;
 	struct igt_fb fb_modeset, fb;
 	igt_crc_t crc_fullgamma, crc_fullcolors;
 	int fb_id, fb_modeset_id;
@@ -50,7 +50,7 @@ static bool test_pipe_degamma(data_t *data,
 	degamma_full = generate_table_max(data->degamma_lut_size);
 
 	igt_output_set_pipe(output, primary->pipe->pipe);
-	mode = igt_output_get_mode(output);
+	igt_output_override_mode(output, mode);
 
 	/* Create a framebuffer at the size of the output. */
 	fb_id = igt_create_fb(data->drm_fd,
@@ -83,7 +83,8 @@ static bool test_pipe_degamma(data_t *data,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
 
-	/* Draw a gradient with degamma LUT to remap all
+	/*
+	 * Draw a gradient with degamma LUT to remap all
 	 * values to max red/green/blue.
 	 */
 	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
@@ -94,7 +95,8 @@ static bool test_pipe_degamma(data_t *data,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
 
-	/* Verify that the CRC of the software computed output is
+	/*
+	 * Verify that the CRC of the software computed output is
 	 * equal to the CRC of the degamma LUT transformation output.
 	 */
 	ret = !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
@@ -127,7 +129,7 @@ static bool test_pipe_gamma(data_t *data,
 		{ 0.0, 1.0, 0.0 },
 		{ 0.0, 0.0, 1.0 }
 	};
-	drmModeModeInfo *mode;
+	drmModeModeInfo *mode = data->mode;
 	struct igt_fb fb_modeset, fb;
 	igt_crc_t crc_fullgamma, crc_fullcolors;
 	int fb_id, fb_modeset_id;
@@ -138,7 +140,7 @@ static bool test_pipe_gamma(data_t *data,
 	gamma_full = generate_table_max(data->gamma_lut_size);
 
 	igt_output_set_pipe(output, primary->pipe->pipe);
-	mode = igt_output_get_mode(output);
+	igt_output_override_mode(output, mode);
 
 	/* Create a framebuffer at the size of the output. */
 	fb_id = igt_create_fb(data->drm_fd,
@@ -171,7 +173,8 @@ static bool test_pipe_gamma(data_t *data,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
 
-	/* Draw a gradient with gamma LUT to remap all values
+	/*
+	 * Draw a gradient with gamma LUT to remap all values
 	 * to max red/green/blue.
 	 */
 	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
@@ -181,7 +184,8 @@ static bool test_pipe_gamma(data_t *data,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
 
-	/* Verify that the CRC of the software computed output is
+	/*
+	 * Verify that the CRC of the software computed output is
 	 * equal to the CRC of the gamma LUT transformation output.
 	 */
 	ret = !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
@@ -206,7 +210,7 @@ static bool test_pipe_gamma(data_t *data,
 static bool test_pipe_legacy_gamma(data_t *data,
 				   igt_plane_t *primary)
 {
-	igt_output_t *output;
+	igt_output_t *output = data->output;
 	igt_display_t *display = &data->display;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
@@ -216,7 +220,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	drmModeCrtc *kms_crtc;
 	uint32_t i, legacy_lut_size;
 	uint16_t *red_lut, *green_lut, *blue_lut;
-	drmModeModeInfo *mode;
+	drmModeModeInfo *mode = data->mode;
 	struct igt_fb fb_modeset, fb;
 	igt_crc_t crc_fullgamma, crc_fullcolors;
 	int fb_id, fb_modeset_id;
@@ -230,11 +234,8 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	green_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
 	blue_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
 
-	output = igt_get_single_output_for_pipe(&data->display, primary->pipe->pipe);
-	igt_require(output);
-
 	igt_output_set_pipe(output, primary->pipe->pipe);
-	mode = igt_output_get_mode(output);
+	igt_output_override_mode(output, mode);
 
 	/* Create a framebuffer at the size of the output. */
 	fb_id = igt_create_fb(data->drm_fd,
@@ -267,7 +268,8 @@ static bool test_pipe_legacy_gamma(data_t *data,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
 
-	/* Draw a gradient with gamma LUT to remap all values
+	/*
+	 * Draw a gradient with gamma LUT to remap all values
 	 * to max red/green/blue.
 	 */
 	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
@@ -283,7 +285,8 @@ static bool test_pipe_legacy_gamma(data_t *data,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
 
-	/* Verify that the CRC of the software computed output is
+	/*
+	 * Verify that the CRC of the software computed output is
 	 * equal to the CRC of the gamma LUT transformation output.
 	 */
 	ret = !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
@@ -298,6 +301,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit(&data->display);
 	igt_remove_fb(data->drm_fd, &fb);
 	igt_remove_fb(data->drm_fd, &fb_modeset);
 
@@ -326,7 +330,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 	uint16_t *red_lut, *green_lut, *blue_lut;
 	struct drm_color_lut *lut;
 	drmModePropertyBlobPtr blob;
-	igt_output_t *output;
+	igt_output_t *output = data->output;
 	bool ret = true;
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
@@ -335,9 +339,6 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 		degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	gamma_zero = generate_table_zero(data->gamma_lut_size);
 
-	output = igt_get_single_output_for_pipe(&data->display, primary->pipe->pipe);
-	igt_require(output);
-
 	igt_output_set_pipe(output, primary->pipe->pipe);
 
 	/* Ensure we have a clean state to start with. */
@@ -346,9 +347,11 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 	disable_gamma(primary->pipe);
 	igt_display_commit(&data->display);
 
-	/* Set a degama & gamma LUT and a CTM using the
+	/*
+	 * Set a degama & gamma LUT and a CTM using the
 	 * properties and verify the content of the
-	 * properties. */
+	 * properties.
+	 */
 	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
 		set_degamma(data, primary->pipe, degamma_linear);
 	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM))
@@ -384,9 +387,11 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 	if(!ret)
 		goto end;
 
-	/* Set a gamma LUT using the legacy ioctl and verify
+	/*
+	 * Set a gamma LUT using the legacy ioctl and verify
 	 * the content of the GAMMA_LUT property is changed
-	 * and that CTM and DEGAMMA_LUT are empty. */
+	 * and that CTM and DEGAMMA_LUT are empty.
+	 */
 	kms_crtc = drmModeGetCrtc(data->drm_fd, primary->pipe->crtc_id);
 	legacy_lut_size = kms_crtc->gamma_size;
 	drmModeFreeCrtc(kms_crtc);
@@ -424,6 +429,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit(&data->display);
 
 	free_lut(degamma_linear);
 	free_lut(gamma_zero);
@@ -450,7 +456,7 @@ static bool test_pipe_ctm(data_t *data,
 	igt_output_t *output = data->output;
 	bool ret = true;
 	igt_display_t *display = &data->display;
-	drmModeModeInfo *mode;
+	drmModeModeInfo *mode = data->mode;
 	struct igt_fb fb_modeset, fb;
 	igt_crc_t crc_software, crc_hardware;
 	int fb_id, fb_modeset_id;
@@ -461,7 +467,7 @@ static bool test_pipe_ctm(data_t *data,
 	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
 
 	igt_output_set_pipe(output, primary->pipe->pipe);
-	mode = igt_output_get_mode(output);
+	igt_output_override_mode(output, mode);
 
 	/* Create a framebuffer at the size of the output. */
 	fb_id = igt_create_fb(data->drm_fd,
@@ -515,13 +521,15 @@ static bool test_pipe_ctm(data_t *data,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hardware);
 
-	/* Verify that the CRC of the software computed output is
+	/*
+	 * Verify that the CRC of the software computed output is
 	 * equal to the CRC of the CTM matrix transformation output.
 	 */
 	ret &= !igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &crc_hardware);
 
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit(&data->display);
 	igt_remove_fb(data->drm_fd, &fb);
 	igt_remove_fb(data->drm_fd, &fb_modeset);
 
@@ -703,17 +711,12 @@ static void test_setup(data_t *data, enum pipe p)
 	igt_display_require_output_on_pipe(&data->display, p);
 	data->output = igt_get_single_output_for_pipe(&data->display, p);
 	igt_require(data->output);
+
+	igt_display_reset(&data->display);
 }
 
 static void test_cleanup(data_t *data)
 {
-	igt_plane_t *primary = data->primary;
-
-	disable_degamma(primary->pipe);
-	disable_gamma(primary->pipe);
-	disable_ctm(primary->pipe);
-	igt_display_commit(&data->display);
-
 	igt_pipe_crc_free(data->pipe_crc);
 	data->pipe_crc = NULL;
 }
@@ -724,10 +727,13 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
 {
 	test_setup(data, p);
 
-	/* We assume an 8bits depth per color for degamma/gamma LUTs
-	 * for CRC checks with framebuffer references. */
+	/*
+	 * We assume an 8bits depth per color for degamma/gamma LUTs
+	 * for CRC checks with framebuffer references.
+	 */
 	data->color_depth = 8;
 	data->drm_format = DRM_FORMAT_XRGB8888;
+	data->mode = igt_output_get_mode(data->output);
 
 	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
 		igt_assert(test_t(data, data->primary));
@@ -757,6 +763,7 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 	data->color_depth = 8;
 	delta = 1.0 / (1 << data->color_depth);
 	data->drm_format = DRM_FORMAT_XRGB8888;
+	data->mode = igt_output_get_mode(data->output);
 
 	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name) {
 		bool success = false;
@@ -823,9 +830,6 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		if (!panel_supports_deep_color(data->drm_fd, output->name))
 			continue;
 
-		data->color_depth = 10;
-		data->drm_format = DRM_FORMAT_XRGB2101010;
-		data->output = output;
 		igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 		igt_output_set_pipe(output, p);
 		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
@@ -834,7 +838,15 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		    !i915_clock_constraint(data, p, 10))
 			continue;
 
+		data->color_depth = 10;
+		data->drm_format = DRM_FORMAT_XRGB2101010;
+		data->output = output;
+		data->mode = igt_output_get_mode(data->output);
+
 		igt_dynamic_f("pipe-%s-%s-gamma", kmstest_pipe_name(p), output->name) {
+			igt_display_reset(&data->display);
+			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
+
 			ret = test_pipe_gamma(data, data->primary);
 
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, max_bpc);
@@ -842,6 +854,9 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		}
 
 		igt_dynamic_f("pipe-%s-%s-degamma", kmstest_pipe_name(p), output->name) {
+			igt_display_reset(&data->display);
+			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
+
 			ret = test_pipe_degamma(data, data->primary);
 
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, max_bpc);
@@ -849,6 +864,9 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		}
 
 		igt_dynamic_f("pipe-%s-%s-ctm", kmstest_pipe_name(p), output->name) {
+			igt_display_reset(&data->display);
+			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
+
 			ret = test_pipe_ctm(data, data->primary,
 					    red_green_blue,
 					    blue_green_blue, ctm);
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 2ea15bcd..f0ae30e3 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -51,6 +51,7 @@ typedef struct {
 	igt_pipe_crc_t *pipe_crc;
 	igt_output_t *output;
 	igt_plane_t *primary;
+	drmModeModeInfo *mode;
 
 	uint32_t drm_format;
 	uint32_t color_depth;
-- 
2.35.1
