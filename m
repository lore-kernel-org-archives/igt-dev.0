Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2076.outbound.protection.outlook.com [40.107.95.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED686E06B
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Nov 2021 19:57:47 +0000 (UTC)
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Date: Mon, 29 Nov 2021 14:56:59 -0500
Message-ID: <20211129195659.1865321-6-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20211129195659.1865321-1-Rodrigo.Siqueira@amd.com>
References: <20211129195659.1865321-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 5/5] tests/amdgpu: fix gamma test on plane
 and crtc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: harry.wentland@amd.com, markyacoub@google.com, nicholas.choi@amd.com, hayden.goodfellow@amd.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Stylon Wang <stylon.wang@amd.com>

[Why]
YUV formats are failing max degamma tests because black is not really
black. Color bar pattern are causing sub-sampling errors.

[How]
Use proper max gamma with pure color pattern. Fix typo and remove
un-used code.

Signed-off-by: Stylon Wang <stylon.wang@amd.com>
---
 tests/amdgpu/amd_color.c | 71 ++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 39 deletions(-)

diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index 2e1f3d84..3504c53a 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -43,7 +43,6 @@ typedef struct color {
 typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
-	igt_plane_t *overlay;
 	igt_output_t *output;
 	igt_pipe_t *pipe;
 	igt_pipe_crc_t *pipe_crc;
@@ -132,13 +131,21 @@ static void lut_gen_regamma_srgb(lut_t *lut, uint16_t mask)
 	}
 }
 
-/* Generates the maximum curve gamma LUT. */
-static void lut_gen_max(lut_t *lut, uint16_t mask)
+static void lut_gen_max(lut_t *lut)
 {
 	uint32_t i;
+	uint32_t threshold = (uint32_t)(0.25 * lut->size);
 
-	for (i = 0; i < lut->size; ++i) {
-		uint32_t v = i? (0xffff & mask) : 0;
+	for (i = 0; i < threshold; ++i) {
+		uint32_t v = 0;
+
+		lut->data[i].red = v;
+		lut->data[i].blue = v;
+		lut->data[i].green = v;
+	}
+
+	for (i = threshold; i < lut->size; ++i) {
+		uint32_t v = 0xffff;
 
 		lut->data[i].red = v;
 		lut->data[i].blue = v;
@@ -264,8 +271,6 @@ static void test_init(data_t *data)
 
 	data->primary =
 		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
-	data->overlay =
-		igt_pipe_get_plane_type_index(data->pipe, DRM_PLANE_TYPE_OVERLAY, 0);
 
 	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
 					  INTEL_PIPE_CRC_SOURCE_AUTO);
@@ -699,48 +704,33 @@ static void test_plane_ctm_mixed_mapping(data_t *data)
 	igt_remove_fb(data->fd, &rfb);
 }
 
-/* draw color bars */
-static void draw_fill_color_bar(igt_fb_t *fb, int w, int h)
+/* draw color with half the brightness*/
+static void draw_fill_color_half(igt_fb_t *fb, int w, int h)
 {
 	cairo_t *cr;
-	int gh = h/3;
-	int rh = h-gh*2;
 
 	cr = igt_get_cairo_ctx(fb->fd, fb);
-	igt_paint_color(cr, 0, 0, w, gh, 1.0, 0.0, 0.0);
-	igt_paint_color(cr, 0, gh, w, gh, 0.0, 1.0, 0.0);
-	igt_paint_color(cr, 0, gh*2, w, rh, 0.0, 0.0, 1.0);
+	igt_paint_color(cr, 0, 0, w, h, 0.5, 0.5, 0.5);
 	igt_put_cairo_ctx(cr);
 }
 
-/* draw color bars with half the brightness*/
-static void draw_fill_color_bar_half(igt_fb_t *fb, int w, int h)
+/* draw color in gradient without all-black pixels */
+static void draw_gradient_color(igt_fb_t *fb, int w, int h)
 {
 	cairo_t *cr;
-	int gh = h/3;
-	int rh = h-gh*2;
 
 	cr = igt_get_cairo_ctx(fb->fd, fb);
-	igt_paint_color(cr, 0, 0, w, gh, 0.5, 0.0, 0.0);
-	igt_paint_color(cr, 0, gh, w, gh, 0.0, 0.5, 0.0);
-	igt_paint_color(cr, 0, gh*2, w, rh, 0.0, 0.0, 0.5);
+	igt_paint_color_gradient_range(cr, 0, 0, w, h, 1.0, 1.0, 1.0,
+				       128.0/255, 128.0/255, 128.0/255);
 	igt_put_cairo_ctx(cr);
 }
 
-/* draw color bars in gradient without all-black pixels */
-static void draw_gradient_color_bar(igt_fb_t *fb, int w, int h)
+static void draw_fill_color(igt_fb_t *fb)
 {
 	cairo_t *cr;
-	int gh = h/3;
-	int rh = h-gh*2;
 
 	cr = igt_get_cairo_ctx(fb->fd, fb);
-	igt_paint_color_gradient_range(cr, 0, 0, w, gh, 1.0, 0.0, 0.0,
-				       1.0/255, 0.0, 0.0);
-	igt_paint_color_gradient_range(cr, 0, gh, w, gh, 0.0, 1.0, 0.0,
-				       0.0, 1.0/255, 0.0);
-	igt_paint_color_gradient_range(cr, 0, gh*2, w, rh, 0.0, 0.0, 1.0,
-				       0.0, 0.0, 1.0/255);
+	igt_paint_color(cr, 0, 0, fb->width, fb->height, 1.0, 1.0, 1.0);
 	igt_put_cairo_ctx(cr);
 }
 
@@ -754,12 +744,12 @@ static void test_plane_max_degamma(data_t *data)
 	test_init(data);
 
 	lut_init(&lut_max, data->plane_degamma_lut_size);
-	lut_gen_max(&lut_max, 0xffff);
+	lut_gen_max(&lut_max);
 
 	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &rfb);
-	draw_fill_color_bar(&rfb, data->w, data->h);
+	draw_fill_color(&rfb);
 	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &afb);
-	draw_gradient_color_bar(&afb, data->w, data->h);
+	draw_gradient_color(&afb, data->w, data->h);
 
 	igt_info("Reference image: max degamma\n");
 	igt_plane_set_fb(data->primary, &rfb);
@@ -775,6 +765,9 @@ static void test_plane_max_degamma(data_t *data)
 
 	igt_assert_crc_equal(&ref_crc, &new_crc);
 
+	set_plane_degamma_lut(data, NULL);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
 	test_fini(data);
 	igt_remove_fb(data->fd, &rfb);
 	igt_remove_fb(data->fd, &afb);
@@ -798,15 +791,15 @@ static bool test_plane_crtc_gamma(data_t *data, uint32_t format, igt_crc_t ref_c
 		 kmstest_pipe_name(data->pipe_id), data->primary->index);
 
 	lut_init(&lut_max, data->plane_degamma_lut_size);
-	lut_gen_max(&lut_max, 0xffff);
-	lut_init(&lut_half, data->plane_degamma_lut_size);
+	lut_gen_max(&lut_max);
+	lut_init(&lut_half, data->regamma_lut_size);
 	lut_gen_half(&lut_half, 0xffff);
 
 	igt_create_fb_with_bo_size(data->fd, data->w, data->h,
 				   format, 0,
 				   e, r,
 				   &afb, 0, 0);
-	draw_gradient_color_bar(&afb, data->w, data->h);
+	draw_gradient_color(&afb, data->w, data->h);
 
 	igt_plane_set_fb(data->primary, &afb);
 	set_plane_degamma_lut(data, &lut_max);
@@ -840,7 +833,7 @@ static void test_plane_crtc_gamma_formats(data_t *data)
 
 	/* draw test pattern and take CRC as reference */
 	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &rfb);
-	draw_fill_color_bar_half(&rfb, data->w, data->h);
+	draw_fill_color_half(&rfb, data->w, data->h);
 	igt_plane_set_fb(data->primary, &rfb);
 	set_plane_degamma_lut(data, NULL);
 	set_regamma_lut(data, NULL);
@@ -852,7 +845,7 @@ static void test_plane_crtc_gamma_formats(data_t *data)
 	/* test on all supported formats */
 	for (i = plane->format_mod_count-1; i >= 0; i--) {
 		if (!igt_fb_supported_format(plane->formats[i]))
-				continue;
+			continue;
 		result &= test_plane_crtc_gamma(data,  plane->formats[i], ref_crc);
 	}
 
-- 
2.25.1
