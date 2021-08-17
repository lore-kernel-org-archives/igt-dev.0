Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882386E11C
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Aug 2021 09:27:30 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id x27so40145926lfu.5
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Aug 2021 02:27:30 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 17 Aug 2021 12:27:23 +0300
Message-Id: <20210817092724.16512-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_cursor_crc: Separate hw and
 sw runs on tests
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

Reset display structure settings and commit them in before starting
test in case some earlier test left tail.

Separate hw and sw test runs for optimizing test.

Simple cleanup.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_cursor_crc.c | 404 +++++++++++++++++++++++++----------------
 1 file changed, 251 insertions(+), 153 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index a9bc3a745..f478ae08d 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -46,10 +46,17 @@ IGT_TEST_DESCRIPTION(
 #define DRM_CAP_CURSOR_HEIGHT 0x9
 #endif
 
+enum cursor_buffers {
+	HWCURSORBUFFER,
+	SWCOMPARISONBUFFER1,
+	SWCOMPARISONBUFFER2,
+	MAXCURSORBUFFER
+};
+
 typedef struct {
 	int drm_fd;
 	igt_display_t display;
-	struct igt_fb primary_fb[2];
+	struct igt_fb primary_fb[MAXCURSORBUFFER];
 	struct igt_fb fb;
 	igt_output_t *output;
 	enum pipe pipe;
@@ -70,29 +77,40 @@ typedef struct {
 #define TEST_DPMS (1<<0)
 #define TEST_SUSPEND (1<<1)
 
-#define HWCURSORBUFFER 0
-#define SWCOMPARISONBUFFER 1
+#define RED 1.0, 0.0, 0.0
+#define GREEN 0.0, 1.0, 0.0
+#define BLUE 0.0, 0.0, 1.0
+#define WHITE 1.0, 1.0, 1.0
+
+typedef struct {
+	int x;
+	int y;
+	int width;
+	int height;
+} cursorarea;
 
-static void draw_cursor(cairo_t *cr, int x, int y, int cw, int ch, double a)
+static void draw_cursor(cairo_t *cr, cursorarea *cursor)
 {
 	int wl, wr, ht, hb;
 
 	/* deal with odd cursor width/height */
-	wl = cw / 2;
-	wr = (cw + 1) / 2;
-	ht = ch / 2;
-	hb = (ch + 1) / 2;
+	wl = cursor->width / 2;
+	wr = (cursor->width + 1) / 2;
+	ht = cursor->height / 2;
+	hb = (cursor->height + 1) / 2;
 
 	/* Cairo doesn't like to be fed numbers that are too wild */
-	if ((x < SHRT_MIN) || (x > SHRT_MAX) || (y < SHRT_MIN) || (y > SHRT_MAX))
+	if ((cursor->x < SHRT_MIN) || (cursor->x > SHRT_MAX) ||
+	    (cursor->y < SHRT_MIN) || (cursor->y > SHRT_MAX))
 		return;
+
 	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
 	cairo_set_antialias(cr, CAIRO_ANTIALIAS_NONE);
 	/* 4 color rectangles in the corners, RGBY */
-	igt_paint_color_alpha(cr, x,      y,      wl, ht, 1.0, 0.0, 0.0, a);
-	igt_paint_color_alpha(cr, x + wl, y,      wr, ht, 0.0, 1.0, 0.0, a);
-	igt_paint_color_alpha(cr, x,      y + ht, wl, hb, 0.0, 0.0, 1.0, a);
-	igt_paint_color_alpha(cr, x + wl, y + ht, wr, hb, 1.0, 1.0, 1.0, a);
+	igt_paint_color(cr, cursor->x, cursor->y, wl, ht, RED);
+	igt_paint_color(cr, cursor->x + wl, cursor->y, wr, ht, GREEN);
+	igt_paint_color(cr, cursor->x, cursor->y + ht, wl, hb, BLUE);
+	igt_paint_color(cr, cursor->x + wl, cursor->y + ht, wr, hb, WHITE);
 }
 
 static void cursor_enable(data_t *data)
@@ -144,7 +162,7 @@ static bool cursor_visible(data_t *data, int x, int y)
 	return true;
 }
 
-static void restore_image(data_t *data, uint32_t buffer)
+static void restore_image(data_t *data, uint32_t buffer, cursorarea *cursor)
 {
 	cairo_t *cr;
 
@@ -153,80 +171,84 @@ static void restore_image(data_t *data, uint32_t buffer)
 	cairo_set_source_surface(cr, data->surface, 0, 0);
 	cairo_rectangle(cr, 0, 0, data->screenw, data->screenh);
 	cairo_fill(cr);
+
+	if (cursor)
+		draw_cursor(cr, cursor);
+
 	igt_put_cairo_ctx(cr);
 }
 
-static void do_single_test(data_t *data, int x, int y)
+static void do_single_test(data_t *data, int x, int y, bool hw_test,
+			   igt_crc_t *hwcrc)
 {
 	igt_display_t *display = &data->display;
 	igt_pipe_crc_t *pipe_crc = data->pipe_crc;
-	igt_crc_t crc, ref_crc;
-	cairo_t *cr;
-	int ret = 0;
+	igt_crc_t crc;
+	int ret = 0, swbufidx;
 
 	igt_print_activity();
 
-	/* Hardware test */
-	igt_plane_set_position(data->cursor, x, y);
-	cursor_enable(data);
+	if (hw_test) {
+		/* Hardware test */
+		igt_plane_set_position(data->cursor, x, y);
 
-	if (chv_cursor_broken(data, x) && cursor_visible(data, x, y)) {
-		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
-		igt_assert_eq(ret, -EINVAL);
-		igt_plane_set_position(data->cursor, 0, y);
-		return;
-	}
+		if (chv_cursor_broken(data, x) && cursor_visible(data, x, y)) {
+			ret = igt_display_try_commit2(display, COMMIT_LEGACY);
+			igt_assert_eq(ret, -EINVAL);
+			igt_plane_set_position(data->cursor, 0, y);
+			return;
+		}
 
-	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
-	igt_display_commit(display);
+		igt_display_commit(display);
 
-	/* Extra vblank wait is because nonblocking cursor ioctl */
-	igt_wait_for_vblank(data->drm_fd,
-			    display->pipes[data->pipe].crtc_offset);
+		/* Extra vblank wait is because nonblocking cursor ioctl */
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[data->pipe].crtc_offset);
 
-	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
-	restore_image(data, SWCOMPARISONBUFFER);
+		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, hwcrc);
 
-	if (data->flags & (TEST_DPMS | TEST_SUSPEND)) {
-		igt_crc_t crc_after;
-		/*
-		 * stop/start crc to avoid dmesg notifications about userspace
-		 * reading too slow.
-		 */
-		igt_pipe_crc_stop(pipe_crc);
-
-		if (data->flags & TEST_DPMS) {
-			igt_debug("dpms off/on cycle\n");
-			kmstest_set_connector_dpms(data->drm_fd,
-						   data->output->config.connector,
-						   DRM_MODE_DPMS_OFF);
-			kmstest_set_connector_dpms(data->drm_fd,
-						   data->output->config.connector,
-						   DRM_MODE_DPMS_ON);
+		if (data->flags & (TEST_DPMS | TEST_SUSPEND)) {
+			igt_crc_t crc_after;
+			/*
+			* stop/start crc to avoid dmesg notifications about userspace
+			* reading too slow.
+			*/
+			igt_pipe_crc_stop(pipe_crc);
+
+			if (data->flags & TEST_DPMS) {
+				igt_debug("dpms off/on cycle\n");
+				kmstest_set_connector_dpms(data->drm_fd,
+							data->output->config.connector,
+							DRM_MODE_DPMS_OFF);
+				kmstest_set_connector_dpms(data->drm_fd,
+							data->output->config.connector,
+							DRM_MODE_DPMS_ON);
+			}
+
+			if (data->flags & TEST_SUSPEND)
+				igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+							SUSPEND_TEST_NONE);
+
+			igt_pipe_crc_start(pipe_crc);
+			igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc_after);
+			igt_assert_crc_equal(hwcrc, &crc_after);
 		}
+	} else {
+		/* Now render the same in software and collect crc */
+		swbufidx = (data->primary->drm_plane->fb_id ==
+			    data->primary_fb[SWCOMPARISONBUFFER1].fb_id) ?
+			    SWCOMPARISONBUFFER2 : SWCOMPARISONBUFFER1;
 
-		if (data->flags & TEST_SUSPEND)
-			igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
-						      SUSPEND_TEST_NONE);
-
-		igt_pipe_crc_start(pipe_crc);
-		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc_after);
-		igt_assert_crc_equal(&crc, &crc_after);
-	}
-
-	/* Now render the same in software and collect crc */
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[SWCOMPARISONBUFFER]);
-	draw_cursor(cr, x, y, data->curw, data->curh, 1.0);
-	igt_put_cairo_ctx(cr);
-	igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER]);
-	cursor_disable(data);
-	igt_display_commit(display);
+		restore_image(data, swbufidx, &((cursorarea){x, y, data->curw, data->curh}));
+		igt_plane_set_fb(data->primary, &data->primary_fb[swbufidx]);
 
-	igt_wait_for_vblank(data->drm_fd,
-			display->pipes[data->pipe].crtc_offset);
+		igt_display_commit(display);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[data->pipe].crtc_offset);
 
-	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
-	igt_assert_crc_equal(&crc, &ref_crc);
+		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
+		igt_assert_crc_equal(&crc, hwcrc);
+	}
 }
 
 static void do_fail_test(data_t *data, int x, int y, int expect)
@@ -248,70 +270,112 @@ static void do_fail_test(data_t *data, int x, int y, int expect)
 	igt_assert_eq(ret, expect);
 }
 
-static void do_test(data_t *data,
-		    int left, int right, int top, int bottom)
+static void do_test(data_t *data, const cursorarea *coords, igt_crc_t crc[4],
+		    bool hwtest)
 {
-	do_single_test(data, left, top);
-	do_single_test(data, right, top);
-	do_single_test(data, right, bottom);
-	do_single_test(data, left, bottom);
+	do_single_test(data, coords->x, coords->width, hwtest, &crc[0]);
+	do_single_test(data, coords->y, coords->width, hwtest, &crc[1]);
+	do_single_test(data, coords->y, coords->height, hwtest, &crc[2]);
+	do_single_test(data, coords->x, coords->height, hwtest, &crc[3]);
 }
 
 static void test_crc_onscreen(data_t *data)
 {
-	int left = data->left;
-	int right = data->right;
-	int top = data->top;
-	int bottom = data->bottom;
-	int cursor_w = data->curw;
-	int cursor_h = data->curh;
-
-	/* fully inside  */
-	do_test(data, left, right, top, bottom);
-
-	/* 2 pixels inside */
-	do_test(data, left - (cursor_w-2), right + (cursor_w-2), top               , bottom               );
-	do_test(data, left               , right               , top - (cursor_h-2), bottom + (cursor_h-2));
-	do_test(data, left - (cursor_w-2), right + (cursor_w-2), top - (cursor_h-2), bottom + (cursor_h-2));
-
-	/* 1 pixel inside */
-	do_test(data, left - (cursor_w-1), right + (cursor_w-1), top               , bottom               );
-	do_test(data, left               , right               , top - (cursor_h-1), bottom + (cursor_h-1));
-	do_test(data, left - (cursor_w-1), right + (cursor_w-1), top - (cursor_h-1), bottom + (cursor_h-1));
+	const int left = data->left;
+	const int right = data->right;
+	const int top = data->top;
+	const int bottom = data->bottom;
+	const int cursor_w = data->curw;
+	const int cursor_h = data->curh;
+
+	struct {
+		const cursorarea coords;
+		igt_crc_t crc[4];
+	} tests[] = {
+		/* fully inside  */
+		{{left, right, top, bottom}},
+		/* 2 pixels inside */
+		{{left - (cursor_w - 2), right + (cursor_w - 2), top, bottom}},
+		{{left, right, top - (cursor_h - 2), bottom + (cursor_h - 2)}},
+		{{left - (cursor_w - 2), right + (cursor_w - 2),
+		  top - (cursor_h - 2), bottom + (cursor_h - 2)}},
+		/* 1 pixel inside */
+		{{left - (cursor_w - 1), right + (cursor_w - 1), top, bottom}},
+		{{left, right, top - (cursor_h - 1), bottom + (cursor_h - 1)}},
+		{{left - (cursor_w - 1), right + (cursor_w - 1),
+		  top - (cursor_h - 1), bottom + (cursor_h - 1)}},
+	};
+
+	/* HW test */
+	cursor_enable(data);
+	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
+	for (int i = 0; i < ARRAY_SIZE(tests); i++)
+		do_test(data, &tests[i].coords, tests[i].crc, true);
+
+	/* SW test */
+	cursor_disable(data);
+	for (int i = 0; i < ARRAY_SIZE(tests); i++)
+		do_test(data, &tests[i].coords, tests[i].crc, false);
 }
 
 static void test_crc_offscreen(data_t *data)
 {
-	int left = data->left;
-	int right = data->right;
-	int top = data->top;
-	int bottom = data->bottom;
-	int cursor_w = data->curw;
-	int cursor_h = data->curh;
-
-	/* fully outside */
-	do_test(data, left - (cursor_w), right + (cursor_w), top             , bottom             );
-	do_test(data, left             , right             , top - (cursor_h), bottom + (cursor_h));
-	do_test(data, left - (cursor_w), right + (cursor_w), top - (cursor_h), bottom + (cursor_h));
-
-	/* fully outside by 1 extra pixels */
-	do_test(data, left - (cursor_w+1), right + (cursor_w+1), top               , bottom               );
-	do_test(data, left               , right               , top - (cursor_h+1), bottom + (cursor_h+1));
-	do_test(data, left - (cursor_w+1), right + (cursor_w+1), top - (cursor_h+1), bottom + (cursor_h+1));
-
-	/* fully outside by 2 extra pixels */
-	do_test(data, left - (cursor_w+2), right + (cursor_w+2), top               , bottom               );
-	do_test(data, left               , right               , top - (cursor_h+2), bottom + (cursor_h+2));
-	do_test(data, left - (cursor_w+2), right + (cursor_w+2), top - (cursor_h+2), bottom + (cursor_h+2));
-
-	/* fully outside by a lot of extra pixels */
-	do_test(data, left - (cursor_w+512), right + (cursor_w+512), top                 , bottom                 );
-	do_test(data, left                 , right                 , top - (cursor_h+512), bottom + (cursor_h+512));
-	do_test(data, left - (cursor_w+512), right + (cursor_w+512), top - (cursor_h+512), bottom + (cursor_h+512));
-
-	/* go nuts */
-	do_test(data, INT_MIN, INT_MAX - cursor_w, INT_MIN, INT_MAX - cursor_h);
-	do_test(data, SHRT_MIN, SHRT_MAX, SHRT_MIN, SHRT_MAX);
+	const int left = data->left;
+	const int right = data->right;
+	const int top = data->top;
+	const int bottom = data->bottom;
+	const int cursor_w = data->curw;
+	const int cursor_h = data->curh;
+
+	struct {
+		const cursorarea coords;
+		igt_crc_t crc[4];
+	} tests[] = {
+		/* fully outside */
+		{{left - (cursor_w), right + (cursor_w), top, bottom}},
+		{{left, right, top - (cursor_h), bottom + (cursor_h)}},
+		{{left - (cursor_w), right + (cursor_w), top - (cursor_h),
+		  bottom + (cursor_h)}},
+		/* fully outside by 1 extra pixels */
+		{{left - (cursor_w + 1), right + (cursor_w + 1), top, bottom}},
+		{{left, right, top - (cursor_h + 1), bottom + (cursor_h + 1)}},
+		{{left - (cursor_w + 1), right + (cursor_w + 1),
+		  top - (cursor_h + 1), bottom + (cursor_h + 1)}},
+		/* fully outside by 2 extra pixels */
+		{{left - (cursor_w + 2), right + (cursor_w + 2), top, bottom}},
+		{{left, right, top - (cursor_h + 2), bottom + (cursor_h + 2)}},
+		{{left - (cursor_w + 2), right + (cursor_w + 2),
+		  top - (cursor_h + 2), bottom + (cursor_h + 2)}},
+		/* fully outside by a lot of extra pixels */
+		{{left - (cursor_w + 512), right + (cursor_w + 512), top, bottom}},
+		{{left, right, top - (cursor_h + 512), bottom + (cursor_h + 512)}},
+		{{left - (cursor_w + 512), right + (cursor_w + 512),
+		  top - (cursor_h + 512), bottom + (cursor_h + 512)}},
+		/* go nuts */
+		{{INT_MIN, INT_MAX - cursor_w, INT_MIN, INT_MAX - cursor_h}},
+		{{SHRT_MIN, SHRT_MAX, SHRT_MIN, SHRT_MAX}},
+	};
+
+	/* HW test */
+	cursor_enable(data);
+	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
+	for (int i = 0; i < ARRAY_SIZE(tests); i++)
+		do_test(data, &tests[i].coords, tests[i].crc, true);
+
+	/* SW test */
+	cursor_disable(data);
+	/*
+	 * all these crc's should be the same, actually render only first image
+	 * to check crc and then compare rest of crc are matching
+	 */
+	do_test(data, &tests[0].coords, tests[0].crc, false);
+
+	for (int i = 1; i < ARRAY_SIZE(tests); i++) {
+		igt_assert_crc_equal(&tests[0].crc[0], &tests[i].crc[0]);
+		igt_assert_crc_equal(&tests[0].crc[0], &tests[i].crc[1]);
+		igt_assert_crc_equal(&tests[0].crc[0], &tests[i].crc[2]);
+		igt_assert_crc_equal(&tests[0].crc[0], &tests[i].crc[3]);
+	}
 
 	/* Make sure we get -ERANGE on integer overflow */
 	do_fail_test(data, INT_MAX - cursor_w + 1, INT_MAX - cursor_h + 1, -ERANGE);
@@ -320,29 +384,57 @@ static void test_crc_offscreen(data_t *data)
 static void test_crc_sliding(data_t *data)
 {
 	int i;
+	struct {
+		igt_crc_t crc[3];
+	} rounds[16] = {};
 
 	/* Make sure cursor moves smoothly and pixel-by-pixel, and that there are
 	 * no alignment issues. Horizontal, vertical and diagonal test.
 	 */
-	for (i = 0; i < 16; i++) {
-		do_single_test(data, i, 0);
-		do_single_test(data, 0, i);
-		do_single_test(data, i, i);
+
+	/* HW test */
+	cursor_enable(data);
+	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
+
+	for (i = 0; i < ARRAY_SIZE(rounds); i++) {
+		do_single_test(data, i, 0, true, &rounds[i].crc[0]);
+		do_single_test(data, 0, i, true, &rounds[i].crc[1]);
+		do_single_test(data, i, i, true, &rounds[i].crc[2]);
+	}
+
+	/* SW test */
+	cursor_disable(data);
+	for (i = 0; i < ARRAY_SIZE(rounds); i++) {
+		do_single_test(data, i, 0, false, &rounds[i].crc[0]);
+		do_single_test(data, 0, i, false, &rounds[i].crc[1]);
+		do_single_test(data, i, i, false, &rounds[i].crc[2]);
 	}
 }
 
 static void test_crc_random(data_t *data)
 {
-	int i, max;
+	igt_crc_t crc[50];
+	int i, max, x[ARRAY_SIZE(crc)], y[ARRAY_SIZE(crc)];
 
-	max = data->flags & (TEST_DPMS | TEST_SUSPEND) ? 2 : 50;
+	max = data->flags & (TEST_DPMS | TEST_SUSPEND) ? 2 : ARRAY_SIZE(crc);
 
 	/* Random cursor placement */
+
+	/* HW test */
+	cursor_enable(data);
+	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
+
 	for (i = 0; i < max; i++) {
-		int x = rand() % (data->screenw + data->curw * 2) - data->curw;
-		int y = rand() % (data->screenh + data->curh * 2) - data->curh;
-		do_single_test(data, x, y);
+		x[i] = rand() % (data->screenw + data->curw * 2) - data->curw;
+		y[i] = rand() % (data->screenh + data->curh * 2) - data->curh;
+		do_single_test(data, x[i], y[i], true, &crc[i]);
 	}
+
+	/* SW test */
+	cursor_disable(data);
+	for (i = 0; i < max; i++)
+		do_single_test(data, x[i], y[i], false, &crc[i]);
+
 }
 
 static void cleanup_crtc(data_t *data)
@@ -362,7 +454,8 @@ static void cleanup_crtc(data_t *data)
 	igt_display_commit(display);
 
 	igt_remove_fb(data->drm_fd, &data->primary_fb[HWCURSORBUFFER]);
-	igt_remove_fb(data->drm_fd, &data->primary_fb[SWCOMPARISONBUFFER]);
+	igt_remove_fb(data->drm_fd, &data->primary_fb[SWCOMPARISONBUFFER1]);
+	igt_remove_fb(data->drm_fd, &data->primary_fb[SWCOMPARISONBUFFER2]);
 
 	igt_display_reset(display);
 }
@@ -379,22 +472,22 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
 
 	/* create and set the primary plane fbs */
 	mode = igt_output_get_mode(output);
-	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
-			    0.0, 0.0, 0.0,
-			    &data->primary_fb[HWCURSORBUFFER]);
-
-	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
-			    0.0, 0.0, 0.0,
-			    &data->primary_fb[SWCOMPARISONBUFFER]);
+	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+		      &data->primary_fb[HWCURSORBUFFER]);
+
+	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+		      &data->primary_fb[SWCOMPARISONBUFFER1]);
+
+	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+		      &data->primary_fb[SWCOMPARISONBUFFER2]);
 
 	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	data->cursor = igt_output_get_plane_type(output, DRM_PLANE_TYPE_CURSOR);
 
-	igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER]);
+	igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER1]);
 
 	igt_display_commit(display);
 
@@ -427,7 +520,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
 		cairo_destroy(cr);
 
 		/* Set HW cursor buffer in place */
-			restore_image(data, HWCURSORBUFFER);
+		restore_image(data, HWCURSORBUFFER, NULL);
 	} else
 		data->surface = NULL;
 
@@ -469,10 +562,10 @@ static void test_cursor_alpha(data_t *data, double a)
 	igt_remove_fb(data->drm_fd, &data->fb);
 
 	/* Software Test - render cursor in software, drawn it directly on PF */
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[SWCOMPARISONBUFFER]);
+	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[SWCOMPARISONBUFFER1]);
 	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
 	igt_put_cairo_ctx(cr);
-	igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER]);
+	igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER1]);
 	igt_display_commit(display);
 	igt_wait_for_vblank(data->drm_fd,
 			display->pipes[data->pipe].crtc_offset);
@@ -513,7 +606,7 @@ static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
 	igt_assert(fb_id);
 
 	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb);
-	draw_cursor(cr, 0, 0, cur_w, cur_h, 1.0);
+	draw_cursor(cr, &((cursorarea){0, 0, cur_w, cur_h}));
 	igt_put_cairo_ctx(cr);
 }
 
@@ -610,7 +703,7 @@ static void test_cursor_size(data_t *data)
 		igt_display_commit(display);
 
 		/* Now render the same in software and collect crc */
-		cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[SWCOMPARISONBUFFER]);
+		cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[SWCOMPARISONBUFFER1]);
 
 		/* remove previous cursor sw image */
 		if (prevsize > 0)
@@ -619,7 +712,7 @@ static void test_cursor_size(data_t *data)
 
 		igt_paint_color_alpha(cr, 0, 0, size, size, 1.0, 1.0, 1.0, 1.0);
 		igt_put_cairo_ctx(cr);
-		igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER]);
+		igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER1]);
 		igt_display_commit(display);
 		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
 
@@ -657,6 +750,8 @@ static void test_rapid_movement(data_t *data)
 	}
 	gettimeofday(&end, NULL);
 
+	cursor_disable(data);
+
 	/*
 	 * We've done 400 cursor updates now.  If we're being throttled to
 	 * vblank, then that would take roughly 400/refresh seconds.  If the
@@ -813,6 +908,9 @@ igt_main
 		igt_require_pipe_crc(data.drm_fd);
 
 		igt_display_require(&data.display, data.drm_fd);
+		igt_display_reset(&data.display);
+		igt_display_commit2(&data.display, data.display.is_atomic ?
+				    COMMIT_ATOMIC : COMMIT_LEGACY);
 	}
 
 	data.cursor_max_w = cursor_width;
-- 
2.28.0
