Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AF510E3F1
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Sep 2022 12:11:20 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 12 Sep 2022 17:35:57 +0530
Message-Id: <20220912120557.163445-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4] tests/kms_color: MPO + pipe color test.
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
 tests/kms_color.c | 468 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 468 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index c202547e..d4492d70 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -114,6 +114,134 @@ static bool test_pipe_degamma(data_t *data,
 	return ret;
 }
 
+static bool test_pipe_degamma_multiplane(data_t *data,
+					 igt_plane_t *primary)
+{
+	igt_output_t *output = data->output;
+	igt_plane_t *overlay;
+	igt_display_t *display = &data->display;
+	gamma_lut_t *degamma_full;
+	color_t red_green_blue[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+
+	color_t blue_red_green[] = {
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 },
+		{ 1.0, 0.0, 0.0 }
+	};
+
+	drmModeModeInfo *mode = data->mode;
+	struct igt_fb fb0, fb1;
+	igt_crc_t crc_fullgamma, crc_fullcolors;
+	int fb_id0, fb_id1;
+	int primary_x, primary_y, primary_h, primary_w;
+	int overlay_x, overlay_y, overlay_h, overlay_w;
+	bool ret;
+
+	overlay = igt_pipe_get_plane_type(primary->pipe, DRM_PLANE_TYPE_OVERLAY);
+
+	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
+	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
+
+	degamma_full = generate_table_max(data->degamma_lut_size);
+
+	igt_output_set_pipe(output, primary->pipe->pipe);
+	igt_output_override_mode(output, mode);
+
+	primary_w = mode->hdisplay;
+	primary_h = mode->vdisplay / 2;
+	overlay_w = mode->hdisplay;
+	overlay_h = primary_h + (mode->vdisplay % 2);
+
+	primary_x = 0;
+	primary_y = 0;
+	overlay_x = 0;
+	overlay_y = primary_h + 1;
+
+	/* Create a framebuffer at the size of the output. */
+	fb_id0 = igt_create_fb(data->drm_fd,
+			       primary_w,
+			       primary_h,
+			       data->drm_format,
+			       DRM_FORMAT_MOD_LINEAR,
+			       &fb0);
+	igt_assert(fb_id0);
+
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
+
+	fb_id1 = igt_create_fb(data->drm_fd,
+			       overlay_w,
+			       overlay_h,
+			       data->drm_format,
+			       DRM_FORMAT_MOD_LINEAR,
+			       &fb1);
+	igt_assert(fb_id1);
+
+	igt_plane_set_fb(overlay, &fb1);
+	igt_plane_set_position(overlay, overlay_x, overlay_y);
+
+	disable_ctm(primary->pipe);
+	disable_gamma(primary->pipe);
+	disable_degamma(primary->pipe);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	/* Draw solid colors with no degamma transformation. */
+	paint_rectangles(data, mode, red_green_blue, &fb0);
+	paint_rectangles(data, mode, blue_red_green, &fb1);
+
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
+
+	igt_plane_set_fb(overlay, &fb1);
+	igt_plane_set_position(overlay, overlay_x, overlay_y);
+
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
+
+	/*
+	 * Draw a gradient with degamma LUT to remap all
+	 * values to max red/green/blue.
+	 */
+	paint_gradient_rectangles(data, mode, red_green_blue, &fb0);
+	paint_gradient_rectangles(data, mode, blue_red_green, &fb1);
+
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
+
+	igt_plane_set_fb(overlay, &fb1);
+	igt_plane_set_position(overlay, overlay_x, overlay_y);
+
+	set_degamma(data, primary->pipe, degamma_full);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
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
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_remove_fb(data->drm_fd, &fb0);
+	igt_remove_fb(data->drm_fd, &fb1);
+
+	free_lut(degamma_full);
+
+	return ret;
+}
+
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out gamma
  * LUT and verify we have the same CRC as drawing solid color rectangles.
@@ -202,6 +330,134 @@ static bool test_pipe_gamma(data_t *data,
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
+
+	color_t blue_red_green[] = {
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 },
+		{ 1.0, 0.0, 0.0 }
+	};
+
+	drmModeModeInfo *mode = data->mode;
+	struct igt_fb fb0, fb1;
+	igt_crc_t crc_fullgamma, crc_fullcolors;
+	int fb_id0, fb_id1;
+	int primary_x, primary_y, primary_h, primary_w;
+	int overlay_x, overlay_y, overlay_h, overlay_w;
+	bool ret;
+
+	overlay = igt_pipe_get_plane_type(primary->pipe, DRM_PLANE_TYPE_OVERLAY);
+
+	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
+
+	gamma_full = generate_table_max(data->gamma_lut_size);
+
+	igt_output_set_pipe(output, primary->pipe->pipe);
+	igt_output_override_mode(output, mode);
+
+	primary_w = mode->hdisplay;
+	primary_h = mode->vdisplay / 2;
+	overlay_w = mode->hdisplay;
+	overlay_h = primary_h + (mode->vdisplay % 2);
+
+	primary_x = 0;
+	primary_y = 0;
+	overlay_x = 0;
+	overlay_y = primary_h + 1;
+
+	/* Create a framebuffer at the size of the output. */
+	fb_id0 = igt_create_fb(data->drm_fd,
+			       primary_w,
+			       primary_h,
+			       data->drm_format,
+			       DRM_FORMAT_MOD_LINEAR,
+			       &fb0);
+	igt_assert(fb_id0);
+
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
+
+	fb_id1 = igt_create_fb(data->drm_fd,
+			       overlay_w,
+			       overlay_h,
+			       data->drm_format,
+			       DRM_FORMAT_MOD_LINEAR,
+			       &fb1);
+	igt_assert(fb_id1);
+
+	igt_plane_set_fb(overlay, &fb1);
+	igt_plane_set_position(overlay, overlay_x, overlay_y);
+
+	disable_ctm(primary->pipe);
+	disable_degamma(primary->pipe);
+	disable_gamma(primary->pipe);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	/* Draw solid colors with no gamma transformation. */
+	paint_rectangles(data, mode, red_green_blue, &fb0);
+	paint_rectangles(data, mode, blue_red_green, &fb1);
+
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
+
+	igt_plane_set_fb(overlay, &fb0);
+	igt_plane_set_position(overlay, overlay_x, overlay_y);
+
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
+
+	/*
+	 * Draw a gradient with gamma LUT to remap all values
+	 * to max red/green/blue.
+	 */
+	paint_gradient_rectangles(data, mode, red_green_blue, &fb0);
+	paint_gradient_rectangles(data, mode, blue_red_green, &fb1);
+
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
+
+	igt_plane_set_fb(overlay, &fb1);
+	igt_plane_set_position(overlay, overlay_x, overlay_y);
+
+	set_gamma(data, primary->pipe, gamma_full);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
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
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	igt_remove_fb(data->drm_fd, &fb0);
+	igt_remove_fb(data->drm_fd, &fb1);
+
+	free_lut(gamma_full);
+
+	return ret;
+}
+
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out legacy
  * gamma LUT and verify we have the same CRC as drawing solid color rectangles
@@ -548,6 +804,139 @@ static bool test_pipe_ctm(data_t *data,
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
+		0.0, 0.0, 1.0,
+	};
+
+	igt_plane_t *overlay;
+	gamma_lut_t *degamma_linear, *gamma_linear;
+	igt_output_t *output = data->output;
+	bool ret = true;
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode = data->mode;
+	struct igt_fb fb0, fb1;
+	igt_crc_t crc_software, crc_hardware;
+	int fb_id0, fb_id1;
+	int primary_x, primary_y, primary_h, primary_w;
+	int overlay_x, overlay_y, overlay_h, overlay_w;
+
+	overlay = igt_pipe_get_plane_type(primary->pipe, DRM_PLANE_TYPE_OVERLAY);
+
+	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
+
+	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
+	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
+
+	igt_output_set_pipe(output, primary->pipe->pipe);
+	igt_output_override_mode(output, mode);
+
+	primary_w = mode->hdisplay;
+	primary_h = mode->vdisplay / 2;
+	overlay_w = mode->hdisplay;
+	overlay_h = primary_h + (mode->vdisplay % 2);
+
+	primary_x = 0;
+	primary_y = 0;
+	overlay_x = 0;
+	overlay_y = primary_h + 1;
+
+	/* Create a framebuffer at the size of the output. */
+	fb_id0 = igt_create_fb(data->drm_fd,
+			       primary_w,
+			       primary_h,
+			       data->drm_format,
+			       DRM_FORMAT_MOD_LINEAR,
+			       &fb0);
+	igt_assert(fb_id0);
+
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
+
+	fb_id1 = igt_create_fb(data->drm_fd,
+			       overlay_w,
+			       overlay_h,
+			       data->drm_format,
+			       DRM_FORMAT_MOD_LINEAR,
+			       &fb1);
+	igt_assert(fb_id1);
+
+	igt_plane_set_fb(primary, &fb1);
+	igt_plane_set_position(overlay, overlay_x, overlay_y);
+
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
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	paint_rectangles(data, mode, after, &fb0);
+	paint_rectangles(data, mode, before, &fb1);
+
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
+
+	igt_plane_set_fb(overlay, &fb1);
+	igt_plane_set_position(overlay, overlay_x, overlay_y);
+
+	set_ctm(primary->pipe, ctm_identity);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_software);
+
+	/* With CTM transformation. */
+	paint_rectangles(data, mode, after, &fb0);
+	paint_rectangles(data, mode, before, &fb1);
+
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
+
+	igt_plane_set_fb(overlay, &fb1);
+	igt_plane_set_position(overlay, overlay_x, overlay_y);
+
+	set_ctm(primary->pipe, ctm_matrix);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
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
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_remove_fb(data->drm_fd, &fb0);
+	igt_remove_fb(data->drm_fd, &fb1);
+
+	free_lut(degamma_linear);
+	free_lut(gamma_linear);
+
+	return ret;
+}
 /*
  * Hardware computes CRC based on the number of bits it is working with (8,
  * 10, 12, 16 bits), meaning with a framebuffer of 8bits per color will
@@ -777,6 +1166,22 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 				break;
 			}
 		}
+
+		if (!iter)
+			success = test_pipe_ctm_multiplane(data, data->primary, red_green_blue,
+							   expected_colors, ctm);
+
+		for (i = 0; i < iter; i++) {
+			expected_colors[0].r =
+				expected_colors[1].g =
+				expected_colors[2].b =
+				0.5 + delta * (i - 2);
+			if (test_pipe_ctm_multiplane(data, data->primary, red_green_blue,
+						     expected_colors, ctm)) {
+				success = true;
+				break;
+			}
+		}
 		igt_assert(success);
 	}
 
@@ -919,9 +1324,15 @@ run_tests_for_pipe(data_t *data)
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
 
@@ -944,6 +1355,15 @@ run_tests_for_pipe(data_t *data)
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
@@ -953,6 +1373,15 @@ run_tests_for_pipe(data_t *data)
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
+		 "Check the color transformation from green to red"
+		},
 		{ "ctm-blue-to-red", 0,
 			{{ 1.0, 0.0, 0.0 },
 			 { 0.0, 1.0, 0.0 },
@@ -962,6 +1391,15 @@ run_tests_for_pipe(data_t *data)
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
+		  "Check the color transformation from blue to red"
+		},
 		{ "ctm-max", 0,
 			{{ 1.0, 0.0, 0.0 },
 			 { 0.0, 1.0, 0.0 },
@@ -971,6 +1409,15 @@ run_tests_for_pipe(data_t *data)
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
+		  "Check the color transformation for maximum transparency"
+		},
 		{ "ctm-negative", 0,
 			{{ 0.0, 0.0, 0.0 },
 			 { 0.0, 0.0, 0.0 },
@@ -987,6 +1434,13 @@ run_tests_for_pipe(data_t *data)
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
@@ -994,6 +1448,13 @@ run_tests_for_pipe(data_t *data)
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
@@ -1001,6 +1462,13 @@ run_tests_for_pipe(data_t *data)
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
