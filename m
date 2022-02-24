Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9088910F69B
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Feb 2022 09:58:17 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Feb 2022 15:42:18 +0530
Message-Id: <20220224101224.12319-3-swati2.sharma@intel.com>
In-Reply-To: <20220224101224.12319-1-swati2.sharma@intel.com>
References: <20220224101224.12319-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v6 2/8] tests/kms_plane_scaling: Add output name in
 dynamic subtests
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index ac39d37b..295f71c2 100644
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
@@ -582,7 +582,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_describe("Tests upscaling with pixel formats, from 20x20 fb.");
 		igt_subtest_with_dynamic("upscale-with-pixel-format-20x20") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-upscale-with-pixel-format", kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-%s-upscale-with-pixel-format", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_pixel_format_pipe(&data, 20, 20, true, pipe, output);
 		}
 
@@ -593,7 +593,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 				mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-upscale-with-pixel-format", kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-%s-upscale-with-pixel-format", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay / 4,
 							mode->vdisplay / 4, true, pipe, output);
 			}
@@ -605,7 +605,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				drmModeModeInfo *mode;
 
 				mode = igt_output_get_mode(output);
-				igt_dynamic_f("pipe-%s-downscale-with-pixel-format", kmstest_pipe_name(pipe))
+
+				igt_dynamic_f("pipe-%s-%s-downscale-with-pixel-format", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay / 4,
 							mode->vdisplay / 4, false, pipe, output);
 			}
@@ -618,11 +619,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 				mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-downscale-with-pixel-format", kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-%s-downscale-with-pixel-format", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay / 2,
 							mode->vdisplay / 2, false, pipe, output);
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
@@ -639,7 +641,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_describe("Tests upscaling with tiling rotation, from 20x20 fb.");
 		igt_subtest_with_dynamic("upscale-with-rotation-20x20") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-upscale-with-rotation", kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-%s-upscale-with-rotation", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_rotation_pipe(&data, 20, 20, true, pipe, output);
 		}
 
@@ -650,7 +652,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 				mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-upscale-with-rotation", kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-%s-upscale-with-rotation", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_rotation_pipe(&data, mode->hdisplay / 4,
 							mode->vdisplay / 4, true, pipe, output);
 			}
@@ -663,7 +665,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 				mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-downscale-with-rotation", kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-%s-downscale-with-rotation", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_rotation_pipe(&data, mode->hdisplay / 4,
 							mode->vdisplay / 4, false, pipe, output);
 			}
@@ -676,11 +678,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 				mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-downscale-with-rotation", kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-%s-downscale-with-rotation", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_rotation_pipe(&data, mode->hdisplay / 2,
 							mode->vdisplay / 2, false, pipe, output);
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
