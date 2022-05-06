Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4C110E9C7
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 05:47:57 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 May 2022 11:14:41 +0530
Message-Id: <20220506054446.3228224-11-bhanuprakash.modem@intel.com>
In-Reply-To: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
References: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 10/15] tests/kms_color_chamelium: New subtests for
 Plane CTM
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Pekka Paalanen <ppaalanen@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

To verify plane CTM, draw 3 rectangles using before colors with the
ctm matrix applied and verify the frame dump is equal to using after
colors with an identify ctm matrix.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color_chamelium.c | 228 ++++++++++++++++++++++++++++++++++++
 1 file changed, 228 insertions(+)

diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index c9dc656b..62851006 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -29,6 +29,77 @@ IGT_TEST_DESCRIPTION("Test Color Features at Pipe & Plane level using Chamelium
 typedef bool (*test_t)(data_t*, igt_plane_t*);
 static bool extended = false;
 
+struct {
+	const char *test_name;
+	int iter;
+	color_t expected_colors[3];
+	double ctm[9];
+} ctm_tests[] = {
+	{"plane-ctm-red-to-blue", 0,
+					{{ 0.0, 0.0, 1.0 },
+					 { 0.0, 1.0, 0.0 },
+					 { 0.0, 0.0, 1.0 }},
+		{ 0.0, 0.0, 0.0,
+		  0.0, 1.0, 0.0,
+		  1.0, 0.0, 1.0 },
+	},
+	{"plane-ctm-green-to-red", 0,
+					{{ 1.0, 0.0, 0.0 },
+					 { 1.0, 0.0, 0.0 },
+					 { 0.0, 0.0, 1.0 }},
+		{ 1.0, 1.0, 0.0,
+		  0.0, 0.0, 0.0,
+		  0.0, 0.0, 1.0 },
+	},
+	{"plane-ctm-blue-to-red", 0,
+					{{ 1.0, 0.0, 0.0 },
+					 { 0.0, 1.0, 0.0 },
+					 { 1.0, 0.0, 0.0 }},
+		{ 1.0, 0.0, 1.0,
+		  0.0, 1.0, 0.0,
+		  0.0, 0.0, 0.0 },
+	},
+	{"plane-ctm-max", 0,
+					{{ 1.0, 0.0, 0.0 },
+					 { 0.0, 1.0, 0.0 },
+					 { 0.0, 0.0, 1.0 }},
+		{ 100.0, 0.0, 0.0,
+		  0.0, 100.0, 0.0,
+		  0.0, 0.0, 100.0 },
+	},
+	{"plane-ctm-negative", 0,
+					{{ 0.0, 0.0, 0.0 },
+					 { 0.0, 0.0, 0.0 },
+					 { 0.0, 0.0, 0.0 }},
+		{ -1.0, 0.0, 0.0,
+		   0.0, -1.0, 0.0,
+		   0.0, 0.0, -1.0 },
+	},
+	/* We tests a few values around the expected result because
+	 * it depends on the hardware we're dealing with, we can
+	 * either get clamped or rounded values and we also need to
+	 * account for odd number of items in the LUTs.
+	 */
+	{"plane-ctm-0-25", 5,
+					{{ 0.0, }, { 0.0, }, { 0.0, }},
+		{ 0.25, 0.0,  0.0,
+		  0.0,  0.25, 0.0,
+		  0.0,  0.0,  0.25 },
+	},
+	{"plane-ctm-0-50", 5,
+					{{ 0.0, }, { 0.0, }, { 0.0, }},
+		{ 0.5,  0.0,  0.0,
+		  0.0,  0.5,  0.0,
+		  0.0,  0.0,  0.5 },
+	},
+	{"plane-ctm-0-75", 7,
+					{{ 0.0, }, { 0.0, }, { 0.0, }},
+		{ 0.75, 0.0,  0.0,
+		  0.0,  0.75, 0.0,
+		  0.0,  0.0,  0.75 },
+	},
+};
+
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out
  * degamma LUT and verify we have the same frame dump as drawing solid color
@@ -991,6 +1062,102 @@ static bool plane_degamma_test(data_t *data, igt_plane_t *plane)
 	return ret;
 }
 
+static bool test_plane_ctm(data_t *data,
+			  igt_plane_t *plane,
+			  color_t *before,
+			  color_t *after,
+			  double *ctm_matrix)
+{
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode;
+	struct igt_fb fb, fbref;
+	struct chamelium_port *port;
+	struct chamelium_frame_dump *frame_hardware;
+	uint32_t i;
+	bool ret = true;
+
+	igt_info("Plane CTM test is running on pipe-%s plane-%d(%s)\n",
+			kmstest_pipe_name(plane->pipe->pipe), plane->index,
+			kmstest_plane_type_name(plane->type));
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_CTM));
+
+	for_each_valid_output_on_pipe(display, plane->pipe->pipe, output) {
+		for (i = 0; i < data->port_count; i++)
+			if (strcmp(output->name, chamelium_port_get_name(data->ports[i])) == 0) {
+				port = data->ports[i];
+				break;
+			}
+
+		if (port)
+			break;
+	}
+	igt_require(port);
+	igt_assert(output);
+
+	igt_output_set_pipe(output, plane->pipe->pipe);
+	mode = igt_output_get_mode(output);
+
+	/* Create a framebuffer at the size of the output. */
+	igt_assert(igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR,
+			      &fb));
+
+	igt_assert(igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR,
+			      &fbref));
+
+	disable_degamma(plane->pipe);
+	disable_ctm(plane->pipe);
+	disable_gamma(plane->pipe);
+
+	disable_plane_degamma(plane);
+	disable_plane_ctm(plane);
+	disable_plane_gamma(plane);
+
+	igt_plane_set_fb(plane, &fbref);
+	igt_display_commit2(display, display->is_atomic ?
+					COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	/* Without CTM transformation. */
+	paint_rectangles(data, mode, after, &fbref);
+
+	/* With CTM transformation. */
+	paint_rectangles(data, mode, before, &fb);
+	igt_plane_set_fb(plane, &fb);
+	set_plane_ctm(plane, ctm_matrix);
+	igt_display_commit2(display, display->is_atomic ?
+				COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+	frame_hardware =
+		chamelium_read_captured_frame(data->chamelium, 0);
+
+	/* Verify that the framebuffer reference of the software
+	 * computed output is equal to the frame dump of the CTM
+	 * matrix transformation output.
+	 */
+	ret = chamelium_frame_match_or_dump(data->chamelium, port,
+					     frame_hardware,
+					     &fbref,
+					     CHAMELIUM_CHECK_ANALOG);
+
+	disable_plane_ctm(plane);
+	igt_plane_set_fb(plane, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, display->is_atomic ?
+					COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	return ret;
+}
+
 static void run_plane_color_test(data_t *data, enum pipe pipe, test_t test)
 {
 	igt_plane_t *plane;
@@ -1009,8 +1176,57 @@ static void run_plane_color_test(data_t *data, enum pipe pipe, test_t test)
 	igt_require_f(count, "No valid planes found.\n");
 }
 
+static void run_plane_ctm_test(data_t *data,
+				enum pipe pipe,
+				color_t *expected,
+				double *ctm,
+				int iter)
+{
+	igt_plane_t *plane;
+	bool result;
+	int i, count = 0;
+	double delta = 1.0 / (1 << 8);
+	color_t red_green_blue[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+	int last_plane = (&data->display)->pipes[pipe].n_planes - 1;
+
+	for_each_plane_on_pipe(&data->display, pipe, plane) {
+		if (!extended && j__ != 0 && j__ != last_plane)
+			continue;
+
+		result = false;
+
+		if (!iter)
+			result = test_plane_ctm(data, plane, red_green_blue,
+						expected, ctm);
+
+		for (i = 0; i < iter; i++) {
+			expected[0].r =
+			expected[1].g =
+			expected[2].b =
+				ctm[0] + delta * (i - (iter/2));
+
+			if (test_plane_ctm(data, plane, red_green_blue,
+						expected, ctm)) {
+				result = true;
+				break;
+			}
+		}
+
+		igt_assert(result);
+		count++;
+	}
+
+	igt_require_f(count, "No valid planes found.\n");
+}
+
 static void run_tests_for_plane(data_t *data, enum pipe pipe)
 {
+	int i;
+
 	igt_fixture {
 		igt_require_pipe(&data->display, pipe);
 		igt_require(data->display.pipes[pipe].n_planes > 0);
@@ -1026,6 +1242,18 @@ static void run_tests_for_plane(data_t *data, enum pipe pipe)
 	igt_subtest_f("pipe-%s-plane-degamma",
 			kmstest_pipe_name(pipe))
 		run_plane_color_test(data, pipe, plane_degamma_test);
+
+	for (i = 0; i < ARRAY_SIZE(ctm_tests); i++) {
+		igt_describe("Compare after applying ctm matrix & identity matrix");
+		igt_subtest_f("pipe-%s-%s",
+				kmstest_pipe_name(pipe),
+				ctm_tests[i].test_name) {
+			run_plane_ctm_test(data, pipe,
+					ctm_tests[i].expected_colors,
+					ctm_tests[i].ctm,
+					ctm_tests[i].iter);
+		}
+	}
 }
 
 static int opt_handler(int opt, int opt_index, void *data)
-- 
2.35.1
