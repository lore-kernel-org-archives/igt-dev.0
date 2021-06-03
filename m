Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C446F471
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 12:31:34 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  3 Jun 2021 17:50:09 +0530
Message-Id: <20210603122027.27330-6-venkata.sai.patnana@intel.com>
In-Reply-To: <20210603122027.27330-1-venkata.sai.patnana@intel.com>
References: <20210603122027.27330-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 06/24] tests/kms_color_chamelium: New
 subtests for Plane gamma
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

To verify Plane gamma, draw 3 gradient rectangles in red, green and blue,
with a maxed out gamma LUT and verify we have the same frame dump as
drawing solid color rectangles.

v2:
* Ignore "no gamma" from enum list (Bhanu)
v3:
* Search for the enum name, instead of assuming value as 0 (Uma)

Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
(cherry picked from commit 1d66b734cb91b0ceec60e7af958984d2947ed712)
---
 tests/kms_color_chamelium.c | 190 +++++++++++++++++++++++++++++++++++-
 1 file changed, 189 insertions(+), 1 deletion(-)

diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index 30b38b82e3..59afaf0f43 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -24,7 +24,34 @@
 
 #include "kms_color_helper.h"
 
-IGT_TEST_DESCRIPTION("Test Color Features at Pipe level using Chamelium to verify instead of CRC");
+IGT_TEST_DESCRIPTION("Test Color Features at Pipe & Plane level using Chamelium to verify instead of CRC");
+
+#define MAX_SUPPORTED_PLANES 7
+#define SDR_PLANE_BASE 3
+
+typedef bool (*test_t)(data_t*, igt_plane_t*);
+
+static bool is_hdr_plane(const igt_plane_t *plane)
+{
+	return plane->index >= 0 && plane->index < SDR_PLANE_BASE;
+}
+
+static bool is_valid_plane(igt_plane_t *plane)
+{
+	int index = plane->index;
+
+	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
+		return false;
+
+	/*
+	 * Test 1 HDR plane, 1 SDR plane.
+	 *
+	 * 0,1,2 HDR planes
+	 * 3,4,5,6 SDR planes
+	 *
+	 */
+	return index >= 0 && index < MAX_SUPPORTED_PLANES;
+}
 
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out
@@ -721,6 +748,163 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	}
 }
 
+static bool plane_gamma_test(data_t *data, igt_plane_t *plane)
+{
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode;
+	struct igt_fb fb, fbref;
+	drmModePropertyPtr gamma_mode = NULL;
+	uint32_t i;
+	bool ret = true;
+	struct chamelium_port *port = NULL;
+	struct chamelium_frame_dump *frame_fullcolors;
+	color_t red_green_blue[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+
+	igt_info("Plane gamma test is running on pipe-%s plane-%s(%s)\n",
+			kmstest_pipe_name(plane->pipe->pipe),
+			kmstest_plane_type_name(plane->type),
+			is_hdr_plane(plane) ? "hdr":"sdr");
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_MODE));
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_LUT));
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
+			      LOCAL_DRM_FORMAT_MOD_NONE,
+			      &fb));
+
+	igt_assert(igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      LOCAL_DRM_FORMAT_MOD_NONE,
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
+				COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	gamma_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_GAMMA_MODE);
+
+	/* Draw solid colors with no gamma transformation. */
+	paint_rectangles(data, mode, red_green_blue, &fbref);
+
+	/* Iterate all supported gamma modes. */
+	for (i = 0; i < gamma_mode->count_enums; i++) {
+		segment_data_t *segment_info = NULL;
+		struct drm_color_lut_ext *lut = NULL;
+		uint32_t lut_size = 0;
+
+		/* Ignore 'no gamma' from enum list. */
+		if (!strcmp(gamma_mode->enums[i].name, "no gamma"))
+			continue;
+
+		igt_info("Trying to use gamma mode: \'%s\'\n", gamma_mode->enums[i].name);
+
+		segment_info = get_segment_data(data, gamma_mode->enums[i].value,
+				gamma_mode->enums[i].name);
+		lut_size = sizeof(struct drm_color_lut_ext) * segment_info->entries_count;
+		lut = create_max_lut(segment_info);
+		set_plane_gamma(plane, gamma_mode->enums[i].name, lut, lut_size);
+
+		/* Draw a gradient with gamma LUT to remap all
+		 * values to max red/green/blue.
+		 */
+		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+		igt_plane_set_fb(plane, &fb);
+		igt_display_commit2(display, display->is_atomic ?
+					COMMIT_ATOMIC : COMMIT_LEGACY);
+
+		chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+		frame_fullcolors =
+			chamelium_read_captured_frame(data->chamelium, 0);
+
+		/* Verify that the framebuffer reference of the software computed
+		 * output is equal to the frame dump of the gamma LUT
+		 * transformation output.
+		 */
+		ret &= chamelium_frame_match_or_dump(data->chamelium, port,
+					      frame_fullcolors, &fbref,
+					      CHAMELIUM_CHECK_ANALOG);
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
+	drmModeFreeProperty(gamma_mode);
+
+	return ret;
+}
+
+static void run_plane_color_test(data_t *data, enum pipe pipe, test_t test)
+{
+	igt_plane_t *plane;
+	int count = 0;
+
+	for_each_plane_on_pipe(&data->display, pipe, plane) {
+		if (!is_valid_plane(plane))
+			continue;
+
+		igt_assert(test(data, plane));
+
+		count++;
+	}
+
+	if (!count)
+		igt_skip("No valid planes found.\n");
+}
+
+static void run_tests_for_plane(data_t *data, enum pipe pipe)
+{
+	igt_fixture {
+		igt_display_require_output_on_pipe(&data->display, pipe);
+		igt_require(data->display.pipes[pipe].n_planes > 0);
+		igt_require(is_i915_device(data->drm_fd));
+	}
+
+	igt_describe("Compare maxed out plane gamma LUT and solid color linear LUT");
+	igt_subtest_f("pipe-%s-plane-gamma",
+			kmstest_pipe_name(pipe))
+		run_plane_color_test(data, pipe, plane_gamma_test);
+}
+
 igt_main
 {
 	data_t data = {};
@@ -764,6 +948,10 @@ igt_main
 	igt_subtest_f("pipe-invalid-ctm-matrix-sizes")
 		invalid_ctm_matrix_sizes(&data);
 
+	for_each_pipe_static(pipe)
+		igt_subtest_group
+			run_tests_for_plane(&data, pipe);
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 	}
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
