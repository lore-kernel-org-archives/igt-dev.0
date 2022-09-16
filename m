Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF31410E405
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Sep 2022 13:04:07 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 16 Sep 2022 18:28:18 +0530
Message-Id: <20220916125819.516618-7-ananya.sharma@intel.com>
In-Reply-To: <20220916125819.516618-1-ananya.sharma@intel.com>
References: <20220916125819.516618-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 6/7] tests/chamelium/kms_color_chamelium:
 MPO + pipe color test for gamma
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

MPO + pipe color test for gamma transformation.

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/chamelium/kms_color_chamelium.c | 93 ++++++++++++++++++++-------
 1 file changed, 69 insertions(+), 24 deletions(-)

diff --git a/tests/chamelium/kms_color_chamelium.c b/tests/chamelium/kms_color_chamelium.c
index ede9238a..f28a3a5b 100644
--- a/tests/chamelium/kms_color_chamelium.c
+++ b/tests/chamelium/kms_color_chamelium.c
@@ -167,40 +167,69 @@ static bool test_pipe_gamma(data_t *data,
 			    struct chamelium_port *port)
 {
 	igt_output_t *output = data->output;
+	igt_plane_t *overlay;
 	gamma_lut_t *gamma_full;
 	drmModeModeInfo *mode = data->mode;
-	struct igt_fb fb_modeset, fb, fbref;
+	struct igt_fb fb0, fb1, fbref;
 	struct chamelium_frame_dump *frame_fullcolors;
-	int fb_id, fb_modeset_id, fbref_id;
+	int fb_id0, fb_id1, fbref_id;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
 		{ 0.0, 0.0, 1.0 }
 	};
+	color_t blue_red_green[] = {
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 },
+		{ 1.0, 0.0, 0.0 }
+	};
+
+	int primary_x, primary_y, primary_h, primary_w;
+	int overlay_x, overlay_y, overlay_h, overlay_w;
 	bool ret;
 
+	if (multiplane)
+		overlay = igt_pipe_get_plane_type(primary->pipe, DRM_PLANE_TYPE_OVERLAY);
+
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
 	gamma_full = generate_table_max(data->gamma_lut_size);
 
 	igt_output_set_pipe(output, primary->pipe->pipe);
 
+	primary_w = mode->hdisplay;
+	primary_h = mode->vdisplay/2;
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
-			      DRM_FORMAT_XRGB8888,
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
-				      DRM_FORMAT_XRGB8888,
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
+				       data->drm_format,
+				       DRM_FORMAT_MOD_LINEAR,
+				       &fb1);
+		igt_assert(fb_id1);
+
+		igt_plane_set_fb(overlay, &fb1);
+		igt_plane_set_position(overlay, overlay_x, overlay_y);
+	}
 
 	fbref_id = igt_create_fb(data->drm_fd,
 			      mode->hdisplay,
@@ -210,21 +239,31 @@ static bool test_pipe_gamma(data_t *data,
 			      &fbref);
 	igt_assert(fbref_id);
 
-	igt_plane_set_fb(primary, &fbref);
 	disable_ctm(primary->pipe);
 	disable_degamma(primary->pipe);
-	set_gamma(data, primary->pipe, gamma_full);
-	igt_display_commit(&data->display);
+	disable_gamma(primary->pipe);
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 	/* Draw solid colors with no gamma transformation. */
-	paint_rectangles(data, mode->vdisplay, mode->hdisplay, 0, 0, red_green_blue, &fbref);
+	paint_rectangles(data, primary_h, primary_w, 0, 0, red_green_blue, &fbref);
+	paint_rectangles(data, overlay_h, overlay_w, 0, 0, blue_red_green, &fbref);
 
 	/* Draw a gradient with gamma LUT to remap all values
 	 * to max red/green/blue.
 	 */
-	paint_gradient_rectangles(data, mode->vdisplay, mode->hdisplay, 0, 0, red_green_blue, &fb);
-	igt_plane_set_fb(primary, &fb);
-	igt_display_commit(&data->display);
+	paint_gradient_rectangles(data, primary_h, primary_w,
+				  primary_x, primary_y, red_green_blue, &fb0);
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
+
+	if (multiplane) {
+		paint_gradient_rectangles(data, overlay_h, overlay_w, 0, 0, blue_red_green, &fb1);
+		igt_plane_set_fb(overlay, &fb1);
+		igt_plane_set_position(overlay, overlay_x, overlay_y);
+	}
+
+	set_gamma(data, primary->pipe, gamma_full);
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
 	frame_fullcolors =
 		chamelium_read_captured_frame(data->chamelium, 0);
@@ -239,8 +278,10 @@ static bool test_pipe_gamma(data_t *data,
 
 	disable_gamma(primary->pipe);
 	igt_plane_set_fb(primary, NULL);
+	if (multiplane)
+		igt_plane_set_fb(overlay, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
-	igt_display_commit(&data->display);
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	free_lut(gamma_full);
 
 	return ret;
@@ -602,6 +643,10 @@ run_tests_for_pipe(data_t *data)
 
 		{ "gamma", test_pipe_gamma, false,
 		  "Verify that gamma LUT transformation works correctly" },
+
+		{ "gamma-multiplane", test_pipe_gamma, true,
+		  "Verify that gamma LUT transformation works correctly" },
+
 	};
 	struct {
 		const char *name;
-- 
2.25.1
