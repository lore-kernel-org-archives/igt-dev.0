Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EC66E950
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 19:32:04 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id i26so12482993lfl.1
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 12:32:04 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 23 Mar 2021 21:31:59 +0200
Message-Id: <20210323193159.25040-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: use flipping instead
 of frontbuffer
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

take out frontbuffer usage from this test as it may fail this test
on frontbuffer related issues instead of cursor issues

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_cursor_crc.c | 94 ++++++++++++++++++++++--------------------
 1 file changed, 49 insertions(+), 45 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 3541ea066..1439987f3 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -70,8 +70,8 @@ typedef struct {
 #define TEST_DPMS (1<<0)
 #define TEST_SUSPEND (1<<1)
 
-#define FRONTBUFFER 0
-#define RESTOREBUFFER 1
+#define HWCURSORBUFFER 0
+#define SWCOMPARISONBUFFER 1
 
 static void draw_cursor(cairo_t *cr, int x, int y, int cw, int ch, double a)
 {
@@ -144,22 +144,16 @@ static bool cursor_visible(data_t *data, int x, int y)
 	return true;
 }
 
-static void restore_image(data_t *data)
+static void restore_image(data_t *data, uint32_t buffer)
 {
 	cairo_t *cr;
-	igt_display_t *display = &data->display;
 
-	/* rendercopy stripped in igt using cairo */
-	cr = igt_get_cairo_ctx(data->drm_fd,
-			       &data->primary_fb[FRONTBUFFER]);
+	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[buffer]);
 	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
 	cairo_set_source_surface(cr, data->surface, 0, 0);
 	cairo_rectangle(cr, 0, 0, data->screenw, data->screenh);
 	cairo_fill(cr);
 	igt_put_cairo_ctx(cr);
-	igt_dirty_fb(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
-	igt_wait_for_vblank(data->drm_fd,
-			    display->pipes[data->pipe].crtc_offset);
 }
 
 static void do_single_test(data_t *data, int x, int y)
@@ -168,13 +162,11 @@ static void do_single_test(data_t *data, int x, int y)
 	igt_pipe_crc_t *pipe_crc = data->pipe_crc;
 	igt_crc_t crc, ref_crc;
 	cairo_t *cr;
-	int ret = 0;
+	int ret = 0, hwcursorframe;
 
 	igt_print_activity();
 
 	/* Hardware test */
-	restore_image(data);
-
 	igt_plane_set_position(data->cursor, x, y);
 	cursor_enable(data);
 
@@ -182,19 +174,21 @@ static void do_single_test(data_t *data, int x, int y)
 		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
 		igt_assert_eq(ret, -EINVAL);
 		igt_plane_set_position(data->cursor, 0, y);
-
 		return;
 	}
 
 	igt_display_commit(display);
 
-	/* Extra vblank wait is because nonblocking cursor ioctl */
-	igt_wait_for_vblank(data->drm_fd,
-			display->pipes[data->pipe].crtc_offset);
-	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
+	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
+	igt_display_commit(display);
+
+	hwcursorframe = kmstest_get_vblank(data->drm_fd, data->pipe, 0) + 1;
+	restore_image(data, SWCOMPARISONBUFFER);
 
 	if (data->flags & (TEST_DPMS | TEST_SUSPEND)) {
 		igt_crc_t crc_after;
+		/* Extra vblank wait to build full crc before dpms/suspend */
+		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
 		/*
 		 * stop/start crc to avoid dmesg notifications about userspace
 		 * reading too slow.
@@ -223,14 +217,14 @@ static void do_single_test(data_t *data, int x, int y)
 	cursor_disable(data);
 
 	/* Now render the same in software and collect crc */
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
+	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[SWCOMPARISONBUFFER]);
 	draw_cursor(cr, x, y, data->curw, data->curh, 1.0);
 	igt_put_cairo_ctx(cr);
+	igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER]);
 	igt_display_commit(display);
-	igt_dirty_fb(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
-	/* Extra vblank wait is because nonblocking cursor ioctl */
-	igt_wait_for_vblank(data->drm_fd,
-			display->pipes[data->pipe].crtc_offset);
+
+	if (!(data->flags & (TEST_DPMS | TEST_SUSPEND)))
+		igt_pipe_crc_get_for_frame(data->drm_fd, pipe_crc, hwcursorframe, &crc);
 
 	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
 	igt_assert_crc_equal(&crc, &ref_crc);
@@ -244,8 +238,6 @@ static void do_fail_test(data_t *data, int x, int y, int expect)
 	igt_print_activity();
 
 	/* Hardware test */
-	restore_image(data);
-
 	cursor_enable(data);
 	igt_plane_set_position(data->cursor, x, y);
 	ret = igt_display_try_commit2(display, COMMIT_LEGACY);
@@ -367,8 +359,8 @@ static void cleanup_crtc(data_t *data)
 	igt_plane_set_fb(data->primary, NULL);
 	igt_display_commit(display);
 
-	igt_remove_fb(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
-	igt_remove_fb(data->drm_fd, &data->primary_fb[RESTOREBUFFER]);
+	igt_remove_fb(data->drm_fd, &data->primary_fb[HWCURSORBUFFER]);
+	igt_remove_fb(data->drm_fd, &data->primary_fb[SWCOMPARISONBUFFER]);
 
 	igt_display_reset(display);
 }
@@ -389,18 +381,18 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
 			    DRM_FORMAT_XRGB8888,
 			    LOCAL_DRM_FORMAT_MOD_NONE,
 			    0.0, 0.0, 0.0,
-			    &data->primary_fb[FRONTBUFFER]);
+			    &data->primary_fb[HWCURSORBUFFER]);
 
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
 			    LOCAL_DRM_FORMAT_MOD_NONE,
 			    0.0, 0.0, 0.0,
-			    &data->primary_fb[RESTOREBUFFER]);
+			    &data->primary_fb[SWCOMPARISONBUFFER]);
 
 	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	data->cursor = igt_output_get_plane_type(output, DRM_PLANE_TYPE_CURSOR);
 
-	igt_plane_set_fb(data->primary, &data->primary_fb[FRONTBUFFER]);
+	igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER]);
 
 	igt_display_commit(display);
 
@@ -428,6 +420,10 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
 	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
 	igt_paint_test_pattern(cr, data->screenw, data->screenh);
 	cairo_destroy(cr);
+
+	/* Set HW cusor buffer in place */
+	restore_image(data, HWCURSORBUFFER);
+
 	igt_pipe_crc_start(data->pipe_crc);
 }
 
@@ -447,6 +443,15 @@ static void test_cursor_alpha(data_t *data, double a)
 				    LOCAL_DRM_FORMAT_MOD_NONE,
 				    &data->fb);
 	igt_assert(fb_id);
+
+	/* empty buffer */
+	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[HWCURSORBUFFER]);
+	igt_paint_color(cr, 0, 0, data->screenw, data->screenh,
+			0.0, 0.0, 0.0);
+	igt_put_cairo_ctx(cr);
+	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
+	igt_display_commit(display);
+
 	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb);
 	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
 	igt_put_cairo_ctx(cr);
@@ -462,23 +467,15 @@ static void test_cursor_alpha(data_t *data, double a)
 	igt_remove_fb(data->drm_fd, &data->fb);
 
 	/* Software Test - render cursor in software, drawn it directly on PF */
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
+	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[SWCOMPARISONBUFFER]);
 	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
 	igt_put_cairo_ctx(cr);
-
+	igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER]);
 	igt_display_commit(display);
-	igt_wait_for_vblank(data->drm_fd,
-			display->pipes[data->pipe].crtc_offset);
 	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
 
 	/* Compare CRC from Hardware/Software tests */
 	igt_assert_crc_equal(&crc, &ref_crc);
-
-	/*Clear Screen*/
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
-	igt_paint_color(cr, 0, 0, data->screenw, data->screenh,
-			0.0, 0.0, 0.0);
-	igt_put_cairo_ctx(cr);
 }
 
 static void test_cursor_transparent(data_t *data)
@@ -563,6 +560,11 @@ static void test_cursor_size(data_t *data)
 			      &data->fb);
 	igt_assert(fb_id);
 
+	/* empty buffer */
+	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[HWCURSORBUFFER]);
+	igt_paint_color(cr, 0, 0, data->screenw, data->screenh, 0.0, 0.0, 0.0);
+	igt_put_cairo_ctx(cr);
+
 	/* Use a solid white rectangle as the cursor */
 	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb);
 	igt_paint_color_alpha(cr, 0, 0, cursor_max_size, cursor_max_size, 1.0, 1.0, 1.0, 1.0);
@@ -585,16 +587,18 @@ static void test_cursor_size(data_t *data)
 	/* Software test loop */
 	for (i = 0, size = cursor_max_size; size >= 64; size /= 2, i++) {
 		/* Now render the same in software and collect crc */
-		cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
+		cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[HWCURSORBUFFER]);
 		igt_paint_color_alpha(cr, 0, 0, size, size, 1.0, 1.0, 1.0, 1.0);
 		igt_put_cairo_ctx(cr);
-
+		igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
 		igt_display_commit(display);
-		igt_wait_for_vblank(data->drm_fd,
-				display->pipes[data->pipe].crtc_offset);
 		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
+
 		/* Clear screen afterwards */
-		cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
+		igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER]);
+		igt_display_commit(display);
+
+		cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[HWCURSORBUFFER]);
 		igt_paint_color(cr, 0, 0, data->screenw, data->screenh,
 				0.0, 0.0, 0.0);
 		igt_put_cairo_ctx(cr);
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
