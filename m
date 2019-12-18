Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359F46EA63
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2019 19:39:17 +0000 (UTC)
From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Date: Wed, 18 Dec 2019 11:39:08 -0800
Message-Id: <20191218193915.1375365-4-vanshidhar.r.konda@intel.com>
In-Reply-To: <20191218193915.1375365-1-vanshidhar.r.konda@intel.com>
References: <20191218193915.1375365-1-vanshidhar.r.konda@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 03/10] lib/igt_fb: Switch from XY_FAST_COPY_BLT to
 XY_SRC_COPY_BLT
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

The XY_SRC_COPY_BLT instruction is supported on more platforms than
XY_FAST_COPY_BLT - use it for X and Y tiling copying using blitter. For
other tiling modes use the XY_FAST_COPY_BLT.

Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
---
 lib/igt_fb.c | 51 +++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index e6eb39ac..35a50eeb 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2056,27 +2056,50 @@ static void copy_with_engine(struct fb_blit_upload *blit,
 static void blitcopy(const struct igt_fb *dst_fb,
 		     const struct igt_fb *src_fb)
 {
+	uint32_t src_tiling, dst_tiling;
+
 	igt_assert_eq(dst_fb->fd, src_fb->fd);
 	igt_assert_eq(dst_fb->num_planes, src_fb->num_planes);
 
+	src_tiling = igt_fb_mod_to_tiling(src_fb->modifier);
+	dst_tiling = igt_fb_mod_to_tiling(dst_fb->modifier);
+
 	for (int i = 0; i < dst_fb->num_planes; i++) {
 		igt_assert_eq(dst_fb->plane_bpp[i], src_fb->plane_bpp[i]);
 		igt_assert_eq(dst_fb->plane_width[i], src_fb->plane_width[i]);
 		igt_assert_eq(dst_fb->plane_height[i], src_fb->plane_height[i]);
-
-		igt_blitter_fast_copy__raw(dst_fb->fd,
-					   src_fb->gem_handle,
-					   src_fb->offsets[i],
-					   src_fb->strides[i],
-					   igt_fb_mod_to_tiling(src_fb->modifier),
-					   0, 0, /* src_x, src_y */
-					   dst_fb->plane_width[i], dst_fb->plane_height[i],
-					   dst_fb->plane_bpp[i],
-					   dst_fb->gem_handle,
-					   dst_fb->offsets[i],
-					   dst_fb->strides[i],
-					   igt_fb_mod_to_tiling(dst_fb->modifier),
-					   0, 0 /* dst_x, dst_y */);
+		if ((src_tiling > I915_TILING_Y) || (dst_tiling > I915_TILING_Y)) {
+			igt_assert(intel_gen(intel_get_drm_devid(src_fb->fd)) >= 9);
+			igt_blitter_fast_copy__raw(dst_fb->fd,
+						   src_fb->gem_handle,
+						   src_fb->offsets[i],
+						   src_fb->strides[i],
+						   src_tiling,
+						   0, 0, /* src_x, src_y */
+						   dst_fb->plane_width[i],
+						   dst_fb->plane_height[i],
+						   dst_fb->plane_bpp[i],
+						   dst_fb->gem_handle,
+						   dst_fb->offsets[i],
+						   dst_fb->strides[i],
+						   dst_tiling,
+						   0, 0 /* dst_x, dst_y */);
+		} else {
+			igt_blitter_src_copy__raw(dst_fb->fd,
+						  src_fb->gem_handle,
+						  src_fb->offsets[i],
+						  src_fb->strides[i],
+						  src_tiling,
+						  0, 0, /* src_x, src_y */
+						  dst_fb->plane_width[i],
+						  dst_fb->plane_height[i],
+						  dst_fb->plane_bpp[i],
+						  dst_fb->gem_handle,
+						  dst_fb->offsets[i],
+						  dst_fb->strides[i],
+						  dst_tiling,
+						  0, 0 /* dst_x, dst_y */);
+		}
 	}
 }
 
-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
