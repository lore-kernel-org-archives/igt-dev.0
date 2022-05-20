Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0D910E8C2
 for <igt-dev@lists.freedesktop.org>; Fri, 20 May 2022 20:36:07 +0000 (UTC)
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 May 2022 17:35:31 -0300
Message-Id: <20220520203531.14394-3-andrealmeid@igalia.com>
In-Reply-To: <20220520203531.14394-1-andrealmeid@igalia.com>
References: <20220520203531.14394-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] tests/kms_async_flips: Support more
 vendors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, kernel-dev@igalia.com, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

kms_async_flips uses igt_draw_ and i915 modifiers, which make this test
fails for other vendors that are not Intel. Use more generic functions
and modifiers so other devices can be tested.

Since i915's "Linear memory does not support async flips", we can't use
DRM_FORMAT_MOD_LINEAR and need to keep using I915_FORMAT_MOD_X_TILED.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_async_flips.c | 47 ++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 5e11cd43..1701883b 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -133,19 +133,24 @@ static void make_fb(data_t *data, struct igt_fb *fb,
 {
 	uint32_t width, height;
 	int rec_width;
+	cairo_t *cr;
 
 	width = connector->modes[0].hdisplay;
 	height = connector->modes[0].vdisplay;
 
 	rec_width = width / (ARRAY_SIZE(data->bufs) * 2);
 
-	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
-		      I915_FORMAT_MOD_X_TILED, fb);
-	igt_draw_fill_fb(data->drm_fd, fb, 0x88);
-	igt_draw_rect_fb(data->drm_fd, NULL, 0, fb, IGT_DRAW_MMAP_CPU,
-			 rec_width * 2 + rec_width * index,
-			 height / 4, rec_width,
-			 height / 2, rand());
+	if (is_i915_device(data->drm_fd)) {
+		igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
+			      I915_FORMAT_MOD_X_TILED, fb);
+		igt_draw_fill_fb(data->drm_fd, fb, 0x88);
+	} else {
+		igt_create_color_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
+				    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 0.5, fb);
+	}
+
+	cr = igt_get_cairo_ctx(data->drm_fd, fb);
+	igt_paint_color_rand(cr, rec_width * 2 + rec_width * index, height / 4, rec_width, height / 2);
 }
 
 static void require_monotonic_timestamp(int fd)
@@ -347,6 +352,9 @@ static void test_invalid(data_t *data)
 	uint32_t width, height;
 	struct igt_fb fb;
 
+	/* TODO: support more vendors */
+	igt_require(is_i915_device(data->drm_fd));
+
 	width = data->connector->modes[0].hdisplay;
 	height = data->connector->modes[0].vdisplay;
 
@@ -472,26 +480,25 @@ static unsigned int clock_ms(void)
 	return ts.tv_sec * 1000 + ts.tv_nsec / 1000000;
 }
 
-static void paint_fb(int fd, struct igt_fb *fb, uint32_t color)
-{
-	igt_draw_rect_fb(fd, NULL, 0, fb,
-			 gem_has_mappable_ggtt(fd) ?
-			 IGT_DRAW_MMAP_GTT : IGT_DRAW_MMAP_WC,
-			 0, 0, 1, fb->height, color);
-}
-
 static void test_crc(data_t *data)
 {
 	unsigned int frame = 0;
 	unsigned int start;
+	cairo_t *cr;
 	int ret;
 
+	/* Devices without CRC can't run this test */
+	igt_require_pipe_crc(data->drm_fd);
+
 	data->flip_count = 0;
 	data->frame_count = 0;
 	data->flip_pending = false;
 
-	igt_draw_fill_fb(data->drm_fd, &data->bufs[frame], 0xff0000ff);
-	igt_draw_fill_fb(data->drm_fd, &data->bufs[!frame], 0xff0000ff);
+	cr = igt_get_cairo_ctx(data->drm_fd, &data->bufs[frame]);
+	igt_paint_color(cr, 0, 0, data->bufs[frame].width, data->bufs[frame].height, 1.0, 0.0, 0.0);
+
+	cr = igt_get_cairo_ctx(data->drm_fd, &data->bufs[!frame]);
+	igt_paint_color(cr, 0, 0, data->bufs[!frame].width, data->bufs[!frame].height, 1.0, 0.0, 0.0);
 
 	ret = drmModeSetCrtc(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id, 0, 0,
 			     &data->connector->connector_id, 1, &data->connector->modes[0]);
@@ -510,7 +517,8 @@ static void test_crc(data_t *data)
 
 	while (clock_ms() - start < 2000) {
 		/* fill the next fb with the expected color */
-		paint_fb(data->drm_fd, &data->bufs[frame], 0xff0000ff);
+		cr = igt_get_cairo_ctx(data->drm_fd, &data->bufs[frame]);
+		igt_paint_color(cr, 0, 0, 1, data->bufs[frame].height, 1.0, 0.0, 0.0);
 
 		data->flip_pending = true;
 		ret = drmModePageFlip(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id,
@@ -521,7 +529,8 @@ static void test_crc(data_t *data)
 
 		/* clobber the previous fb which should no longer be scanned out */
 		frame = !frame;
-		paint_fb(data->drm_fd, &data->bufs[frame], rand());
+		cr = igt_get_cairo_ctx(data->drm_fd, &data->bufs[frame]);
+		igt_paint_color_rand(cr, 0, 0, 1, data->bufs[frame].height);
 	}
 
 	igt_pipe_crc_stop(data->pipe_crc);
-- 
2.36.0
