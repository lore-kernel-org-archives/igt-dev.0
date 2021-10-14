Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D0D6E1D2
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 17:39:44 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id j21so30722299lfe.0
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 10:39:44 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Thu, 14 Oct 2021 20:39:32 +0300
Message-Id: <20211014173934.12375-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20211014173934.12375-1-juhapekka.heikkila@gmail.com>
References: <20211014173934.12375-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/kms_cursor_crc: move
 create_cursor_fb above alpha tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

This is so it can be taken into use also in alpha tests. While
at it take alpha into account on fb creation by clearing alpha
to zero

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_cursor_crc.c | 50 ++++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 9faba1a18..0648a8601 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -527,6 +527,32 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
 	igt_pipe_crc_start(data->pipe_crc);
 }
 
+static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
+{
+	cairo_t *cr;
+	uint32_t fb_id;
+
+	/*
+	 * Make the FB slightly taller and leave the extra
+	 * line opaque white, so that we can see that the
+	 * hardware won't scan beyond what it should (esp.
+	 * with non-square cursors).
+	 */
+	fb_id = igt_create_color_fb(data->drm_fd, cur_w, cur_h + 1,
+				    DRM_FORMAT_ARGB8888,
+				    DRM_FORMAT_MOD_LINEAR,
+				    1.0, 1.0, 1.0,
+				    &data->fb);
+
+	igt_assert(fb_id);
+
+	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb);
+	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
+	igt_paint_color_alpha(cr, 0, 0, cur_w, cur_h, 0.0, 0.0, 0.0, 0.0);
+	draw_cursor(cr, &((cursorarea){0, 0, cur_w, cur_h}));
+	igt_put_cairo_ctx(cr);
+}
+
 static void test_cursor_alpha(data_t *data, double a)
 {
 	igt_display_t *display = &data->display;
@@ -586,30 +612,6 @@ static void test_cursor_opaque(data_t *data)
 	test_cursor_alpha(data, 1.0);
 }
 
-static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
-{
-	cairo_t *cr;
-	uint32_t fb_id;
-
-	/*
-	 * Make the FB slightly taller and leave the extra
-	 * line opaque white, so that we can see that the
-	 * hardware won't scan beyond what it should (esp.
-	 * with non-square cursors).
-	 */
-	fb_id = igt_create_color_fb(data->drm_fd, cur_w, cur_h + 1,
-				    DRM_FORMAT_ARGB8888,
-				    DRM_FORMAT_MOD_LINEAR,
-				    1.0, 1.0, 1.0,
-				    &data->fb);
-
-	igt_assert(fb_id);
-
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb);
-	draw_cursor(cr, &((cursorarea){0, 0, cur_w, cur_h}));
-	igt_put_cairo_ctx(cr);
-}
-
 static void require_cursor_size(data_t *data, int w, int h)
 {
 	igt_fb_t primary_fb;
-- 
2.28.0
