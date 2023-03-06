Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A2110E42E
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Mar 2023 19:12:08 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Mar 2023 00:40:50 +0530
Message-Id: <20230306191050.25936-5-ananya.sharma@intel.com>
In-Reply-To: <20230306191050.25936-1-ananya.sharma@intel.com>
References: <20230306191050.25936-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 4/4] tests/kms_color: MPO + pipe color
 test for ctm
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

Adding multiple planes with two different formats i.e. RGB and NV12 in
pipe color test for ctm. This will increase the YUV coverage in color
management.

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_color.c | 155 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 115 insertions(+), 40 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index c3eac587..0762453f 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -698,6 +698,7 @@ end:
  */
 static bool test_pipe_ctm(data_t *data,
 			  igt_plane_t *primary,
+			  bool multiplane,
 			  color_t *before,
 			  color_t *after,
 			  double *ctm_matrix)
@@ -707,37 +708,55 @@ static bool test_pipe_ctm(data_t *data,
 		0.0, 1.0, 0.0,
 		0.0, 0.0, 1.0
 	};
+	igt_plane_t *overlay = data->overlay;
 	gamma_lut_t *degamma_linear = NULL, *gamma_linear = NULL;
 	igt_output_t *output = data->output;
 	bool ret = true;
 	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode = data->mode;
-	struct igt_fb fb_modeset, fb;
+	struct igt_fb fb0, fb1;
 	igt_crc_t crc_software, crc_hardware;
-	int fb_id, fb_modeset_id;
+	int fb_id0, fb_id1;
+	int primary_x, primary_y, primary_h, primary_w;
+	int overlay_x, overlay_y, overlay_h, overlay_w;
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
 
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
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
 
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      data->drm_format,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
-	igt_assert(fb_modeset_id);
-	igt_plane_set_fb(primary, &fb_modeset);
+	if (multiplane) {
+		fb_id1 = igt_create_fb(data->drm_fd,
+				       overlay_w,
+				       overlay_h,
+				       data->drm_format_overlay,
+			       DRM_FORMAT_MOD_LINEAR,
+				       &fb1);
+		igt_assert(fb_id1);
+
+		igt_plane_set_fb(overlay, &fb1);
+		igt_plane_set_position(overlay, overlay_x, overlay_y);
+	}
 
 	disable_degamma(primary->pipe);
 	disable_gamma(primary->pipe);
@@ -759,23 +778,37 @@ static bool test_pipe_ctm(data_t *data,
 	}
 
 	disable_ctm(primary->pipe);
-	igt_display_commit(&data->display);
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	paint_rectangles(data, primary_h, primary_w, primary_x, primary_y, after, &fb0);
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
+
+	if (multiplane) {
+		paint_rectangles(data, overlay_h, overlay_w, 0, 0, after, &fb1);
+		igt_plane_set_fb(overlay, &fb1);
+		igt_plane_set_position(overlay, overlay_x, overlay_y);
+	}
 
-	paint_rectangles(data, mode->vdisplay, mode->hdisplay,
-			 0, 0, after, &fb);
-	igt_plane_set_fb(primary, &fb);
 	set_ctm(primary->pipe, ctm_identity);
-	igt_display_commit(&data->display);
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	igt_wait_for_vblank(data->drm_fd,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_software);
 
 	/* With CTM transformation. */
-	paint_rectangles(data, mode->vdisplay, mode->hdisplay,
-			 0, 0, before, &fb);
-	igt_plane_set_fb(primary, &fb);
+	paint_rectangles(data, primary_h, primary_w, primary_x, primary_y, before, &fb0);
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
+
+	if (multiplane) {
+		paint_rectangles(data, overlay_h, overlay_w, 0, 0, before, &fb1);
+		igt_plane_set_fb(overlay, &fb1);
+		igt_plane_set_position(overlay, overlay_x, overlay_y);
+	}
+
 	set_ctm(primary->pipe, ctm_matrix);
-	igt_display_commit(&data->display);
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	igt_wait_for_vblank(data->drm_fd,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hardware);
@@ -786,11 +819,18 @@ static bool test_pipe_ctm(data_t *data,
 	 */
 	ret &= igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &crc_hardware);
 
+	disable_degamma(primary->pipe);
+	disable_gamma(primary->pipe);
+	disable_ctm(primary->pipe);
+
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
 
 	free_lut(degamma_linear);
 	free_lut(gamma_linear);
@@ -998,10 +1038,13 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p, bool multiplane,
 
 static void
 run_ctm_tests_for_pipe(data_t *data, enum pipe p,
+		       bool multiplane,
 		       color_t *expected_colors,
 		       double *ctm,
 		       int iter)
 {
+	igt_plane_t *overlay;
+	int count = 0;
 	double delta;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
@@ -1020,12 +1063,29 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
+	if (multiplane) {
+		for_each_plane_on_pipe(&data->display, p, overlay) {
+			if (overlay->type != DRM_PLANE_TYPE_OVERLAY)
+				continue;
+
+			if (igt_plane_has_format_mod(overlay, DRM_FORMAT_NV12,
+						     DRM_FORMAT_MOD_LINEAR)) {
+				count++;
+				break;
+			}
+		}
+		igt_require_f(count, "No valid planes found.\n");
+	}
+
+	data->overlay = overlay;
+	data->drm_format_overlay = DRM_FORMAT_NV12;
+
 	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name) {
 		bool success = false;
 		int i;
 
 		if (!iter)
-			success = test_pipe_ctm(data, data->primary, red_green_blue,
+			success = test_pipe_ctm(data, data->primary, multiplane, red_green_blue,
 						expected_colors, ctm);
 
 		/*
@@ -1039,7 +1099,7 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 				expected_colors[1].g =
 				expected_colors[2].b =
 				ctm[0] + delta * (i - (iter / 2));
-			if (test_pipe_ctm(data, data->primary, red_green_blue,
+			if (test_pipe_ctm(data, data->primary, multiplane, red_green_blue,
 					  expected_colors, ctm)) {
 				success = true;
 				break;
@@ -1126,7 +1186,7 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 			igt_display_reset(&data->display);
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 
-			ret = test_pipe_ctm(data, data->primary,
+			ret = test_pipe_ctm(data, data->primary, false,
 					    red_green_blue,
 					    blue_green_blue, ctm);
 
@@ -1206,11 +1266,21 @@ run_tests_for_pipe(data_t *data)
 	struct {
 		const char *name;
 		int iter;
+		bool multiplane;
 		color_t colors[3];
 		double ctm[9];
 		const char *desc;
 	} ctm_tests[] = {
-		{ "ctm-red-to-blue", 0,
+		{ "ctm-multiplane", 0, true,
+			{{ 0.0, 0.0, 1.0 },
+			 { 0.0, 1.0, 0.0 },
+			 { 0.0, 0.0, 1.0 }},
+		  { 0.0, 0.0, 0.0,
+		    0.0, 1.0, 0.0,
+		    1.0, 0.0, 1.0 },
+		"Check the color transformation from red to blue"
+		},
+		{ "ctm-red-to-blue", 0, false,
 			{{ 0.0, 0.0, 1.0 },
 			 { 0.0, 1.0, 0.0 },
 			 { 0.0, 0.0, 1.0 }},
@@ -1219,7 +1289,7 @@ run_tests_for_pipe(data_t *data)
 		    1.0, 0.0, 1.0 },
 		  "Check the color transformation from red to blue"
 		},
-		{ "ctm-green-to-red", 0,
+		{ "ctm-green-to-red", 0, false,
 			{{ 1.0, 0.0, 0.0 },
 			 { 1.0, 0.0, 0.0 },
 			 { 0.0, 0.0, 1.0 }},
@@ -1228,7 +1298,7 @@ run_tests_for_pipe(data_t *data)
 		    0.0, 0.0, 1.0 },
 		  "Check the color transformation from green to red"
 		},
-		{ "ctm-blue-to-red", 0,
+		{ "ctm-blue-to-red", 0, false,
 			{{ 1.0, 0.0, 0.0 },
 			 { 0.0, 1.0, 0.0 },
 			 { 1.0, 0.0, 0.0 }},
@@ -1237,7 +1307,7 @@ run_tests_for_pipe(data_t *data)
 		    0.0, 0.0, 0.0 },
 		  "Check the color transformation from blue to red"
 		},
-		{ "ctm-max", 0,
+		{ "ctm-max", 0, false,
 			{{ 1.0, 0.0, 0.0 },
 			 { 0.0, 1.0, 0.0 },
 			 { 0.0, 0.0, 1.0 }},
@@ -1246,7 +1316,7 @@ run_tests_for_pipe(data_t *data)
 		    0.0, 0.0, 100.0 },
 		  "Check the color transformation for maximum transparency"
 		},
-		{ "ctm-negative", 0,
+		{ "ctm-negative", 0, false,
 			{{ 0.0, 0.0, 0.0 },
 			 { 0.0, 0.0, 0.0 },
 			 { 0.0, 0.0, 0.0 }},
@@ -1255,21 +1325,21 @@ run_tests_for_pipe(data_t *data)
 		    0.0, 0.0, -1.0 },
 		  "Check the color transformation for negative transparency"
 		},
-		{ "ctm-0-25", 5,
+		{ "ctm-0-25", 5, false,
 			{{ 0.0, }, { 0.0, }, { 0.0, }},
 		  { 0.25, 0.0,  0.0,
 		    0.0,  0.25, 0.0,
 		    0.0,  0.0,  0.25 },
 		  "Check the color transformation for 0.25 transparency"
 		},
-		{ "ctm-0-50", 5,
+		{ "ctm-0-50", 5, false,
 			{{ 0.0, }, { 0.0, }, { 0.0, }},
 		  { 0.5,  0.0,  0.0,
 		    0.0,  0.5,  0.0,
 		    0.0,  0.0,  0.5 },
 		  "Check the color transformation for 0.5 transparency"
 		},
-		{ "ctm-0-75", 7,
+		{ "ctm-0-75", 7, false,
 			{{ 0.0, }, { 0.0, }, { 0.0, }},
 		  { 0.75, 0.0,  0.0,
 		    0.0,  0.75, 0.0,
@@ -1297,8 +1367,13 @@ run_tests_for_pipe(data_t *data)
 	for (i = 0; i < ARRAY_SIZE(ctm_tests); i++) {
 		igt_describe_f("%s", ctm_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
+			if (ctm_tests[i].multiplane &&
+			   (!data->display.is_atomic ||
+			    !igt_display_has_format_mod(&data->display, DRM_FORMAT_NV12,
+							DRM_FORMAT_MOD_LINEAR)))
 			for_each_pipe(&data->display, pipe) {
 				run_ctm_tests_for_pipe(data, pipe,
+						       ctm_tests[i].multiplane,
 						       ctm_tests[i].colors,
 						       ctm_tests[i].ctm,
 						       ctm_tests[i].iter);
-- 
2.25.1
