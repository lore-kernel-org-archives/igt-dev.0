Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBA66E108
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Nov 2021 19:57:37 +0000 (UTC)
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Date: Mon, 29 Nov 2021 14:56:56 -0500
Message-ID: <20211129195659.1865321-3-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20211129195659.1865321-1-Rodrigo.Siqueira@amd.com>
References: <20211129195659.1865321-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 2/5] tests/amdgpu: Test combination of plane
 degamma and CRTC regamma
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

Signed-off-by: Stylon Wang <stylon.wang@amd.com>
---
 tests/amdgpu/amd_color.c | 114 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index 418f8934..84f0a995 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -146,6 +146,20 @@ static void lut_gen_max(lut_t *lut, uint16_t mask)
 	}
 }
 
+/* Generates the half curve gamma LUT. */
+static void lut_gen_half(lut_t *lut, uint16_t mask)
+{
+	uint32_t i;
+
+	for (i = 0; i < lut->size; ++i) {
+		uint32_t v = i? (0xffff & mask)/2 : 0;
+
+		lut->data[i].red = v;
+		lut->data[i].blue = v;
+		lut->data[i].green = v;
+	}
+}
+
 static void lut_free(lut_t *lut)
 {
 	if (lut->data) {
@@ -699,6 +713,20 @@ static void draw_fill_color_bar(igt_fb_t *fb, int w, int h)
 	igt_put_cairo_ctx(cr);
 }
 
+/* draw color bars with half the brightness*/
+static void draw_fill_color_bar_half(igt_fb_t *fb, int w, int h)
+{
+	cairo_t *cr;
+	int gh = h/3;
+	int rh = h-gh*2;
+
+	cr = igt_get_cairo_ctx(fb->fd, fb);
+	igt_paint_color(cr, 0, 0, w, gh, 0.5, 0.0, 0.0);
+	igt_paint_color(cr, 0, gh, w, gh, 0.0, 0.5, 0.0);
+	igt_paint_color(cr, 0, gh*2, w, rh, 0.0, 0.0, 0.5);
+	igt_put_cairo_ctx(cr);
+}
+
 /* draw color bars in gradient without all-black pixels */
 static void draw_gradient_color_bar(igt_fb_t *fb, int w, int h)
 {
@@ -753,6 +781,90 @@ static void test_plane_max_degamma(data_t *data)
 	lut_free(&lut_max);
 }
 
+static bool test_plane_crtc_gamma(data_t *data, uint32_t format, igt_crc_t ref_crc)
+{
+	igt_display_t *display = &data->display;
+	igt_fb_t afb;
+	igt_crc_t new_crc;
+	lut_t lut_max, lut_half;
+	enum igt_color_encoding e = IGT_COLOR_YCBCR_BT709;
+	enum igt_color_range r = IGT_COLOR_YCBCR_LIMITED_RANGE;
+	bool result = true;
+
+	igt_info("Testing format " IGT_FORMAT_FMT " (%s, %s) on %s.%u\n",
+		 IGT_FORMAT_ARGS(format),
+		 igt_color_encoding_to_str(e),
+		 igt_color_range_to_str(r),
+		 kmstest_pipe_name(data->pipe_id), data->primary->index);
+
+	lut_init(&lut_max, data->plane_degamma_lut_size);
+	lut_gen_max(&lut_max, 0xffff);
+	lut_init(&lut_half, data->plane_degamma_lut_size);
+	lut_gen_half(&lut_half, 0xffff);
+
+	igt_create_fb_with_bo_size(data->fd, data->w, data->h,
+				   format, 0,
+				   e, r,
+				   &afb, 0, 0);
+	draw_gradient_color_bar(&afb, data->w, data->h);
+
+	igt_plane_set_fb(data->primary, &afb);
+	set_plane_degamma_lut(data, &lut_max);
+	set_regamma_lut(data, &lut_half);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
+
+	if (!igt_check_crc_equal(&ref_crc, &new_crc)) {
+		result = false;
+		igt_warn("CRC mismatches with format " IGT_FORMAT_FMT "\n",
+			 IGT_FORMAT_ARGS(format));
+	}
+
+	igt_plane_set_fb(data->primary, NULL);
+	igt_remove_fb(data->fd, &afb);
+	lut_free(&lut_max);
+	return result;
+}
+
+static void test_plane_crtc_gamma_formats(data_t *data)
+{
+	int i;
+	igt_plane_t *plane;
+	igt_display_t *display = &data->display;
+	igt_fb_t rfb;
+	igt_crc_t ref_crc;
+	bool result = true;
+
+	test_init(data);
+	plane = data->primary;
+
+	/* draw test pattern and take CRC as reference */
+	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &rfb);
+	draw_fill_color_bar_half(&rfb, data->w, data->h);
+	igt_plane_set_fb(data->primary, &rfb);
+	set_plane_degamma_lut(data, NULL);
+	set_regamma_lut(data, NULL);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
+	igt_plane_set_fb(data->primary, NULL);
+	igt_remove_fb(data->fd, &rfb);
+
+	/* test on all supported formats */
+	for (i = plane->format_mod_count-1; i >= 0; i--) {
+		if (!igt_fb_supported_format(plane->formats[i]))
+				continue;
+		result &= test_plane_crtc_gamma(data,  plane->formats[i], ref_crc);
+	}
+
+	set_plane_degamma_lut(data, NULL);
+	set_regamma_lut(data, NULL);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	igt_assert_f(result, "At least one CRC mismatch happened\n");
+
+	test_fini(data);
+}
+
 igt_main
 {
 	data_t data;
@@ -782,6 +894,8 @@ igt_main
 	igt_subtest("plane-ctm-mixed-mapping") test_plane_ctm_mixed_mapping(&data);
 	igt_subtest("plane-max-degamma") test_plane_max_degamma(&data);
 
+	igt_subtest("plane-crtc-degamma") test_plane_crtc_gamma_formats(&data);
+
 	igt_fixture
 	{
 		igt_display_fini(&data.display);
-- 
2.25.1
