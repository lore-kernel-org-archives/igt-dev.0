Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554FB6EA8C
 for <igt-dev@lists.freedesktop.org>; Sat, 19 Jun 2021 08:18:27 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Sat, 19 Jun 2021 13:38:55 +0530
Message-Id: <1624090135-437-1-git-send-email-vidya.srinivas@intel.com>
In-Reply-To: <1623415451-776-1-git-send-email-vidya.srinivas@intel.com>
References: <1623415451-776-1-git-send-email-vidya.srinivas@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Limit pipe
 output to 8bpc for coverage-vs-premult-vs-constant
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Few Gen11 systems report CRC mismatch with higher alpha values if
primary plane is enabled. So in order to get the coverage vs. premult vs. constant
crc to match use legacy LUT to limit pipe output to 8bpc for subtest
coverage-vs-premult-vs-constant. Similar thing is done in kms_flip_scaled_crc.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_plane_alpha_blend.c | 39 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index a37cb27c7d62..1e20d9b0778c 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -442,20 +442,52 @@ static void coverage_7efc(data_t *data, enum pipe pipe, igt_plane_t *plane)
 	igt_pipe_crc_stop(data->pipe_crc);
 }
 
+static void set_lut(data_t *data, enum pipe pipe)
+{
+	igt_pipe_t *pipe_obj = &data->display.pipes[pipe];
+	struct drm_color_lut *lut;
+	drmModeCrtc *crtc;
+	int i, lut_size;
+
+	crtc = drmModeGetCrtc(data->gfx_fd, pipe_obj->crtc_id);
+	lut_size = crtc->gamma_size;
+	drmModeFreeCrtc(crtc);
+	lut = malloc(sizeof(lut[0]) * lut_size);
+	for (i = 0; i < lut_size; i++) {
+		uint16_t v  = (i * 0xffff / (lut_size - 1)) & 0xff00;
+		lut[i].red = v;
+		lut[i].green = v;
+		lut[i].blue = v;
+	}
+	igt_pipe_obj_replace_prop_blob(pipe_obj, IGT_CRTC_GAMMA_LUT,
+				       lut, sizeof(lut[0]) * lut_size);
+	free(lut);
+}
+
+static void clear_lut(data_t *data, enum pipe pipe)
+{
+	igt_pipe_t *pipe_obj = &data->display.pipes[pipe];
+
+	igt_pipe_obj_set_prop_value(pipe_obj, IGT_CRTC_GAMMA_LUT, 0);
+}
+
 static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc = {}, crc = {};
+	int i;
 
 	/* Set a background color on the primary fb for testing */
-	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
-		igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe], DRM_PLANE_TYPE_PRIMARY), &data->gray_fb);
+	if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
+		set_lut(data, pipe);
+		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	}
 
 	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage");
 	igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	igt_pipe_crc_start(data->pipe_crc);
-	igt_pipe_crc_get_single(data->pipe_crc, &ref_crc);
+	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &ref_crc);
 
 	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Pre-multiplied");
 	igt_plane_set_fb(plane, &data->argb_fb_7e);
@@ -470,6 +502,7 @@ static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t
 	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
 	igt_assert_crc_equal(&ref_crc, &crc);
 
+	clear_lut(data, pipe);
 	igt_pipe_crc_stop(data->pipe_crc);
 }
 
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
