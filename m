Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D606E29D
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2020 02:31:40 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Tue, 11 Feb 2020 04:31:08 +0200
Message-Id: <20200211023108.25369-8-imre.deak@intel.com>
In-Reply-To: <20200211023108.25369-1-imre.deak@intel.com>
References: <20200211023108.25369-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 8/8] lib/igt_fb: Make sure tiled YUV
 framebuffers are fully cleared
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

For tiled FBs that are mapped in an other way than a GTT map we need to
clear all tile-rows. Clearing only the first stride*height bytes may
leave tiles at the end of the FB uncleared.

v2:
- Don't calculate the plane size for unused planes. (Matt)

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/igt_fb.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index af3291a2..8bdb0a09 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -841,10 +841,21 @@ static void memset64(uint64_t *s, uint64_t c, size_t n)
 static void clear_yuv_buffer(struct igt_fb *fb)
 {
 	bool full_range = fb->color_range == IGT_COLOR_YCBCR_FULL_RANGE;
+	size_t plane_size[2];
 	void *ptr;
 
 	igt_assert(igt_format_is_yuv(fb->drm_format));
 
+	for (int i = 0; i < lookup_drm_format(fb->drm_format)->num_planes; i++) {
+		unsigned int tile_width, tile_height;
+
+		igt_assert_lt(i, ARRAY_SIZE(plane_size));
+		igt_get_fb_tile_size(fb->fd, fb->modifier, fb->plane_bpp[i],
+				     &tile_width, &tile_height);
+		plane_size[i] = fb->strides[i] *
+			ALIGN(fb->plane_height[i], tile_height);
+	}
+
 	/* Ensure the framebuffer is preallocated */
 	ptr = igt_fb_map_buffer(fb->fd, fb);
 	igt_assert(*(uint32_t *)ptr == 0);
@@ -853,48 +864,48 @@ static void clear_yuv_buffer(struct igt_fb *fb)
 	case DRM_FORMAT_NV12:
 		memset(ptr + fb->offsets[0],
 		       full_range ? 0x00 : 0x10,
-		       fb->strides[0] * fb->plane_height[0]);
+		       plane_size[0]);
 		memset(ptr + fb->offsets[1],
 		       0x80,
-		       fb->strides[1] * fb->plane_height[1]);
+		       plane_size[1]);
 		break;
 	case DRM_FORMAT_XYUV8888:
 		wmemset(ptr + fb->offsets[0], full_range ? 0x00008080 : 0x00108080,
-			fb->strides[0] * fb->plane_height[0] / sizeof(wchar_t));
+			plane_size[0] / sizeof(wchar_t));
 		break;
 	case DRM_FORMAT_YUYV:
 	case DRM_FORMAT_YVYU:
 		wmemset(ptr + fb->offsets[0],
 			full_range ? 0x80008000 : 0x80108010,
-			fb->strides[0] * fb->plane_height[0] / sizeof(wchar_t));
+			plane_size[0] / sizeof(wchar_t));
 		break;
 	case DRM_FORMAT_UYVY:
 	case DRM_FORMAT_VYUY:
 		wmemset(ptr + fb->offsets[0],
 			full_range ? 0x00800080 : 0x10801080,
-			fb->strides[0] * fb->plane_height[0] / sizeof(wchar_t));
+			plane_size[0] / sizeof(wchar_t));
 		break;
 	case DRM_FORMAT_P010:
 	case DRM_FORMAT_P012:
 	case DRM_FORMAT_P016:
 		wmemset(ptr, full_range ? 0 : 0x10001000,
-			fb->offsets[1] / sizeof(wchar_t));
+			plane_size[0] / sizeof(wchar_t));
 		wmemset(ptr + fb->offsets[1], 0x80008000,
-			fb->strides[1] * fb->plane_height[1] / sizeof(wchar_t));
+			plane_size[1] / sizeof(wchar_t));
 		break;
 	case DRM_FORMAT_Y210:
 	case DRM_FORMAT_Y212:
 	case DRM_FORMAT_Y216:
 		wmemset(ptr + fb->offsets[0],
 			full_range ? 0x80000000 : 0x80001000,
-			fb->strides[0] * fb->plane_height[0] / sizeof(wchar_t));
+			plane_size[0] / sizeof(wchar_t));
 		break;
 
 	case DRM_FORMAT_XVYU2101010:
 	case DRM_FORMAT_Y410:
 		wmemset(ptr + fb->offsets[0],
 			full_range ? 0x20000200 : 0x20010200,
-		fb->strides[0] * fb->plane_height[0] / sizeof(wchar_t));
+			plane_size[0] / sizeof(wchar_t));
 		break;
 
 	case DRM_FORMAT_XVYU12_16161616:
@@ -903,7 +914,7 @@ static void clear_yuv_buffer(struct igt_fb *fb)
 	case DRM_FORMAT_Y416:
 		memset64(ptr + fb->offsets[0],
 			 full_range ? 0x800000008000ULL : 0x800010008000ULL,
-			 fb->strides[0] * fb->plane_height[0] / sizeof(uint64_t));
+			 plane_size[0] / sizeof(uint64_t));
 		break;
 	}
 
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
