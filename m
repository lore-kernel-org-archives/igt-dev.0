Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9CA10E864
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Sep 2022 06:46:56 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 21 Sep 2022 11:49:43 +0530
Message-Id: <20220921061943.23329-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_plane_alpha_blend: Convert
 test to dynamic
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

Covert the existing subtests to dynamic subtests at pipe/output level.

v2: -Don't skip the test in pipe_check() function.
    -Use for_each_pipe_with_single_output() instead of getting output
     separately.
    -Move igt_require before dynamic subtests.
    -Call prepare_crtc once per pipe.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_plane_alpha_blend.c | 180 ++++++++++++++++++++++------------
 1 file changed, 118 insertions(+), 62 deletions(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index bd064d1e..4daf08a4 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -466,15 +466,12 @@ static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t
 	igt_pipe_crc_stop(data->pipe_crc);
 }
 
-static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, bool blend,
-				    bool must_multiply,
+static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *output,
+				    bool blend, bool must_multiply,
 				    void(*test)(data_t *, enum pipe, igt_plane_t *))
 {
 	igt_display_t *display = &data->display;
-	igt_output_t *output = igt_get_single_output_for_pipe(display, pipe);
 	igt_plane_t *plane;
-	bool found = false;
-	bool multiply = false;
 
 	for_each_plane_on_pipe(display, pipe, plane) {
 		if (!igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
@@ -483,15 +480,11 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, bool blend,
 		if (blend && !igt_plane_has_prop(plane, IGT_PLANE_PIXEL_BLEND_MODE))
 			continue;
 
-		prepare_crtc(data, output, pipe);
-
 		/* reset plane alpha properties between each plane */
 		reset_alpha(display, pipe);
 
-		found = true;
 		if (must_multiply && !has_multiplied_alpha(data, plane))
 			continue;
-		multiply = true;
 
 		igt_info("Testing plane %u\n", plane->index);
 		test(data, pipe, plane);
@@ -500,74 +493,139 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, bool blend,
 
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(display, COMMIT_ATOMIC);
-
-	igt_require_f(found, "No planes with %s property found\n",
-		      blend ? "pixel blending mode" : "alpha");
-	igt_require_f(multiply, "Multiplied (plane x pixel) alpha not available\n");
 }
 
-static void run_subtests(data_t *data, enum pipe pipe)
+static const struct {
+	const char *name;
+	void (*test)(data_t *, enum pipe, igt_plane_t *);
+	bool blend;
+	bool must_multiply;
+	const char *desc;
+} subtests[] = {
+	{ .name = "alpha-basic",
+	  .test = basic_alpha,
+	  .blend = false,
+	  .must_multiply = true,
+	  .desc = "Tests basic plane alpha properties.",
+	},
+	{ .name = "alpha-7efc",
+	  .test = alpha_7efc,
+	  .blend = false,
+	  .must_multiply = true,
+	  .desc = "Uses alpha values 0x7e and 0xfc to validate fg.alpha and "
+		  "plane_alpha are swappable on pre-multiplied blend mode.",
+	},
+	{ .name = "coverage-7efc",
+	  .test = coverage_7efc,
+	  .blend = true,
+	  .must_multiply = true,
+	  .desc = "Uses alpha values 0x7e and 0xfc to validate fg.alpha and "
+		  "plane_alpha are swappable on coverage blend mode.",
+	},
+	{ .name = "coverage-vs-premult-vs-constant",
+	  .test = coverage_premult_constant,
+	  .blend = true,
+	  .must_multiply = false,
+	  .desc = "Tests pipe coverage blending properties.",
+	},
+	{ .name = "alpha-transparent-fb",
+	  .test = argb_transparent,
+	  .blend = false,
+	  .must_multiply = false,
+	  .desc = "Tests the alpha property with transparent fb.",
+	},
+	{ .name = "alpha-opaque-fb",
+	  .test = argb_opaque,
+	  .blend = false,
+	  .must_multiply = false,
+	  .desc = "Tests alpha properties with opaque fb.",
+	},
+	{ .name = "constant-alpha-min",
+	  .test = constant_alpha_min,
+	  .blend = true,
+	  .must_multiply = false,
+	  .desc = "Tests plane alpha and blending properties with minimum alpha value.",
+	},
+	{ .name = "constant-alpha-mid",
+	  .test = constant_alpha_mid,
+	  .blend = true,
+	  .must_multiply = false,
+	  .desc = "Tests plane alpha and blending properties with medium alpha value.",
+	},
+	{ .name = "constant-alpha-max",
+	  .test = constant_alpha_max,
+	  .blend = true,
+	  .must_multiply = false,
+	  .desc = "Tests plane alpha and blending properties with maximum alpha value.",
+	},
+};
+
+static bool pipe_check(data_t *data, enum pipe pipe,
+		       bool blend, bool must_multiply)
 {
-	igt_fixture {
-		bool found = false;
-		igt_plane_t *plane;
-
-		igt_display_require_output_on_pipe(&data->display, pipe);
-		for_each_plane_on_pipe(&data->display, pipe, plane) {
-			if (!igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
-				continue;
-
-			found = true;
-			break;
-		}
+	igt_display_t *display = &data->display;
+	igt_plane_t *plane;
+	bool plane_alpha = false, plane_blend = false, multiply = false;
 
-		igt_require_f(found, "Found no plane on pipe %s with alpha blending supported\n",
-			      kmstest_pipe_name(pipe));
-	}
+	igt_display_require_output_on_pipe(display, pipe);
+	for_each_plane_on_pipe(display, pipe, plane) {
+		if (!igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
+			continue;
+		plane_alpha = true;
 
-	igt_describe("Tests basic plane alpha properties.");
-	igt_subtest_f("pipe-%s-alpha-basic", kmstest_pipe_name(pipe))
-		run_test_on_pipe_planes(data, pipe, false, true, basic_alpha);
+		if (blend && !igt_plane_has_prop(plane, IGT_PLANE_PIXEL_BLEND_MODE))
+			continue;
+		plane_blend = true;
 
-	igt_describe("Uses alpha values 0x7e and 0xfc to validate fg.alpha and "
-		     "plane_alpha are swappable on pre-multiplied blend mode.");
-	igt_subtest_f("pipe-%s-alpha-7efc", kmstest_pipe_name(pipe))
-		run_test_on_pipe_planes(data, pipe, false, true, alpha_7efc);
+		/* reset plane alpha properties between each plane */
+		reset_alpha(display, pipe);
 
-	igt_describe("Uses alpha values 0x7e and 0xfc to validate fg.alpha and "
-		     "plane_alpha are swappable on coverage blend mode.");
-	igt_subtest_f("pipe-%s-coverage-7efc", kmstest_pipe_name(pipe))
-		run_test_on_pipe_planes(data, pipe, true, true, coverage_7efc);
+		if (must_multiply && !has_multiplied_alpha(data, plane))
+			continue;
+		multiply = true;
 
-	igt_describe("Tests pipe coverage blending properties.");
-	igt_subtest_f("pipe-%s-coverage-vs-premult-vs-constant", kmstest_pipe_name(pipe))
-		run_test_on_pipe_planes(data, pipe, true, false, coverage_premult_constant);
+		break;
+	}
 
-	igt_describe("Tests the alpha property with transparent fb.");
-	igt_subtest_f("pipe-%s-alpha-transparent-fb", kmstest_pipe_name(pipe))
-		run_test_on_pipe_planes(data, pipe, false, false, argb_transparent);
+	if (!plane_alpha || !plane_blend || !multiply) {
+		if (!plane_alpha)
+			igt_debug("No planes with alpha property found\n");
+		if (!plane_blend)
+			igt_debug("No planes with plane blending mode property found\n");
+		if (!multiply)
+			igt_debug("Multiplied (plane x pixel) alpha not available\n");
+
+		return false;
+	} else {
+		return true;
+	}
+}
 
-	igt_describe("Tests alpha properties with opaque fb.");
-	igt_subtest_f("pipe-%s-alpha-opaque-fb", kmstest_pipe_name(pipe))
-		run_test_on_pipe_planes(data, pipe, false, false, argb_opaque);
+static void run_subtests(data_t *data)
+{
+	igt_output_t *output;
+	enum pipe pipe;
 
-	igt_describe("Tests plane alpha and blending properties with minimum alpha value.");
-	igt_subtest_f("pipe-%s-constant-alpha-min", kmstest_pipe_name(pipe))
-		run_test_on_pipe_planes(data, pipe, true, false, constant_alpha_min);
+	for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
+		igt_describe_f("%s\n", subtests[i].desc);
 
-	igt_describe("Tests plane alpha and blending properties with medium alpha value");
-	igt_subtest_f("pipe-%s-constant-alpha-mid", kmstest_pipe_name(pipe))
-		run_test_on_pipe_planes(data, pipe, true, false, constant_alpha_mid);
+		igt_subtest_with_dynamic(subtests[i].name) {
+			for_each_pipe_with_single_output(&data->display, pipe, output) {
+				prepare_crtc(data, output, pipe);
+				if (!pipe_check(data, pipe, subtests[i].blend, subtests[i].must_multiply))
+					continue;
 
-	igt_describe("Tests plane alpha and blending properties with maximum alpha value");
-	igt_subtest_f("pipe-%s-constant-alpha-max", kmstest_pipe_name(pipe))
-		run_test_on_pipe_planes(data, pipe, true, false, constant_alpha_max);
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
+					run_test_on_pipe_planes(data, pipe, output, subtests[i].blend,
+								subtests[i].must_multiply, subtests[i].test);
+			}
+		}
+	}
 }
 
 igt_main
 {
 	data_t data = {};
-	enum pipe pipe;
 
 	igt_fixture {
 		data.gfx_fd = drm_open_driver_master(DRIVER_ANY);
@@ -576,9 +634,7 @@ igt_main
 		igt_require(data.display.is_atomic);
 	}
 
-	for_each_pipe_static(pipe)
-		igt_subtest_group
-			run_subtests(&data, pipe);
+	run_subtests(&data);
 
 	igt_fixture {
 		igt_display_reset(&data.display);
-- 
2.22.0
