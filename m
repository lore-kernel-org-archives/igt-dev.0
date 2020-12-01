Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C438C6E519
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Dec 2020 14:52:58 +0000 (UTC)
From: "Patnana, Venkata Sai" <venkata.sai.patnana@intel.com>
Date: Tue, 1 Dec 2020 14:51:10 +0000
Message-ID: <DM6PR11MB4594D6C34F239F2D4D90487BB3F40@DM6PR11MB4594.namprd11.prod.outlook.com>
References: <20201127224030.8912-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20201127224030.8912-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_plane: optimize pixel
 format tests
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Change looks good to me.

Reviewed-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>

Venkatasai


-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Juha-Pekka Heikkila
Sent: Saturday, November 28, 2020 4:10 AM
To: igt-dev@lists.freedesktop.org
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_plane: optimize pixel format tests

On packed formats there's no need to show separate colors on separate fbs.
Here augmented path with packed color handling which check colors just on one fb.

This cannot be directly applied to planar yuv formats because of scaler use with those formats.

On my ICL this drop test execution time from 44.91s to 21.98s

v2 (vsyrjala): paint entire screen instead of lines. small refinement.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane.c | 159 ++++++++++++++++++++++++++++++----------------
 1 file changed, 106 insertions(+), 53 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c index 4ce859fba..e61a9b9f5 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -460,61 +460,72 @@ static bool set_c8_legacy_lut(data_t *data, enum pipe pipe,  return true;  }
 
+static void draw_entire_color_array(data_t *data, cairo_t *cr, uint32_t format,
+    struct igt_fb *fb)
+{
+const int color_amount = ARRAY_SIZE(colors_extended); const int x = 
+format == DRM_FORMAT_XRGB8888 ? 0 : data->crop;
+
+for (int n = 0; n < color_amount; n++) { int y = (fb->height - x * 2) * 
+n / color_amount + x;
+
+igt_paint_color(cr, x, y,
+fb->width - x * 2,
+(fb->height - x * 2) / color_amount,
+colors_extended[n].red,
+colors_extended[n].green,
+colors_extended[n].blue);
+}
+}
+
 static void prepare_format_color(data_t *data, enum pipe pipe,
  igt_plane_t *plane,
  uint32_t format, uint64_t modifier,
  int width, int height,
  enum igt_color_encoding color_encoding,
  enum igt_color_range color_range,
- const color_t *c, struct igt_fb *fb)
+ const color_t *c, struct igt_fb *fb,
+ bool packed)
 {
 cairo_t *cr;
+const int localcrop = format == DRM_FORMAT_XRGB8888 ? 0 : data->crop;
 
-if (data->crop == 0 || format == DRM_FORMAT_XRGB8888) { -igt_create_fb_with_bo_size(data->drm_fd, width, height,
-   format, modifier, color_encoding,
-   color_range, fb, 0, 0);
-
-cr = igt_get_cairo_ctx(data->drm_fd, fb);
-
-igt_paint_color(cr, 0, 0, width, height,
-c->red, c->green, c->blue);
-
-igt_put_cairo_ctx(cr);
-} else {
-igt_create_fb_with_bo_size(data->drm_fd,
-   width + data->crop * 2,
-   height + data->crop * 2,
-   format, modifier, color_encoding,
-   color_range, fb, 0, 0);
+igt_create_fb_with_bo_size(data->drm_fd,
+width + localcrop * 2,
+height + localcrop * 2,
+format, modifier, color_encoding,
+color_range, fb, 0, 0);
 
-/*
- * paint border in inverted color, then visible area in middle
- * with correct color for clamping test
- */
-cr = igt_get_cairo_ctx(data->drm_fd, fb);
+cr = igt_get_cairo_ctx(data->drm_fd, fb);
 
+/*
+ * paint border in inverted color, then visible area in middle
+ * with correct color for clamping test  */ if (localcrop)
 igt_paint_color(cr, 0, 0,
-width + data->crop * 2,
-height + data->crop * 2,
+width + localcrop * 2,
+height + localcrop * 2,
 1.0f - c->red,
 1.0f - c->green,
 1.0f - c->blue);
 
-igt_paint_color(cr, data->crop, data->crop,
+
+if (packed)
+draw_entire_color_array(data, cr, format, fb); else igt_paint_color(cr, 
+localcrop, localcrop,
 width, height,
 c->red, c->green, c->blue);
 
-igt_put_cairo_ctx(cr);
-}
-
+igt_put_cairo_ctx(cr);
 igt_plane_set_fb(plane, fb);
 
 /*
- * if clamping test. DRM_FORMAT_XRGB8888 is used for reference color.
+ * if clamping test.
  */
-if (data->crop != 0 && format != DRM_FORMAT_XRGB8888) { -igt_fb_set_position(fb, plane, data->crop, data->crop);
+if (localcrop) {
+igt_fb_set_position(fb, plane, localcrop, localcrop);
 igt_fb_set_size(fb, plane, width, height);  igt_plane_set_size(plane, width, height);  } @@ -548,13 +559,35 @@ static void capture_crc(data_t *data, unsigned int vblank, igt_crc_t *crc)
       crc->frame, vblank);
 }
 
-static void capture_format_crcs(data_t *data, enum pipe pipe, -igt_plane_t *plane, -uint32_t format, uint64_t modifier, -int width, int height, -enum igt_color_encoding encoding, -enum igt_color_range range, -igt_crc_t crc[], struct igt_fb *fb)
+static void capture_format_crcs_packed(data_t *data, enum pipe pipe,
+       igt_plane_t *plane,
+       uint32_t format, uint64_t modifier,
+       int width, int height,
+       enum igt_color_encoding encoding,
+       enum igt_color_range range,
+       igt_crc_t crc[], struct igt_fb *fb) { struct igt_fb old_fb = 
+*fb; const color_t black = { 0.0f, 0.0f, 0.0f };
+
+prepare_format_color(data, pipe, plane, format, modifier,
+     width, height, encoding, range, &black, fb, true);
+
+igt_display_commit_atomic(&data->display, 
+DRM_MODE_ATOMIC_ALLOW_MODESET,
+  NULL);
+
+igt_remove_fb(data->drm_fd, &old_fb);
+
+igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc[0]); }
+
+static void capture_format_crcs_planar(data_t *data, enum pipe pipe,
+       igt_plane_t *plane,
+       uint32_t format, uint64_t modifier,
+       int width, int height,
+       enum igt_color_encoding encoding,
+       enum igt_color_range range,
+       igt_crc_t crc[], struct igt_fb *fb)
 {
 unsigned int vblank[ARRAY_SIZE(colors_extended)];
 struct drm_event_vblank ev;
@@ -567,7 +600,8 @@ restart_round:
 int ret;
 
 prepare_format_color(data, pipe, plane, format, modifier,
-     width, height, encoding, range, c, fb);
+     width, height, encoding, range, c, fb,
+     false);
 
 if (data->display.is_atomic && i >= 1) {  igt_assert(read(data->drm_fd, &ev, sizeof(ev)) == sizeof(ev)); @@ -683,12 +717,20 @@ static bool test_format_plane_colors(data_t *data, enum pipe pipe,  unsigned int crc_mismatch_mask = 0;  int crc_mismatch_count = 0;  bool result = true; -int i;
-
-capture_format_crcs(data, pipe, plane, format, modifier,
-    width, height, encoding, range, crc, fb);
-
-for (i = 0; i < data->num_colors; i++) {
+int i, total_crcs = 1;
+bool planar = igt_format_is_yuv_semiplanar(format);
+
+if (planar) {
+capture_format_crcs_planar(data, pipe, plane, format, modifier,
+   width, height, encoding, range, crc,
+   fb);
+total_crcs = data->num_colors;
+} else
+capture_format_crcs_packed(data, pipe, plane, format, modifier,
+   width, height, encoding, range, crc,
+   fb);
+
+for (i = 0; i < total_crcs; i++) {
 if (!igt_check_crc_equal(&crc[i], &ref_crc[i])) {  crc_mismatch_count++;  crc_mismatch_mask |= (1 << i); @@ -776,6 +818,7 @@ static bool test_format_plane_yuv(data_t *data, enum pipe pipe,  return result;  }
 
+enum crc_set {PACKED_CRC_SET = 0, PLANAR_CRC_SET = 1, MAX_CRC_SET = 2};
 static bool test_format_plane(data_t *data, enum pipe pipe,
       igt_output_t *output, igt_plane_t *plane)  { @@ -784,7 +827,8 @@ static bool test_format_plane(data_t *data, enum pipe pipe,  uint32_t format, ref_format;  uint64_t modifier, ref_modifier;  uint64_t width, height; -igt_crc_t ref_crc[ARRAY_SIZE(colors_extended)];
+igt_crc_t ref_crc[MAX_CRC_SET][ARRAY_SIZE(colors_extended)];
+igt_crc_t* crcset;
 bool result = true;
 
 /*
@@ -843,16 +887,22 @@ static bool test_format_plane(data_t *data, enum pipe pipe,  igt_remove_fb(data->drm_fd, &test_fb);  }
 
-capture_format_crcs(data, pipe, plane, format, modifier,
-    width, height, IGT_COLOR_YCBCR_BT709,
-    IGT_COLOR_YCBCR_LIMITED_RANGE, ref_crc, &fb);
+capture_format_crcs_packed(data, pipe, plane, format, modifier,
+   width, height, IGT_COLOR_YCBCR_BT709,
+   IGT_COLOR_YCBCR_LIMITED_RANGE,
+   ref_crc[PACKED_CRC_SET], &fb);
+
+capture_format_crcs_planar(data, pipe, plane, format, modifier,
+   width, height, IGT_COLOR_YCBCR_BT709,
+   IGT_COLOR_YCBCR_LIMITED_RANGE,
+   ref_crc[PLANAR_CRC_SET], &fb);
 
 /*
  * Make sure we have some difference between the colors. This
  * at least avoids claiming success when everything is just
  * black all the time (eg. if the plane is never even on).
  */
-igt_require(num_unique_crcs(ref_crc, data->num_colors) > 1);
+igt_require(num_unique_crcs(ref_crc[PLANAR_CRC_SET], data->num_colors) 
+> 1);
 
 for (int i = 0; i < plane->format_mod_count; i++) {  format = plane->formats[i]; @@ -870,16 +920,19 @@ static bool test_format_plane(data_t *data, enum pipe pipe,  continue;  }
 
+crcset = ref_crc[(igt_format_is_yuv_semiplanar(format)
+ ? PLANAR_CRC_SET : PACKED_CRC_SET)];
+
 if (igt_format_is_yuv(format))
 result &= test_format_plane_yuv(data, pipe, plane,  format, modifier,  width, height, -ref_crc, &fb);
+crcset, &fb);
 else
 result &= test_format_plane_rgb(data, pipe, plane,  format, modifier,  width, height, -ref_crc, &fb);
+crcset, &fb);
 
 if (format == DRM_FORMAT_C8)
 set_legacy_lut(data, pipe, LUT_MASK);
--
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
