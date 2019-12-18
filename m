Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7196E4E8
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2019 14:54:05 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id p27so1072091pli.10
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2019 06:54:05 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Wed, 18 Dec 2019 16:53:57 +0200
Message-Id: <1576680837-2836-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Fix user space read
 too slow error
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

Having crc running continuously cause this test sometime
fill crc buffer, fix this problem as well as do some generic
cleanups.

v2: Take out gem_sync()

v3: Use rendercopy if available, otherwise Cairo surface for restoring
    test image

v4: take out useless assert and restructure a bit

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_cursor_crc.c | 220 ++++++++++++++++++++++++++++++++++---------------
 1 file changed, 154 insertions(+), 66 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 6475dea..630b9be 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -48,11 +48,10 @@ IGT_TEST_DESCRIPTION(
 typedef struct {
 	int drm_fd;
 	igt_display_t display;
-	struct igt_fb primary_fb;
+	struct igt_fb primary_fb[2];
 	struct igt_fb fb;
 	igt_output_t *output;
 	enum pipe pipe;
-	igt_crc_t ref_crc;
 	int left, right, top, bottom;
 	int screenw, screenh;
 	int refresh;
@@ -60,11 +59,24 @@ typedef struct {
 	int cursor_max_w, cursor_max_h;
 	igt_pipe_crc_t *pipe_crc;
 	unsigned flags;
+	igt_plane_t *primary;
+	igt_plane_t *cursor;
+	cairo_surface_t *surface;
+	uint32_t devid;
+	drm_intel_bufmgr *bufmgr;
+	igt_render_copyfunc_t rendercopy;
+	drm_intel_bo * drmibo[2];
+	struct intel_batchbuffer *batch;
+	struct igt_buf igtbo[2];
+
 } data_t;
 
 #define TEST_DPMS (1<<0)
 #define TEST_SUSPEND (1<<1)
 
+#define FRONTBUFFER 0
+#define RESTOREBUFFER 1
+
 static void draw_cursor(cairo_t *cr, int x, int y, int cw, int ch, double a)
 {
 	int wl, wr, ht, hb;
@@ -89,23 +101,15 @@ static void draw_cursor(cairo_t *cr, int x, int y, int cw, int ch, double a)
 
 static void cursor_enable(data_t *data)
 {
-	igt_output_t *output = data->output;
-	igt_plane_t *cursor =
-		igt_output_get_plane_type(output, DRM_PLANE_TYPE_CURSOR);
-
-	igt_plane_set_fb(cursor, &data->fb);
-	igt_plane_set_size(cursor, data->curw, data->curh);
-	igt_fb_set_size(&data->fb, cursor, data->curw, data->curh);
+	igt_plane_set_fb(data->cursor, &data->fb);
+	igt_plane_set_size(data->cursor, data->curw, data->curh);
+	igt_fb_set_size(&data->fb, data->cursor, data->curw, data->curh);
 }
 
 static void cursor_disable(data_t *data)
 {
-	igt_output_t *output = data->output;
-	igt_plane_t *cursor =
-		igt_output_get_plane_type(output, DRM_PLANE_TYPE_CURSOR);
-
-	igt_plane_set_fb(cursor, NULL);
-	igt_plane_set_position(cursor, 0, 0);
+	igt_plane_set_fb(data->cursor, NULL);
+	igt_plane_set_position(data->cursor, 0, 0);
 }
 
 static bool chv_cursor_broken(data_t *data, int x)
@@ -144,36 +148,58 @@ static bool cursor_visible(data_t *data, int x, int y)
 	return true;
 }
 
+static void restore_image(data_t *data)
+{
+	cairo_t *cr;
+
+	if (data->rendercopy != NULL) {
+		/* use rendercopy if available */
+		data->rendercopy(data->batch, NULL,
+				 &data->igtbo[RESTOREBUFFER], 0, 0,
+				 data->primary_fb[RESTOREBUFFER].width,
+				 data->primary_fb[RESTOREBUFFER].height,
+				 &data->igtbo[FRONTBUFFER], 0, 0);
+	} else {
+		/* if rendercopy not implemented in igt use cairo */
+		cr = igt_get_cairo_ctx(data->drm_fd,
+				       &data->primary_fb[FRONTBUFFER]);
+		cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
+		cairo_set_source_surface(cr, data->surface, 0, 0);
+		cairo_rectangle(cr, 0, 0, data->screenw, data->screenh);
+		cairo_fill(cr);
+		igt_put_cairo_ctx(data->drm_fd,
+				  &data->primary_fb[FRONTBUFFER], cr);
+	}
+	igt_dirty_fb(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
+}
+
 static void do_single_test(data_t *data, int x, int y)
 {
 	igt_display_t *display = &data->display;
 	igt_pipe_crc_t *pipe_crc = data->pipe_crc;
 	igt_crc_t crc, ref_crc;
-	igt_plane_t *cursor =
-		igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_CURSOR);
 	cairo_t *cr;
 	int ret = 0;
 
 	igt_print_activity();
 
 	/* Hardware test */
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb);
-	igt_paint_test_pattern(cr, data->screenw, data->screenh);
-	igt_put_cairo_ctx(data->drm_fd, &data->primary_fb, cr);
+	restore_image(data);
 
+	igt_plane_set_position(data->cursor, x, y);
 	cursor_enable(data);
-	igt_plane_set_position(cursor, x, y);
 
 	if (chv_cursor_broken(data, x) && cursor_visible(data, x, y)) {
 		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
 		igt_assert_eq(ret, -EINVAL);
-		igt_plane_set_position(cursor, 0, y);
+		igt_plane_set_position(data->cursor, 0, y);
 
 		return;
 	}
 
 	igt_display_commit(display);
 
+	/* Extra vblank wait is because nonblocking cursor ioctl */
 	igt_wait_for_vblank(data->drm_fd, data->pipe);
 	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
 
@@ -205,45 +231,35 @@ static void do_single_test(data_t *data, int x, int y)
 	}
 
 	cursor_disable(data);
-	igt_display_commit(display);
 
 	/* Now render the same in software and collect crc */
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb);
+	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
 	draw_cursor(cr, x, y, data->curw, data->curh, 1.0);
-	igt_put_cairo_ctx(data->drm_fd, &data->primary_fb, cr);
+	igt_put_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER], cr);
 	igt_display_commit(display);
-
+	igt_dirty_fb(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
+	/* Extra vblank wait is because nonblocking cursor ioctl */
 	igt_wait_for_vblank(data->drm_fd, data->pipe);
-	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
 
+	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
 	igt_assert_crc_equal(&crc, &ref_crc);
-
-	/* Clear screen afterwards */
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb);
-	igt_paint_color(cr, 0, 0, data->screenw, data->screenh, 0.0, 0.0, 0.0);
-	igt_put_cairo_ctx(data->drm_fd, &data->primary_fb, cr);
 }
 
 static void do_fail_test(data_t *data, int x, int y, int expect)
 {
 	igt_display_t *display = &data->display;
-	igt_plane_t *cursor =
-		igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_CURSOR);
-	cairo_t *cr;
 	int ret;
 
 	igt_print_activity();
 
 	/* Hardware test */
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb);
-	igt_paint_test_pattern(cr, data->screenw, data->screenh);
-	igt_put_cairo_ctx(data->drm_fd, &data->primary_fb, cr);
+	restore_image(data);
 
 	cursor_enable(data);
-	igt_plane_set_position(cursor, x, y);
+	igt_plane_set_position(data->cursor, x, y);
 	ret = igt_display_try_commit2(display, COMMIT_LEGACY);
 
-	igt_plane_set_position(cursor, 0, 0);
+	igt_plane_set_position(data->cursor, 0, 0);
 	cursor_disable(data);
 	igt_display_commit(display);
 
@@ -355,31 +371,54 @@ static void cleanup_crtc(data_t *data)
 	igt_pipe_crc_free(data->pipe_crc);
 	data->pipe_crc = NULL;
 
-	igt_remove_fb(data->drm_fd, &data->primary_fb);
+	cairo_surface_destroy(data->surface);
+
+	igt_plane_set_fb(data->primary, NULL);
+	igt_display_commit(display);
+
+	igt_remove_fb(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
+	igt_remove_fb(data->drm_fd, &data->primary_fb[RESTOREBUFFER]);
 
 	igt_display_reset(display);
 }
 
+static void scratch_buf_init(data_t *data, int buffer)
+{
+	data->igtbo[buffer].bo = data->drmibo[buffer];
+	data->igtbo[buffer].stride = data->primary_fb[buffer].strides[0];
+	data->igtbo[buffer].tiling = data->primary_fb[buffer].modifier;
+	data->igtbo[buffer].size = data->primary_fb[buffer].size;
+	data->igtbo[buffer].bpp = data->primary_fb[buffer].plane_bpp[0];
+}
+
 static void prepare_crtc(data_t *data, igt_output_t *output,
 			 int cursor_w, int cursor_h)
 {
 	drmModeModeInfo *mode;
 	igt_display_t *display = &data->display;
-	igt_plane_t *primary;
+	cairo_t *cr;
 
 	/* select the pipe we want to use */
 	igt_output_set_pipe(output, data->pipe);
 
-	/* create and set the primary plane fb */
+	/* create and set the primary plane fbs */
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
 			    LOCAL_DRM_FORMAT_MOD_NONE,
 			    0.0, 0.0, 0.0,
-			    &data->primary_fb);
+			    &data->primary_fb[FRONTBUFFER]);
+
+	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+			    DRM_FORMAT_XRGB8888,
+			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    0.0, 0.0, 0.0,
+			    &data->primary_fb[RESTOREBUFFER]);
 
-	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	igt_plane_set_fb(primary, &data->primary_fb);
+	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	data->cursor = igt_output_get_plane_type(output, DRM_PLANE_TYPE_CURSOR);
+
+	igt_plane_set_fb(data->primary, &data->primary_fb[FRONTBUFFER]);
 
 	igt_display_commit(display);
 
@@ -398,9 +437,42 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
 	data->curh = cursor_h;
 	data->refresh = mode->vrefresh;
 
-	/* get reference crc w/o cursor */
+	data->surface = cairo_image_surface_create(CAIRO_FORMAT_RGB24, data->screenw, data->screenh);
+
+	if (data->rendercopy == NULL) {
+		/* store test image as cairo surface */
+		cr = cairo_create(data->surface);
+		cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
+		igt_paint_test_pattern(cr, data->screenw, data->screenh);
+		cairo_destroy(cr);
+	} else {
+		/* store test image as fb if rendercopy is available */
+		cr = igt_get_cairo_ctx(data->drm_fd,
+		                       &data->primary_fb[RESTOREBUFFER]);
+		cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
+		igt_paint_test_pattern(cr, data->screenw, data->screenh);
+		igt_put_cairo_ctx(data->drm_fd,
+				  &data->primary_fb[RESTOREBUFFER], cr);
+
+		data->drmibo[FRONTBUFFER] = gem_handle_to_libdrm_bo(data->bufmgr,
+								    data->drm_fd,
+								    "", data->primary_fb[FRONTBUFFER].gem_handle);
+		igt_assert(data->drmibo[FRONTBUFFER]);
+
+		data->drmibo[RESTOREBUFFER] = gem_handle_to_libdrm_bo(data->bufmgr,
+								      data->drm_fd,
+								      "", data->primary_fb[RESTOREBUFFER].gem_handle);
+		igt_assert(data->drmibo[RESTOREBUFFER]);
+
+		scratch_buf_init(data, RESTOREBUFFER);
+		scratch_buf_init(data, FRONTBUFFER);
+
+		data->batch = intel_batchbuffer_alloc(data->bufmgr,
+						      data->devid);
+		igt_assert(data->batch);
+	}
+
 	igt_pipe_crc_start(data->pipe_crc);
-	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &data->ref_crc);
 }
 
 static void test_cursor_alpha(data_t *data, double a)
@@ -432,9 +504,9 @@ static void test_cursor_alpha(data_t *data, double a)
 	igt_remove_fb(data->drm_fd, &data->fb);
 
 	/*Software Test*/
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb);
+	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
 	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
-	igt_put_cairo_ctx(data->drm_fd, &data->primary_fb, cr);
+	igt_put_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER], cr);
 
 	igt_display_commit(display);
 	igt_wait_for_vblank(data->drm_fd, data->pipe);
@@ -442,10 +514,10 @@ static void test_cursor_alpha(data_t *data, double a)
 	igt_assert_crc_equal(&crc, &ref_crc);
 
 	/*Clear Screen*/
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb);
+	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
 	igt_paint_color(cr, 0, 0, data->screenw, data->screenh,
 			0.0, 0.0, 0.0);
-	igt_put_cairo_ctx(data->drm_fd, &data->primary_fb, cr);
+	igt_put_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER], cr);
 }
 
 static void test_cursor_transparent(data_t *data)
@@ -521,8 +593,6 @@ static void test_cursor_size(data_t *data)
 	uint32_t fb_id;
 	int i, size;
 	int cursor_max_size = data->cursor_max_w;
-	igt_plane_t *cursor =
-		igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_CURSOR);
 
 	/* Create a maximum size cursor, then change the size in flight to
 	 * smaller ones to see that the size is applied correctly
@@ -541,8 +611,8 @@ static void test_cursor_size(data_t *data)
 	cursor_enable(data);
 	for (i = 0, size = cursor_max_size; size >= 64; size /= 2, i++) {
 		/* Change size in flight: */
-		igt_plane_set_size(cursor, size, size);
-		igt_fb_set_size(&data->fb, cursor, size, size);
+		igt_plane_set_size(data->cursor, size, size);
+		igt_fb_set_size(&data->fb, data->cursor, size, size);
 		igt_display_commit(display);
 		igt_wait_for_vblank(data->drm_fd, data->pipe);
 		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc[i]);
@@ -553,18 +623,18 @@ static void test_cursor_size(data_t *data)
 	/* Software test loop */
 	for (i = 0, size = cursor_max_size; size >= 64; size /= 2, i++) {
 		/* Now render the same in software and collect crc */
-		cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb);
+		cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
 		igt_paint_color_alpha(cr, 0, 0, size, size, 1.0, 1.0, 1.0, 1.0);
-		igt_put_cairo_ctx(data->drm_fd, &data->primary_fb, cr);
+		igt_put_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER], cr);
 
 		igt_display_commit(display);
 		igt_wait_for_vblank(data->drm_fd, data->pipe);
 		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
 		/* Clear screen afterwards */
-		cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb);
+		cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
 		igt_paint_color(cr, 0, 0, data->screenw, data->screenh,
 				0.0, 0.0, 0.0);
-		igt_put_cairo_ctx(data->drm_fd, &data->primary_fb, cr);
+		igt_put_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER], cr);
 		igt_assert_crc_equal(&crc[i], &ref_crc);
 	}
 }
@@ -575,26 +645,24 @@ static void test_rapid_movement(data_t *data)
 	int x = 0, y = 0;
 	long usec;
 	igt_display_t *display = &data->display;
-	igt_plane_t *cursor =
-		igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_CURSOR);
 
 	cursor_enable(data);
 
 	gettimeofday(&start, NULL);
 	for ( ; x < 100; x++) {
-		igt_plane_set_position(cursor, x, y);
+		igt_plane_set_position(data->cursor, x, y);
 		igt_display_commit(display);
 	}
 	for ( ; y < 100; y++) {
-		igt_plane_set_position(cursor, x, y);
+		igt_plane_set_position(data->cursor, x, y);
 		igt_display_commit(display);
 	}
 	for ( ; x > 0; x--) {
-		igt_plane_set_position(cursor, x, y);
+		igt_plane_set_position(data->cursor, x, y);
 		igt_display_commit(display);
 	}
 	for ( ; y > 0; y--) {
-		igt_plane_set_position(cursor, x, y);
+		igt_plane_set_position(data->cursor, x, y);
 		igt_display_commit(display);
 	}
 	gettimeofday(&end, NULL);
@@ -736,6 +804,16 @@ igt_main
 		igt_require_pipe_crc(data.drm_fd);
 
 		igt_display_require(&data.display, data.drm_fd);
+
+		if (is_i915_device(data.drm_fd)) {
+			data.bufmgr = drm_intel_bufmgr_gem_init(data.drm_fd, 4096);
+			igt_assert(data.bufmgr);
+			drm_intel_bufmgr_gem_enable_reuse(data.bufmgr);
+
+			data.devid = intel_get_drm_devid(data.drm_fd);
+			data.rendercopy = igt_get_render_copyfunc(data.devid);
+		}
+		igt_debug("Using %s for restoring test image\n", (data.rendercopy == NULL)?"Cairo":"rendercopy");
 	}
 
 	data.cursor_max_w = cursor_width;
@@ -746,6 +824,16 @@ igt_main
 			run_tests_on_pipe(&data, pipe);
 
 	igt_fixture {
+		if (data.pipe_crc != NULL) {
+			igt_pipe_crc_stop(data.pipe_crc);
+			igt_pipe_crc_free(data.pipe_crc);
+		}
+
+		if (data.bufmgr != NULL) {
+			intel_batchbuffer_free(data.batch);
+			drm_intel_bufmgr_destroy(data.bufmgr);
+		}
+
 		igt_display_fini(&data.display);
 	}
 }
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
