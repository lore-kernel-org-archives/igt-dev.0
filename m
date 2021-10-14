Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E806E1D6
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 17:39:46 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id x27so29947894lfa.9
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 10:39:46 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Thu, 14 Oct 2021 20:39:34 +0300
Message-Id: <20211014173934.12375-4-juhapekka.heikkila@gmail.com>
In-Reply-To: <20211014173934.12375-1-juhapekka.heikkila@gmail.com>
References: <20211014173934.12375-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/kms_cursor_crc: use same test
 path for alpha and size tests as all other tests
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

clean up cursor size change and alpha tests

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_cursor_crc.c | 143 +++++++++--------------------------------
 1 file changed, 31 insertions(+), 112 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 5d0fc513c..513c97153 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -71,7 +71,6 @@ typedef struct {
 	igt_plane_t *cursor;
 	cairo_surface_t *surface;
 	uint32_t devid;
-	bool hwimageistestimage;
 	double alpha;
 } data_t;
 
@@ -446,10 +445,8 @@ static void cleanup_crtc(data_t *data)
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
@@ -509,21 +506,18 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
 	data->curh = cursor_h;
 	data->refresh = mode->vrefresh;
 
-	if (data->hwimageistestimage) {
-		data->surface = cairo_image_surface_create(CAIRO_FORMAT_RGB24,
-							   data->screenw,
-							   data->screenh);
+	data->surface = cairo_image_surface_create(CAIRO_FORMAT_RGB24,
+						   data->screenw,
+						   data->screenh);
 
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
@@ -554,63 +548,31 @@ static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
 	igt_put_cairo_ctx(cr);
 }
 
-static void test_cursor_alpha(data_t *data, double a)
+static void test_cursor_alpha(data_t *data)
 {
-	igt_display_t *display = &data->display;
-	igt_pipe_crc_t *pipe_crc = data->pipe_crc;
-	igt_crc_t crc, ref_crc;
-	cairo_t *cr;
-	uint32_t fb_id;
-	int curw = data->curw;
-	int curh = data->curh;
-
-	/* Alpha cursor fb with white color */
-	fb_id = igt_create_fb(data->drm_fd, curw, curh,
-				    DRM_FORMAT_ARGB8888,
-				    DRM_FORMAT_MOD_LINEAR,
-				    &data->fb);
-	igt_assert(fb_id);
+	igt_crc_t crc;
 
 	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
-	igt_display_commit(display);
-
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb);
-	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
-	igt_put_cairo_ctx(cr);
-
-	/* Hardware Test - enable cursor and get PF CRC */
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
+	data->alpha = 1.0;
 }
 
 static void test_cursor_opaque(data_t *data)
 {
-	test_cursor_alpha(data, 1.0);
+	data->alpha = 1.0;
+	test_cursor_alpha(data);
 }
 
 static void require_cursor_size(data_t *data, int w, int h)
@@ -669,60 +631,20 @@ static void run_test(data_t *data, void (*testfunc)(data_t *), int cursor_w, int
 
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
@@ -790,7 +712,6 @@ static void run_size_tests(data_t *data, enum pipe pipe,
 				      w, h);
 		}
 		create_cursor_fb(data, w, h);
-		data->hwimageistestimage = true;
 	}
 
 	/* Using created cursor FBs to test cursor support */
@@ -828,7 +749,6 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
 		data->pipe = pipe;
 		data->output = igt_get_single_output_for_pipe(&data->display, pipe);
 		igt_require(data->output);
-		data->hwimageistestimage = false;
 		data->alpha = 1.0;
 	}
 
@@ -851,7 +771,6 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
 
 	igt_fixture {
 		create_cursor_fb(data, data->cursor_max_w, data->cursor_max_h);
-		data->hwimageistestimage = true;
 	}
 
 	igt_subtest_f("pipe-%s-cursor-dpms", kmstest_pipe_name(pipe)) {
-- 
2.28.0
