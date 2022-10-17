Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2233B10EDAC
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Oct 2022 16:52:30 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 17 Oct 2022 09:52:25 -0700
Message-Id: <20221017165225.2654569-2-ashutosh.dixit@intel.com>
In-Reply-To: <20221017165225.2654569-1-ashutosh.dixit@intel.com>
References: <20221017165225.2654569-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/x-patch; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] REVIEW: Full tree diff against
 1ddb0c40d5cfa72f75d4b9d02869112a87caf244
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

Auto-generated diff between 1ddb0c40d5cfa72f75d4b9d02869112a87caf244..196308ead288b6e61d40a92f108b7685945d1cf9
---
 tests/i915/kms_big_fb.c     | 85 +++++++++++++++++++++++++--------------------
 tests/kms_addfb_basic.c     |  7 ++++
 tests/kms_cursor_crc.c      | 31 +++++++++++------
 tests/kms_plane_cursor.c    | 13 ++++++-
 tests/kms_plane_multiple.c  |  8 ++---
 tests/kms_universal_plane.c | 32 ++++++++++++-----
 6 files changed, 113 insertions(+), 63 deletions(-)

diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index e91bea4f36..eb40e9cdf1 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -88,44 +88,6 @@ static void fini_buf(struct intel_buf *buf)
 	intel_buf_destroy(buf);
 }
 
-static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
-		     uint32_t height, uint64_t format, uint64_t modifier, uint64_t stride)
-{
-	struct drm_mode_fb_cmd2 f = {0};
-	cairo_t *cr;
-
-	newfb->strides[0] = stride;
-	igt_create_bo_for_fb(data->drm_fd, width, height, format, modifier,
-			     newfb);
-
-	igt_assert(newfb->gem_handle > 0);
-
-	f.width = newfb->width;
-	f.height = newfb->height;
-	f.pixel_format = newfb->drm_format;
-	f.flags = DRM_MODE_FB_MODIFIERS;
-
-	for (int n = 0; n < newfb->num_planes; n++) {
-		f.handles[n] = newfb->gem_handle;
-		f.modifier[n] = newfb->modifier;
-		f.pitches[n] = newfb->strides[n];
-		f.offsets[n] = newfb->offsets[n];
-	}
-
-       if (data->planeclearrgb[0] != 0.0 || data->planeclearrgb[1] != 0.0 ||
-           data->planeclearrgb[2] != 0.0) {
-               cr = igt_get_cairo_ctx(data->drm_fd, newfb);
-               igt_paint_color(cr, 0, 0, newfb->width, newfb->height,
-                               data->planeclearrgb[0],
-                               data->planeclearrgb[1],
-                               data->planeclearrgb[2]);
-               igt_put_cairo_ctx(cr);
-       }
-
-	igt_assert(drmIoctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
-	newfb->fb_id = f.fb_id;
-}
-
 static void copy_pattern(data_t *data,
 			 struct igt_fb *dst_fb, int dx, int dy,
 			 struct igt_fb *src_fb, int sx, int sy,
@@ -167,6 +129,53 @@ static void copy_pattern(data_t *data,
 	intel_bb_reset(data->ibb, true);
 }
 
+static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
+		     uint32_t height, uint64_t format, uint64_t modifier, uint64_t stride)
+{
+	struct drm_mode_fb_cmd2 f = {0};
+	struct igt_fb col_fb;
+
+	newfb->strides[0] = stride;
+	igt_create_bo_for_fb(data->drm_fd, width, height, format, modifier,
+			     newfb);
+
+	igt_assert(newfb->gem_handle > 0);
+
+	f.width = newfb->width;
+	f.height = newfb->height;
+	f.pixel_format = newfb->drm_format;
+	f.flags = DRM_MODE_FB_MODIFIERS;
+
+	for (int n = 0; n < newfb->num_planes; n++) {
+		f.handles[n] = newfb->gem_handle;
+		f.modifier[n] = newfb->modifier;
+		f.pitches[n] = newfb->strides[n];
+		f.offsets[n] = newfb->offsets[n];
+	}
+
+	if (data->planeclearrgb[0] != 0.0 || data->planeclearrgb[1] != 0.0 ||
+	    data->planeclearrgb[2] != 0.0) {
+		igt_create_color_fb(data->drm_fd, 512, 512,
+				    newfb->drm_format, newfb->modifier,
+				    data->planeclearrgb[0],
+				    data->planeclearrgb[1],
+				    data->planeclearrgb[2],
+				    &col_fb);
+
+		for (int y = 0; y < newfb->height; y += 512) {
+			for (int x = 0; x < newfb->width; x += 512) {
+				copy_pattern(data, newfb, x, y,
+					&col_fb, 0, 0,
+					512, 512);
+			}
+		}
+		igt_remove_fb(data->drm_fd, &col_fb);
+	}
+
+	igt_assert(drmIoctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
+	newfb->fb_id = f.fb_id;
+}
+
 static void generate_pattern(data_t *data,
 			     struct igt_fb *fb,
 			     int w, int h)
diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index afb4bdf6f5..f91153b5b8 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -241,6 +241,13 @@ static void invalid_tests(int fd)
 			}
 
 			count++;
+
+			/*
+			 * to avoid exessive logging stop after 10k loops
+			 */
+			if (count >= 10000) {
+				break;
+			}
 		}
 
 		/* After all the abuse, confirm the known_formats */
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 8d3426dda1..2d6b43f764 100644
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
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 43bcaaa428..e9abfd7888 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -64,6 +64,8 @@ typedef struct data {
 	enum pipe pipe_id;
 	int drm_fd;
 	rect_t or;
+	uint64_t max_curw;
+	uint64_t max_curh;
 } data_t;
 
 /* Common test setup. */
@@ -222,6 +224,8 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
 	int sw, sh;
 	int pad = 128;
 
+	igt_skip_on(size > data->max_curw || size > data->max_curh);
+
 	sw = data->mode->hdisplay;
 	sh = data->mode->vdisplay;
 
@@ -251,7 +255,7 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
 igt_main
 {
 	static const int cursor_sizes[] = { 64, 128, 256 };
-	data_t data = {};
+	data_t data = { .max_curw = 64, .max_curh = 64 };
 	enum pipe pipe;
 	igt_output_t *output;
 	int i, j;
@@ -270,8 +274,15 @@ igt_main
 	};
 
 	igt_fixture {
+		int ret;
+
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
+		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &data.max_curw);
+		igt_assert(ret == 0 || errno == EINVAL);
+		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_HEIGHT, &data.max_curh);
+		igt_assert(ret == 0 || errno == EINVAL);
+
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&data.display, data.drm_fd);
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index e958fc786f..637d63f0bd 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -311,6 +311,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 		for_each_plane_on_pipe(&data->display, pipe, plane)
 			igt_plane_set_fb(plane, NULL);
 
+		igt_output_set_pipe(output, PIPE_NONE);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		for (int x = 0; x < c; x++)
@@ -326,16 +327,12 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 
 	i = 0;
 	while (i < iterations || loop_forever) {
-		/* Intel devices need it here, timing sensitive on few devices */
-		if (is_i915_device(data->drm_fd))
-			igt_pipe_crc_start(data->pipe_crc);
 
 		/* randomize planes and set up the holes */
 		prepare_planes(data, pipe, &blue, modifier, c, output);
 
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
-		if (!is_i915_device(data->drm_fd))
-			igt_pipe_crc_start(data->pipe_crc);
+		igt_pipe_crc_start(data->pipe_crc);
 
 		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc, &crc);
 		igt_assert_crc_equal(&data->ref_crc, &crc);
@@ -344,6 +341,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 		for_each_plane_on_pipe(&data->display, pipe, plane)
 			igt_plane_set_fb(plane, NULL);
 
+		igt_output_set_pipe(output, PIPE_NONE);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		for (int x = 0; x < c; x++)
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 64416afd39..e732b09a9a 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -190,9 +190,11 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_4);
 
 	/* Step 5: Universal API's, disable primary plane (CRC 5) */
-	igt_plane_set_fb(primary, NULL);
-	igt_display_commit2(display, COMMIT_UNIVERSAL);
-	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_5);
+	if (!is_amdgpu_device(data->drm_fd)) {
+		igt_plane_set_fb(primary, NULL);
+		igt_display_commit2(display, COMMIT_UNIVERSAL);
+		igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_5);
+	}
 
 	/* Step 6: Universal API's, re-enable primary with blue (CRC 6) */
 	igt_plane_set_fb(primary, &test.blue_fb);
@@ -228,11 +230,14 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_7);
 
 	/* Step 11: Disable primary plane */
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, COMMIT_ATOMIC);
 	igt_plane_set_fb(primary, NULL);
 	igt_display_commit2(display, COMMIT_UNIVERSAL);
 
 	/* Step 12: Legacy modeset to yellow FB (CRC 8) */
 	igt_plane_set_fb(primary, &test.yellow_fb);
+	igt_output_set_pipe(output, pipe);
 	igt_display_commit2(display, COMMIT_LEGACY);
 	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_8);
 
@@ -262,9 +267,11 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	 * Step 15: Explicitly disable primary after it's already been
 	 * implicitly disabled (CRC 10).
 	 */
-	igt_plane_set_fb(primary, NULL);
-	igt_display_commit2(display, COMMIT_UNIVERSAL);
-	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_10);
+	if (!is_amdgpu_device(data->drm_fd)) {
+		igt_plane_set_fb(primary, NULL);
+		igt_display_commit2(display, COMMIT_UNIVERSAL);
+		igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_10);
+	}
 
 	/* Step 16: Legacy API's, blue primary, red sprite */
 	igt_plane_set_fb(primary, &test.blue_fb);
@@ -275,7 +282,8 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_assert_crc_equal(&test.crc_2, &test.crc_4);
 
 	/* Disabling primary plane should be same as black primary */
-	igt_assert_crc_equal(&test.crc_1, &test.crc_5);
+	if (!is_amdgpu_device(data->drm_fd))
+		igt_assert_crc_equal(&test.crc_1, &test.crc_5);
 
 	/* Re-enabling primary should return to blue properly */
 	igt_assert_crc_equal(&test.crc_2, &test.crc_6);
@@ -297,8 +305,7 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	 * and have it disable successfully. Skip on amdgpu since crc_9 was
 	 * skipped with offscreen planes previously.
 	 */
-	if (!is_amdgpu_device(data->drm_fd))
-		igt_assert_crc_equal(&test.crc_5, &test.crc_9);
+	igt_assert_crc_equal(&test.crc_5, &test.crc_9);
 
 	/*
 	 * We should be able to explicitly disable an already
@@ -497,6 +504,8 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_display_commit2(&data->display, COMMIT_LEGACY);
 
 	/* Disable the primary plane */
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 	igt_plane_set_fb(primary, NULL);
 	igt_display_commit2(&data->display, COMMIT_UNIVERSAL);
 
@@ -506,6 +515,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	 * Note that crtc->primary->fb = NULL causes flip to return EBUSY for
 	 * historical reasons...
 	 */
+	igt_output_set_pipe(output, pipe);
 	igt_assert(drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
 				   test.red_fb.fb_id, 0, NULL) == -EBUSY);
 
@@ -520,9 +530,13 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	 * completes, which we don't have a good way to specifically test for,
 	 * but at least we can make sure that nothing blows up.
 	 */
+	igt_output_set_pipe(output, pipe);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 	igt_assert(drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
 				   test.red_fb.fb_id, DRM_MODE_PAGE_FLIP_EVENT,
 				   &test) == 0);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 	igt_plane_set_fb(primary, NULL);
 	igt_display_commit2(&data->display, COMMIT_UNIVERSAL);
 
--
git-pile 1.0-dev
