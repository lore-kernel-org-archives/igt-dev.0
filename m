Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7CE10E259
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 15:44:02 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f38bea8be8so4181891e87.0
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 08:44:02 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 16 May 2023 18:43:26 +0300
Message-Id: <20230516154329.9002-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230516154329.9002-1-juhapekka.heikkila@gmail.com>
References: <20230516154329.9002-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] drm/fourcc: Import drm_fourcc header
 from commit c7c12de893f8 ("drm/fourcc: define Intel Meteorlake related ccs
 modifiers")
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

commit c7c12de893f8 ("drm/fourcc: define Intel Meteorlake related ccs modifiers")
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Sun May 14 21:42:39 2023 +0300

    drm/fourcc: define Intel Meteorlake related ccs modifiers

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 include/drm-uapi/drm_fourcc.h | 156 +++++++++++++++++++++++++++++++---
 1 file changed, 145 insertions(+), 11 deletions(-)

diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
index 78bebdea..8db7fd3f 100644
--- a/include/drm-uapi/drm_fourcc.h
+++ b/include/drm-uapi/drm_fourcc.h
@@ -88,6 +88,18 @@ extern "C" {
  *
  * The authoritative list of format modifier codes is found in
  * `include/uapi/drm/drm_fourcc.h`
+ *
+ * Open Source User Waiver
+ * -----------------------
+ *
+ * Because this is the authoritative source for pixel formats and modifiers
+ * referenced by GL, Vulkan extensions and other standards and hence used both
+ * by open source and closed source driver stacks, the usual requirement for an
+ * upstream in-kernel or open source userspace user does not apply.
+ *
+ * To ensure, as much as feasible, compatibility across stacks and avoid
+ * confusion with incompatible enumerations stakeholders for all relevant driver
+ * stacks should approve additions.
  */
 
 #define fourcc_code(a, b, c, d) ((__u32)(a) | ((__u32)(b) << 8) | \
@@ -99,18 +111,42 @@ extern "C" {
 #define DRM_FORMAT_INVALID	0
 
 /* color index */
+#define DRM_FORMAT_C1		fourcc_code('C', '1', ' ', ' ') /* [7:0] C0:C1:C2:C3:C4:C5:C6:C7 1:1:1:1:1:1:1:1 eight pixels/byte */
+#define DRM_FORMAT_C2		fourcc_code('C', '2', ' ', ' ') /* [7:0] C0:C1:C2:C3 2:2:2:2 four pixels/byte */
+#define DRM_FORMAT_C4		fourcc_code('C', '4', ' ', ' ') /* [7:0] C0:C1 4:4 two pixels/byte */
 #define DRM_FORMAT_C8		fourcc_code('C', '8', ' ', ' ') /* [7:0] C */
 
-/* 8 bpp Red */
+/* 1 bpp Darkness (inverse relationship between channel value and brightness) */
+#define DRM_FORMAT_D1		fourcc_code('D', '1', ' ', ' ') /* [7:0] D0:D1:D2:D3:D4:D5:D6:D7 1:1:1:1:1:1:1:1 eight pixels/byte */
+
+/* 2 bpp Darkness (inverse relationship between channel value and brightness) */
+#define DRM_FORMAT_D2		fourcc_code('D', '2', ' ', ' ') /* [7:0] D0:D1:D2:D3 2:2:2:2 four pixels/byte */
+
+/* 4 bpp Darkness (inverse relationship between channel value and brightness) */
+#define DRM_FORMAT_D4		fourcc_code('D', '4', ' ', ' ') /* [7:0] D0:D1 4:4 two pixels/byte */
+
+/* 8 bpp Darkness (inverse relationship between channel value and brightness) */
+#define DRM_FORMAT_D8		fourcc_code('D', '8', ' ', ' ') /* [7:0] D */
+
+/* 1 bpp Red (direct relationship between channel value and brightness) */
+#define DRM_FORMAT_R1		fourcc_code('R', '1', ' ', ' ') /* [7:0] R0:R1:R2:R3:R4:R5:R6:R7 1:1:1:1:1:1:1:1 eight pixels/byte */
+
+/* 2 bpp Red (direct relationship between channel value and brightness) */
+#define DRM_FORMAT_R2		fourcc_code('R', '2', ' ', ' ') /* [7:0] R0:R1:R2:R3 2:2:2:2 four pixels/byte */
+
+/* 4 bpp Red (direct relationship between channel value and brightness) */
+#define DRM_FORMAT_R4		fourcc_code('R', '4', ' ', ' ') /* [7:0] R0:R1 4:4 two pixels/byte */
+
+/* 8 bpp Red (direct relationship between channel value and brightness) */
 #define DRM_FORMAT_R8		fourcc_code('R', '8', ' ', ' ') /* [7:0] R */
 
-/* 10 bpp Red */
+/* 10 bpp Red (direct relationship between channel value and brightness) */
 #define DRM_FORMAT_R10		fourcc_code('R', '1', '0', ' ') /* [15:0] x:R 6:10 little endian */
 
-/* 12 bpp Red */
+/* 12 bpp Red (direct relationship between channel value and brightness) */
 #define DRM_FORMAT_R12		fourcc_code('R', '1', '2', ' ') /* [15:0] x:R 4:12 little endian */
 
-/* 16 bpp Red */
+/* 16 bpp Red (direct relationship between channel value and brightness) */
 #define DRM_FORMAT_R16		fourcc_code('R', '1', '6', ' ') /* [15:0] R little endian */
 
 /* 16 bpp RG */
@@ -205,7 +241,9 @@ extern "C" {
 #define DRM_FORMAT_VYUY		fourcc_code('V', 'Y', 'U', 'Y') /* [31:0] Y1:Cb0:Y0:Cr0 8:8:8:8 little endian */
 
 #define DRM_FORMAT_AYUV		fourcc_code('A', 'Y', 'U', 'V') /* [31:0] A:Y:Cb:Cr 8:8:8:8 little endian */
+#define DRM_FORMAT_AVUY8888	fourcc_code('A', 'V', 'U', 'Y') /* [31:0] A:Cr:Cb:Y 8:8:8:8 little endian */
 #define DRM_FORMAT_XYUV8888	fourcc_code('X', 'Y', 'U', 'V') /* [31:0] X:Y:Cb:Cr 8:8:8:8 little endian */
+#define DRM_FORMAT_XVUY8888	fourcc_code('X', 'V', 'U', 'Y') /* [31:0] X:Cr:Cb:Y 8:8:8:8 little endian */
 #define DRM_FORMAT_VUY888	fourcc_code('V', 'U', '2', '4') /* [23:0] Cr:Cb:Y 8:8:8 little endian */
 #define DRM_FORMAT_VUY101010	fourcc_code('V', 'U', '3', '0') /* Y followed by U then V, 10:10:10. Non-linear modifier only */
 
@@ -559,7 +597,7 @@ extern "C" {
  *
  * The main surface is Y-tiled and is at plane index 0 whereas CCS is linear
  * and at index 1. The clear color is stored at index 2, and the pitch should
- * be ignored. The clear color structure is 256 bits. The first 128 bits
+ * be 64 bytes aligned. The clear color structure is 256 bits. The first 128 bits
  * represents Raw Clear Color Red, Green, Blue and Alpha color each represented
  * by 32 bits. The raw clear color is consumed by the 3d engine and generates
  * the converted clear color of size 64 bits. The first 32 bits store the Lower
@@ -612,13 +650,56 @@ extern "C" {
  * outside of the GEM object in a reserved memory area dedicated for the
  * storage of the CCS data for all RC/RC_CC/MC compressible GEM objects. The
  * main surface pitch is required to be a multiple of four Tile 4 widths. The
- * clear color is stored at plane index 1 and the pitch should be ignored. The
- * format of the 256 bits of clear color data matches the one used for the
- * I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC modifier, see its description
+ * clear color is stored at plane index 1 and the pitch should be 64 bytes
+ * aligned. The format of the 256 bits of clear color data matches the one used
+ * for the I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC modifier, see its description
  * for details.
  */
 #define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC fourcc_mod_code(INTEL, 12)
 
+/*
+ * Intel Color Control Surfaces (CCS) for display ver. 14 render compression.
+ *
+ * The main surface is tile4 and at plane index 0, the CCS is linear and
+ * at index 1. A 64B CCS cache line corresponds to an area of 4x1 tiles in
+ * main surface. In other words, 4 bits in CCS map to a main surface cache
+ * line pair. The main surface pitch is required to be a multiple of four
+ * tile4 widths.
+ */
+#define I915_FORMAT_MOD_4_TILED_MTL_RC_CCS fourcc_mod_code(INTEL, 13)
+
+/*
+ * Intel Color Control Surfaces (CCS) for display ver. 14 media compression
+ *
+ * The main surface is tile4 and at plane index 0, the CCS is linear and
+ * at index 1. A 64B CCS cache line corresponds to an area of 4x1 tiles in
+ * main surface. In other words, 4 bits in CCS map to a main surface cache
+ * line pair. The main surface pitch is required to be a multiple of four
+ * tile4 widths. For semi-planar formats like NV12, CCS planes follow the
+ * Y and UV planes i.e., planes 0 and 1 are used for Y and UV surfaces,
+ * planes 2 and 3 for the respective CCS.
+ */
+#define I915_FORMAT_MOD_4_TILED_MTL_MC_CCS fourcc_mod_code(INTEL, 14)
+
+/*
+ * Intel Color Control Surface with Clear Color (CCS) for display ver. 14 render
+ * compression.
+ *
+ * The main surface is tile4 and is at plane index 0 whereas CCS is linear
+ * and at index 1. The clear color is stored at index 2, and the pitch should
+ * be ignored. The clear color structure is 256 bits. The first 128 bits
+ * represents Raw Clear Color Red, Green, Blue and Alpha color each represented
+ * by 32 bits. The raw clear color is consumed by the 3d engine and generates
+ * the converted clear color of size 64 bits. The first 32 bits store the Lower
+ * Converted Clear Color value and the next 32 bits store the Higher Converted
+ * Clear Color value when applicable. The Converted Clear Color values are
+ * consumed by the DE. The last 64 bits are used to store Color Discard Enable
+ * and Depth Clear Value Valid which are ignored by the DE. A CCS cache line
+ * corresponds to an area of 4x1 tiles in the main surface. The main surface
+ * pitch is required to be a multiple of 4 tile widths.
+ */
+#define I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC fourcc_mod_code(INTEL, 15)
+
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
  *
@@ -656,6 +737,28 @@ extern "C" {
  */
 #define DRM_FORMAT_MOD_QCOM_COMPRESSED	fourcc_mod_code(QCOM, 1)
 
+/*
+ * Qualcomm Tiled Format
+ *
+ * Similar to DRM_FORMAT_MOD_QCOM_COMPRESSED but not compressed.
+ * Implementation may be platform and base-format specific.
+ *
+ * Each macrotile consists of m x n (mostly 4 x 4) tiles.
+ * Pixel data pitch/stride is aligned with macrotile width.
+ * Pixel data height is aligned with macrotile height.
+ * Entire pixel data buffer is aligned with 4k(bytes).
+ */
+#define DRM_FORMAT_MOD_QCOM_TILED3	fourcc_mod_code(QCOM, 3)
+
+/*
+ * Qualcomm Alternate Tiled Format
+ *
+ * Alternate tiled format typically only used within GMEM.
+ * Implementation may be platform and base-format specific.
+ */
+#define DRM_FORMAT_MOD_QCOM_TILED2	fourcc_mod_code(QCOM, 2)
+
+
 /* Vivante framebuffer modifiers */
 
 /*
@@ -696,6 +799,35 @@ extern "C" {
  */
 #define DRM_FORMAT_MOD_VIVANTE_SPLIT_SUPER_TILED fourcc_mod_code(VIVANTE, 4)
 
+/*
+ * Vivante TS (tile-status) buffer modifiers. They can be combined with all of
+ * the color buffer tiling modifiers defined above. When TS is present it's a
+ * separate buffer containing the clear/compression status of each tile. The
+ * modifiers are defined as VIVANTE_MOD_TS_c_s, where c is the color buffer
+ * tile size in bytes covered by one entry in the status buffer and s is the
+ * number of status bits per entry.
+ * We reserve the top 8 bits of the Vivante modifier space for tile status
+ * clear/compression modifiers, as future cores might add some more TS layout
+ * variations.
+ */
+#define VIVANTE_MOD_TS_64_4               (1ULL << 48)
+#define VIVANTE_MOD_TS_64_2               (2ULL << 48)
+#define VIVANTE_MOD_TS_128_4              (3ULL << 48)
+#define VIVANTE_MOD_TS_256_4              (4ULL << 48)
+#define VIVANTE_MOD_TS_MASK               (0xfULL << 48)
+
+/*
+ * Vivante compression modifiers. Those depend on a TS modifier being present
+ * as the TS bits get reinterpreted as compression tags instead of simple
+ * clear markers when compression is enabled.
+ */
+#define VIVANTE_MOD_COMP_DEC400           (1ULL << 52)
+#define VIVANTE_MOD_COMP_MASK             (0xfULL << 52)
+
+/* Masking out the extension bits will yield the base modifier. */
+#define VIVANTE_MOD_EXT_MASK              (VIVANTE_MOD_TS_MASK | \
+                                           VIVANTE_MOD_COMP_MASK)
+
 /* NVIDIA frame buffer modifiers */
 
 /*
@@ -802,7 +934,7 @@ extern "C" {
  * which corresponds to the "generic" kind used for simple single-sample
  * uncompressed color formats on Fermi - Volta GPUs.
  */
-static __inline__ __u64
+static inline __u64
 drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 {
 	if (!(modifier & 0x10) || (modifier & (0xff << 12)))
@@ -1341,6 +1473,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define AMD_FMT_MOD_TILE_VER_GFX9 1
 #define AMD_FMT_MOD_TILE_VER_GFX10 2
 #define AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS 3
+#define AMD_FMT_MOD_TILE_VER_GFX11 4
 
 /*
  * 64K_S is the same for GFX9/GFX10/GFX10_RBPLUS and hence has GFX9 as canonical
@@ -1356,6 +1489,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define AMD_FMT_MOD_TILE_GFX9_64K_S_X 25
 #define AMD_FMT_MOD_TILE_GFX9_64K_D_X 26
 #define AMD_FMT_MOD_TILE_GFX9_64K_R_X 27
+#define AMD_FMT_MOD_TILE_GFX11_256K_R_X 31
 
 #define AMD_FMT_MOD_DCC_BLOCK_64B 0
 #define AMD_FMT_MOD_DCC_BLOCK_128B 1
@@ -1422,11 +1556,11 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define AMD_FMT_MOD_PIPE_MASK 0x7
 
 #define AMD_FMT_MOD_SET(field, value) \
-	((uint64_t)(value) << AMD_FMT_MOD_##field##_SHIFT)
+	((__u64)(value) << AMD_FMT_MOD_##field##_SHIFT)
 #define AMD_FMT_MOD_GET(field, value) \
 	(((value) >> AMD_FMT_MOD_##field##_SHIFT) & AMD_FMT_MOD_##field##_MASK)
 #define AMD_FMT_MOD_CLEAR(field) \
-	(~((uint64_t)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
+	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
 
 #if defined(__cplusplus)
 }
-- 
2.25.1
