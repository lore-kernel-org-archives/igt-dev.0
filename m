Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6FD6E118
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 13:31:47 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Mon, 21 Jun 2021 18:52:13 +0530
Message-Id: <1624281733-24348-1-git-send-email-vidya.srinivas@intel.com>
In-Reply-To: <1624122461-19827-1-git-send-email-vidya.srinivas@intel.com>
References: <1624122461-19827-1-git-send-email-vidya.srinivas@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Use alpha for
 primary plane for coverage-vs-premult-vs-constant
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
primary plane with gray without alpha is enabled. So in order to get
the coverage vs. premult vs. constant crc to match use alpha gray buffer
for primary plane as well in coverage-vs-premult-vs-constant.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_plane_alpha_blend.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index a37cb27c7d62..ca9e1c3829ba 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -31,7 +31,7 @@ IGT_TEST_DESCRIPTION("Test plane alpha and blending mode properties");
 typedef struct {
 	int gfx_fd;
 	igt_display_t display;
-	struct igt_fb xrgb_fb, argb_fb_0, argb_fb_cov_0, argb_fb_7e, argb_fb_cov_7e, argb_fb_fc, argb_fb_cov_fc, argb_fb_100, black_fb, gray_fb;
+	struct igt_fb xrgb_fb, argb_fb_0, argb_fb_cov_0, argb_fb_7e, argb_fb_cov_7e, argb_fb_fc, argb_fb_cov_fc, argb_fb_100, black_fb, gray_fb, argb_gray_fb;
 	igt_crc_t ref_crc;
 	igt_pipe_crc_t *pipe_crc;
 } data_t;
@@ -182,6 +182,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
 		igt_remove_fb(data->gfx_fd, &data->argb_fb_100);
 		igt_remove_fb(data->gfx_fd, &data->black_fb);
 		igt_remove_fb(data->gfx_fd, &data->gray_fb);
+		igt_remove_fb(data->gfx_fd, &data->argb_gray_fb);
 
 		igt_create_fb(data->gfx_fd, w, h,
 			      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
@@ -204,6 +205,15 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
 
 		igt_create_fb(data->gfx_fd, w, h,
 			      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			      &data->argb_gray_fb);
+
+		cr = igt_get_cairo_ctx(data->gfx_fd, &data->argb_gray_fb);
+		cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
+		igt_paint_color_alpha(cr, 0, 0, w, h, .5, .5, .5, 0.0);
+		igt_put_cairo_ctx(cr);
+
+		igt_create_fb(data->gfx_fd, w, h,
+			      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
 			      &data->argb_fb_7e);
 		draw_squares(&data->argb_fb_7e, w, h, 126. / 255.);
 
@@ -449,7 +459,7 @@ static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t
 
 	/* Set a background color on the primary fb for testing */
 	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
-		igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe], DRM_PLANE_TYPE_PRIMARY), &data->gray_fb);
+		igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe], DRM_PLANE_TYPE_PRIMARY), &data->argb_gray_fb);
 
 	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage");
 	igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
@@ -471,6 +481,10 @@ static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t
 	igt_assert_crc_equal(&ref_crc, &crc);
 
 	igt_pipe_crc_stop(data->pipe_crc);
+
+	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe], DRM_PLANE_TYPE_PRIMARY), NULL);
+	igt_plane_set_fb(plane, NULL);
+	igt_display_commit2(display, COMMIT_ATOMIC);
 }
 
 static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, bool blend,
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
