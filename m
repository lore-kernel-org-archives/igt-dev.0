Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A7810E1C1
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Apr 2022 18:10:45 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Apr 2022 23:29:02 +0530
Message-Id: <20220412175902.1114205-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_color:MPO+pipe color test for
 gamma LUT transformation.
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

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_color.c | 94 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index afff1744..774654f0 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -198,6 +198,92 @@ static bool test_pipe_gamma(data_t *data,
 	return ret;
 }
 
+static bool test_pipe_gamma_multiplane(data_t *data,
+               igt_plane_t *primary,igt_plane_t *overlay)
+{
+       igt_output_t *output = data->output;
+       igt_display_t *display = &data->display;
+       gamma_lut_t *gamma_full;
+       color_t red_green_blue[] = {
+               { 1.0, 0.0, 0.0 },
+               { 0.0, 1.0, 0.0 },
+               { 0.0, 0.0, 1.0 }
+       };
+       drmModeModeInfo *mode;
+       struct igt_fb fb;
+       igt_crc_t crc_fullgamma, crc_fullcolors;
+       int fb_id, height_primary, height_overlay, width;
+       bool ret;
+
+       igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
+
+       gamma_full = generate_table_max(data->gamma_lut_size);
+
+       igt_output_set_pipe(output, primary->pipe->pipe);
+       mode = igt_output_get_mode(output);
+
+       height_primary = mode->vdisplay/2;
+       height_overlay = mode->vdisplay/2+1;
+       width = mode->hdisplay;
+
+       /* Create a framebuffer at the size of the output. */
+       fb_id = igt_create_fb(data->drm_fd,
+                       mode->hdisplay,
+                       mode->vdisplay,
+                       data->drm_format,
+                       DRM_FORMAT_MOD_LINEAR,
+                       &fb);
+       igt_assert(fb_id);
+       igt_plane_set_fb(primary, &fb);
+       igt_plane_set_size(primary, width, height_primary);
+       igt_plane_set_fb(overlay, &fb);
+       igt_plane_set_size(overlay, width, height_overlay);
+       disable_ctm(primary->pipe);
+	disable_degamma(primary->pipe);
+       set_gamma(data, primary->pipe, gamma_full);
+       igt_display_commit(&data->display);
+
+       /* Draw solid colors with no gamma transformation. */
+       paint_rectangles(data, mode, red_green_blue, &fb);
+       igt_plane_set_fb(primary, &fb);
+       igt_display_commit(&data->display);
+       igt_wait_for_vblank(data->drm_fd,
+                       display->pipes[primary->pipe->pipe].crtc_offset);
+       igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
+
+       /* Draw a gradient with gamma LUT to remap all values
+        * to max red/green/blue.
+        */
+       paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+       igt_plane_set_fb(primary, &fb);
+       igt_plane_set_position(primary, 0,0);
+       igt_plane_set_size(primary, width, height_primary);
+       igt_plane_set_fb(overlay, &fb);
+       igt_plane_set_position(overlay, 0, height_primary);
+       igt_plane_set_size(overlay, width, height_overlay);
+       igt_display_commit(&data->display);
+       igt_wait_for_vblank(data->drm_fd,
+                       display->pipes[primary->pipe->pipe].crtc_offset);
+       igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
+
+       /* Verify that the CRC of the software computed output is
+        * equal to the CRC of the gamma LUT transformation output.
+        */
+       ret = !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
+
+       disable_gamma(primary->pipe);
+       igt_plane_set_fb(primary, NULL);
+       igt_plane_set_fb(overlay, NULL);
+       igt_output_set_pipe(output, PIPE_NONE);
+       igt_display_commit(&data->display);
+       igt_remove_fb(data->drm_fd, &fb);
+
+       free_lut(gamma_full);
+
+       return ret;
+}
+
+
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out legacy
  * gamma LUT and verify we have the same CRC as drawing solid color rectangles
@@ -659,7 +745,7 @@ static void
 run_tests_for_pipe(data_t *data, enum pipe p)
 {
 	igt_pipe_t *pipe;
-	igt_plane_t *primary;
+	igt_plane_t *primary, *overlay;
 	double delta;
 	int i;
 	color_t red_green_blue[] = {
@@ -677,6 +763,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 		igt_require(pipe->n_planes >= 0);
 
 		primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		overlay = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_OVERLAY);
 
 		data->pipe_crc = igt_pipe_crc_new(data->drm_fd,
 						  primary->pipe->pipe,
@@ -866,6 +953,11 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	igt_subtest_f("pipe-%s-legacy-gamma-reset", kmstest_pipe_name(p))
 		test_pipe_legacy_gamma_reset(data, primary);
 
+	igt_describe("Verify that gamma LUT transformation works correctly for multiplane");
+        igt_subtest_f("pipe-%s-gamma-multiplane", kmstest_pipe_name(p))
+                igt_assert(test_pipe_gamma_multiplane(data, primary, overlay));
+
+
 	igt_describe("Verify that deep color works correctly");
 	igt_subtest_with_dynamic_f("pipe-%s-deep-color", kmstest_pipe_name(p)) {
 		igt_output_t *output;
-- 
2.25.1
