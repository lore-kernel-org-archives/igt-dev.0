Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2BF10E1F1
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 17:11:40 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] tests/kms_async_flip: Speed up the CRC test on
 Intel hw
Date: Thu,  7 Dec 2023 19:11:35 +0200
Message-ID: <20231207171136.30669-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Go back to using igt_draw mmap stuff to do the mid-test
rendering in the CRC subtest to make it faster. Going
via all the cairo machinery is very very slow, but we'll
leave that codepath in place for non-Intel hw. This makes
the test pass on a DG2 here as we can now produce enough
frames to have some confidence in the results.

Note that some extra care is apparently needed with the order
in which things are done. If we pin the buffers to the display
first the mmap is likely to fail (due to the FB getting pinned
outside the reach of the small BAR presumably). Curiosuly the
mmap itself succeeds but we get a SIGBUS when trying to acccess
the buffer contents. If we touch the FBs first via mmap and only
then pin them to the display everything works correctly.

Cc: Melissa Wen <mwen@igalia.com>
Cc: Alex Hung <alex.hung@amd.com>
Cc: André Almeida <andrealmeid@igalia.com>
Fixes: 8ba806e7e196 ("tests/kms_async_flips: Support more vendors")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_async_flips.c | 66 +++++++++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 19 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 6fddad093913..f7f9add89548 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -100,6 +100,7 @@ typedef struct {
 	enum pipe pipe;
 	bool alternate_sync_async;
 	bool allow_fail;
+	struct buf_ops *bops;
 } data_t;
 
 static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
@@ -230,8 +231,6 @@ static void test_init_fbs(data_t *data)
 
 	igt_plane_set_fb(data->plane, &data->bufs[0]);
 	igt_plane_set_size(data->plane, width, height);
-
-	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 }
 
 static void test_async_flip(data_t *data)
@@ -240,6 +239,8 @@ static void test_async_flip(data_t *data)
 	long long int fps;
 	struct timeval start, end, diff;
 
+	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
 	gettimeofday(&start, NULL);
 	frame = 1;
 	do {
@@ -336,6 +337,8 @@ static void test_timestamp(data_t *data)
 	unsigned int seq, seq1;
 	int ret;
 
+	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
 	/*
 	 * In older platforms(<= gen10), async address update bit is double buffered.
 	 * So flip timestamp can be verified only from the second flip.
@@ -381,6 +384,8 @@ static void test_cursor(data_t *data)
 	struct igt_fb cursor_fb;
 	struct drm_mode_cursor cur;
 
+	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
 	/*
 	 * Intel's PSR2 selective fetch adds other planes to state when
 	 * necessary, causing the async flip to fail because async flip is not
@@ -429,6 +434,8 @@ static void test_invalid(data_t *data)
 	struct igt_fb fb;
 	drmModeModeInfo *mode;
 
+	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
 	mode = igt_output_get_mode(data->output);
 	width = mode->hdisplay;
 	height = mode->vdisplay;
@@ -525,28 +532,48 @@ static unsigned int clock_ms(void)
 	return ts.tv_sec * 1000 + ts.tv_nsec / 1000000;
 }
 
+static void paint_fb(data_t *data, struct igt_fb *fb,
+		     int width, int height,
+		     uint32_t color)
+{
+	if (is_intel_device(data->drm_fd)) {
+		igt_draw_rect_fb(data->drm_fd, data->bops, 0, fb,
+				 gem_has_mappable_ggtt(data->drm_fd) ?
+				 IGT_DRAW_MMAP_GTT : IGT_DRAW_MMAP_WC,
+				 0, 0, width, height, color);
+	} else {
+		cairo_t *cr;
+
+		cr = igt_get_cairo_ctx(data->drm_fd, fb);
+		igt_paint_color(cr, 0, 0, width, height,
+				((color & 0xff0000) >> 16) / 255.0,
+				((color & 0xff00) >> 8) / 255.0,
+				((color & 0xff) >> 9) / 255.0);
+		igt_put_cairo_ctx(cr);
+	}
+}
+
 static void test_crc(data_t *data)
 {
 	unsigned int frame = 0;
 	unsigned int start;
-	cairo_t *cr;
-	int ret;
+	int ret, width, height;
+	drmModeModeInfoPtr mode;
+
+	/* make things faster by using a smallish mode */
+	mode = &data->output->config.connector->modes[0];
+	width = mode->hdisplay;
+	height = mode->vdisplay;
 
 	data->flip_count = 0;
 	data->frame_count = 0;
 	data->flip_pending = false;
 
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->bufs[frame]);
-	igt_paint_color(cr, 0, 0, data->bufs[frame].width, data->bufs[frame].height, 1.0, 0.0, 0.0);
-	igt_put_cairo_ctx(cr);
-
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->bufs[!frame]);
-	igt_paint_color(cr, 0, 0, data->bufs[!frame].width, data->bufs[!frame].height, 1.0, 0.0, 0.0);
-	igt_put_cairo_ctx(cr);
+	paint_fb(data, &data->bufs[frame], width, height, 0xff0000ff);
+	paint_fb(data, &data->bufs[!frame], width, height, 0xff0000ff);
 
 	ret = drmModeSetCrtc(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id, 0, 0,
-			     &data->output->config.connector->connector_id, 1,
-			     &data->output->config.connector->modes[0]);
+			     &data->output->config.connector->connector_id, 1, mode);
 	igt_assert_eq(ret, 0);
 
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd,
@@ -562,9 +589,7 @@ static void test_crc(data_t *data)
 
 	while (clock_ms() - start < 2000) {
 		/* fill the next fb with the expected color */
-		cr = igt_get_cairo_ctx(data->drm_fd, &data->bufs[frame]);
-		igt_paint_color(cr, 0, 0, 1, data->bufs[frame].height, 1.0, 0.0, 0.0);
-		igt_put_cairo_ctx(cr);
+		paint_fb(data, &data->bufs[frame], 1, height, 0xff0000ff);
 
 		data->flip_pending = true;
 		ret = drmModePageFlip(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id,
@@ -575,9 +600,7 @@ static void test_crc(data_t *data)
 
 		/* clobber the previous fb which should no longer be scanned out */
 		frame = !frame;
-		cr = igt_get_cairo_ctx(data->drm_fd, &data->bufs[frame]);
-		igt_paint_color_rand(cr, 0, 0, 1, data->bufs[frame].height);
-		igt_put_cairo_ctx(cr);
+		paint_fb(data, &data->bufs[frame], 1, height, rand());
 	}
 
 	igt_pipe_crc_stop(data->pipe_crc);
@@ -644,6 +667,9 @@ igt_main
 
 		igt_require_f(igt_has_drm_cap(data.drm_fd, DRM_CAP_ASYNC_PAGE_FLIP),
 			      "Async Flip is not supported\n");
+
+		if (is_intel_device(data.drm_fd))
+			data.bops = buf_ops_create(data.drm_fd);
 	}
 
 	igt_describe("Verify the async flip functionality and the fps during async flips");
@@ -704,6 +730,8 @@ igt_main
 		for (i = 0; i < NUM_FBS; i++)
 			igt_remove_fb(data.drm_fd, &data.bufs[i]);
 
+		if (is_intel_device(data.drm_fd))
+			buf_ops_destroy(data.bops);
 		igt_display_reset(&data.display);
 		igt_display_commit(&data.display);
 		igt_display_fini(&data.display);
-- 
2.41.0
