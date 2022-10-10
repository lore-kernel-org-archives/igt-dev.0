Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0AB10E202
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 09:35:16 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id bn8so12586501ljb.6
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 02:35:16 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 10 Oct 2022 12:35:07 +0300
Message-Id: <20221010093507.13817-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20221010093507.13817-1-juhapekka.heikkila@gmail.com>
References: <20221010093507.13817-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_cursor_crc: reduce cpu work
 on restoring image
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

on creating reference images for crcs re-render only parts
which have changed.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_cursor_crc.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 8d3426dda..2d6b43f76 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -53,6 +53,13 @@ enum cursor_buffers {
 	MAXCURSORBUFFER
 };
 
+typedef struct {
+	int x;
+	int y;
+	int width;
+	int height;
+} cursorarea;
+
 typedef struct {
 	int drm_fd;
 	igt_display_t display;
@@ -73,6 +80,7 @@ typedef struct {
 	uint32_t devid;
 	double alpha;
 	int vblank_wait_count; /* because of msm */
+	cursorarea oldcursorarea[MAXCURSORBUFFER];
 } data_t;
 
 #define TEST_DPMS (1<<0)
@@ -83,13 +91,6 @@ typedef struct {
 #define BLUE 0.0, 0.0, 1.0
 #define WHITE 1.0, 1.0, 1.0
 
-typedef struct {
-	int x;
-	int y;
-	int width;
-	int height;
-} cursorarea;
-
 static void draw_cursor(cairo_t *cr, cursorarea *cursor, double alpha)
 {
 	int wl, wr, ht, hb;
@@ -176,11 +177,16 @@ static void restore_image(data_t *data, uint32_t buffer, cursorarea *cursor)
 	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[buffer]);
 	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
 	cairo_set_source_surface(cr, data->surface, 0, 0);
-	cairo_rectangle(cr, 0, 0, data->screenw, data->screenh);
+	cairo_rectangle(cr, data->oldcursorarea[buffer].x,
+			data->oldcursorarea[buffer].y,
+			data->oldcursorarea[buffer].width,
+			data->oldcursorarea[buffer].height);
 	cairo_fill(cr);
 
-	if (cursor)
+	if (cursor) {
 		draw_cursor(cr, cursor, data->alpha);
+		data->oldcursorarea[buffer] = *cursor;
+	}
 
 	igt_put_cairo_ctx(cr);
 }
@@ -235,7 +241,7 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
 
 			if (data->flags & TEST_SUSPEND)
 				igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
-							SUSPEND_TEST_NONE);
+							      SUSPEND_TEST_NONE);
 
 			igt_pipe_crc_start(pipe_crc);
 			igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc_after);
@@ -509,6 +515,11 @@ static void prepare_crtc(data_t *data, int cursor_w, int cursor_h)
 	data->curh = cursor_h;
 	data->refresh = mode->vrefresh;
 
+	/* initialize old cursor area to full screen so first run will copy image in place */
+	data->oldcursorarea[HWCURSORBUFFER]      = (cursorarea){0, 0, data->screenw, data->screenh};
+	data->oldcursorarea[SWCOMPARISONBUFFER1] = (cursorarea){0, 0, data->screenw, data->screenh};
+	data->oldcursorarea[SWCOMPARISONBUFFER2] = (cursorarea){0, 0, data->screenw, data->screenh};
+
 	data->surface = cairo_image_surface_create(CAIRO_FORMAT_RGB24,
 						   data->screenw,
 						   data->screenh);
-- 
2.37.3
