Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DAB10F0C2
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Aug 2022 06:49:35 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 29 Aug 2022 12:13:31 +0530
Message-Id: <20220829064331.992326-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3] tests/kms_color: MPO + pipe color test.
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

MPO + pipe color test for gamma, degamma, ctm transformation.

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_color.c | 367 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 366 insertions(+), 1 deletion(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index c202547e..098bb3fe 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -114,6 +114,101 @@ static bool test_pipe_degamma(data_t *data,
 	return ret;
 }
 
+static bool test_pipe_degamma_multiplane(data_t *data,
+			igt_plane_t *primary)
+{
+	igt_output_t *output = data->output;
+	igt_plane_t *overlay;
+	igt_display_t *display = &data->display;
+	gamma_lut_t *degamma_linear, *degamma_full;
+	color_t red_green_blue[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+	drmModeModeInfo *mode = data->mode;
+	struct igt_fb fb;
+	igt_crc_t crc_fullgamma, crc_fullcolors;
+	int fb_id, height_primary, height_overlay, width;
+	bool ret;
+
+	overlay = igt_pipe_get_plane_type(primary->pipe, DRM_PLANE_TYPE_OVERLAY);
+	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
+	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
+
+	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
+	degamma_full = generate_table_max(data->degamma_lut_size);
+
+	igt_output_set_pipe(output, primary->pipe->pipe);
+	igt_output_override_mode(output, mode);
+
+	height_primary = mode->vdisplay/2;
+	height_overlay = mode->vdisplay/2+1;
+	width = mode->hdisplay;
+
+	/* Create a framebuffer at the size of the output. */
+	fb_id = igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      data->drm_format,
+			      DRM_FORMAT_MOD_LINEAR,
+			      &fb);
+	igt_assert(fb_id);
+
+	igt_plane_set_fb(primary, &fb);
+	igt_plane_set_position(primary, 0, 0);
+	igt_plane_set_fb(overlay, &fb);
+	igt_plane_set_position(overlay, 0, height_primary);
+
+	disable_ctm(primary->pipe);
+	disable_gamma(primary->pipe);
+	set_degamma(data, primary->pipe, degamma_linear);
+	igt_display_commit(&data->display);
+
+	/* Draw solid colors with linear degamma transformation. */
+	paint_rectangles(data, mode, red_green_blue, &fb);
+	igt_plane_set_fb(primary, &fb);
+	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
+
+	/*
+	 * Draw a gradient with degamma LUT to remap all
+	 * values to max red/green/blue.
+	 */
+	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+	igt_plane_set_fb(primary, &fb);
+	igt_plane_set_position(primary, 0, 0);
+	igt_plane_set_size(primary, width, height_primary);
+	igt_plane_set_fb(overlay, &fb);
+	igt_plane_set_position(overlay, 0, height_primary);
+	igt_plane_set_size(overlay, width, height_overlay);
+	set_degamma(data, primary->pipe, degamma_full);
+	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
+
+	/*
+	 * Verify that the CRC of the software computed output is
+	 * equal to the CRC of the degamma LUT transformation output.
+	 */
+	ret = !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
+
+	disable_degamma(primary->pipe);
+	igt_plane_set_fb(primary, NULL);
+	igt_plane_set_fb(overlay, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit(&data->display);
+	igt_remove_fb(data->drm_fd, &fb);
+
+	free_lut(degamma_linear);
+	free_lut(degamma_full);
+
+	return ret;
+}
+
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out gamma
  * LUT and verify we have the same CRC as drawing solid color rectangles.
@@ -202,6 +297,97 @@ static bool test_pipe_gamma(data_t *data,
 	return ret;
 }
 
+static bool test_pipe_gamma_multiplane(data_t *data,
+				       igt_plane_t *primary)
+{
+	igt_output_t *output = data->output;
+	igt_plane_t *overlay;
+	igt_display_t *display = &data->display;
+	gamma_lut_t *gamma_full;
+	color_t red_green_blue[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+	drmModeModeInfo *mode = data->mode;
+	struct igt_fb fb;
+	igt_crc_t crc_fullgamma, crc_fullcolors;
+	int fb_id, height_primary, height_overlay, width;
+	bool ret;
+
+	overlay = igt_pipe_get_plane_type(primary->pipe, DRM_PLANE_TYPE_OVERLAY);
+	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
+
+	gamma_full = generate_table_max(data->gamma_lut_size);
+
+	igt_output_set_pipe(output, primary->pipe->pipe);
+	igt_output_override_mode(output, mode);
+
+	height_primary = mode->vdisplay/2;
+	height_overlay = mode->vdisplay/2+1;
+	width = mode->hdisplay;
+
+	/* Create a framebuffer at the size of the output. */
+	fb_id = igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      data->drm_format,
+			      DRM_FORMAT_MOD_LINEAR,
+			      &fb);
+	igt_assert(fb_id);
+
+	igt_plane_set_fb(primary, &fb);
+	igt_plane_set_position(primary, 0, 0);
+	igt_plane_set_fb(overlay, &fb);
+	igt_plane_set_position(overlay, 0, height_primary);
+	disable_ctm(primary->pipe);
+	disable_degamma(primary->pipe);
+	disable_gamma(primary->pipe);
+	igt_display_commit(&data->display);
+
+	/* Draw solid colors with no gamma transformation. */
+	paint_rectangles(data, mode, red_green_blue, &fb);
+	igt_plane_set_fb(primary, &fb);
+	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
+
+	/*
+	 * Draw a gradient with gamma LUT to remap all values
+	 * to max red/green/blue.
+	 */
+	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+	igt_plane_set_fb(primary, &fb);
+	igt_plane_set_position(primary, 0, 0);
+	igt_plane_set_size(primary, width, height_primary);
+	igt_plane_set_fb(overlay, &fb);
+	igt_plane_set_position(overlay, 0, height_primary);
+	igt_plane_set_size(overlay, width, height_overlay);
+	set_gamma(data, primary->pipe, gamma_full);
+	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
+
+	/*
+	 * Verify that the CRC of the software computed output is
+	 * equal to the CRC of the gamma LUT transformation output.
+	 */
+	ret = !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
+
+	disable_gamma(primary->pipe);
+	igt_plane_set_fb(primary, NULL);
+	igt_plane_set_fb(overlay, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit(&data->display);
+	igt_remove_fb(data->drm_fd, &fb);
+
+	free_lut(gamma_full);
+
+	return ret;
+}
+
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out legacy
  * gamma LUT and verify we have the same CRC as drawing solid color rectangles
@@ -548,6 +734,110 @@ static bool test_pipe_ctm(data_t *data,
 	return ret;
 }
 
+static bool test_pipe_ctm_multiplane(data_t *data,
+				     igt_plane_t *primary,
+				     color_t *before,
+				     color_t *after,
+				     double *ctm_matrix)
+{
+	const double ctm_identity[] = {
+		1.0, 0.0, 0.0,
+		0.0, 1.0, 0.0,
+		0.0, 0.0, 1.0
+	};
+	gamma_lut_t *degamma_linear, *gamma_linear;
+	igt_output_t *output = data->output;
+	igt_plane_t *overlay;
+	bool ret = true;
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode = data->mode;
+	struct igt_fb fb;
+	igt_crc_t crc_software, crc_hardware;
+	int fb_id, height_primary, height_overlay, width;
+
+	overlay = igt_pipe_get_plane_type(primary->pipe, DRM_PLANE_TYPE_OVERLAY);
+	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
+
+	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
+	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
+
+	igt_output_set_pipe(output, primary->pipe->pipe);
+	igt_output_override_mode(output, mode);
+
+	height_primary = mode->vdisplay/2;
+	height_overlay = mode->vdisplay/2+1;
+	width = mode->hdisplay;
+
+	/* Create a framebuffer at the size of the output. */
+	fb_id = igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      data->drm_format,
+			      DRM_FORMAT_MOD_LINEAR,
+			      &fb);
+	igt_assert(fb_id);
+
+	igt_plane_set_fb(primary, &fb);
+	igt_plane_set_position(primary, 0, 0);
+	igt_plane_set_fb(overlay, &fb);
+	igt_plane_set_position(overlay, 0, height_primary);
+	/*
+	 * Don't program LUT's for max CTM cases, as limitation of
+	 * representing intermediate values between 0 and 1.0 causes
+	 * rounding issues and inaccuracies leading to crc mismatch.
+	 */
+	if (memcmp(before, after, sizeof(color_t))) {
+		set_degamma(data, primary->pipe, degamma_linear);
+		set_gamma(data, primary->pipe, gamma_linear);
+	} else {
+		/* Disable Degamma and Gamma for ctm max test */
+		disable_degamma(primary->pipe);
+		disable_gamma(primary->pipe);
+	}
+
+	disable_ctm(primary->pipe);
+	igt_display_commit(&data->display);
+
+	paint_rectangles(data, mode, after, &fb);
+	igt_plane_set_fb(primary, &fb);
+	set_ctm(primary->pipe, ctm_identity);
+	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_software);
+
+	/* With CTM transformation. */
+	paint_rectangles(data, mode, before, &fb);
+	igt_plane_set_fb(primary, &fb);
+	igt_plane_set_position(primary, 0, 0);
+	igt_plane_set_size(primary, width, height_primary);
+	igt_plane_set_fb(overlay, &fb);
+	igt_plane_set_position(overlay, 0, height_primary);
+	igt_plane_set_size(overlay, width, height_overlay);
+	set_ctm(primary->pipe, ctm_matrix);
+	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hardware);
+
+	/*
+	 * Verify that the CRC of the software computed output is
+	 * equal to the CRC of the CTM matrix transformation output.
+	 */
+	ret &= !igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &crc_hardware);
+
+	igt_plane_set_fb(primary, NULL);
+	igt_plane_set_fb(overlay, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit(&data->display);
+	igt_remove_fb(data->drm_fd, &fb);
+
+	free_lut(degamma_linear);
+	free_lut(gamma_linear);
+
+	return ret;
+}
+
 /*
  * Hardware computes CRC based on the number of bits it is working with (8,
  * 10, 12, 16 bits), meaning with a framebuffer of 8bits per color will
@@ -756,9 +1046,12 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 		bool success = false;
 		int i;
 
-		if (!iter)
+		if (!iter) {
 			success = test_pipe_ctm(data, data->primary, red_green_blue,
 						expected_colors, ctm);
+			success = test_pipe_ctm_multiplane(data, data->primary, red_green_blue,
+						expected_colors, ctm);
+		}
 
 		/*
 		 * We tests a few values around the expected result because
@@ -919,9 +1212,15 @@ run_tests_for_pipe(data_t *data)
 		{ "degamma", test_pipe_degamma,
 		  "Verify that degamma LUT transformation works correctly" },
 
+		{ "degamma_multiplane", test_pipe_degamma_multiplane,
+		  "Verify that degamma LUT transformation works correctly with multiplane" },
+
 		{ "gamma", test_pipe_gamma,
 		  "Verify that gamma LUT transformation works correctly" },
 
+		{ "gamma_multiplane", test_pipe_gamma_multiplane,
+		  "Verify that gamma LUT transformation works correctly with multiplane" },
+
 		{ "legacy-gamma", test_pipe_legacy_gamma,
 		  "Verify that legacy gamma LUT transformation works correctly" },
 
@@ -944,6 +1243,15 @@ run_tests_for_pipe(data_t *data)
 		    1.0, 0.0, 1.0 },
 		  "Check the color transformation from red to blue"
 		},
+		{ "ctm-red-to-blue-multiplane", 0,
+			{{ 0.0, 0.0, 1.0 },
+			 { 0.0, 1.0, 0.0 },
+			 { 0.0, 0.0, 1.0 }},
+		  { 0.0, 0.0, 0.0,
+		    0.0, 1.0, 0.0,
+		    1.0, 0.0, 1.0 },
+		  "Check the color transformation from red to blue"
+		},
 		{ "ctm-green-to-red", 0,
 			{{ 1.0, 0.0, 0.0 },
 			 { 1.0, 0.0, 0.0 },
@@ -953,6 +1261,15 @@ run_tests_for_pipe(data_t *data)
 		    0.0, 0.0, 1.0 },
 		  "Check the color transformation from green to red"
 		},
+		{ "ctm-green-to-red-multiplane", 0,
+			{{ 1.0, 0.0, 0.0 },
+			 { 1.0, 0.0, 0.0 },
+			 { 0.0, 0.0, 1.0 }},
+		  { 1.0, 1.0, 0.0,
+		    0.0, 0.0, 0.0,
+		    0.0, 0.0, 1.0 },
+		  "Check the color transformation from green to red"
+		},
 		{ "ctm-blue-to-red", 0,
 			{{ 1.0, 0.0, 0.0 },
 			 { 0.0, 1.0, 0.0 },
@@ -962,6 +1279,15 @@ run_tests_for_pipe(data_t *data)
 		    0.0, 0.0, 0.0 },
 		  "Check the color transformation from blue to red"
 		},
+		{ "ctm-blue-to-red-multiplane", 0,
+			{{ 1.0, 0.0, 0.0 },
+			 { 0.0, 1.0, 0.0 },
+			 { 1.0, 0.0, 0.0 }},
+		  { 1.0, 0.0, 1.0,
+		    0.0, 1.0, 0.0,
+		    0.0, 0.0, 0.0 },
+		 "Check the color transformation from blue to red"
+		},
 		{ "ctm-max", 0,
 			{{ 1.0, 0.0, 0.0 },
 			 { 0.0, 1.0, 0.0 },
@@ -971,6 +1297,15 @@ run_tests_for_pipe(data_t *data)
 		    0.0, 0.0, 100.0 },
 		  "Check the color transformation for maximum transparency"
 		},
+		{ "ctm-max-multiplane", 0,
+			{{ 1.0, 0.0, 0.0 },
+			 { 0.0, 1.0, 0.0 },
+			 { 0.0, 0.0, 1.0 }},
+		  { 100.0, 0.0, 0.0,
+		    0.0, 100.0, 0.0,
+		    0.0, 0.0, 100.0 },
+		 "Check the color transformation for maximum transparency"
+		},
 		{ "ctm-negative", 0,
 			{{ 0.0, 0.0, 0.0 },
 			 { 0.0, 0.0, 0.0 },
@@ -980,6 +1315,15 @@ run_tests_for_pipe(data_t *data)
 		    0.0, 0.0, -1.0 },
 		  "Check the color transformation for negative transparency"
 		},
+		{ "ctm-negative-multiplane", 0,
+			{{ 0.0, 0.0, 0.0 },
+			 { 0.0, 0.0, 0.0 },
+			 { 0.0, 0.0, 0.0 }},
+		  { -1.0, 0.0, 0.0,
+		    0.0, -1.0, 0.0,
+		    0.0, 0.0, -1.0 },
+		  "Check the color transformation for negative transparency"
+		},
 		{ "ctm-0-25", 5,
 			{{ 0.0, }, { 0.0, }, { 0.0, }},
 		  { 0.25, 0.0,  0.0,
@@ -987,6 +1331,13 @@ run_tests_for_pipe(data_t *data)
 		    0.0,  0.0,  0.25 },
 		  "Check the color transformation for 0.25 transparency"
 		},
+		{ "ctm-0-25-multiplane", 5,
+			{{ 0.0, }, { 0.0, }, { 0.0, }},
+		  { 0.25, 0.0,  0.0,
+		    0.0,  0.25, 0.0,
+		    0.0,  0.0,  0.25 },
+		  "Check the color transformation for 0.25 transparency"
+		},
 		{ "ctm-0-50", 5,
 			{{ 0.0, }, { 0.0, }, { 0.0, }},
 		  { 0.5,  0.0,  0.0,
@@ -994,6 +1345,13 @@ run_tests_for_pipe(data_t *data)
 		    0.0,  0.0,  0.5 },
 		  "Check the color transformation for 0.5 transparency"
 		},
+		{ "ctm-0-50-multiplane", 5,
+			{{ 0.0, }, { 0.0, }, { 0.0, }},
+		  { 0.5,  0.0,  0.0,
+		    0.0,  0.5,  0.0,
+		    0.0,  0.0,  0.5 },
+		  "Check the color transformation for 0.5 transparency"
+		},
 		{ "ctm-0-75", 7,
 			{{ 0.0, }, { 0.0, }, { 0.0, }},
 		  { 0.75, 0.0,  0.0,
@@ -1001,6 +1359,13 @@ run_tests_for_pipe(data_t *data)
 		    0.0,  0.0,  0.75 },
 		  "Check the color transformation for 0.75 transparency"
 		},
+		{ "ctm-0-75-multiplane", 7,
+			{{ 0.0, }, { 0.0, }, { 0.0, }},
+		  { 0.75, 0.0,  0.0,
+		    0.0,  0.75, 0.0,
+		    0.0,  0.0,  0.75 },
+		  "Check the color transformation for 0.75 transparency"
+		},
 	};
 	int i;
 
-- 
2.25.1
