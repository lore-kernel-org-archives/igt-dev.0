Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C422A6E8B0
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2020 13:27:13 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id ep11so1146723pjb.2
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2020 05:27:13 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Thu, 27 Feb 2020 15:27:03 +0200
Message-Id: <1582810023-28424-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_rotation_crc: remove redundant
 work
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

removed fb does not take part into final crc comparisons.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_rotation_crc.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 58bebf3..164eade 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -54,7 +54,6 @@ typedef struct {
 	igt_display_t display;
 	struct igt_fb fb;
 	struct igt_fb fb_reference;
-	struct igt_fb fb_unrotated;
 	struct igt_fb fb_flip;
 	igt_crc_t ref_crc;
 	igt_crc_t flip_crc;
@@ -156,7 +155,6 @@ static void remove_fbs(data_t *data)
 {
 	igt_remove_fb(data->gfx_fd, &data->fb);
 	igt_remove_fb(data->gfx_fd, &data->fb_reference);
-	igt_remove_fb(data->gfx_fd, &data->fb_unrotated);
 	igt_remove_fb(data->gfx_fd, &data->fb_flip);
 }
 
@@ -306,17 +304,6 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
 	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &data->ref_crc);
 
 	/*
-	 * Prepare the non-rotated reference fb.
-	 */
-	igt_create_fb(data->gfx_fd, ref_w, ref_h, pixel_format, tiling, &data->fb_unrotated);
-	paint_squares(data, IGT_ROTATION_0, &data->fb_unrotated, 1.0);
-	igt_plane_set_fb(plane, &data->fb_unrotated);
-	igt_plane_set_rotation(plane, IGT_ROTATION_0);
-	if (plane->type != DRM_PLANE_TYPE_CURSOR)
-		igt_plane_set_position(plane, data->pos_x, data->pos_y);
-	igt_display_commit2(display, COMMIT_ATOMIC);
-
-	/*
 	 * Prepare the plane with an non-rotated fb let the hw rotate it.
 	 */
 	igt_create_fb(data->gfx_fd, w, h, pixel_format, tiling, &data->fb);
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
