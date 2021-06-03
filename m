Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD3E6F492
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 14:51:35 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  3 Jun 2021 20:10:04 +0530
Message-Id: <20210603144022.28176-5-venkata.sai.patnana@intel.com>
In-Reply-To: <20210603144022.28176-1-venkata.sai.patnana@intel.com>
References: <20210603144022.28176-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 i-g-t 05/23] tests/kms_color: New subtests for
 Plane CTM
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

To verify plane CTM, draw 3 rectangles using before colors with the
ctm matrix applied and verify the CRC is equal to using after colors
with an identify ctm matrix.

v2:
* Rename function names (Uma)
* Update to use restructured helper functions (Bhanu)
v3:
* Restructure to manage the memory (alloc & free) by the caller (Uma)

Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 224 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 224 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 0874775cd2..0387c9192a 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -53,6 +53,77 @@ static bool is_valid_plane(igt_plane_t *plane)
 	return index >= 0 && index < MAX_SUPPORTED_PLANES;
 }
 
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
 static void test_pipe_degamma(data_t *data,
 			      igt_plane_t *primary)
 {
@@ -899,6 +970,99 @@ static bool plane_degamma_test(data_t *data, igt_plane_t *plane)
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
+	igt_info("Plane CTM test is running on pipe-%s plane-%s(%s)\n",
+			kmstest_pipe_name(plane->pipe->pipe),
+			kmstest_plane_type_name(plane->type),
+			is_hdr_plane(plane) ? "hdr":"sdr");
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_CTM));
+
+	igt_require_pipe_crc(data->drm_fd);
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
+			      LOCAL_DRM_FORMAT_MOD_NONE,
+			      &fb));
+
+	igt_plane_set_fb(plane, &fb);
+
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
+	ret = crc_equal(&crc_software, &crc_hardware);
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
 run_tests_for_pipe(data_t *data, enum pipe p)
 {
@@ -1144,8 +1308,56 @@ static void run_plane_color_test(data_t *data, enum pipe pipe, test_t test)
 		igt_skip("No valid planes found.\n");
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
+
+	for_each_plane_on_pipe(&data->display, pipe, plane) {
+		if (!is_valid_plane(plane))
+			continue;
+
+		result = false;
+
+		if (!iter)
+			result |= test_plane_ctm(data, plane,
+					red_green_blue, expected,
+					ctm);
+
+		for (i = 0; i < iter; i++) {
+			expected[0].r =
+			expected[1].g =
+			expected[2].b =
+				ctm[0] + delta * (i - (iter/2));
+
+			result |= test_plane_ctm(data, plane,
+					red_green_blue,	expected,
+					ctm);
+		}
+
+		igt_assert(result);
+		count++;
+	}
+
+	if (!count)
+		igt_skip("No valid planes found.\n");
+}
+
 static void run_tests_for_plane(data_t *data, enum pipe pipe)
 {
+	int i;
+
 	igt_fixture {
 		igt_display_require_output_on_pipe(&data->display, pipe);
 		igt_require(data->display.pipes[pipe].n_planes > 0);
@@ -1161,6 +1373,18 @@ static void run_tests_for_plane(data_t *data, enum pipe pipe)
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
 
 igt_main
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
