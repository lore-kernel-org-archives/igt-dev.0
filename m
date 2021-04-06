Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C576E11C
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Apr 2021 19:15:00 +0000 (UTC)
From: Sung Joon Kim <sungkim@amd.com>
Date: Tue,  6 Apr 2021 15:14:38 -0400
Message-Id: <20210406191439.56926-1-sungkim@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 1/2] lib/igt_fb: Add proper linear mode
 stride/size calculation for amdgpu
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

Allow plane stride/size calculation for linear tiling mode when rotation is applied. Does not have impact on other gpus.

Signed-off-by: Sung Joon Kim <sungkim@amd.com>
---
 lib/igt_amd.c | 31 ++++++++++++++++++++++++++++++-
 lib/igt_amd.h |  2 ++
 lib/igt_fb.c  | 35 +++++++++++++++++++----------------
 3 files changed, 51 insertions(+), 17 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index a4e1cb59..781da595 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -137,7 +137,36 @@ unsigned int igt_amd_fb_get_blk_size_table_idx(unsigned int bpp)
 
 	return blk_size_table_index;
 }
-
+void igt_amd_fb_calculate_dimension(uint64_t modifier, unsigned int bpp,
+				       unsigned int *width, unsigned int *height)
+{
+	uint64_t mod = AMD_FMT_MOD_GET(TILE, modifier);
+
+	switch(mod) {
+	case LOCAL_DRM_FORMAT_MOD_NONE:
+		if (*height > *width) {
+			/*
+			 * For rotated linear buffer
+			 * Called from setup_linear_mapping
+			 */
+			igt_amd_fb_calculate_tile_dimension(bpp, width, height);
+		}
+		else {
+			*width = 256 / (bpp >> 3);
+			// height is the same
+		}
+		break;
+	case AMD_FMT_MOD_TILE_GFX9_64K_S:
+	case AMD_FMT_MOD_TILE_GFX9_64K_D:
+	case AMD_FMT_MOD_TILE_GFX9_64K_S_X:
+	case AMD_FMT_MOD_TILE_GFX9_64K_D_X:
+	case AMD_FMT_MOD_TILE_GFX9_64K_R_X:
+		igt_amd_fb_calculate_tile_dimension(bpp, width, height);
+		break;
+	default:
+		igt_assert(false);
+	}
+}
 void igt_amd_fb_calculate_tile_dimension(unsigned int bpp,
 				       unsigned int *width, unsigned int *height)
 {
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index 6656d901..9e169604 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -31,6 +31,8 @@ void *igt_amd_mmap_bo(int fd, uint32_t handle, uint64_t size, int prot);
 unsigned int igt_amd_compute_offset(unsigned int* swizzle_pattern,
 				       unsigned int x, unsigned int y);
 unsigned int igt_amd_fb_get_blk_size_table_idx(unsigned int bpp);
+void igt_amd_fb_calculate_dimension(uint64_t modifier, unsigned int bpp,
+				       unsigned int *width, unsigned int *height);
 void igt_amd_fb_calculate_tile_dimension(unsigned int bpp,
 				       unsigned int *width, unsigned int *height);
 uint32_t igt_amd_fb_tiled_offset(unsigned int bpp, unsigned int x_input,
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 4ded7e78..c4501179 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -708,23 +708,26 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 		stride = roundup_power_of_two(stride);
 
 		return stride;
-	} else if (igt_format_is_yuv(fb->drm_format) && is_amdgpu_device(fb->fd)) {
+	} else if (is_amdgpu_device(fb->fd)) {
 		/*
 		 * Chroma address needs to be aligned to 256 bytes on AMDGPU
 		 * so the easiest way is to align the luma stride to 256.
 		 */
-		return ALIGN(min_stride, 256);
-	} else if (fb->modifier != LOCAL_DRM_FORMAT_MOD_NONE && is_amdgpu_device(fb->fd)) {
-		/*
-		 * For amdgpu device with tiling mode
-		 */
-		unsigned int tile_width, tile_height;
+		if (igt_format_is_yuv(fb->drm_format))
+			return ALIGN(min_stride, 256);
+		else {
+			/*
+			 * For amdgpu device with tiling mode
+			 */
+			unsigned int tile_width = fb->plane_width[plane];
+			unsigned int tile_height = fb->plane_height[plane];
 
-		igt_amd_fb_calculate_tile_dimension(fb->plane_bpp[plane],
-				     &tile_width, &tile_height);
-		tile_width *= (fb->plane_bpp[plane] / 8);
+			igt_amd_fb_calculate_dimension(fb->modifier, fb->plane_bpp[plane],
+					&tile_width, &tile_height);
+			tile_width *= (fb->plane_bpp[plane] / 8);
 
-		return ALIGN(min_stride, tile_width);
+			return ALIGN(min_stride, tile_width);
+		}
 	} else if (is_gen12_ccs_cc_plane(fb, plane)) {
 		/* clear color always fixed to 64 bytes */
 		return 64;
@@ -775,13 +778,14 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
 		size = roundup_power_of_two(size);
 
 		return size;
-	} else if (fb->modifier != LOCAL_DRM_FORMAT_MOD_NONE && is_amdgpu_device(fb->fd)) {
+	} else if (is_amdgpu_device(fb->fd)) {
 		/*
 		 * For amdgpu device with tiling mode
 		 */
-		unsigned int tile_width, tile_height;
+		unsigned int tile_width = fb->plane_width[plane];
+		unsigned int tile_height = fb->plane_height[plane];
 
-		igt_amd_fb_calculate_tile_dimension(fb->plane_bpp[plane],
+		igt_amd_fb_calculate_dimension(fb->modifier, fb->plane_bpp[plane],
 				     &tile_width, &tile_height);
 		tile_height *= (fb->plane_bpp[plane] / 8);
 
@@ -1025,8 +1029,7 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
 	if (fb->modifier || fb->size || fb->strides[0] ||
 	    (is_i915_device(fd) && igt_format_is_yuv(fb->drm_format)) ||
 	    (is_i915_device(fd) && igt_format_is_fp16(fb->drm_format)) ||
-	    (is_amdgpu_device(fd) && igt_format_is_yuv(fb->drm_format)) ||
-	    is_nouveau_device(fd))
+	    is_amdgpu_device(fd) || is_nouveau_device(fd))
 		device_bo = true;
 
 	/* Sets offets and stride if necessary. */
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
