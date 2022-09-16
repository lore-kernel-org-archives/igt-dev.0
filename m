Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C792E10E411
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Sep 2022 13:03:58 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 16 Sep 2022 18:28:13 +0530
Message-Id: <20220916125819.516618-2-ananya.sharma@intel.com>
In-Reply-To: <20220916125819.516618-1-ananya.sharma@intel.com>
References: <20220916125819.516618-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/7] tests/kms_color_helper.c
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

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_color_helper.c | 27 +++++++++++++++------------
 tests/kms_color_helper.h |  8 ++++++--
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 55f3e409..2bda0e74 100644
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
+		igt_paint_color_gradient_range(cr, ( x + (i * l)), y, rows_remaining,
+					       vdisplay,
 					       colors[i-1].r != 0 ? 0.2 : 0,
 					       colors[i-1].g != 0 ? 0.2 : 0,
 					       colors[i-1].b != 0 ? 0.2 : 0,
@@ -77,22 +79,23 @@ void paint_gradient_rectangles(data_t *data,
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
-
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
index f0ae30e3..c5a01f0c 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -72,11 +72,15 @@ typedef struct {
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
