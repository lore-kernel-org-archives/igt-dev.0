Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6B56E575
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Dec 2021 06:55:11 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Wed, 1 Dec 2021 14:54:28 +0800
Message-ID: <20211201065434.48827-6-stylon.wang@amd.com>
In-Reply-To: <20211201065434.48827-1-stylon.wang@amd.com>
References: <20211130083503.10221-1-stylon.wang@amd.com>
 <20211201065434.48827-1-stylon.wang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2 05/11] tests/amdgpu/amd_plane: Create mpo
 panning test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Bhawanpreet.Lakha@amd.com, Ahmad.Othman@amd.com, Hayden.Goodfellow@amd.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

[Why]
Moving the MPO window is a common usecase (video window being moved).
This test creates a MPO window and moves it horizontally, vertically and
diagonally

[How]
Create common video resolution windows and move them across the
displays. Test pass is determined by getting a crc of window location
using a single plane, then recreating this scenario using overlay.

Test panes from Start->End1, Start->End2 and Start->End3

                  CRTC#1
    Start
    +--------+--------+--------+
    |Primary |  -->   |Primary | End1
    +--------+        +--------+
    |  |      \      Overlay   |
    |  v        *              |
    +--------+    \   +--------+
    |Primary |        |Primary | End2
    +--------+--------+--------+
     End3

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 tests/amdgpu/amd_plane.c | 261 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 261 insertions(+)

diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index 5666b9e7..09fcf3eb 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -26,6 +26,13 @@
 
 /* Maximum pipes on any AMD ASIC. */
 #define MAX_PIPES 6
+#define DISPLAYS_TO_TEST 2
+
+/* (De)gamma LUT. */
+typedef struct lut {
+	struct drm_color_lut *data;
+	uint32_t size;
+} lut_t;
 
 /* Common test data. */
 typedef struct data {
@@ -79,6 +86,63 @@ static const drmModeModeInfo test_mode_2 = {
 	.vscan = 0,
 };
 
+static const drmModeModeInfo test_mode_3 = {
+	.name = "3840x2160 Test",
+	.vrefresh = 60,
+	.clock = 594000,
+	.hdisplay = 3840,
+	.hsync_start = 4016,
+	.hsync_end = 4104,
+	.htotal = 4400,
+	.vdisplay = 2160,
+	.vsync_start = 2168,
+	.vsync_end = 2178,
+	.vtotal = 2250,
+	.type = DRM_MODE_TYPE_DRIVER,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	.hskew = 0,
+	.vscan = 0,
+};
+
+static void lut_init(lut_t *lut, uint32_t size)
+{
+	igt_assert(size > 0);
+	lut->size = size;
+	lut->data = malloc(size * sizeof(struct drm_color_lut));
+	igt_assert(lut);
+}
+static void lut_gen(lut_t *lut)
+{
+	uint32_t i;
+	/* 10% threshold */
+	uint32_t threshold = (256 * 10) / 100;
+
+	for (i = 0; i < threshold; ++i) {
+		uint32_t v = 0;
+		lut->data[i].red = v;
+		lut->data[i].blue = v;
+		lut->data[i].green = v;
+	}
+	for (i = threshold; i < lut->size; ++i) {
+		uint32_t v = 0xffff;
+		lut->data[i].red = v;
+		lut->data[i].blue = v;
+		lut->data[i].green = v;
+	}
+}
+static void lut_free(lut_t *lut)
+{
+	if (lut->data) {
+		free(lut->data);
+		lut->data = NULL;
+	}
+	lut->size = 0;
+}
+
+enum test {
+	MPO_SINGLE_PAN
+};
+
 static void test_init(data_t *data)
 {
 	igt_display_t *display = &data->display;
@@ -174,10 +238,205 @@ static void draw_color_alpha(igt_fb_t *fb, int x, int y, int w, int h,
 		             double r, double g, double b, double a)
 {
 	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
+	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
 	igt_paint_color_alpha(cr, x, y, w, h, r, g, b, a);
 	igt_put_cairo_ctx(cr);
 }
 
+struct fbc {
+	igt_fb_t ref_primary;
+	igt_fb_t test_primary;
+	igt_fb_t test_overlay;
+	igt_crc_t ref_crc;
+};
+
+/* Sets the regamma LUT. */
+static void set_regamma_lut(data_t *data, lut_t const *lut, int n)
+{
+	size_t size = lut ? sizeof(lut->data) * lut->size : 0;
+	const void *ptr = lut ? lut->data : NULL;
+	igt_pipe_obj_replace_prop_blob(data->pipe[n], IGT_CRTC_GAMMA_LUT, ptr,
+				       size);
+}
+
+/*
+ * Compares the result of white backgroud with white window with and without MPO
+ *
+ * Reference crc:
+ * Draws a White background of size (pw,ph).
+ *
+ * Test crc:
+ * Draws a White Overlay of size (pw,ph) then creates a cutout of size (p,w) at location (x,y)
+ * Draws a White Primary plane of size (p,w) at location (x,y) (under the overlay)
+ *
+ * NOTE: The reason for using White+White is to speed up the crc (reuse the ref crc for all cases vs taking
+ * a ref crc per flip)
+ */
+static void test_plane(data_t *data, int n, int x, int y, int w, int h, int pw, int ph, struct fbc *fbc){
+
+	igt_crc_t test_crc;
+	igt_display_t *display = &data->display;
+
+	/* Reference: */
+
+	igt_plane_set_fb(data->primary[n], &fbc[n].ref_primary);
+
+	igt_plane_set_position(data->primary[n], 0, 0);
+	igt_plane_set_size(data->primary[n], pw, ph);
+
+	igt_display_commit_atomic(display, 0, 0);
+
+	/* Test: */
+	/* Draw a white overlay with a cutout */
+	draw_color_alpha(&fbc[n].test_overlay, 0, 0, pw, ph, 1.0, 1.0, 1.0, 1.00);
+	draw_color_alpha(&fbc[n].test_overlay, x, y, w, h, 0.0, 0.0, 0.0, 0.0);
+
+	igt_plane_set_fb(data->primary[n], &fbc[n].test_primary);
+	igt_plane_set_fb(data->overlay[n], &fbc[n].test_overlay);
+
+	/* Move the overlay to cover the cutout */
+	igt_plane_set_position(data->primary[n], x, y);
+	igt_plane_set_size(data->primary[n], w, h);
+
+	igt_display_commit_atomic(display, 0, 0);
+	igt_pipe_crc_collect_crc(data->pipe_crc[n], &test_crc);
+	igt_plane_set_fb(data->overlay[n], NULL);
+
+	igt_assert_crc_equal(&fbc[n].ref_crc, &test_crc);
+
+	/* Set window to white, this is to avoid flashing between black/white after each flip */
+	draw_color_alpha(&fbc[n].ref_primary, 0, 0, pw, ph, 1.0, 1.0, 1.0, 1.00);
+	igt_plane_set_fb(data->primary[n], &fbc[n].ref_primary);
+	igt_plane_set_position(data->primary[n], 0, 0);
+	igt_plane_set_size(data->primary[n], pw, ph);
+	igt_display_commit_atomic(display, 0, 0);
+
+
+}
+/*
+ * MPO_SINGLE_PAN: This test moves the window (w,h) horizontally, vertically and diagonally
+ * Horizontal: from top-left (0,0) to top-right (pw-w,0)
+ * Vertical: from top-left (0,0) to bottom-left (0,ph-h)
+ * Diagonal: from top-left (0,0) to bottom-right (pw-w, ph-h)
+ */
+static void test_panning_1_display(data_t *data, int display_count, int w, int h, struct fbc *fb)
+{
+	/* x and y movements */
+	int dir[3][2]= {
+		{0,1}, /* Only Y */
+		{1,0}, /* Only X */
+		{1,1}, /* Both X and Y */
+
+	};
+
+	/* # of iterations to use to move from one side to the other */
+	int it = 3;
+
+	for (int n = 0; n < display_count; n++) {
+
+		int pw = data->w[n];
+		int ph = data->h[n];
+		int dx = (pw-w)/it;
+		int dy = (ph-h)/it;
+
+		for (int i = 0; i < ARRAY_SIZE(dir); i++){
+			for (int j = 0; j <= it; j++){
+
+				int x = dx*j*dir[i][0];
+				int y = dy*j*dir[i][1];
+
+				/* No need to pan a overley that is bigger than the display */
+				if (pw <= w && ph <= h)
+					break;
+
+				test_plane(data, n, x, y, w, h, pw, ph, fb);
+
+			}
+		}
+	}
+
+	return;
+
+
+}
+
+
+/*
+ * Setup and runner for panning test. Creates common video sizes and pans them across the display
+ */
+static void test_display_mpo(data_t *data, enum test test, uint32_t format, int display_count)
+{
+
+	igt_display_t *display = &data->display;
+	uint32_t regamma_lut_size;
+	lut_t lut;
+	struct fbc fb[4];
+	int videos[][2]= {
+		{426, 240},
+		{640, 360},
+		{854, 480},
+		{1280, 720},
+		{1920, 1080},
+		{2560, 1440},
+		{3840, 2160},
+	};
+
+	test_init(data);
+
+	regamma_lut_size = igt_pipe_obj_get_prop(data->pipe[0], IGT_CRTC_GAMMA_LUT_SIZE);
+	igt_assert_lt(0, regamma_lut_size);
+	lut_init(&lut, regamma_lut_size);
+	lut_gen(&lut);
+
+	for (int n = 0; n < display_count;  n++) {
+		int w = data->w[n];
+		int h = data->h[n];
+
+		if (w == 0) {
+			force_output_mode(data, data->output[n], &test_mode_3);
+			w = data->w[n] = test_mode_3.hdisplay;
+			h = data->h[n] = test_mode_3.vdisplay;
+		}
+
+		igt_output_set_pipe(data->output[n], data->pipe_id[n]);
+
+		igt_create_fb(data->fd, w, h, DRM_FORMAT_XRGB8888, 0, &fb[n].ref_primary);
+		igt_create_color_fb(data->fd, w, h, DRM_FORMAT_XRGB8888, 0, 1.0, 1.0, 1.0, &fb[n].ref_primary);
+		igt_create_fb(data->fd, w, h, DRM_FORMAT_ARGB8888, 0, &fb[n].test_overlay);
+
+		igt_plane_set_fb(data->primary[n], &fb[n].ref_primary);
+
+		if (format == DRM_FORMAT_NV12)
+			set_regamma_lut(data, &lut,  n);
+	}
+
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
+
+	for (int n = 0; n < display_count; n++)
+		igt_pipe_crc_collect_crc(data->pipe_crc[n], &fb[n].ref_crc);
+
+	for (int i = 0; i < ARRAY_SIZE(videos); ++i) {
+
+		for (int n = 0; n < display_count; n++)
+			igt_create_color_fb(data->fd, videos[i][0], videos[i][1],
+					    format, 0, 1.0, 1.0, 1.0, &fb[n].test_primary);
+
+		if (test == MPO_SINGLE_PAN)
+			test_panning_1_display(data, display_count, videos[i][0], videos[i][1], fb);
+
+		for (int n = 0; n < display_count; n++)
+			igt_remove_fb(data->fd, &fb[n].test_primary);
+	}
+
+	test_fini(data);
+
+	lut_free(&lut);
+
+	for (int n = 0; n < display_count; n++) {
+		igt_remove_fb(data->fd, &fb[n].ref_primary);
+		igt_remove_fb(data->fd, &fb[n].test_overlay);
+	}
+}
 /*
  * Compares a white 4K reference FB against a white 4K primary FB and a
  * white 4K overlay with an RGBA (0, 0, 0, 0) cutout in the center.
@@ -395,6 +654,8 @@ igt_main
 	igt_subtest("mpo-swizzle-toggle") test_mpo_swizzle_toggle(&data);
 	igt_subtest("mpo-swizzle-toggle-multihead")
 		test_mpo_swizzle_toggle_multihead(&data);
+	igt_subtest("mpo-pan-rgb") test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_XRGB8888, DISPLAYS_TO_TEST);
+	igt_subtest("mpo-pan-nv12") test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_NV12, DISPLAYS_TO_TEST);
 
 	igt_fixture
 	{
-- 
2.33.1
