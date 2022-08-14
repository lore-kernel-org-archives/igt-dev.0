Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8652BF67
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:39 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:44 +0530
Message-Id: <20220814180908.2553394-28-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 27/51] tests/kms_plane_scaling: Add support for
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_plane_scaling.c | 217 +++++++++++++++++++++++++-------------
 1 file changed, 144 insertions(+), 73 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index fc8250b5..2ab7a80f 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -546,30 +546,45 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height,
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
+			if (igt_test_constraint(display)) {
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
@@ -749,13 +764,16 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
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
 
@@ -820,6 +838,21 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	igt_assert_eq(ret1 && ret2, 0);
 }
 
+static bool
+is_valid_combo(igt_display_t *display, enum pipe pipe, igt_output_t *output)
+{
+	bool ret = true;
+
+	igt_display_reset(display);
+
+	igt_output_set_pipe(output, pipe);
+	if (!igt_test_constraint(display))
+		ret = false;
+	igt_output_set_pipe(output, PIPE_NONE);
+
+	return ret;
+}
+
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -861,17 +894,22 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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
+						if (!is_valid_combo(&data.display, pipe, output))
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
@@ -879,17 +917,22 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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
+						if (!is_valid_combo(&data.display, pipe, output))
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
@@ -897,85 +940,113 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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
+						if (!is_valid_combo(&data.display, pipe, output))
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
+					if (!is_valid_combo(&data.display, pipe, output))
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
+					if (!is_valid_combo(&data.display, pipe, output))
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
+					if (!is_valid_combo(&data.display, pipe, output))
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
+					if (!is_valid_combo(&data.display, pipe, output))
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
+				if (!is_valid_combo(&data.display, pipe, output))
+					continue;
+
 				igt_dynamic_f("pipe-%s-%s-invalid-num-scalers",
 					       kmstest_pipe_name(pipe), igt_output_name(output))
 					test_invalid_num_scalers(&data, pipe, output);
+			}
 		}
 	}
 
-- 
2.35.1
