Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C6E6E8B4
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Sep 2021 16:15:51 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri,  3 Sep 2021 19:15:30 +0300
Message-Id: <20210903161532.25874-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20210903161532.25874-1-ville.syrjala@linux.intel.com>
References: <20210903161532.25874-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 4/6] tests/kms_color: Run each subtest
 only for a single connector
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <Bhanuprakash.modem@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

For most of the subtests the used connector should not matter,
so run each subtest just for a single connector.

Suggested-by: Bhanuprakash Modem <Bhanuprakash.modem@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_color.c | 612 +++++++++++++++++++++++-----------------------
 1 file changed, 306 insertions(+), 306 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index dabc6963e9e0..d78c7e211511 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -37,6 +37,10 @@ static void test_pipe_degamma(data_t *data,
 		{ 0.0, 1.0, 0.0 },
 		{ 0.0, 0.0, 1.0 }
 	};
+	drmModeModeInfo *mode;
+	struct igt_fb fb_modeset, fb;
+	igt_crc_t crc_fullgamma, crc_fullcolors;
+	int fb_id, fb_modeset_id;
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
@@ -44,69 +48,65 @@ static void test_pipe_degamma(data_t *data,
 	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	degamma_full = generate_table_max(data->degamma_lut_size);
 
-	for_each_valid_output_on_pipe(&data->display, primary->pipe->pipe, output) {
-		drmModeModeInfo *mode;
-		struct igt_fb fb_modeset, fb;
-		igt_crc_t crc_fullgamma, crc_fullcolors;
-		int fb_id, fb_modeset_id;
+	output = igt_get_single_output_for_pipe(&data->display, primary->pipe->pipe);
+	igt_require(output);
 
-		igt_output_set_pipe(output, primary->pipe->pipe);
-		mode = igt_output_get_mode(output);
+	igt_output_set_pipe(output, primary->pipe->pipe);
+	mode = igt_output_get_mode(output);
 
-		/* Create a framebuffer at the size of the output. */
-		fb_id = igt_create_fb(data->drm_fd,
+	/* Create a framebuffer at the size of the output. */
+	fb_id = igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_NONE,
+			      &fb);
+	igt_assert(fb_id);
+
+	fb_modeset_id = igt_create_fb(data->drm_fd,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      DRM_FORMAT_MOD_NONE,
-				      &fb);
-		igt_assert(fb_id);
+				      &fb_modeset);
+	igt_assert(fb_modeset_id);
 
-		fb_modeset_id = igt_create_fb(data->drm_fd,
-					      mode->hdisplay,
-					      mode->vdisplay,
-					      DRM_FORMAT_XRGB8888,
-					      DRM_FORMAT_MOD_NONE,
-					      &fb_modeset);
-		igt_assert(fb_modeset_id);
+	igt_plane_set_fb(primary, &fb_modeset);
+	disable_ctm(primary->pipe);
+	disable_gamma(primary->pipe);
+	set_degamma(data, primary->pipe, degamma_linear);
+	igt_display_commit(&data->display);
 
-		igt_plane_set_fb(primary, &fb_modeset);
-		disable_ctm(primary->pipe);
-		disable_gamma(primary->pipe);
-		set_degamma(data, primary->pipe, degamma_linear);
-		igt_display_commit(&data->display);
+	/* Draw solid colors with linear degamma transformation. */
+	paint_rectangles(data, mode, red_green_blue, &fb);
+	igt_plane_set_fb(primary, &fb);
+	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
 
-		/* Draw solid colors with linear degamma transformation. */
-		paint_rectangles(data, mode, red_green_blue, &fb);
-		igt_plane_set_fb(primary, &fb);
-		igt_display_commit(&data->display);
-		igt_wait_for_vblank(data->drm_fd,
-				display->pipes[primary->pipe->pipe].crtc_offset);
-		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
+	/* Draw a gradient with degamma LUT to remap all
+	 * values to max red/green/blue.
+	 */
+	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+	igt_plane_set_fb(primary, &fb);
+	set_degamma(data, primary->pipe, degamma_full);
+	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
 
-		/* Draw a gradient with degamma LUT to remap all
-		 * values to max red/green/blue.
-		 */
-		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
-		igt_plane_set_fb(primary, &fb);
-		set_degamma(data, primary->pipe, degamma_full);
-		igt_display_commit(&data->display);
-		igt_wait_for_vblank(data->drm_fd,
-				display->pipes[primary->pipe->pipe].crtc_offset);
-		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
+	/* Verify that the CRC of the software computed output is
+	 * equal to the CRC of the degamma LUT transformation output.
+	 */
+	igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
 
-		/* Verify that the CRC of the software computed output is
-		 * equal to the CRC of the degamma LUT transformation output.
-		 */
-		igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
-
-		disable_degamma(primary->pipe);
-		igt_plane_set_fb(primary, NULL);
-		igt_output_set_pipe(output, PIPE_NONE);
-		igt_display_commit(&data->display);
-		igt_remove_fb(data->drm_fd, &fb);
-		igt_remove_fb(data->drm_fd, &fb_modeset);
-	}
+	disable_degamma(primary->pipe);
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit(&data->display);
+	igt_remove_fb(data->drm_fd, &fb);
+	igt_remove_fb(data->drm_fd, &fb_modeset);
 
 	free_lut(degamma_linear);
 	free_lut(degamma_full);
@@ -127,73 +127,73 @@ static void test_pipe_gamma(data_t *data,
 		{ 0.0, 1.0, 0.0 },
 		{ 0.0, 0.0, 1.0 }
 	};
+	drmModeModeInfo *mode;
+	struct igt_fb fb_modeset, fb;
+	igt_crc_t crc_fullgamma, crc_fullcolors;
+	int fb_id, fb_modeset_id;
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
 	gamma_full = generate_table_max(data->gamma_lut_size);
 
-	for_each_valid_output_on_pipe(&data->display, primary->pipe->pipe, output) {
-		drmModeModeInfo *mode;
-		struct igt_fb fb_modeset, fb;
-		igt_crc_t crc_fullgamma, crc_fullcolors;
-		int fb_id, fb_modeset_id;
+	output = igt_get_single_output_for_pipe(&data->display, primary->pipe->pipe);
+	igt_require(output);
 
-		igt_output_set_pipe(output, primary->pipe->pipe);
-		mode = igt_output_get_mode(output);
+	igt_output_set_pipe(output, primary->pipe->pipe);
+	mode = igt_output_get_mode(output);
 
-		/* Create a framebuffer at the size of the output. */
-		fb_id = igt_create_fb(data->drm_fd,
+	/* Create a framebuffer at the size of the output. */
+	fb_id = igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_NONE,
+			      &fb);
+	igt_assert(fb_id);
+
+	fb_modeset_id = igt_create_fb(data->drm_fd,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      DRM_FORMAT_MOD_NONE,
-				      &fb);
-		igt_assert(fb_id);
+				      &fb_modeset);
+	igt_assert(fb_modeset_id);
 
-		fb_modeset_id = igt_create_fb(data->drm_fd,
-					      mode->hdisplay,
-					      mode->vdisplay,
-					      DRM_FORMAT_XRGB8888,
-					      DRM_FORMAT_MOD_NONE,
-					      &fb_modeset);
-		igt_assert(fb_modeset_id);
+	igt_plane_set_fb(primary, &fb_modeset);
+	disable_ctm(primary->pipe);
+	disable_degamma(primary->pipe);
+	set_gamma(data, primary->pipe, gamma_full);
+	igt_display_commit(&data->display);
 
-		igt_plane_set_fb(primary, &fb_modeset);
-		disable_ctm(primary->pipe);
-		disable_degamma(primary->pipe);
-		set_gamma(data, primary->pipe, gamma_full);
-		igt_display_commit(&data->display);
+	/* Draw solid colors with no gamma transformation. */
+	paint_rectangles(data, mode, red_green_blue, &fb);
+	igt_plane_set_fb(primary, &fb);
+	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
 
-		/* Draw solid colors with no gamma transformation. */
-		paint_rectangles(data, mode, red_green_blue, &fb);
-		igt_plane_set_fb(primary, &fb);
-		igt_display_commit(&data->display);
-		igt_wait_for_vblank(data->drm_fd,
-				display->pipes[primary->pipe->pipe].crtc_offset);
-		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
+	/* Draw a gradient with gamma LUT to remap all values
+	 * to max red/green/blue.
+	 */
+	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+	igt_plane_set_fb(primary, &fb);
+	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
 
-		/* Draw a gradient with gamma LUT to remap all values
-		 * to max red/green/blue.
-		 */
-		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
-		igt_plane_set_fb(primary, &fb);
-		igt_display_commit(&data->display);
-		igt_wait_for_vblank(data->drm_fd,
-				display->pipes[primary->pipe->pipe].crtc_offset);
-		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
+	/* Verify that the CRC of the software computed output is
+	 * equal to the CRC of the gamma LUT transformation output.
+	 */
+	igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
 
-		/* Verify that the CRC of the software computed output is
-		 * equal to the CRC of the gamma LUT transformation output.
-		 */
-		igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
-
-		disable_gamma(primary->pipe);
-		igt_plane_set_fb(primary, NULL);
-		igt_output_set_pipe(output, PIPE_NONE);
-		igt_display_commit(&data->display);
-		igt_remove_fb(data->drm_fd, &fb);
-		igt_remove_fb(data->drm_fd, &fb_modeset);
-	}
+	disable_gamma(primary->pipe);
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit(&data->display);
+	igt_remove_fb(data->drm_fd, &fb);
+	igt_remove_fb(data->drm_fd, &fb_modeset);
 
 	free_lut(gamma_full);
 }
@@ -216,6 +216,10 @@ static void test_pipe_legacy_gamma(data_t *data,
 	drmModeCrtc *kms_crtc;
 	uint32_t i, legacy_lut_size;
 	uint16_t *red_lut, *green_lut, *blue_lut;
+	drmModeModeInfo *mode;
+	struct igt_fb fb_modeset, fb;
+	igt_crc_t crc_fullgamma, crc_fullcolors;
+	int fb_id, fb_modeset_id;
 
 	kms_crtc = drmModeGetCrtc(data->drm_fd, primary->pipe->crtc_id);
 	legacy_lut_size = kms_crtc->gamma_size;
@@ -225,80 +229,76 @@ static void test_pipe_legacy_gamma(data_t *data,
 	green_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
 	blue_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
 
-	for_each_valid_output_on_pipe(&data->display, primary->pipe->pipe, output) {
-		drmModeModeInfo *mode;
-		struct igt_fb fb_modeset, fb;
-		igt_crc_t crc_fullgamma, crc_fullcolors;
-		int fb_id, fb_modeset_id;
+	output = igt_get_single_output_for_pipe(&data->display, primary->pipe->pipe);
+	igt_require(output);
 
-		igt_output_set_pipe(output, primary->pipe->pipe);
-		mode = igt_output_get_mode(output);
+	igt_output_set_pipe(output, primary->pipe->pipe);
+	mode = igt_output_get_mode(output);
 
-		/* Create a framebuffer at the size of the output. */
-		fb_id = igt_create_fb(data->drm_fd,
+	/* Create a framebuffer at the size of the output. */
+	fb_id = igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_NONE,
+			      &fb);
+	igt_assert(fb_id);
+
+	fb_modeset_id = igt_create_fb(data->drm_fd,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      DRM_FORMAT_MOD_NONE,
-				      &fb);
-		igt_assert(fb_id);
-
-		fb_modeset_id = igt_create_fb(data->drm_fd,
-					      mode->hdisplay,
-					      mode->vdisplay,
-					      DRM_FORMAT_XRGB8888,
-					      DRM_FORMAT_MOD_NONE,
-					      &fb_modeset);
-		igt_assert(fb_modeset_id);
-
-		igt_plane_set_fb(primary, &fb_modeset);
-		disable_degamma(primary->pipe);
-		disable_gamma(primary->pipe);
-		disable_ctm(primary->pipe);
-		igt_display_commit(&data->display);
-
-		/* Draw solid colors with no gamma transformation. */
-		paint_rectangles(data, mode, red_green_blue, &fb);
-		igt_plane_set_fb(primary, &fb);
-		igt_display_commit(&data->display);
-		igt_wait_for_vblank(data->drm_fd,
-				display->pipes[primary->pipe->pipe].crtc_offset);
-		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
-
-		/* Draw a gradient with gamma LUT to remap all values
-		 * to max red/green/blue.
-		 */
-		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
-		igt_plane_set_fb(primary, &fb);
-
-		red_lut[0] = green_lut[0] = blue_lut[0] = 0;
-		for (i = 1; i < legacy_lut_size; i++)
-			red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
-		igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc_id,
-						  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
-		igt_display_commit(&data->display);
-		igt_wait_for_vblank(data->drm_fd,
-				display->pipes[primary->pipe->pipe].crtc_offset);
-		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
-
-		/* Verify that the CRC of the software computed output is
-		 * equal to the CRC of the gamma LUT transformation output.
-		 */
-		igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
-
-		/* Reset output. */
-		for (i = 1; i < legacy_lut_size; i++)
-			red_lut[i] = green_lut[i] = blue_lut[i] = i << 8;
-
-		igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc_id,
-						  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
-		igt_display_commit(&data->display);
-
-		igt_plane_set_fb(primary, NULL);
-		igt_output_set_pipe(output, PIPE_NONE);
-		igt_remove_fb(data->drm_fd, &fb);
-		igt_remove_fb(data->drm_fd, &fb_modeset);
-	}
+				      &fb_modeset);
+	igt_assert(fb_modeset_id);
+
+	igt_plane_set_fb(primary, &fb_modeset);
+	disable_degamma(primary->pipe);
+	disable_gamma(primary->pipe);
+	disable_ctm(primary->pipe);
+	igt_display_commit(&data->display);
+
+	/* Draw solid colors with no gamma transformation. */
+	paint_rectangles(data, mode, red_green_blue, &fb);
+	igt_plane_set_fb(primary, &fb);
+	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
+
+	/* Draw a gradient with gamma LUT to remap all values
+	 * to max red/green/blue.
+	 */
+	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+	igt_plane_set_fb(primary, &fb);
+
+	red_lut[0] = green_lut[0] = blue_lut[0] = 0;
+	for (i = 1; i < legacy_lut_size; i++)
+		red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
+	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc_id,
+					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
+	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
+
+	/* Verify that the CRC of the software computed output is
+	 * equal to the CRC of the gamma LUT transformation output.
+	 */
+	igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
+
+	/* Reset output. */
+	for (i = 1; i < legacy_lut_size; i++)
+		red_lut[i] = green_lut[i] = blue_lut[i] = i << 8;
+
+	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc_id,
+					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
+	igt_display_commit(&data->display);
+
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_remove_fb(data->drm_fd, &fb);
+	igt_remove_fb(data->drm_fd, &fb_modeset);
 
 	free(red_lut);
 	free(green_lut);
@@ -331,93 +331,93 @@ static void test_pipe_legacy_gamma_reset(data_t *data,
 		degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	gamma_zero = generate_table_zero(data->gamma_lut_size);
 
-	for_each_valid_output_on_pipe(&data->display, primary->pipe->pipe, output) {
-		igt_output_set_pipe(output, primary->pipe->pipe);
+	output = igt_get_single_output_for_pipe(&data->display, primary->pipe->pipe);
+	igt_require(output);
 
-		/* Ensure we have a clean state to start with. */
-		disable_degamma(primary->pipe);
-		disable_ctm(primary->pipe);
-		disable_gamma(primary->pipe);
-		igt_display_commit(&data->display);
+	igt_output_set_pipe(output, primary->pipe->pipe);
 
-		/* Set a degama & gamma LUT and a CTM using the
-		 * properties and verify the content of the
-		 * properties. */
-		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
-			set_degamma(data, primary->pipe, degamma_linear);
-		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM))
-			set_ctm(primary->pipe, ctm_identity);
-		set_gamma(data, primary->pipe, gamma_zero);
-		igt_display_commit(&data->display);
+	/* Ensure we have a clean state to start with. */
+	disable_degamma(primary->pipe);
+	disable_ctm(primary->pipe);
+	disable_gamma(primary->pipe);
+	igt_display_commit(&data->display);
 
-		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT)) {
-			blob = get_blob(data, primary->pipe, IGT_CRTC_DEGAMMA_LUT);
-			igt_assert(blob &&
-				   blob->length == (sizeof(struct drm_color_lut) *
-						    data->degamma_lut_size));
-			drmModeFreePropertyBlob(blob);
-		}
+	/* Set a degama & gamma LUT and a CTM using the
+	 * properties and verify the content of the
+	 * properties. */
+	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
+		set_degamma(data, primary->pipe, degamma_linear);
+	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM))
+		set_ctm(primary->pipe, ctm_identity);
+	set_gamma(data, primary->pipe, gamma_zero);
+	igt_display_commit(&data->display);
 
-		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM)) {
-			blob = get_blob(data, primary->pipe, IGT_CRTC_CTM);
-			igt_assert(blob &&
-				   blob->length == sizeof(struct drm_color_ctm));
-			drmModeFreePropertyBlob(blob);
-		}
-
-		blob = get_blob(data, primary->pipe, IGT_CRTC_GAMMA_LUT);
+	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT)) {
+		blob = get_blob(data, primary->pipe, IGT_CRTC_DEGAMMA_LUT);
 		igt_assert(blob &&
 			   blob->length == (sizeof(struct drm_color_lut) *
-					    data->gamma_lut_size));
-		lut = (struct drm_color_lut *) blob->data;
-		for (i = 0; i < data->gamma_lut_size; i++)
-			igt_assert(lut[i].red == 0 &&
-				   lut[i].green == 0 &&
-				   lut[i].blue == 0);
+					    data->degamma_lut_size));
 		drmModeFreePropertyBlob(blob);
+	}
 
-		/* Set a gamma LUT using the legacy ioctl and verify
-		 * the content of the GAMMA_LUT property is changed
-		 * and that CTM and DEGAMMA_LUT are empty. */
-		kms_crtc = drmModeGetCrtc(data->drm_fd, primary->pipe->crtc_id);
-		legacy_lut_size = kms_crtc->gamma_size;
-		drmModeFreeCrtc(kms_crtc);
+	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM)) {
+		blob = get_blob(data, primary->pipe, IGT_CRTC_CTM);
+		igt_assert(blob &&
+			   blob->length == sizeof(struct drm_color_ctm));
+		drmModeFreePropertyBlob(blob);
+	}
 
-		red_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
-		green_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
-		blue_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
+	blob = get_blob(data, primary->pipe, IGT_CRTC_GAMMA_LUT);
+	igt_assert(blob &&
+		   blob->length == (sizeof(struct drm_color_lut) *
+				    data->gamma_lut_size));
+	lut = (struct drm_color_lut *) blob->data;
+	for (i = 0; i < data->gamma_lut_size; i++)
+		igt_assert(lut[i].red == 0 &&
+			   lut[i].green == 0 &&
+			   lut[i].blue == 0);
+	drmModeFreePropertyBlob(blob);
 
-		for (i = 0; i < legacy_lut_size; i++)
-			red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
+	/* Set a gamma LUT using the legacy ioctl and verify
+	 * the content of the GAMMA_LUT property is changed
+	 * and that CTM and DEGAMMA_LUT are empty. */
+	kms_crtc = drmModeGetCrtc(data->drm_fd, primary->pipe->crtc_id);
+	legacy_lut_size = kms_crtc->gamma_size;
+	drmModeFreeCrtc(kms_crtc);
 
-		igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd,
-						  primary->pipe->crtc_id,
-						  legacy_lut_size,
-						  red_lut, green_lut, blue_lut),
-			      0);
-		igt_display_commit(&data->display);
+	red_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
+	green_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
+	blue_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
 
-		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
-			igt_assert(get_blob(data, primary->pipe,
-					    IGT_CRTC_DEGAMMA_LUT) == NULL);
+	for (i = 0; i < legacy_lut_size; i++)
+		red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
 
-		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM))
-			igt_assert(get_blob(data, primary->pipe, IGT_CRTC_CTM) == NULL);
+	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd,
+					  primary->pipe->crtc_id,
+					  legacy_lut_size,
+					  red_lut, green_lut, blue_lut), 0);
+	igt_display_commit(&data->display);
 
-		blob = get_blob(data, primary->pipe, IGT_CRTC_GAMMA_LUT);
-		igt_assert(blob &&
-			   blob->length == (sizeof(struct drm_color_lut) *
-					    legacy_lut_size));
-		lut = (struct drm_color_lut *) blob->data;
-		for (i = 0; i < legacy_lut_size; i++)
-			igt_assert(lut[i].red == 0xffff &&
-				   lut[i].green == 0xffff &&
-				   lut[i].blue == 0xffff);
-		drmModeFreePropertyBlob(blob);
+	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
+		igt_assert(get_blob(data, primary->pipe,
+				    IGT_CRTC_DEGAMMA_LUT) == NULL);
 
-		igt_plane_set_fb(primary, NULL);
-		igt_output_set_pipe(output, PIPE_NONE);
-	}
+	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM))
+		igt_assert(get_blob(data, primary->pipe, IGT_CRTC_CTM) == NULL);
+
+	blob = get_blob(data, primary->pipe, IGT_CRTC_GAMMA_LUT);
+	igt_assert(blob &&
+		   blob->length == (sizeof(struct drm_color_lut) *
+				    legacy_lut_size));
+	lut = (struct drm_color_lut *) blob->data;
+	for (i = 0; i < legacy_lut_size; i++)
+		igt_assert(lut[i].red == 0xffff &&
+			   lut[i].green == 0xffff &&
+			   lut[i].blue == 0xffff);
+	drmModeFreePropertyBlob(blob);
+
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
 
 	free_lut(degamma_linear);
 	free_lut(gamma_zero);
@@ -442,84 +442,84 @@ static bool test_pipe_ctm(data_t *data,
 	igt_output_t *output;
 	bool ret = true;
 	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode;
+	struct igt_fb fb_modeset, fb;
+	igt_crc_t crc_software, crc_hardware;
+	int fb_id, fb_modeset_id;
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
 
 	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
 
-	for_each_valid_output_on_pipe(&data->display, primary->pipe->pipe, output) {
-		drmModeModeInfo *mode;
-		struct igt_fb fb_modeset, fb;
-		igt_crc_t crc_software, crc_hardware;
-		int fb_id, fb_modeset_id;
+	output = igt_get_single_output_for_pipe(&data->display, primary->pipe->pipe);
+	igt_require(output);
 
-		igt_output_set_pipe(output, primary->pipe->pipe);
-		mode = igt_output_get_mode(output);
+	igt_output_set_pipe(output, primary->pipe->pipe);
+	mode = igt_output_get_mode(output);
 
-		/* Create a framebuffer at the size of the output. */
-		fb_id = igt_create_fb(data->drm_fd,
+	/* Create a framebuffer at the size of the output. */
+	fb_id = igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_NONE,
+			      &fb);
+	igt_assert(fb_id);
+
+	fb_modeset_id = igt_create_fb(data->drm_fd,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      DRM_FORMAT_MOD_NONE,
-				      &fb);
-		igt_assert(fb_id);
+				      &fb_modeset);
+	igt_assert(fb_modeset_id);
+	igt_plane_set_fb(primary, &fb_modeset);
 
-		fb_modeset_id = igt_create_fb(data->drm_fd,
-					      mode->hdisplay,
-					      mode->vdisplay,
-					      DRM_FORMAT_XRGB8888,
-					      DRM_FORMAT_MOD_NONE,
-					      &fb_modeset);
-		igt_assert(fb_modeset_id);
-		igt_plane_set_fb(primary, &fb_modeset);
-
-		/*
-		 * Don't program LUT's for max CTM cases, as limitation of
-		 * representing intermediate values between 0 and 1.0 causes
-		 * rounding issues and inaccuracies leading to crc mismatch.
-		 */
-		if (memcmp(before, after, sizeof(color_t))) {
-			set_degamma(data, primary->pipe, degamma_linear);
-			set_gamma(data, primary->pipe, gamma_linear);
-		} else {
-			/* Disable Degamma and Gamma for ctm max test */
-			disable_degamma(primary->pipe);
-			disable_gamma(primary->pipe);
-		}
-
-		disable_ctm(primary->pipe);
-		igt_display_commit(&data->display);
-
-		paint_rectangles(data, mode, after, &fb);
-		igt_plane_set_fb(primary, &fb);
-		set_ctm(primary->pipe, ctm_identity);
-		igt_display_commit(&data->display);
-		igt_wait_for_vblank(data->drm_fd,
-				display->pipes[primary->pipe->pipe].crtc_offset);
-		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_software);
-
-		/* With CTM transformation. */
-		paint_rectangles(data, mode, before, &fb);
-		igt_plane_set_fb(primary, &fb);
-		set_ctm(primary->pipe, ctm_matrix);
-		igt_display_commit(&data->display);
-		igt_wait_for_vblank(data->drm_fd,
-				display->pipes[primary->pipe->pipe].crtc_offset);
-		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hardware);
-
-		/* Verify that the CRC of the software computed output is
-		 * equal to the CRC of the CTM matrix transformation output.
-		 */
-		ret &= !igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &crc_hardware);
-
-		igt_plane_set_fb(primary, NULL);
-		igt_output_set_pipe(output, PIPE_NONE);
-		igt_remove_fb(data->drm_fd, &fb);
-		igt_remove_fb(data->drm_fd, &fb_modeset);
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
 	}
 
+	disable_ctm(primary->pipe);
+	igt_display_commit(&data->display);
+
+	paint_rectangles(data, mode, after, &fb);
+	igt_plane_set_fb(primary, &fb);
+	set_ctm(primary->pipe, ctm_identity);
+	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_software);
+
+	/* With CTM transformation. */
+	paint_rectangles(data, mode, before, &fb);
+	igt_plane_set_fb(primary, &fb);
+	set_ctm(primary->pipe, ctm_matrix);
+	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hardware);
+
+	/* Verify that the CRC of the software computed output is
+	 * equal to the CRC of the CTM matrix transformation output.
+	 */
+	ret &= !igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &crc_hardware);
+
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_remove_fb(data->drm_fd, &fb);
+	igt_remove_fb(data->drm_fd, &fb_modeset);
+
 	free_lut(degamma_linear);
 	free_lut(gamma_linear);
 
-- 
2.31.1
