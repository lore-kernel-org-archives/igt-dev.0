Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4057A11279C
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Jul 2022 15:49:53 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	kunal1.joshi@intel.com
Date: Thu, 14 Jul 2022 21:17:38 +0530
Message-Id: <20220714154738.689323-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 1/2] tests/kms_color_chamelium: Convert tests to
 dynamic
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

Convert the existing subtests to dynamic subtests at pipe level.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color_chamelium.c | 1034 +++++++++++++++++------------------
 1 file changed, 487 insertions(+), 547 deletions(-)

diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index 76f82d6d..678931aa 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -31,115 +31,88 @@ IGT_TEST_DESCRIPTION("Test Color Features at Pipe level using Chamelium to verif
  * degamma LUT and verify we have the same frame dump as drawing solid color
  * rectangles with linear degamma LUT.
  */
-static void test_pipe_degamma(data_t *data,
-			      igt_plane_t *primary)
+static bool test_pipe_degamma(data_t *data,
+			      igt_plane_t *primary,
+			      struct chamelium_port *port)
 {
-	igt_output_t *output;
-	gamma_lut_t *degamma_linear, *degamma_full;
+	igt_output_t *output = data->output;
+	gamma_lut_t *degamma_full;
+	drmModeModeInfo *mode = data->mode;
+	struct igt_fb fb_modeset, fb, fbref;
+	struct chamelium_frame_dump *frame_fullcolors;
+	int fb_id, fb_modeset_id, fbref_id;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
 		{ 0.0, 0.0, 1.0 }
 	};
-
-	int i;
-	struct chamelium_port *port;
-	char *connected_ports[4];
-
-	for (i = 0; i < data->port_count; i++)
-		connected_ports[i] =
-			(char *) chamelium_port_get_name(data->ports[i]);
+	bool ret;
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
-	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
-	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	degamma_full = generate_table_max(data->degamma_lut_size);
 
-	for_each_valid_output_on_pipe(&data->display,
-				      primary->pipe->pipe,
-				      output) {
-		drmModeModeInfo *mode;
-		struct igt_fb fb_modeset, fb, fbref;
-		struct chamelium_frame_dump *frame_fullcolors;
-		int fb_id, fb_modeset_id, fbref_id;
-		bool valid_output = false;
-
-		for (i = 0; i < data->port_count; i++)
-			valid_output |=
-				(strcmp(output->name, connected_ports[i]) == 0);
-		if (!valid_output)
-			continue;
-		else
-			for (i = 0; i < data->port_count; i++)
-				if (strcmp(output->name,
-					   connected_ports[i]) == 0)
-					port = data->ports[i];
-
-		igt_output_set_pipe(output, primary->pipe->pipe);
-		mode = igt_output_get_mode(output);
-
-		/* Create a framebuffer at the size of the output. */
-		fb_id = igt_create_fb(data->drm_fd,
+	igt_output_set_pipe(output, primary->pipe->pipe);
+
+	/* Create a framebuffer at the size of the output. */
+	fb_id = igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR,
+			      &fb);
+	igt_assert(fb_id);
+
+	fb_modeset_id = igt_create_fb(data->drm_fd,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      DRM_FORMAT_MOD_LINEAR,
-				      &fb);
-		igt_assert(fb_id);
-
-		fb_modeset_id = igt_create_fb(data->drm_fd,
-					      mode->hdisplay,
-					      mode->vdisplay,
-					      DRM_FORMAT_XRGB8888,
-					      DRM_FORMAT_MOD_LINEAR,
-					      &fb_modeset);
-		igt_assert(fb_modeset_id);
-
-		fbref_id = igt_create_fb(data->drm_fd,
-					      mode->hdisplay,
-					      mode->vdisplay,
-					      DRM_FORMAT_XRGB8888,
-					      DRM_FORMAT_MOD_LINEAR,
-					      &fbref);
-		igt_assert(fbref_id);
-
-		igt_plane_set_fb(primary, &fb_modeset);
-		disable_ctm(primary->pipe);
-		disable_gamma(primary->pipe);
-		set_degamma(data, primary->pipe, degamma_linear);
-		igt_display_commit(&data->display);
-
-		/* Draw solid colors with linear degamma transformation. */
-		paint_rectangles(data, mode, red_green_blue, &fbref);
-
-		/* Draw a gradient with degamma LUT to remap all
-		 * values to max red/green/blue.
-		 */
-		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
-		igt_plane_set_fb(primary, &fb);
-		set_degamma(data, primary->pipe, degamma_full);
-		igt_display_commit(&data->display);
-		chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
-		frame_fullcolors =
-			chamelium_read_captured_frame(data->chamelium, 0);
-
-		/* Verify that the framebuffer reference of the software
-		 * computed output is equal to the frame dump of the degamma
-		 * LUT transformation output.
-		 */
-		chamelium_frame_match_or_dump(data->chamelium, port,
-					      frame_fullcolors, &fbref,
-					      CHAMELIUM_CHECK_ANALOG);
-
-		disable_degamma(primary->pipe);
-		igt_plane_set_fb(primary, NULL);
-		igt_output_set_pipe(output, PIPE_NONE);
-		igt_display_commit(&data->display);
-	}
-
-	free_lut(degamma_linear);
+				      &fb_modeset);
+	igt_assert(fb_modeset_id);
+
+	fbref_id = igt_create_fb(data->drm_fd,
+				 mode->hdisplay,
+				 mode->vdisplay,
+				 DRM_FORMAT_XRGB8888,
+				 DRM_FORMAT_MOD_LINEAR,
+				 &fbref);
+	igt_assert(fbref_id);
+
+	igt_plane_set_fb(primary, &fb_modeset);
+	disable_ctm(primary->pipe);
+	disable_gamma(primary->pipe);
+	igt_display_commit(&data->display);
+
+	/* Draw solid colors with linear degamma transformation. */
+	paint_rectangles(data, mode, red_green_blue, &fbref);
+
+	/* Draw a gradient with degamma LUT to remap all
+	 * values to max red/green/blue.
+	 */
+	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+	igt_plane_set_fb(primary, &fb);
+	set_degamma(data, primary->pipe, degamma_full);
+	igt_display_commit(&data->display);
+	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+	frame_fullcolors =
+		chamelium_read_captured_frame(data->chamelium, 0);
+
+	/* Verify that the framebuffer reference of the software
+	 * computed output is equal to the frame dump of the degamma
+	 * LUT transformation output.
+	 */
+	ret = chamelium_frame_match_or_dump(data->chamelium, port,
+					    frame_fullcolors, &fbref,
+					    CHAMELIUM_CHECK_ANALOG);
+
+	disable_degamma(primary->pipe);
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit(&data->display);
 	free_lut(degamma_full);
+
+	return ret;
 }
 
 /*
@@ -147,111 +120,88 @@ static void test_pipe_degamma(data_t *data,
  * gamma LUT and verify we have the same frame dump as drawing solid
  * color rectangles.
  */
-static void test_pipe_gamma(data_t *data,
-			    igt_plane_t *primary)
+static bool test_pipe_gamma(data_t *data,
+			    igt_plane_t *primary,
+			    struct chamelium_port *port)
 {
-	igt_output_t *output;
+	igt_output_t *output = data->output;
 	gamma_lut_t *gamma_full;
+	drmModeModeInfo *mode = data->mode;
+	struct igt_fb fb_modeset, fb, fbref;
+	struct chamelium_frame_dump *frame_fullcolors;
+	int fb_id, fb_modeset_id, fbref_id;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
 		{ 0.0, 0.0, 1.0 }
 	};
-
-	int i;
-	struct chamelium_port *port;
-	char *connected_ports[4];
-
-	for (i = 0; i < data->port_count; i++)
-		connected_ports[i] =
-			(char *) chamelium_port_get_name(data->ports[i]);
+	bool ret;
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
 	gamma_full = generate_table_max(data->gamma_lut_size);
 
-	for_each_valid_output_on_pipe(&data->display,
-				      primary->pipe->pipe,
-				      output) {
-		drmModeModeInfo *mode;
-		struct igt_fb fb_modeset, fb, fbref;
-		struct chamelium_frame_dump *frame_fullcolors;
-		int fb_id, fb_modeset_id, fbref_id;
-		bool valid_output = false;
-
-		for (i = 0; i < data->port_count; i++)
-			valid_output |=
-				(strcmp(output->name, connected_ports[i]) == 0);
-		if (!valid_output)
-			continue;
-		else
-			for (i = 0; i < data->port_count; i++)
-				if (strcmp(output->name,
-					   connected_ports[i]) == 0)
-					port = data->ports[i];
-
-		igt_output_set_pipe(output, primary->pipe->pipe);
-		mode = igt_output_get_mode(output);
-
-		/* Create a framebuffer at the size of the output. */
-		fb_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb);
-		igt_assert(fb_id);
-
-		fb_modeset_id = igt_create_fb(data->drm_fd,
-					      mode->hdisplay,
-					      mode->vdisplay,
-					      DRM_FORMAT_XRGB8888,
-					      DRM_FORMAT_MOD_LINEAR,
-					      &fb_modeset);
-		igt_assert(fb_modeset_id);
-
-		fbref_id = igt_create_fb(data->drm_fd,
+	igt_output_set_pipe(output, primary->pipe->pipe);
+
+	/* Create a framebuffer at the size of the output. */
+	fb_id = igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR,
+			      &fb);
+	igt_assert(fb_id);
+
+	fb_modeset_id = igt_create_fb(data->drm_fd,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      DRM_FORMAT_MOD_LINEAR,
-				      &fbref);
-		igt_assert(fbref_id);
-
-		igt_plane_set_fb(primary, &fb_modeset);
-		disable_ctm(primary->pipe);
-		disable_degamma(primary->pipe);
-		set_gamma(data, primary->pipe, gamma_full);
-		igt_display_commit(&data->display);
-
-		/* Draw solid colors with no gamma transformation. */
-		paint_rectangles(data, mode, red_green_blue, &fbref);
-
-		/* Draw a gradient with gamma LUT to remap all values
-		 * to max red/green/blue.
-		 */
-		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
-		igt_plane_set_fb(primary, &fb);
-		igt_display_commit(&data->display);
-		chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
-		frame_fullcolors =
-			chamelium_read_captured_frame(data->chamelium, 0);
-
-		/* Verify that the framebuffer reference of the software computed
-		 * output is equal to the frame dump of the degamma LUT
-		 * transformation output.
-		 */
-		chamelium_frame_match_or_dump(data->chamelium, port,
-					      frame_fullcolors, &fbref,
-					      CHAMELIUM_CHECK_ANALOG);
-
-		disable_gamma(primary->pipe);
-		igt_plane_set_fb(primary, NULL);
-		igt_output_set_pipe(output, PIPE_NONE);
-		igt_display_commit(&data->display);
-	}
-
+				      &fb_modeset);
+	igt_assert(fb_modeset_id);
+
+	fbref_id = igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR,
+			      &fbref);
+	igt_assert(fbref_id);
+
+	igt_plane_set_fb(primary, &fbref);
+	disable_ctm(primary->pipe);
+	disable_degamma(primary->pipe);
+	set_gamma(data, primary->pipe, gamma_full);
+	igt_display_commit(&data->display);
+
+	/* Draw solid colors with no gamma transformation. */
+	paint_rectangles(data, mode, red_green_blue, &fbref);
+
+	/* Draw a gradient with gamma LUT to remap all values
+	 * to max red/green/blue.
+	 */
+	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+	igt_plane_set_fb(primary, &fb);
+	igt_display_commit(&data->display);
+	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+	frame_fullcolors =
+		chamelium_read_captured_frame(data->chamelium, 0);
+
+	/* Verify that the framebuffer reference of the software computed
+	 * output is equal to the frame dump of the degamma LUT
+	 * transformation output.
+	 */
+	ret = chamelium_frame_match_or_dump(data->chamelium, port,
+					    frame_fullcolors, &fbref,
+					    CHAMELIUM_CHECK_ANALOG);
+
+	disable_gamma(primary->pipe);
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit(&data->display);
 	free_lut(gamma_full);
+
+	return ret;
 }
 
 /*
@@ -262,119 +212,97 @@ static bool test_pipe_ctm(data_t *data,
 			  igt_plane_t *primary,
 			  color_t *before,
 			  color_t *after,
-			  double *ctm_matrix)
+			  double *ctm_matrix,
+			  struct chamelium_port *port)
 {
 	gamma_lut_t *degamma_linear, *gamma_linear;
-	igt_output_t *output;
-
-	int i;
+	igt_output_t *output = data->output;
+	drmModeModeInfo *mode = data->mode;
+	struct igt_fb fb_modeset, fb, fbref;
+	struct chamelium_frame_dump *frame_hardware;
+	int fb_id, fb_modeset_id, fbref_id;
 	bool ret = true;
-	struct chamelium_port *port;
-	char *connected_ports[4];
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
 
-	for (i = 0; i < data->port_count; i++)
-		connected_ports[i] =
-			(char *) chamelium_port_get_name(data->ports[i]);
-
 	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
 
-	for_each_valid_output_on_pipe(&data->display,
-				      primary->pipe->pipe,
-				      output) {
-		drmModeModeInfo *mode;
-		struct igt_fb fb_modeset, fb, fbref;
-		struct chamelium_frame_dump *frame_hardware;
-		int fb_id, fb_modeset_id, fbref_id;
-		bool valid_output = false;
-
-		for (i = 0; i < data->port_count; i++)
-			valid_output |=
-				(strcmp(output->name, connected_ports[i]) == 0);
-		if (!valid_output)
-			continue;
-		else
-			for (i = 0; i < data->port_count; i++)
-				if (strcmp(output->name,
-					   connected_ports[i]) == 0)
-					port = data->ports[i];
-
-		igt_output_set_pipe(output, primary->pipe->pipe);
-		mode = igt_output_get_mode(output);
-
-		/* Create a framebuffer at the size of the output. */
-		fb_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb);
-		igt_assert(fb_id);
-
-		fb_modeset_id = igt_create_fb(data->drm_fd,
-					      mode->hdisplay,
-					      mode->vdisplay,
-					      DRM_FORMAT_XRGB8888,
-					      DRM_FORMAT_MOD_LINEAR,
-					      &fb_modeset);
-		igt_assert(fb_modeset_id);
-
-		fbref_id = igt_create_fb(data->drm_fd,
+	igt_output_set_pipe(output, primary->pipe->pipe);
+
+	/* Create a framebuffer at the size of the output. */
+	fb_id = igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR,
+			      &fb);
+	igt_assert(fb_id);
+
+	fb_modeset_id = igt_create_fb(data->drm_fd,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      DRM_FORMAT_MOD_LINEAR,
-				      &fbref);
-		igt_assert(fbref_id);
-
-		igt_plane_set_fb(primary, &fb_modeset);
-
-		if (memcmp(before, after, sizeof(color_t))) {
-			set_degamma(data, primary->pipe, degamma_linear);
-			set_gamma(data, primary->pipe, gamma_linear);
-		} else {
-			/* Disable Degamma and Gamma for ctm max test */
-			disable_degamma(primary->pipe);
-			disable_gamma(primary->pipe);
-		}
+				      &fb_modeset);
+	igt_assert(fb_modeset_id);
+
+	fbref_id = igt_create_fb(data->drm_fd,
+				 mode->hdisplay,
+				 mode->vdisplay,
+				 DRM_FORMAT_XRGB8888,
+				 DRM_FORMAT_MOD_LINEAR,
+				 &fbref);
+	igt_assert(fbref_id);
 
-		disable_ctm(primary->pipe);
-		igt_display_commit(&data->display);
+	igt_plane_set_fb(primary, &fb_modeset);
 
-		paint_rectangles(data, mode, after, &fbref);
+	if (memcmp(before, after, sizeof(color_t))) {
+		set_degamma(data, primary->pipe, degamma_linear);
+		set_gamma(data, primary->pipe, gamma_linear);
+	} else {
+		/* Disable Degamma and Gamma for ctm max test */
+		disable_degamma(primary->pipe);
+		disable_gamma(primary->pipe);
+	}
 
-		/* With CTM transformation. */
-		paint_rectangles(data, mode, before, &fb);
-		igt_plane_set_fb(primary, &fb);
-		set_ctm(primary->pipe, ctm_matrix);
-		igt_display_commit(&data->display);
-		chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
-		frame_hardware =
-			chamelium_read_captured_frame(data->chamelium, 0);
+	disable_ctm(primary->pipe);
+	igt_display_commit(&data->display);
 
-		/* Verify that the framebuffer reference of the software
-		 * computed output is equal to the frame dump of the CTM
-		 * matrix transformation output.
-		 */
-		ret &= chamelium_frame_match_or_dump(data->chamelium, port,
-						     frame_hardware,
-						     &fbref,
-						     CHAMELIUM_CHECK_ANALOG);
+	paint_rectangles(data, mode, after, &fbref);
 
-		igt_plane_set_fb(primary, NULL);
-		igt_output_set_pipe(output, PIPE_NONE);
-	}
+	/* With CTM transformation. */
+	paint_rectangles(data, mode, before, &fb);
+	igt_plane_set_fb(primary, &fb);
+	set_ctm(primary->pipe, ctm_matrix);
+	igt_display_commit(&data->display);
+	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+	frame_hardware =
+		chamelium_read_captured_frame(data->chamelium, 0);
 
+	/* Verify that the framebuffer reference of the software
+	 * computed output is equal to the frame dump of the CTM
+	 * matrix transformation output.
+	 */
+	ret &= chamelium_frame_match_or_dump(data->chamelium, port,
+					     frame_hardware,
+					     &fbref,
+					     CHAMELIUM_CHECK_ANALOG);
+
+	igt_plane_set_fb(primary, NULL);
+	disable_degamma(primary->pipe);
+	disable_gamma(primary->pipe);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit(&data->display);
 	free_lut(degamma_linear);
 	free_lut(gamma_linear);
 
 	return ret;
 }
 
-static void test_pipe_limited_range_ctm(data_t *data,
-					igt_plane_t *primary)
+static bool test_pipe_limited_range_ctm(data_t *data,
+					igt_plane_t *primary,
+					struct chamelium_port *port)
 {
 	double limited_result = 235.0 / 255.0;
 	color_t red_green_blue_limited[] = {
@@ -391,342 +319,355 @@ static void test_pipe_limited_range_ctm(data_t *data,
 			0.0, 1.0, 0.0,
 			0.0, 0.0, 1.0 };
 	gamma_lut_t *degamma_linear, *gamma_linear;
-	igt_output_t *output;
-	bool has_broadcast_rgb_output = false;
-
-	int i;
-	struct chamelium_port *port;
-	char *connected_ports[4];
+	igt_output_t *output = data->output;
+	drmModeModeInfo *mode = data->mode;
+	struct igt_fb fb_modeset, fb, fbref;
+	struct chamelium_frame_dump *frame_limited;
+	int fb_id, fb_modeset_id, fbref_id;
+	bool ret = false;
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
 
 	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
 
-	for (i = 0; i < data->port_count; i++)
-		connected_ports[i] =
-			(char *) chamelium_port_get_name(data->ports[i]);
-
-	for_each_valid_output_on_pipe(&data->display,
-				      primary->pipe->pipe,
-				      output) {
-		drmModeModeInfo *mode;
-		struct igt_fb fb_modeset, fb, fbref;
-		struct chamelium_frame_dump *frame_limited;
-		int fb_id, fb_modeset_id, fbref_id;
-		bool valid_output = false;
-
-		for (i = 0; i < data->port_count; i++)
-			valid_output |=
-				(strcmp(output->name, connected_ports[i]) == 0);
-		if (!valid_output)
-			continue;
-		else
-			for (i = 0; i < data->port_count; i++)
-				if (strcmp(output->name,
-				    connected_ports[i]) == 0)
-					port = data->ports[i];
-
-		if (!igt_output_has_prop(output, IGT_CONNECTOR_BROADCAST_RGB))
-			continue;
-
-		has_broadcast_rgb_output = true;
-
-		igt_output_set_pipe(output, primary->pipe->pipe);
-		mode = igt_output_get_mode(output);
-
-		/* Create a framebuffer at the size of the output. */
-		fb_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb);
-		igt_assert(fb_id);
-
-		fb_modeset_id = igt_create_fb(data->drm_fd,
-					      mode->hdisplay,
-					      mode->vdisplay,
-					      DRM_FORMAT_XRGB8888,
-					      DRM_FORMAT_MOD_LINEAR,
-					      &fb_modeset);
-		igt_assert(fb_modeset_id);
-
-		fbref_id = igt_create_fb(data->drm_fd,
+	igt_output_set_pipe(output, primary->pipe->pipe);
+
+	/* Create a framebuffer at the size of the output. */
+	fb_id = igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR,
+			      &fb);
+	igt_assert(fb_id);
+
+	fb_modeset_id = igt_create_fb(data->drm_fd,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      DRM_FORMAT_MOD_LINEAR,
-				      &fbref);
-		igt_assert(fbref_id);
-
-		igt_plane_set_fb(primary, &fb_modeset);
-
-		set_degamma(data, primary->pipe, degamma_linear);
-		set_gamma(data, primary->pipe, gamma_linear);
-		set_ctm(primary->pipe, ctm);
-
-		igt_output_set_prop_value(output,
-					  IGT_CONNECTOR_BROADCAST_RGB,
-					  BROADCAST_RGB_FULL);
-		paint_rectangles(data, mode, red_green_blue_limited, &fb);
-		igt_plane_set_fb(primary, &fb);
-		igt_display_commit(&data->display);
-
-		/* Set the output into limited range. */
-		igt_output_set_prop_value(output,
-					  IGT_CONNECTOR_BROADCAST_RGB,
-					  BROADCAST_RGB_16_235);
-		paint_rectangles(data, mode, red_green_blue_full, &fb);
-
-		/* And reset.. */
-		igt_output_set_prop_value(output,
-					  IGT_CONNECTOR_BROADCAST_RGB,
-					  BROADCAST_RGB_FULL);
-		igt_plane_set_fb(primary, NULL);
-		igt_output_set_pipe(output, PIPE_NONE);
-		chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
-		frame_limited =
-			chamelium_read_captured_frame(data->chamelium, 0);
-
-
-		/* Verify that the framebuffer reference of the software
-		 * computed output is equal to the frame dump of the CTM
-		 * matrix transformation output.
-		 */
-		chamelium_frame_match_or_dump(data->chamelium, port,
-					      frame_limited, &fbref,
-					      CHAMELIUM_CHECK_ANALOG);
-
-	}
+				      &fb_modeset);
+	igt_assert(fb_modeset_id);
+
+	fbref_id = igt_create_fb(data->drm_fd,
+				 mode->hdisplay,
+				 mode->vdisplay,
+				 DRM_FORMAT_XRGB8888,
+				 DRM_FORMAT_MOD_LINEAR,
+				 &fbref);
+	igt_assert(fbref_id);
+
+	igt_plane_set_fb(primary, &fb_modeset);
+
+	set_degamma(data, primary->pipe, degamma_linear);
+	set_gamma(data, primary->pipe, gamma_linear);
+	set_ctm(primary->pipe, ctm);
+
+	igt_output_set_prop_value(output,
+				  IGT_CONNECTOR_BROADCAST_RGB,
+				  BROADCAST_RGB_FULL);
+	paint_rectangles(data, mode, red_green_blue_limited, &fb);
+	igt_plane_set_fb(primary, &fb);
+	igt_display_commit(&data->display);
+
+	/* Set the output into limited range. */
+	igt_output_set_prop_value(output,
+				  IGT_CONNECTOR_BROADCAST_RGB,
+				  BROADCAST_RGB_16_235);
+	paint_rectangles(data, mode, red_green_blue_full, &fb);
+
+	/* And reset.. */
+	igt_output_set_prop_value(output,
+				  IGT_CONNECTOR_BROADCAST_RGB,
+				  BROADCAST_RGB_FULL);
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+	frame_limited =
+		chamelium_read_captured_frame(data->chamelium, 0);
+
+
+	/* Verify that the framebuffer reference of the software
+	 * computed output is equal to the frame dump of the CTM
+	 * matrix transformation output.
+	 */
+	ret = chamelium_frame_match_or_dump(data->chamelium, port,
+					    frame_limited, &fbref,
+					    CHAMELIUM_CHECK_ANALOG);
 
 	free_lut(gamma_linear);
 	free_lut(degamma_linear);
 
-	igt_require(has_broadcast_rgb_output);
+	return ret;
 }
 
 static void
-run_tests_for_pipe(data_t *data, enum pipe p)
+prep_pipe(data_t *data, enum pipe p)
 {
-	igt_pipe_t *pipe;
-	igt_plane_t *primary;
-	double delta;
-	int i;
-	color_t red_green_blue[] = {
-		{ 1.0, 0.0, 0.0 },
-		{ 0.0, 1.0, 0.0 },
-		{ 0.0, 0.0, 1.0 }
-	};
+	igt_require_pipe(&data->display, p);
 
-	igt_fixture {
+	if (igt_pipe_obj_has_prop(&data->display.pipes[p], IGT_CRTC_DEGAMMA_LUT_SIZE)) {
+		data->degamma_lut_size =
+			igt_pipe_obj_get_prop(&data->display.pipes[p],
+					      IGT_CRTC_DEGAMMA_LUT_SIZE);
+		igt_assert_lt(0, data->degamma_lut_size);
+	}
+
+	if (igt_pipe_obj_has_prop(&data->display.pipes[p], IGT_CRTC_GAMMA_LUT_SIZE)) {
+		data->gamma_lut_size =
+			igt_pipe_obj_get_prop(&data->display.pipes[p],
+					      IGT_CRTC_GAMMA_LUT_SIZE);
+		igt_assert_lt(0, data->gamma_lut_size);
+	}
+}
 
-		igt_require_pipe(&data->display, p);
+static int test_setup(data_t *data, enum pipe p)
+{
+	igt_pipe_t *pipe;
+	int i = 0;
 
-		pipe = &data->display.pipes[p];
-		igt_require(pipe->n_planes >= 0);
+	igt_display_reset(&data->display);
+	prep_pipe(data, p);
 
-		primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+	pipe = &data->display.pipes[p];
+	igt_require(pipe->n_planes >= 0);
 
-		if (igt_pipe_obj_has_prop(&data->display.pipes[p],
-					  IGT_CRTC_DEGAMMA_LUT_SIZE)) {
-			data->degamma_lut_size =
-				igt_pipe_obj_get_prop(&data->display.pipes[p],
-						IGT_CRTC_DEGAMMA_LUT_SIZE);
-			igt_assert_lt(0, data->degamma_lut_size);
-		}
+	data->primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 
-		if (igt_pipe_obj_has_prop(&data->display.pipes[p],
-					  IGT_CRTC_GAMMA_LUT_SIZE)) {
-			data->gamma_lut_size =
-				igt_pipe_obj_get_prop(&data->display.pipes[p],
-						      IGT_CRTC_GAMMA_LUT_SIZE);
-			igt_assert_lt(0, data->gamma_lut_size);
+	for_each_valid_output_on_pipe(&data->display, p, data->output) {
+		for (i = 0; i < data->port_count; i++) {
+			if (strcmp(data->output->name,
+				   chamelium_port_get_name(data->ports[i])) == 0)
+				return i;
 		}
-
-		igt_display_require_output_on_pipe(&data->display, p);
 	}
 
-	data->color_depth = 8;
-	delta = 1.0 / (1 << data->color_depth);
+	return 0;
+}
 
-	igt_describe("Compare after applying ctm matrix & identity matrix");
-	igt_subtest_f("pipe-%s-ctm-red-to-blue", kmstest_pipe_name(p)) {
-		color_t blue_green_blue[] = {
-			{ 0.0, 0.0, 1.0 },
-			{ 0.0, 1.0, 0.0 },
-			{ 0.0, 0.0, 1.0 }
-		};
-		double ctm[] = { 0.0, 0.0, 0.0,
-				0.0, 1.0, 0.0,
-				1.0, 0.0, 1.0 };
-		igt_assert(test_pipe_ctm(data, primary, red_green_blue,
-					 blue_green_blue, ctm));
-	}
+static void
+run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
+		bool (*test_t)(data_t*, igt_plane_t*, struct chamelium_port*))
+{
+	int port_idx = test_setup(data, p);
 
-	igt_describe("Compare after applying ctm matrix & identity matrix");
-	igt_subtest_f("pipe-%s-ctm-green-to-red", kmstest_pipe_name(p)) {
-		color_t red_red_blue[] = {
-			{ 1.0, 0.0, 0.0 },
-			{ 1.0, 0.0, 0.0 },
-			{ 0.0, 0.0, 1.0 }
-		};
-		double ctm[] = { 1.0, 1.0, 0.0,
-				0.0, 0.0, 0.0,
-				0.0, 0.0, 1.0 };
-		igt_assert(test_pipe_ctm(data, primary, red_green_blue,
-					 red_red_blue, ctm));
-	}
+	igt_require(port_idx);
 
-	igt_describe("Compare after applying ctm matrix & identity matrix");
-	igt_subtest_f("pipe-%s-ctm-blue-to-red", kmstest_pipe_name(p)) {
-		color_t red_green_red[] = {
-			{ 1.0, 0.0, 0.0 },
-			{ 0.0, 1.0, 0.0 },
-			{ 1.0, 0.0, 0.0 }
-		};
-		double ctm[] = { 1.0, 0.0, 1.0,
-				0.0, 1.0, 0.0,
-				0.0, 0.0, 0.0 };
-		igt_assert(test_pipe_ctm(data, primary, red_green_blue,
-					 red_green_red, ctm));
-	}
+	data->color_depth = 8;
+	data->drm_format = DRM_FORMAT_XRGB8888;
+	data->mode = igt_output_get_mode(data->output);
+
+	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
+		igt_assert(test_t(data, data->primary, data->ports[port_idx]));
+}
 
-	/* We tests a few values around the expected result because
-	 * the it depends on the hardware we're dealing with, we can
-	 * either get clamped or rounded values and we also need to
-	 * account for odd number of items in the LUTs.
+static void
+run_ctm_tests_for_pipe(data_t *data, enum pipe p,
+		       color_t *expected_colors,
+		       double *ctm,
+		       int iter)
+{
+	double delta;
+	color_t red_green_blue[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+	int port_idx = test_setup(data, p);
+
+	igt_require(port_idx);
+	/*
+	 * CherryView generates values on 10bits that we
+	 * produce with an 8 bits per color framebuffer.
 	 */
-	igt_describe("Compare after applying ctm matrix & identity matrix");
-	igt_subtest_f("pipe-%s-ctm-0-25", kmstest_pipe_name(p)) {
-		color_t expected_colors[] = {
-			{ 0.0, }, { 0.0, }, { 0.0, }
-		};
-		double ctm[] = { 0.25, 0.0,  0.0,
-				 0.0,  0.25, 0.0,
-				 0.0,  0.0,  0.25 };
-		bool success = false;
+	if (expected_colors[0].r == 1.0 && ctm[0] == 100)
+		igt_require(!IS_CHERRYVIEW(data->devid));
 
-		for (i = 0; i < 5; i++) {
-			expected_colors[0].r =
-				expected_colors[1].g =
-				expected_colors[2].b =
-				0.25 + delta * (i - 2);
-			if(test_pipe_ctm(data, primary, red_green_blue,
-					 expected_colors, ctm)) {
-				success = true;
-				break;
-			}
-		}
-		igt_assert(success);
-	}
+	/*
+	 * We assume an 8bits depth per color for degamma/gamma LUTs
+	 * for CRC checks with framebuffer references.
+	 */
+	data->color_depth = 8;
+	delta = 1.0 / (1 << data->color_depth);
+	data->drm_format = DRM_FORMAT_XRGB8888;
+	data->mode = igt_output_get_mode(data->output);
 
-	igt_describe("Compare after applying ctm matrix & identity matrix");
-	igt_subtest_f("pipe-%s-ctm-0-5", kmstest_pipe_name(p)) {
-		color_t expected_colors[] = {
-			{ 0.0, }, { 0.0, }, { 0.0, }
-		};
-		double ctm[] = { 0.5, 0.0, 0.0,
-				 0.0, 0.5, 0.0,
-				 0.0, 0.0, 0.5 };
+	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name) {
 		bool success = false;
-
-		for (i = 0; i < 5; i++) {
+		int i;
+
+		if (!iter)
+			success = test_pipe_ctm(data, data->primary,
+						red_green_blue,
+						expected_colors, ctm,
+						data->ports[port_idx]);
+
+		/*
+		 * We tests a few values around the expected result because
+		 * it depends on the hardware we're dealing with, we can either
+		 * get clamped or rounded values and we also need to account
+		 * for odd number of items in the LUTs.
+		 */
+		for (i = 0; i < iter; i++) {
 			expected_colors[0].r =
 				expected_colors[1].g =
 				expected_colors[2].b =
 				0.5 + delta * (i - 2);
-			if(test_pipe_ctm(data, primary, red_green_blue,
-					 expected_colors, ctm)) {
+			if (test_pipe_ctm(data, data->primary,
+					  red_green_blue, expected_colors,
+					  ctm, data->ports[port_idx])) {
 				success = true;
 				break;
 			}
 		}
 		igt_assert(success);
 	}
+}
 
-	igt_describe("Compare after applying ctm matrix & identity matrix");
-	igt_subtest_f("pipe-%s-ctm-0-75", kmstest_pipe_name(p)) {
-		color_t expected_colors[] = {
-			{ 0.0, }, { 0.0, }, { 0.0, }
-		};
-		double ctm[] = { 0.75, 0.0,  0.0,
-				 0.0,  0.75, 0.0,
-				 0.0,  0.0,  0.75 };
-		bool success = false;
+static void
+run_limited_range_ctm_test_for_pipe(data_t *data, enum pipe p,
+		bool (*test_t)(data_t*, igt_plane_t*, struct chamelium_port*))
+{
+	int port_idx = test_setup(data, p);
 
-		for (i = 0; i < 7; i++) {
-			expected_colors[0].r =
-				expected_colors[1].g =
-				expected_colors[2].b =
-				0.75 + delta * (i - 3);
-			if(test_pipe_ctm(data, primary, red_green_blue,
-					 expected_colors, ctm)) {
-				success = true;
-				break;
+	igt_require(port_idx);
+	igt_require(igt_output_has_prop(data->output, IGT_CONNECTOR_BROADCAST_RGB));
+
+	data->color_depth = 8;
+	data->drm_format = DRM_FORMAT_XRGB8888;
+	data->mode = igt_output_get_mode(data->output);
+
+	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
+		igt_assert(test_t(data, data->primary, data->ports[port_idx]));
+}
+
+static void
+run_tests_for_pipe(data_t *data)
+{
+	enum pipe pipe;
+	struct {
+		const char *name;
+		bool (*test_t)(data_t*, igt_plane_t*, struct chamelium_port*);
+		const char *desc;
+	} gamma_degamma_tests[] = {
+		{ "degamma", test_pipe_degamma,
+		  "Verify that degamma LUT transformation works correctly" },
+
+		{ "gamma", test_pipe_gamma,
+		  "Verify that gamma LUT transformation works correctly" },
+	};
+	struct {
+		const char *name;
+		int iter;
+		color_t colors[3];
+		double ctm[9];
+		const char *desc;
+	} ctm_tests[] = {
+		{ "ctm-red-to-blue", 0,
+			{{ 0.0, 0.0, 1.0 },
+			 { 0.0, 1.0, 0.0 },
+			 { 0.0, 0.0, 1.0 }},
+		  { 0.0, 0.0, 0.0,
+		    0.0, 1.0, 0.0,
+		    1.0, 0.0, 1.0 },
+		  "Check the color transformation from red to blue"
+		},
+		{ "ctm-green-to-red", 0,
+			{{ 1.0, 0.0, 0.0 },
+			 { 1.0, 0.0, 0.0 },
+			 { 0.0, 0.0, 1.0 }},
+		  { 1.0, 1.0, 0.0,
+		    0.0, 0.0, 0.0,
+		    0.0, 0.0, 1.0 },
+		  "Check the color transformation from green to red"
+		},
+		{ "ctm-blue-to-red", 0,
+			{{ 1.0, 0.0, 0.0 },
+			 { 0.0, 1.0, 0.0 },
+			 { 1.0, 0.0, 0.0 }},
+		  { 1.0, 0.0, 1.0,
+		    0.0, 1.0, 0.0,
+		    0.0, 0.0, 0.0 },
+		  "Check the color transformation from blue to red"
+		},
+		{ "ctm-max", 0,
+			{{ 1.0, 0.0, 0.0 },
+			 { 0.0, 1.0, 0.0 },
+			 { 0.0, 0.0, 1.0 }},
+		  { 100.0, 0.0, 0.0,
+		    0.0, 100.0, 0.0,
+		    0.0, 0.0, 100.0 },
+		  "Check the color transformation for maximum transparency"
+		},
+		{ "ctm-negative", 0,
+			{{ 0.0, 0.0, 0.0 },
+			 { 0.0, 0.0, 0.0 },
+			 { 0.0, 0.0, 0.0 }},
+		  { -1.0, 0.0, 0.0,
+		    0.0, -1.0, 0.0,
+		    0.0, 0.0, -1.0 },
+		  "Check the color transformation for negative transparency"
+		},
+		{ "ctm-0-25", 5,
+			{{ 0.0, }, { 0.0, }, { 0.0, }},
+		  { 0.25, 0.0,  0.0,
+		    0.0,  0.25, 0.0,
+		    0.0,  0.0,  0.25 },
+		  "Check the color transformation for 0.25 transparency"
+		},
+		{ "ctm-0-50", 5,
+			{{ 0.0, }, { 0.0, }, { 0.0, }},
+		  { 0.5,  0.0,  0.0,
+		    0.0,  0.5,  0.0,
+		    0.0,  0.0,  0.5 },
+		  "Check the color transformation for 0.5 transparency"
+		},
+		{ "ctm-0-75", 7,
+			{{ 0.0, }, { 0.0, }, { 0.0, }},
+		  { 0.75, 0.0,  0.0,
+		    0.0,  0.75, 0.0,
+		    0.0,  0.0,  0.75 },
+		  "Check the color transformation for 0.75 transparency"
+		},
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(gamma_degamma_tests); i++) {
+		igt_describe_f("%s", gamma_degamma_tests[i].desc);
+		igt_subtest_with_dynamic_f("%s", gamma_degamma_tests[i].name) {
+			for_each_pipe(&data->display, pipe) {
+				run_gamma_degamma_tests_for_pipe(data, pipe,
+								 gamma_degamma_tests[i].test_t);
 			}
 		}
-		igt_assert(success);
 	}
 
-	igt_describe("Compare after applying ctm matrix & identity matrix");
-	igt_subtest_f("pipe-%s-ctm-max", kmstest_pipe_name(p)) {
-		color_t full_rgb[] = {
-			{ 1.0, 0.0, 0.0 },
-			{ 0.0, 1.0, 0.0 },
-			{ 0.0, 0.0, 1.0 }
-		};
-		double ctm[] = { 100.0,   0.0,   0.0,
-				 0.0,   100.0,   0.0,
-				 0.0,     0.0, 100.0 };
-
-		/* CherryView generates values on 10bits that we
-		 * produce with an 8 bits per color framebuffer.
-		 */
-		igt_require(!IS_CHERRYVIEW(data->devid));
-
-		igt_assert(test_pipe_ctm(data, primary, red_green_blue,
-					 full_rgb, ctm));
+	for (i = 0; i < ARRAY_SIZE(ctm_tests); i++) {
+		igt_describe_f("%s", ctm_tests[i].desc);
+		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
+			for_each_pipe(&data->display, pipe) {
+				run_ctm_tests_for_pipe(data, pipe,
+						       ctm_tests[i].colors,
+						       ctm_tests[i].ctm,
+						       ctm_tests[i].iter);
+			}
+		}
 	}
 
 	igt_describe("Compare after applying ctm matrix & identity matrix");
-	igt_subtest_f("pipe-%s-ctm-negative", kmstest_pipe_name(p)) {
-		color_t all_black[] = {
-			{ 0.0, 0.0, 0.0 },
-			{ 0.0, 0.0, 0.0 },
-			{ 0.0, 0.0, 0.0 }
-		};
-		double ctm[] = { -1.0,  0.0,  0.0,
-				 0.0, -1.0,  0.0,
-				 0.0,  0.0, -1.0 };
-		igt_assert(test_pipe_ctm(data, primary, red_green_blue,
-					 all_black, ctm));
+	igt_subtest_with_dynamic("ctm-limited-range") {
+		for_each_pipe(&data->display, pipe) {
+			run_limited_range_ctm_test_for_pipe(data, pipe,
+							    test_pipe_limited_range_ctm);
+		}
 	}
 
-	igt_describe("Compare after applying ctm matrix & identity matrix");
-	igt_subtest_f("pipe-%s-ctm-limited-range", kmstest_pipe_name(p))
-		test_pipe_limited_range_ctm(data, primary);
-
-	igt_describe("Compare maxed out gamma LUT and solid color linear LUT");
-	igt_subtest_f("pipe-%s-degamma", kmstest_pipe_name(p))
-		test_pipe_degamma(data, primary);
-
-	igt_describe("Compare maxed out gamma LUT and solid color linear LUT");
-	igt_subtest_f("pipe-%s-gamma", kmstest_pipe_name(p))
-		test_pipe_gamma(data, primary);
-
-	igt_fixture {
-		disable_degamma(primary->pipe);
-		disable_gamma(primary->pipe);
-		disable_ctm(primary->pipe);
-		igt_display_commit(&data->display);
-	}
 }
 
 igt_main
 {
 	data_t data = {};
-	enum pipe pipe;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -751,9 +692,8 @@ igt_main
 		kmstest_set_vt_graphics_mode();
 	}
 
-	for_each_pipe_static(pipe)
-		igt_subtest_group
-			run_tests_for_pipe(&data, pipe);
+	igt_subtest_group
+		run_tests_for_pipe(&data);
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-- 
2.35.1
