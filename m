Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197AB6EA64
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2020 19:51:02 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id e8so3350794pfh.2
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2020 11:51:02 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Wed, 25 Nov 2020 21:50:50 +0200
Message-Id: <20201125195051.13373-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_plane: optimize pixel format
 tests
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

On packed formats there's no need to show separate colors on separate fbs.
Here augmented path with packed color handling which check colors just on
one fb.

This cannot be directly applied to planar yuv formats because of scaler
use with those formats.

On my ICL this drop test execution time from 44.91s to 21.98s

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane.c | 88 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 71 insertions(+), 17 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 4ce859fba..749a75eee 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -466,7 +466,8 @@ static void prepare_format_color(data_t *data, enum pipe pipe,
 				 int width, int height,
 				 enum igt_color_encoding color_encoding,
 				 enum igt_color_range color_range,
-				 const color_t *c, struct igt_fb *fb)
+				 const color_t *c, struct igt_fb *fb,
+				 bool singlefbtest)
 {
 	cairo_t *cr;
 
@@ -480,6 +481,15 @@ static void prepare_format_color(data_t *data, enum pipe pipe,
 		igt_paint_color(cr, 0, 0, width, height,
 				c->red, c->green, c->blue);
 
+		if (singlefbtest) {
+			for (int n = 0; n < data->num_colors; n++) {
+				igt_paint_color(cr, 0, n * 4, fb->width, 2,
+						data->colors[n].red,
+						data->colors[n].green,
+						data->colors[n].blue);
+			}
+		}
+
 		igt_put_cairo_ctx(cr);
 	} else {
 		igt_create_fb_with_bo_size(data->drm_fd,
@@ -505,6 +515,16 @@ static void prepare_format_color(data_t *data, enum pipe pipe,
 				width, height,
 				c->red, c->green, c->blue);
 
+		if (singlefbtest) {
+			int inc = format != DRM_FORMAT_XRGB8888 ? data->crop : 0;
+			for (int n = 0; n < data->num_colors; n++) {
+				igt_paint_color(cr, 0, inc + n * 4, fb->width, 2,
+						data->colors[n].red,
+						data->colors[n].green,
+						data->colors[n].blue);
+			}
+		}
+
 		igt_put_cairo_ctx(cr);
 	}
 
@@ -548,13 +568,35 @@ static void capture_crc(data_t *data, unsigned int vblank, igt_crc_t *crc)
 		      crc->frame, vblank);
 }
 
-static void capture_format_crcs(data_t *data, enum pipe pipe,
-				igt_plane_t *plane,
-				uint32_t format, uint64_t modifier,
-				int width, int height,
-				enum igt_color_encoding encoding,
-				enum igt_color_range range,
-				igt_crc_t crc[], struct igt_fb *fb)
+static void capture_format_crcs_packed(data_t *data, enum pipe pipe,
+				       igt_plane_t *plane,
+				       uint32_t format, uint64_t modifier,
+				       int width, int height,
+				       enum igt_color_encoding encoding,
+				       enum igt_color_range range,
+				       igt_crc_t crc[], struct igt_fb *fb)
+{
+	struct igt_fb old_fb = *fb;
+	const color_t black = { 0.0f, 0.0f, 0.0f };
+
+	prepare_format_color(data, pipe, plane, format, modifier,
+			width, height, encoding, range, &black, fb, true);
+
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET,
+				  NULL);
+
+	igt_remove_fb(data->drm_fd, &old_fb);
+
+	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc[0]);
+}
+
+static void capture_format_crcs_planar(data_t *data, enum pipe pipe,
+				       igt_plane_t *plane,
+				       uint32_t format, uint64_t modifier,
+				       int width, int height,
+				       enum igt_color_encoding encoding,
+				       enum igt_color_range range,
+				       igt_crc_t crc[], struct igt_fb *fb)
 {
 	unsigned int vblank[ARRAY_SIZE(colors_extended)];
 	struct drm_event_vblank ev;
@@ -567,7 +609,7 @@ restart_round:
 		int ret;
 
 		prepare_format_color(data, pipe, plane, format, modifier,
-				     width, height, encoding, range, c, fb);
+				     width, height, encoding, range, c, fb, false);
 
 		if (data->display.is_atomic && i >= 1) {
 			igt_assert(read(data->drm_fd, &ev, sizeof(ev)) == sizeof(ev));
@@ -684,12 +726,20 @@ static bool test_format_plane_colors(data_t *data, enum pipe pipe,
 	int crc_mismatch_count = 0;
 	bool result = true;
 	int i;
+	bool planar = igt_format_is_yuv_semiplanar(format);
 
-	capture_format_crcs(data, pipe, plane, format, modifier,
-			    width, height, encoding, range, crc, fb);
+	if (planar)
+		capture_format_crcs_planar(data, pipe, plane, format, modifier,
+					   width, height, encoding, range, crc,
+					   fb);
+	else
+		capture_format_crcs_packed(data, pipe, plane, format, modifier,
+					   width, height, encoding, range, crc,
+					   fb);
 
-	for (i = 0; i < data->num_colors; i++) {
-		if (!igt_check_crc_equal(&crc[i], &ref_crc[i])) {
+	for (i = 0; i < (planar ? data->num_colors : 1); i++) {
+
+		if (!igt_check_crc_equal(&crc[i], &ref_crc[i + (planar ? 1 : 0)])) {
 			crc_mismatch_count++;
 			crc_mismatch_mask |= (1 << i);
 			result = false;
@@ -784,7 +834,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 	uint32_t format, ref_format;
 	uint64_t modifier, ref_modifier;
 	uint64_t width, height;
-	igt_crc_t ref_crc[ARRAY_SIZE(colors_extended)];
+	igt_crc_t ref_crc[ARRAY_SIZE(colors_extended) + 1];
 	bool result = true;
 
 	/*
@@ -843,9 +893,13 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 		igt_remove_fb(data->drm_fd, &test_fb);
 	}
 
-	capture_format_crcs(data, pipe, plane, format, modifier,
-			    width, height, IGT_COLOR_YCBCR_BT709,
-			    IGT_COLOR_YCBCR_LIMITED_RANGE, ref_crc, &fb);
+	capture_format_crcs_packed(data, pipe, plane, format, modifier,
+				   width, height, IGT_COLOR_YCBCR_BT709,
+				   IGT_COLOR_YCBCR_LIMITED_RANGE, ref_crc, &fb);
+
+	capture_format_crcs_planar(data, pipe, plane, format, modifier,
+				   width, height, IGT_COLOR_YCBCR_BT709,
+				   IGT_COLOR_YCBCR_LIMITED_RANGE, &ref_crc[1], &fb);
 
 	/*
 	 * Make sure we have some difference between the colors. This
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
