Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE73410E277
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Oct 2022 17:03:38 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Oct 2022 22:34:41 +0530
Message-Id: <20221012170441.1061-2-swati2.sharma@intel.com>
In-Reply-To: <20221012170441.1061-1-swati2.sharma@intel.com>
References: <20221012170441.1061-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] tests/kms_atomic: Convert tests to
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

Subtests are converted to dynamic subtests.
From the fixture for_each_pipe_with_valid_output()
is removed and put at subtest level to give flexibility to
user to test all pipes/output combinations. However,
restricted to 1pipe/1output combination as originally
written in the test. Code rework is done to accommodate
above changes

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_atomic.c | 892 +++++++++++++++++++++++----------------------
 1 file changed, 462 insertions(+), 430 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index b352169d..c35e1fec 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -52,6 +52,15 @@
 
 IGT_TEST_DESCRIPTION("Test atomic modesetting API.");
 
+/* Common test data. */
+typedef struct {
+	igt_display_t display;
+	igt_plane_t *primary;
+	igt_pipe_t *pipe;
+	int drm_fd;
+	igt_fb_t fb;
+} data_t;
+
 enum kms_atomic_check_relax {
 	ATOMIC_RELAX_NONE = 0,
 	CRTC_RELAX_MODE = (1 << 0),
@@ -283,8 +292,8 @@ static uint32_t plane_get_igt_format(igt_plane_t *plane)
 }
 
 static void
-plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
-				   igt_plane_t *primary, igt_plane_t *overlay,
+plane_primary_overlay_mutable_zpos(data_t *data, igt_output_t *output,
+				   igt_plane_t *overlay,
 				   uint32_t format_primary, uint32_t format_overlay)
 {
 	struct igt_fb fb_primary, fb_overlay;
@@ -299,17 +308,17 @@ plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
 	uint32_t w_overlay = mode->hdisplay / 2;
 	uint32_t h_overlay = mode->vdisplay / 2;
 
-	igt_create_color_pattern_fb(pipe->display->drm_fd,
+	igt_create_color_pattern_fb(data->drm_fd,
 				    w, h, format_primary, I915_TILING_NONE,
 				    0.2, 0.2, 0.2, &fb_primary);
 
-	igt_create_color_pattern_fb(pipe->display->drm_fd,
+	igt_create_color_pattern_fb(data->drm_fd,
 				    w_overlay, h_overlay,
 				    format_overlay, I915_TILING_NONE,
 				    0.2, 0.2, 0.2, &fb_overlay);
 
 	/* Draw a hole in the overlay */
-	cr = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_overlay);
+	cr = igt_get_cairo_ctx(data->drm_fd, &fb_overlay);
 	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
 	igt_paint_color_alpha(cr, w_overlay / 4, h_overlay / 4,
 			      w_overlay / 2, h_overlay / 2,
@@ -317,33 +326,33 @@ plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
 	cairo_set_operator(cr, CAIRO_OPERATOR_OVER);
 	igt_put_cairo_ctx(cr);
 
-	igt_plane_set_fb(primary, &fb_primary);
+	igt_plane_set_fb(data->primary, &fb_primary);
 	igt_plane_set_fb(overlay, &fb_overlay);
 
 	igt_plane_set_position(overlay, w_overlay / 2, h_overlay / 2);
 
-	igt_plane_set_prop_value(primary, IGT_PLANE_ZPOS, 0);
+	igt_plane_set_prop_value(data->primary, IGT_PLANE_ZPOS, 0);
 	igt_plane_set_prop_value(overlay, IGT_PLANE_ZPOS, 1);
 
 	igt_info("Committing with overlay on top, it has a hole "\
 		 "through which the primary should be seen\n");
-	plane_commit(primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	plane_commit(data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	igt_assert_eq_u64(igt_plane_get_prop(primary, IGT_PLANE_ZPOS), 0);
+	igt_assert_eq_u64(igt_plane_get_prop(data->primary, IGT_PLANE_ZPOS), 0);
 	igt_assert_eq_u64(igt_plane_get_prop(overlay, IGT_PLANE_ZPOS), 1);
 
-	igt_plane_set_prop_value(primary, IGT_PLANE_ZPOS, 1);
+	igt_plane_set_prop_value(data->primary, IGT_PLANE_ZPOS, 1);
 	igt_plane_set_prop_value(overlay, IGT_PLANE_ZPOS, 0);
 
 	igt_info("Committing with primary on top, only the primary "\
 		 "should be visible\n");
-	plane_commit(primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	plane_commit(data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	igt_assert_eq_u64(igt_plane_get_prop(primary, IGT_PLANE_ZPOS), 1);
+	igt_assert_eq_u64(igt_plane_get_prop(data->primary, IGT_PLANE_ZPOS), 1);
 	igt_assert_eq_u64(igt_plane_get_prop(overlay, IGT_PLANE_ZPOS), 0);
 
 	/* Draw a hole in the primary exactly on top of the overlay plane */
-	cr = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_primary);
+	cr = igt_get_cairo_ctx(data->drm_fd, &fb_primary);
 	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
 	igt_paint_color_alpha(cr, w_overlay / 2, h_overlay / 2,
 			      w_overlay, h_overlay,
@@ -353,20 +362,19 @@ plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
 
 	igt_info("Committing with a hole in the primary through "\
 		 "which the underlay should be seen\n");
-	plane_commit(primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	plane_commit(data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	/* Reset it back to initial state */
-	igt_plane_set_prop_value(primary, IGT_PLANE_ZPOS, 0);
+	igt_plane_set_prop_value(data->primary, IGT_PLANE_ZPOS, 0);
 	igt_plane_set_prop_value(overlay, IGT_PLANE_ZPOS, 1);
-	plane_commit(primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	plane_commit(data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	igt_assert_eq_u64(igt_plane_get_prop(primary, IGT_PLANE_ZPOS), 0);
+	igt_assert_eq_u64(igt_plane_get_prop(data->primary, IGT_PLANE_ZPOS), 0);
 	igt_assert_eq_u64(igt_plane_get_prop(overlay, IGT_PLANE_ZPOS), 1);
 }
 
 static void
-plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
-		     igt_output_t *output, igt_plane_t *primary, int n_planes)
+plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_planes)
 {
 	cairo_t *cr;
 	struct igt_fb fb_ref;
@@ -380,7 +388,7 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
 
 	memset(plane_ptr, 0, n_planes * sizeof(igt_plane_t *));
 
-	igt_require_pipe_crc(display->drm_fd);
+	igt_require_pipe_crc(data->drm_fd);
 	mode = igt_output_get_mode(output);
 
 	/* For lower plane */
@@ -391,36 +399,36 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
 	w_upper = 64;
 	h_upper = 64;
 
-	igt_create_color_fb(display->drm_fd,
+	igt_create_color_fb(data->drm_fd,
 			    w_lower, h_lower,
 			    DRM_FORMAT_XRGB8888,
 			    I915_TILING_NONE,
 			    0.0, 0.0, 0.0, &fb_ref);
 
 	/* Create reference image */
-	cr = igt_get_cairo_ctx(display->drm_fd, &fb_ref);
+	cr = igt_get_cairo_ctx(data->drm_fd, &fb_ref);
 	igt_assert(cairo_status(cr) == 0);
 	igt_paint_color(cr, 0, 0, w_lower, h_lower, 0.0, 0.0, 1.0);
 	igt_paint_color(cr, w_upper / 2, h_upper / 2, w_upper, h_upper, 1.0, 1.0, 0.0);
 	igt_put_cairo_ctx(cr);
-	igt_plane_set_fb(primary, &fb_ref);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_plane_set_fb(data->primary, &fb_ref);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	/* Create the pipe_crc object for this pipe */
-	pipe_crc = igt_pipe_crc_new(pipe->display->drm_fd, pipe->pipe,
+	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
 				    INTEL_PIPE_CRC_SOURCE_AUTO);
 
 	/* Get reference crc */
 	igt_pipe_crc_start(pipe_crc);
-	igt_pipe_crc_get_current(display->drm_fd, pipe_crc, &ref_crc);
+	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
 
-	igt_plane_set_fb(primary, NULL);
+	igt_plane_set_fb(data->primary, NULL);
 
 	for (int k = 0; k < n_planes; k++) {
 		int zpos;
 		igt_plane_t *temp;
 
-		temp = &display->pipes[pipe->pipe].planes[k];
+		temp = &data->display.pipes[pipe].planes[k];
 
 		if (!igt_plane_has_prop(temp, IGT_PLANE_ZPOS))
 			continue;
@@ -431,14 +439,14 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
 		plane_ptr[zpos] = temp;
 	}
 
-	fb_id_lower = igt_create_color_fb(display->drm_fd,
+	fb_id_lower = igt_create_color_fb(data->drm_fd,
 					  w_lower, h_lower,
 					  DRM_FORMAT_XRGB8888,
 					  I915_TILING_NONE,
 					  0.0, 0.0, 1.0, &fb_lower);
 	igt_assert(fb_id_lower);
 
-	fb_id_upper = igt_create_color_fb(display->drm_fd,
+	fb_id_upper = igt_create_color_fb(data->drm_fd,
 					  w_upper, h_upper,
 					  DRM_FORMAT_XRGB8888,
 					  I915_TILING_NONE,
@@ -481,8 +489,8 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
 
 		igt_info("Committing with the plane[%d] underneath "\
 			 "plane[%d]\n", i, (i + 1));
-		igt_display_commit2(display, COMMIT_ATOMIC);
-		igt_pipe_crc_get_current(pipe->display->drm_fd, pipe_crc, &new_crc);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &new_crc);
 
 		igt_assert_crc_equal(&ref_crc, &new_crc);
 
@@ -490,22 +498,20 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
 		igt_plane_set_fb(plane_upper, NULL);
 	}
 
-	igt_remove_fb(display->drm_fd, &fb_ref);
-	igt_remove_fb(display->drm_fd, &fb_lower);
-	igt_remove_fb(display->drm_fd, &fb_upper);
+	igt_remove_fb(data->drm_fd, &fb_ref);
+	igt_remove_fb(data->drm_fd, &fb_lower);
+	igt_remove_fb(data->drm_fd, &fb_upper);
 }
 
-static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, igt_plane_t *plane)
+static void plane_overlay(data_t *data, igt_output_t *output, igt_plane_t *plane,
+			  uint32_t format)
 {
-	drmModeModeInfo *mode = igt_output_get_mode(output);
-	uint32_t format = plane_get_igt_format(plane);
 	struct igt_fb fb;
+	drmModeModeInfo *mode = igt_output_get_mode(output);
 	uint32_t w = mode->hdisplay / 2;
 	uint32_t h = mode->vdisplay / 2;
 
-	igt_require(format != 0);
-
-	igt_create_pattern_fb(pipe->display->drm_fd, w, h,
+	igt_create_pattern_fb(data->drm_fd, w, h,
 			      format, I915_TILING_NONE, &fb);
 
 	igt_plane_set_fb(plane, &fb);
@@ -538,106 +544,103 @@ static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, igt_plane_t *p
 	igt_plane_set_position(plane, 0, 0);
 	plane_commit(plane, COMMIT_LEGACY, ATOMIC_RELAX_NONE);
 
-	igt_remove_fb(pipe->display->drm_fd, &fb);
+	igt_remove_fb(data->drm_fd, &fb);
 }
 
-static void plane_primary(igt_pipe_t *pipe, igt_plane_t *plane, struct igt_fb *fb)
+static void plane_primary(data_t *data)
 {
 	struct igt_fb fb2;
 
-	igt_create_color_pattern_fb(pipe->display->drm_fd,
-				    fb->width, fb->height,
-				    fb->drm_format, I915_TILING_NONE,
+	igt_create_color_pattern_fb(data->drm_fd,
+				    data->fb.width, data->fb.height,
+				    data->fb.drm_format, I915_TILING_NONE,
 				    0.2, 0.2, 0.2, &fb2);
 
 	/*
 	 * Flip the primary plane using the atomic API, and double-check
 	 * state is what we think it should be.
 	 */
-	igt_plane_set_fb(plane, &fb2);
-	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	igt_plane_set_fb(data->primary, &fb2);
+	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	/* Restore the primary plane and check the state matches the old. */
-	igt_plane_set_fb(plane, fb);
-	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	igt_plane_set_fb(data->primary, &data->fb);
+	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	/*
 	 * Set the plane through the legacy CRTC/primary-plane API, and
 	 * verify through atomic.
 	 */
-	igt_plane_set_fb(plane, &fb2);
-	crtc_commit(pipe, plane, COMMIT_LEGACY, CRTC_RELAX_MODE);
+	igt_plane_set_fb(data->primary, &fb2);
+	crtc_commit(data->pipe, data->primary, COMMIT_LEGACY, CRTC_RELAX_MODE);
 
 	/*
 	 * Restore the plane to its original settings through the legacy CRTC
 	 * API, and verify through atomic.
 	 */
-	igt_plane_set_fb(plane, fb);
-	crtc_commit(pipe, plane, COMMIT_LEGACY, CRTC_RELAX_MODE);
+	igt_plane_set_fb(data->primary, &data->fb);
+	crtc_commit(data->pipe, data->primary, COMMIT_LEGACY, CRTC_RELAX_MODE);
 
 	/*
 	 * Set the plane through the universal setplane API, and
 	 * verify through atomic.
 	 */
-	igt_plane_set_fb(plane, &fb2);
-	plane_commit(plane, COMMIT_UNIVERSAL, ATOMIC_RELAX_NONE);
+	igt_plane_set_fb(data->primary, &fb2);
+	plane_commit(data->primary, COMMIT_UNIVERSAL, ATOMIC_RELAX_NONE);
 }
 
-static void test_only(igt_pipe_t *pipe_obj, igt_plane_t *primary,
-		      igt_output_t *output, uint32_t format)
+static void test_only(data_t *data, igt_output_t *output, enum pipe pipe, uint32_t format)
 {
-	drmModeModeInfo *mode = igt_output_get_mode(output);
 	struct igt_fb fb;
 	uint64_t old_plane_values[IGT_NUM_PLANE_PROPS], old_crtc_values[IGT_NUM_CRTC_PROPS];
+	drmModeModeInfo *mode = igt_output_get_mode(output);
 
-	plane_get_current_state(primary, old_plane_values);
-	crtc_get_current_state(pipe_obj, old_crtc_values);
+	plane_get_current_state(data->primary, old_plane_values);
+	crtc_get_current_state(data->pipe, old_crtc_values);
 
 	igt_assert(!old_crtc_values[IGT_CRTC_MODE_ID]);
 
-	igt_create_pattern_fb(pipe_obj->display->drm_fd,
-			     mode->hdisplay, mode->vdisplay,
-			     format, I915_TILING_NONE, &fb);
-	igt_plane_set_fb(primary, &fb);
-	igt_output_set_pipe(output, pipe_obj->pipe);
+	igt_create_pattern_fb(data->drm_fd,
+			      mode->hdisplay, mode->vdisplay,
+			      format, I915_TILING_NONE, &fb);
+	igt_plane_set_fb(data->primary, &fb);
+	igt_output_set_pipe(output, pipe);
 
-	igt_display_commit_atomic(pipe_obj->display, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	/* Check the state, should still be old state */
-	crtc_check_current_state(pipe_obj, old_crtc_values, old_plane_values, ATOMIC_RELAX_NONE);
-	plane_check_current_state(primary, old_plane_values, ATOMIC_RELAX_NONE);
+	crtc_check_current_state(data->pipe, old_crtc_values, old_plane_values, ATOMIC_RELAX_NONE);
+	plane_check_current_state(data->primary, old_plane_values, ATOMIC_RELAX_NONE);
 
 	/*
 	 * Enable the plane through the legacy CRTC/primary-plane API, and
 	 * verify through atomic.
 	 */
-	crtc_commit(pipe_obj, primary, COMMIT_LEGACY, CRTC_RELAX_MODE);
+	crtc_commit(data->pipe, data->primary, COMMIT_LEGACY, CRTC_RELAX_MODE);
 
 	/* Same for disable.. */
-	plane_get_current_state(primary, old_plane_values);
-	crtc_get_current_state(pipe_obj, old_crtc_values);
+	plane_get_current_state(data->primary, old_plane_values);
+	crtc_get_current_state(data->pipe, old_crtc_values);
 
-	igt_plane_set_fb(primary, NULL);
+	igt_plane_set_fb(data->primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
 
-	igt_display_commit_atomic(pipe_obj->display, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	/* For extra stress, go through dpms off/on cycle */
 	kmstest_set_connector_dpms(output->display->drm_fd, output->config.connector, DRM_MODE_DPMS_OFF);
 	kmstest_set_connector_dpms(output->display->drm_fd, output->config.connector, DRM_MODE_DPMS_ON);
 
 	/* Check the state, should still be old state */
-	crtc_check_current_state(pipe_obj, old_crtc_values, old_plane_values, ATOMIC_RELAX_NONE);
-	plane_check_current_state(primary, old_plane_values, ATOMIC_RELAX_NONE);
+	crtc_check_current_state(data->pipe, old_crtc_values, old_plane_values, ATOMIC_RELAX_NONE);
+	plane_check_current_state(data->primary, old_plane_values, ATOMIC_RELAX_NONE);
 
 	/* And disable the pipe and remove fb, test complete */
-	crtc_commit(pipe_obj, primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
-	igt_remove_fb(pipe_obj->display->drm_fd, &fb);
+	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	igt_remove_fb(data->drm_fd, &fb);
 }
 
-static void plane_cursor(igt_pipe_t *pipe_obj,
-			 igt_output_t *output,
-			 igt_plane_t *cursor)
+static void plane_cursor(data_t *data, igt_output_t *output, igt_plane_t *cursor)
 {
 	drmModeModeInfo *mode = igt_output_get_mode(output);
 	struct igt_fb fb;
@@ -646,12 +649,12 @@ static void plane_cursor(igt_pipe_t *pipe_obj,
 	int y = mode->vdisplay / 2;
 
 	/* Any kernel new enough for atomic, also has the cursor size caps. */
-	do_or_die(drmGetCap(pipe_obj->display->drm_fd,
+	do_or_die(drmGetCap(data->drm_fd,
 	                    DRM_CAP_CURSOR_WIDTH, &width));
-	do_or_die(drmGetCap(pipe_obj->display->drm_fd,
+	do_or_die(drmGetCap(data->drm_fd,
 	                    DRM_CAP_CURSOR_HEIGHT, &height));
 
-	igt_create_color_fb(pipe_obj->display->drm_fd,
+	igt_create_color_fb(data->drm_fd,
 			    width, height, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 0.0, 0.0, &fb);
@@ -690,69 +693,64 @@ static void plane_cursor(igt_pipe_t *pipe_obj,
 	plane_commit(cursor, COMMIT_LEGACY, ATOMIC_RELAX_NONE);
 }
 
-static void plane_invalid_params(igt_pipe_t *pipe,
-				 igt_output_t *output,
-				 igt_plane_t *plane,
-				 struct igt_fb *fb)
+static void plane_invalid_params(data_t *data, igt_output_t *output)
 {
 	struct igt_fb fb2;
 
 	/* Pass a series of invalid object IDs for the FB ID */
-	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, plane->drm_plane->plane_id);
-	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
+	igt_plane_set_prop_value(data->primary, IGT_PLANE_FB_ID, data->primary->drm_plane->plane_id);
+	plane_commit_atomic_err(data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
-	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, pipe->crtc_id);
-	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
+	igt_plane_set_prop_value(data->primary, IGT_PLANE_FB_ID, data->pipe->crtc_id);
+	plane_commit_atomic_err(data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
-	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, output->id);
-	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
+	igt_plane_set_prop_value(data->primary, IGT_PLANE_FB_ID, output->id);
+	plane_commit_atomic_err(data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
-	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, pipe->values[IGT_CRTC_MODE_ID]);
-	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
+	igt_plane_set_prop_value(data->primary, IGT_PLANE_FB_ID, data->pipe->values[IGT_CRTC_MODE_ID]);
+	plane_commit_atomic_err(data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
 	/* Valid, but invalid because CRTC_ID is set */
-	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, 0);
-	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
+	igt_plane_set_prop_value(data->primary, IGT_PLANE_FB_ID, 0);
+	plane_commit_atomic_err(data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
-	igt_plane_set_fb(plane, fb);
-	plane_commit(plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	igt_plane_set_fb(data->primary, &data->fb);
+	plane_commit(data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	/* Pass a series of invalid object IDs for the CRTC ID */
-	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, plane->drm_plane->plane_id);
-	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
+	igt_plane_set_prop_value(data->primary, IGT_PLANE_CRTC_ID, data->primary->drm_plane->plane_id);
+	plane_commit_atomic_err(data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
-	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, fb->fb_id);
-	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
+	igt_plane_set_prop_value(data->primary, IGT_PLANE_CRTC_ID, data->fb.fb_id);
+	plane_commit_atomic_err(data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
-	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, output->id);
-	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
+	igt_plane_set_prop_value(data->primary, IGT_PLANE_CRTC_ID, output->id);
+	plane_commit_atomic_err(data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
-	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, pipe->values[IGT_CRTC_MODE_ID]);
-	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
+	igt_plane_set_prop_value(data->primary, IGT_PLANE_CRTC_ID, data->pipe->values[IGT_CRTC_MODE_ID]);
+	plane_commit_atomic_err(data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
 	/* Valid, but invalid because FB_ID is set */
-	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, 0);
-	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
+	igt_plane_set_prop_value(data->primary, IGT_PLANE_CRTC_ID, 0);
+	plane_commit_atomic_err(data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
-	igt_plane_set_fb(plane, fb);
-	plane_commit(plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	igt_plane_set_fb(data->primary, &data->fb);
+	plane_commit(data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	/* Create a framebuffer too small for the plane configuration */
-	igt_create_pattern_fb(pipe->display->drm_fd,
-			      fb->width - 1, fb->height - 1,
-			      fb->drm_format, I915_TILING_NONE, &fb2);
+	igt_create_pattern_fb(data->drm_fd,
+			      data->fb.width - 1, data->fb.height - 1,
+			      data->fb.drm_format, I915_TILING_NONE, &fb2);
 
-	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, fb2.fb_id);
-	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, ENOSPC);
+	igt_plane_set_prop_value(data->primary, IGT_PLANE_FB_ID, fb2.fb_id);
+	plane_commit_atomic_err(data->primary, ATOMIC_RELAX_NONE, ENOSPC);
 
 	/* Restore the primary plane and check the state matches the old */
-	igt_plane_set_fb(plane, fb);
-	plane_commit(plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	igt_plane_set_fb(data->primary, &data->fb);
+	plane_commit(data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 }
 
-static void plane_invalid_params_fence(igt_pipe_t *pipe,
-				       igt_output_t *output,
-				       igt_plane_t *plane)
+static void plane_invalid_params_fence(data_t *data, igt_output_t *output)
 {
 	int timeline, fence_fd;
 
@@ -761,80 +759,73 @@ static void plane_invalid_params_fence(igt_pipe_t *pipe,
 	timeline = sw_sync_timeline_create();
 
 	/* Invalid fence fd */
-	igt_plane_set_fence_fd(plane, pipe->display->drm_fd);
-	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
+	igt_plane_set_fence_fd(data->primary, data->drm_fd);
+	plane_commit_atomic_err(data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
 	/* Valid fence_fd but invalid CRTC */
 	fence_fd = sw_sync_timeline_create_fence(timeline, 1);
 
-	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, ~0);
-	igt_plane_set_fence_fd(plane, fence_fd);
-	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
+	igt_plane_set_prop_value(data->primary, IGT_PLANE_CRTC_ID, ~0);
+	igt_plane_set_fence_fd(data->primary, fence_fd);
+	plane_commit_atomic_err(data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
 	sw_sync_timeline_inc(timeline, 1);
-	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, pipe->crtc_id);
-	plane_commit(plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	igt_plane_set_prop_value(data->primary, IGT_PLANE_CRTC_ID, data->pipe->crtc_id);
+	plane_commit(data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	close(fence_fd);
 	close(timeline);
 }
 
-static void crtc_invalid_params(igt_pipe_t *pipe,
-				igt_output_t *output,
-				igt_plane_t *plane,
-				struct igt_fb *fb)
+static void crtc_invalid_params(data_t *data, igt_output_t *output)
 {
-	uint64_t old_mode_id = pipe->values[IGT_CRTC_MODE_ID];
+	uint64_t old_mode_id = data->pipe->values[IGT_CRTC_MODE_ID];
 	drmModeModeInfo *mode = igt_output_get_mode(output);
 
 	/* Pass a series of invalid object IDs for the mode ID */
-	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_MODE_ID, plane->drm_plane->plane_id);
-	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EINVAL);
+	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, data->primary->drm_plane->plane_id);
+	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
-	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_MODE_ID, pipe->crtc_id);
-	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EINVAL);
+	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, data->pipe->crtc_id);
+	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
-	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_MODE_ID, output->id);
-	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EINVAL);
+	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, output->id);
+	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
-	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_MODE_ID, fb->fb_id);
-	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EINVAL);
+	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, data->fb.fb_id);
+	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
 	/* Can we restore mode? */
-	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_MODE_ID, old_mode_id);
-	crtc_commit_atomic_flags_err(pipe, plane, DRM_MODE_ATOMIC_TEST_ONLY, ATOMIC_RELAX_NONE, 0);
+	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, old_mode_id);
+	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_ATOMIC_TEST_ONLY, ATOMIC_RELAX_NONE, 0);
 
 	/*
 	 * TEST_ONLY cannot be combined with DRM_MODE_PAGE_FLIP_EVENT,
 	 * but DRM_MODE_PAGE_FLIP_EVENT will always generate EINVAL
 	 * without valid crtc, so test it here.
 	 */
-	crtc_commit_atomic_flags_err(pipe, plane,
+	crtc_commit_atomic_flags_err(data->pipe, data->primary,
 				     DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_PAGE_FLIP_EVENT,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
 	/* Create a blob which is the wrong size to be a valid mode */
-	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_MODE_ID, mode, sizeof(*mode) - 1);
-	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EINVAL);
-
-	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_MODE_ID, mode, sizeof(*mode) + 1);
-	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EINVAL);
+	igt_pipe_obj_replace_prop_blob(data->pipe, IGT_CRTC_MODE_ID, mode, sizeof(*mode) - 1);
+	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
+	igt_pipe_obj_replace_prop_blob(data->pipe, IGT_CRTC_MODE_ID, mode, sizeof(*mode) + 1);
+	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
 	/* Restore the CRTC and check the state matches the old */
-	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_MODE_ID, mode, sizeof(*mode));
-	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	igt_pipe_obj_replace_prop_blob(data->pipe, IGT_CRTC_MODE_ID, mode, sizeof(*mode));
+	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 }
 
-static void crtc_invalid_params_fence(igt_pipe_t *pipe,
-				      igt_output_t *output,
-				      igt_plane_t *plane,
-				      struct igt_fb *fb)
+static void crtc_invalid_params_fence(data_t *data, igt_output_t *output)
 {
 	int timeline, fence_fd;
 	void *map;
 	const ptrdiff_t PAGE_SIZE = sysconf(_SC_PAGE_SIZE);
-	uint64_t old_mode_id = pipe->values[IGT_CRTC_MODE_ID];
+	uint64_t old_mode_id = data->pipe->values[IGT_CRTC_MODE_ID];
 
 	igt_require_sw_sync();
 
@@ -844,94 +835,90 @@ static void crtc_invalid_params_fence(igt_pipe_t *pipe,
 	map = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
 	igt_assert(map != MAP_FAILED);
 
-	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)map);
-	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EFAULT);
+	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)map);
+	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EFAULT);
 	munmap(map, PAGE_SIZE);
 
 	/* Invalid out_fence_ptr */
 	map = mmap(NULL, PAGE_SIZE, PROT_EXEC, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
 	igt_assert(map != MAP_FAILED);
 
-	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)map);
-	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EFAULT);
+	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)map);
+	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EFAULT);
 	munmap(map, PAGE_SIZE);
 
 	/* Invalid out_fence_ptr */
 	map = mmap(NULL, PAGE_SIZE, PROT_NONE, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
 	igt_assert(map != MAP_FAILED);
 
-	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)map);
-	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EFAULT);
+	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)map);
+	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EFAULT);
 	munmap(map, PAGE_SIZE);
 
 	/* Valid in fence but not allowed prop on crtc */
 	fence_fd = sw_sync_timeline_create_fence(timeline, 1);
-	igt_plane_set_fence_fd(plane, fence_fd);
+	igt_plane_set_fence_fd(data->primary, fence_fd);
 
-	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_ACTIVE, 0);
-	igt_pipe_obj_clear_prop_changed(pipe, IGT_CRTC_OUT_FENCE_PTR);
+	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_ACTIVE, 0);
+	igt_pipe_obj_clear_prop_changed(data->pipe, IGT_CRTC_OUT_FENCE_PTR);
 
-	crtc_commit_atomic_flags_err(pipe, plane, 0, ATOMIC_RELAX_NONE, EINVAL);
+	crtc_commit_atomic_flags_err(data->pipe, data->primary, 0, ATOMIC_RELAX_NONE, EINVAL);
 
 	/* Valid out fence ptr and flip event but not allowed prop on crtc */
-	igt_pipe_request_out_fence(pipe);
-	crtc_commit_atomic_flags_err(pipe, plane, DRM_MODE_PAGE_FLIP_EVENT,
+	igt_pipe_request_out_fence(data->pipe);
+	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_PAGE_FLIP_EVENT,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
 	/* Valid flip event but not allowed prop on crtc */
-	igt_pipe_obj_clear_prop_changed(pipe, IGT_CRTC_OUT_FENCE_PTR);
-	crtc_commit_atomic_flags_err(pipe, plane, DRM_MODE_PAGE_FLIP_EVENT,
+	igt_pipe_obj_clear_prop_changed(data->pipe, IGT_CRTC_OUT_FENCE_PTR);
+	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_PAGE_FLIP_EVENT,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
-	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_ACTIVE, 1);
+	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_ACTIVE, 1);
 
 	/* Configuration should be valid again */
-	crtc_commit_atomic_flags_err(pipe, plane, DRM_MODE_ATOMIC_TEST_ONLY,
+	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_ATOMIC_TEST_ONLY,
 				     ATOMIC_RELAX_NONE, 0);
 
 	/* Set invalid prop */
-	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_MODE_ID, fb->fb_id);
+	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, data->fb.fb_id);
 
 	/* Valid out fence but invalid prop on crtc */
-	igt_pipe_request_out_fence(pipe);
-	crtc_commit_atomic_flags_err(pipe, plane, 0,
+	igt_pipe_request_out_fence(data->pipe);
+	crtc_commit_atomic_flags_err(data->pipe, data->primary, 0,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
 	/* Valid out fence ptr and flip event but invalid prop on crtc */
-	crtc_commit_atomic_flags_err(pipe, plane, DRM_MODE_PAGE_FLIP_EVENT,
+	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_PAGE_FLIP_EVENT,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
 	/* Valid page flip event but invalid prop on crtc */
-	crtc_commit_atomic_flags_err(pipe, plane, DRM_MODE_PAGE_FLIP_EVENT,
+	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_PAGE_FLIP_EVENT,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
 	/* Successful TEST_ONLY with fences set */
-	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_MODE_ID, old_mode_id);
-	crtc_commit_atomic_flags_err(pipe, plane, DRM_MODE_ATOMIC_TEST_ONLY,
+	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, old_mode_id);
+	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_ATOMIC_TEST_ONLY,
 				     ATOMIC_RELAX_NONE, 0);
-	igt_assert(pipe->out_fence_fd == -1);
+	igt_assert(data->pipe->out_fence_fd == -1);
 	close(fence_fd);
 	close(timeline);
 
 	/* Reset fences */
-	igt_plane_set_fence_fd(plane, -1);
-	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_OUT_FENCE_PTR, 0);
-	igt_pipe_obj_clear_prop_changed(pipe, IGT_CRTC_OUT_FENCE_PTR);
-	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	igt_plane_set_fence_fd(data->primary, -1);
+	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, 0);
+	igt_pipe_obj_clear_prop_changed(data->pipe, IGT_CRTC_OUT_FENCE_PTR);
+	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	/* Out fence ptr but not page flip event */
-	igt_pipe_request_out_fence(pipe);
-	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	igt_pipe_request_out_fence(data->pipe);
+	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	igt_assert(pipe->out_fence_fd != -1);
+	igt_assert(data->pipe->out_fence_fd != -1);
 }
 
-static void atomic_invalid_params(igt_pipe_t *pipe,
-				  igt_plane_t *plane,
-				  igt_output_t *output,
-				  struct igt_fb *fb)
+static void atomic_invalid_params(data_t *data, igt_output_t *output)
 {
-	igt_display_t *display = pipe->display;
 	struct drm_mode_atomic ioc;
 	uint32_t obj_raw[16]; /* Array of objects (sized by count_objs) */
 	uint32_t num_props_raw[16]; /* Array of num props per obj (ditto) */
@@ -942,7 +929,7 @@ static void atomic_invalid_params(igt_pipe_t *pipe,
 	memset(&ioc, 0, sizeof(ioc));
 
 	/* An empty request should do nothing */
-	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
+	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
 	for (i = 0; i < ARRAY_SIZE(obj_raw); i++)
 		obj_raw[i] = 0;
@@ -959,132 +946,132 @@ static void atomic_invalid_params(igt_pipe_t *pipe,
 	ioc.prop_values_ptr = (uintptr_t) values_raw;
 
 	/* Valid pointers, but still should copy nothing */
-	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
+	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
 	/* Valid noop, but with event set should fail */
 	ioc.flags = DRM_MODE_PAGE_FLIP_EVENT;
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
 
 	/* Nonsense flags */
 	ioc.flags = 0xdeadbeef;
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
 
 	ioc.flags = 0;
 	/* Safety check that flags is reset properly */
-	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
+	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
 	/* Reserved/MBZ */
 	ioc.reserved = 1;
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
 	ioc.reserved = 0;
-	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
+	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
 	/* Zero is not a valid object ID */
 	ioc.count_objs = ARRAY_SIZE(obj_raw);
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 
 	/* Invalid object type (not a thing we can set properties on) */
 	ioc.count_objs = 1;
-	obj_raw[0] = pipe->values[IGT_CRTC_MODE_ID];
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
-	obj_raw[0] = fb->fb_id;
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
+	obj_raw[0] = data->pipe->values[IGT_CRTC_MODE_ID];
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
+	obj_raw[0] = data->fb.fb_id;
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 
 	/* Filled object but with no properties; no-op */
 	for (i = 0; i < ARRAY_SIZE(obj_raw); i++)
-		obj_raw[i] = pipe->crtc_id;
-	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
+		obj_raw[i] = data->pipe->crtc_id;
+	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
 	/* Pass in all sorts of things other than the property ID */
 	num_props_raw[0] = 1;
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
-	props_raw[0] = pipe->crtc_id;
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
-	props_raw[0] = plane->drm_plane->plane_id;
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
+	props_raw[0] = data->pipe->crtc_id;
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
+	props_raw[0] = data->primary->drm_plane->plane_id;
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 	props_raw[0] = output->id;
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
-	props_raw[0] = pipe->values[IGT_CRTC_MODE_ID];
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
+	props_raw[0] = data->pipe->values[IGT_CRTC_MODE_ID];
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 
 	/* Valid property, valid value */
 	for (i = 0; i < ARRAY_SIZE(props_raw); i++) {
-		props_raw[i] = pipe->props[IGT_CRTC_MODE_ID];
-		values_raw[i] = pipe->values[IGT_CRTC_MODE_ID];
+		props_raw[i] = data->pipe->props[IGT_CRTC_MODE_ID];
+		values_raw[i] = data->pipe->values[IGT_CRTC_MODE_ID];
 	}
-	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
+	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
 	/* Setting the same thing multiple times is OK */
 	for (i = 0; i < ARRAY_SIZE(obj_raw); i++)
 		num_props_raw[i] = ARRAY_SIZE(props_raw) / ARRAY_SIZE(obj_raw);
-	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
+	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 	ioc.count_objs = ARRAY_SIZE(obj_raw);
-	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
+	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
 	/* Pass a series of outlandish addresses */
 	ioc.objs_ptr = 0;
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
 
 	ioc.objs_ptr = (uintptr_t) obj_raw;
 	ioc.count_props_ptr = 0;
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
 
 	ioc.count_props_ptr = (uintptr_t) num_props_raw;
 	ioc.props_ptr = 0;
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
 
 	ioc.props_ptr = (uintptr_t) props_raw;
 	ioc.prop_values_ptr = 0;
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
 
 	ioc.prop_values_ptr = (uintptr_t) values_raw;
-	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
+	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
 	/* Attempt to overflow and/or trip various boundary conditions */
 	ioc.count_objs = UINT32_MAX / sizeof(uint32_t);
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 
 	ioc.count_objs = ARRAY_SIZE(obj_raw);
 	ioc.objs_ptr = UINT64_MAX - sizeof(uint32_t);
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
 	ioc.count_objs = 1;
 	ioc.objs_ptr = UINT64_MAX - sizeof(uint32_t);
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
 
 	num_props_raw[0] = UINT32_MAX / sizeof(uint32_t);
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
 	num_props_raw[0] = UINT32_MAX - 1;
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
 
 	for (i = 0; i < ARRAY_SIZE(obj_raw); i++)
 		num_props_raw[i] = (UINT32_MAX / ARRAY_SIZE(obj_raw)) + 1;
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
 	for (i = 0; i < ARRAY_SIZE(obj_raw); i++)
 		num_props_raw[i] = ARRAY_SIZE(props_raw) / ARRAY_SIZE(obj_raw);
-	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
 }
 
-static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt_fb *fb)
+static void atomic_plane_damage(data_t *data)
 {
 	struct drm_mode_rect damage[2];
 	struct igt_fb fb_1, fb_2;
 	cairo_t *cr_1, *cr_2;
 
 	/* Color fb with white rect at center */
-	igt_create_color_fb(pipe->display->drm_fd, fb->width, fb->height,
-			    fb->drm_format, I915_TILING_NONE, 0.2, 0.2, 0.2,
+	igt_create_color_fb(data->drm_fd, data->fb.width, data->fb.height,
+			    data->fb.drm_format, I915_TILING_NONE, 0.2, 0.2, 0.2,
 			    &fb_1);
-	cr_1 = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_1);
-	igt_paint_color(cr_1, fb->width/4, fb->height/4, fb->width/2,
-			fb->height/2, 1.0, 1.0, 1.0);
+	cr_1 = igt_get_cairo_ctx(data->drm_fd, &fb_1);
+	igt_paint_color(cr_1, data->fb.width/4, data->fb.height/4, data->fb.width/2,
+			data->fb.height/2, 1.0, 1.0, 1.0);
 	igt_put_cairo_ctx(cr_1);
 
 	 /*
 	  * Flip the primary plane to new color fb using atomic API and check the
 	  * state.
 	  */
-	igt_plane_set_fb(plane, &fb_1);
-	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	igt_plane_set_fb(data->primary, &fb_1);
+	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	/*
 	 * Change the color of top left clip from center and issue plane update
@@ -1092,35 +1079,35 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 	 */
 	damage[0].x1 = 0;
 	damage[0].y1 = 0;
-	damage[0].x2 = fb->width/2;
-	damage[0].y2 = fb->height/2;
+	damage[0].x2 = data->fb.width/2;
+	damage[0].y2 = data->fb.height/2;
 
-	cr_1 = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_1);
+	cr_1 = igt_get_cairo_ctx(data->drm_fd, &fb_1);
 	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
 			damage_rect_width(&damage[0]),
 			damage_rect_height(&damage[0]), 1.0, 0, 0);
 	igt_put_cairo_ctx(cr_1);
 
-	igt_plane_set_fb(plane, &fb_1);
-	igt_plane_replace_prop_blob(plane, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
+	igt_plane_set_fb(data->primary, &fb_1);
+	igt_plane_replace_prop_blob(data->primary, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
 				    sizeof(*damage));
-	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	/*
 	 * Change the color of top left and bottom right clip from center and
 	 * issue plane update with damage and verify the state.
 	 */
-	igt_create_color_fb(pipe->display->drm_fd, fb->width, fb->height,
-			    fb->drm_format, I915_TILING_NONE, 0.2, 0.2, 0.2,
+	igt_create_color_fb(data->drm_fd, data->fb.width, data->fb.height,
+			    data->fb.drm_format, I915_TILING_NONE, 0.2, 0.2, 0.2,
 			    &fb_2);
 
-	damage[0].x1 = fb->width/2;
+	damage[0].x1 = data->fb.width/2;
 	damage[0].y1 = 0;
-	damage[0].x2 = fb->width;
-	damage[0].y2 = fb->height/2;
+	damage[0].x2 = data->fb.width;
+	damage[0].y2 = data->fb.height/2;
 
-	cr_2 = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_2);
-	cr_1 = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_1);
+	cr_2 = igt_get_cairo_ctx(data->drm_fd, &fb_2);
+	cr_1 = igt_get_cairo_ctx(data->drm_fd, &fb_1);
 	cairo_set_source_surface(cr_2, fb_1.cairo_surface, 0, 0);
 	cairo_paint(cr_2);
 	igt_paint_color(cr_2, damage[0].x1, damage[0].y1,
@@ -1128,10 +1115,10 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 			damage_rect_height(&damage[0]), 0, 1.0, 0);
 	igt_put_cairo_ctx(cr_1);
 	igt_put_cairo_ctx(cr_2);
-	igt_plane_set_fb(plane, &fb_2);
-	igt_plane_replace_prop_blob(plane, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
+	igt_plane_set_fb(data->primary, &fb_2);
+	igt_plane_replace_prop_blob(data->primary, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
 				    sizeof(*damage));
-	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	/*
 	 * Issue plane update with damage with a clip outside of plane src.
@@ -1139,18 +1126,18 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 	 * will see no change on the screen.
 	 */
 	/* Resize fb_1 to be bigger than plane */
-	igt_remove_fb(pipe->display->drm_fd, &fb_1);
-	igt_create_color_fb(pipe->display->drm_fd, fb->width * 2, fb->height,
-			    fb->drm_format, I915_TILING_NONE, 0.2, 0.2, 0.2,
+	igt_remove_fb(data->drm_fd, &fb_1);
+	igt_create_color_fb(data->drm_fd, data->fb.width * 2, data->fb.height,
+			    data->fb.drm_format, I915_TILING_NONE, 0.2, 0.2, 0.2,
 			    &fb_1);
 
-	damage[0].x1 = fb->width;
+	damage[0].x1 = data->fb.width;
 	damage[0].y1 = 0;
-	damage[0].x2 = fb->width + fb->width/2;
-	damage[0].y2 = fb->height/2;
+	damage[0].x2 = data->fb.width + data->fb.width/2;
+	damage[0].y2 = data->fb.height/2;
 
-	cr_1 = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_1);
-	cr_2 = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_2);
+	cr_1 = igt_get_cairo_ctx(data->drm_fd, &fb_1);
+	cr_2 = igt_get_cairo_ctx(data->drm_fd, &fb_2);
 	cairo_set_source_surface(cr_1, fb_2.cairo_surface, 0, 0);
 	cairo_paint(cr_1);
 	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
@@ -1158,13 +1145,13 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 			damage_rect_height(&damage[0]), 0, 1.0, 0);
 	igt_put_cairo_ctx(cr_2);
 	igt_put_cairo_ctx(cr_1);
-	igt_plane_set_fb(plane, &fb_1);
-	igt_plane_set_size(plane, fb->width, fb->height);
-	igt_fb_set_position(&fb_1, plane, 0, 0);
-	igt_fb_set_size(&fb_1, plane, fb->width, fb->height);
-	igt_plane_replace_prop_blob(plane, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
+	igt_plane_set_fb(data->primary, &fb_1);
+	igt_plane_set_size(data->primary, data->fb.width, data->fb.height);
+	igt_fb_set_position(&fb_1, data->primary, 0, 0);
+	igt_fb_set_size(&fb_1, data->primary, data->fb.width, data->fb.height);
+	igt_plane_replace_prop_blob(data->primary, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
 				    sizeof(*damage));
-	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	/*
 	 * Issue a plane update with damage with a clip that overlap with plane
@@ -1172,23 +1159,23 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 	 * NOTE: Here drm core should take care of intersecting the clip to
 	 * plane src.
 	 */
-	damage[0].x1 = fb->width/2;
+	damage[0].x1 = data->fb.width/2;
 	damage[0].y1 = 0;
-	damage[0].x2 = fb->width/2 + fb->width;
-	damage[0].y2 = fb->height/2;
+	damage[0].x2 = data->fb.width/2 + data->fb.width;
+	damage[0].y2 = data->fb.height/2;
 
-	cr_1 = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_1);
+	cr_1 = igt_get_cairo_ctx(data->drm_fd, &fb_1);
 	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
 			damage_rect_width(&damage[0]),
 			damage_rect_height(&damage[0]), 1.0, 1.0, 0);
 	igt_put_cairo_ctx(cr_1);
-	igt_plane_set_fb(plane, &fb_1);
-	igt_plane_set_size(plane, fb->width, fb->height);
-	igt_fb_set_position(&fb_1, plane, 0, 0);
-	igt_fb_set_size(&fb_1, plane, fb->width, fb->height);
-	igt_plane_replace_prop_blob(plane, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
+	igt_plane_set_fb(data->primary, &fb_1);
+	igt_plane_set_size(data->primary, data->fb.width, data->fb.height);
+	igt_fb_set_position(&fb_1, data->primary, 0, 0);
+	igt_fb_set_size(&fb_1, data->primary, data->fb.width, data->fb.height);
+	igt_plane_replace_prop_blob(data->primary, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
 				    sizeof(*damage));
-	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	/*
 	 * Issue a plane update with damage with two clips one inside plane src
@@ -1196,16 +1183,16 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 	 * NOTE: This will result in plane update with clip inside plane src.
 	 */
 	damage[0].x1 = 0;
-	damage[0].y1 = fb->height/2;
-	damage[0].x2 = fb->width/2;
-	damage[0].y2 = fb->height;
+	damage[0].y1 = data->fb.height/2;
+	damage[0].x2 = data->fb.width/2;
+	damage[0].y2 = data->fb.height;
 
-	damage[1].x1 = fb->width + fb->width/2;
-	damage[1].y1 = fb->height/2;
-	damage[1].x2 = fb->width * 2;
-	damage[1].y2 = fb->height;
+	damage[1].x1 = data->fb.width + data->fb.width/2;
+	damage[1].y1 = data->fb.height/2;
+	damage[1].x2 = data->fb.width * 2;
+	damage[1].y2 = data->fb.height;
 
-	cr_1 = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_1);
+	cr_1 = igt_get_cairo_ctx(data->drm_fd, &fb_1);
 	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
 			damage_rect_width(&damage[0]),
 			damage_rect_height(&damage[0]), 0, 1.0, 1.0);
@@ -1213,13 +1200,13 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 			damage_rect_width(&damage[1]),
 			damage_rect_height(&damage[1]), 0, 1.0, 0);
 	igt_put_cairo_ctx(cr_1);
-	igt_plane_set_fb(plane, &fb_1);
-	igt_plane_set_size(plane, fb->width, fb->height);
-	igt_fb_set_position(&fb_1, plane, 0, 0);
-	igt_fb_set_size(&fb_1, plane, fb->width, fb->height);
-	igt_plane_replace_prop_blob(plane, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
+	igt_plane_set_fb(data->primary, &fb_1);
+	igt_plane_set_size(data->primary, data->fb.width, data->fb.height);
+	igt_fb_set_position(&fb_1, data->primary, 0, 0);
+	igt_fb_set_size(&fb_1, data->primary, data->fb.width, data->fb.height);
+	igt_plane_replace_prop_blob(data->primary, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
 				    sizeof(*damage) * 2);
-	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	/*
 	 * Issue a plane update with overlapping damage clips. White rect in
@@ -1230,15 +1217,15 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 	 */
 	damage[0].x1 = 0;
 	damage[0].y1 = 0;
-	damage[0].x2 = fb->width/2;
-	damage[0].y2 = fb->height/2;
+	damage[0].x2 = data->fb.width/2;
+	damage[0].y2 = data->fb.height/2;
 
-	damage[1].x1 = fb->width/4;
-	damage[1].y1 = fb->height/4;
-	damage[1].x2 = fb->width/4 + fb->width/2;
-	damage[1].y2 = fb->height/4 + fb->height/2;
+	damage[1].x1 = data->fb.width/4;
+	damage[1].y1 = data->fb.height/4;
+	damage[1].x2 = data->fb.width/4 + data->fb.width/2;
+	damage[1].y2 = data->fb.height/4 + data->fb.height/2;
 
-	cr_1 = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_1);
+	cr_1 = igt_get_cairo_ctx(data->drm_fd, &fb_1);
 	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
 			damage_rect_width(&damage[0]),
 			damage_rect_height(&damage[0]), 1.0, 0, 0);
@@ -1246,45 +1233,55 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 			damage_rect_width(&damage[1]),
 			damage_rect_height(&damage[1]), 1.0, 1.0, 1.0);
 	igt_put_cairo_ctx(cr_1);
-	igt_plane_set_fb(plane, &fb_1);
-	igt_plane_set_size(plane, fb->width, fb->height);
-	igt_fb_set_position(&fb_1, plane, 0, 0);
-	igt_fb_set_size(&fb_1, plane, fb->width, fb->height);
-	igt_plane_replace_prop_blob(plane, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
+	igt_plane_set_fb(data->primary, &fb_1);
+	igt_plane_set_size(data->primary, data->fb.width, data->fb.height);
+	igt_fb_set_position(&fb_1, data->primary, 0, 0);
+	igt_fb_set_size(&fb_1, data->primary, data->fb.width, data->fb.height);
+	igt_plane_replace_prop_blob(data->primary, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
 				    sizeof(*damage) * 2);
-	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	/* Restore the primary plane */
-	igt_plane_set_fb(plane, fb);
-	plane_commit(plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	igt_plane_set_fb(data->primary, &data->fb);
+	plane_commit(data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	/* Remove the fb created for this test */
-	igt_remove_fb(pipe->display->drm_fd, &fb_1);
-	igt_remove_fb(pipe->display->drm_fd, &fb_2);
+	igt_remove_fb(data->drm_fd, &fb_1);
+	igt_remove_fb(data->drm_fd, &fb_2);
 }
 
-static void atomic_setup(igt_display_t *display, enum pipe pipe, igt_output_t *output,
-			 igt_plane_t *primary, struct igt_fb *fb)
+static void atomic_setup(data_t *data, enum pipe pipe, igt_output_t *output)
 {
-	igt_display_reset(display);
+	drmModeModeInfo *mode;
+	igt_display_reset(&data->display);
 	igt_output_set_pipe(output, pipe);
-	igt_plane_set_fb(primary, fb);
 
-	crtc_commit(primary->pipe, primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	data->primary = igt_pipe_get_plane_type(&data->display.pipes[pipe], DRM_PLANE_TYPE_PRIMARY);
+	data->pipe = &data->display.pipes[pipe];
+	mode = igt_output_get_mode(output);
+
+	igt_create_pattern_fb(data->drm_fd,
+			      mode->hdisplay, mode->vdisplay,
+			      plane_get_igt_format(data->primary),
+			      DRM_FORMAT_MOD_LINEAR, &data->fb);
+
+	igt_plane_set_fb(data->primary, &data->fb);
+
+	crtc_commit(data->primary->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 }
 
-static void atomic_clear(igt_display_t *display, enum pipe pipe,
-			 igt_plane_t *primary, igt_output_t *output)
+static void atomic_clear(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_plane_t *plane;
 
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_each_plane_on_pipe(&data->display, pipe, plane) {
 		igt_plane_set_fb(plane, NULL);
 		igt_plane_set_position(plane, 0, 0);
 	}
 
 	igt_output_set_pipe(output, PIPE_NONE);
-	crtc_commit(primary->pipe, primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	crtc_commit(data->primary->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	igt_remove_fb(data->drm_fd, &data->fb);
 }
 
 /* Returns true if plane supports zpos property. */
@@ -1293,182 +1290,217 @@ static bool has_zpos(igt_plane_t *plane)
 	return igt_plane_has_prop(plane, IGT_PLANE_ZPOS);
 }
 
-static void do_cleanup_display(igt_display_t *dpy)
-{
-	enum pipe pipe;
-	igt_output_t *output;
-	igt_plane_t *plane;
-
-	for_each_pipe(dpy, pipe)
-		for_each_plane_on_pipe(dpy, pipe, plane)
-			igt_plane_set_fb(plane, NULL);
-
-	for_each_connected_output(dpy, output)
-		igt_output_set_pipe(output, PIPE_NONE);
-
-	igt_display_commit2(dpy, dpy->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
-}
-
 igt_main
 {
-	igt_display_t display;
 	enum pipe pipe = PIPE_NONE;
-	igt_pipe_t *pipe_obj;
 	igt_output_t *output = NULL;
-	igt_plane_t *primary = NULL;
-	drmModeModeInfo *mode;
-	struct igt_fb fb;
+	data_t data = { 0 };
 
 	igt_fixture {
-		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
-		igt_display_require(&display, display.drm_fd);
-		igt_require(display.is_atomic);
-		igt_display_require_output(&display);
-
-		for_each_pipe_with_valid_output(&display, pipe, output)
-			break;
-
-		pipe_obj = &display.pipes[pipe];
-		primary = igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_PRIMARY);
-		mode = igt_output_get_mode(output);
-		igt_create_pattern_fb(display.drm_fd,
-				      mode->hdisplay, mode->vdisplay,
-				      plane_get_igt_format(primary),
-				      DRM_FORMAT_MOD_LINEAR, &fb);
+		igt_display_require(&data.display, data.drm_fd);
+		igt_require(data.display.is_atomic);
+		igt_display_require_output(&data.display);
 	}
 
 	igt_describe("Test for KMS atomic modesetting on overlay plane and ensure coherency between "
 		     "the legacy and atomic interfaces.");
-	igt_subtest("plane-overlay-legacy") {
-		igt_plane_t *overlay =
-			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
+	igt_subtest_with_dynamic("plane-overlay-legacy") {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_plane_t *overlay =
+				igt_pipe_get_plane_type(&data.display.pipes[pipe], DRM_PLANE_TYPE_OVERLAY);
+			uint32_t format = plane_get_igt_format(overlay);
 
-		if (!overlay)
-			continue;
+			if (!overlay || !format)
+				continue;
 
-		atomic_setup(&display, pipe, output, primary, &fb);
-		plane_overlay(pipe_obj, output, overlay);
-		atomic_clear(&display, pipe, primary, output);
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+				atomic_setup(&data, pipe, output);
+				plane_overlay(&data, output, overlay, format);
+				atomic_clear(&data, pipe, output);
+			}
+			break;
+		}
 	}
 
 	igt_describe("Test for KMS atomic modesetting on primary plane and ensure coherency between "
 		     "the legacy and atomic interfaces.");
-	igt_subtest("plane-primary-legacy") {
-		atomic_setup(&display, pipe, output, primary, &fb);
-		plane_primary(pipe_obj, primary, &fb);
-		atomic_clear(&display, pipe, primary, output);
+	igt_subtest_with_dynamic("plane-primary-legacy") {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+				atomic_setup(&data, pipe, output);
+				plane_primary(&data);
+				atomic_clear(&data, pipe, output);
+			}
+			break;
+		}
 	}
 
 	igt_describe("Test to verify that the overlay plane can cover the primary one (and "\
 		     "vice versa) by changing their zpos property.");
-	igt_subtest("plane-primary-overlay-mutable-zpos") {
-		igt_plane_t *overlay =
-			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
+	igt_subtest_with_dynamic("plane-primary-overlay-mutable-zpos") {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_plane_t *overlay =
+				igt_pipe_get_plane_type(&data.display.pipes[pipe], DRM_PLANE_TYPE_OVERLAY);
 
-		if (!overlay)
-			continue;
+			atomic_setup(&data, pipe, output);
 
-		if (!has_zpos(primary) || !has_zpos(overlay))
-			continue;
+			if (!overlay)
+				continue;
 
-		if (!igt_plane_has_format_mod(primary, DRM_FORMAT_ARGB8888, 0x0) ||
-		    !igt_plane_has_format_mod(overlay, DRM_FORMAT_ARGB1555, 0x0))
-			continue;
+			if (!has_zpos(data.primary) || !has_zpos(overlay))
+				continue;
+
+			if (!igt_plane_has_format_mod(data.primary, DRM_FORMAT_ARGB8888, 0x0) ||
+			    !igt_plane_has_format_mod(overlay, DRM_FORMAT_ARGB1555, 0x0))
+				continue;
 
-		igt_output_set_pipe(output, pipe);
-		plane_primary_overlay_mutable_zpos(pipe_obj, output, primary, overlay,
-						   DRM_FORMAT_ARGB8888, DRM_FORMAT_ARGB1555);
-		do_cleanup_display(&display);
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+				plane_primary_overlay_mutable_zpos(&data, output, overlay,
+								   DRM_FORMAT_ARGB8888, DRM_FORMAT_ARGB1555);
+				atomic_clear(&data, pipe, output);
+			}
+			break;
+		}
 	}
 
 	igt_describe("Test to verify the reported zpos property of planes by making sure "\
 		     "only higher zpos planes cover the lower zpos ones.");
-	igt_subtest("plane-immutable-zpos") {
-		int n_planes = pipe_obj->n_planes;
+	igt_subtest_with_dynamic("plane-immutable-zpos") {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			int n_planes = data.display.pipes[pipe].n_planes;
 
-		if (n_planes < 2)
-			continue;
+			if (n_planes < 2)
+				continue;
 
-		igt_output_set_pipe(output, pipe);
-		plane_immutable_zpos(&display, pipe_obj, output, primary, n_planes);
-		do_cleanup_display(&display);
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+				atomic_setup(&data, pipe, output);
+				plane_immutable_zpos(&data, output, pipe, n_planes);
+				atomic_clear(&data, pipe, output);
+			}
+			break;
+		}
 	}
 
 	igt_describe("Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches "
 		     "the free-standing state objects and nothing else.");
-	igt_subtest("test-only") {
-		uint32_t format = plane_get_igt_format(primary);
+	igt_subtest_with_dynamic("test-only") {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			uint32_t format;
 
-		if (!format)
-			continue;
+			atomic_setup(&data, pipe, output);
+			format = plane_get_igt_format(data.primary);
+
+			if (!format)
+				continue;
 
-		atomic_clear(&display, pipe, primary, output);
-		test_only(pipe_obj, primary, output, format);
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+				atomic_clear(&data, pipe, output);
+				test_only(&data, output, pipe, format);
+			}
+			break;
+		}
 	}
 
 	igt_describe("Test for KMS atomic modesetting on cursor plane and ensure coherency between "
 		     "legacy and atomic interfaces.");
-	igt_subtest("plane-cursor-legacy") {
-		igt_plane_t *cursor =
-			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_CURSOR);
+	igt_subtest_with_dynamic("plane-cursor-legacy") {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_plane_t *cursor =
+				igt_pipe_get_plane_type(&data.display.pipes[pipe], DRM_PLANE_TYPE_CURSOR);
 
-		if (!cursor)
-			continue;
+			if (!cursor)
+				continue;
 
-		atomic_setup(&display, pipe, output, primary, &fb);
-		plane_cursor(pipe_obj, output, cursor);
-		atomic_clear(&display, pipe, primary, output);
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+				atomic_setup(&data, pipe, output);
+				plane_cursor(&data, output, cursor);
+				atomic_clear(&data, pipe, output);
+			}
+			break;
+		}
 	}
 
 	igt_describe("Test error handling when invalid plane parameters are passed.");
-	igt_subtest("plane-invalid-params") {
-		atomic_setup(&display, pipe, output, primary, &fb);
-		plane_invalid_params(pipe_obj, output, primary, &fb);
-		atomic_clear(&display, pipe, primary, output);
+	igt_subtest_with_dynamic("plane-invalid-params") {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+				atomic_setup(&data, pipe, output);
+				plane_invalid_params(&data, output);
+				atomic_clear(&data, pipe, output);
+			}
+			break;
+		}
 	}
 
 	igt_describe("Test error handling when invalid plane fence parameters are passed.");
-	igt_subtest("plane-invalid-params-fence") {
-		atomic_setup(&display, pipe, output, primary, &fb);
-		plane_invalid_params_fence(pipe_obj, output, primary);
-		atomic_clear(&display, pipe, primary, output);
+	igt_subtest_with_dynamic("plane-invalid-params-fence") {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+				atomic_setup(&data, pipe, output);
+				plane_invalid_params_fence(&data, output);
+				atomic_clear(&data, pipe, output);
+			}
+			break;
+		}
 	}
 
 	igt_describe("Test error handling when invalid crtc parameters are passed.");
-	igt_subtest("crtc-invalid-params") {
-		atomic_setup(&display, pipe, output, primary, &fb);
-		crtc_invalid_params(pipe_obj, output, primary, &fb);
-		atomic_clear(&display, pipe, primary, output);
+	igt_subtest_with_dynamic("crtc-invalid-params") {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+				atomic_setup(&data, pipe, output);
+				crtc_invalid_params(&data, output);
+				atomic_clear(&data, pipe, output);
+			}
+			break;
+		}
 	}
 
 	igt_describe("Test error handling when invalid crtc fence parameters are passed.");
-	igt_subtest("crtc-invalid-params-fence") {
-		atomic_setup(&display, pipe, output, primary, &fb);
-		crtc_invalid_params_fence(pipe_obj, output, primary, &fb);
-		atomic_clear(&display, pipe, primary, output);
+	igt_subtest_with_dynamic("crtc-invalid-params-fence") {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+				atomic_setup(&data, pipe, output);
+				crtc_invalid_params_fence(&data, output);
+				atomic_clear(&data, pipe, output);
+			}
+			break;
+		}
 	}
 
 	igt_describe("Test abuse the atomic ioctl directly in order to test "
 		     "various invalid conditions which the libdrm wrapper won't "
 		     "allow us to create.");
-	igt_subtest("atomic-invalid-params") {
-		atomic_setup(&display, pipe, output, primary, &fb);
-		atomic_invalid_params(pipe_obj, primary, output, &fb);
-		atomic_clear(&display, pipe, primary, output);
+	igt_subtest_with_dynamic("atomic-invalid-params") {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+				atomic_setup(&data, pipe, output);
+				atomic_invalid_params(&data, output);
+				atomic_clear(&data, pipe, output);
+			}
+			break;
+		}
 	}
 
 	igt_describe("Test case to use FB_DAMAGE_CLIPS plane property.");
-	igt_subtest("atomic-plane-damage") {
-		if (!igt_plane_has_prop(primary, IGT_PLANE_FB_DAMAGE_CLIPS))
-			continue;
+	igt_subtest_with_dynamic("atomic-plane-damage") {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			atomic_setup(&data, pipe, output);
 
-		atomic_setup(&display, pipe, output, primary, &fb);
-		atomic_plane_damage(pipe_obj, primary, &fb);
-		atomic_clear(&display, pipe, primary, output);
+			if (!igt_plane_has_prop(data.primary, IGT_PLANE_FB_DAMAGE_CLIPS))
+				continue;
+
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+				atomic_plane_damage(&data);
+				atomic_clear(&data, pipe, output);
+			}
+			break;
+		}
 	}
 
 	igt_fixture {
-		igt_display_fini(&display);
+		igt_display_fini(&data.display);
 	}
 }
-- 
2.25.1
