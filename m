Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DD610E6A6
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Feb 2022 17:12:15 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 28 Feb 2022 22:53:12 +0530
Message-Id: <20220228172318.851-3-swati2.sharma@intel.com>
In-Reply-To: <20220228172318.851-1-swati2.sharma@intel.com>
References: <20220228172318.851-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v9 2/8] tests/kms_plane_scaling: Cleanup
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

In this patch,
    -improved indentation
    -removed get_num_scalers() and used try_commit()
    -used test_pipe_iteration() to reduce exec. time
    -clipping/clamping can reuse same func()
    -removed unused var

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
---
 tests/kms_plane_scaling.c | 289 ++++++++++----------------------------
 1 file changed, 77 insertions(+), 212 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index ac39d37b..3f73e938 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -26,47 +26,19 @@
 #include "igt_vec.h"
 #include <math.h>
 
-
 IGT_TEST_DESCRIPTION("Test display plane scaling");
 
 typedef struct {
 	uint32_t devid;
 	int drm_fd;
 	igt_display_t display;
-	igt_crc_t ref_crc;
-
-	int image_w;
-	int image_h;
-
 	struct igt_fb fb[4];
-
-	igt_plane_t *plane1;
-	igt_plane_t *plane2;
-	igt_plane_t *plane3;
-	igt_plane_t *plane4;
 	bool extended;
 } data_t;
 
-static int get_num_scalers(data_t* d, enum pipe pipe)
-{
-	if (!is_i915_device(d->drm_fd))
-		return 1;
-
-	igt_require(intel_display_ver(d->devid) >= 9);
-
-	if (intel_display_ver(d->devid) >= 10)
-		return 2;
-	else if (pipe != PIPE_C)
-		return 2;
-	else
-		return 1;
-}
-
 static void cleanup_fbs(data_t *data)
 {
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(data->fb); i++)
+	for (int i = 0; i < ARRAY_SIZE(data->fb); i++)
 		igt_remove_fb(data->drm_fd, &data->fb[i]);
 }
 
@@ -77,47 +49,6 @@ static void cleanup_crtc(data_t *data)
 	cleanup_fbs(data);
 }
 
-static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
-			igt_plane_t *plane, drmModeModeInfo *mode)
-{
-	igt_display_t *display = &data->display;
-	uint64_t modifier = is_i915_device(data->drm_fd) ?
-		I915_FORMAT_MOD_X_TILED : DRM_FORMAT_MOD_LINEAR;
-
-	cleanup_crtc(data);
-
-	igt_output_set_pipe(output, pipe);
-
-	igt_skip_on(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888,
-						modifier));
-
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
-}
-
 static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 					 uint32_t pixel_format,
 					 uint64_t modifier,
@@ -128,33 +59,33 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 					 igt_rotation_t rot)
 {
 	igt_display_t *display = &d->display;
-	int commit_ret;
 	drmModeModeInfo *mode;
+	int commit_ret;
+	int w, h;
 
-	cleanup_crtc(d);
-
-	igt_output_set_pipe(output, pipe);
 	mode = igt_output_get_mode(output);
 
+	if (is_upscale) {
+		w = width;
+		h = height;
+	} else {
+		w = mode->hdisplay;
+		h = mode->vdisplay;
+	}
+
 	/*
-	 * Guarantee even value width/height to avoid fractional
-	 * UV component in chroma subsampling for YUV 4:2:0 formats
+	 * guarantee even value width/height to avoid fractional
+	 * uv component in chroma subsampling for yuv 4:2:0 formats
 	 * */
-	width = ALIGN(width, 2);
-	height = ALIGN(height, 2);
-
-	if (is_upscale)
-		igt_create_color_fb(display->drm_fd, width, height,
-		       	pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
-	else
-		igt_create_color_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
-		       	pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
+	w = ALIGN(w, 2);
+	h = ALIGN(h, 2);
 
+	igt_create_color_fb(display->drm_fd, w, h,
+			    pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
 
 	igt_plane_set_fb(plane, &d->fb[0]);
-
 	igt_fb_set_position(&d->fb[0], plane, 0, 0);
-	igt_fb_set_size(&d->fb[0], plane, width, height);
+	igt_fb_set_size(&d->fb[0], plane, w, h);
 	igt_plane_set_position(plane, 0, 0);
 
 	if (is_upscale)
@@ -170,7 +101,7 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 
 	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
 		      "Unsupported scaling factor with fb size %dx%d\n",
-		      width, height);
+		      w, h);
 	igt_assert_eq(commit_ret, 0);
 }
 
@@ -184,7 +115,6 @@ static const igt_rotation_t rotations[] = {
 static bool can_rotate(data_t *d, unsigned format, uint64_t modifier,
 		       igt_rotation_t rot)
 {
-
 	if (!is_i915_device(d->drm_fd))
 		return true;
 
@@ -272,13 +202,13 @@ static void test_scaler_with_rotation_pipe(data_t *d,
 					   igt_output_t *output)
 {
 	igt_display_t *display = &d->display;
+	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	igt_plane_t *plane;
-	uint64_t modifier = is_i915_device(d->drm_fd) ?
-		I915_FORMAT_MOD_Y_TILED : DRM_FORMAT_MOD_LINEAR;
 
-	igt_require(get_num_scalers(d, pipe) > 0);
+	cleanup_crtc(d);
 
 	igt_output_set_pipe(output, pipe);
+
 	for_each_plane_on_pipe(display, pipe, plane) {
 		if (plane->type == DRM_PLANE_TYPE_CURSOR)
 			continue;
@@ -292,6 +222,9 @@ static void test_scaler_with_rotation_pipe(data_t *d,
 			for (int j = 0; j < plane->drm_plane->count_formats; j++) {
 				unsigned format = plane->drm_plane->formats[j];
 
+				if (!test_pipe_iteration(d, pipe, j))
+					continue;
+
 				if (test_format(d, &tested_formats, format) &&
 				    igt_plane_has_format_mod(plane, format, modifier) &&
 				    igt_plane_has_rotation(plane, rot) &&
@@ -323,7 +256,7 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height,
 	igt_display_t *display = &d->display;
 	igt_plane_t *plane;
 
-	igt_require(get_num_scalers(d, pipe) > 0);
+	cleanup_crtc(d);
 
 	igt_output_set_pipe(output, pipe);
 
@@ -340,6 +273,9 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height,
 			for (int j = 0; j < plane->drm_plane->count_formats; j++) {
 				uint32_t format = plane->drm_plane->formats[j];
 
+				if (!test_pipe_iteration(d, pipe, j))
+					continue;
+
 				if (test_format(d, &tested_formats, format) &&
 				    igt_plane_has_format_mod(plane, format, modifier) &&
 				    can_scale(d, format))
@@ -355,92 +291,6 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height,
 	}
 }
 
-static void
-__test_scaler_with_clipping_clamping_scenario(data_t *d, drmModeModeInfo *mode)
-{
-	igt_plane_set_fb(d->plane1, &d->fb[1]);
-	igt_plane_set_fb(d->plane2, &d->fb[2]);
-
-	igt_fb_set_position(&d->fb[1], d->plane1, 0, 0);
-	igt_fb_set_size(&d->fb[1], d->plane1, 300, 300);
-	igt_plane_set_position(d->plane1, 100, 400);
-	igt_fb_set_position(&d->fb[2], d->plane2, 0, 0);
-	igt_fb_set_size(&d->fb[2], d->plane2, 400, 400);
-	igt_plane_set_position(d->plane2, 100, 100);
-
-	/* scaled window size is outside the modeset area.*/
-	igt_plane_set_size(d->plane1, mode->hdisplay + 200,
-					    mode->vdisplay + 200);
-	igt_plane_set_size(d->plane2, mode->hdisplay + 100,
-					    mode->vdisplay + 100);
-
-	/*
-	 * Can't guarantee that the clipped coordinates are
-	 * suitably aligned for yuv. So allow the commit to fail.
-	 */
-	if (igt_format_is_yuv(d->fb[1].drm_format) ||
-	    igt_format_is_yuv(d->fb[2].drm_format))
-		igt_display_try_commit2(&d->display, COMMIT_ATOMIC);
-	else
-		igt_display_commit2(&d->display, COMMIT_ATOMIC);
-}
-
-static void
-test_scaler_with_clipping_clamping_scenario(data_t *d, enum pipe pipe, igt_output_t *output)
-{
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
-
-	for (int i = 0; i < d->plane1->drm_plane->count_formats; i++) {
-		unsigned f1 = d->plane1->drm_plane->formats[i];
-		struct igt_vec tested_formats2;
-
-		if (!test_pipe_iteration(d, pipe, i))
-			continue;
-
-		if (!test_format(d, &tested_formats1, f1) ||
-		    !can_scale(d, f1))
-			continue;
-
-		igt_vec_init(&tested_formats2, sizeof(uint32_t));
-
-		igt_create_pattern_fb(d->drm_fd,
-				      mode->hdisplay, mode->vdisplay, f1,
-				      I915_FORMAT_MOD_X_TILED, &d->fb[1]);
-
-		for (int j = 0; j < d->plane2->drm_plane->count_formats; j++) {
-			unsigned f2 = d->plane2->drm_plane->formats[j];
-
-			if (!test_format(d, &tested_formats2, f2) ||
-			    !can_scale(d, f2))
-				continue;
-
-			igt_create_pattern_fb(d->drm_fd,
-					      mode->hdisplay, mode->vdisplay, f2,
-					      I915_FORMAT_MOD_Y_TILED,
-					      &d->fb[2]);
-
-			__test_scaler_with_clipping_clamping_scenario(d, mode);
-			igt_remove_fb(d->drm_fd, &d->fb[2]);
-		}
-		igt_remove_fb(d->drm_fd, &d->fb[1]);
-
-		igt_vec_fini(&tested_formats2);
-	}
-
-	igt_vec_fini(&tested_formats1);
-}
-
 static void find_connected_pipe(igt_display_t *display, bool second, enum pipe *pipe, igt_output_t **output)
 {
 	enum pipe first = PIPE_NONE;
@@ -472,9 +322,9 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	igt_display_t *display = &d->display;
 	igt_output_t *output1, *output2;
 	drmModeModeInfo *mode1, *mode2;
+	igt_plane_t *plane[4];
 	enum pipe pipe1, pipe2;
-	uint64_t modifier = is_i915_device(display->drm_fd) ?
-		I915_FORMAT_MOD_Y_TILED : DRM_FORMAT_MOD_LINEAR;
+	int ret1, ret2;
 
 	cleanup_crtc(d);
 
@@ -486,36 +336,32 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	igt_output_set_pipe(output1, pipe1);
 	igt_output_set_pipe(output2, pipe2);
 
-	d->plane1 = igt_output_get_plane(output1, 0);
-	d->plane2 = get_num_scalers(d, pipe1) >= 2 ? igt_output_get_plane(output1, 1) : NULL;
-	d->plane3 = igt_output_get_plane(output2, 0);
-	d->plane4 = get_num_scalers(d, pipe2) >= 2 ? igt_output_get_plane(output2, 1) : NULL;
-
-	igt_skip_on(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888,
-						modifier));
+	plane[0] = igt_output_get_plane(output1, 0);
+	igt_require(plane[0]);
+	plane[1] = igt_output_get_plane(output1, 0);
+	igt_require(plane[1]);
+	plane[2] = igt_output_get_plane(output2, 1);
+	igt_require(plane[2]);
+	plane[3] = igt_output_get_plane(output2, 1);
+	igt_require(plane[3]);
 
 	igt_create_pattern_fb(d->drm_fd, 600, 600,
 			      DRM_FORMAT_XRGB8888,
-			      modifier, &d->fb[0]);
-
+			      I915_TILING_NONE, &d->fb[0]);
 	igt_create_pattern_fb(d->drm_fd, 500, 500,
 			      DRM_FORMAT_XRGB8888,
-			      modifier, &d->fb[1]);
-
+			      I915_TILING_NONE, &d->fb[1]);
 	igt_create_pattern_fb(d->drm_fd, 700, 700,
 			      DRM_FORMAT_XRGB8888,
-			      modifier, &d->fb[2]);
-
+			      I915_TILING_NONE, &d->fb[2]);
 	igt_create_pattern_fb(d->drm_fd, 400, 400,
 			      DRM_FORMAT_XRGB8888,
-			      modifier, &d->fb[3]);
+			      I915_TILING_NONE, &d->fb[3]);
 
-	igt_plane_set_fb(d->plane1, &d->fb[0]);
-	if (d->plane2)
-		igt_plane_set_fb(d->plane2, &d->fb[1]);
-	igt_plane_set_fb(d->plane3, &d->fb[2]);
-	if (d->plane4)
-		igt_plane_set_fb(d->plane4, &d->fb[3]);
+	igt_plane_set_fb(plane[0], &d->fb[0]);
+	igt_plane_set_fb(plane[1], &d->fb[1]);
+	igt_plane_set_fb(plane[2], &d->fb[2]);
+	igt_plane_set_fb(plane[3], &d->fb[3]);
 
 	if (igt_display_try_commit_atomic(display,
 				DRM_MODE_ATOMIC_TEST_ONLY |
@@ -530,15 +376,25 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	mode1 = igt_output_get_mode(output1);
 	mode2 = igt_output_get_mode(output2);
 
-	/* Upscaling Primary */
-	igt_plane_set_size(d->plane1, mode1->hdisplay, mode1->vdisplay);
-	igt_plane_set_size(d->plane3, mode2->hdisplay, mode2->vdisplay);
-	igt_display_commit2(display, COMMIT_ATOMIC);
-
-	/* Upscaling Sprites */
-	igt_plane_set_size(d->plane2 ?: d->plane1, mode1->hdisplay, mode1->vdisplay);
-	igt_plane_set_size(d->plane4 ?: d->plane3, mode2->hdisplay, mode2->vdisplay);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	/* upscaling primary */
+	igt_plane_set_size(plane[0], mode1->hdisplay, mode1->vdisplay);
+	igt_plane_set_size(plane[2], mode2->hdisplay, mode2->vdisplay);
+	ret1 = igt_display_try_commit2(display, COMMIT_ATOMIC);
+
+	/* upscaling sprites */
+	igt_plane_set_size(plane[1], mode1->hdisplay, mode1->vdisplay);
+	igt_plane_set_size(plane[3], mode2->hdisplay, mode2->vdisplay);
+	ret2 = igt_display_try_commit2(display, COMMIT_ATOMIC);
+
+	igt_plane_set_fb(plane[0], NULL);
+	igt_plane_set_fb(plane[1], NULL);
+	igt_plane_set_fb(plane[2], NULL);
+	igt_plane_set_fb(plane[3], NULL);
+
+	igt_skip_on_f(ret1 == -ERANGE || ret1 == -EINVAL ||
+		      ret2 == -ERANGE || ret1 == -EINVAL,
+		      "Scaling op is not supported by driver\n");
+	igt_assert_eq(ret1 && ret2, 0);
 }
 
 static int opt_handler(int opt, int opt_index, void *_data)
@@ -605,6 +461,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				drmModeModeInfo *mode;
 
 				mode = igt_output_get_mode(output);
+
 				igt_dynamic_f("pipe-%s-downscale-with-pixel-format", kmstest_pipe_name(pipe))
 					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay / 4,
 							mode->vdisplay / 4, false, pipe, output);
@@ -623,6 +480,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							mode->vdisplay / 2, false, pipe, output);
 			}
 		}
+
 		igt_describe("Tests scaling with pixel formats, unity scaling.");
 		igt_subtest_with_dynamic("scaler-with-pixel-format-unity-scaling") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
@@ -681,6 +539,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							mode->vdisplay / 2, false, pipe, output);
 			}
 		}
+
 		igt_describe("Tests scaling with tiling rotation, unity scaling.");
 		igt_subtest_with_dynamic("scaler-with-rotation-unity-scaling") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
@@ -696,9 +555,15 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		igt_describe("Tests scaling with clipping and clamping.");
 		igt_subtest_with_dynamic("scaler-with-clipping-clamping") {
-			for_each_pipe_with_single_output(&data.display, pipe, output)
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
 				igt_dynamic_f("pipe-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe))
-					test_scaler_with_clipping_clamping_scenario(&data, pipe, output);
+					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay + 100,
+							mode->vdisplay + 100, false, pipe, output);
+			}
 		}
 	}
 
-- 
2.25.1
