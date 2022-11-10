Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5D410E667
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Nov 2022 05:54:17 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Nov 2022 11:23:27 +0530
Message-Id: <20221110055332.25302-3-ananya.sharma@intel.com>
In-Reply-To: <20221110055332.25302-1-ananya.sharma@intel.com>
References: <20221110055332.25302-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 2/7] tests/kms_color: MPO + pipe color
 test for degamma
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
NV12 in pipe color test for degamma. This will increase the YUV
coverage in color management.

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_color.c | 164 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 116 insertions(+), 48 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index cbe3c391..ca36229c 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -27,59 +27,90 @@
 IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
 
 static bool test_pipe_degamma(data_t *data,
-			      igt_plane_t *primary)
+			      igt_plane_t *primary, bool multiplane)
 {
 	igt_output_t *output = data->output;
+	igt_plane_t *overlay = data->overlay;
 	igt_display_t *display = &data->display;
-	gamma_lut_t *degamma_linear, *degamma_full;
+	gamma_lut_t *degamma_full;
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
 	drmModeModeInfo *mode = data->mode;
-	struct igt_fb fb_modeset, fb;
+	struct igt_fb fb0, fb1;
 	igt_crc_t crc_fullgamma, crc_fullcolors;
-	int fb_id, fb_modeset_id;
+	int fb_id0, fb_id1;
+	int primary_x, primary_y, primary_h, primary_w;
+	int overlay_x, overlay_y, overlay_h, overlay_w;
 	bool ret;
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
-	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	degamma_full = generate_table_max(data->degamma_lut_size);
 
 	igt_output_set_pipe(output, primary->pipe->pipe);
 	igt_output_override_mode(output, mode);
 
-	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      data->drm_format,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fb);
-	igt_assert(fb_id);
+	primary_w = mode->hdisplay;
+	primary_h = multiplane ? (mode->vdisplay / 2) : mode->vdisplay;
+	overlay_w = mode->hdisplay;
+	overlay_h = primary_h + (mode->vdisplay % 2);
+	primary_x = 0;
+	primary_y = 0;
+	overlay_x = 0;
+	overlay_y = primary_h;
 
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      data->drm_format,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
-	igt_assert(fb_modeset_id);
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
 	disable_gamma(primary->pipe);
-	set_degamma(data, primary->pipe, degamma_linear);
-	igt_display_commit(&data->display);
+	disable_degamma(primary->pipe);
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 	/* Draw solid colors with linear degamma transformation. */
-	paint_rectangles(data, mode->vdisplay, mode->hdisplay,
-			 0, 0, red_green_blue, &fb);
-	igt_plane_set_fb(primary, &fb);
-	igt_display_commit(&data->display);
+	/* Draw solid colors with no degamma transformation. */
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
@@ -88,11 +119,18 @@ static bool test_pipe_degamma(data_t *data,
 	 * Draw a gradient with degamma LUT to remap all
 	 * values to max red/green/blue.
 	 */
-	paint_gradient_rectangles(data, mode->vdisplay, mode->hdisplay,
-				  0, 0, red_green_blue, &fb);
-	igt_plane_set_fb(primary, &fb);
+	paint_gradient_rectangles(data, primary_h, primary_w, primary_x,
+				  primary_y, red_green_blue, &fb0);
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
+
+	if (multiplane) {
+		paint_gradient_rectangles(data, overlay_h, overlay_w, 0, 0, blue_red_green, &fb1);
+		igt_plane_set_fb(overlay, &fb1);
+		igt_plane_set_position(overlay, overlay_x, overlay_y);
+	}
 	set_degamma(data, primary->pipe, degamma_full);
-	igt_display_commit(&data->display);
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	igt_wait_for_vblank(data->drm_fd,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
@@ -105,12 +143,14 @@ static bool test_pipe_degamma(data_t *data,
 
 	disable_degamma(primary->pipe);
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
 
-	free_lut(degamma_linear);
 	free_lut(degamma_full);
 
 	return ret;
@@ -121,7 +161,7 @@ static bool test_pipe_degamma(data_t *data,
  * LUT and verify we have the same CRC as drawing solid color rectangles.
  */
 static bool test_pipe_gamma(data_t *data,
-			    igt_plane_t *primary)
+			    igt_plane_t *primary, bool multiplane)
 {
 	igt_output_t *output = data->output;
 	igt_display_t *display = &data->display;
@@ -212,7 +252,7 @@ static bool test_pipe_gamma(data_t *data,
  * with linear legacy gamma LUT.
  */
 static bool test_pipe_legacy_gamma(data_t *data,
-				   igt_plane_t *primary)
+				   igt_plane_t *primary, bool multiplane)
 {
 	igt_output_t *output = data->output;
 	igt_display_t *display = &data->display;
@@ -323,7 +363,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
  * through the GAMMA_LUT property.
  */
 static bool test_pipe_legacy_gamma_reset(data_t *data,
-					 igt_plane_t *primary)
+					 igt_plane_t *primary, bool multiplane)
 {
 	const double ctm_identity[] = {
 		1.0, 0.0, 0.0,
@@ -717,9 +757,11 @@ static void test_cleanup(data_t *data)
 }
 
 static void
-run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
-				 bool (*test_t)(data_t*, igt_plane_t*))
+run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p, bool multiplane,
+				 bool (*test_t)(data_t*, igt_plane_t*, bool))
 {
+	igt_plane_t *overlay;
+	int count = 0;
 	test_setup(data, p);
 
 	/*
@@ -730,8 +772,25 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
 	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
+	if (multiplane) {
+		for_each_plane_on_pipe(&data->display, p, overlay) {
+			if (overlay->type == DRM_PLANE_TYPE_PRIMARY ||
+			    overlay->type == DRM_PLANE_TYPE_CURSOR)
+				continue;
+
+			if (igt_plane_has_format_mod(overlay, DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR)) {
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
 	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
-		igt_assert(test_t(data, data->primary));
+		igt_assert(test_t(data, data->primary, multiplane));
 
 	test_cleanup(data);
 }
@@ -846,7 +905,7 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 			igt_display_reset(&data->display);
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 
-			ret = test_pipe_gamma(data, data->primary);
+			ret = test_pipe_gamma(data, data->primary, false);
 
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, max_bpc);
 			igt_assert(ret);
@@ -856,7 +915,7 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 			igt_display_reset(&data->display);
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 
-			ret = test_pipe_degamma(data, data->primary);
+			ret = test_pipe_degamma(data, data->primary, false);
 
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, max_bpc);
 			igt_assert(ret);
@@ -921,19 +980,23 @@ run_tests_for_pipe(data_t *data)
 	enum pipe pipe;
 	struct {
 		const char *name;
-		bool (*test_t)(data_t*, igt_plane_t*);
+		bool (*test_t)(data_t*, igt_plane_t*, bool);
+		bool multiplane;
 		const char *desc;
 	} gamma_degamma_tests[] = {
-		{ "degamma", test_pipe_degamma,
+		{ "degamma", test_pipe_degamma, false,
 		  "Verify that degamma LUT transformation works correctly" },
 
-		{ "gamma", test_pipe_gamma,
+		{ "degamma-multiplane", test_pipe_degamma, true,
+		  "Verify that degamma LUT transformation works correctly for multiplane" },
+
+		{ "gamma", test_pipe_gamma, false,
 		  "Verify that gamma LUT transformation works correctly" },
 
-		{ "legacy-gamma", test_pipe_legacy_gamma,
+		{ "legacy-gamma", test_pipe_legacy_gamma, false,
 		  "Verify that legacy gamma LUT transformation works correctly" },
 
-		{ "legacy-gamma-reset", test_pipe_legacy_gamma_reset,
+		{ "legacy-gamma-reset", test_pipe_legacy_gamma_reset, false,
 		  "Verify that setting the legacy gamma LUT resets the gamma LUT set through GAMMA_LUT property" },
 	};
 	struct {
@@ -1015,8 +1078,13 @@ run_tests_for_pipe(data_t *data)
 	for (i = 0; i < ARRAY_SIZE(gamma_degamma_tests); i++) {
 		igt_describe_f("%s", gamma_degamma_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", gamma_degamma_tests[i].name) {
+			if (gamma_degamma_tests[i].multiplane &&
+			    (!data->display.is_atomic ||
+			     !igt_display_has_format_mod(&data->display, DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR)))
+				continue;
 			for_each_pipe(&data->display, pipe) {
 				run_gamma_degamma_tests_for_pipe(data, pipe,
+								 gamma_degamma_tests[i].multiplane,
 								 gamma_degamma_tests[i].test_t);
 			}
 		}
-- 
2.25.1
