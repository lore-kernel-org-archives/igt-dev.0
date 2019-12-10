Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690061.outbound.protection.outlook.com [40.107.69.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626606E81B
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2019 06:55:52 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Tue, 10 Dec 2019 14:55:19 +0800
Message-Id: <20191210065519.17847-1-stylon.wang@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/amdgpu: Test plane level CTM
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

From: Stylon Wang <stylon.wang@amd.com>
To: igt-dev@lists.freedesktop.org

Checks if plane-level color transformation works as expected as changing
color according to the supplied matrices.

Patch to support plane-level CTM is required to actually run the test.
If not available the test is skipped.

Signed-off-by: Stylon Wang <stylon.wang@amd.com>
---
 lib/igt_kms.c            |  15 ++
 lib/igt_kms.h            |   5 +
 tests/amdgpu/amd_color.c | 295 +++++++++++++++++++++++++++++++++++++--
 3 files changed, 304 insertions(+), 11 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e9b80b9b..e3edc68b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -387,6 +387,11 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_COLOR_RANGE] = "COLOR_RANGE",
 	[IGT_PLANE_PIXEL_BLEND_MODE] = "pixel blend mode",
 	[IGT_PLANE_ALPHA] = "alpha",
+	[IGT_PLANE_CTM] = "PLANE_CTM",
+	[IGT_PLANE_GAMMA_LUT] = "PLANE_GAMMA_LUT",
+	[IGT_PLANE_GAMMA_LUT_SIZE] = "PLANE_GAMMA_LUT_SIZE",
+	[IGT_PLANE_DEGAMMA_LUT] = "PLANE_DEGAMMA_LUT",
+	[IGT_PLANE_DEGAMMA_LUT_SIZE] = "PLANE_DEGAMMA_LUT_SIZE",
 	[IGT_PLANE_ZPOS] = "zpos",
 };
 
@@ -1814,6 +1819,16 @@ static void igt_plane_reset(igt_plane_t *plane)
 	if (igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
 		igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0xffff);
 
+	/* reset color management */
+	if (igt_plane_has_prop(plane, IGT_PLANE_CTM))
+		igt_plane_replace_prop_blob(plane, IGT_PLANE_CTM, NULL, 0);
+
+	if (igt_plane_has_prop(plane, IGT_PLANE_GAMMA_LUT))
+		igt_plane_replace_prop_blob(plane, IGT_PLANE_GAMMA_LUT, NULL, 0);
+
+	if (igt_plane_has_prop(plane, IGT_PLANE_DEGAMMA_LUT))
+		igt_plane_replace_prop_blob(plane, IGT_PLANE_DEGAMMA_LUT, NULL, 0);
+
 
 	igt_plane_clear_prop_changed(plane, IGT_PLANE_IN_FENCE_FD);
 	plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 7193f9a5..d6cccc8c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -275,6 +275,11 @@ enum igt_atomic_plane_properties {
        IGT_PLANE_PIXEL_BLEND_MODE,
        IGT_PLANE_ALPHA,
        IGT_PLANE_ZPOS,
+       IGT_PLANE_CTM,
+       IGT_PLANE_GAMMA_LUT,
+       IGT_PLANE_GAMMA_LUT_SIZE,
+       IGT_PLANE_DEGAMMA_LUT,
+       IGT_PLANE_DEGAMMA_LUT_SIZE,
        IGT_NUM_PLANE_PROPS
 };
 
diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index 0bbee43d..c1f597fd 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -20,6 +20,8 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <stdint.h>
+
 #include "igt.h"
 
 /* (De)gamma LUT. */
@@ -39,6 +41,7 @@ typedef struct color {
 typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
+	igt_plane_t *overlay;
 	igt_output_t *output;
 	igt_pipe_t *pipe;
 	igt_pipe_crc_t *pipe_crc;
@@ -47,10 +50,21 @@ typedef struct data {
 	int fd;
 	int w;
 	int h;
-	uint32_t regamma_lut_size;
-	uint32_t degamma_lut_size;
+	uint32_t crtc_regamma_lut_size;
+	uint32_t crtc_degamma_lut_size;
+	uint32_t plane_regamma_lut_size;
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
@@ -137,6 +151,18 @@ static void draw_color(igt_fb_t *fb, double r, double g, double b)
 	igt_put_cairo_ctx(fb->fd, fb, cr);
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
+	igt_put_cairo_ctx(fb->fd, fb, cr);
+}
+
 /* Generates the gamma test pattern. */
 static void draw_gamma_test(igt_fb_t *fb)
 {
@@ -161,7 +187,7 @@ static void set_degamma_lut(data_t *data, lut_t const *lut)
 				       size);
 }
 
-/* Sets the regamma LUT. */
+/* Sets the regamma LUT on. */
 static void set_regamma_lut(data_t *data, lut_t const *lut)
 {
 	size_t size = lut ? sizeof(lut->data[0]) * lut->size : 0;
@@ -171,6 +197,15 @@ static void set_regamma_lut(data_t *data, lut_t const *lut)
 				       size);
 }
 
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
@@ -190,19 +225,32 @@ static void test_init(data_t *data)
 
 	data->primary =
 		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+	data->overlay =
+		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
 
 	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
 					  INTEL_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_pipe(data->output, data->pipe_id);
 
-	data->degamma_lut_size =
+	data->crtc_degamma_lut_size =
 		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT_SIZE);
-	igt_assert_lt(0, data->degamma_lut_size);
+	igt_assert_lt(0, data->crtc_degamma_lut_size);
 
-	data->regamma_lut_size =
+	data->crtc_regamma_lut_size =
 		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_GAMMA_LUT_SIZE);
-	igt_assert_lt(0, data->regamma_lut_size);
+	igt_assert_lt(0, data->crtc_regamma_lut_size);
+
+	data->plane_has_color_management = igt_plane_has_prop(data->primary, IGT_PLANE_CTM);
+
+	if (data->plane_has_color_management) {
+		data->plane_degamma_lut_size =
+			igt_plane_get_prop(data->primary, IGT_PLANE_DEGAMMA_LUT_SIZE);
+
+		data->plane_regamma_lut_size =
+			igt_plane_get_prop(data->primary, IGT_PLANE_GAMMA_LUT_SIZE);
+	}
+
 
 	data->w = data->mode->hdisplay;
 	data->h = data->mode->vdisplay;
@@ -231,7 +279,7 @@ static void test_crtc_linear_degamma(data_t *data)
 
 	test_init(data);
 
-	lut_init(&lut_linear, data->degamma_lut_size);
+	lut_init(&lut_linear, data->crtc_degamma_lut_size);
 	lut_gen_linear(&lut_linear, 0xffff);
 
 	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &afb);
@@ -273,7 +321,7 @@ static void test_crtc_linear_regamma(data_t *data)
 
 	test_init(data);
 
-	lut_init(&lut_linear, data->regamma_lut_size);
+	lut_init(&lut_linear, data->crtc_regamma_lut_size);
 	lut_gen_linear(&lut_linear, 0xffff);
 
 	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &afb);
@@ -331,10 +379,10 @@ static void test_crtc_lut_accuracy(data_t *data)
 
 	test_init(data);
 
-	lut_init(&lut_degamma, data->degamma_lut_size);
+	lut_init(&lut_degamma, data->crtc_degamma_lut_size);
 	lut_gen_degamma_srgb(&lut_degamma, 0xffff);
 
-	lut_init(&lut_regamma, data->regamma_lut_size);
+	lut_init(&lut_regamma, data->crtc_regamma_lut_size);
 	lut_gen_regamma_srgb(&lut_regamma, 0xffff);
 
 	/* Don't draw across the whole screen to improve perf. */
@@ -375,6 +423,227 @@ static void test_crtc_lut_accuracy(data_t *data)
 	lut_free(&lut_degamma);
 }
 
+/* Test CTM on color remapping.
+ */
+static void test_plane_ctm_color_remapping(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_crc_t ref_crc, new_crc;
+	igt_fb_t afb;
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
+	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &afb);
+	igt_plane_set_fb(data->primary, &afb);
+	draw_rgb_color(&afb, blue, green, blue);
+
+	set_plane_ctm(data, &ctm_unit);
+	igt_kmsg("%s reference image\n", __func__);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
+	sleep(2);
+
+	draw_rgb_color(&afb, red, green, blue);
+	set_plane_ctm(data, &ctm);
+	igt_kmsg("%s actual image\n", __func__);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
+	sleep(2);
+
+	igt_assert_crc_equal(&ref_crc, &new_crc);
+
+	test_fini(data);
+	igt_remove_fb(data->fd, &afb);
+}
+
+/* Test CTM on intensity reduction
+ */
+static void test_plane_ctm_intensity_reduction(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_crc_t ref_crc, new_crc;
+	igt_fb_t afb;
+	color_t red = {1.0, 0.0, 0.0};
+	color_t green = {0.0, 1.0, 0.0};
+	color_t blue = {0.0, 0.0, 1.0};
+
+	struct {
+		const char *desc;
+		color_t expected_colors[3];
+		struct drm_color_ctm ctm;
+	} subitems[] =
+	{
+		{
+			"3/4 reduction",
+			{ {0.75, 0.0, 0.0},
+			  {0.0, 0.75, 0.0},
+			  {0.0, 0.0, 0.75} },
+			{ {fixpt_3_quarters, fixpt_zero, fixpt_zero,
+			   fixpt_zero, fixpt_3_quarters, fixpt_zero,
+			   fixpt_zero, fixpt_zero, fixpt_3_quarters} },
+		},
+		{
+			"1/2 reduction",
+			{ {0.5, 0.0, 0.0},
+			  {0.0, 0.5, 0.0},
+			  {0.0, 0.0, 0.5} },
+			{ {fixpt_half, fixpt_zero, fixpt_zero,
+			   fixpt_zero, fixpt_half, fixpt_zero,
+			   fixpt_zero, fixpt_zero, fixpt_half} },
+		},
+		{
+			"1/4 reduction",
+			{ {0.25, 0.0, 0.0},
+			  {0.0, 0.25, 0.0},
+			  {0.0, 0.0, 0.25} },
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
+	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &afb);
+	igt_plane_set_fb(data->primary, &afb);
+
+	for (i=0; i<sizeof(subitems)/sizeof(subitems[0]); ++i) {
+		igt_info("Testing %s\n", subitems[i].desc);
+
+		draw_rgb_color(&afb,
+			       subitems[i].expected_colors[0],
+			       subitems[i].expected_colors[1],
+			       subitems[i].expected_colors[2]
+			       );
+		set_plane_ctm(data, &ctm_unit);
+		igt_kmsg("%s reference image\n", __func__);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
+
+		draw_rgb_color(&afb, red, green, blue);
+		set_plane_ctm(data, &subitems[i].ctm);
+		igt_kmsg("%s actual image\n", __func__);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
+
+		igt_assert_crc_equal(&ref_crc, &new_crc);
+	}
+
+	test_fini(data);
+	igt_remove_fb(data->fd, &afb);
+}
+
+/* Test CTM on negative mapping of colors.
+ */
+static void test_plane_ctm_negative_mapping(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_crc_t ref_crc, new_crc;
+	igt_fb_t afb;
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
+	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &afb);
+	igt_plane_set_fb(data->primary, &afb);
+	draw_rgb_color(&afb, black, black, black);
+
+	set_plane_ctm(data, &ctm_unit);
+	igt_kmsg("%s reference image\n", __func__);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
+
+	draw_rgb_color(&afb, red, green, blue);
+	set_plane_ctm(data, &ctm);
+	igt_kmsg("%s actual image\n", __func__);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
+
+	igt_assert_crc_equal(&ref_crc, &new_crc);
+
+	test_fini(data);
+	igt_remove_fb(data->fd, &afb);
+}
+
+/* Test CTM on mixed (negative+positive) mapping of colors.
+ */
+static void test_plane_ctm_mixed_mapping(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_crc_t ref_crc, new_crc;
+	igt_fb_t afb;
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
+	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &afb);
+	igt_plane_set_fb(data->primary, &afb);
+	draw_color(&afb, 0.5, 0, 0.5);
+
+	set_plane_ctm(data, &ctm_unit);
+	igt_kmsg("%s reference image\n", __func__);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
+
+	draw_color(&afb, 1.0, 0.0, 1.0);
+	set_plane_ctm(data, &ctm);
+	igt_kmsg("%s actual image\n", __func__);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
+
+	igt_assert_crc_equal(&ref_crc, &new_crc);
+
+	test_fini(data);
+	igt_remove_fb(data->fd, &afb);
+}
+
 igt_main
 {
 	data_t data;
@@ -397,6 +666,10 @@ igt_main
 	igt_subtest("crtc-linear-degamma") test_crtc_linear_degamma(&data);
 	igt_subtest("crtc-linear-regamma") test_crtc_linear_regamma(&data);
 	igt_subtest("crtc-lut-accuracy") test_crtc_lut_accuracy(&data);
+	igt_subtest("plane-ctm-color-remapping") test_plane_ctm_color_remapping(&data);
+	igt_subtest("plane-ctm-intensity-reduction") test_plane_ctm_intensity_reduction(&data);
+	igt_subtest("plane-ctm-negative-mapping") test_plane_ctm_negative_mapping(&data);
+	igt_subtest("plane-ctm-mixed-mapping") test_plane_ctm_mixed_mapping(&data);
 
 	igt_fixture
 	{
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
