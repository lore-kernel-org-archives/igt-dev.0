Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon, 15 Nov 2021 15:17:50 +0530
Message-Id: <20211115094759.520955-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 05/14] tests/kms_color: New subtests for Plane
 degamma
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

To verify Plane degamma, draw 3 gradient rectangles in red, green and blue,
with a maxed out degamma LUT and verify we have the same CRC as drawing solid
color rectangles without degamma.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 124 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index b45d66762f..920a5eaadd 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -781,6 +781,125 @@ static bool plane_gamma_test(data_t *data, igt_plane_t *plane)
 	return ret;
 }
 
+static bool plane_degamma_test(data_t *data, igt_plane_t *plane)
+{
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode;
+	drmModePropertyPtr degamma_mode;
+	struct igt_fb fb;
+	uint32_t i;
+	bool ret = true;
+	igt_pipe_crc_t *pipe_crc = NULL;
+	color_t red_green_blue[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+
+	igt_info("Plane degamma test is running on pipe-%s plane-%s(%s)\n",
+			kmstest_pipe_name(plane->pipe->pipe),
+			kmstest_plane_type_name(plane->type),
+			is_hdr_plane(plane) ? "hdr":"sdr");
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_DEGAMMA_MODE));
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_DEGAMMA_LUT));
+
+	pipe_crc = igt_pipe_crc_new(data->drm_fd,
+				    plane->pipe->pipe,
+				    INTEL_PIPE_CRC_SOURCE_AUTO);
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
+	disable_ctm(plane->pipe);
+	disable_degamma(plane->pipe);
+	disable_gamma(plane->pipe);
+
+	disable_plane_ctm(plane);
+	disable_plane_gamma(plane);
+	igt_display_commit2(display, display->is_atomic ?
+					COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	degamma_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_DEGAMMA_MODE);
+
+	/* Iterate all supported degamma modes. */
+	for (i = 0; i < degamma_mode->count_enums; i++) {
+		igt_crc_t crc_degamma, crc_fullcolors;
+		segment_data_t *degamma_segment_info = NULL;
+		struct drm_color_lut_ext *degamma_lut = NULL;
+		uint32_t degamma_lut_size = 0;
+
+		/* Ignore 'no degamma' from enum list. */
+		if (!strcmp(degamma_mode->enums[i].name, "no degamma"))
+			continue;
+
+		degamma_segment_info = get_segment_data(data, degamma_mode->enums[i].value,
+						degamma_mode->enums[i].name);
+		degamma_lut_size = sizeof(struct drm_color_lut_ext) * degamma_segment_info->entries_count;
+		degamma_lut = create_max_lut(degamma_segment_info);
+
+		igt_info("Trying to use degamma mode: \'%s\'\n", degamma_mode->enums[i].name);
+
+		/* Draw solid colors with no degamma. */
+		disable_plane_degamma(plane);
+		paint_rectangles(data, mode, red_green_blue, &fb);
+		igt_plane_set_fb(plane, &fb);
+		igt_display_commit2(display, display->is_atomic ?
+				COMMIT_ATOMIC : COMMIT_LEGACY);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[plane->pipe->pipe].crtc_offset);
+		igt_pipe_crc_collect_crc(pipe_crc, &crc_fullcolors);
+
+		/* Draw gradient colors with degamma LUT to remap all
+		 * values to max red/green/blue.
+		 */
+		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+		igt_plane_set_fb(plane, &fb);
+		set_plane_degamma(plane, degamma_mode->enums[i].name,
+				  degamma_lut, degamma_lut_size);
+		igt_display_commit2(display, display->is_atomic ?
+				COMMIT_ATOMIC : COMMIT_LEGACY);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[plane->pipe->pipe].crtc_offset);
+		igt_pipe_crc_collect_crc(pipe_crc, &crc_degamma);
+
+		/* Verify that the CRC of the software computed output
+		 * is equal to the CRC of the degamma LUT transformation
+		 * output.
+		 */
+		ret &= igt_check_crc_equal(&crc_degamma, &crc_fullcolors);
+
+		free(degamma_lut);
+		clear_segment_data(degamma_segment_info);
+	}
+
+	disable_plane_degamma(plane);
+	igt_plane_set_fb(plane, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, display->is_atomic ?
+					COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	igt_pipe_crc_free(pipe_crc);
+	drmModeFreeProperty(degamma_mode);
+
+	return ret;
+}
+
 static void
 prep_pipe(data_t *data, enum pipe p)
 {
@@ -1062,6 +1181,11 @@ static void run_tests_for_plane(data_t *data, enum pipe pipe)
 	igt_describe("Compare maxed out plane gamma LUT and solid color linear LUT");
 	igt_subtest_f("pipe-%s-plane-gamma", kmstest_pipe_name(pipe))
 		run_plane_color_test(data, pipe, plane_gamma_test);
+
+	igt_describe("Compare maxed out plane degamma LUT and solid color linear LUT");
+	igt_subtest_f("pipe-%s-plane-degamma",
+			kmstest_pipe_name(pipe))
+		run_plane_color_test(data, pipe, plane_degamma_test);
 }
 
 igt_main
-- 
2.32.0
