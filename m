Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668ED10E669
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Nov 2022 07:09:13 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Nov 2022 12:38:24 +0530
Message-Id: <20221110070828.26227-4-ananya.sharma@intel.com>
In-Reply-To: <20221110070828.26227-1-ananya.sharma@intel.com>
References: <20221110070828.26227-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 3/7] tests/kms_color: MPO + pipe color
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
 tests/kms_color.c | 108 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 78 insertions(+), 30 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index c769a23c..3b376922 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -164,6 +164,7 @@ static bool test_pipe_gamma(data_t *data,
 			    igt_plane_t *primary, bool multiplane)
 {
 	igt_output_t *output = data->output;
+	igt_plane_t *overlay = data->overlay;
 	igt_display_t *display = &data->display;
 	gamma_lut_t *gamma_full;
 	color_t red_green_blue[] = {
@@ -171,10 +172,17 @@ static bool test_pipe_gamma(data_t *data,
 		{ 0.0, 1.0, 0.0 },
 		{ 0.0, 0.0, 1.0 }
 	};
+	color_t blue_red_green[] = {
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 },
+		{ 1.0, 0.0, 0.0 }
+	};
 	drmModeModeInfo *mode = data->mode;
-	struct igt_fb fb_modeset, fb;
+	struct igt_fb fb0, fb1;
 	igt_crc_t crc_fullgamma, crc_fullcolors;
-	int fb_id, fb_modeset_id;
+	int fb_id0, fb_id1;
+	int primary_x, primary_y, primary_h, primary_w;
+	int overlay_x, overlay_y, overlay_h, overlay_w;
 	bool ret;
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
@@ -184,34 +192,58 @@ static bool test_pipe_gamma(data_t *data,
 	igt_output_set_pipe(output, primary->pipe->pipe);
 	igt_output_override_mode(output, mode);
 
+	primary_w = mode->hdisplay;
+	primary_h = multiplane ? (mode->vdisplay / 2) : mode->vdisplay;
+	overlay_w = mode->hdisplay;
+	overlay_h = primary_h + (mode->vdisplay % 2);
+	primary_x = 0;
+	primary_y = 0;
+	overlay_x = 0;
+	overlay_y = primary_h;
+
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      data->drm_format,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fb);
-	igt_assert(fb_id);
+	fb_id0 = igt_create_fb(data->drm_fd,
+			       primary_w,
+			       primary_h,
+			       data->drm_format,
+			       DRM_FORMAT_MOD_LINEAR,
+			       &fb0);
+	igt_assert(fb_id0);
 
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      data->drm_format,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
-	igt_assert(fb_modeset_id);
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
+
+	if (multiplane) {
+		fb_id1 = igt_create_fb(data->drm_fd,
+				       overlay_w,
+				       overlay_h,
+				       data->drm_format_overlay,
+				       DRM_FORMAT_MOD_LINEAR,
+				       &fb1);
+		igt_assert(fb_id1);
+
+		igt_plane_set_fb(overlay, &fb1);
+		igt_plane_set_position(overlay, overlay_x, overlay_y);
+	}
 
-	igt_plane_set_fb(primary, &fb_modeset);
 	disable_ctm(primary->pipe);
 	disable_degamma(primary->pipe);
-	set_gamma(data, primary->pipe, gamma_full);
-	igt_display_commit(&data->display);
+	disable_gamma(primary->pipe);
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 	/* Draw solid colors with no gamma transformation. */
-	paint_rectangles(data, mode->vdisplay, mode->hdisplay,
-			 0, 0, red_green_blue, &fb);
-	igt_plane_set_fb(primary, &fb);
-	igt_display_commit(&data->display);
+	paint_rectangles(data, primary_h, primary_w, primary_x,
+			 primary_y, red_green_blue, &fb0);
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
+
+	if (multiplane) {
+		paint_rectangles(data, overlay_h, overlay_w, 0, 0, blue_red_green, &fb1);
+		igt_plane_set_fb(overlay, &fb1);
+		igt_plane_set_position(overlay, overlay_x, overlay_y);
+	}
+
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	igt_wait_for_vblank(data->drm_fd,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
@@ -220,10 +252,20 @@ static bool test_pipe_gamma(data_t *data,
 	 * Draw a gradient with gamma LUT to remap all values
 	 * to max red/green/blue.
 	 */
-	paint_gradient_rectangles(data, mode->vdisplay, mode->hdisplay,
-				  0, 0, red_green_blue, &fb);
-	igt_plane_set_fb(primary, &fb);
-	igt_display_commit(&data->display);
+	paint_gradient_rectangles(data, primary_h, primary_w, primary_x,
+				  primary_y, red_green_blue, &fb0);
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
+
+	if (multiplane) {
+		paint_gradient_rectangles(data, overlay_h, overlay_w,
+					  0, 0, blue_red_green, &fb1);
+		igt_plane_set_fb(overlay, &fb1);
+		igt_plane_set_position(overlay, overlay_x, overlay_y);
+	}
+
+	set_gamma(data, primary->pipe, gamma_full);
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	igt_wait_for_vblank(data->drm_fd,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
@@ -236,10 +278,13 @@ static bool test_pipe_gamma(data_t *data,
 
 	disable_gamma(primary->pipe);
 	igt_plane_set_fb(primary, NULL);
+	if (multiplane)
+		igt_plane_set_fb(overlay, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
-	igt_display_commit(&data->display);
-	igt_remove_fb(data->drm_fd, &fb);
-	igt_remove_fb(data->drm_fd, &fb_modeset);
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
+	igt_remove_fb(data->drm_fd, &fb0);
+	if (multiplane)
+		igt_remove_fb(data->drm_fd, &fb1);
 
 	free_lut(gamma_full);
 
@@ -992,6 +1037,9 @@ run_tests_for_pipe(data_t *data)
 		{ "gamma", test_pipe_gamma, false,
 		  "Verify that gamma LUT transformation works correctly" },
 
+		{ "gamma-multiplane", test_pipe_gamma, true,
+		  "Verify that gamma LUT transformation works correctly for multiplane" },
+
 		{ "legacy-gamma", test_pipe_legacy_gamma, false,
 		  "Verify that legacy gamma LUT transformation works correctly" },
 
-- 
2.25.1
