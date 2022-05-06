Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D323510E772
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 05:47:53 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 May 2022 11:14:40 +0530
Message-Id: <20220506054446.3228224-10-bhanuprakash.modem@intel.com>
In-Reply-To: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
References: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 09/15] tests/kms_color_chamelium: New subtests for
 Plane degamma
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

To verify Plane degamma, draw 3 gradient rectangles in red, green and blue,
with a maxed out degamma LUT and verify we have the same frame dump as
drawing solid color rectangles with linear gamma LUT.

v2:
* Add support to validate 'no degamma' mode (Harry)

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color_chamelium.c | 138 ++++++++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index 9e306e2f..c9dc656b 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -858,6 +858,139 @@ static bool plane_gamma_test(data_t *data, igt_plane_t *plane)
 	return ret;
 }
 
+static bool plane_degamma_test(data_t *data, igt_plane_t *plane)
+{
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode;
+	drmModePropertyPtr degamma_mode;
+	struct igt_fb fb, fbref;
+	struct chamelium_port *port;
+	uint32_t i;
+	bool ret = true;
+	color_t red_green_blue[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+
+	igt_info("Plane degamma test is running on pipe-%s plane-%d(%s)\n",
+			kmstest_pipe_name(plane->pipe->pipe), plane->index,
+			kmstest_plane_type_name(plane->type));
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_DEGAMMA_MODE));
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_DEGAMMA_LUT));
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
+	/* Draw solid colors with no degamma. */
+	paint_rectangles(data, mode, red_green_blue, &fbref);
+
+	degamma_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_DEGAMMA_MODE);
+	/* Iterate all supported degamma modes. */
+	for (i = 0; i < degamma_mode->count_enums; i++) {
+		struct chamelium_frame_dump *frame_fullcolors;
+		segment_data_t *segment_info = NULL;
+		struct drm_color_lut_ext *lut = NULL;
+		uint32_t lut_size = 0;
+
+		igt_info("Trying to use degamma mode: \'%s\'\n", degamma_mode->enums[i].name);
+
+		/* 'no degamma' is intended to disable the degamma.
+		 * Hence, setting DEGAMMA_LUT to NULL (i.e disable_plane_degamma())
+		 * and setting DEGAMMA_MODE as 'no degamma' (i.e set_plane_degamma())
+		 * should produce the same result.
+		 */
+		if (!strcmp(degamma_mode->enums[i].name, "no degamma")) {
+			paint_rectangles(data, mode, red_green_blue, &fb);
+		} else {
+			segment_info = get_segment_data(data,
+							degamma_mode->enums[i].value,
+							degamma_mode->enums[i].name);
+			lut_size = sizeof(struct drm_color_lut_ext) * segment_info->entries_count;
+			lut = create_max_lut(segment_info);
+			if (is_i915_device(data->drm_fd))
+				lut[0].red = lut[0].green = lut[0].blue = 0; /* First entry is 0 for Intel h/w. */
+
+			/* Draw a gradient with degamma LUT to remap all
+			 * values to max red/green/blue.
+			 */
+			paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+		}
+
+		igt_plane_set_fb(plane, &fb);
+		set_plane_degamma(plane, degamma_mode->enums[i].name, lut, lut_size);
+		igt_display_commit2(display, display->is_atomic ?
+						COMMIT_ATOMIC : COMMIT_LEGACY);
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
+				frame_fullcolors, &fbref,
+				CHAMELIUM_CHECK_ANALOG);
+
+		free(lut);
+		clear_segment_data(segment_info);
+	}
+
+	disable_plane_degamma(plane);
+	igt_plane_set_fb(plane, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, display->is_atomic ?
+					COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	drmModeFreeProperty(degamma_mode);
+
+	return ret;
+}
+
 static void run_plane_color_test(data_t *data, enum pipe pipe, test_t test)
 {
 	igt_plane_t *plane;
@@ -888,6 +1021,11 @@ static void run_tests_for_plane(data_t *data, enum pipe pipe)
 	igt_subtest_f("pipe-%s-plane-gamma",
 			kmstest_pipe_name(pipe))
 		run_plane_color_test(data, pipe, plane_gamma_test);
+
+	igt_describe("Compare maxed out plane degamma LUT and solid color linear LUT");
+	igt_subtest_f("pipe-%s-plane-degamma",
+			kmstest_pipe_name(pipe))
+		run_plane_color_test(data, pipe, plane_degamma_test);
 }
 
 static int opt_handler(int opt, int opt_index, void *data)
-- 
2.35.1
