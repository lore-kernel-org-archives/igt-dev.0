Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FF489CF8
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Oct 2021 14:22:39 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id i20so191675edj.10
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Oct 2021 07:22:39 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 12 Oct 2021 17:22:24 +0300
Message-Id: <20211012142224.15632-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: fix size change and
 alpha tests
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

Unify and simplify cursor size change and cursor alpha tests.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_cursor_crc.c | 190 ++++++++++++-----------------------------
 1 file changed, 56 insertions(+), 134 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 9faba1a18..7d9ec1927 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -71,7 +71,7 @@ typedef struct {
 	igt_plane_t *cursor;
 	cairo_surface_t *surface;
 	uint32_t devid;
-	bool hwimageistestimage;
+	double alpha;
 } data_t;
 
 #define TEST_DPMS (1<<0)
@@ -89,7 +89,7 @@ typedef struct {
 	int height;
 } cursorarea;
 
-static void draw_cursor(cairo_t *cr, cursorarea *cursor)
+static void draw_cursor(cairo_t *cr, cursorarea *cursor, double alpha)
 {
 	int wl, wr, ht, hb;
 
@@ -104,13 +104,13 @@ static void draw_cursor(cairo_t *cr, cursorarea *cursor)
 	    (cursor->y < SHRT_MIN) || (cursor->y > SHRT_MAX))
 		return;
 
-	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
+	cairo_set_operator(cr, CAIRO_OPERATOR_OVER);
 	cairo_set_antialias(cr, CAIRO_ANTIALIAS_NONE);
 	/* 4 color rectangles in the corners, RGBY */
-	igt_paint_color(cr, cursor->x, cursor->y, wl, ht, RED);
-	igt_paint_color(cr, cursor->x + wl, cursor->y, wr, ht, GREEN);
-	igt_paint_color(cr, cursor->x, cursor->y + ht, wl, hb, BLUE);
-	igt_paint_color(cr, cursor->x + wl, cursor->y + ht, wr, hb, WHITE);
+	igt_paint_color_alpha(cr, cursor->x, cursor->y, wl, ht, RED, alpha);
+	igt_paint_color_alpha(cr, cursor->x + wl, cursor->y, wr, ht, GREEN, alpha);
+	igt_paint_color_alpha(cr, cursor->x, cursor->y + ht, wl, hb, BLUE, alpha);
+	igt_paint_color_alpha(cr, cursor->x + wl, cursor->y + ht, wr, hb, WHITE, alpha);
 }
 
 static void cursor_enable(data_t *data)
@@ -173,7 +173,7 @@ static void restore_image(data_t *data, uint32_t buffer, cursorarea *cursor)
 	cairo_fill(cr);
 
 	if (cursor)
-		draw_cursor(cr, cursor);
+		draw_cursor(cr, cursor, data->alpha);
 
 	igt_put_cairo_ctx(cr);
 }
@@ -445,10 +445,8 @@ static void cleanup_crtc(data_t *data)
 	igt_pipe_crc_free(data->pipe_crc);
 	data->pipe_crc = NULL;
 
-	if (data->hwimageistestimage) {
-		cairo_surface_destroy(data->surface);
-		data->surface = NULL;
-	}
+	cairo_surface_destroy(data->surface);
+	data->surface = NULL;
 
 	igt_plane_set_fb(data->primary, NULL);
 	igt_display_commit(display);
@@ -508,106 +506,72 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
 	data->curh = cursor_h;
 	data->refresh = mode->vrefresh;
 
-	if (data->hwimageistestimage) {
-		data->surface = cairo_image_surface_create(CAIRO_FORMAT_RGB24,
-							   data->screenw,
-							   data->screenh);
+	data->surface = cairo_image_surface_create(CAIRO_FORMAT_RGB24,
+							data->screenw,
+							data->screenh);
 
-		/* store test image as cairo surface */
-		cr = cairo_create(data->surface);
-		cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
-		igt_paint_test_pattern(cr, data->screenw, data->screenh);
-		cairo_destroy(cr);
+	/* store test image as cairo surface */
+	cr = cairo_create(data->surface);
+	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
+	igt_paint_test_pattern(cr, data->screenw, data->screenh);
+	cairo_destroy(cr);
 
-		/* Set HW cursor buffer in place */
-		restore_image(data, HWCURSORBUFFER, NULL);
-	} else
-		data->surface = NULL;
+	/* Set HW cursor buffer in place */
+	restore_image(data, HWCURSORBUFFER, NULL);
 
 	igt_pipe_crc_start(data->pipe_crc);
 }
 
-static void test_cursor_alpha(data_t *data, double a)
+static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
 {
-	igt_display_t *display = &data->display;
-	igt_pipe_crc_t *pipe_crc = data->pipe_crc;
-	igt_crc_t crc, ref_crc;
 	cairo_t *cr;
 	uint32_t fb_id;
-	int curw = data->curw;
-	int curh = data->curh;
 
-	/* Alpha cursor fb with white color */
-	fb_id = igt_create_fb(data->drm_fd, curw, curh,
+	/*
+	 * Make the FB slightly taller and leave the extra
+	 * line opaque white, so that we can see that the
+	 * hardware won't scan beyond what it should (esp.
+	 * with non-square cursors).
+	 */
+	fb_id = igt_create_color_fb(data->drm_fd, cur_w, cur_h + 1,
 				    DRM_FORMAT_ARGB8888,
 				    DRM_FORMAT_MOD_LINEAR,
+				    1.0, 1.0, 1.0,
 				    &data->fb);
-	igt_assert(fb_id);
 
-	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
-	igt_display_commit(display);
+	igt_assert(fb_id);
 
 	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb);
-	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
+	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
+	igt_paint_color_alpha(cr, 0, 0, cur_w, cur_h, 0.0, 0.0, 0.0, 0.0);
+	draw_cursor(cr, &((cursorarea){0, 0, cur_w, cur_h}), data->alpha);
 	igt_put_cairo_ctx(cr);
+}
 
-	/* Hardware Test - enable cursor and get PF CRC */
+static void test_cursor_alpha(data_t *data)
+{
+	igt_crc_t crc;
+
+	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
+	create_cursor_fb(data, data->curw, data->curh);
 	cursor_enable(data);
-	igt_display_commit(display);
-	igt_wait_for_vblank(data->drm_fd,
-			display->pipes[data->pipe].crtc_offset);
-	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
+	do_single_test(data, 0, 0, true, &crc);
 
 	cursor_disable(data);
 	igt_remove_fb(data->drm_fd, &data->fb);
-
-	/* Software Test - render cursor in software, drawn it directly on PF */
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[SWCOMPARISONBUFFER1]);
-	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
-	igt_put_cairo_ctx(cr);
-	igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER1]);
-	igt_display_commit(display);
-	igt_wait_for_vblank(data->drm_fd,
-			display->pipes[data->pipe].crtc_offset);
-	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
-
-	/* Compare CRC from Hardware/Software tests */
-	igt_assert_crc_equal(&crc, &ref_crc);
+	do_single_test(data, 0, 0, false, &crc);
 }
 
 static void test_cursor_transparent(data_t *data)
 {
-	test_cursor_alpha(data, 0.0);
-
+	data->alpha = 0.0;
+	test_cursor_alpha(data);
 }
 
 static void test_cursor_opaque(data_t *data)
 {
-	test_cursor_alpha(data, 1.0);
-}
-
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
+	data->alpha = 1.0;
+	test_cursor_alpha(data);
 }
 
 static void require_cursor_size(data_t *data, int w, int h)
@@ -666,60 +630,20 @@ static void run_test(data_t *data, void (*testfunc)(data_t *), int cursor_w, int
 
 static void test_cursor_size(data_t *data)
 {
-	igt_display_t *display = &data->display;
-	igt_pipe_crc_t *pipe_crc = data->pipe_crc;
-	igt_crc_t crc, ref_crc;
-	cairo_t *cr;
-	uint32_t fb_id;
-	int i, size, prevsize = 0;
-	int cursor_max_size = data->cursor_max_w;
-
-	/* Create a maximum size cursor, then change the size in flight to
-	 * smaller ones to see that the size is applied correctly
-	 */
-	fb_id = igt_create_fb(data->drm_fd, cursor_max_size, cursor_max_size,
-			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
-			      &data->fb);
-	igt_assert(fb_id);
-
-	/* Use a solid white rectangle as the cursor */
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb);
-	igt_paint_color_alpha(cr, 0, 0, cursor_max_size, cursor_max_size, 1.0, 1.0, 1.0, 1.0);
-	igt_put_cairo_ctx(cr);
+	igt_crc_t crc;
 
-	/* Hardware test loop */
-	for (i = 0, size = cursor_max_size; size >= 64; size /= 2, i++) {
+	for (data->curw = data->curh = data->cursor_max_w; data->curw >= 64;
+	     data->curw /= 2, data->curh /= 2) {
+		igt_plane_set_fb(data->primary,
+				 &data->primary_fb[HWCURSORBUFFER]);
+		create_cursor_fb(data, data->curw, data->curh);
 		cursor_enable(data);
-		/* Change size in flight: */
-		igt_plane_set_size(data->cursor, size, size);
-		igt_fb_set_size(&data->fb, data->cursor, size, size);
-		igt_display_commit(display);
-		igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
-		igt_display_commit(display);
-
-		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
+		do_single_test(data, 0, 0, true, &crc);
 
 		cursor_disable(data);
-		igt_display_commit(display);
-
-		/* Now render the same in software and collect crc */
-		cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[SWCOMPARISONBUFFER1]);
-
-		/* remove previous cursor sw image */
-		if (prevsize > 0)
-			igt_paint_color(cr, 0, 0, prevsize, prevsize, 0.0, 0.0, 0.0);
-		prevsize = size;
-
-		igt_paint_color_alpha(cr, 0, 0, size, size, 1.0, 1.0, 1.0, 1.0);
-		igt_put_cairo_ctx(cr);
-		igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER1]);
-		igt_display_commit(display);
-		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
-
-		igt_assert_crc_equal(&crc, &ref_crc);
+		igt_remove_fb(data->drm_fd, &data->fb);
+		do_single_test(data, 0, 0, false, &crc);
 	}
-
-	igt_remove_fb(data->drm_fd, &data->fb);
 }
 
 static void test_rapid_movement(data_t *data)
@@ -787,7 +711,6 @@ static void run_size_tests(data_t *data, enum pipe pipe,
 				      w, h);
 		}
 		create_cursor_fb(data, w, h);
-		data->hwimageistestimage = true;
 	}
 
 	/* Using created cursor FBs to test cursor support */
@@ -822,10 +745,10 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
 	int cursor_size;
 
 	igt_fixture {
+		data->alpha = 1.0;
 		data->pipe = pipe;
 		data->output = igt_get_single_output_for_pipe(&data->display, pipe);
 		igt_require(data->output);
-		data->hwimageistestimage = false;
 	}
 
 	igt_describe("Create a maximum size cursor, then change the size in "
@@ -847,7 +770,6 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
 
 	igt_fixture {
 		create_cursor_fb(data, data->cursor_max_w, data->cursor_max_h);
-		data->hwimageistestimage = true;
 	}
 
 	igt_subtest_f("pipe-%s-cursor-dpms", kmstest_pipe_name(pipe)) {
-- 
2.28.0
