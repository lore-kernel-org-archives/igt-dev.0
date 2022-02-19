Return-path: <SRS0=itlh=TC=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1ECC10EB31
 for <igt-dev@lists.freedesktop.org>; Sat, 19 Feb 2022 02:59:30 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 18 Feb 2022 18:59:09 -0800
Message-ID: <20220219025909.174-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v4] kms_plane_scaling: Add more scale factor
 tests to cover more drivers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>, aravindh@codeaurora.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Petri Latvala <petri.latvala@intel.com>

Not all drivers support all scale factors. Introduce more scale
factors rather than only testing scaling from a 20x20 fb.

Changes since V3:
- Added skip on -EINVAL
- Added downscaling subtests
- Modified test and subtest names to distinguish between upscaling and
  downscaling subtests

Changes since V2:
- Replaced odd width/height check with ALIGN macro

Changes since V1:
- Fixed inconsistent parameter order
- Moved igt_output_get_mode to inside for_each_pipe_with_single_output
  for scaler-with-pixel-format-factor-4 subtest
- Add check to guarantee even aligned framebuffer size to avoid
  fractional UV component during chroma subsampling for YUV 4:2:0
  formats

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # RB3 (sdm845), RB5 (qrb5165), Chromebook (Lazor)
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Change-Id: Ie3016a3ccbf18d6e7388ffff930bb6ccc17dcacb
---
 tests/kms_plane_scaling.c | 173 +++++++++++++++++++++++++++++++++-----
 1 file changed, 153 insertions(+), 20 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 85db11ee6dbd..bd1bc073eb87 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -120,12 +120,15 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 
 static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 					 uint32_t pixel_format,
-					 uint64_t modifier, enum pipe pipe,
+					 uint64_t modifier,
+					 int width, int height,
+					 bool is_upscale,
+					 enum pipe pipe,
 					 igt_output_t *output,
 					 igt_rotation_t rot)
 {
 	igt_display_t *display = &d->display;
-	int width, height;
+	int commit_ret;
 	drmModeModeInfo *mode;
 
 	cleanup_crtc(d);
@@ -133,22 +136,42 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 	igt_output_set_pipe(output, pipe);
 	mode = igt_output_get_mode(output);
 
-	/* create buffer in the range of  min and max source side limit.*/
-	width = height = 20;
-	igt_create_color_fb(display->drm_fd, width, height,
-		       pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
+	/*
+	 * Guarantee even value width/height to avoid fractional
+	 * UV component in chroma subsampling for YUV 4:2:0 formats
+	 * */
+	width = ALIGN(width, 2);
+	height = ALIGN(height, 2);
+
+	if (is_upscale)
+		igt_create_color_fb(display->drm_fd, width, height,
+		       	pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
+	else
+		igt_create_color_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
+		       	pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
+
+
 	igt_plane_set_fb(plane, &d->fb[0]);
 
-	/* Check min to full resolution upscaling */
 	igt_fb_set_position(&d->fb[0], plane, 0, 0);
 	igt_fb_set_size(&d->fb[0], plane, width, height);
 	igt_plane_set_position(plane, 0, 0);
-	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
+
+	if (is_upscale)
+		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
+	else
+		igt_plane_set_size(plane, width, height);
+
 	igt_plane_set_rotation(plane, rot);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
 
 	igt_plane_set_fb(plane, NULL);
 	igt_plane_set_position(plane, 0, 0);
+
+	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
+		      "Unsupported scaling factor with fb size %dx%d\n",
+		      width, height);
+	igt_assert_eq(commit_ret, 0);
 }
 
 static const igt_rotation_t rotations[] = {
@@ -242,7 +265,10 @@ static bool test_pipe_iteration(data_t *data, enum pipe pipe, int iteration)
 	return true;
 }
 
-static void test_scaler_with_rotation_pipe(data_t *d, enum pipe pipe,
+static void test_scaler_with_rotation_pipe(data_t *d,
+					   int width, int height,
+					   bool is_upscale,
+					   enum pipe pipe,
 					   igt_output_t *output)
 {
 	igt_display_t *display = &d->display;
@@ -271,9 +297,12 @@ static void test_scaler_with_rotation_pipe(data_t *d, enum pipe pipe,
 				    igt_plane_has_rotation(plane, rot) &&
 				    can_rotate(d, format, modifier, rot) &&
 				    can_scale(d, format))
-					check_scaling_pipe_plane_rot(d, plane, format,
-								     modifier, pipe,
-								     output, rot);
+					check_scaling_pipe_plane_rot(d, plane,
+								     format, modifier,
+								     width, height,
+								     is_upscale,
+								     pipe, output,
+								     rot);
 			}
 
 			igt_vec_fini(&tested_formats);
@@ -288,7 +317,8 @@ static const uint64_t modifiers[] = {
 	I915_FORMAT_MOD_Yf_TILED
 };
 
-static void test_scaler_with_pixel_format_pipe(data_t *d, enum pipe pipe, igt_output_t *output)
+static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height, bool is_upscale,
+					       enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &d->display;
 	igt_plane_t *plane;
@@ -315,6 +345,8 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, enum pipe pipe, igt_ou
 				    can_scale(d, format))
 					check_scaling_pipe_plane_rot(d, plane,
 								     format, modifier,
+								     width, height,
+								     is_upscale,
 								     pipe, output, IGT_ROTATION_0);
 			}
 
@@ -726,18 +758,119 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					test_plane_scaling_on_pipe(&data, pipe, output);
 		}
 
-		igt_describe("Tests scaling with pixel formats.");
-		igt_subtest_with_dynamic("scaler-with-pixel-format") {
+		igt_describe("Tests upscaling with pixel formats, from 20x20 fb.");
+		igt_subtest_with_dynamic("upscale-with-pixel-format-20x20") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-upscale-with-pixel-format", kmstest_pipe_name(pipe))
+					test_scaler_with_pixel_format_pipe(&data, 20, 20, true, pipe, output);
+		}
+
+		igt_describe("Tests upscaling with pixel formats, scaling factor 4.");
+		igt_subtest_with_dynamic("upscale-with-pixel-format-factor-4") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
+				igt_dynamic_f("pipe-%s-upscale-with-pixel-format", kmstest_pipe_name(pipe))
+					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay / 4,
+							mode->vdisplay / 4, true, pipe, output);
+			}
+		}
+
+		igt_describe("Tests downscaling with pixel formats, scaling factor 4.");
+		igt_subtest_with_dynamic("downscale-with-pixel-format-factor-4") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+				igt_dynamic_f("pipe-%s-downscale-with-pixel-format", kmstest_pipe_name(pipe))
+					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay / 4,
+							mode->vdisplay / 4, false, pipe, output);
+			}
+		}
+
+		igt_describe("Tests downscaling with pixel formats, scaling factor 2.");
+		igt_subtest_with_dynamic("downscale-with-pixel-format-factor-2") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
+				igt_dynamic_f("pipe-%s-downscale-with-pixel-format", kmstest_pipe_name(pipe))
+					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay / 2,
+							mode->vdisplay / 2, false, pipe, output);
+			}
+		}
+		igt_describe("Tests scaling with pixel formats, unity scaling.");
+		igt_subtest_with_dynamic("scaler-with-pixel-format-unity-scaling") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
 				igt_dynamic_f("pipe-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe))
-					test_scaler_with_pixel_format_pipe(&data, pipe, output);
+					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay,
+							mode->vdisplay, true, pipe, output);
+			}
 		}
 
-		igt_describe("Tests scaling with tiling rotation.");
-		igt_subtest_with_dynamic("scaler-with-rotation") {
+		igt_describe("Tests upscaling with tiling rotation, from 20x20 fb.");
+		igt_subtest_with_dynamic("upscale-with-rotation-20x20") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-upscale-with-rotation", kmstest_pipe_name(pipe))
+					test_scaler_with_rotation_pipe(&data, 20, 20, true, pipe, output);
+		}
+
+		igt_describe("Tests upscaling with tiling rotation, scaling factor 4.");
+		igt_subtest_with_dynamic("upscale-with-rotation-factor-4") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
+				igt_dynamic_f("pipe-%s-upscale-with-rotation", kmstest_pipe_name(pipe))
+					test_scaler_with_rotation_pipe(&data, mode->hdisplay / 4,
+							mode->vdisplay / 4, true, pipe, output);
+			}
+		}
+
+		igt_describe("Tests downscaling with tiling rotation, scaling factor 4.");
+		igt_subtest_with_dynamic("downscale-with-rotation-factor-4") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
+				igt_dynamic_f("pipe-%s-downscale-with-rotation", kmstest_pipe_name(pipe))
+					test_scaler_with_rotation_pipe(&data, mode->hdisplay / 4,
+							mode->vdisplay / 4, false, pipe, output);
+			}
+		}
+
+		igt_describe("Tests downscaling with tiling rotation, scaling factor 2.");
+		igt_subtest_with_dynamic("downscale-with-rotation-factor-2") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
+				igt_dynamic_f("pipe-%s-downscale-with-rotation", kmstest_pipe_name(pipe))
+					test_scaler_with_rotation_pipe(&data, mode->hdisplay / 2,
+							mode->vdisplay / 2, false, pipe, output);
+			}
+		}
+		igt_describe("Tests scaling with tiling rotation, unity scaling.");
+		igt_subtest_with_dynamic("scaler-with-rotation-unity-scaling") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
 				igt_dynamic_f("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe))
-					test_scaler_with_rotation_pipe(&data, pipe, output);
+					test_scaler_with_rotation_pipe(&data, mode->hdisplay,
+							mode->vdisplay, true, pipe, output);
+			}
 		}
 
 		igt_describe("Tests scaling with clipping and clamping.");
-- 
2.31.0
