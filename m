Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2053.outbound.protection.outlook.com [40.107.101.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713746E108
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Nov 2021 19:57:33 +0000 (UTC)
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Date: Mon, 29 Nov 2021 14:56:55 -0500
Message-ID: <20211129195659.1865321-2-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20211129195659.1865321-1-Rodrigo.Siqueira@amd.com>
References: <20211129195659.1865321-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 1/5] tests/amdgpu: Test plane level CTM and
 degamma
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

Testing new color management properties enabling
CTM and degamma in plane level.

Test is skipped if new properties are not found.

Signed-off-by: Stylon Wang <stylon.wang@amd.com>
---
 lib/igt_kms.c            |  10 +
 lib/igt_kms.h            |   3 +
 tests/amdgpu/amd_color.c | 384 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 397 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 34a2aa00..46984ed8 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -581,6 +581,9 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_ALPHA] = "alpha",
 	[IGT_PLANE_ZPOS] = "zpos",
 	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
+	[IGT_PLANE_CTM] = "AMD_PLANE_CTM",
+	[IGT_PLANE_DEGAMMA_LUT] = "AMD_PLANE_DEGAMMA_LUT",
+	[IGT_PLANE_DEGAMMA_LUT_SIZE] = "AMD_PLANE_DEGAMMA_LUT_SIZE",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
@@ -2003,6 +2006,13 @@ static void igt_plane_reset(igt_plane_t *plane)
 
 	if (igt_plane_has_prop(plane, IGT_PLANE_FB_DAMAGE_CLIPS))
 		igt_plane_set_prop_value(plane, IGT_PLANE_FB_DAMAGE_CLIPS, 0);
+	/* reset color management */
+	if (igt_plane_has_prop(plane, IGT_PLANE_CTM))
+		igt_plane_replace_prop_blob(plane, IGT_PLANE_CTM, NULL, 0);
+
+	if (igt_plane_has_prop(plane, IGT_PLANE_DEGAMMA_LUT))
+		igt_plane_replace_prop_blob(plane, IGT_PLANE_DEGAMMA_LUT, NULL, 0);
+
 
 	igt_plane_clear_prop_changed(plane, IGT_PLANE_IN_FENCE_FD);
 	plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e9ecd21e..6e477435 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -301,6 +301,9 @@ enum igt_atomic_plane_properties {
        IGT_PLANE_ALPHA,
        IGT_PLANE_ZPOS,
        IGT_PLANE_FB_DAMAGE_CLIPS,
+       IGT_PLANE_CTM,
+       IGT_PLANE_DEGAMMA_LUT,
+       IGT_PLANE_DEGAMMA_LUT_SIZE,
        IGT_NUM_PLANE_PROPS
 };
 
diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index 6d313bae..418f8934 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -20,8 +20,12 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <stdint.h>
+
 #include "igt.h"
 
+IGT_TEST_DESCRIPTION("Test Color Features at Plane level");
+
 /* (De)gamma LUT. */
 typedef struct lut {
 	struct drm_color_lut *data;
@@ -39,6 +43,7 @@ typedef struct color {
 typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
+	igt_plane_t *overlay;
 	igt_output_t *output;
 	igt_pipe_t *pipe;
 	igt_pipe_crc_t *pipe_crc;
@@ -49,8 +54,18 @@ typedef struct data {
 	int h;
 	uint32_t regamma_lut_size;
 	uint32_t degamma_lut_size;
+	uint32_t plane_degamma_lut_size;
+	bool plane_has_color_management;
 } data_t;
 
+static const uint64_t fixpt_zero = 0;
+static const uint64_t fixpt_one = 0x100000000LL;
+static const uint64_t fixpt_minus_one = 0x8000000100000000LL;
+static const uint64_t fixpt_half = 0x80000000LL;
+static const uint64_t fixpt_minus_half = 0x8000000080000000LL;
+static const uint64_t fixpt_quarter = 0x40000000LL;
+static const uint64_t fixpt_3_quarters = 0xC0000000LL;
+
 static void lut_init(lut_t *lut, uint32_t size)
 {
 	igt_assert(size > 0);
@@ -117,6 +132,20 @@ static void lut_gen_regamma_srgb(lut_t *lut, uint16_t mask)
 	}
 }
 
+/* Generates the maximum curve gamma LUT. */
+static void lut_gen_max(lut_t *lut, uint16_t mask)
+{
+	uint32_t i;
+
+	for (i = 0; i < lut->size; ++i) {
+		uint32_t v = i? (0xffff & mask) : 0;
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
@@ -137,6 +166,18 @@ static void draw_color(igt_fb_t *fb, double r, double g, double b)
 	igt_put_cairo_ctx(cr);
 }
 
+/* Draws a FB with 3 color bars */
+static void draw_rgb_color(igt_fb_t *fb, color_t color1, color_t color2, color_t color3)
+{
+	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
+	int gh = fb->height / 3;
+
+	igt_paint_color(cr, 0, 0, fb->width, gh, color1.r, color1.g, color1.b);
+	igt_paint_color(cr, 0, gh, fb->width, gh, color2.r, color2.g, color2.b);
+	igt_paint_color(cr, 0, gh * 2, fb->width, gh, color3.r, color3.g, color3.b);
+	igt_put_cairo_ctx(cr);
+}
+
 /* Generates the gamma test pattern. */
 static void draw_gamma_test(igt_fb_t *fb)
 {
@@ -171,6 +212,25 @@ static void set_regamma_lut(data_t *data, lut_t const *lut)
 				       size);
 }
 
+/* Sets the degamma LUT on plane */
+static void set_plane_degamma_lut(data_t *data, lut_t const *lut)
+{
+	size_t size = lut? sizeof(lut->data[0]) * lut->size : 0;
+	const void *ptr = lut? lut->data : NULL;
+
+	igt_plane_replace_prop_blob(data->primary, IGT_PLANE_DEGAMMA_LUT,
+				    (void *)ptr, size);
+}
+
+/* Sets the CTM on plane. */
+static void set_plane_ctm(data_t *data, struct drm_color_ctm const *ctm)
+{
+	size_t size = ctm ? sizeof(*ctm) : 0;
+
+	igt_plane_replace_prop_blob(data->primary, IGT_PLANE_CTM, (void *)ctm,
+				    size);
+}
+
 /* Common test setup. */
 static void test_init(data_t *data)
 {
@@ -190,6 +250,8 @@ static void test_init(data_t *data)
 
 	data->primary =
 		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+	data->overlay =
+		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
 
 	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
 					  INTEL_PIPE_CRC_SOURCE_AUTO);
@@ -204,6 +266,14 @@ static void test_init(data_t *data)
 		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_GAMMA_LUT_SIZE);
 	igt_assert_lt(0, data->regamma_lut_size);
 
+	data->plane_has_color_management = igt_plane_has_prop(data->primary, IGT_PLANE_CTM);
+
+	if (data->plane_has_color_management) {
+		data->plane_degamma_lut_size =
+			igt_plane_get_prop(data->primary, IGT_PLANE_DEGAMMA_LUT_SIZE);
+	}
+
+
 	data->w = data->mode->hdisplay;
 	data->h = data->mode->vdisplay;
 }
@@ -375,6 +445,314 @@ static void test_crtc_lut_accuracy(data_t *data)
 	lut_free(&lut_degamma);
 }
 
+/* Test CTM on color remapping red-channel to blue color
+ */
+static void test_plane_ctm_color_remapping(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_crc_t ref_crc, new_crc;
+	igt_fb_t rfb, afb;
+	color_t red = {1.0, 0.0, 0.0};
+	color_t green = {0.0, 1.0, 0.0};
+	color_t blue = {0.0, 0.0, 1.0};
+	struct drm_color_ctm ctm = { {fixpt_zero, fixpt_zero, fixpt_zero,
+				      fixpt_zero, fixpt_one, fixpt_zero,
+				      fixpt_one, fixpt_zero, fixpt_one} };
+	struct drm_color_ctm ctm_unit = { {fixpt_one, fixpt_zero, fixpt_zero,
+					   fixpt_zero, fixpt_one, fixpt_zero,
+					   fixpt_zero, fixpt_zero, fixpt_one} };
+
+	test_init(data);
+
+	if (!data->plane_has_color_management) {
+		igt_info("Plane does not support color management, skipping the test.\n");
+		return;
+	}
+
+	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &rfb);
+	draw_rgb_color(&rfb, blue, green, blue);
+	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &afb);
+	draw_rgb_color(&afb, red, green, blue);
+
+	igt_info("Reference image: color remapping\n");
+	igt_plane_set_fb(data->primary, &rfb);
+	set_plane_ctm(data, &ctm_unit);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
+
+	igt_info("Actual image: color remapping\n");
+	igt_plane_set_fb(data->primary, &afb);
+	set_plane_ctm(data, &ctm);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
+
+	igt_assert_crc_equal(&ref_crc, &new_crc);
+
+	test_fini(data);
+	igt_remove_fb(data->fd, &afb);
+	igt_remove_fb(data->fd, &rfb);
+}
+
+/* Test CTM on intensity reduction by scaling down the color
+ * with multiplicatoin with 1/4, 1/2, 3/4 respectively.
+ *
+ * Note that 252, 189, 126 and 63 are chosen to avoid rounding error from
+ * dividing 255 with even numbers.
+ */
+static void test_plane_ctm_intensity_reduction(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_crc_t ref_crc, new_crc;
+	igt_fb_t afb, rfb;
+	color_t red = { 252.0/255, 0.0, 0.0};
+	color_t green = {0.0, 252.0/255, 0.0};
+	color_t blue = {0.0, 0.0, 252.0/255};
+
+	struct {
+		const char *desc;
+		color_t expected_colors[3];
+		struct drm_color_ctm ctm;
+	} subitems[] =
+	{
+		{
+			"3/4",
+			{ {189.0/255, 0.0, 0.0},
+			  {0.0, 189.0/255, 0.0},
+			  {0.0, 0.0, 189.0/255} },
+			{ {fixpt_3_quarters, fixpt_zero, fixpt_zero,
+			   fixpt_zero, fixpt_3_quarters, fixpt_zero,
+			   fixpt_zero, fixpt_zero, fixpt_3_quarters} },
+		},
+		{
+			"1/2",
+			{ {126.0/255, 0.0, 0.0},
+			  {0.0, 126.0/255, 0.0},
+			  {0.0, 0.0, 126.0/255} },
+			{ {fixpt_half, fixpt_zero, fixpt_zero,
+			   fixpt_zero, fixpt_half, fixpt_zero,
+			   fixpt_zero, fixpt_zero, fixpt_half} },
+		},
+		{
+			"1/4",
+			{ {63.0/255, 0.0, 0.0},
+			  {0.0, 63.0/255, 0.0},
+			  {0.0, 0.0, 63.0/255} },
+			{ {fixpt_quarter, fixpt_zero, fixpt_zero,
+			   fixpt_zero, fixpt_quarter, fixpt_zero,
+			   fixpt_zero, fixpt_zero, fixpt_quarter} },
+		},
+	};
+	struct drm_color_ctm ctm_unit = { {fixpt_one, fixpt_zero, fixpt_zero,
+					   fixpt_zero, fixpt_one, fixpt_zero,
+					   fixpt_zero, fixpt_zero, fixpt_one} };
+	int i;
+
+	test_init(data);
+
+	if (!data->plane_has_color_management) {
+		igt_info("Plane does not support color management, skipping the test.\n");
+		return;
+	}
+
+	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &rfb);
+	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &afb);
+
+	for (i=0; i<sizeof(subitems)/sizeof(subitems[0]); ++i) {
+
+		draw_rgb_color(&rfb,
+			       subitems[i].expected_colors[0],
+			       subitems[i].expected_colors[1],
+			       subitems[i].expected_colors[2]
+			       );
+		draw_rgb_color(&afb, red, green, blue);
+
+		igt_info("Reference image: intensity reduction with %s\n", subitems[i].desc);
+		igt_plane_set_fb(data->primary, &rfb);
+		set_plane_ctm(data, &ctm_unit);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
+
+		igt_info("Actual image: intensity reduction with %s\n", subitems[i].desc);
+		igt_plane_set_fb(data->primary, &afb);
+		set_plane_ctm(data, &subitems[i].ctm);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
+
+		igt_assert_crc_equal(&ref_crc, &new_crc);
+	}
+
+	test_fini(data);
+	igt_remove_fb(data->fd, &afb);
+	igt_remove_fb(data->fd, &rfb);
+}
+
+/* Test CTM on negative mapping from all colors to black
+ */
+static void test_plane_ctm_negative_mapping(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_crc_t ref_crc, new_crc;
+	igt_fb_t afb, rfb;
+	color_t black = {0.0, 0.0, 0.0};
+	color_t red = {1.0, 0.0, 0.0};
+	color_t green = {0.0, 1.0, 0.0};
+	color_t blue = {0.0, 0.0, 1.0};
+	struct drm_color_ctm ctm = { {fixpt_minus_one, fixpt_zero, fixpt_zero,
+				      fixpt_zero, fixpt_minus_one, fixpt_zero,
+				      fixpt_zero, fixpt_zero, fixpt_minus_one} };
+	struct drm_color_ctm ctm_unit = { {fixpt_one, fixpt_zero, fixpt_zero,
+					   fixpt_zero, fixpt_one, fixpt_zero,
+					   fixpt_zero, fixpt_zero, fixpt_one} };
+
+	test_init(data);
+
+	if (!data->plane_has_color_management) {
+		igt_info("Plane does not support color management, skipping the test.\n");
+		return;
+	}
+
+	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &rfb);
+	draw_rgb_color(&rfb, black, black, black);
+	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &afb);
+	draw_rgb_color(&afb, red, green, blue);
+
+	igt_info("Reference image: negative mapping\n");
+	igt_plane_set_fb(data->primary, &rfb);
+	set_plane_ctm(data, &ctm_unit);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
+
+	igt_info("Actual image: negative mapping\n");
+	igt_plane_set_fb(data->primary, &afb);
+	set_plane_ctm(data, &ctm);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
+
+	igt_assert_crc_equal(&ref_crc, &new_crc);
+
+	test_fini(data);
+	igt_remove_fb(data->fd, &afb);
+	igt_remove_fb(data->fd, &rfb);
+}
+
+/* Test CTM on mixed mapping from magenta color to -0.5 of the blue component
+ * on red channel and scale the blue channel down by half:
+ * R=252, G=0, B=252 --> R=126, G=0, B=126
+ *
+ * Note that 252 and 126 are chosen to avoid rounding error from
+ * dividing 255 with even numbers.
+ */
+static void test_plane_ctm_mixed_mapping(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_crc_t ref_crc, new_crc;
+	igt_fb_t rfb, afb;
+	struct drm_color_ctm ctm = { {fixpt_one, fixpt_zero, fixpt_minus_half,
+				      fixpt_zero, fixpt_one, fixpt_zero,
+				      fixpt_zero, fixpt_zero, fixpt_half} };
+	struct drm_color_ctm ctm_unit = { {fixpt_one, fixpt_zero, fixpt_zero,
+					   fixpt_zero, fixpt_one, fixpt_zero,
+					   fixpt_zero, fixpt_zero, fixpt_one} };
+
+	test_init(data);
+
+	if (!data->plane_has_color_management) {
+		igt_info("Plane does not support color management, skipping the test.\n");
+		return;
+	}
+
+	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &rfb);
+	draw_color(&rfb, 126.0/255, 0, 126.0/255);
+	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &afb);
+	draw_color(&afb, 252.0/255, 0.0, 252.0/255);
+
+	igt_info("Reference image: mixed mapping\n");
+	igt_plane_set_fb(data->primary, &rfb);
+	set_plane_ctm(data, &ctm_unit);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
+
+	igt_kmsg("Actual image: mixed mapping\n");
+	igt_plane_set_fb(data->primary, &afb);
+	set_plane_ctm(data, &ctm);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
+
+	igt_assert_crc_equal(&ref_crc, &new_crc);
+
+	test_fini(data);
+	igt_remove_fb(data->fd, &afb);
+	igt_remove_fb(data->fd, &rfb);
+}
+
+/* draw color bars */
+static void draw_fill_color_bar(igt_fb_t *fb, int w, int h)
+{
+	cairo_t *cr;
+	int gh = h/3;
+	int rh = h-gh*2;
+
+	cr = igt_get_cairo_ctx(fb->fd, fb);
+	igt_paint_color(cr, 0, 0, w, gh, 1.0, 0.0, 0.0);
+	igt_paint_color(cr, 0, gh, w, gh, 0.0, 1.0, 0.0);
+	igt_paint_color(cr, 0, gh*2, w, rh, 0.0, 0.0, 1.0);
+	igt_put_cairo_ctx(cr);
+}
+
+/* draw color bars in gradient without all-black pixels */
+static void draw_gradient_color_bar(igt_fb_t *fb, int w, int h)
+{
+	cairo_t *cr;
+	int gh = h/3;
+	int rh = h-gh*2;
+
+	cr = igt_get_cairo_ctx(fb->fd, fb);
+	igt_paint_color_gradient_range(cr, 0, 0, w, gh, 1.0, 0.0, 0.0,
+				       1.0/255, 0.0, 0.0);
+	igt_paint_color_gradient_range(cr, 0, gh, w, gh, 0.0, 1.0, 0.0,
+				       0.0, 1.0/255, 0.0);
+	igt_paint_color_gradient_range(cr, 0, gh*2, w, rh, 0.0, 0.0, 1.0,
+				       0.0, 0.0, 1.0/255);
+	igt_put_cairo_ctx(cr);
+}
+
+static void test_plane_max_degamma(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_fb_t rfb, afb;
+	igt_crc_t ref_crc, new_crc;
+	lut_t lut_max;
+
+	test_init(data);
+
+	lut_init(&lut_max, data->plane_degamma_lut_size);
+	lut_gen_max(&lut_max, 0xffff);
+
+	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &rfb);
+	draw_fill_color_bar(&rfb, data->w, data->h);
+	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &afb);
+	draw_gradient_color_bar(&afb, data->w, data->h);
+
+	igt_info("Reference image: max degamma\n");
+	igt_plane_set_fb(data->primary, &rfb);
+	set_plane_degamma_lut(data, NULL);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
+
+	igt_info("Actual image: max degamma\n");
+	igt_plane_set_fb(data->primary, &afb);
+	set_plane_degamma_lut(data, &lut_max);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
+
+	igt_assert_crc_equal(&ref_crc, &new_crc);
+
+	test_fini(data);
+	igt_remove_fb(data->fd, &rfb);
+	igt_remove_fb(data->fd, &afb);
+	lut_free(&lut_max);
+}
+
 igt_main
 {
 	data_t data;
@@ -398,6 +776,12 @@ igt_main
 	igt_subtest("crtc-linear-regamma") test_crtc_linear_regamma(&data);
 	igt_subtest("crtc-lut-accuracy") test_crtc_lut_accuracy(&data);
 
+	igt_subtest("plane-ctm-color-remapping") test_plane_ctm_color_remapping(&data);
+	igt_subtest("plane-ctm-intensity-reduction") test_plane_ctm_intensity_reduction(&data);
+	igt_subtest("plane-ctm-negative-mapping") test_plane_ctm_negative_mapping(&data);
+	igt_subtest("plane-ctm-mixed-mapping") test_plane_ctm_mixed_mapping(&data);
+	igt_subtest("plane-max-degamma") test_plane_max_degamma(&data);
+
 	igt_fixture
 	{
 		igt_display_fini(&data.display);
-- 
2.25.1
