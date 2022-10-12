Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544F210E4A8
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Oct 2022 12:35:04 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Oct 2022 18:04:43 +0530
Message-Id: <20221012123446.30393-5-ananya.sharma@intel.com>
In-Reply-To: <20221012123446.30393-1-ananya.sharma@intel.com>
References: <20221012123446.30393-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/7] tests/kms_color: Ctm MPO + pipe color
 test
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

MPO + pipe color test for ctm transformation.

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_color.c | 169 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 126 insertions(+), 43 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index e68f4dce..bc836d56 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -535,6 +535,7 @@ end:
  */
 static bool test_pipe_ctm(data_t *data,
 			  igt_plane_t *primary,
+			  bool multiplane,
 			  color_t *before,
 			  color_t *after,
 			  double *ctm_matrix)
@@ -544,14 +545,17 @@ static bool test_pipe_ctm(data_t *data,
 		0.0, 1.0, 0.0,
 		0.0, 0.0, 1.0
 	};
+	igt_plane_t *overlay = data->overlay;
 	gamma_lut_t *degamma_linear, *gamma_linear;
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
 
@@ -561,23 +565,39 @@ static bool test_pipe_ctm(data_t *data,
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
-	igt_plane_set_fb(primary, &fb_modeset);
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
 
 	/*
 	 * Don't program LUT's for max CTM cases, as limitation of
@@ -594,21 +614,37 @@ static bool test_pipe_ctm(data_t *data,
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
 
-	paint_rectangles(data, mode->vdisplay, mode->hdisplay, 0, 0, after, &fb);
-	igt_plane_set_fb(primary, &fb);
 	set_ctm(primary->pipe, ctm_identity);
-	igt_display_commit(&data->display);
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	igt_wait_for_vblank(data->drm_fd,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_software);
 
 	/* With CTM transformation. */
-	paint_rectangles(data, mode->vdisplay, mode->hdisplay, 0, 0, before, &fb);
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
@@ -619,11 +655,18 @@ static bool test_pipe_ctm(data_t *data,
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
@@ -814,7 +857,8 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p, bool multiplane,
 			    overlay->type == DRM_PLANE_TYPE_CURSOR)
 				continue;
 
-			if (igt_plane_has_format_mod(overlay, DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR)) {
+			if (igt_plane_has_format_mod(overlay, DRM_FORMAT_NV12,
+						     DRM_FORMAT_MOD_LINEAR)) {
 				count++;
 				break;
 			}
@@ -833,10 +877,13 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p, bool multiplane,
 
 static void
 run_ctm_tests_for_pipe(data_t *data, enum pipe p,
+		       bool multiplane,
 		       color_t *expected_colors,
 		       double *ctm,
 		       int iter)
 {
+	igt_plane_t *overlay;
+	int count;
 	double delta;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
@@ -855,13 +902,31 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
+	if (multiplane) {
+		for_each_plane_on_pipe(&data->display, p, overlay) {
+			if (overlay->type == DRM_PLANE_TYPE_PRIMARY ||
+			    overlay->type == DRM_PLANE_TYPE_CURSOR)
+				continue;
+
+			if (igt_plane_has_format_mod(overlay, DRM_FORMAT_NV12,
+						     DRM_FORMAT_MOD_LINEAR)) {
+				count++;
+				break;
+			}
+		}
+	}
+	igt_require_f(count, "No valid planes found.\n");
+
+	data->overlay = overlay;
+	data->drm_format_overlay = DRM_FORMAT_NV12;
+
 	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name) {
 		bool success = false;
 		int i;
 
 		if (!iter)
-			success = test_pipe_ctm(data, data->primary, red_green_blue,
-						expected_colors, ctm);
+			success = test_pipe_ctm(data, data->primary, multiplane,
+						red_green_blue, expected_colors, ctm);
 
 		/*
 		 * We tests a few values around the expected result because
@@ -874,8 +939,8 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 				expected_colors[1].g =
 				expected_colors[2].b =
 				ctm[0] + delta * (i - (iter / 2));
-			if (test_pipe_ctm(data, data->primary, red_green_blue,
-					  expected_colors, ctm)) {
+			if (test_pipe_ctm(data, data->primary, multiplane,
+					  red_green_blue, expected_colors, ctm)) {
 				success = true;
 				break;
 			}
@@ -961,7 +1026,7 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 			igt_display_reset(&data->display);
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 
-			ret = test_pipe_ctm(data, data->primary,
+			ret = test_pipe_ctm(data, data->primary, false,
 					    red_green_blue,
 					    blue_green_blue, ctm);
 
@@ -1041,11 +1106,21 @@ run_tests_for_pipe(data_t *data)
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
+		  "Check the color transformation from red to blue in multiplane "
+		},
+		{ "ctm-red-to-blue", 0, false,
 			{{ 0.0, 0.0, 1.0 },
 			 { 0.0, 1.0, 0.0 },
 			 { 0.0, 0.0, 1.0 }},
@@ -1054,7 +1129,7 @@ run_tests_for_pipe(data_t *data)
 		    1.0, 0.0, 1.0 },
 		  "Check the color transformation from red to blue"
 		},
-		{ "ctm-green-to-red", 0,
+		{ "ctm-green-to-red", 0, false,
 			{{ 1.0, 0.0, 0.0 },
 			 { 1.0, 0.0, 0.0 },
 			 { 0.0, 0.0, 1.0 }},
@@ -1063,7 +1138,7 @@ run_tests_for_pipe(data_t *data)
 		    0.0, 0.0, 1.0 },
 		  "Check the color transformation from green to red"
 		},
-		{ "ctm-blue-to-red", 0,
+		{ "ctm-blue-to-red", 0, false,
 			{{ 1.0, 0.0, 0.0 },
 			 { 0.0, 1.0, 0.0 },
 			 { 1.0, 0.0, 0.0 }},
@@ -1072,7 +1147,7 @@ run_tests_for_pipe(data_t *data)
 		    0.0, 0.0, 0.0 },
 		  "Check the color transformation from blue to red"
 		},
-		{ "ctm-max", 0,
+		{ "ctm-max", 0, false,
 			{{ 1.0, 0.0, 0.0 },
 			 { 0.0, 1.0, 0.0 },
 			 { 0.0, 0.0, 1.0 }},
@@ -1081,7 +1156,7 @@ run_tests_for_pipe(data_t *data)
 		    0.0, 0.0, 100.0 },
 		  "Check the color transformation for maximum transparency"
 		},
-		{ "ctm-negative", 0,
+		{ "ctm-negative", 0, false,
 			{{ 0.0, 0.0, 0.0 },
 			 { 0.0, 0.0, 0.0 },
 			 { 0.0, 0.0, 0.0 }},
@@ -1090,21 +1165,21 @@ run_tests_for_pipe(data_t *data)
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
@@ -1118,8 +1193,9 @@ run_tests_for_pipe(data_t *data)
 		igt_describe_f("%s", gamma_degamma_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", gamma_degamma_tests[i].name) {
 			if (gamma_degamma_tests[i].multiplane &&
-			    (!data->display.is_atomic ||
-			     !igt_display_has_format_mod(&data->display, DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR)))
+			   (!data->display.is_atomic || !igt_display_has_format_mod(&data->display,
+										    DRM_FORMAT_NV12,
+										    DRM_FORMAT_MOD_LINEAR)))
 			    continue;
 
 			for_each_pipe(&data->display, pipe) {
@@ -1133,8 +1209,15 @@ run_tests_for_pipe(data_t *data)
 	for (i = 0; i < ARRAY_SIZE(ctm_tests); i++) {
 		igt_describe_f("%s", ctm_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
+			if (ctm_tests[i].multiplane &&
+			   (!data->display.is_atomic || !igt_display_has_format_mod(&data->display,
+										    DRM_FORMAT_NV12,
+										    DRM_FORMAT_MOD_LINEAR)))
+			    continue;
+
 			for_each_pipe(&data->display, pipe) {
 				run_ctm_tests_for_pipe(data, pipe,
+						       ctm_tests[i].multiplane,
 						       ctm_tests[i].colors,
 						       ctm_tests[i].ctm,
 						       ctm_tests[i].iter);
-- 
2.25.1
