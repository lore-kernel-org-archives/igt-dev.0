Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B756E10E925
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 05:47:45 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 May 2022 11:14:37 +0530
Message-Id: <20220506054446.3228224-7-bhanuprakash.modem@intel.com>
In-Reply-To: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
References: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 06/15] tests/kms_color: New subtests for Plane CTM
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

To verify plane CTM, draw 3 rectangles using before colors with the
ctm matrix applied and verify the CRC is equal to using after colors
with an identify ctm matrix.

V2:
* Rebase

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 226 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 226 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 196952e2..b72bca58 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -29,6 +29,77 @@ IGT_TEST_DESCRIPTION("Test Color Features at Pipe & Plane level");
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
 static bool test_pipe_degamma(data_t *data,
 			      igt_plane_t *primary)
 {
@@ -884,6 +955,98 @@ static bool plane_degamma_test(data_t *data, igt_plane_t *plane)
 	return ret;
 }
 
+static bool test_plane_ctm(data_t *data,
+			  igt_plane_t *plane,
+			  color_t *before,
+			  color_t *after,
+			  double *ctm_matrix)
+{
+	const double ctm_identity[] = {
+		1.0, 0.0, 0.0,
+		0.0, 1.0, 0.0,
+		0.0, 0.0, 1.0
+	};
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode;
+	struct igt_fb fb;
+	igt_crc_t crc_software, crc_hardware;
+	igt_pipe_crc_t *pipe_crc = NULL;
+	bool ret = true;
+
+	igt_info("Plane CTM test is running on pipe-%s plane-%d(%s)\n",
+			kmstest_pipe_name(plane->pipe->pipe), plane->index,
+			kmstest_plane_type_name(plane->type));
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_CTM));
+
+	pipe_crc = igt_pipe_crc_new(data->drm_fd,
+				  plane->pipe->pipe,
+				  INTEL_PIPE_CRC_SOURCE_AUTO);
+
+	output = igt_get_single_output_for_pipe(display, plane->pipe->pipe);
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
+	igt_plane_set_fb(plane, &fb);
+
+	/* Disable Pipe color props. */
+	disable_degamma(plane->pipe);
+	disable_gamma(plane->pipe);
+	disable_ctm(plane->pipe);
+
+	disable_plane_gamma(plane);
+	disable_plane_degamma(plane);
+	igt_display_commit2(display, display->is_atomic ?
+				COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	/* Without CTM transformation. */
+	paint_rectangles(data, mode, after, &fb);
+	igt_plane_set_fb(plane, &fb);
+	set_plane_ctm(plane, ctm_identity);
+	igt_display_commit2(display, display->is_atomic ?
+				COMMIT_ATOMIC : COMMIT_LEGACY);
+	igt_wait_for_vblank(data->drm_fd,
+			display->pipes[plane->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(pipe_crc, &crc_software);
+
+	/* With CTM transformation. */
+	paint_rectangles(data, mode, before, &fb);
+	igt_plane_set_fb(plane, &fb);
+	set_plane_ctm(plane, ctm_matrix);
+	igt_display_commit2(display, display->is_atomic ?
+				COMMIT_ATOMIC : COMMIT_LEGACY);
+	igt_wait_for_vblank(data->drm_fd,
+			display->pipes[plane->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(pipe_crc, &crc_hardware);
+
+	/* Verify that the CRC of the software computed ouutput
+	 * is equal to the CRC of the CTM matrix transformation
+	 * output.
+	 */
+	ret = igt_check_crc_equal(&crc_software, &crc_hardware);
+
+	disable_plane_ctm(plane);
+	igt_plane_set_fb(plane, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, display->is_atomic ?
+					COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	igt_pipe_crc_free(pipe_crc);
+
+	return ret;
+}
+
 static void
 prep_pipe(data_t *data, enum pipe p)
 {
@@ -1222,8 +1385,59 @@ static void run_plane_color_test(data_t *data, enum pipe pipe, test_t test)
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
+			result = test_plane_ctm(data, plane,
+						red_green_blue, expected,
+						ctm);
+
+		for (i = 0; i < iter; i++) {
+			expected[0].r =
+			expected[1].g =
+			expected[2].b =
+				ctm[0] + delta * (i - (iter/2));
+
+			if (test_plane_ctm(data, plane,
+					   red_green_blue, expected,
+					   ctm)) {
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
 		igt_require_pipe_crc(data->drm_fd);
@@ -1239,6 +1453,18 @@ static void run_tests_for_plane(data_t *data, enum pipe pipe)
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
