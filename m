Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4069710E56D
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 14:30:29 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Feb 2022 20:14:30 +0530
Message-Id: <20220225144436.17718-3-swati2.sharma@intel.com>
In-Reply-To: <20220225144436.17718-1-swati2.sharma@intel.com>
References: <20220225144436.17718-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v7 2/8] tests/kms_plane_scaling: Minor changes with
 existing tests
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
	-output name is added to dynamic subtests
	-rename of existing tests
	-change in multiplier

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 77 ++++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 37 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index ac39d37b..5f608acd 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -145,10 +145,10 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 
 	if (is_upscale)
 		igt_create_color_fb(display->drm_fd, width, height,
-		       	pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
+			pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
 	else
 		igt_create_color_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
-		       	pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
+			pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
 
 
 	igt_plane_set_fb(plane, &d->fb[0]);
@@ -582,47 +582,49 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_describe("Tests upscaling with pixel formats, from 20x20 fb.");
 		igt_subtest_with_dynamic("upscale-with-pixel-format-20x20") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-upscale-with-pixel-format", kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-%s-upscale-with-pixel-format", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_pixel_format_pipe(&data, 20, 20, true, pipe, output);
 		}
 
-		igt_describe("Tests upscaling with pixel formats, scaling factor 4.");
-		igt_subtest_with_dynamic("upscale-with-pixel-format-factor-4") {
+		igt_describe("Tests upscaling with pixel formats for 0.25 scaling factor.");
+		igt_subtest_with_dynamic("upscale-with-pixel-format-factor-0-25") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
 				drmModeModeInfo *mode;
 
 				mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-upscale-with-pixel-format", kmstest_pipe_name(pipe))
-					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay / 4,
-							mode->vdisplay / 4, true, pipe, output);
+				igt_dynamic_f("pipe-%s-%s-upscale-with-pixel-format", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_pixel_format_pipe(&data, 0.25 * mode->hdisplay,
+							0.25 * mode->vdisplay, true, pipe, output);
 			}
 		}
 
-		igt_describe("Tests downscaling with pixel formats, scaling factor 4.");
-		igt_subtest_with_dynamic("downscale-with-pixel-format-factor-4") {
+		igt_describe("Tests downscaling with pixel formats for 0.25 scaling factor.");
+		igt_subtest_with_dynamic("downscale-with-pixel-format-factor-0-25") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
 				drmModeModeInfo *mode;
 
 				mode = igt_output_get_mode(output);
-				igt_dynamic_f("pipe-%s-downscale-with-pixel-format", kmstest_pipe_name(pipe))
-					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay / 4,
-							mode->vdisplay / 4, false, pipe, output);
+
+				igt_dynamic_f("pipe-%s-%s-downscale-with-pixel-format", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_pixel_format_pipe(&data, 0.25 * mode->hdisplay,
+							0.25 * mode->vdisplay, false, pipe, output);
 			}
 		}
 
-		igt_describe("Tests downscaling with pixel formats, scaling factor 2.");
-		igt_subtest_with_dynamic("downscale-with-pixel-format-factor-2") {
+		igt_describe("Tests downscaling with pixel formats for 0.5 scaling factor.");
+		igt_subtest_with_dynamic("downscale-with-pixel-format-factor-0-5") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
 				drmModeModeInfo *mode;
 
 				mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-downscale-with-pixel-format", kmstest_pipe_name(pipe))
-					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay / 2,
-							mode->vdisplay / 2, false, pipe, output);
+				igt_dynamic_f("pipe-%s-%s-downscale-with-pixel-format", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_pixel_format_pipe(&data, 0.5 * mode->hdisplay,
+							0.5 * mode->vdisplay, false, pipe, output);
 			}
 		}
+
 		igt_describe("Tests scaling with pixel formats, unity scaling.");
 		igt_subtest_with_dynamic("scaler-with-pixel-format-unity-scaling") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
@@ -630,7 +632,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 				mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay,
 							mode->vdisplay, true, pipe, output);
 			}
@@ -639,48 +641,49 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_describe("Tests upscaling with tiling rotation, from 20x20 fb.");
 		igt_subtest_with_dynamic("upscale-with-rotation-20x20") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-upscale-with-rotation", kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-%s-upscale-with-rotation", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_rotation_pipe(&data, 20, 20, true, pipe, output);
 		}
 
-		igt_describe("Tests upscaling with tiling rotation, scaling factor 4.");
-		igt_subtest_with_dynamic("upscale-with-rotation-factor-4") {
+		igt_describe("Tests upscaling with tiling rotation for 0.25 scaling factor.");
+		igt_subtest_with_dynamic("upscale-with-rotation-factor-0-25") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
 				drmModeModeInfo *mode;
 
 				mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-upscale-with-rotation", kmstest_pipe_name(pipe))
-					test_scaler_with_rotation_pipe(&data, mode->hdisplay / 4,
-							mode->vdisplay / 4, true, pipe, output);
+				igt_dynamic_f("pipe-%s-%s-upscale-with-rotation", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_rotation_pipe(&data, 0.25 * mode->hdisplay,
+							0.25 * mode->vdisplay, true, pipe, output);
 			}
 		}
 
-		igt_describe("Tests downscaling with tiling rotation, scaling factor 4.");
-		igt_subtest_with_dynamic("downscale-with-rotation-factor-4") {
+		igt_describe("Tests downscaling with tiling rotation for 0.25 scaling factor");
+		igt_subtest_with_dynamic("downscale-with-rotation-factor-0-25") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
 				drmModeModeInfo *mode;
 
 				mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-downscale-with-rotation", kmstest_pipe_name(pipe))
-					test_scaler_with_rotation_pipe(&data, mode->hdisplay / 4,
-							mode->vdisplay / 4, false, pipe, output);
+				igt_dynamic_f("pipe-%s-%s-downscale-with-rotation", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_rotation_pipe(&data, 0.25 * mode->hdisplay,
+							0.25 * mode->vdisplay, false, pipe, output);
 			}
 		}
 
-		igt_describe("Tests downscaling with tiling rotation, scaling factor 2.");
-		igt_subtest_with_dynamic("downscale-with-rotation-factor-2") {
+		igt_describe("Tests downscaling with tiling rotation for 0.5 scaling factor.");
+		igt_subtest_with_dynamic("downscale-with-rotation-factor-0-5") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
 				drmModeModeInfo *mode;
 
 				mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-downscale-with-rotation", kmstest_pipe_name(pipe))
-					test_scaler_with_rotation_pipe(&data, mode->hdisplay / 2,
-							mode->vdisplay / 2, false, pipe, output);
+				igt_dynamic_f("pipe-%s-%s-downscale-with-rotation", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_rotation_pipe(&data, 0.5 * mode->hdisplay,
+							0.5 * mode->vdisplay, false, pipe, output);
 			}
 		}
+
 		igt_describe("Tests scaling with tiling rotation, unity scaling.");
 		igt_subtest_with_dynamic("scaler-with-rotation-unity-scaling") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
@@ -688,7 +691,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 				mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-%s-scaler-with-rotation", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_rotation_pipe(&data, mode->hdisplay,
 							mode->vdisplay, true, pipe, output);
 			}
@@ -697,7 +700,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_describe("Tests scaling with clipping and clamping.");
 		igt_subtest_with_dynamic("scaler-with-clipping-clamping") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_clipping_clamping_scenario(&data, pipe, output);
 		}
 	}
-- 
2.25.1
