Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA3010E673
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 14:30:38 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Feb 2022 20:14:35 +0530
Message-Id: <20220225144436.17718-8-swati2.sharma@intel.com>
In-Reply-To: <20220225144436.17718-1-swati2.sharma@intel.com>
References: <20220225144436.17718-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v7 7/8] tests/kms_plane_scaling: Refactor
 clipping-clamping subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reused same logic as other subtests (tiling, pixel-format)
to make it consistent. Now, this subtest is tested for
all planes.

v2: rebase

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 174 +++++++++++++++-----------------------
 1 file changed, 66 insertions(+), 108 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 5df9ba24..e6ebb46d 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -161,45 +161,16 @@ static void cleanup_crtc(data_t *data)
 	cleanup_fbs(data);
 }
 
-static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
-			igt_plane_t *plane, drmModeModeInfo *mode)
+static bool test_pipe_iteration(data_t *data, enum pipe pipe, int iteration)
 {
-	igt_display_t *display = &data->display;
-	uint64_t modifier = is_i915_device(data->drm_fd) ?
-		I915_FORMAT_MOD_X_TILED : DRM_FORMAT_MOD_LINEAR;
-
-	cleanup_crtc(data);
-
-	igt_output_set_pipe(output, pipe);
+	if (!is_i915_device(data->drm_fd) ||
+	    data->extended)
+		return true;
 
-	igt_skip_on(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888,
-						modifier));
+	if ((pipe > PIPE_B) && (iteration >= 2))
+		return false;
 
-	/* allocate fb for plane 1 */
-	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
-			      modifier,
-			      &data->fb[0]);
-
-	igt_plane_set_fb(plane, &data->fb[0]);
-
-	if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
-		igt_plane_t *primary;
-		int ret;
-
-		/* Do we succeed without enabling the primary plane? */
-		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
-		if (!ret)
-			return;
-
-		/*
-		 * Fallback: set the primary plane to actually enable the pipe.
-		 * Some drivers always require the primary plane to be enabled.
-		 */
-		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-		igt_plane_set_fb(primary, &data->fb[0]);
-	}
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	return true;
 }
 
 static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
@@ -337,18 +308,6 @@ static bool test_format(data_t *data,
 	return true;
 }
 
-static bool test_pipe_iteration(data_t *data, enum pipe pipe, int iteration)
-{
-	if (!is_i915_device(data->drm_fd) ||
-	    data->extended)
-		return true;
-
-	if ((pipe > PIPE_B) && (iteration >= 2))
-		return false;
-
-	return true;
-}
-
 static void test_scaler_with_rotation_pipe(data_t *d,
 					   int width, int height,
 					   bool is_upscale,
@@ -440,89 +399,82 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height,
 }
 
 static void
-__test_scaler_with_clipping_clamping_scenario(data_t *d, drmModeModeInfo *mode)
+__test_scaler_with_clipping_clamping(data_t *d, igt_plane_t *plane,
+				     uint32_t pixel_format,
+				     uint64_t modifier,
+				     int width, int height,
+				     enum pipe pipe,
+				     igt_output_t *output,
+				     igt_rotation_t rot)
+
 {
-	igt_plane_set_fb(d->plane1, &d->fb[1]);
-	igt_plane_set_fb(d->plane2, &d->fb[2]);
+	igt_display_t *display = &d->display;
+	drmModeModeInfo *mode;
+
+	cleanup_crtc(d);
+
+	igt_output_set_pipe(output, pipe);
+	mode = igt_output_get_mode(output);
 
-	igt_fb_set_position(&d->fb[1], d->plane1, 0, 0);
-	igt_fb_set_size(&d->fb[1], d->plane1, 300, 300);
-	igt_plane_set_position(d->plane1, 100, 400);
-	igt_fb_set_position(&d->fb[2], d->plane2, 0, 0);
-	igt_fb_set_size(&d->fb[2], d->plane2, 400, 400);
-	igt_plane_set_position(d->plane2, 100, 100);
+	igt_create_color_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
+			    pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
+	igt_plane_set_fb(plane, &d->fb[0]);
 
-	/* scaled window size is outside the modeset area.*/
-	igt_plane_set_size(d->plane1, mode->hdisplay + 200,
-					    mode->vdisplay + 200);
-	igt_plane_set_size(d->plane2, mode->hdisplay + 100,
-					    mode->vdisplay + 100);
+	/* scaled window size is outside the modeset area. */
+	igt_plane_set_size(plane, width, height);
+	igt_plane_set_rotation(plane, rot);
 
 	/*
-	 * Can't guarantee that the clipped coordinates are
-	 * suitably aligned for yuv. So allow the commit to fail.
+	 * can't guarantee that the clipped coordinates are
+	 * suitably aligned for yuv. so allow commit to fail.
 	 */
-	if (igt_format_is_yuv(d->fb[1].drm_format) ||
-	    igt_format_is_yuv(d->fb[2].drm_format))
+	if (igt_format_is_yuv(d->fb[0].drm_format))
 		igt_display_try_commit2(&d->display, COMMIT_ATOMIC);
 	else
 		igt_display_commit2(&d->display, COMMIT_ATOMIC);
+
+	igt_plane_set_fb(plane, NULL);
+	igt_remove_fb(display->drm_fd, &d->fb[0]);
 }
 
 static void
-test_scaler_with_clipping_clamping_scenario(data_t *d, enum pipe pipe, igt_output_t *output)
+test_scaler_with_clipping_clamping(data_t *d, int width, int height,
+				   enum pipe pipe, igt_output_t *output)
 {
-	igt_pipe_t *pipe_obj = &d->display.pipes[pipe];
-	drmModeModeInfo *mode;
-	struct igt_vec tested_formats1;
-
-	igt_require(get_num_scalers(d, pipe) >= 2);
-
-	mode = igt_output_get_mode(output);
-	d->plane1 = igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_PRIMARY);
-	d->plane2 = igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
-	prepare_crtc(d, output, pipe, d->plane1, mode);
-
-	igt_vec_init(&tested_formats1, sizeof(uint32_t));
+	igt_display_t *display = &d->display;
+	igt_plane_t *plane;
 
-	for (int i = 0; i < d->plane1->drm_plane->count_formats; i++) {
-		unsigned f1 = d->plane1->drm_plane->formats[i];
-		struct igt_vec tested_formats2;
+	igt_require(get_num_scalers(d, pipe) > 0);
 
-		if (!test_pipe_iteration(d, pipe, i))
-			continue;
+	igt_output_set_pipe(output, pipe);
 
-		if (!test_format(d, &tested_formats1, f1) ||
-		    !can_scale(d, f1))
+	for_each_plane_on_pipe(display, pipe, plane) {
+		if (plane->type == DRM_PLANE_TYPE_CURSOR)
 			continue;
 
-		igt_vec_init(&tested_formats2, sizeof(uint32_t));
+		for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
+			uint64_t modifier = modifiers[i];
+			struct igt_vec tested_formats;
 
-		igt_create_pattern_fb(d->drm_fd,
-				      mode->hdisplay, mode->vdisplay, f1,
-				      I915_FORMAT_MOD_X_TILED, &d->fb[1]);
+			igt_vec_init(&tested_formats, sizeof(uint32_t));
 
-		for (int j = 0; j < d->plane2->drm_plane->count_formats; j++) {
-			unsigned f2 = d->plane2->drm_plane->formats[j];
+			for (int j = 0; j < plane->drm_plane->count_formats; j++) {
+				uint32_t format = plane->drm_plane->formats[j];
 
-			if (!test_format(d, &tested_formats2, f2) ||
-			    !can_scale(d, f2))
-				continue;
+				if (!test_pipe_iteration(d, pipe, j))
+					continue;
 
-			igt_create_pattern_fb(d->drm_fd,
-					      mode->hdisplay, mode->vdisplay, f2,
-					      I915_FORMAT_MOD_Y_TILED,
-					      &d->fb[2]);
+				if (test_format(d, &tested_formats, format) &&
+				    igt_plane_has_format_mod(plane, format, modifier) &&
+				    can_scale(d, format))
+						__test_scaler_with_clipping_clamping(d, plane, width, height,
+										     format, modifier,
+										     pipe, output, IGT_ROTATION_0);
+			}
 
-			__test_scaler_with_clipping_clamping_scenario(d, mode);
-			igt_remove_fb(d->drm_fd, &d->fb[2]);
+			igt_vec_fini(&tested_formats);
 		}
-		igt_remove_fb(d->drm_fd, &d->fb[1]);
-
-		igt_vec_fini(&tested_formats2);
 	}
-
-	igt_vec_fini(&tested_formats1);
 }
 
 static void find_connected_pipe(igt_display_t *display, bool second, enum pipe *pipe, igt_output_t **output)
@@ -949,9 +901,15 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		igt_describe("Tests scaling with clipping and clamping.");
 		igt_subtest_with_dynamic("scaler-with-clipping-clamping") {
-			for_each_pipe_with_single_output(&data.display, pipe, output)
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
 				igt_dynamic_f("pipe-%s-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_clipping_clamping_scenario(&data, pipe, output);
+					test_scaler_with_clipping_clamping(&data, mode->hdisplay + 200,
+						    mode->vdisplay + 200, pipe, output);
+			}
 		}
 
 		igt_describe("Tests upscaling of 2 planes, from 20x20 fb.");
-- 
2.25.1
