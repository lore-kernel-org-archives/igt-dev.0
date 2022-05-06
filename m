Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6758C10E772
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 05:47:42 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 May 2022 11:14:35 +0530
Message-Id: <20220506054446.3228224-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
References: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 04/15] tests/kms_color: New subtests for Plane gamma
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

To verify Plane gamma, draw 3 gradient rectangles in red, green and blue,
with a maxed out gamma LUT and verify we have the same CRC as drawing solid
color rectangles.

v2:
* Drop Intel specific logic (Pekka)
* Add a support for extended mode (Bhanu)
v3:
* Add support to validate 'no gamma' mode (Harry)

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 180 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 178 insertions(+), 2 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index afff1744..7d7656d7 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -24,7 +24,10 @@
 
 #include "kms_color_helper.h"
 
-IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
+IGT_TEST_DESCRIPTION("Test Color Features at Pipe & Plane level");
+
+typedef bool (*test_t)(data_t*, igt_plane_t*);
+static bool extended = false;
 
 static bool test_pipe_degamma(data_t *data,
 			      igt_plane_t *primary)
@@ -635,6 +638,128 @@ static void test_pipe_limited_range_ctm(data_t *data,
 }
 #endif
 
+static bool plane_gamma_test(data_t *data, igt_plane_t *plane)
+{
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode;
+	struct igt_fb fb;
+	drmModePropertyPtr gamma_mode = NULL;
+	uint32_t i;
+	bool ret = true;
+	igt_pipe_crc_t *pipe_crc = NULL;
+	color_t red_green_blue[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+
+	igt_info("Plane gamma test is running on pipe-%s plane-%d(%s)\n",
+			kmstest_pipe_name(plane->pipe->pipe), plane->index,
+			kmstest_plane_type_name(plane->type));
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_MODE));
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_LUT));
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
+	igt_plane_set_fb(plane, &fb);
+
+	/* Disable Pipe color props. */
+	disable_ctm(plane->pipe);
+	disable_degamma(plane->pipe);
+	disable_gamma(plane->pipe);
+
+	disable_plane_ctm(plane);
+	disable_plane_degamma(plane);
+	igt_display_commit2(display, display->is_atomic ?
+					COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	gamma_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_GAMMA_MODE);
+
+	/* Iterate all supported gamma modes. */
+	for (i = 0; i < gamma_mode->count_enums; i++) {
+		igt_crc_t crc_gamma, crc_fullcolors;
+		segment_data_t *segment_info = NULL;
+		struct drm_color_lut_ext *lut = NULL;
+		uint32_t lut_size = 0;
+
+		igt_info("Trying to use gamma mode: \'%s\'\n", gamma_mode->enums[i].name);
+
+		/* Draw solid colors with no gamma transformation. */
+		disable_plane_gamma(plane);
+		paint_rectangles(data, mode, red_green_blue, &fb);
+		igt_plane_set_fb(plane, &fb);
+		igt_display_commit2(display, display->is_atomic ?
+					COMMIT_ATOMIC : COMMIT_LEGACY);
+		igt_wait_for_vblank(data->drm_fd,
+			display->pipes[plane->pipe->pipe].crtc_offset);
+		igt_pipe_crc_collect_crc(pipe_crc, &crc_fullcolors);
+
+		/* 'no gamma' is intended to disable the gamma.
+		 * Hence, setting GAMMA_LUT to NULL (i.e disable_plane_gamma())
+		 * and setting GAMMA_MODE as 'no gamma' (i.e set_plane_gamma())
+		 * should produce the same result.
+		 */
+		if (strcmp(gamma_mode->enums[i].name, "no gamma")) {
+			segment_info = get_segment_data(data,
+							gamma_mode->enums[i].value,
+							gamma_mode->enums[i].name);
+			lut_size = sizeof(struct drm_color_lut_ext) * segment_info->entries_count;
+			lut = create_max_lut(segment_info);
+			if (is_i915_device(data->drm_fd))
+				lut[0].red = lut[0].green = lut[0].blue = 0; /* First entry is 0 for Intel h/w. */
+
+			/* Draw gradient colors with gamma LUT to remap all
+			 * values to max red/green/blue.
+			 */
+			paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+			igt_plane_set_fb(plane, &fb);
+		}
+
+		set_plane_gamma(plane, gamma_mode->enums[i].name, lut, lut_size);
+		igt_display_commit2(display, display->is_atomic ?
+					COMMIT_ATOMIC : COMMIT_LEGACY);
+		igt_wait_for_vblank(data->drm_fd,
+			display->pipes[plane->pipe->pipe].crtc_offset);
+		igt_pipe_crc_collect_crc(pipe_crc, &crc_gamma);
+
+		/* Verify that the CRC of the software computed output is
+		 * equal to the CRC of the gamma LUT transformation output.
+		 */
+		ret &= igt_check_crc_equal(&crc_gamma, &crc_fullcolors);
+
+		free(lut);
+		clear_segment_data(segment_info);
+	}
+
+	disable_plane_gamma(plane);
+	igt_plane_set_fb(plane, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, display->is_atomic ?
+					COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	igt_pipe_crc_free(pipe_crc);
+	drmModeFreeProperty(gamma_mode);
+
+	return ret;
+}
+
 static void
 prep_pipe(data_t *data, enum pipe p)
 {
@@ -955,7 +1080,55 @@ run_invalid_tests_for_pipe(data_t *data, enum pipe p)
 		invalid_ctm_matrix_sizes(data, p);
 }
 
-igt_main
+static void run_plane_color_test(data_t *data, enum pipe pipe, test_t test)
+{
+	igt_plane_t *plane;
+	int count = 0;
+	int last_plane = (&data->display)->pipes[pipe].n_planes - 1;
+
+	for_each_plane_on_pipe(&data->display, pipe, plane) {
+		if (!extended && j__ != 0 && j__ != last_plane)
+			continue;
+
+		igt_assert(test(data, plane));
+
+		count++;
+	}
+
+	igt_require_f(count, "No valid planes found.\n");
+}
+
+static void run_tests_for_plane(data_t *data, enum pipe pipe)
+{
+	igt_fixture {
+		igt_require_pipe(&data->display, pipe);
+		igt_require_pipe_crc(data->drm_fd);
+		igt_require(data->display.pipes[pipe].n_planes > 0);
+		igt_display_require_output_on_pipe(&data->display, pipe);
+	}
+
+	igt_describe("Compare maxed out plane gamma LUT and solid color linear LUT");
+	igt_subtest_f("pipe-%s-plane-gamma", kmstest_pipe_name(pipe))
+		run_plane_color_test(data, pipe, plane_gamma_test);
+}
+
+static int opt_handler(int opt, int opt_index, void *data)
+{
+	switch (opt) {
+		case 'e':
+			extended = true;
+			break;
+		default:
+			return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+const char *help_str =
+	"  -e \tExtended plane tests.\n";
+
+igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	data_t data = {};
 	enum pipe pipe;
@@ -975,6 +1148,9 @@ igt_main
 
 		igt_subtest_group
 			run_invalid_tests_for_pipe(&data, pipe);
+
+		igt_subtest_group
+			run_tests_for_plane(&data, pipe);
 	}
 
 	igt_fixture {
-- 
2.35.1
