Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA93E10E982
 for <igt-dev@lists.freedesktop.org>; Mon, 23 May 2022 08:09:25 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 23 May 2022 13:39:32 +0530
Message-Id: <20220523080932.9326-2-swati2.sharma@intel.com>
In-Reply-To: <20220523080932.9326-1-swati2.sharma@intel.com>
References: <20220523080932.9326-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] tests/kms_plane_scaling: Add tests
 as list
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

Added subtests as a list. Also, renamed tests to
distinguish between plane vs planes tests.
Lastly, for clipping/clamping tests added new tests
as modifiers, pixel-formats and rotation.

v2: fixed indentation (JP)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_scaling.c | 633 ++++++++++++++++++--------------------
 1 file changed, 299 insertions(+), 334 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index a1a883b3..fc8250b5 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -42,66 +42,250 @@ typedef struct {
 	bool extended;
 } data_t;
 
+const struct {
+	const char * const describe;
+	const char * const name;
+	const double sf;
+	const bool is_upscale;
+} scaler_with_pixel_format_tests[] = {
+	{
+		"Tests upscaling with pixel formats, from 20x20 fb.",
+		"plane-upscale-with-pixel-format-20x20",
+		0.0,
+		true,
+	},
+	{
+		"Tests upscaling with pixel formats for 0.25 scaling factor.",
+		"plane-upscale-with-pixel-format-factor-0-25",
+		0.25,
+		true,
+	},
+	{
+		"Tests downscaling with pixel formats for 0.25 scaling factor.",
+		"plane-downscale-with-pixel-format-factor-0-25",
+		0.25,
+		false,
+	},
+	{
+		"Tests downscaling with pixel formats for 0.5 scaling factor.",
+		"plane-downscale-with-pixel-format-factor-0-5",
+		0.5,
+		false,
+	},
+	{
+		"Tests downscaling with pixel formats for 0.75 scaling factor.",
+		"plane-downscale-with-pixel-format-factor-0-75",
+		0.75,
+		false,
+	},
+	{
+		"Tests scaling with pixel formats, unity scaling.",
+		"plane-scaler-with-pixel-format-unity-scaling",
+		1.0,
+		true,
+	},
+};
+
+const struct {
+	const char * const describe;
+	const char * const name;
+	const double sf;
+	const bool is_upscale;
+} scaler_with_rotation_tests[] = {
+	{
+		"Tests upscaling with rotation, from 20x20 fb.",
+		"plane-upscale-with-rotation-20x20",
+		0.0,
+		true,
+	},
+	{
+		"Tests upscaling with rotation for 0.25 scaling factor.",
+		"plane-upscale-with-rotation-factor-0-25",
+		0.25,
+		true,
+	},
+	{
+		"Tests downscaling with rotation for 0.25 scaling factor.",
+		"plane-downscale-with-rotation-factor-0-25",
+		0.25,
+		false,
+	},
+	{
+		"Tests downscaling with rotation for 0.5 scaling factor.",
+		"plane-downscale-with-rotation-factor-0-5",
+		0.25,
+		false,
+	},
+	{
+		"Tests downscaling with rotation for 0.75 scaling factor.",
+		"plane-downscale-with-rotation-factor-0-75",
+		0.75,
+		false,
+	},
+	{
+		"Tests scaling with rotation, unity scaling.",
+		"plane-scaler-with-rotation-unity-scaling",
+		1.0,
+		true,
+	},
+};
+
+const struct {
+	const char * const describe;
+	const char * const name;
+	const double sf;
+	const bool is_upscale;
+} scaler_with_modifiers_tests[] = {
+	{
+		"Tests upscaling with modifiers, from 20x20 fb.",
+		"plane-upscale-with-modifiers-20x20",
+		0.0,
+		true,
+	},
+	{
+		"Tests upscaling with modifiers for 0.25 scaling factor.",
+		"plane-upscale-with-modifiers-factor-0-25",
+		0.25,
+		true,
+	},
+	{
+		"Tests downscaling with modifiers for 0.25 scaling factor.",
+		"plane-downscale-with-modifiers-factor-0-25",
+		0.25,
+		false,
+	},
+	{
+		"Tests downscaling with modifiers for 0.5 scaling factor.",
+		"plane-downscale-with-modifiers-factor-0-5",
+		0.5,
+		false,
+	},
+	{
+		"Tests downscaling with modifiers for 0.75 scaling factor.",
+		"plane-downscale-with-modifiers-factor-0-75",
+		0.75,
+		false,
+	},
+	{
+		"Tests scaling with modifiers, unity scaling.",
+		"plane-scaler-with-modifiers-unity-scaling",
+		1.0,
+		true,
+	},
+};
+
 const struct {
 	const char * const describe;
 	const char * const name;
 	const double sf_plane1;
 	const double sf_plane2;
-} upscale_downscale_tests[] = {
-		{
-			"Tests upscaling (20x20) and downscaling (scaling factor 0.25) of 2 planes.",
-			"planes-upscale-20x20-downscale-factor-0-25",
-			0.0,
-			0.25,
-		},
-		{
-			"Tests upscaling (20x20) and downscaling (scaling factor 0.5) of 2 planes.",
-			"planes-upscale-20x20-downscale-factor-0-5",
-			0.0,
-			0.5,
-		},
-		{
-			"Tests upscaling (20x20) and downscaling (scaling factor 0.75) of 2 planes.",
-			"planes-upscale-20x20-downscale-factor-0-75",
-			0.0,
-			0.75,
-		},
-		{
-			"Tests upscaling (scaling factor 0.25) and downscaling (scaling factor 0.25) of 2 planes.",
-			"planes-upscale-factor-0-25-downscale-factor-0-25",
-			0.25,
-			0.25,
-		},
-		{
-			"Tests upscaling (scaling factor 0.25) and downscaling (scaling factor 0.5) of 2 planes.",
-			"planes-upscale-factor-0-25-downscale-factor-0-5",
-			0.25,
-			0.5,
-		},
-		{
-			"Tests upscaling (scaling factor 0.25) and downscaling (scaling factor 0.75) of 2 planes.",
-			"planes-upscale-factor-0-25-downscale-factor-0-75",
-			0.25,
-			0.75,
-		},
-		{
-			"Tests scaling (unity) and downscaling (scaling factor 0.25) of 2 planes.",
-			"planes-unity-scaling-downscale-factor-0-25",
-			1.0,
-			0.25,
-		},
-		{
-			"Tests scaling (unity) and downscaling (scaling factor 0.5) of 2 planes.",
-			"planes-unity-scaling-downscale-factor-0-5",
-			1.0,
-			0.5,
-		},
-		{
-			"Tests scaling (unity) and downscaling (scaling factor 0.75) of 2 planes.",
-			"planes-unity-scaling-downscale-factor-0-75",
-			1.0,
-			0.75,
-		},
+	const enum scaler_combo_test_type test_type;
+} scaler_with_2_planes_tests[] = {
+	{
+		"Tests upscaling of 2 planes, from 20x20 fb.",
+		"planes-upscale-20x20",
+		0.0,
+		0.0,
+		TEST_PLANES_UPSCALE,
+	},
+	{
+		"Tests upscaling of 2 planes for 0.25 scaling factor.",
+		"planes-upscale-factor-0-25",
+		0.25,
+		0.25,
+		TEST_PLANES_UPSCALE,
+	},
+	{
+		"Tests scaling of 2 planes, unity scaling.",
+		"planes-scaler-unity-scaling",
+		1.0,
+		1.0,
+		TEST_PLANES_UPSCALE,
+	},
+	{
+		"Tests downscaling of 2 planes for 0.25 scaling factor.",
+		"planes-downscale-factor-0-25",
+		0.25,
+		0.25,
+		TEST_PLANES_DOWNSCALE,
+	},
+	{
+		"Tests downscaling of 2 planes for 0.5 scaling factor.",
+		"planes-downscale-factor-0-5",
+		0.5,
+		0.5,
+		TEST_PLANES_DOWNSCALE,
+	},
+	{
+		"Tests downscaling of 2 planes for 0.75 scaling factor.",
+		"planes-downscale-factor-0-75",
+		0.75,
+		0.75,
+		TEST_PLANES_DOWNSCALE,
+	},
+	{
+		"Tests upscaling (20x20) and downscaling (scaling factor 0.25) of 2 planes.",
+		"planes-upscale-20x20-downscale-factor-0-25",
+		0.0,
+		0.25,
+		TEST_PLANES_UPSCALE_DOWNSCALE,
+	},
+	{
+		"Tests upscaling (20x20) and downscaling (scaling factor 0.5) of 2 planes.",
+		"planes-upscale-20x20-downscale-factor-0-5",
+		0.0,
+		0.5,
+		TEST_PLANES_UPSCALE_DOWNSCALE,
+	},
+	{
+		"Tests upscaling (20x20) and downscaling (scaling factor 0.75) of 2 planes.",
+		"planes-upscale-20x20-downscale-factor-0-75",
+		0.0,
+		0.75,
+		TEST_PLANES_UPSCALE_DOWNSCALE,
+	},
+	{
+		"Tests upscaling (scaling factor 0.25) and downscaling (scaling factor 0.25) of 2 planes.",
+		"planes-upscale-factor-0-25-downscale-factor-0-25",
+		0.25,
+		0.25,
+		TEST_PLANES_UPSCALE_DOWNSCALE,
+	},
+	{
+		"Tests upscaling (scaling factor 0.25) and downscaling (scaling factor 0.5) of 2 planes.",
+		"planes-upscale-factor-0-25-downscale-factor-0-5",
+		0.25,
+		0.5,
+		TEST_PLANES_UPSCALE_DOWNSCALE,
+	},
+	{
+		"Tests upscaling (scaling factor 0.25) and downscaling (scaling factor 0.75) of 2 planes.",
+		"planes-upscale-factor-0-25-downscale-factor-0-75",
+		0.25,
+		0.75,
+		TEST_PLANES_UPSCALE_DOWNSCALE,
+	},
+	{
+		"Tests scaling (unity) and downscaling (scaling factor 0.25) of 2 planes.",
+		"planes-unity-scaling-downscale-factor-0-25",
+		1.0,
+		0.25,
+		TEST_PLANES_UPSCALE_DOWNSCALE,
+	},
+	{
+		"Tests scaling (unity) and downscaling (scaling factor 0.5) of 2 planes.",
+		"planes-unity-scaling-downscale-factor-0-5",
+		1.0,
+		0.5,
+		TEST_PLANES_UPSCALE_DOWNSCALE,
+	},
+	{
+		"Tests scaling (unity) and downscaling (scaling factor 0.75) of 2 planes.",
+		"planes-unity-scaling-downscale-factor-0-75",
+		1.0,
+		0.75,
+		TEST_PLANES_UPSCALE_DOWNSCALE,
+	},
 };
 
 static int get_width(drmModeModeInfo *mode, double scaling_factor)
@@ -674,333 +858,114 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_subtest_group {
 		igt_output_t *output;
 
-		igt_describe("Tests upscaling with pixel formats, from 20x20 fb.");
-		igt_subtest_with_dynamic("upscale-with-pixel-format-20x20") {
+		for (int index = 0; index < ARRAY_SIZE(scaler_with_pixel_format_tests); index++) {
+			igt_describe(scaler_with_pixel_format_tests[index].describe);
+			igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].name) {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-%s-upscale-with-pixel-format", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_pixel_format_pipe(&data, 20, 20, true, pipe, output);
-		}
-
-		igt_describe("Tests upscaling with pixel formats for 0.25 scaling factor.");
-		igt_subtest_with_dynamic("upscale-with-pixel-format-factor-0-25") {
-			for_each_pipe_with_single_output(&data.display, pipe, output) {
-				drmModeModeInfo *mode;
-
-				mode = igt_output_get_mode(output);
-
-				igt_dynamic_f("pipe-%s-%s-upscale-with-pixel-format", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_pixel_format_pipe(&data, 0.25 * mode->hdisplay,
-							0.25 * mode->vdisplay, true, pipe, output);
-			}
-		}
-
-		igt_describe("Tests downscaling with pixel formats for 0.25 scaling factor.");
-		igt_subtest_with_dynamic("downscale-with-pixel-format-factor-0-25") {
-			for_each_pipe_with_single_output(&data.display, pipe, output) {
-				drmModeModeInfo *mode;
-
-				mode = igt_output_get_mode(output);
-
-				igt_dynamic_f("pipe-%s-%s-downscale-with-pixel-format", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_pixel_format_pipe(&data, 0.25 * mode->hdisplay,
-							0.25 * mode->vdisplay, false, pipe, output);
-			}
-		}
-
-		igt_describe("Tests downscaling with pixel formats for 0.5 scaling factor.");
-		igt_subtest_with_dynamic("downscale-with-pixel-format-factor-0-5") {
-			for_each_pipe_with_single_output(&data.display, pipe, output) {
-				drmModeModeInfo *mode;
-
-				mode = igt_output_get_mode(output);
-
-				igt_dynamic_f("pipe-%s-%s-downscale-with-pixel-format", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_pixel_format_pipe(&data, 0.5 * mode->hdisplay,
-							0.5 * mode->vdisplay, false, pipe, output);
-			}
-		}
-
-		igt_describe("Tests downscaling with pixel formats for 0.75 scaling factor.");
-		igt_subtest_with_dynamic("downscale-with-pixel-format-factor-0-75") {
-			for_each_pipe_with_single_output(&data.display, pipe, output) {
-				drmModeModeInfo *mode;
-
-				mode = igt_output_get_mode(output);
-
-				igt_dynamic_f("pipe-%s-%s-downscale-with-pixel-format", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_pixel_format_pipe(&data, 0.75 * mode->hdisplay,
-							0.75 * mode->vdisplay, false, pipe, output);
-			}
-		}
-
-		igt_describe("Tests scaling with pixel formats, unity scaling.");
-		igt_subtest_with_dynamic("scaler-with-pixel-format-unity-scaling") {
-			for_each_pipe_with_single_output(&data.display, pipe, output) {
-				drmModeModeInfo *mode;
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+					drmModeModeInfo *mode;
 
-				mode = igt_output_get_mode(output);
+					mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay,
-							mode->vdisplay, true, pipe, output);
+					test_scaler_with_pixel_format_pipe(&data,
+							get_width(mode, scaler_with_pixel_format_tests[index].sf),
+							get_height(mode, scaler_with_pixel_format_tests[index].sf),
+							scaler_with_pixel_format_tests[index].is_upscale,
+							pipe, output);
+				}
 			}
 		}
 
-		igt_describe("Tests upscaling with rotation, from 20x20 fb.");
-		igt_subtest_with_dynamic("upscale-with-rotation-20x20") {
+		for (int index = 0; index < ARRAY_SIZE(scaler_with_rotation_tests); index++) {
+			igt_describe(scaler_with_rotation_tests[index].describe);
+			igt_subtest_with_dynamic(scaler_with_rotation_tests[index].name) {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-%s-upscale-with-rotation", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_rotation_pipe(&data, 20, 20, true, pipe, output);
-		}
-
-		igt_describe("Tests upscaling with rotation for 0.25 scaling factor.");
-		igt_subtest_with_dynamic("upscale-with-rotation-factor-0-25") {
-			for_each_pipe_with_single_output(&data.display, pipe, output) {
-				drmModeModeInfo *mode;
-
-				mode = igt_output_get_mode(output);
-
-				igt_dynamic_f("pipe-%s-%s-upscale-with-rotation", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_rotation_pipe(&data, 0.25 * mode->hdisplay,
-							0.25 * mode->vdisplay, true, pipe, output);
-			}
-		}
-
-		igt_describe("Tests downscaling with rotation for 0.25 scaling factor.");
-		igt_subtest_with_dynamic("downscale-with-rotation-factor-0-25") {
-			for_each_pipe_with_single_output(&data.display, pipe, output) {
-				drmModeModeInfo *mode;
-
-				mode = igt_output_get_mode(output);
-
-				igt_dynamic_f("pipe-%s-%s-downscale-with-rotation", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_rotation_pipe(&data, 0.25 * mode->hdisplay,
-							0.25 * mode->vdisplay, false, pipe, output);
-			}
-		}
-
-		igt_describe("Tests downscaling with rotation for 0.5 scaling factor.");
-		igt_subtest_with_dynamic("downscale-with-rotation-factor-0-5") {
-			for_each_pipe_with_single_output(&data.display, pipe, output) {
-				drmModeModeInfo *mode;
-
-				mode = igt_output_get_mode(output);
-
-				igt_dynamic_f("pipe-%s-%s-downscale-with-rotation", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_rotation_pipe(&data, 0.5 * mode->hdisplay,
-							0.5 * mode->vdisplay, false, pipe, output);
-			}
-		}
-
-		igt_describe("Tests downscaling with rotation for 0.75 scaling factor.");
-		igt_subtest_with_dynamic("downscale-with-rotation-factor-0-75") {
-			for_each_pipe_with_single_output(&data.display, pipe, output) {
-				drmModeModeInfo *mode;
-
-				mode = igt_output_get_mode(output);
-
-				igt_dynamic_f("pipe-%s-%s-downscale-with-rotation", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_rotation_pipe(&data, 0.75 * mode->hdisplay,
-							0.75 * mode->vdisplay, false, pipe, output);
-			}
-		}
-
-		igt_describe("Tests scaling with rotation, unity scaling.");
-		igt_subtest_with_dynamic("scaler-with-rotation-unity-scaling") {
-			for_each_pipe_with_single_output(&data.display, pipe, output) {
-				drmModeModeInfo *mode;
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+					drmModeModeInfo *mode;
 
-				mode = igt_output_get_mode(output);
+					mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-%s-scaler-with-rotation", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_rotation_pipe(&data, mode->hdisplay,
-							mode->vdisplay, true, pipe, output);
+					test_scaler_with_rotation_pipe(&data,
+							get_width(mode, scaler_with_rotation_tests[index].sf),
+							get_height(mode, scaler_with_rotation_tests[index].sf),
+							scaler_with_rotation_tests[index].is_upscale,
+							pipe, output);
+				}
 			}
 		}
 
-		igt_describe("Tests upscaling with modifiers, from 20x20 fb.");
-		igt_subtest_with_dynamic("upscale-with-modifier-20x20") {
+		for (int index = 0; index < ARRAY_SIZE(scaler_with_modifiers_tests); index++) {
+			igt_describe(scaler_with_modifiers_tests[index].describe);
+			igt_subtest_with_dynamic(scaler_with_modifiers_tests[index].name) {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-%s-upscale-with-modifier", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_modifier_pipe(&data, 20, 20, true, pipe, output);
-		}
-
-		igt_describe("Tests upscaling with modifiers for 0.25 scaling factor.");
-		igt_subtest_with_dynamic("upscale-with-modifier-factor-0-25") {
-			for_each_pipe_with_single_output(&data.display, pipe, output) {
-				drmModeModeInfo *mode;
-
-				mode = igt_output_get_mode(output);
-
-				igt_dynamic_f("pipe-%s-%s-upscale-with-modifier", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_modifier_pipe(&data, 0.25 * mode->hdisplay,
-							0.25 * mode->vdisplay, true, pipe, output);
-			}
-		}
-
-		igt_describe("Tests downscaling with modifiers for 0.25 scaling factor.");
-		igt_subtest_with_dynamic("downscale-with-modifier-factor-0-25") {
-			for_each_pipe_with_single_output(&data.display, pipe, output) {
-				drmModeModeInfo *mode;
-
-				mode = igt_output_get_mode(output);
-
-				igt_dynamic_f("pipe-%s-%s-downscale-with-modifier", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_modifier_pipe(&data, 0.25 * mode->hdisplay,
-							0.25 * mode->vdisplay, false, pipe, output);
-			}
-		}
-
-		igt_describe("Tests downscaling with modifiers for 0.5 scaling factor.");
-		igt_subtest_with_dynamic("downscale-with-modifier-factor-0-5") {
-			for_each_pipe_with_single_output(&data.display, pipe, output) {
-				drmModeModeInfo *mode;
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+					drmModeModeInfo *mode;
 
-				mode = igt_output_get_mode(output);
+					mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-%s-downscale-with-modifier", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_modifier_pipe(&data, 0.5 * mode->hdisplay,
-							0.5 * mode->vdisplay, false, pipe, output);
+					test_scaler_with_modifier_pipe(&data,
+							get_width(mode, scaler_with_rotation_tests[index].sf),
+							get_height(mode, scaler_with_rotation_tests[index].sf),
+							scaler_with_rotation_tests[index].is_upscale,
+							pipe, output);
+				}
 			}
 		}
 
-		igt_describe("Tests downscaling with modifiers for 0.75 scaling factor.");
-		igt_subtest_with_dynamic("downscale-with-modifier-factor-0-75") {
+		igt_describe("Tests scaling with clipping and clamping, pixel formats.");
+		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-pixel-formats") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
 				drmModeModeInfo *mode;
 
 				mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-%s-downscale-with-modifier", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_modifier_pipe(&data, 0.75 * mode->hdisplay,
-							0.75 * mode->vdisplay, false, pipe, output);
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay + 100,
+							mode->vdisplay + 100, false, pipe, output);
 			}
 		}
 
-		igt_describe("Tests scaling with modifiers, unity scaling.");
-		igt_subtest_with_dynamic("scaler-with-modifier-unity-scaling") {
+		igt_describe("Tests scaling with clipping and clamping, rotation.");
+		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-rotation") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
 				drmModeModeInfo *mode;
 
 				mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-%s-scaler-with-modifier", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_modifier_pipe(&data, mode->hdisplay,
-							mode->vdisplay, true, pipe, output);
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_rotation_pipe(&data, mode->hdisplay + 100,
+							mode->vdisplay + 100, false, pipe, output);
 			}
 		}
 
-		igt_describe("Tests scaling with clipping and clamping.");
-		igt_subtest_with_dynamic("scaler-with-clipping-clamping") {
+		igt_describe("Tests scaling with clipping and clamping, modifiers.");
+		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-modifiers") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
 				drmModeModeInfo *mode;
 
 				mode = igt_output_get_mode(output);
 
-				igt_dynamic_f("pipe-%s-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay + 100,
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_modifier_pipe(&data, mode->hdisplay + 100,
 							mode->vdisplay + 100, false, pipe, output);
 			}
 		}
 
-		igt_describe("Tests upscaling of 2 planes, from 20x20 fb.");
-		igt_subtest_with_dynamic("planes-upscale-20x20") {
-			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-%s-planes-upscale", kmstest_pipe_name(pipe), igt_output_name(output))
-					test_planes_scaling_combo(&data, 20, 20, 20, 20,
-							pipe, output, TEST_PLANES_UPSCALE);
-		}
-
-		igt_describe("Tests upscaling of 2 planes for 0.25 scaling factor.");
-		igt_subtest_with_dynamic("planes-upscale-factor-0-25") {
-			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-%s-planes-upscale", kmstest_pipe_name(pipe), igt_output_name(output)) {
-					drmModeModeInfo *mode;
-
-					mode = igt_output_get_mode(output);
-
-					test_planes_scaling_combo(&data,
-							0.25 * mode->hdisplay, 0.25 * mode->vdisplay,
-							0.25 * mode->hdisplay, 0.25 * mode->vdisplay,
-							pipe, output, TEST_PLANES_UPSCALE);
-				}
-		}
-
-		igt_describe("Tests scaling of 2 planes, unity scaling.");
-		igt_subtest_with_dynamic("planes-scaling-unity-scaling") {
-			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-%s-planes-unity-scaling", kmstest_pipe_name(pipe), igt_output_name(output)) {
-					drmModeModeInfo *mode;
-
-					mode = igt_output_get_mode(output);
-
-					test_planes_scaling_combo(&data,
-							mode->hdisplay, mode->vdisplay,
-							mode->hdisplay, mode->vdisplay,
-							pipe, output, TEST_PLANES_UPSCALE);
-				}
-		}
-
-		igt_describe("Tests downscaling of 2 planes for 0.25 scaling factor.");
-		igt_subtest_with_dynamic("planes-downscale-factor-0-25") {
-			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-%s-planes-downscale", kmstest_pipe_name(pipe), igt_output_name(output)) {
-					drmModeModeInfo *mode;
-
-					mode = igt_output_get_mode(output);
-
-					test_planes_scaling_combo(&data,
-							0.25 * mode->hdisplay, 0.25 * mode->vdisplay,
-							0.25 * mode->hdisplay, 0.25 * mode->vdisplay,
-							pipe, output, TEST_PLANES_DOWNSCALE);
-				}
-		}
-
-		igt_describe("Tests downscaling of 2 planes for 0.5 scaling factor.");
-		igt_subtest_with_dynamic("planes-downscale-factor-0-5") {
-			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-%s-planes-downscale", kmstest_pipe_name(pipe), igt_output_name(output)) {
-					drmModeModeInfo *mode;
-
-					mode = igt_output_get_mode(output);
-
-					test_planes_scaling_combo(&data,
-							0.5 * mode->hdisplay, 0.5 * mode->vdisplay,
-							0.5 * mode->hdisplay, 0.5 * mode->vdisplay,
-							pipe, output, TEST_PLANES_DOWNSCALE);
-				}
-		}
-
-		igt_describe("Tests downscaling of 2 planes for 0.75 scaling factor.");
-		igt_subtest_with_dynamic("planes-downscale-factor-0-75") {
-			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-%s-planes-downscale", kmstest_pipe_name(pipe), igt_output_name(output)) {
-					drmModeModeInfo *mode;
-
-					mode = igt_output_get_mode(output);
-
-					test_planes_scaling_combo(&data,
-							0.75 * mode->hdisplay, 0.75 * mode->vdisplay,
-							0.75 * mode->hdisplay, 0.75 * mode->vdisplay,
-							pipe, output, TEST_PLANES_DOWNSCALE);
-				}
-		}
-
-		for (int index = 0; index < ARRAY_SIZE(upscale_downscale_tests); index++) {
-			igt_describe(upscale_downscale_tests[index].describe);
-			igt_subtest_with_dynamic(upscale_downscale_tests[index].name) {
+		for (int index = 0; index < ARRAY_SIZE(scaler_with_2_planes_tests); index++) {
+			igt_describe(scaler_with_2_planes_tests[index].describe);
+			igt_subtest_with_dynamic(scaler_with_2_planes_tests[index].name) {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-%s-planes-upscale-downscale", kmstest_pipe_name(pipe), igt_output_name(output)) {
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 					drmModeModeInfo *mode;
 
 					mode = igt_output_get_mode(output);
 
 					test_planes_scaling_combo(&data,
-							get_width(mode, upscale_downscale_tests[index].sf_plane1),
-							get_height(mode, upscale_downscale_tests[index].sf_plane1),
-							get_width(mode, upscale_downscale_tests[index].sf_plane2),
-							get_height(mode,upscale_downscale_tests[index].sf_plane2),
-							pipe, output, TEST_PLANES_UPSCALE_DOWNSCALE);
+							get_width(mode, scaler_with_2_planes_tests[index].sf_plane1),
+							get_height(mode, scaler_with_2_planes_tests[index].sf_plane1),
+							get_width(mode, scaler_with_2_planes_tests[index].sf_plane2),
+							get_height(mode, scaler_with_2_planes_tests[index].sf_plane2),
+							pipe, output, scaler_with_2_planes_tests[index].test_type);
 				}
 			}
 		}
@@ -1014,7 +979,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
-	igt_describe("Tests scaling with multi-pipe scenario.");
+	igt_describe("Tests scaling with multi-pipe.");
 	igt_subtest_f("2x-scaler-multi-pipe")
 		test_scaler_with_multi_pipe_plane(&data);
 
-- 
2.25.1
