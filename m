Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C9510E1E6
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Mar 2023 19:12:07 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Mar 2023 00:40:49 +0530
Message-Id: <20230306191050.25936-4-ananya.sharma@intel.com>
In-Reply-To: <20230306191050.25936-1-ananya.sharma@intel.com>
References: <20230306191050.25936-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 3/4] tests/kms_color: MPO + pipe color
 test for gamma
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

Adding multiple planes with two different formats i.e. RGB and
NV12 in pipe color test for gamma. This will increase the YUV
coverage in color management.

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_color.c | 123 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index c925336f..c3eac587 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -324,6 +324,126 @@ static bool test_pipe_gamma(data_t *data,
 	return ret;
 }
 
+static bool test_pipe_multiplane_gamma(data_t *data,
+				       igt_plane_t *primary, bool multiplane)
+{
+	igt_output_t *output = data->output;
+	igt_plane_t *overlay = data->overlay;
+	igt_display_t *display = &data->display;
+	gamma_lut_t *gamma_full;
+	color_t red_green_blue[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+	color_t blue_red_green[] = {
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 },
+		{ 1.0, 0.0, 0.0 }
+	};
+	drmModeModeInfo *mode = data->mode;
+	struct igt_fb fb0, fb1;
+	igt_crc_t crc_fullgamma, crc_fullcolors;
+	int fb_id0, fb_id1;
+	int primary_x, primary_y, primary_h, primary_w;
+	int overlay_x, overlay_y, overlay_h, overlay_w;
+	bool ret;
+
+	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
+
+	gamma_full = generate_table_max(data->gamma_lut_size);
+
+	igt_output_set_pipe(output, primary->pipe->pipe);
+	igt_output_override_mode(output, mode);
+
+	primary_w = mode->hdisplay;
+	primary_h = multiplane ? (mode->vdisplay / 2) : mode->vdisplay;
+	overlay_w = mode->hdisplay;
+	overlay_h = primary_h + (mode->vdisplay % 2);
+	primary_x = 0;
+	primary_y = 0;
+	overlay_x = 0;
+	overlay_y = primary_h;
+
+	/* Create a framebuffer at the size of the output. */
+	fb_id0 = igt_create_fb(data->drm_fd,
+			       primary_w,
+			       primary_h,
+			       data->drm_format,
+			       DRM_FORMAT_MOD_LINEAR,
+			       &fb0);
+	igt_assert(fb_id0);
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
+
+	fb_id1 = igt_create_fb(data->drm_fd,
+			       overlay_w,
+			       overlay_h,
+			       data->drm_format_overlay,
+			       DRM_FORMAT_MOD_LINEAR,
+			       &fb1);
+	igt_assert(fb_id1);
+	igt_plane_set_fb(overlay, &fb1);
+	igt_plane_set_position(overlay, overlay_x, overlay_y);
+
+	disable_ctm(primary->pipe);
+	disable_degamma(primary->pipe);
+	disable_gamma(primary->pipe);
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	/* Draw solid colors with no gamma transformation. */
+	paint_rectangles(data, primary_h, primary_w, primary_x,
+			 primary_y, red_green_blue, &fb0);
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
+
+	paint_rectangles(data, overlay_h, overlay_w, 0, 0, blue_red_green, &fb1);
+	igt_plane_set_fb(overlay, &fb1);
+	igt_plane_set_position(overlay, overlay_x, overlay_y);
+
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
+
+	/*
+	 * Draw a gradient with gamma LUT to remap all values
+	 * to max red/green/blue.
+	 */
+	paint_gradient_rectangles(data, primary_h, primary_w, primary_x,
+				  primary_y, red_green_blue, &fb0);
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
+
+	paint_gradient_rectangles(data, overlay_h, overlay_w,
+				  0, 0, blue_red_green, &fb1);
+	igt_plane_set_fb(overlay, &fb1);
+	igt_plane_set_position(overlay, overlay_x, overlay_y);
+	set_gamma(data, primary->pipe, gamma_full);
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
+
+	/*
+	 * Verify that the CRC of the software computed output is
+	 * equal to the CRC of the gamma LUT transformation output.
+	 */
+	ret = igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
+
+	disable_gamma(primary->pipe);
+	igt_plane_set_fb(primary, NULL);
+	igt_plane_set_fb(overlay, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
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
@@ -1074,6 +1194,9 @@ run_tests_for_pipe(data_t *data)
 		{ "gamma", test_pipe_gamma, false,
 		  "Verify that gamma LUT transformation works correctly" },
 
+		{ "gamma-multiplane", test_pipe_multiplane_gamma, true,
+		  "Verify that gamma LUT transformation works correctly for multiplane" },
+
 		{ "legacy-gamma", test_pipe_legacy_gamma, false,
 		  "Verify that legacy gamma LUT transformation works correctly" },
 
-- 
2.25.1
