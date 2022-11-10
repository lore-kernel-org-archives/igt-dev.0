Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3837E10E66B
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Nov 2022 07:09:17 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Nov 2022 12:38:26 +0530
Message-Id: <20221110070828.26227-6-ananya.sharma@intel.com>
In-Reply-To: <20221110070828.26227-1-ananya.sharma@intel.com>
References: <20221110070828.26227-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 5/7] tests/chamelium/kms_color_chamelium:
 MPO + pipe color test for degamma
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
NV12 in pipe color test for degamma in kms_color_chamelium too
as we can expect crc mismatches due to the hardware round-ups
the LUT values. This will also increase the coverage in color
management.

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/chamelium/kms_color_chamelium.c | 132 +++++++++++++++++++-------
 1 file changed, 99 insertions(+), 33 deletions(-)

diff --git a/tests/chamelium/kms_color_chamelium.c b/tests/chamelium/kms_color_chamelium.c
index 4a8cb339..6043718c 100644
--- a/tests/chamelium/kms_color_chamelium.c
+++ b/tests/chamelium/kms_color_chamelium.c
@@ -33,19 +33,28 @@ IGT_TEST_DESCRIPTION("Test Color Features at Pipe level using Chamelium to verif
  */
 static bool test_pipe_degamma(data_t *data,
 			      igt_plane_t *primary,
+			      bool multiplane,
 			      struct chamelium_port *port)
 {
 	igt_output_t *output = data->output;
+	igt_plane_t *overlay = data->overlay;
 	gamma_lut_t *degamma_full;
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
+	int primary_x, primary_y, primary_h, primary_w;
+	int overlay_x, overlay_y, overlay_h, overlay_w;
 	bool ret;
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
@@ -54,22 +63,39 @@ static bool test_pipe_degamma(data_t *data,
 
 	igt_output_set_pipe(output, primary->pipe->pipe);
 
-	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fb);
-	igt_assert(fb_id);
+	primary_w = mode->hdisplay;
+	primary_h = mode->vdisplay/2;
+	overlay_w = mode->hdisplay;
+	overlay_h = primary_h + (mode->vdisplay % 2);
+	primary_x = 0;
+	primary_y = 0;
+	overlay_x = 0;
+	overlay_y = primary_h;
 
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      DRM_FORMAT_XRGB8888,
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
+
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
@@ -79,23 +105,31 @@ static bool test_pipe_degamma(data_t *data,
 				 &fbref);
 	igt_assert(fbref_id);
 
-	igt_plane_set_fb(primary, &fb_modeset);
 	disable_ctm(primary->pipe);
 	disable_gamma(primary->pipe);
-	igt_display_commit(&data->display);
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	/* Draw solid colors with linear degamma transformation. */
-	paint_rectangles(data, mode->vdisplay, mode->hdisplay,
-			 0, 0, red_green_blue, &fbref);
+	/* Draw solid colors with no degamma transformation. */
+	paint_rectangles(data, primary_h, primary_w, 0, 0, red_green_blue, &fbref);
+	paint_rectangles(data, overlay_h, overlay_w, 0, 0, blue_red_green, &fbref);
 
 	/* Draw a gradient with degamma LUT to remap all
 	 * values to max red/green/blue.
 	 */
-	paint_gradient_rectangles(data, mode->vdisplay, mode->hdisplay,
-				  0, 0, red_green_blue, &fb);
-	igt_plane_set_fb(primary, &fb);
+	paint_gradient_rectangles(data, primary_h, primary_w,
+				  primary_x, primary_y, red_green_blue, &fb0);
+	igt_plane_set_fb(primary, &fb0);
+	igt_plane_set_position(primary, primary_x, primary_y);
+
+	if (multiplane) {
+		paint_gradient_rectangles(data, overlay_h, overlay_w, 0, 0,
+					  blue_red_green, &fb1);
+		igt_plane_set_fb(overlay, &fb1);
+		igt_plane_set_position(overlay, overlay_x, overlay_y);
+	}
+
 	set_degamma(data, primary->pipe, degamma_full);
-	igt_display_commit(&data->display);
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
 	frame_fullcolors =
 		chamelium_read_captured_frame(data->chamelium, 0);
@@ -110,8 +144,10 @@ static bool test_pipe_degamma(data_t *data,
 
 	disable_degamma(primary->pipe);
 	igt_plane_set_fb(primary, NULL);
+	if (multiplane)
+		igt_plane_set_fb(overlay, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
-	igt_display_commit(&data->display);
+	igt_display_commit2(&data->display, multiplane ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	free_lut(degamma_full);
 
 	return ret;
@@ -124,6 +160,7 @@ static bool test_pipe_degamma(data_t *data,
  */
 static bool test_pipe_gamma(data_t *data,
 			    igt_plane_t *primary,
+			    bool multiplane,
 			    struct chamelium_port *port)
 {
 	igt_output_t *output = data->output;
@@ -454,9 +491,11 @@ static int test_setup(data_t *data, enum pipe p)
 }
 
 static void
-run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
-		bool (*test_t)(data_t*, igt_plane_t*, struct chamelium_port*))
+run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p, bool multiplane,
+		bool (*test_t)(data_t*, igt_plane_t*, bool, struct chamelium_port*))
 {
+	igt_plane_t *overlay;
+	int count = 0;
 	int port_idx = test_setup(data, p);
 
 	igt_require(port_idx >= 0);
@@ -465,8 +504,25 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
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
 	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
-		igt_assert(test_t(data, data->primary, data->ports[port_idx]));
+		igt_assert(test_t(data, data->primary, multiplane,  data->ports[port_idx]));
 }
 
 static void
@@ -555,13 +611,17 @@ run_tests_for_pipe(data_t *data)
 	enum pipe pipe;
 	struct {
 		const char *name;
-		bool (*test_t)(data_t*, igt_plane_t*, struct chamelium_port*);
+		bool (*test_t)(data_t*, igt_plane_t*, bool, struct chamelium_port*);
+		bool multiplane;
 		const char *desc;
 	} gamma_degamma_tests[] = {
-		{ "degamma", test_pipe_degamma,
+		{ "degamma", test_pipe_degamma, false,
 		  "Verify that degamma LUT transformation works correctly" },
 
-		{ "gamma", test_pipe_gamma,
+		{ "degamma-multiplane", test_pipe_degamma, true,
+		  "Verify that degamma LUT transformation works correctly for multiplanes" },
+
+		{ "gamma", test_pipe_gamma, false,
 		  "Verify that gamma LUT transformation works correctly" },
 	};
 	struct {
@@ -643,8 +703,14 @@ run_tests_for_pipe(data_t *data)
 	for (i = 0; i < ARRAY_SIZE(gamma_degamma_tests); i++) {
 		igt_describe_f("%s", gamma_degamma_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", gamma_degamma_tests[i].name) {
+			if (gamma_degamma_tests[i].multiplane &&
+			   (!data->display.is_atomic ||
+			    !igt_display_has_format_mod(&data->display, DRM_FORMAT_NV12,
+							DRM_FORMAT_MOD_LINEAR)))
+				continue;
 			for_each_pipe(&data->display, pipe) {
 				run_gamma_degamma_tests_for_pipe(data, pipe,
+								 gamma_degamma_tests[i].multiplane,
 								 gamma_degamma_tests[i].test_t);
 			}
 		}
-- 
2.25.1
