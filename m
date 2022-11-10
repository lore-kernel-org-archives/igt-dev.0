Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CF610E66B
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Nov 2022 07:09:21 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Nov 2022 12:38:28 +0530
Message-Id: <20221110070828.26227-8-ananya.sharma@intel.com>
In-Reply-To: <20221110070828.26227-1-ananya.sharma@intel.com>
References: <20221110070828.26227-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 7/7] tests/chamelium/kms_color_chamelium:
 MPO + pipe color test for ctm
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
NV12 in pipe color test for gamma in kms_color_chamelium too
as we can expect crc mismatches due to the hardware round-ups
the LUT values. This will also increase the coverage in color
management.

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/chamelium/kms_color_chamelium.c | 136 +++++++++++++++++++-------
 1 file changed, 101 insertions(+), 35 deletions(-)

diff --git a/tests/chamelium/kms_color_chamelium.c b/tests/chamelium/kms_color_chamelium.c
index 695cb9ad..6b39ee60 100644
--- a/tests/chamelium/kms_color_chamelium.c
+++ b/tests/chamelium/kms_color_chamelium.c
@@ -287,6 +287,7 @@ static bool test_pipe_gamma(data_t *data,
  */
 static bool test_pipe_ctm(data_t *data,
 			  igt_plane_t *primary,
+			  bool multiplane,
 			  color_t *before,
 			  color_t *after,
 			  double *ctm_matrix,
@@ -294,10 +295,13 @@ static bool test_pipe_ctm(data_t *data,
 {
 	gamma_lut_t *degamma_linear, *gamma_linear;
 	igt_output_t *output = data->output;
+	igt_plane_t *overlay = data->overlay;
 	drmModeModeInfo *mode = data->mode;
-	struct igt_fb fb_modeset, fb, fbref;
+	struct igt_fb fb0, fb1, fbref;
 	struct chamelium_frame_dump *frame_hardware;
-	int fb_id, fb_modeset_id, fbref_id;
+	int fb_id0, fb_id1, fbref_id;
+	int primary_x, primary_y, primary_h, primary_w;
+	int overlay_x, overlay_y, overlay_h, overlay_w;
 	bool ret = true;
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
@@ -307,22 +311,39 @@ static bool test_pipe_ctm(data_t *data,
 
 	igt_output_set_pipe(output, primary->pipe->pipe);
 
+	primary_w = mode->hdisplay;
+	primary_h = mode->vdisplay / 2;
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
+				       data->drm_format_overlay,
+				       DRM_FORMAT_MOD_LINEAR,
+				       &fb1);
+		igt_assert(fb_id1);
+
+		igt_plane_set_fb(overlay, &fb1);
+		igt_plane_set_position(overlay, overlay_x, overlay_y);
+	}
 
 	fbref_id = igt_create_fb(data->drm_fd,
 				 mode->hdisplay,
@@ -332,8 +353,6 @@ static bool test_pipe_ctm(data_t *data,
 				 &fbref);
 	igt_assert(fbref_id);
 
-	igt_plane_set_fb(primary, &fb_modeset);
-
 	if (memcmp(before, after, sizeof(color_t))) {
 		set_degamma(data, primary->pipe, degamma_linear);
 		set_gamma(data, primary->pipe, gamma_linear);
@@ -344,16 +363,24 @@ static bool test_pipe_ctm(data_t *data,
 	}
 
 	disable_ctm(primary->pipe);
-	igt_display_commit(&data->display);
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	paint_rectangles(data, mode->vdisplay, mode->hdisplay,
-			 0, 0, after, &fbref);
+	paint_rectangles(data, primary_h, primary_w, 0, 0, after, &fbref);
+	paint_rectangles(data, overlay_h, overlay_w, 0, 0, after, &fbref);
 
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
 	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
 	frame_hardware =
 		chamelium_read_captured_frame(data->chamelium, 0);
@@ -368,10 +395,13 @@ static bool test_pipe_ctm(data_t *data,
 					     CHAMELIUM_CHECK_ANALOG);
 
 	igt_plane_set_fb(primary, NULL);
+	if (multiplane)
+		igt_plane_set_fb(overlay, NULL);
 	disable_degamma(primary->pipe);
 	disable_gamma(primary->pipe);
+	disable_ctm(primary->pipe);
 	igt_output_set_pipe(output, PIPE_NONE);
-	igt_display_commit(&data->display);
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	free_lut(degamma_linear);
 	free_lut(gamma_linear);
 
@@ -563,10 +593,13 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p, bool multiplane,
 
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
@@ -592,12 +625,29 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
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
-			success = test_pipe_ctm(data, data->primary,
+			success = test_pipe_ctm(data, data->primary, multiplane,
 						red_green_blue,
 						expected_colors, ctm,
 						data->ports[port_idx]);
@@ -613,7 +663,7 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 				expected_colors[1].g =
 				expected_colors[2].b =
 				ctm[0] + delta * (i - (iter / 2));
-			if (test_pipe_ctm(data, data->primary,
+			if (test_pipe_ctm(data, data->primary, multiplane,
 					  red_green_blue, expected_colors,
 					  ctm, data->ports[port_idx])) {
 				success = true;
@@ -667,11 +717,12 @@ run_tests_for_pipe(data_t *data)
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
 			{{ 0.0, 0.0, 1.0 },
 			 { 0.0, 1.0, 0.0 },
 			 { 0.0, 0.0, 1.0 }},
@@ -680,7 +731,16 @@ run_tests_for_pipe(data_t *data)
 		    1.0, 0.0, 1.0 },
 		  "Check the color transformation from red to blue"
 		},
-		{ "ctm-green-to-red", 0,
+		{ "ctm-red-to-blue", 0, false,
+			{{ 0.0, 0.0, 1.0 },
+			 { 0.0, 1.0, 0.0 },
+			 { 0.0, 0.0, 1.0 }},
+		  { 0.0, 0.0, 0.0,
+		    0.0, 1.0, 0.0,
+		    1.0, 0.0, 1.0 },
+		  "Check the color transformation from red to blue"
+		},
+		{ "ctm-green-to-red", 0, false,
 			{{ 1.0, 0.0, 0.0 },
 			 { 1.0, 0.0, 0.0 },
 			 { 0.0, 0.0, 1.0 }},
@@ -689,7 +749,7 @@ run_tests_for_pipe(data_t *data)
 		    0.0, 0.0, 1.0 },
 		  "Check the color transformation from green to red"
 		},
-		{ "ctm-blue-to-red", 0,
+		{ "ctm-blue-to-red", 0, false,
 			{{ 1.0, 0.0, 0.0 },
 			 { 0.0, 1.0, 0.0 },
 			 { 1.0, 0.0, 0.0 }},
@@ -698,7 +758,7 @@ run_tests_for_pipe(data_t *data)
 		    0.0, 0.0, 0.0 },
 		  "Check the color transformation from blue to red"
 		},
-		{ "ctm-max", 0,
+		{ "ctm-max", 0, false,
 			{{ 1.0, 0.0, 0.0 },
 			 { 0.0, 1.0, 0.0 },
 			 { 0.0, 0.0, 1.0 }},
@@ -707,7 +767,7 @@ run_tests_for_pipe(data_t *data)
 		    0.0, 0.0, 100.0 },
 		  "Check the color transformation for maximum transparency"
 		},
-		{ "ctm-negative", 0,
+		{ "ctm-negative", 0, false,
 			{{ 0.0, 0.0, 0.0 },
 			 { 0.0, 0.0, 0.0 },
 			 { 0.0, 0.0, 0.0 }},
@@ -716,21 +776,21 @@ run_tests_for_pipe(data_t *data)
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
@@ -759,8 +819,14 @@ run_tests_for_pipe(data_t *data)
 	for (i = 0; i < ARRAY_SIZE(ctm_tests); i++) {
 		igt_describe_f("%s", ctm_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
+			if (ctm_tests[i].multiplane &&
+			   (!data->display.is_atomic ||
+			    !igt_display_has_format_mod(&data->display, DRM_FORMAT_NV12,
+							DRM_FORMAT_MOD_LINEAR)))
+				continue;
 			for_each_pipe(&data->display, pipe) {
 				run_ctm_tests_for_pipe(data, pipe,
+						       ctm_tests[i].multiplane,
 						       ctm_tests[i].colors,
 						       ctm_tests[i].ctm,
 						       ctm_tests[i].iter);
-- 
2.25.1
