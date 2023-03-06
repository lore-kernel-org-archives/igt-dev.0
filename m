Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF99610E0DF
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Mar 2023 19:12:03 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Mar 2023 00:40:47 +0530
Message-Id: <20230306191050.25936-2-ananya.sharma@intel.com>
In-Reply-To: <20230306191050.25936-1-ananya.sharma@intel.com>
References: <20230306191050.25936-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 1/4] tests/kms_color_helper: helper to
 enable MPO + pipe color test
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

Adding support of multiple planes in pipe color test by splitting the
screen into two parts i.e. one plane having RGB format and another
one having NV12 format. To add this support for multiple planes the
two functions paint_rectangle() and paint_gradient_rectangle() are
modified in kms_color_helper accordingly. This patch contains the
effected changes that will take place in kms_color and
kms_color_chamelium due to the changes in kms_color_helper.

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/chamelium/kms_chamelium_color.c | 23 +++++++++++++++--------
 tests/kms_color.c                     | 24 ++++++++++++++++--------
 tests/kms_color_helper.c              | 26 +++++++++++++++-----------
 tests/kms_color_helper.h              | 10 ++++++++--
 4 files changed, 54 insertions(+), 29 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 907f4dd5..7b9f8edc 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -85,12 +85,14 @@ static bool test_pipe_degamma(data_t *data,
 	igt_display_commit(&data->display);
 
 	/* Draw solid colors with linear degamma transformation. */
-	paint_rectangles(data, mode, red_green_blue, &fbref);
+	paint_rectangles(data, mode->vdisplay, mode->hdisplay,
+			 0, 0, red_green_blue, &fbref);	
 
 	/* Draw a gradient with degamma LUT to remap all
 	 * values to max red/green/blue.
 	 */
-	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+	paint_gradient_rectangles(data, mode->vdisplay, mode->hdisplay,
+				  0, 0, red_green_blue, &fb);
 	igt_plane_set_fb(primary, &fb);
 	set_degamma(data, primary->pipe, degamma_full);
 	igt_display_commit(&data->display);
@@ -175,12 +177,14 @@ static bool test_pipe_gamma(data_t *data,
 	igt_display_commit(&data->display);
 
 	/* Draw solid colors with no gamma transformation. */
-	paint_rectangles(data, mode, red_green_blue, &fbref);
+	paint_rectangles(data, mode->vdisplay, mode->hdisplay,
+			 0, 0, red_green_blue, &fbref);
 
 	/* Draw a gradient with gamma LUT to remap all values
 	 * to max red/green/blue.
 	 */
-	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+	paint_gradient_rectangles(data, mode->vdisplay, mode->hdisplay,
+				  0, 0, red_green_blue, &fb);
 	igt_plane_set_fb(primary, &fb);
 	igt_display_commit(&data->display);
 	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
@@ -269,10 +273,11 @@ static bool test_pipe_ctm(data_t *data,
 	disable_ctm(primary->pipe);
 	igt_display_commit(&data->display);
 
-	paint_rectangles(data, mode, after, &fbref);
+	paint_rectangles(data, mode->vdisplay, mode->hdisplay,
+			 0, 0, after, &fbref);
 
 	/* With CTM transformation. */
-	paint_rectangles(data, mode, before, &fb);
+	paint_rectangles(data, mode->vdisplay, mode->hdisplay, 0, 0, before, &fb);
 	igt_plane_set_fb(primary, &fb);
 	set_ctm(primary->pipe, ctm_matrix);
 	igt_display_commit(&data->display);
@@ -367,7 +372,8 @@ static bool test_pipe_limited_range_ctm(data_t *data,
 	igt_output_set_prop_value(output,
 				  IGT_CONNECTOR_BROADCAST_RGB,
 				  BROADCAST_RGB_FULL);
-	paint_rectangles(data, mode, red_green_blue_limited, &fb);
+	paint_rectangles(data, mode->vdisplay, mode->hdisplay,
+			 0, 0, red_green_blue_limited, &fb);
 	igt_plane_set_fb(primary, &fb);
 	igt_display_commit(&data->display);
 
@@ -375,7 +381,8 @@ static bool test_pipe_limited_range_ctm(data_t *data,
 	igt_output_set_prop_value(output,
 				  IGT_CONNECTOR_BROADCAST_RGB,
 				  BROADCAST_RGB_16_235);
-	paint_rectangles(data, mode, red_green_blue_full, &fb);
+	paint_rectangles(data, mode->vdisplay, mode->hdisplay,
+			 0, 0, red_green_blue_full, &fb);
 
 	/* And reset.. */
 	igt_output_set_prop_value(output,
diff --git a/tests/kms_color.c b/tests/kms_color.c
index 45570083..ce8895e9 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -76,7 +76,8 @@ static bool test_pipe_degamma(data_t *data,
 	igt_display_commit(&data->display);
 
 	/* Draw solid colors with linear degamma transformation. */
-	paint_rectangles(data, mode, red_green_blue, &fb);
+	paint_rectangles(data, mode->vdisplay, mode->hdisplay,
+			 0, 0, red_green_blue, &fb);
 	igt_plane_set_fb(primary, &fb);
 	igt_display_commit(&data->display);
 	igt_wait_for_vblank(data->drm_fd,
@@ -87,7 +88,8 @@ static bool test_pipe_degamma(data_t *data,
 	 * Draw a gradient with degamma LUT to remap all
 	 * values to max red/green/blue.
 	 */
-	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+	paint_gradient_rectangles(data, mode->vdisplay, mode->hdisplay,
+				  0, 0, red_green_blue, &fb);
 	igt_plane_set_fb(primary, &fb);
 	set_degamma(data, primary->pipe, degamma_full);
 	igt_display_commit(&data->display);
@@ -166,7 +168,8 @@ static bool test_pipe_gamma(data_t *data,
 	igt_display_commit(&data->display);
 
 	/* Draw solid colors with no gamma transformation. */
-	paint_rectangles(data, mode, red_green_blue, &fb);
+	paint_rectangles(data, mode->vdisplay, mode->hdisplay,
+			 0, 0, red_green_blue, &fb);
 	igt_plane_set_fb(primary, &fb);
 	igt_display_commit(&data->display);
 	igt_wait_for_vblank(data->drm_fd,
@@ -177,7 +180,8 @@ static bool test_pipe_gamma(data_t *data,
 	 * Draw a gradient with gamma LUT to remap all values
 	 * to max red/green/blue.
 	 */
-	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+	paint_gradient_rectangles(data, mode->vdisplay, mode->hdisplay,
+				  0, 0, red_green_blue, &fb);
 	igt_plane_set_fb(primary, &fb);
 	igt_display_commit(&data->display);
 	igt_wait_for_vblank(data->drm_fd,
@@ -263,7 +267,8 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	igt_display_commit(&data->display);
 
 	/* Draw solid colors with no gamma transformation. */
-	paint_rectangles(data, mode, red_green_blue, &fb);
+	paint_rectangles(data, mode->vdisplay, mode->hdisplay,
+			 0, 0, red_green_blue, &fb);
 	igt_plane_set_fb(primary, &fb);
 	igt_display_commit(&data->display);
 	igt_wait_for_vblank(data->drm_fd,
@@ -274,7 +279,8 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	 * Draw a gradient with gamma LUT to remap all values
 	 * to max red/green/blue.
 	 */
-	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+	paint_gradient_rectangles(data, mode->vdisplay, mode->hdisplay,
+				  0, 0, red_green_blue, &fb);
 	igt_plane_set_fb(primary, &fb);
 
 	red_lut[0] = green_lut[0] = blue_lut[0] = 0;
@@ -517,7 +523,8 @@ static bool test_pipe_ctm(data_t *data,
 	disable_ctm(primary->pipe);
 	igt_display_commit(&data->display);
 
-	paint_rectangles(data, mode, after, &fb);
+	paint_rectangles(data, mode->vdisplay, mode->hdisplay,
+			 0, 0, after, &fb);
 	igt_plane_set_fb(primary, &fb);
 	set_ctm(primary->pipe, ctm_identity);
 	igt_display_commit(&data->display);
@@ -526,7 +533,8 @@ static bool test_pipe_ctm(data_t *data,
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_software);
 
 	/* With CTM transformation. */
-	paint_rectangles(data, mode, before, &fb);
+	paint_rectangles(data, mode->vdisplay, mode->hdisplay,
+			 0, 0, before, &fb);
 	igt_plane_set_fb(primary, &fb);
 	set_ctm(primary->pipe, ctm_matrix);
 	igt_display_commit(&data->display);
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 55f3e409..dbcb3f34 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -41,20 +41,22 @@ uint64_t get_max_bpc(igt_output_t *output)
 }
 
 void paint_gradient_rectangles(data_t *data,
-			       drmModeModeInfo *mode,
+			       uint16_t vdisplay,
+			       uint16_t hdisplay,
+			       int x, int y,
 			       color_t *colors,
 			       struct igt_fb *fb)
 {
 	cairo_t *cr = igt_get_cairo_ctx(data->drm_fd, fb);
-	int i, l = mode->hdisplay / 3;
-	int rows_remaining = mode->hdisplay % 3;
+	int i, l = hdisplay / 3;
+	int rows_remaining = hdisplay % 3;
 
 	/* Paint 3 gradient rectangles with red/green/blue between 1.0 and
 	 * 0.5. We want to avoid 0 so each max LUTs only affect their own
 	 * rectangle.
 	 */
 	for (i = 0 ; i < 3; i++) {
-		igt_paint_color_gradient_range(cr, i * l, 0, l, mode->vdisplay,
+		igt_paint_color_gradient_range(cr, (x + (i * l)), y, l, vdisplay,
 					       colors[i].r != 0 ? 0.2 : 0,
 					       colors[i].g != 0 ? 0.2 : 0,
 					       colors[i].b != 0 ? 0.2 : 0,
@@ -64,8 +66,8 @@ void paint_gradient_rectangles(data_t *data,
 	}
 
 	if (rows_remaining > 0)
-		igt_paint_color_gradient_range(cr, i * l, 0, rows_remaining,
-					       mode->vdisplay,
+		igt_paint_color_gradient_range(cr, (x + (i * l)), y, rows_remaining,
+					       vdisplay,
 					       colors[i-1].r != 0 ? 0.2 : 0,
 					       colors[i-1].g != 0 ? 0.2 : 0,
 					       colors[i-1].b != 0 ? 0.2 : 0,
@@ -77,22 +79,24 @@ void paint_gradient_rectangles(data_t *data,
 }
 
 void paint_rectangles(data_t *data,
-		      drmModeModeInfo *mode,
+		      uint16_t vdisplay,
+		      uint16_t hdisplay,
+		      int x, int y,
 		      color_t *colors,
 		      struct igt_fb *fb)
 {
 	cairo_t *cr = igt_get_cairo_ctx(data->drm_fd, fb);
-	int i, l = mode->hdisplay / 3;
-	int rows_remaining = mode->hdisplay % 3;
+	int i, l = hdisplay / 3;
+	int rows_remaining = hdisplay % 3;
 
 	/* Paint 3 solid rectangles. */
 	for (i = 0 ; i < 3; i++) {
-		igt_paint_color(cr, i * l, 0, l, mode->vdisplay,
+		igt_paint_color(cr, (x + (i * l)), y, l, vdisplay,
 				colors[i].r, colors[i].g, colors[i].b);
 	}
 
 	if (rows_remaining > 0)
-		igt_paint_color(cr, i * l, 0, rows_remaining, mode->vdisplay,
+		igt_paint_color(cr, (x + (i * l)), y, rows_remaining, vdisplay,
 				colors[i-1].r, colors[i-1].g, colors[i-1].b);
 
 	igt_put_cairo_ctx(cr);
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index f9242232..15937ddf 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -51,9 +51,11 @@ typedef struct {
 	igt_pipe_crc_t *pipe_crc;
 	igt_output_t *output;
 	igt_plane_t *primary;
+	igt_plane_t *overlay;
 	drmModeModeInfo *mode;
 
 	uint32_t drm_format;
+	uint32_t drm_format_overlay;
 	uint32_t color_depth;
 	uint64_t degamma_lut_size;
 	uint64_t gamma_lut_size;
@@ -72,11 +74,15 @@ typedef struct {
 bool panel_supports_deep_color(int fd, char *output_name);
 uint64_t get_max_bpc(igt_output_t *output);
 void paint_gradient_rectangles(data_t *data,
-			       drmModeModeInfo *mode,
+			       uint16_t vdisplay,
+			       uint16_t hdisplay,
+			       int x, int y,
 			       color_t *colors,
 			       struct igt_fb *fb);
 void paint_rectangles(data_t *data,
-		      drmModeModeInfo *mode,
+		      uint16_t vdisplay,
+		      uint16_t hdisplay,
+		      int x, int y,
 		      color_t *colors,
 		      struct igt_fb *fb);
 gamma_lut_t *alloc_lut(int lut_size);
-- 
2.25.1
