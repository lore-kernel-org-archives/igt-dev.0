Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5DB6E0A0
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jan 2021 08:26:22 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id i7so20815181pgc.8
 for <igt-dev@lists.freedesktop.org>; Tue, 05 Jan 2021 00:26:22 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue,  5 Jan 2021 10:25:44 +0200
Message-Id: <20210105082545.6417-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_rotation_crc: avoid
 recalculating refecence crcs
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

Get those reference crcs only once since they stay the same.

This reduces generic rotation tests execution time on my ICL from 26s to 14s

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_rotation_crc.c | 88 +++++++++++++++++++++++-----------------
 1 file changed, 50 insertions(+), 38 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index ffcc2cc2e..e160bd901 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -49,6 +49,14 @@ struct p_point{
 	float_t y;
 };
 
+enum rectangle_type {
+	rectangle,
+	square,
+	portrait,
+	landscape,
+	num_rectangle_types /* must be last */
+};
+
 typedef struct {
 	int gfx_fd;
 	igt_display_t display;
@@ -70,6 +78,12 @@ typedef struct {
 
 	bool use_native_resolution;
 	bool extended;
+
+	struct crc_rect_tag {
+		bool valid;
+		igt_crc_t ref_crc;
+		igt_crc_t flip_crc;
+	} crc_rect[num_rectangle_types];
 } data_t;
 
 typedef struct {
@@ -190,14 +204,6 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 		igt_pipe_crc_start(data->pipe_crc);
 }
 
-enum rectangle_type {
-	rectangle,
-	square,
-	portrait,
-	landscape,
-	num_rectangle_types /* must be last */
-};
-
 static void prepare_fbs(data_t *data, igt_output_t *output,
 			igt_plane_t *plane, enum rectangle_type rect, uint32_t format)
 {
@@ -266,43 +272,46 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
 	 */
 	igt_require(igt_display_has_format_mod(display, pixel_format, tiling));
 
-	/*
-	 * Create a reference software rotated flip framebuffer.
-	 */
-	igt_create_fb(data->gfx_fd, ref_w, ref_h, pixel_format, tiling,
-		      &data->fb_flip);
-	paint_squares(data, data->rotation, &data->fb_flip,
-		      flip_opacity);
-	igt_plane_set_fb(plane, &data->fb_flip);
-	if (plane->type != DRM_PLANE_TYPE_CURSOR)
-		igt_plane_set_position(plane, data->pos_x, data->pos_y);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	if (!data->crc_rect[rect].valid) {
+		/*
+		* Create a reference software rotated flip framebuffer.
+		*/
+		igt_create_fb(data->gfx_fd, ref_w, ref_h, pixel_format, tiling,
+			&data->fb_flip);
+		paint_squares(data, data->rotation, &data->fb_flip,
+			flip_opacity);
+		igt_plane_set_fb(plane, &data->fb_flip);
+		if (plane->type != DRM_PLANE_TYPE_CURSOR)
+			igt_plane_set_position(plane, data->pos_x, data->pos_y);
+		igt_display_commit2(display, COMMIT_ATOMIC);
 
-	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &data->flip_crc);
+		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &data->crc_rect[rect].flip_crc);
+		igt_remove_fb(data->gfx_fd, &data->fb_flip);
+
+		/*
+		* Create a reference CRC for a software-rotated fb.
+		*/
+		igt_create_fb(data->gfx_fd, ref_w, ref_h, pixel_format,
+			data->override_tiling ?: LOCAL_DRM_FORMAT_MOD_NONE, &data->fb_reference);
+		paint_squares(data, data->rotation, &data->fb_reference, 1.0);
+
+		igt_plane_set_fb(plane, &data->fb_reference);
+		if (plane->type != DRM_PLANE_TYPE_CURSOR)
+			igt_plane_set_position(plane, data->pos_x, data->pos_y);
+		igt_display_commit2(display, COMMIT_ATOMIC);
+
+		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &data->crc_rect[rect].ref_crc);
+		data->crc_rect[rect].valid = true;
+	}
 
 	/*
 	  * Prepare the non-rotated flip fb.
 	  */
-	igt_remove_fb(data->gfx_fd, &data->fb_flip);
 	igt_create_fb(data->gfx_fd, w, h, pixel_format, tiling,
 		      &data->fb_flip);
 	paint_squares(data, IGT_ROTATION_0, &data->fb_flip,
 		      flip_opacity);
 
-	/*
-	 * Create a reference CRC for a software-rotated fb.
-	 */
-	igt_create_fb(data->gfx_fd, ref_w, ref_h, pixel_format,
-		      data->override_tiling ?: LOCAL_DRM_FORMAT_MOD_NONE, &data->fb_reference);
-	paint_squares(data, data->rotation, &data->fb_reference, 1.0);
-
-	igt_plane_set_fb(plane, &data->fb_reference);
-	if (plane->type != DRM_PLANE_TYPE_CURSOR)
-		igt_plane_set_position(plane, data->pos_x, data->pos_y);
-	igt_display_commit2(display, COMMIT_ATOMIC);
-
-	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &data->ref_crc);
-
 	/*
 	 * Prepare the plane with an non-rotated fb let the hw rotate it.
 	 */
@@ -341,7 +350,7 @@ static void test_single_case(data_t *data, enum pipe pipe,
 
 	/* Check CRC */
 	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc_output);
-	igt_assert_crc_equal(&data->ref_crc, &crc_output);
+	igt_assert_crc_equal(&data->crc_rect[rect].ref_crc, &crc_output);
 
 	/*
 	 * If flips are requested flip to a different fb and
@@ -364,8 +373,7 @@ static void test_single_case(data_t *data, enum pipe pipe,
 		}
 		kmstest_wait_for_pageflip(data->gfx_fd);
 		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc_output);
-		igt_assert_crc_equal(&data->flip_crc,
-				     &crc_output);
+		igt_assert_crc_equal(&data->crc_rect[rect].flip_crc, &crc_output);
 	}
 }
 
@@ -396,6 +404,10 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	enum pipe pipe;
+	int c;
+
+	for (c = 0; c < num_rectangle_types; c++)
+		data->crc_rect[c].valid = false;
 
 	if (plane_type == DRM_PLANE_TYPE_CURSOR)
 		igt_require(display->has_cursor_plane);
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
