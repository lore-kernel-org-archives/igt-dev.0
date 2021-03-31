Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCA16EB5C
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Mar 2021 18:31:43 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id w28so9540481lfn.2
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Mar 2021 11:31:43 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Wed, 31 Mar 2021 21:31:17 +0300
Message-Id: <20210331183117.551-1-juhapekka.heikkila@gmail.com>
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

v2(vsyrjala): fix cursor size change test to run only one loop

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_cursor_crc.c | 151 ++++++++++++++++++++++-------------------
 1 file changed, 80 insertions(+), 71 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 2619e15e0..9bb96d79e 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -64,14 +64,14 @@ typedef struct {
 	igt_plane_t *cursor;
 	cairo_surface_t *surface;
 	uint32_t devid;
-
+	bool hwimageistestimage;
 } data_t;
 
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
@@ -220,18 +214,22 @@ static void do_single_test(data_t *data, int x, int y)
 		igt_assert_crc_equal(&crc, &crc_after);
 	}
 
-	cursor_disable(data);
-
 	/* Now render the same in software and collect crc */
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
+	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[SWCOMPARISONBUFFER]);
 	draw_cursor(cr, x, y, data->curw, data->curh, 1.0);
 	igt_put_cairo_ctx(cr);
+	igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER]);
+	igt_display_commit(display);
+
+	cursor_disable(data);
 	igt_display_commit(display);
-	igt_dirty_fb(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
-	/* Extra vblank wait is because nonblocking cursor ioctl */
+
 	igt_wait_for_vblank(data->drm_fd,
 			display->pipes[data->pipe].crtc_offset);
 
+	if (!(data->flags & (TEST_DPMS | TEST_SUSPEND)))
+		igt_pipe_crc_get_for_frame(data->drm_fd, pipe_crc, hwcursorframe, &crc);
+
 	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
 	igt_assert_crc_equal(&crc, &ref_crc);
 }
@@ -244,8 +242,6 @@ static void do_fail_test(data_t *data, int x, int y, int expect)
 	igt_print_activity();
 
 	/* Hardware test */
-	restore_image(data);
-
 	cursor_enable(data);
 	igt_plane_set_position(data->cursor, x, y);
 	ret = igt_display_try_commit2(display, COMMIT_LEGACY);
@@ -362,13 +358,16 @@ static void cleanup_crtc(data_t *data)
 	igt_pipe_crc_free(data->pipe_crc);
 	data->pipe_crc = NULL;
 
-	cairo_surface_destroy(data->surface);
+	if (data->hwimageistestimage) {
+		cairo_surface_destroy(data->surface);
+		data->surface = NULL;
+	}
 
 	igt_plane_set_fb(data->primary, NULL);
 	igt_display_commit(display);
 
-	igt_remove_fb(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
-	igt_remove_fb(data->drm_fd, &data->primary_fb[RESTOREBUFFER]);
+	igt_remove_fb(data->drm_fd, &data->primary_fb[HWCURSORBUFFER]);
+	igt_remove_fb(data->drm_fd, &data->primary_fb[SWCOMPARISONBUFFER]);
 
 	igt_display_reset(display);
 }
@@ -389,18 +388,18 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
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
 
@@ -421,13 +420,22 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
 	data->curh = cursor_h;
 	data->refresh = mode->vrefresh;
 
-	data->surface = cairo_image_surface_create(CAIRO_FORMAT_RGB24, data->screenw, data->screenh);
+	if (data->hwimageistestimage) {
+		data->surface = cairo_image_surface_create(CAIRO_FORMAT_RGB24,
+							   data->screenw,
+							   data->screenh);
+
+		/* store test image as cairo surface */
+		cr = cairo_create(data->surface);
+		cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
+		igt_paint_test_pattern(cr, data->screenw, data->screenh);
+		cairo_destroy(cr);
+
+		/* Set HW cursor buffer in place */
+			restore_image(data, HWCURSORBUFFER);
+	} else
+		data->surface = NULL;
 
-	/* store test image as cairo surface */
-	cr = cairo_create(data->surface);
-	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
-	igt_paint_test_pattern(cr, data->screenw, data->screenh);
-	cairo_destroy(cr);
 	igt_pipe_crc_start(data->pipe_crc);
 }
 
@@ -447,6 +455,10 @@ static void test_cursor_alpha(data_t *data, double a)
 				    LOCAL_DRM_FORMAT_MOD_NONE,
 				    &data->fb);
 	igt_assert(fb_id);
+
+	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
+	igt_display_commit(display);
+
 	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb);
 	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
 	igt_put_cairo_ctx(cr);
@@ -462,23 +474,15 @@ static void test_cursor_alpha(data_t *data, double a)
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
@@ -571,10 +575,10 @@ static void test_cursor_size(data_t *data)
 {
 	igt_display_t *display = &data->display;
 	igt_pipe_crc_t *pipe_crc = data->pipe_crc;
-	igt_crc_t crc[10], ref_crc;
+	igt_crc_t crc, ref_crc;
 	cairo_t *cr;
 	uint32_t fb_id;
-	int i, size;
+	int i, size, prevsize = 0;
 	int cursor_max_size = data->cursor_max_w;
 
 	/* Create a maximum size cursor, then change the size in flight to
@@ -591,37 +595,38 @@ static void test_cursor_size(data_t *data)
 	igt_put_cairo_ctx(cr);
 
 	/* Hardware test loop */
-	cursor_enable(data);
 	for (i = 0, size = cursor_max_size; size >= 64; size /= 2, i++) {
+		cursor_enable(data);
 		/* Change size in flight: */
 		igt_plane_set_size(data->cursor, size, size);
 		igt_fb_set_size(&data->fb, data->cursor, size, size);
 		igt_display_commit(display);
-		igt_wait_for_vblank(data->drm_fd,
-				display->pipes[data->pipe].crtc_offset);
-		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc[i]);
-	}
-	cursor_disable(data);
-	igt_display_commit(display);
-	igt_remove_fb(data->drm_fd, &data->fb);
-	/* Software test loop */
-	for (i = 0, size = cursor_max_size; size >= 64; size /= 2, i++) {
+		igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
+		igt_display_commit(display);
+
+		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
+
+		cursor_disable(data);
+		igt_display_commit(display);
+
 		/* Now render the same in software and collect crc */
-		cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
+		cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[SWCOMPARISONBUFFER]);
+
+		/* remove previous cursor sw image */
+		if (prevsize > 0)
+			igt_paint_color(cr, 0, 0, prevsize, prevsize, 0.0, 0.0, 0.0);
+		prevsize = size;
+
 		igt_paint_color_alpha(cr, 0, 0, size, size, 1.0, 1.0, 1.0, 1.0);
 		igt_put_cairo_ctx(cr);
-
+		igt_plane_set_fb(data->primary, &data->primary_fb[SWCOMPARISONBUFFER]);
 		igt_display_commit(display);
-		igt_wait_for_vblank(data->drm_fd,
-				display->pipes[data->pipe].crtc_offset);
 		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
-		/* Clear screen afterwards */
-		cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
-		igt_paint_color(cr, 0, 0, data->screenw, data->screenh,
-				0.0, 0.0, 0.0);
-		igt_put_cairo_ctx(cr);
-		igt_assert_crc_equal(&crc[i], &ref_crc);
+
+		igt_assert_crc_equal(&crc, &ref_crc);
 	}
+
+	igt_remove_fb(data->drm_fd, &data->fb);
 }
 
 static void test_rapid_movement(data_t *data)
@@ -688,6 +693,7 @@ static void run_size_tests(data_t *data, enum pipe pipe,
 		}
 		create_cursor_fb(data, w, h);
 		require_cursor_size(data, w, h);
+		data->hwimageistestimage = true;
 	}
 
 	/* Using created cursor FBs to test cursor support */
@@ -725,6 +731,7 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
 		data->pipe = pipe;
 		data->output = igt_get_single_output_for_pipe(&data->display, pipe);
 		igt_require(data->output);
+		data->hwimageistestimage = false;
 	}
 
 	igt_describe("Create a maximum size cursor, then change the size in "
@@ -744,8 +751,10 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
 	igt_subtest_f("pipe-%s-cursor-alpha-transparent", kmstest_pipe_name(pipe))
 		run_test(data, test_cursor_transparent, data->cursor_max_w, data->cursor_max_h);
 
-	igt_fixture
+	igt_fixture {
 		create_cursor_fb(data, data->cursor_max_w, data->cursor_max_h);
+		data->hwimageistestimage = true;
+	}
 
 	igt_subtest_f("pipe-%s-cursor-dpms", kmstest_pipe_name(pipe)) {
 		data->flags = TEST_DPMS;
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
