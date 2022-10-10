Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6E310E445
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 09:35:15 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id s20so15717892lfi.11
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 02:35:15 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 10 Oct 2022 12:35:06 +0300
Message-Id: <20221010093507.13817-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/kms_big_fb: optimize async
 flip tests
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

on async flip tests there's need to create large solid color
framebuffer. Here is optimized creating this framebuffer
with help of rendercopy.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/i915/kms_big_fb.c | 85 +++++++++++++++++++++++------------------
 1 file changed, 47 insertions(+), 38 deletions(-)

diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index e91bea4f3..eb40e9cdf 100644
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
-- 
2.37.3
