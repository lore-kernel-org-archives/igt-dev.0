Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB2A6E157
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Jan 2021 17:13:27 +0000 (UTC)
From: "Cornij, Nikola" <Nikola.Cornij@amd.com>
Date: Mon, 25 Jan 2021 17:13:25 +0000
Message-ID: <DM5PR12MB467986E5E999441DB40BEBF6EEBD9@DM5PR12MB4679.namprd12.prod.outlook.com>
References: <20210122204751.11042-1-sungkim@amd.com>
In-Reply-To: <20210122204751.11042-1-sungkim@amd.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_rotation_crc: Add Hwrotation test
 case for amdgpu with tiling
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
To: "Kim, Sung joon" <Sungjoon.Kim@amd.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed by: Nikola Cornij < nikola.cornij@amd.com>

>
>-----Original Message-----
>From: Kim, Sung joon <Sungjoon.Kim@amd.com> 
>Sent: Friday, January 22, 2021 3:48 PM
>To: igt-dev@lists.freedesktop.org
>Cc: Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Wentland, Harry <Harry.Wentland@amd.com>; Cornij, Nikola <Nikola.Cornij@amd.com>; Kim, Sung joon <Sungjoon.Kim@amd.com>
>Subject: [PATCH] tests/kms_rotation_crc: Add Hwrotation test case for amdgpu with tiling
>
>Allow amdgputo run HW rotation IGT test case Added conditions to bypass all the requirements needed for intel when testing amdgpu.
>Additionally, freed unused frame buffers.
>Added swizzle 64kb tiling method for amdgpu-specific.
>Updated drm header for amdgpu tiling modifiers.
>
>Signed-off-by: Sung Joon Kim <sungkim@amd.com>
>---
> include/drm-uapi/drm_fourcc.h | 134 ++++++++++++++++++++++++
> lib/igt_amd.c                 | 192 ++++++++++++++++++++++++++++++++++
> lib/igt_amd.h                 |  14 ++-
> lib/igt_fb.c                  |  37 ++++++-
> tests/kms_rotation_crc.c      |  74 ++++++++-----
> 5 files changed, 425 insertions(+), 26 deletions(-)
>
>diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h index 82f32780..a3286346 100644
>--- a/include/drm-uapi/drm_fourcc.h
>+++ b/include/drm-uapi/drm_fourcc.h
>@@ -1056,6 +1056,140 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  */
> #define AMLOGIC_FBC_OPTION_MEM_SAVING		(1ULL << 0)
> 
>+/*
>+ * AMD modifiers
>+ *
>+ * Memory layout:
>+ *
>+ * without DCC:
>+ *   - main surface
>+ *
>+ * with DCC & without DCC_RETILE:
>+ *   - main surface in plane 0
>+ *   - DCC surface in plane 1 (RB-aligned, pipe-aligned if DCC_PIPE_ALIGN is set)
>+ *
>+ * with DCC & DCC_RETILE:
>+ *   - main surface in plane 0
>+ *   - displayable DCC surface in plane 1 (not RB-aligned & not pipe-aligned)
>+ *   - pipe-aligned DCC surface in plane 2 (RB-aligned & pipe-aligned)
>+ *
>+ * For multi-plane formats the above surfaces get merged into one plane 
>+for
>+ * each format plane, based on the required alignment only.
>+ *
>+ * Bits  Parameter                Notes
>+ * ----- ------------------------ 
>+---------------------------------------------
>+ *
>+ *   7:0 TILE_VERSION             Values are AMD_FMT_MOD_TILE_VER_*
>+ *  12:8 TILE                     Values are AMD_FMT_MOD_TILE_<version>_*
>+ *    13 DCC
>+ *    14 DCC_RETILE
>+ *    15 DCC_PIPE_ALIGN
>+ *    16 DCC_INDEPENDENT_64B
>+ *    17 DCC_INDEPENDENT_128B
>+ * 19:18 DCC_MAX_COMPRESSED_BLOCK Values are AMD_FMT_MOD_DCC_BLOCK_*
>+ *    20 DCC_CONSTANT_ENCODE
>+ * 23:21 PIPE_XOR_BITS            Only for some chips
>+ * 26:24 BANK_XOR_BITS            Only for some chips
>+ * 29:27 PACKERS                  Only for some chips
>+ * 32:30 RB                       Only for some chips
>+ * 35:33 PIPE                     Only for some chips
>+ * 55:36 -                        Reserved for future use, must be zero
>+ */
>+#define AMD_FMT_MOD fourcc_mod_code(AMD, 0)
>+
>+#define IS_AMD_FMT_MOD(val) (((val) >> 56) == 
>+DRM_FORMAT_MOD_VENDOR_AMD)
>+
>+/* Reserve 0 for GFX8 and older */
>+#define AMD_FMT_MOD_TILE_VER_GFX9 1
>+#define AMD_FMT_MOD_TILE_VER_GFX10 2
>+#define AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS 3
>+
>+/*
>+ * 64K_S is the same for GFX9/GFX10/GFX10_RBPLUS and hence has GFX9 as 
>+canonical
>+ * version.
>+ */
>+#define AMD_FMT_MOD_TILE_GFX9_64K_S 9
>+
>+/*
>+ * 64K_D for non-32 bpp is the same for GFX9/GFX10/GFX10_RBPLUS and 
>+hence has
>+ * GFX9 as canonical version.
>+ */
>+#define AMD_FMT_MOD_TILE_GFX9_64K_D 10
>+#define AMD_FMT_MOD_TILE_GFX9_64K_S_X 25 #define 
>+AMD_FMT_MOD_TILE_GFX9_64K_D_X 26 #define AMD_FMT_MOD_TILE_GFX9_64K_R_X 
>+27
>+
>+#define AMD_FMT_MOD_DCC_BLOCK_64B 0
>+#define AMD_FMT_MOD_DCC_BLOCK_128B 1
>+#define AMD_FMT_MOD_DCC_BLOCK_256B 2
>+
>+#define AMD_FMT_MOD_TILE_VERSION_SHIFT 0 #define 
>+AMD_FMT_MOD_TILE_VERSION_MASK 0xFF #define AMD_FMT_MOD_TILE_SHIFT 8 
>+#define AMD_FMT_MOD_TILE_MASK 0x1F
>+
>+/* Whether DCC compression is enabled. */ #define AMD_FMT_MOD_DCC_SHIFT 
>+13 #define AMD_FMT_MOD_DCC_MASK 0x1
>+
>+/*
>+ * Whether to include two DCC surfaces, one which is rb & pipe aligned, 
>+and
>+ * one which is not-aligned.
>+ */
>+#define AMD_FMT_MOD_DCC_RETILE_SHIFT 14 #define 
>+AMD_FMT_MOD_DCC_RETILE_MASK 0x1
>+
>+/* Only set if DCC_RETILE = false */
>+#define AMD_FMT_MOD_DCC_PIPE_ALIGN_SHIFT 15 #define 
>+AMD_FMT_MOD_DCC_PIPE_ALIGN_MASK 0x1
>+
>+#define AMD_FMT_MOD_DCC_INDEPENDENT_64B_SHIFT 16 #define 
>+AMD_FMT_MOD_DCC_INDEPENDENT_64B_MASK 0x1 #define 
>+AMD_FMT_MOD_DCC_INDEPENDENT_128B_SHIFT 17 #define 
>+AMD_FMT_MOD_DCC_INDEPENDENT_128B_MASK 0x1 #define 
>+AMD_FMT_MOD_DCC_MAX_COMPRESSED_BLOCK_SHIFT 18 #define 
>+AMD_FMT_MOD_DCC_MAX_COMPRESSED_BLOCK_MASK 0x3
>+
>+/*
>+ * DCC supports embedding some clear colors directly in the DCC surface.
>+ * However, on older GPUs the rendering HW ignores the embedded clear 
>+color
>+ * and prefers the driver provided color. This necessitates doing a 
>+fastclear
>+ * eliminate operation before a process transfers control.
>+ *
>+ * If this bit is set that means the fastclear eliminate is not needed 
>+for these
>+ * embeddable colors.
>+ */
>+#define AMD_FMT_MOD_DCC_CONSTANT_ENCODE_SHIFT 20 #define 
>+AMD_FMT_MOD_DCC_CONSTANT_ENCODE_MASK 0x1
>+
>+/*
>+ * The below fields are for accounting for per GPU differences. These 
>+are only
>+ * relevant for GFX9 and later and if the tile field is *_X/_T.
>+ *
>+ * PIPE_XOR_BITS = always needed
>+ * BANK_XOR_BITS = only for TILE_VER_GFX9
>+ * PACKERS = only for TILE_VER_GFX10_RBPLUS
>+ * RB = only for TILE_VER_GFX9 & DCC
>+ * PIPE = only for TILE_VER_GFX9 & DCC & (DCC_RETILE | DCC_PIPE_ALIGN)  
>+*/ #define AMD_FMT_MOD_PIPE_XOR_BITS_SHIFT 21 #define 
>+AMD_FMT_MOD_PIPE_XOR_BITS_MASK 0x7 #define 
>+AMD_FMT_MOD_BANK_XOR_BITS_SHIFT 24 #define 
>+AMD_FMT_MOD_BANK_XOR_BITS_MASK 0x7 #define AMD_FMT_MOD_PACKERS_SHIFT 27 
>+#define AMD_FMT_MOD_PACKERS_MASK 0x7 #define AMD_FMT_MOD_RB_SHIFT 30 
>+#define AMD_FMT_MOD_RB_MASK 0x7 #define AMD_FMT_MOD_PIPE_SHIFT 33 
>+#define AMD_FMT_MOD_PIPE_MASK 0x7
>+
>+#define AMD_FMT_MOD_SET(field, value) \
>+	((uint64_t)(value) << AMD_FMT_MOD_##field##_SHIFT) #define 
>+AMD_FMT_MOD_GET(field, value) \
>+	(((value) >> AMD_FMT_MOD_##field##_SHIFT) & 
>+AMD_FMT_MOD_##field##_MASK) #define AMD_FMT_MOD_CLEAR(field) \
>+	(~((uint64_t)AMD_FMT_MOD_##field##_MASK << 
>+AMD_FMT_MOD_##field##_SHIFT))
>+
> #if defined(__cplusplus)
> }
> #endif
>diff --git a/lib/igt_amd.c b/lib/igt_amd.c index abd3ad96..a4e1cb59 100644
>--- a/lib/igt_amd.c
>+++ b/lib/igt_amd.c
>@@ -24,6 +24,29 @@
> #include "igt.h"
> #include <amdgpu_drm.h>
> 
>+#define X0 1
>+#define X1 2
>+#define X2 4
>+#define X3 8
>+#define X4 16
>+#define X5 32
>+#define X6 64
>+#define X7 128
>+#define Y0 1
>+#define Y1 2
>+#define Y2 4
>+#define Y3 8
>+#define Y4 16
>+#define Y5 32
>+#define Y6 64
>+#define Y7 128
>+
>+struct dim2d
>+{
>+    int w;
>+    int h;
>+};
>+
> uint32_t igt_amd_create_bo(int fd, uint64_t size)  {
> 	union drm_amdgpu_gem_create create;
>@@ -54,3 +77,172 @@ void *igt_amd_mmap_bo(int fd, uint32_t handle, uint64_t size, int prot)
> 	ptr = mmap(0, size, prot, MAP_SHARED, fd, map.out.addr_ptr);
> 	return ptr == MAP_FAILED ? NULL : ptr;  }
>+
>+unsigned int igt_amd_compute_offset(unsigned int* swizzle_pattern,
>+				       unsigned int x, unsigned int y) {
>+    unsigned int offset = 0, index = 0;
>+    unsigned int blk_size_table_index = 0, interleave = 0;
>+    unsigned int channel[16] =
>+				{0, 0, 1, 1, 2, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1};
>+    unsigned int i, v;
>+
>+    for (i = 0; i < 16; i++)
>+    {
>+        v = 0;
>+        if (channel[i] == 1)
>+        {
>+            blk_size_table_index = 0;
>+            interleave = swizzle_pattern[i];
>+
>+            while (interleave > 1) {
>+				blk_size_table_index++;
>+				interleave = (interleave + 1) >> 1;
>+			}
>+
>+            index = blk_size_table_index + 2;
>+            v ^= (x >> index) & 1;
>+        }
>+        else if (channel[i] == 2)
>+        {
>+            blk_size_table_index = 0;
>+            interleave = swizzle_pattern[i];
>+
>+            while (interleave > 1) {
>+				blk_size_table_index++;
>+				interleave = (interleave + 1) >> 1;
>+			}
>+
>+            index = blk_size_table_index;
>+            v ^= (y >> index) & 1;
>+        }
>+
>+        offset |= (v << i);
>+    }
>+
>+	return offset;
>+}
>+
>+unsigned int igt_amd_fb_get_blk_size_table_idx(unsigned int bpp) {
>+	unsigned int element_bytes;
>+	unsigned int blk_size_table_index = 0;
>+
>+	element_bytes = bpp >> 3;
>+
>+	while (element_bytes > 1) {
>+		blk_size_table_index++;
>+		element_bytes = (element_bytes + 1) >> 1;
>+	}
>+
>+	return blk_size_table_index;
>+}
>+
>+void igt_amd_fb_calculate_tile_dimension(unsigned int bpp,
>+				       unsigned int *width, unsigned int *height) {
>+	unsigned int blk_size_table_index;
>+	unsigned int blk_size_log2, blk_size_log2_256B;
>+	unsigned int width_amp, height_amp;
>+
>+	// swizzle 64kb tile block
>+	unsigned int block256_2d[][2] = {{16, 16}, {16, 8}, {8, 8}, {8, 4}, {4, 4}};
>+	blk_size_log2 = 16;
>+
>+	blk_size_table_index = igt_amd_fb_get_blk_size_table_idx(bpp);
>+
>+	blk_size_log2_256B = blk_size_log2 - 8;
>+
>+	width_amp = blk_size_log2_256B / 2;
>+	height_amp = blk_size_log2_256B - width_amp;
>+
>+	*width  = (block256_2d[blk_size_table_index][0] << width_amp);
>+	*height = (block256_2d[blk_size_table_index][1] << height_amp); }
>+
>+uint32_t igt_amd_fb_tiled_offset(unsigned int bpp, unsigned int x_input,
>+				       unsigned int y_input, unsigned int width_input) {
>+	unsigned int width, height, pitch;
>+	unsigned int pb, yb, xb, blk_idx, blk_offset, addr;
>+	unsigned int blk_size_table_index, blk_size_log2;
>+	unsigned int* swizzle_pattern;
>+
>+	// swizzle 64kb tile block
>+	unsigned int sw_64k_s[][16]=
>+	{
>+	    {X0, X1, X2, X3, Y0, Y1, Y2, Y3, Y4, X4, Y5, X5, Y6, X6, Y7, X7},
>+	    {0,  X0, X1, X2, Y0, Y1, Y2, X3, Y3, X4, Y4, X5, Y5, X6, Y6, X7},
>+	    {0,  0,  X0, X1, Y0, Y1, Y2, X2, Y3, X3, Y4, X4, Y5, X5, Y6, X6},
>+	    {0,  0,  0,  X0, Y0, Y1, X1, X2, Y2, X3, Y3, X4, Y4, X5, Y5, X6},
>+	    {0,  0,  0,  0,  Y0, Y1, X0, X1, Y2, X2, Y3, X3, Y4, X4, Y5, X5},
>+	};
>+	igt_amd_fb_calculate_tile_dimension(bpp, &width, &height);
>+	blk_size_table_index = igt_amd_fb_get_blk_size_table_idx(bpp);
>+	blk_size_log2 = 16;
>+
>+	pitch = (width_input + (width - 1)) & (~(width - 1));
>+
>+	swizzle_pattern = sw_64k_s[blk_size_table_index];
>+
>+	pb = pitch / width;
>+	yb = y_input / height;
>+	xb = x_input / width;
>+	blk_idx = yb * pb + xb;
>+	blk_offset = igt_amd_compute_offset(swizzle_pattern,
>+					x_input << blk_size_table_index, y_input);
>+	addr = (blk_idx << blk_size_log2) + blk_offset;
>+
>+    return (uint32_t)addr;
>+}
>+
>+void igt_amd_fb_to_tiled(struct igt_fb *dst, void *dst_buf, struct igt_fb *src,
>+				       void *src_buf, unsigned int plane) {
>+	uint32_t src_offset, dst_offset;
>+	unsigned int bpp = src->plane_bpp[plane];
>+	unsigned int width = dst->plane_width[plane];
>+	unsigned int height = dst->plane_height[plane];
>+	unsigned int x, y;
>+
>+	for (y = 0; y < height; y++) {
>+		for (x = 0; x < width; x++) {
>+			src_offset = src->offsets[plane];
>+			dst_offset = dst->offsets[plane];
>+
>+			src_offset += src->strides[plane] * y + x * bpp / 8;
>+			dst_offset += igt_amd_fb_tiled_offset(bpp, x, y, width);
>+
>+			switch (bpp) {
>+			case 16:
>+				*(uint16_t *)(dst_buf + dst_offset) =
>+					*(uint16_t *)(src_buf + src_offset);
>+				break;
>+			case 32:
>+				*(uint32_t *)(dst_buf + dst_offset) =
>+					*(uint32_t *)(src_buf + src_offset);
>+				break;
>+			}
>+		}
>+	}
>+}
>+
>+void igt_amd_fb_convert_plane_to_tiled(struct igt_fb *dst, void *dst_buf,
>+				       struct igt_fb *src, void *src_buf) {
>+	unsigned int plane;
>+
>+	for (plane = 0; plane < src->num_planes; plane++) {
>+		igt_require(AMD_FMT_MOD_GET(TILE, dst->modifier) ==
>+					AMD_FMT_MOD_TILE_GFX9_64K_S);
>+		igt_amd_fb_to_tiled(dst, dst_buf, src, src_buf, plane);
>+	}
>+}
>+
>+bool igt_amd_is_tiled(uint64_t modifier) {
>+	if (IS_AMD_FMT_MOD(modifier) && AMD_FMT_MOD_GET(TILE, modifier))
>+		return true;
>+	else
>+		return false;
>+}
>diff --git a/lib/igt_amd.h b/lib/igt_amd.h index f63d26f4..6656d901 100644
>--- a/lib/igt_amd.h
>+++ b/lib/igt_amd.h
>@@ -24,8 +24,20 @@
> #define IGT_AMD_H
> 
> #include <stdint.h>
>+#include "igt_fb.h"
> 
> uint32_t igt_amd_create_bo(int fd, uint64_t size);  void *igt_amd_mmap_bo(int fd, uint32_t handle, uint64_t size, int prot);
>-
>+unsigned int igt_amd_compute_offset(unsigned int* swizzle_pattern,
>+				       unsigned int x, unsigned int y); unsigned int 
>+igt_amd_fb_get_blk_size_table_idx(unsigned int bpp); void 
>+igt_amd_fb_calculate_tile_dimension(unsigned int bpp,
>+				       unsigned int *width, unsigned int *height); uint32_t 
>+igt_amd_fb_tiled_offset(unsigned int bpp, unsigned int x_input,
>+				       unsigned int y_input, unsigned int width_input); void 
>+igt_amd_fb_to_tiled(struct igt_fb *dst, void *dst_buf, struct igt_fb *src,
>+				       void *src_buf, unsigned int plane); void 
>+igt_amd_fb_convert_plane_to_tiled(struct igt_fb *dst, void *dst_buf,
>+				       struct igt_fb *src, void *src_buf); bool 
>+igt_amd_is_tiled(uint64_t modifier);
> #endif /* IGT_AMD_H */
>diff --git a/lib/igt_fb.c b/lib/igt_fb.c index 4b9be47e..e41fbcff 100644
>--- a/lib/igt_fb.c
>+++ b/lib/igt_fb.c
>@@ -671,6 +671,17 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
> 		 * so the easiest way is to align the luma stride to 256.
> 		 */
> 		return ALIGN(min_stride, 256);
>+	}else if (fb->modifier != LOCAL_DRM_FORMAT_MOD_NONE && is_amdgpu_device(fb->fd)) {
>+		/*
>+		 * For amdgpu device with tiling mode
>+		 */
>+		unsigned int tile_width, tile_height;
>+
>+		igt_amd_fb_calculate_tile_dimension(fb->plane_bpp[plane],
>+				     &tile_width, &tile_height);
>+		tile_width *= (fb->plane_bpp[plane] / 8);
>+
>+		return ALIGN(min_stride, tile_width);
> 	} else if (is_gen12_ccs_cc_plane(fb, plane)) {
> 		/* clear color always fixed to 64 bytes */
> 		return 64;
>@@ -711,6 +722,18 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
> 		size = roundup_power_of_two(size);
> 
> 		return size;
>+	} else if (fb->modifier != LOCAL_DRM_FORMAT_MOD_NONE && is_amdgpu_device(fb->fd)) {
>+		/*
>+		 * For amdgpu device with tiling mode
>+		 */
>+		unsigned int tile_width, tile_height;
>+
>+		igt_amd_fb_calculate_tile_dimension(fb->plane_bpp[plane],
>+				     &tile_width, &tile_height);
>+		tile_height *= (fb->plane_bpp[plane] / 8);
>+
>+		return (uint64_t) fb->strides[plane] *
>+			ALIGN(fb->plane_height[plane], tile_height);
> 	} else if (is_gen12_ccs_plane(fb, plane)) {
> 		/* The AUX CCS surface must be page aligned */
> 		return (uint64_t)fb->strides[plane] * @@ -2352,6 +2375,13 @@ static void free_linear_mapping(struct fb_blit_upload *blit)
> 
> 		vc4_fb_convert_plane_to_tiled(fb, map, &linear->fb, &linear->map);
> 
>+		munmap(map, fb->size);
>+	} else if (igt_amd_is_tiled(fb->modifier)) {
>+		void *map = igt_amd_mmap_bo(fd, fb->gem_handle, fb->size, 
>+PROT_WRITE);
>+
>+		igt_amd_fb_convert_plane_to_tiled(fb, map, &linear->fb, linear->map);
>+
>+		munmap(linear->map, fb->size);
> 		munmap(map, fb->size);
> 	} else {
> 		gem_munmap(linear->map, linear->fb.size); @@ -2419,6 +2449,10 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
> 		vc4_fb_convert_plane_from_tiled(&linear->fb, &linear->map, fb, map);
> 
> 		munmap(map, fb->size);
>+	} else if (igt_amd_is_tiled(fb->modifier)) {
>+		linear->map = igt_amd_mmap_bo(fd, linear->fb.gem_handle,
>+					      linear->fb.size,
>+					      PROT_READ | PROT_WRITE);
> 	} else {
> 		/* Copy fb content to linear BO */
> 		gem_set_domain(fd, linear->fb.gem_handle, @@ -3625,7 +3659,8 @@ cairo_surface_t *igt_get_cairo_surface(int fd, struct igt_fb *fb)
> 		if (use_convert(fb))
> 			create_cairo_surface__convert(fd, fb);
> 		else if (use_blitter(fb) || use_enginecopy(fb) ||
>-			 igt_vc4_is_tiled(fb->modifier))
>+			 igt_vc4_is_tiled(fb->modifier) ||
>+			 igt_amd_is_tiled(fb->modifier))
> 			create_cairo_surface__gpu(fd, fb);
> 		else
> 			create_cairo_surface__gtt(fd, fb);
>diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c index 33a97cca..5657235c 100644
>--- a/tests/kms_rotation_crc.c
>+++ b/tests/kms_rotation_crc.c
>@@ -63,6 +63,7 @@ typedef struct {
> 	struct igt_fb fb;
> 	struct igt_fb fb_reference;
> 	struct igt_fb fb_flip;
>+	struct igt_fb fb_crtc;
> 	igt_crc_t ref_crc;
> 	igt_crc_t flip_crc;
> 	igt_pipe_crc_t *pipe_crc;
>@@ -185,7 +186,7 @@ static void cleanup_crtc(data_t *data)  }
> 
> static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
>-			 igt_plane_t *plane, bool start_crc)
>+			 igt_plane_t *plane)
> {
> 	igt_display_t *display = &data->display;
> 
>@@ -197,11 +198,19 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
> 	/* create the pipe_crc object for this pipe */
> 	igt_pipe_crc_free(data->pipe_crc);
> 
>+	if (is_amdgpu_device(data->gfx_fd)) {
>+		drmModeModeInfo *mode = igt_output_get_mode(output);
>+
>+		igt_create_fb(data->gfx_fd, mode->hdisplay, mode->vdisplay,
>+				  data->override_fmt, LOCAL_DRM_FORMAT_MOD_NONE, &data->fb_crtc);
>+		igt_plane_set_fb(plane, &data->fb_crtc);
>+		paint_squares(data, IGT_ROTATION_0, &data->fb_crtc, 1.0);
>+
>+		if (plane->type != DRM_PLANE_TYPE_CURSOR)
>+			igt_plane_set_position(plane, data->pos_x, data->pos_y);
>+	}
> 	igt_display_commit2(display, COMMIT_ATOMIC);
> 	data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
>-
>-	if (start_crc)
>-		igt_pipe_crc_start(data->pipe_crc);
> }
> 
> static void prepare_fbs(data_t *data, igt_output_t *output, @@ -276,7 +285,7 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
> 		/*
> 		* Create a reference software rotated flip framebuffer.
> 		*/
>-		igt_create_fb(data->gfx_fd, ref_w, ref_h, pixel_format, tiling,
>+		igt_create_fb(data->gfx_fd, ref_w, ref_h, pixel_format, 
>+LOCAL_DRM_FORMAT_MOD_NONE,
> 			&data->fb_flip);
> 		paint_squares(data, data->rotation, &data->fb_flip,
> 			flip_opacity);
>@@ -284,24 +293,26 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
> 		if (plane->type != DRM_PLANE_TYPE_CURSOR)
> 			igt_plane_set_position(plane, data->pos_x, data->pos_y);
> 		igt_display_commit2(display, COMMIT_ATOMIC);
>+		igt_pipe_crc_collect_crc(data->pipe_crc, 
>+&data->crc_rect[rect].flip_crc);
> 
>-		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &data->crc_rect[rect].flip_crc);
>-		igt_remove_fb(data->gfx_fd, &data->fb_flip);
>+		if (is_amdgpu_device(data->gfx_fd))
>+			igt_remove_fb(data->gfx_fd, &data->fb_crtc);
> 
> 		/*
> 		* Create a reference CRC for a software-rotated fb.
> 		*/
> 		igt_create_fb(data->gfx_fd, ref_w, ref_h, pixel_format,
>-			data->override_tiling ?: LOCAL_DRM_FORMAT_MOD_NONE, &data->fb_reference);
>+			LOCAL_DRM_FORMAT_MOD_NONE, &data->fb_reference);
> 		paint_squares(data, data->rotation, &data->fb_reference, 1.0);
> 
> 		igt_plane_set_fb(plane, &data->fb_reference);
> 		if (plane->type != DRM_PLANE_TYPE_CURSOR)
> 			igt_plane_set_position(plane, data->pos_x, data->pos_y);
> 		igt_display_commit2(display, COMMIT_ATOMIC);
>-
>-		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &data->crc_rect[rect].ref_crc);
>+		igt_pipe_crc_collect_crc(data->pipe_crc, 
>+&data->crc_rect[rect].ref_crc);
> 		data->crc_rect[rect].valid = true;
>+
>+		igt_remove_fb(data->gfx_fd, &data->fb_flip);
> 	}
> 
> 	/*
>@@ -350,7 +361,7 @@ static void test_single_case(data_t *data, enum pipe pipe,
> 	igt_assert_eq(ret, 0);
> 
> 	/* Check CRC */
>-	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc_output);
>+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_output);
> 	igt_assert_crc_equal(&data->crc_rect[rect].ref_crc, &crc_output);
> 
> 	/*
>@@ -373,7 +384,7 @@ static void test_single_case(data_t *data, enum pipe pipe,
> 			igt_assert_eq(ret, 0);
> 		}
> 		kmstest_wait_for_pageflip(data->gfx_fd);
>-		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc_output);
>+		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_output);
> 		igt_assert_crc_equal(&data->crc_rect[rect].flip_crc, &crc_output);
> 	}
> }
>@@ -406,6 +417,9 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
> 	igt_output_t *output;
> 	enum pipe pipe;
> 
>+	if (is_amdgpu_device(data->gfx_fd))
>+		igt_require(plane_type != DRM_PLANE_TYPE_OVERLAY);
>+
> 	if (plane_type == DRM_PLANE_TYPE_CURSOR)
> 		igt_require(display->has_cursor_plane);
> 
>@@ -418,7 +432,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
> 		for (c = 0; c < num_rectangle_types; c++)
> 			data->crc_rect[c].valid = false;
> 
>-		if (IS_CHERRYVIEW(data->devid) && pipe != PIPE_B)
>+		if (is_i915_device(data->gfx_fd) && IS_CHERRYVIEW(data->devid) && 
>+pipe != PIPE_B)
> 			continue;
> 
> 		igt_output_set_pipe(output, pipe);
>@@ -426,7 +440,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
> 		plane = igt_output_get_plane_type(output, plane_type);
> 		igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
> 
>-		prepare_crtc(data, output, pipe, plane, true);
>+		prepare_crtc(data, output, pipe, plane);
> 
> 		for (i = 0; i < num_rectangle_types; i++) {
> 			/* Unsupported on i915 */
>@@ -435,8 +449,9 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
> 				continue;
> 
> 			/* Only support partial covering primary plane on gen9+ */
>-			if (plane_type == DRM_PLANE_TYPE_PRIMARY &&
>-			    intel_gen(intel_get_drm_devid(data->gfx_fd)) < 9) {
>+			if (is_amdgpu_device(data->gfx_fd) ||
>+				(plane_type == DRM_PLANE_TYPE_PRIMARY &&
>+			    intel_gen(intel_get_drm_devid(data->gfx_fd)) < 9)) {
> 				if (i != rectangle)
> 					continue;
> 				else
>@@ -466,7 +481,6 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
> 						 data->override_fmt, test_bad_format);
> 			}
> 		}
>-		igt_pipe_crc_stop(data->pipe_crc);
> 	}
> }
> 
>@@ -709,7 +723,7 @@ static void test_plane_rotation_exhaust_fences(data_t *data,
> 
> 	igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
> 
>-	prepare_crtc(data, output, pipe, plane, false);
>+	prepare_crtc(data, output, pipe, plane);
> 
> 	mode = igt_output_get_mode(output);
> 	w = mode->hdisplay;
>@@ -844,9 +858,11 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
> 	int gen = 0;
> 
> 	igt_fixture {
>-		data.gfx_fd = drm_open_driver_master(DRIVER_INTEL);
>-		data.devid = intel_get_drm_devid(data.gfx_fd);
>-		gen = intel_gen(data.devid);
>+		data.gfx_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_AMDGPU);
>+		if (is_i915_device(data.gfx_fd)) {
>+			data.devid = intel_get_drm_devid(data.gfx_fd);
>+			gen = intel_gen(data.devid);
>+		}
> 
> 		kmstest_set_vt_graphics_mode();
> 
>@@ -860,9 +876,19 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
> 		igt_subtest_f("%s-rotation-%s",
> 			      plane_test_str(subtest->plane),
> 			      rot_test_str(subtest->rot)) {
>-			igt_require(!(subtest->rot &
>-				    (IGT_ROTATION_90 | IGT_ROTATION_270)) ||
>-				    gen >= 9);
>+			if (is_i915_device(data.gfx_fd)) {
>+				igt_require(!(subtest->rot &
>+					    (IGT_ROTATION_90 | IGT_ROTATION_270)) ||
>+					    gen >= 9);
>+			} else if (is_amdgpu_device(data.gfx_fd)) {
>+				data.override_fmt = DRM_FORMAT_XRGB8888;
>+				if (subtest->rot & (IGT_ROTATION_90 | IGT_ROTATION_270))
>+					data.override_tiling = AMD_FMT_MOD | 
>+						AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |
>+						AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9);
>+				else
>+					data.override_tiling = LOCAL_DRM_FORMAT_MOD_NONE;
>+			}
> 			data.rotation = subtest->rot;
> 			test_plane_rotation(&data, subtest->plane, false);
> 		}
>--
>2.25.1
>
>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
