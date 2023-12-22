Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA51110E7D2
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 14:32:36 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 11/15] tests/kms_big_fb: Test planar YCbCr formats
Date: Fri, 22 Dec 2023 16:31:55 +0200
Message-ID: <20231222143159.24662-12-ville.syrjala@linux.intel.com>
In-Reply-To: <20231222143159.24662-1-ville.syrjala@linux.intel.com>
References: <20231222143159.24662-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Panning around inside planar YCbCr framebuffers is a bit
more involved that the RGB counterpart. It seems prudent
to test that we are correctly handling these case.

We'll manually trick rendercopy to also copy the chroma
plane for us. It might be nice to make rendercopy eventually
handle this entirely on its own, but for now we'll take this
slight shortcut.
---
 tests/intel/kms_big_fb.c | 38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 2b6fadeaa7a6..5dadf67bb020 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -42,27 +42,27 @@
 #include "xe/xe_query.h"
 
 /**
- * SUBTEST: linear-%dbpp-rotate-%d
+ * SUBTEST: linear-%s-rotate-%d
  * Description: Sanity check if addfb ioctl works correctly for given combination
  *              of Linear modifier with %arg[1]-bpp & %arg[2]-rotation
  * Functionality: big_fbs, kms_gem_interop, rotation
  *
- * SUBTEST: linear-%dbpp-rotate-%d-hflip
+ * SUBTEST: linear-%s-rotate-%d-hflip
  * Description: Sanity check if addfb ioctl works correctly for given combination
  *              of Linear modifier with %arg[1]-bpp & %arg[2]-rotation
  * Functionality: big_fbs, kms_gem_interop, rotation
  *
- * arg[1].values:       8, 16, 32, 64
+ * arg[1].values:       8bpp, 16bpp, 32bpp, 64bpp, nv12, p016
  * arg[2].values:       0, 90, 180, 270
  */
 
 /**
- * SUBTEST: %s-%dbpp-rotate-%d
+ * SUBTEST: %s-%s-rotate-%d
  * Description: Sanity check if addfb ioctl works correctly for given combination
  *              of %arg[1] with %arg[2]-bpp & %arg[3]-rotation
  * Functionality: big_fbs, kms_gem_interop, rotation, tiling
  *
- * SUBTEST: %s-%dbpp-rotate-%d-hflip
+ * SUBTEST: %s-%s-rotate-%d-hflip
  * Description: Sanity check if addfb ioctl works correctly for given combination
  *              of %arg[1] with %arg[2]-bpp & %arg[3]-rotation
  * Functionality: big_fbs, kms_gem_interop, rotation, tiling
@@ -74,7 +74,7 @@
  * @y-tiled:            TILE-Y modifier
  * @yf-tiled:           TILE-YF modifier
  *
- * arg[2].values:       8, 16, 32, 64
+ * arg[2].values:       8bpp, 16bpp, 32bpp, 64bpp, nv12, p016
  * arg[3].values:       0, 90, 180, 270
  *
  * arg[4]:
@@ -237,6 +237,18 @@ static void copy_pattern(data_t *data,
 	 */
 	if (data->render_copy) {
 		data->render_copy(data->ibb, src, sx, sy, w, h, dst, dx, dy);
+
+		/* FIXME rendercopy should do this for us perhaps? */
+		if (igt_format_is_yuv_semiplanar(data->format)) {
+			igt_assert(!igt_fb_is_ccs_modifier(data->modifier));
+
+			src->bpp *= 2;
+			src->surface[0] = src->surface[1];
+			dst->bpp *= 2;
+			dst->surface[0] = dst->surface[1];
+
+			data->render_copy(data->ibb, src, sx/2, sy/2, w/2, h/2, dst, dx/2, dy/2);
+		}
 	} else {
 		w = min(w, src_fb->width - sx);
 		w = min(w, dst_fb->width - dx);
@@ -320,6 +332,10 @@ static void generate_pattern(data_t *data,
 				     pat_fb.width, pat_fb.height);
 			w++;
 			h++;
+			if (igt_format_is_yuv_semiplanar(data->format)) {
+				w++;
+				h++;
+			}
 		}
 	}
 
@@ -479,8 +495,9 @@ static bool test_plane(data_t *data)
 		int y = coords[i].y;
 
 		/* Hardware limitation */
-		if (data->format == DRM_FORMAT_RGB565 &&
-		    igt_rotation_90_or_270(data->rotation)) {
+		if ((data->format == DRM_FORMAT_RGB565 &&
+		     igt_rotation_90_or_270(data->rotation)) ||
+		    igt_format_is_yuv_semiplanar(data->format)) {
 			x &= ~1;
 			y &= ~1;
 		}
@@ -941,6 +958,9 @@ static bool has_async_flip(data_t *data)
 	 * TODO: preferably probe all this stuff with
 	 * TEST_ONLY rather than hardcoding it...
 	 */
+	if (igt_format_is_yuv_semiplanar(data->format))
+		return false;
+
 	if (intel_display_ver(data->devid) < 12 &&
 	    data->modifier == DRM_FORMAT_MOD_LINEAR)
 		return false;
@@ -969,6 +989,8 @@ static const struct {
 	{ DRM_FORMAT_RGB565, "16bpp", },
 	{ DRM_FORMAT_XRGB8888, "32bpp", },
 	{ DRM_FORMAT_XBGR16161616F, "64bpp", },
+	{ DRM_FORMAT_NV12, "nv12", },
+	{ DRM_FORMAT_P016, "p016", },
 };
 
 static const igt_rotation_t rotations[] = {
-- 
2.41.0
