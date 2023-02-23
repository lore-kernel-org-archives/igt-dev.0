Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594CD89E33
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 15:15:46 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Feb 2023 20:39:53 +0530
Message-Id: <20230223151018.2565040-27-bhanuprakash.modem@intel.com>
In-Reply-To: <20230223151018.2565040-1-bhanuprakash.modem@intel.com>
References: <20230223151018.2565040-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v8 26/51] tests/kms_plane_scaling: Add support for
 Bigjoiner
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

As many 2x tests are currently running on Pipe-A & B only, those
tests will always SKIP if there is any 8K supported panel in the
config. Instead of Skipping the test, add some intelligence to
the subtest to identify the valid pipe/output combo to execute
the subtest.

V2: - Use updated helper name

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 218 +++++++++++++++++++++++++-------------
 1 file changed, 145 insertions(+), 73 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 74554915f..782318206 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -611,30 +611,45 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height,
 	}
 }
 
-static void find_connected_pipe(igt_display_t *display, bool second, enum pipe *pipe, igt_output_t **output)
+static enum pipe
+find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 {
-	enum pipe first = PIPE_NONE;
-	igt_output_t *first_output = NULL;
+	enum pipe pipe;
+	bool first_output = false;
 	bool found = false;
 
-	for_each_pipe_with_valid_output(display, *pipe, *output) {
-		if (first == *pipe || *output == first_output)
-			continue;
+	igt_display_reset(display);
 
-		if (second) {
-			first = *pipe;
-			first_output = *output;
-			second = false;
-			continue;
-		}
+	for_each_pipe(display, pipe) {
+		for_each_valid_output_on_pipe(display, pipe, *output) {
+			if((*output)->pending_pipe != PIPE_NONE)
+				continue;
 
-		return;
+			igt_output_set_pipe(*output, pipe);
+			if (i915_pipe_output_combo_valid(display)) {
+				found = true;
+
+				if (second) {
+					first_output = true;
+					second = false;
+					found = false;
+				}
+				break;
+			}
+			igt_output_set_pipe(*output, PIPE_NONE);
+		}
+		if (found)
+			break;
 	}
 
+	igt_display_reset(display);
+
 	if (first_output)
 		igt_require_f(found, "No second valid output found\n");
 	else
 		igt_require_f(found, "No valid outputs found\n");
+
+	return pipe;
 }
 
 static void
@@ -821,13 +836,16 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	enum pipe pipe1, pipe2;
 	int ret1, ret2;
 
-	cleanup_crtc(d);
-
-	find_connected_pipe(display, false, &pipe1, &output1);
-	find_connected_pipe(display, true, &pipe2, &output2);
+	cleanup_fbs(d);
 
+	pipe1 = find_connected_pipe(display, false, &output1);
+	pipe2 = find_connected_pipe(display, true, &output2);
 	igt_skip_on(!output1 || !output2);
 
+	igt_info("Using (pipe %s + %s) and (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe1), igt_output_name(output1),
+		 kmstest_pipe_name(pipe2), igt_output_name(output2));
+
 	igt_output_set_pipe(output1, pipe1);
 	igt_output_set_pipe(output2, pipe2);
 
@@ -963,6 +981,22 @@ static void invalid_parameter_tests(data_t *d)
 	}
 }
 
+static bool
+pipe_output_combo_valid(igt_display_t *display,
+			enum pipe pipe, igt_output_t *output)
+{
+	bool ret = true;
+
+	igt_display_reset(display);
+
+	igt_output_set_pipe(output, pipe);
+	if (!i915_pipe_output_combo_valid(display))
+		ret = false;
+	igt_output_set_pipe(output, PIPE_NONE);
+
+	return ret;
+}
+
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -1004,17 +1038,22 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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
+				for_each_pipe(&data.display, pipe) {
+					for_each_valid_output_on_pipe(&data.display, pipe, output) {
+						if (!pipe_output_combo_valid(&data.display, pipe, output))
+							continue;
+
+						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+							drmModeModeInfo *mode = igt_output_get_mode(output);
+
+							test_scaler_with_pixel_format_pipe(&data,
+								get_width(mode, scaler_with_pixel_format_tests[index].sf),
+								get_height(mode, scaler_with_pixel_format_tests[index].sf),
+								scaler_with_pixel_format_tests[index].is_upscale,
+								pipe, output);
+						}
+						break;
+					}
 				}
 			}
 		}
@@ -1022,17 +1061,22 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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
+				for_each_pipe(&data.display, pipe) {
+					for_each_valid_output_on_pipe(&data.display, pipe, output) {
+						if (!pipe_output_combo_valid(&data.display, pipe, output))
+							continue;
+
+						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+							drmModeModeInfo *mode = igt_output_get_mode(output);
+
+							test_scaler_with_rotation_pipe(&data,
+								get_width(mode, scaler_with_rotation_tests[index].sf),
+								get_height(mode, scaler_with_rotation_tests[index].sf),
+								scaler_with_rotation_tests[index].is_upscale,
+								pipe, output);
+						}
+						break;
+					}
 				}
 			}
 		}
@@ -1040,85 +1084,113 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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
+				for_each_pipe(&data.display, pipe) {
+					for_each_valid_output_on_pipe(&data.display, pipe, output) {
+						if (!pipe_output_combo_valid(&data.display, pipe, output))
+							continue;
+
+						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+							drmModeModeInfo *mode = igt_output_get_mode(output);
+
+							test_scaler_with_modifier_pipe(&data,
+								get_width(mode, scaler_with_rotation_tests[index].sf),
+								get_height(mode, scaler_with_rotation_tests[index].sf),
+								scaler_with_rotation_tests[index].is_upscale,
+								pipe, output);
+						}
+						break;
+					}
 				}
 			}
 		}
 
 		igt_describe("Tests scaling with clipping and clamping, pixel formats.");
 		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-pixel-formats") {
-			for_each_pipe_with_single_output(&data.display, pipe, output) {
-				drmModeModeInfo *mode;
+			for_each_pipe(&data.display, pipe) {
+				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					if (!pipe_output_combo_valid(&data.display, pipe, output))
+						continue;
 
-				mode = igt_output_get_mode(output);
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+						drmModeModeInfo *mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay + 100,
+						test_scaler_with_pixel_format_pipe(&data, mode->hdisplay + 100,
 							mode->vdisplay + 100, false, pipe, output);
+					}
+					break;
+				}
 			}
 		}
 
 		igt_describe("Tests scaling with clipping and clamping, rotation.");
 		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-rotation") {
-			for_each_pipe_with_single_output(&data.display, pipe, output) {
-				drmModeModeInfo *mode;
+			for_each_pipe(&data.display, pipe) {
+				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					if (!pipe_output_combo_valid(&data.display, pipe, output))
+						continue;
 
-				mode = igt_output_get_mode(output);
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+						drmModeModeInfo *mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_rotation_pipe(&data, mode->hdisplay + 100,
+						test_scaler_with_rotation_pipe(&data, mode->hdisplay + 100,
 							mode->vdisplay + 100, false, pipe, output);
+					}
+					break;
+				}
 			}
 		}
 
 		igt_describe("Tests scaling with clipping and clamping, modifiers.");
 		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-modifiers") {
-			for_each_pipe_with_single_output(&data.display, pipe, output) {
-				drmModeModeInfo *mode;
-
-				mode = igt_output_get_mode(output);
-
-				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_modifier_pipe(&data, mode->hdisplay + 100,
+			for_each_pipe(&data.display, pipe) {
+				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					if (!pipe_output_combo_valid(&data.display, pipe, output))
+						continue;
+
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+						drmModeModeInfo *mode = igt_output_get_mode(output);
+						test_scaler_with_modifier_pipe(&data, mode->hdisplay + 100,
 							mode->vdisplay + 100, false, pipe, output);
+					}
+					break;
+				}
 			}
 		}
 
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_2_planes_tests); index++) {
 			igt_describe(scaler_with_2_planes_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_2_planes_tests[index].name) {
-			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-					drmModeModeInfo *mode;
+			for_each_pipe(&data.display, pipe) {
+				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					if (!pipe_output_combo_valid(&data.display, pipe, output))
+						continue;
 
-					mode = igt_output_get_mode(output);
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+						drmModeModeInfo *mode = igt_output_get_mode(output);
 
-					test_planes_scaling_combo(&data,
+						test_planes_scaling_combo(&data,
 							get_width(mode, scaler_with_2_planes_tests[index].sf_plane1),
 							get_height(mode, scaler_with_2_planes_tests[index].sf_plane1),
 							get_width(mode, scaler_with_2_planes_tests[index].sf_plane2),
 							get_height(mode, scaler_with_2_planes_tests[index].sf_plane2),
 							pipe, output, scaler_with_2_planes_tests[index].test_type);
+					}
+					break;
 				}
 			}
+			}
 		}
 
 		igt_describe("Negative test for number of scalers per pipe.");
 		igt_subtest_with_dynamic("invalid-num-scalers") {
-			for_each_pipe_with_valid_output(&data.display, pipe, output)
+			for_each_pipe_with_valid_output(&data.display, pipe, output) {
+				if (!pipe_output_combo_valid(&data.display, pipe, output))
+					continue;
+
 				igt_dynamic_f("pipe-%s-%s-invalid-num-scalers",
 					       kmstest_pipe_name(pipe), igt_output_name(output))
 					test_invalid_num_scalers(&data, pipe, output);
+			}
 		}
 	}
 
-- 
2.39.1
