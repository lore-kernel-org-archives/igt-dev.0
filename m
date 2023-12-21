Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F306310E666
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Dec 2023 09:49:14 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2cc6a52231cso5257011fa.3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Dec 2023 01:49:14 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/3] tests/i915/kms_big_fb: Add Cairo fallback path for
 test image creation
Date: Thu, 21 Dec 2023 11:49:01 +0200
Message-Id: <20231221094903.3782509-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
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

If for some reason rendercopy cannot be used do fallback with
rendering everything is system memory on cairo surface and move
test images from cairo surface to framebuffers

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_big_fb.c | 166 +++++++++++++++++++++++++++++++--------
 1 file changed, 134 insertions(+), 32 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 3eb43515a..768dac0d2 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -181,6 +181,8 @@ typedef struct {
 	int hw_stride;
 	int max_hw_fb_width;
 	double planeclearrgb[3];
+	cairo_surface_t *big_surface;
+	cairo_surface_t *normal_surface;
 } data_t;
 
 static struct intel_buf *init_buf(data_t *data,
@@ -220,6 +222,22 @@ static void fini_buf(struct intel_buf *buf)
 	intel_buf_destroy(buf);
 }
 
+static void copy_pattern_cairo(data_t *data,
+			       cairo_surface_t *dst, int dx, int dy,
+			       cairo_surface_t *src, int sx, int sy,
+			       int w, int h)
+{
+	cairo_t *cr;
+
+	cr = cairo_create(dst);
+	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
+	cairo_rectangle(cr, dx, dy, w, h);
+	cairo_set_source_surface(cr, src, dx-sx, dy-sy);
+
+	cairo_fill(cr);
+	cairo_destroy(cr);
+}
+
 static void copy_pattern(data_t *data,
 			 struct igt_fb *dst_fb, int dx, int dy,
 			 struct igt_fb *src_fb, int sx, int sy,
@@ -268,6 +286,7 @@ static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
 {
 	struct drm_mode_fb_cmd2 f = {0};
 	struct igt_fb col_fb;
+	cairo_t *cr;
 
 	newfb->strides[0] = stride;
 	igt_create_bo_for_fb(data->drm_fd, width, height, format, modifier,
@@ -289,25 +308,39 @@ static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
 
 	if (data->planeclearrgb[0] != 0.0 || data->planeclearrgb[1] != 0.0 ||
 	    data->planeclearrgb[2] != 0.0) {
-		igt_create_color_fb(data->drm_fd, 512, 512,
-				    newfb->drm_format, newfb->modifier,
-				    data->planeclearrgb[0],
-				    data->planeclearrgb[1],
-				    data->planeclearrgb[2],
-				    &col_fb);
-
-		for (int y = 0; y < newfb->height; y += 512) {
-			for (int x = 0; x < newfb->width; x += 512) {
-				copy_pattern(data, newfb, x, y,
-					&col_fb, 0, 0,
-					512, 512);
+		if (data->render_copy) {
+			igt_create_color_fb(data->drm_fd, 512, 512,
+					newfb->drm_format, newfb->modifier,
+					data->planeclearrgb[0],
+					data->planeclearrgb[1],
+					data->planeclearrgb[2],
+					&col_fb);
+
+			for (int y = 0; y < newfb->height; y += 512) {
+				for (int x = 0; x < newfb->width; x += 512) {
+					copy_pattern(data, newfb, x, y,
+						&col_fb, 0, 0,
+						512, 512);
+				}
 			}
+			igt_remove_fb(data->drm_fd, &col_fb);
+			igt_assert(drmIoctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
+			newfb->fb_id = f.fb_id;
+		} else {
+			igt_assert(drmIoctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
+			newfb->fb_id = f.fb_id;
+
+			cr = igt_get_cairo_ctx(data->drm_fd, newfb);
+			igt_paint_color(cr, 0, 0, newfb->width, newfb->height,
+					data->planeclearrgb[0],
+					data->planeclearrgb[1],
+					data->planeclearrgb[2]);
+			igt_put_cairo_ctx(cr);
 		}
-		igt_remove_fb(data->drm_fd, &col_fb);
+	} else {
+		igt_assert(drmIoctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
+		newfb->fb_id = f.fb_id;
 	}
-
-	igt_assert(drmIoctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
-	newfb->fb_id = f.fb_id;
 }
 
 static void generate_pattern(data_t *data,
@@ -315,22 +348,53 @@ static void generate_pattern(data_t *data,
 			     int w, int h)
 {
 	struct igt_fb pat_fb;
+	cairo_surface_t *tempsurface;
+	cairo_t *cr;
 
-	igt_create_pattern_fb(data->drm_fd, w, h,
-			      data->format, data->modifier,
-			      &pat_fb);
-
-	for (int y = 0; y < fb->height; y += h) {
-		for (int x = 0; x < fb->width; x += w) {
-			copy_pattern(data, fb, x, y,
-				     &pat_fb, 0, 0,
-				     pat_fb.width, pat_fb.height);
-			w++;
-			h++;
+	if (data->render_copy) {
+		igt_create_pattern_fb(data->drm_fd, w, h,
+				data->format, data->modifier,
+				&pat_fb);
+
+		for (int y = 0; y < fb->height; y += h) {
+			for (int x = 0; x < fb->width; x += w) {
+				copy_pattern(data, fb, x, y,
+					&pat_fb, 0, 0,
+					pat_fb.width, pat_fb.height);
+				w++;
+				h++;
+			}
 		}
-	}
+		igt_remove_fb(data->drm_fd, &pat_fb);
+	} else {
+		tempsurface = cairo_image_surface_create(CAIRO_FORMAT_RGB24, w, h);
+
+		cr = cairo_create(tempsurface);
+		cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
+		igt_paint_test_pattern(cr, w, h);
+		cairo_destroy(cr);
+
+		for (int y = 0; y < fb->height; y += h) {
+			for (int x = 0; x < fb->width; x += w) {
+				copy_pattern_cairo(data, data->big_surface, x, y,
+					tempsurface, 0, 0,
+					w, h);
+				w++;
+				h++;
+			}
+		}
+		cairo_surface_destroy(tempsurface);
 
-	igt_remove_fb(data->drm_fd, &pat_fb);
+		/*
+		* big fb surface to display
+		*/
+		cr = igt_get_cairo_ctx(data->drm_fd, fb);
+		cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
+		cairo_set_source_surface(cr, data->big_surface, 0, 0);
+		cairo_rectangle(cr, 0, 0, fb->width, fb->height);
+		cairo_fill(cr);
+		igt_put_cairo_ctx(cr);
+	}
 }
 
 static bool size_ok(data_t *data, uint64_t size)
@@ -404,6 +468,13 @@ static void prep_fb(data_t *data)
 		igt_debug("using stride length %d\n", data->hw_stride);
 	}
 
+	if (!data->render_copy) {
+		igt_info("Using Cairo for rendering big framebuffer\n");
+		data->big_surface = cairo_image_surface_create(CAIRO_FORMAT_RGB24,
+							       data->big_fb_width,
+							       data->big_fb_height);
+	}
+
 	generate_pattern(data, &data->big_fb, 640, 480);
 }
 
@@ -437,6 +508,7 @@ static void unset_lut(data_t *data)
 
 static bool test_plane(data_t *data)
 {
+	cairo_t *cr;
 	igt_plane_t *plane = data->plane;
 	struct igt_fb *small_fb = &data->small_fb;
 	struct igt_fb *big_fb = &data->big_fb;
@@ -507,9 +579,23 @@ static bool test_plane(data_t *data)
 		 * rendering pipeline introduces slight differences into
 		 * the result if we try that, and so the crc will not match.
 		 */
-		copy_pattern(data, small_fb, 0, 0, big_fb, x, y,
-			     small_fb->width, small_fb->height);
-
+		if (data->big_surface == NULL) {
+			copy_pattern(data, small_fb, 0, 0, big_fb, x, y,
+				     small_fb->width, small_fb->height);
+		} else {
+			copy_pattern_cairo(data, data->normal_surface, 0, 0,
+				     data->big_surface, x, y,
+				     small_fb->width, small_fb->height);
+			/*
+			* small fb surface to display
+			*/
+			cr = igt_get_cairo_ctx(data->drm_fd, small_fb);
+			cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
+			cairo_set_source_surface(cr, data->normal_surface, 0, 0);
+			cairo_rectangle(cr, 0, 0, small_fb->width, small_fb->height);
+			cairo_fill(cr);
+			igt_put_cairo_ctx(cr);
+		}
 		igt_display_commit2(&data->display, data->display.is_atomic ?
 				    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
 		igt_pipe_crc_start(data->pipe_crc);
@@ -563,6 +649,10 @@ static bool test_pipe(data_t *data)
 	igt_create_fb(data->drm_fd, width, height,
 		      data->format, data->modifier, &data->small_fb);
 
+	if (!data->render_copy)
+		data->normal_surface = cairo_image_surface_create(CAIRO_FORMAT_RGB24,
+								  width, height);
+
 	igt_output_set_pipe(data->output, data->pipe);
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
@@ -622,6 +712,13 @@ max_hw_stride_async_flip_test(data_t *data)
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
 		 kmstest_pipe_name(data->pipe), igt_output_name(data->output));
 
+	if (!data->render_copy && data->big_surface == NULL) {
+		igt_info("Using Cairo for rendering big framebuffer\n");
+		data->big_surface = cairo_image_surface_create(CAIRO_FORMAT_RGB24,
+								data->big_fb_width,
+								data->big_fb_height);
+	}
+
 	igt_output_set_pipe(data->output, data->pipe);
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
@@ -939,6 +1036,7 @@ static void test_cleanup(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->big_fb_flip[0]);
 	igt_remove_fb(data->drm_fd, &data->big_fb_flip[1]);
 	igt_remove_fb(data->drm_fd, &data->small_fb);
+	cairo_surface_destroy(data->normal_surface);
 
 	data->output = NULL;
 }
@@ -1158,6 +1256,10 @@ igt_main
 	igt_fixture {
 		igt_display_fini(&data.display);
 		buf_ops_destroy(data.bops);
+
+		if (data.big_surface != NULL)
+			cairo_surface_destroy(data.big_surface);
+
 		drm_close_driver(data.drm_fd);
 	}
 }
-- 
2.25.1
