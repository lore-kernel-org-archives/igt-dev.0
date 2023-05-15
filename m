Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98F710E056
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 12:04:38 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 May 2023 17:33:32 +0530
Message-Id: <20230515120334.220022-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/igt_fb: round rgb->yuv conversion
 results
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

Round rgb->yuv conversion results.

Signed-off-by: Ville Syrjala <ville.syrjala@linux.intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_fb.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 0fe5b6ad..2fa84288 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -3047,11 +3047,16 @@ static void igt_fb_destroy_cairo_shadow_buffer(struct igt_fb *shadow,
 	munmap(ptr, shadow->size);
 }
 
-static uint8_t clamprgb(float val)
+static uint8_t clamp8(float val)
 {
 	return clamp((int)(val + 0.5f), 0, 255);
 }
 
+static uint8_t clamp16(float val)
+{
+	return clamp((int)(val + 0.5f), 0, 65535);
+}
+
 static void read_rgb(struct igt_vec4 *rgb, const uint8_t *rgb24)
 {
 	rgb->d[0] = rgb24[2];
@@ -3062,9 +3067,9 @@ static void read_rgb(struct igt_vec4 *rgb, const uint8_t *rgb24)
 
 static void write_rgb(uint8_t *rgb24, const struct igt_vec4 *rgb)
 {
-	rgb24[2] = clamprgb(rgb->d[0]);
-	rgb24[1] = clamprgb(rgb->d[1]);
-	rgb24[0] = clamprgb(rgb->d[2]);
+	rgb24[2] = clamp8(rgb->d[0]);
+	rgb24[1] = clamp8(rgb->d[1]);
+	rgb24[0] = clamp8(rgb->d[2]);
 }
 
 struct fb_convert_buf {
@@ -3384,7 +3389,7 @@ static void convert_rgb24_to_yuv(struct fb_convert *cvt)
 
 			rgb_tmp += bpp;
 
-			*y_tmp = yuv.d[0];
+			*y_tmp = clamp8(yuv.d[0]);
 			y_tmp += params.ay_inc;
 
 			if ((i % dst_fmt->vsub) || (j % dst_fmt->hsub))
@@ -3414,8 +3419,8 @@ static void convert_rgb24_to_yuv(struct fb_convert *cvt)
 			read_rgb(&pair_rgb, pair_rgb24);
 			pair_yuv = igt_matrix_transform(&m, &pair_rgb);
 
-			*u_tmp = (yuv.d[1] + pair_yuv.d[1]) / 2.0f;
-			*v_tmp = (yuv.d[2] + pair_yuv.d[2]) / 2.0f;
+			*u_tmp = clamp8((yuv.d[1] + pair_yuv.d[1]) / 2.0f);
+			*v_tmp = clamp8((yuv.d[2] + pair_yuv.d[2]) / 2.0f);
 
 			u_tmp += params.uv_inc;
 			v_tmp += params.uv_inc;
@@ -3573,7 +3578,7 @@ static void convert_float_to_yuv16(struct fb_convert *cvt, bool alpha)
 
 			rgb_tmp += fpp;
 
-			*y_tmp = yuv.d[0];
+			*y_tmp = clamp16(yuv.d[0]);
 			y_tmp += params.ay_inc;
 
 			if ((i % dst_fmt->vsub) || (j % dst_fmt->hsub))
@@ -3603,8 +3608,8 @@ static void convert_float_to_yuv16(struct fb_convert *cvt, bool alpha)
 			read_rgbf(&pair_rgb, pair_float);
 			pair_yuv = igt_matrix_transform(&m, &pair_rgb);
 
-			*u_tmp = (yuv.d[1] + pair_yuv.d[1]) / 2.0f;
-			*v_tmp = (yuv.d[2] + pair_yuv.d[2]) / 2.0f;
+			*u_tmp = clamp16((yuv.d[1] + pair_yuv.d[1]) / 2.0f);
+			*v_tmp = clamp16((yuv.d[2] + pair_yuv.d[2]) / 2.0f);
 
 			u_tmp += params.uv_inc;
 			v_tmp += params.uv_inc;
-- 
2.25.1
