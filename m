Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDE510EAFA
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jan 2022 13:34:50 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Fri, 21 Jan 2022 19:18:28 +0530
Message-Id: <20220121134833.28740-2-swati2.sharma@intel.com>
In-Reply-To: <20220121134833.28740-1-swati2.sharma@intel.com>
References: <20220121134833.28740-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 1/6] tests/kms_plane_scaling: Removal of
 plane-scaling subtest
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
List-ID: <igt-dev@lists.freedesktop.org>

The test case has dead code, primary_plane_scaling is always 0.
Also, upscaling and downscaling scenarios seems little bit messy.
Lets simplify those scenarios by introducing new subtests covering both
upscaling and downscaling.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 179 --------------------------------------
 1 file changed, 179 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 85db11ee..4e2be7f2 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -323,178 +323,6 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, enum pipe pipe, igt_ou
 	}
 }
 
-/* does iterative scaling on plane2 */
-static void iterate_plane_scaling(data_t *d, drmModeModeInfo *mode)
-{
-	igt_display_t *display = &d->display;
-
-	if (mode->hdisplay >= d->fb[1].width) {
-		int w, h;
-		/* fixed fb */
-		igt_fb_set_position(&d->fb[1], d->plane2, 0, 0);
-		igt_fb_set_size(&d->fb[1], d->plane2, d->fb[1].width, d->fb[1].height);
-		igt_plane_set_position(d->plane2, 0, 0);
-
-		/* adjust plane size */
-		for (w = d->fb[1].width; w <= mode->hdisplay; w+=10) {
-			h = w * d->fb[1].height / d->fb[1].width;
-			igt_plane_set_size(d->plane2, w, h);
-			igt_display_commit2(display, COMMIT_ATOMIC);
-		}
-	} else {
-		int w, h;
-		/* fixed plane */
-		igt_plane_set_position(d->plane2, 0, 0);
-		igt_plane_set_size(d->plane2, mode->hdisplay, mode->vdisplay);
-		igt_fb_set_position(&d->fb[1], d->plane2, 0, 0);
-
-		/* adjust fb size */
-		for (w = mode->hdisplay; w <= d->fb[1].width; w+=10) {
-			/* Source coordinates must not be clipped. */
-			h = min(w * mode->hdisplay / mode->vdisplay, d->fb[1].height);
-			igt_fb_set_size(&d->fb[1], d->plane2, w, h);
-			igt_display_commit2(display, COMMIT_ATOMIC);
-		}
-	}
-}
-
-static void
-test_plane_scaling_on_pipe(data_t *d, enum pipe pipe, igt_output_t *output)
-{
-	igt_display_t *display = &d->display;
-	igt_pipe_t *pipe_obj = &display->pipes[pipe];
-	drmModeModeInfo *mode;
-	int primary_plane_scaling = 0; /* For now */
-	uint64_t modifier = is_i915_device(display->drm_fd) ?
-		I915_FORMAT_MOD_X_TILED : DRM_FORMAT_MOD_LINEAR;
-
-	igt_require(get_num_scalers(d, pipe) > 0);
-
-	igt_skip_on(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888,
-						modifier));
-
-	mode = igt_output_get_mode(output);
-
-	/* Set up display with plane 1 */
-	d->plane1 = igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_PRIMARY);
-	prepare_crtc(d, output, pipe, d->plane1, mode);
-
-	igt_create_color_pattern_fb(display->drm_fd, 600, 600,
-				    DRM_FORMAT_XRGB8888,
-				    modifier,
-				    .5, .5, .5, &d->fb[1]);
-
-	igt_create_pattern_fb(d->drm_fd,
-			      mode->hdisplay, mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
-			      modifier,
-			      &d->fb[2]);
-
-	if (primary_plane_scaling) {
-		/* Primary plane upscaling */
-		igt_fb_set_position(&d->fb[0], d->plane1, 100, 100);
-		igt_fb_set_size(&d->fb[0], d->plane1, 500, 500);
-		igt_plane_set_position(d->plane1, 0, 0);
-		igt_plane_set_size(d->plane1, mode->hdisplay, mode->vdisplay);
-		igt_display_commit2(display, COMMIT_ATOMIC);
-
-		/* Primary plane 1:1 no scaling */
-		igt_fb_set_position(&d->fb[0], d->plane1, 0, 0);
-		igt_fb_set_size(&d->fb[0], d->plane1, d->fb[0].width, d->fb[0].height);
-		igt_plane_set_position(d->plane1, 0, 0);
-		igt_plane_set_size(d->plane1, mode->hdisplay, mode->vdisplay);
-		igt_display_commit2(display, COMMIT_ATOMIC);
-	}
-
-	/* Set up fb[1]->plane2 mapping. */
-	d->plane2 = igt_pipe_get_plane_type_index(pipe_obj,
-						  DRM_PLANE_TYPE_OVERLAY, 0);
-
-	if (!d->plane2) {
-		igt_debug("Plane-2 doesnt exist on pipe %s\n", kmstest_pipe_name(pipe));
-		return;
-	}
-
-	igt_plane_set_fb(d->plane2, &d->fb[1]);
-
-	/* 2nd plane windowed */
-	igt_fb_set_position(&d->fb[1], d->plane2, 100, 100);
-	igt_fb_set_size(&d->fb[1], d->plane2, d->fb[1].width-200, d->fb[1].height-200);
-	igt_plane_set_position(d->plane2, 100, 100);
-	igt_plane_set_size(d->plane2, mode->hdisplay-200, mode->vdisplay-200);
-	igt_display_commit2(display, COMMIT_ATOMIC);
-
-	iterate_plane_scaling(d, mode);
-
-	/* 2nd plane up scaling */
-	igt_fb_set_position(&d->fb[1], d->plane2, 100, 100);
-	igt_fb_set_size(&d->fb[1], d->plane2, 500, 500);
-	igt_plane_set_position(d->plane2, 10, 10);
-	igt_plane_set_size(d->plane2, mode->hdisplay-20, mode->vdisplay-20);
-	igt_display_commit2(display, COMMIT_ATOMIC);
-
-	/* 2nd plane downscaling */
-	igt_fb_set_position(&d->fb[1], d->plane2, 0, 0);
-	igt_fb_set_size(&d->fb[1], d->plane2, d->fb[1].width, d->fb[1].height);
-	igt_plane_set_position(d->plane2, 10, 10);
-
-	/* Downscale (10/9)x of original image */
-	igt_plane_set_size(d->plane2, (d->fb[1].width * 10)/9, (d->fb[1].height * 10)/9);
-	igt_display_commit2(display, COMMIT_ATOMIC);
-
-	if (primary_plane_scaling) {
-		/* Primary plane up scaling */
-		igt_fb_set_position(&d->fb[0], d->plane1, 100, 100);
-		igt_fb_set_size(&d->fb[0], d->plane1, 500, 500);
-		igt_plane_set_position(d->plane1, 0, 0);
-		igt_plane_set_size(d->plane1, mode->hdisplay, mode->vdisplay);
-		igt_display_commit2(display, COMMIT_ATOMIC);
-	}
-
-	/* Set up fb[2]->plane3 mapping. */
-	d->plane3 = igt_pipe_get_plane_type_index(pipe_obj,
-						  DRM_PLANE_TYPE_OVERLAY, 1);
-	if(!d->plane3) {
-		igt_debug("Plane-3 doesnt exist on pipe %s\n", kmstest_pipe_name(pipe));
-		return;
-	}
-
-	igt_plane_set_fb(d->plane3, &d->fb[2]);
-
-	/* 3rd plane windowed - no scaling */
-	igt_fb_set_position(&d->fb[2], d->plane3, 100, 100);
-	igt_fb_set_size(&d->fb[2], d->plane3, d->fb[2].width-300, d->fb[2].height-300);
-	igt_plane_set_position(d->plane3, 100, 100);
-	igt_plane_set_size(d->plane3, mode->hdisplay-300, mode->vdisplay-300);
-	igt_display_commit2(display, COMMIT_ATOMIC);
-
-	/* Switch scaler from plane 2 to plane 3 */
-	igt_fb_set_position(&d->fb[1], d->plane2, 100, 100);
-	igt_fb_set_size(&d->fb[1], d->plane2, d->fb[1].width-200, d->fb[1].height-200);
-	igt_plane_set_position(d->plane2, 100, 100);
-	igt_plane_set_size(d->plane2, d->fb[1].width-200, d->fb[1].height-200);
-
-	igt_fb_set_position(&d->fb[2], d->plane3, 100, 100);
-	igt_fb_set_size(&d->fb[2], d->plane3, d->fb[2].width-400, d->fb[2].height-400);
-	igt_plane_set_position(d->plane3, 10, 10);
-	igt_plane_set_size(d->plane3, mode->hdisplay-300, mode->vdisplay-300);
-	igt_display_commit2(display, COMMIT_ATOMIC);
-
-	if (primary_plane_scaling) {
-		/* Switch scaler from plane 1 to plane 2 */
-		igt_fb_set_position(&d->fb[0], d->plane1, 0, 0);
-		igt_fb_set_size(&d->fb[0], d->plane1, d->fb[0].width, d->fb[0].height);
-		igt_plane_set_position(d->plane1, 0, 0);
-		igt_plane_set_size(d->plane1, mode->hdisplay, mode->vdisplay);
-
-		igt_fb_set_position(&d->fb[1], d->plane2, 100, 100);
-		igt_fb_set_size(&d->fb[1], d->plane2, d->fb[1].width-500,d->fb[1].height-500);
-		igt_plane_set_position(d->plane2, 100, 100);
-		igt_plane_set_size(d->plane2, mode->hdisplay-200, mode->vdisplay-200);
-		igt_display_commit2(display, COMMIT_ATOMIC);
-	}
-}
-
 static void
 __test_scaler_with_clipping_clamping_scenario(data_t *d, drmModeModeInfo *mode)
 {
@@ -719,13 +547,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_subtest_group {
 		igt_output_t *output;
 
-		igt_describe("Tests plane scaling per pipe.");
-		igt_subtest_with_dynamic("plane-scaling") {
-			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-plane-scaling", kmstest_pipe_name(pipe))
-					test_plane_scaling_on_pipe(&data, pipe, output);
-		}
-
 		igt_describe("Tests scaling with pixel formats.");
 		igt_subtest_with_dynamic("scaler-with-pixel-format") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-- 
2.25.1
