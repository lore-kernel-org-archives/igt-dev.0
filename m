Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533C76F615
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 18:16:15 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Wed, 29 Jan 2020 20:15:56 +0200
Message-Id: <20200129181601.15918-4-imre.deak@intel.com>
In-Reply-To: <20200129181601.15918-1-imre.deak@intel.com>
References: <20200129181601.15918-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/9] lib/igt_fb: Switch from
 XY_FAST_COPY_BLT to XY_SRC_COPY_BLT
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

From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>

The XY_SRC_COPY_BLT instruction is supported on more platforms than
XY_FAST_COPY_BLT - use it for X tiling on GEN12+ copying using blitter.
For other tiling modes/platforms use the XY_FAST_COPY_BLT as before.

v2:
- Use xy_src blit only - when necessary - on GEN12+/X-tiled mods.

Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_fb.c | 59 +++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 14 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index ec7e9991..53b43528 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2146,27 +2146,58 @@ static void copy_with_engine(struct fb_blit_upload *blit,
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
+		int gen = intel_gen(intel_get_drm_devid(src_fb->fd));
+
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
+		/*
+		 * On GEN12+ X-tiled format support is removed from the fast
+		 * blit command, so use the XY_SRC blit command for it
+		 * instead.
+		 */
+		if ((gen >= 9 && gen < 12) ||
+		    (gen >= 12 && (src_tiling != I915_TILING_X &&
+				   dst_tiling != I915_TILING_X))) {
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
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
