Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA56610E6A6
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Feb 2022 17:12:15 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 28 Feb 2022 22:53:13 +0530
Message-Id: <20220228172318.851-4-swati2.sharma@intel.com>
In-Reply-To: <20220228172318.851-1-swati2.sharma@intel.com>
References: <20220228172318.851-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v9 3/8] tests/kms_plane_scaling: Minor changes with
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
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
---
 tests/kms_plane_scaling.c | 70 +++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 3f73e938..ddcefdcc 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -438,46 +438,46 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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
 
@@ -488,7 +488,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 				mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay,
 							mode->vdisplay, true, pipe, output);
 			}
@@ -497,46 +497,46 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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
+		igt_describe("Tests downscaling with tiling rotation for 0.25 scaling factor.");
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
 
@@ -547,7 +547,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 				mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-%s-scaler-with-rotation", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_rotation_pipe(&data, mode->hdisplay,
 							mode->vdisplay, true, pipe, output);
 			}
@@ -560,7 +560,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 				mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay + 100,
 							mode->vdisplay + 100, false, pipe, output);
 			}
-- 
2.25.1
