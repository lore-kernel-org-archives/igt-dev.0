Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF4910E156
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jan 2023 13:42:46 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Jan 2023 19:10:44 +0530
Message-Id: <20230109134046.85340-5-nidhi1.gupta@intel.com>
In-Reply-To: <20230109134046.85340-1-nidhi1.gupta@intel.com>
References: <20230109134046.85340-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/6] tests/kms_plane_scaling: Restrict the
 execution of subtest to single pipe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

To reduce the overall execution time of the test, now
all the subtests will be executed on single pipe instead
of all the pipes.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_plane_scaling.c | 113 ++++++++++++++++++++++----------------
 1 file changed, 67 insertions(+), 46 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 887a55e6..755b4684 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -860,17 +860,20 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_pixel_format_tests); index++) {
 			igt_describe(scaler_with_pixel_format_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].name) {
-			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-					drmModeModeInfo *mode;
-
-					mode = igt_output_get_mode(output);
-
-					test_scaler_with_pixel_format_pipe(&data,
-							get_width(mode, scaler_with_pixel_format_tests[index].sf),
-							get_height(mode, scaler_with_pixel_format_tests[index].sf),
-							scaler_with_pixel_format_tests[index].is_upscale,
-							pipe, output);
+				for_each_pipe_with_single_output(&data.display, pipe, output) {
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+						drmModeModeInfo *mode;
+
+						mode = igt_output_get_mode(output);
+
+						test_scaler_with_pixel_format_pipe(&data,
+								get_width(mode, scaler_with_pixel_format_tests[index].sf),
+								get_height(mode, scaler_with_pixel_format_tests[index].sf),
+								scaler_with_pixel_format_tests[index].is_upscale,
+								pipe, output);
+					}
+					/*Restrict the execution of subtest to single pipe*/
+					break;
 				}
 			}
 		}
@@ -878,17 +881,20 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_rotation_tests); index++) {
 			igt_describe(scaler_with_rotation_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_rotation_tests[index].name) {
-			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-					drmModeModeInfo *mode;
-
-					mode = igt_output_get_mode(output);
-
-					test_scaler_with_rotation_pipe(&data,
-							get_width(mode, scaler_with_rotation_tests[index].sf),
-							get_height(mode, scaler_with_rotation_tests[index].sf),
-							scaler_with_rotation_tests[index].is_upscale,
-							pipe, output);
+				for_each_pipe_with_single_output(&data.display, pipe, output) {
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+						drmModeModeInfo *mode;
+
+						mode = igt_output_get_mode(output);
+
+						test_scaler_with_rotation_pipe(&data,
+								get_width(mode, scaler_with_rotation_tests[index].sf),
+								get_height(mode, scaler_with_rotation_tests[index].sf),
+								scaler_with_rotation_tests[index].is_upscale,
+								pipe, output);
+					}
+					/*Restrict the execution of subtest to single pipe*/
+					break;
 				}
 			}
 		}
@@ -896,17 +902,20 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_modifiers_tests); index++) {
 			igt_describe(scaler_with_modifiers_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_modifiers_tests[index].name) {
-			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-					drmModeModeInfo *mode;
-
-					mode = igt_output_get_mode(output);
-
-					test_scaler_with_modifier_pipe(&data,
-							get_width(mode, scaler_with_rotation_tests[index].sf),
-							get_height(mode, scaler_with_rotation_tests[index].sf),
-							scaler_with_rotation_tests[index].is_upscale,
-							pipe, output);
+				for_each_pipe_with_single_output(&data.display, pipe, output) {
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+						drmModeModeInfo *mode;
+
+						mode = igt_output_get_mode(output);
+
+						test_scaler_with_modifier_pipe(&data,
+								get_width(mode, scaler_with_rotation_tests[index].sf),
+								get_height(mode, scaler_with_rotation_tests[index].sf),
+								scaler_with_rotation_tests[index].is_upscale,
+								pipe, output);
+					}
+					/*Restrict the execution of subtest to single pipe*/
+					break;
 				}
 			}
 		}
@@ -921,6 +930,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay + 100,
 							mode->vdisplay + 100, false, pipe, output);
+				/*Restrict the execution of subtest to single pipe*/
+				break;
 			}
 		}
 
@@ -934,6 +945,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_rotation_pipe(&data, mode->hdisplay + 100,
 							mode->vdisplay + 100, false, pipe, output);
+				/*Restrict the execution of subtest to single pipe*/
+				break;
 			}
 		}
 
@@ -947,34 +960,42 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_modifier_pipe(&data, mode->hdisplay + 100,
 							mode->vdisplay + 100, false, pipe, output);
+				/*Restrict the execution of subtest to single pipe*/
+				break;
 			}
 		}
 
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_2_planes_tests); index++) {
 			igt_describe(scaler_with_2_planes_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_2_planes_tests[index].name) {
-			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-					drmModeModeInfo *mode;
-
-					mode = igt_output_get_mode(output);
-
-					test_planes_scaling_combo(&data,
-							get_width(mode, scaler_with_2_planes_tests[index].sf_plane1),
-							get_height(mode, scaler_with_2_planes_tests[index].sf_plane1),
-							get_width(mode, scaler_with_2_planes_tests[index].sf_plane2),
-							get_height(mode, scaler_with_2_planes_tests[index].sf_plane2),
-							pipe, output, scaler_with_2_planes_tests[index].test_type);
+				for_each_pipe_with_single_output(&data.display, pipe, output) {
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+						drmModeModeInfo *mode;
+
+						mode = igt_output_get_mode(output);
+
+						test_planes_scaling_combo(&data,
+								get_width(mode, scaler_with_2_planes_tests[index].sf_plane1),
+								get_height(mode, scaler_with_2_planes_tests[index].sf_plane1),
+								get_width(mode, scaler_with_2_planes_tests[index].sf_plane2),
+								get_height(mode, scaler_with_2_planes_tests[index].sf_plane2),
+								pipe, output, scaler_with_2_planes_tests[index].test_type);
+					}
+					/*Restrict the execution of subtest to single pipe*/
+					break;
 				}
 			}
 		}
 
 		igt_describe("Negative test for number of scalers per pipe.");
 		igt_subtest_with_dynamic("invalid-num-scalers") {
-			for_each_pipe_with_valid_output(&data.display, pipe, output)
+			for_each_pipe_with_valid_output(&data.display, pipe, output) {
 				igt_dynamic_f("pipe-%s-%s-invalid-num-scalers",
 					       kmstest_pipe_name(pipe), igt_output_name(output))
 					test_invalid_num_scalers(&data, pipe, output);
+				/*Restrict the execution of subtest to single pipe*/
+				break;
+			}
 		}
 	}
 
-- 
2.25.1
