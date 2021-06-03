Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7466F48F
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 14:51:33 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  3 Jun 2021 20:10:03 +0530
Message-Id: <20210603144022.28176-4-venkata.sai.patnana@intel.com>
In-Reply-To: <20210603144022.28176-1-venkata.sai.patnana@intel.com>
References: <20210603144022.28176-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 i-g-t 04/23] tests/kms_color: New subtests for
 Plane degamma
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

To verify Plane degamma, draw 3 gradient rectangles in red, green and blue,
with a maxed out degamma LUT and verify we have the same CRC as drawing solid
color rectangles with linear gamma LUT.

v2:
* Rename function names (Uma)
* Update to use restructured helper functions (Bhanu)
v3:
* Restructure to manage the memory (alloc & free) by the caller (Uma)
v4:
* Remove gamma dependency & clear degamma before exit (Uma)
v5:
* Ignore "no degamma" from enum list (Bhanu)
v6:
* Search for the enum name, instead of assuming value as 0 (Uma)

Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 123 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 9b5c1d63eb..0874775cd2 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -781,6 +781,124 @@ static bool plane_gamma_test(data_t *data, igt_plane_t *plane)
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
+	igt_crc_t crc_degamma, crc_fullcolors;
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
+	igt_require_pipe_crc(data->drm_fd);
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
+			      LOCAL_DRM_FORMAT_MOD_NONE,
+			      &fb));
+
+	igt_plane_set_fb(plane, &fb);
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
+		/* Draw a gradient with degamma LUT to remap all
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
+		ret &= crc_equal(&crc_degamma, &crc_fullcolors);
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
 run_tests_for_pipe(data_t *data, enum pipe p)
 {
@@ -1038,6 +1156,11 @@ static void run_tests_for_plane(data_t *data, enum pipe pipe)
 	igt_subtest_f("pipe-%s-plane-gamma",
 			kmstest_pipe_name(pipe))
 		run_plane_color_test(data, pipe, plane_gamma_test);
+
+	igt_describe("Compare maxed out plane degamma LUT and solid color linear LUT");
+	igt_subtest_f("pipe-%s-plane-degamma",
+			kmstest_pipe_name(pipe))
+		run_plane_color_test(data, pipe, plane_degamma_test);
 }
 
 igt_main
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
