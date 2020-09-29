Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844376E1E6
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2020 21:12:44 +0000 (UTC)
From: Matt Roper <matthew.d.roper@intel.com>
Date: Tue, 29 Sep 2020 14:12:38 -0700
Message-Id: <20200929211238.2220951-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] drm-uapi: Re-synchronize drm_fourcc.h with
 kernel
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

drm_fourcc.h should generally be a direct copy of the kernel's header
file.  There have recently been a couple IGT commits that added
not-yet-upstream framebuffer modifiers to IGT's copy of this header, but
those modifiers will be lost and cause breakage the next time somebody
does a direct copy of the kernel header if the IDs still haven't landed
in the kernel.

Let's go ahead and resync the header now, and switch the places that
were using the not-yet-upstream defines over to the LOCAL_ variants that
we already have in lib/ioctl_wrappers.h.

Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Fixes: 37bc7b51024b ("drm-uapi/drm_fourcc: Format modifier for GEN12 render engine with Color Clear")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 include/drm-uapi/drm_fourcc.h | 332 ++++++++++++++++++++++++++++++++--
 lib/igt_fb.c                  |   8 +-
 2 files changed, 319 insertions(+), 21 deletions(-)

diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
index 30af8dcf..82f32780 100644
--- a/include/drm-uapi/drm_fourcc.h
+++ b/include/drm-uapi/drm_fourcc.h
@@ -69,7 +69,7 @@ extern "C" {
 #define fourcc_code(a, b, c, d) ((__u32)(a) | ((__u32)(b) << 8) | \
 				 ((__u32)(c) << 16) | ((__u32)(d) << 24))
 
-#define DRM_FORMAT_BIG_ENDIAN (1<<31) /* format is big endian instead of little endian */
+#define DRM_FORMAT_BIG_ENDIAN (1U<<31) /* format is big endian instead of little endian */
 
 /* Reserve 0 for the invalid format specifier */
 #define DRM_FORMAT_INVALID	0
@@ -236,6 +236,12 @@ extern "C" {
 #define DRM_FORMAT_NV61		fourcc_code('N', 'V', '6', '1') /* 2x1 subsampled Cb:Cr plane */
 #define DRM_FORMAT_NV24		fourcc_code('N', 'V', '2', '4') /* non-subsampled Cr:Cb plane */
 #define DRM_FORMAT_NV42		fourcc_code('N', 'V', '4', '2') /* non-subsampled Cb:Cr plane */
+/*
+ * 2 plane YCbCr
+ * index 0 = Y plane, [39:0] Y3:Y2:Y1:Y0 little endian
+ * index 1 = Cr:Cb plane, [39:0] Cr1:Cb1:Cr0:Cb0 little endian
+ */
+#define DRM_FORMAT_NV15		fourcc_code('N', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane */
 
 /*
  * 2 plane YCbCr MSB aligned
@@ -265,6 +271,22 @@ extern "C" {
  */
 #define DRM_FORMAT_P016		fourcc_code('P', '0', '1', '6') /* 2x2 subsampled Cr:Cb plane 16 bits per channel */
 
+/* 3 plane non-subsampled (444) YCbCr
+ * 16 bits per component, but only 10 bits are used and 6 bits are padded
+ * index 0: Y plane, [15:0] Y:x [10:6] little endian
+ * index 1: Cb plane, [15:0] Cb:x [10:6] little endian
+ * index 2: Cr plane, [15:0] Cr:x [10:6] little endian
+ */
+#define DRM_FORMAT_Q410		fourcc_code('Q', '4', '1', '0')
+
+/* 3 plane non-subsampled (444) YCrCb
+ * 16 bits per component, but only 10 bits are used and 6 bits are padded
+ * index 0: Y plane, [15:0] Y:x [10:6] little endian
+ * index 1: Cr plane, [15:0] Cr:x [10:6] little endian
+ * index 2: Cb plane, [15:0] Cb:x [10:6] little endian
+ */
+#define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
+
 /*
  * 3 plane YCbCr
  * index 0: Y plane, [7:0] Y
@@ -309,6 +331,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_BROADCOM 0x07
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
+#define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
 
 /* add more to the end as needed */
 
@@ -323,8 +346,33 @@ extern "C" {
  * When adding a new token please document the layout with a code comment,
  * similar to the fourcc codes above. drm_fourcc.h is considered the
  * authoritative source for all of these.
+ *
+ * Generic modifier names:
+ *
+ * DRM_FORMAT_MOD_GENERIC_* definitions are used to provide vendor-neutral names
+ * for layouts which are common across multiple vendors. To preserve
+ * compatibility, in cases where a vendor-specific definition already exists and
+ * a generic name for it is desired, the common name is a purely symbolic alias
+ * and must use the same numerical value as the original definition.
+ *
+ * Note that generic names should only be used for modifiers which describe
+ * generic layouts (such as pixel re-ordering), which may have
+ * independently-developed support across multiple vendors.
+ *
+ * In future cases where a generic layout is identified before merging with a
+ * vendor-specific modifier, a new 'GENERIC' vendor or modifier using vendor
+ * 'NONE' could be considered. This should only be for obvious, exceptional
+ * cases to avoid polluting the 'GENERIC' namespace with modifiers which only
+ * apply to a single vendor.
+ *
+ * Generic names should not be used for cases where multiple hardware vendors
+ * have implementations of the same standardised compression scheme (such as
+ * AFBC). In those cases, all implementations should use the same format
+ * modifier(s), reflecting the vendor of the standard.
  */
 
+#define DRM_FORMAT_MOD_GENERIC_16_16_TILE DRM_FORMAT_MOD_SAMSUNG_16_16_TILE
+
 /*
  * Invalid Modifier
  *
@@ -354,9 +402,12 @@ extern "C" {
  * a platform-dependent stride. On top of that the memory can apply
  * platform-depending swizzling of some higher address bits into bit6.
  *
- * This format is highly platforms specific and not useful for cross-driver
- * sharing. It exists since on a given platform it does uniquely identify the
- * layout in a simple way for i915-specific userspace.
+ * Note that this layout is only accurate on intel gen 8+ or valleyview chipsets.
+ * On earlier platforms the is highly platforms specific and not useful for
+ * cross-driver sharing. It exists since on a given platform it does uniquely
+ * identify the layout in a simple way for i915-specific userspace, which
+ * facilitated conversion of userspace to modifiers. Additionally the exact
+ * format on some really old platforms is not known.
  */
 #define I915_FORMAT_MOD_X_TILED	fourcc_mod_code(INTEL, 1)
 
@@ -369,9 +420,12 @@ extern "C" {
  * memory can apply platform-depending swizzling of some higher address bits
  * into bit6.
  *
- * This format is highly platforms specific and not useful for cross-driver
- * sharing. It exists since on a given platform it does uniquely identify the
- * layout in a simple way for i915-specific userspace.
+ * Note that this layout is only accurate on intel gen 8+ or valleyview chipsets.
+ * On earlier platforms the is highly platforms specific and not useful for
+ * cross-driver sharing. It exists since on a given platform it does uniquely
+ * identify the layout in a simple way for i915-specific userspace, which
+ * facilitated conversion of userspace to modifiers. Additionally the exact
+ * format on some really old platforms is not known.
  */
 #define I915_FORMAT_MOD_Y_TILED	fourcc_mod_code(INTEL, 2)
 
@@ -409,8 +463,30 @@ extern "C" {
  */
 #define I915_FORMAT_MOD_Y_TILED_CCS	fourcc_mod_code(INTEL, 4)
 #define I915_FORMAT_MOD_Yf_TILED_CCS	fourcc_mod_code(INTEL, 5)
+
+/*
+ * Intel color control surfaces (CCS) for Gen-12 render compression.
+ *
+ * The main surface is Y-tiled and at plane index 0, the CCS is linear and
+ * at index 1. A 64B CCS cache line corresponds to an area of 4x1 tiles in
+ * main surface. In other words, 4 bits in CCS map to a main surface cache
+ * line pair. The main surface pitch is required to be a multiple of four
+ * Y-tile widths.
+ */
 #define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS fourcc_mod_code(INTEL, 6)
-#define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC fourcc_mod_code(INTEL, 8)
+
+/*
+ * Intel color control surfaces (CCS) for Gen-12 media compression
+ *
+ * The main surface is Y-tiled and at plane index 0, the CCS is linear and
+ * at index 1. A 64B CCS cache line corresponds to an area of 4x1 tiles in
+ * main surface. In other words, 4 bits in CCS map to a main surface cache
+ * line pair. The main surface pitch is required to be a multiple of four
+ * Y-tile widths. For semi-planar formats like NV12, CCS planes follow the
+ * Y and UV planes i.e., planes 0 and 1 are used for Y and UV surfaces,
+ * planes 2 and 3 for the respective CCS.
+ */
+#define I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS fourcc_mod_code(INTEL, 7)
 
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
@@ -499,7 +575,113 @@ extern "C" {
 #define DRM_FORMAT_MOD_NVIDIA_TEGRA_TILED fourcc_mod_code(NVIDIA, 1)
 
 /*
- * 16Bx2 Block Linear layout, used by desktop GPUs, and Tegra K1 and later
+ * Generalized Block Linear layout, used by desktop GPUs starting with NV50/G80,
+ * and Tegra GPUs starting with Tegra K1.
+ *
+ * Pixels are arranged in Groups of Bytes (GOBs).  GOB size and layout varies
+ * based on the architecture generation.  GOBs themselves are then arranged in
+ * 3D blocks, with the block dimensions (in terms of GOBs) always being a power
+ * of two, and hence expressible as their log2 equivalent (E.g., "2" represents
+ * a block depth or height of "4").
+ *
+ * Chapter 20 "Pixel Memory Formats" of the Tegra X1 TRM describes this format
+ * in full detail.
+ *
+ *       Macro
+ * Bits  Param Description
+ * ----  ----- -----------------------------------------------------------------
+ *
+ *  3:0  h     log2(height) of each block, in GOBs.  Placed here for
+ *             compatibility with the existing
+ *             DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()-based modifiers.
+ *
+ *  4:4  -     Must be 1, to indicate block-linear layout.  Necessary for
+ *             compatibility with the existing
+ *             DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()-based modifiers.
+ *
+ *  8:5  -     Reserved (To support 3D-surfaces with variable log2(depth) block
+ *             size).  Must be zero.
+ *
+ *             Note there is no log2(width) parameter.  Some portions of the
+ *             hardware support a block width of two gobs, but it is impractical
+ *             to use due to lack of support elsewhere, and has no known
+ *             benefits.
+ *
+ * 11:9  -     Reserved (To support 2D-array textures with variable array stride
+ *             in blocks, specified via log2(tile width in blocks)).  Must be
+ *             zero.
+ *
+ * 19:12 k     Page Kind.  This value directly maps to a field in the page
+ *             tables of all GPUs >= NV50.  It affects the exact layout of bits
+ *             in memory and can be derived from the tuple
+ *
+ *               (format, GPU model, compression type, samples per pixel)
+ *
+ *             Where compression type is defined below.  If GPU model were
+ *             implied by the format modifier, format, or memory buffer, page
+ *             kind would not need to be included in the modifier itself, but
+ *             since the modifier should define the layout of the associated
+ *             memory buffer independent from any device or other context, it
+ *             must be included here.
+ *
+ * 21:20 g     GOB Height and Page Kind Generation.  The height of a GOB changed
+ *             starting with Fermi GPUs.  Additionally, the mapping between page
+ *             kind and bit layout has changed at various points.
+ *
+ *               0 = Gob Height 8, Fermi - Volta, Tegra K1+ Page Kind mapping
+ *               1 = Gob Height 4, G80 - GT2XX Page Kind mapping
+ *               2 = Gob Height 8, Turing+ Page Kind mapping
+ *               3 = Reserved for future use.
+ *
+ * 22:22 s     Sector layout.  On Tegra GPUs prior to Xavier, there is a further
+ *             bit remapping step that occurs at an even lower level than the
+ *             page kind and block linear swizzles.  This causes the layout of
+ *             surfaces mapped in those SOC's GPUs to be incompatible with the
+ *             equivalent mapping on other GPUs in the same system.
+ *
+ *               0 = Tegra K1 - Tegra Parker/TX2 Layout.
+ *               1 = Desktop GPU and Tegra Xavier+ Layout
+ *
+ * 25:23 c     Lossless Framebuffer Compression type.
+ *
+ *               0 = none
+ *               1 = ROP/3D, layout 1, exact compression format implied by Page
+ *                   Kind field
+ *               2 = ROP/3D, layout 2, exact compression format implied by Page
+ *                   Kind field
+ *               3 = CDE horizontal
+ *               4 = CDE vertical
+ *               5 = Reserved for future use
+ *               6 = Reserved for future use
+ *               7 = Reserved for future use
+ *
+ * 55:25 -     Reserved for future use.  Must be zero.
+ */
+#define DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(c, s, g, k, h) \
+	fourcc_mod_code(NVIDIA, (0x10 | \
+				 ((h) & 0xf) | \
+				 (((k) & 0xff) << 12) | \
+				 (((g) & 0x3) << 20) | \
+				 (((s) & 0x1) << 22) | \
+				 (((c) & 0x7) << 23)))
+
+/* To grandfather in prior block linear format modifiers to the above layout,
+ * the page kind "0", which corresponds to "pitch/linear" and hence is unusable
+ * with block-linear layouts, is remapped within drivers to the value 0xfe,
+ * which corresponds to the "generic" kind used for simple single-sample
+ * uncompressed color formats on Fermi - Volta GPUs.
+ */
+static inline __u64
+drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
+{
+	if (!(modifier & 0x10) || (modifier & (0xff << 12)))
+		return modifier;
+	else
+		return modifier | (0xfe << 12);
+}
+
+/*
+ * 16Bx2 Block Linear layout, used by Tegra K1 and later
  *
  * Pixels are arranged in 64x8 Groups Of Bytes (GOBs). GOBs are then stacked
  * vertically by a power of 2 (1 to 32 GOBs) to form a block.
@@ -520,20 +702,20 @@ extern "C" {
  * in full detail.
  */
 #define DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(v) \
-	fourcc_mod_code(NVIDIA, 0x10 | ((v) & 0xf))
+	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0, (v))
 
 #define DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_ONE_GOB \
-	fourcc_mod_code(NVIDIA, 0x10)
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0)
 #define DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_TWO_GOB \
-	fourcc_mod_code(NVIDIA, 0x11)
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1)
 #define DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_FOUR_GOB \
-	fourcc_mod_code(NVIDIA, 0x12)
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2)
 #define DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_EIGHT_GOB \
-	fourcc_mod_code(NVIDIA, 0x13)
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3)
 #define DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_SIXTEEN_GOB \
-	fourcc_mod_code(NVIDIA, 0x14)
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4)
 #define DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_THIRTYTWO_GOB \
-	fourcc_mod_code(NVIDIA, 0x15)
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5)
 
 /*
  * Some Broadcom modifiers take parameters, for example the number of
@@ -650,7 +832,21 @@ extern "C" {
  * Further information on the use of AFBC modifiers can be found in
  * Documentation/gpu/afbc.rst
  */
-#define DRM_FORMAT_MOD_ARM_AFBC(__afbc_mode)	fourcc_mod_code(ARM, __afbc_mode)
+
+/*
+ * The top 4 bits (out of the 56 bits alloted for specifying vendor specific
+ * modifiers) denote the category for modifiers. Currently we have only two
+ * categories of modifiers ie AFBC and MISC. We can have a maximum of sixteen
+ * different categories.
+ */
+#define DRM_FORMAT_MOD_ARM_CODE(__type, __val) \
+	fourcc_mod_code(ARM, ((__u64)(__type) << 52) | ((__val) & 0x000fffffffffffffULL))
+
+#define DRM_FORMAT_MOD_ARM_TYPE_AFBC 0x00
+#define DRM_FORMAT_MOD_ARM_TYPE_MISC 0x01
+
+#define DRM_FORMAT_MOD_ARM_AFBC(__afbc_mode) \
+	DRM_FORMAT_MOD_ARM_CODE(DRM_FORMAT_MOD_ARM_TYPE_AFBC, __afbc_mode)
 
 /*
  * AFBC superblock size
@@ -744,6 +940,28 @@ extern "C" {
  */
 #define AFBC_FORMAT_MOD_BCH     (1ULL << 11)
 
+/* AFBC uncompressed storage mode
+ *
+ * Indicates that the buffer is using AFBC uncompressed storage mode.
+ * In this mode all superblock payloads in the buffer use the uncompressed
+ * storage mode, which is usually only used for data which cannot be compressed.
+ * The buffer layout is the same as for AFBC buffers without USM set, this only
+ * affects the storage mode of the individual superblocks. Note that even a
+ * buffer without USM set may use uncompressed storage mode for some or all
+ * superblocks, USM just guarantees it for all.
+ */
+#define AFBC_FORMAT_MOD_USM	(1ULL << 12)
+
+/*
+ * Arm 16x16 Block U-Interleaved modifier
+ *
+ * This is used by Arm Mali Utgard and Midgard GPUs. It divides the image
+ * into 16x16 pixel blocks. Blocks are stored linearly in order, but pixels
+ * in the block are reordered.
+ */
+#define DRM_FORMAT_MOD_ARM_16X16_BLOCK_U_INTERLEAVED \
+	DRM_FORMAT_MOD_ARM_CODE(DRM_FORMAT_MOD_ARM_TYPE_MISC, 1ULL)
+
 /*
  * Allwinner tiled modifier
  *
@@ -758,6 +976,86 @@ extern "C" {
  */
 #define DRM_FORMAT_MOD_ALLWINNER_TILED fourcc_mod_code(ALLWINNER, 1)
 
+/*
+ * Amlogic Video Framebuffer Compression modifiers
+ *
+ * Amlogic uses a proprietary lossless image compression protocol and format
+ * for their hardware video codec accelerators, either video decoders or
+ * video input encoders.
+ *
+ * It considerably reduces memory bandwidth while writing and reading
+ * frames in memory.
+ *
+ * The underlying storage is considered to be 3 components, 8bit or 10-bit
+ * per component YCbCr 420, single plane :
+ * - DRM_FORMAT_YUV420_8BIT
+ * - DRM_FORMAT_YUV420_10BIT
+ *
+ * The first 8 bits of the mode defines the layout, then the following 8 bits
+ * defines the options changing the layout.
+ *
+ * Not all combinations are valid, and different SoCs may support different
+ * combinations of layout and options.
+ */
+#define __fourcc_mod_amlogic_layout_mask 0xf
+#define __fourcc_mod_amlogic_options_shift 8
+#define __fourcc_mod_amlogic_options_mask 0xf
+
+#define DRM_FORMAT_MOD_AMLOGIC_FBC(__layout, __options) \
+	fourcc_mod_code(AMLOGIC, \
+			((__layout) & __fourcc_mod_amlogic_layout_mask) | \
+			(((__options) & __fourcc_mod_amlogic_options_mask) \
+			 << __fourcc_mod_amlogic_options_shift))
+
+/* Amlogic FBC Layouts */
+
+/*
+ * Amlogic FBC Basic Layout
+ *
+ * The basic layout is composed of:
+ * - a body content organized in 64x32 superblocks with 4096 bytes per
+ *   superblock in default mode.
+ * - a 32 bytes per 128x64 header block
+ *
+ * This layout is transferrable between Amlogic SoCs supporting this modifier.
+ */
+#define AMLOGIC_FBC_LAYOUT_BASIC		(1ULL)
+
+/*
+ * Amlogic FBC Scatter Memory layout
+ *
+ * Indicates the header contains IOMMU references to the compressed
+ * frames content to optimize memory access and layout.
+ *
+ * In this mode, only the header memory address is needed, thus the
+ * content memory organization is tied to the current producer
+ * execution and cannot be saved/dumped neither transferrable between
+ * Amlogic SoCs supporting this modifier.
+ *
+ * Due to the nature of the layout, these buffers are not expected to
+ * be accessible by the user-space clients, but only accessible by the
+ * hardware producers and consumers.
+ *
+ * The user-space clients should expect a failure while trying to mmap
+ * the DMA-BUF handle returned by the producer.
+ */
+#define AMLOGIC_FBC_LAYOUT_SCATTER		(2ULL)
+
+/* Amlogic FBC Layout Options Bit Mask */
+
+/*
+ * Amlogic FBC Memory Saving mode
+ *
+ * Indicates the storage is packed when pixel size is multiple of word
+ * boudaries, i.e. 8bit should be stored in this mode to save allocation
+ * memory.
+ *
+ * This mode reduces body layout to 3072 bytes per 64x32 superblock with
+ * the basic layout and 3200 bytes per 64x32 superblock combined with
+ * the scatter layout.
+ */
+#define AMLOGIC_FBC_OPTION_MEM_SAVING		(1ULL << 0)
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index c6c35ace..6c5fe893 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -492,7 +492,7 @@ static bool is_gen12_ccs_modifier(uint64_t modifier)
 {
 	return is_gen12_mc_ccs_modifier(modifier) ||
 		modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS ||
-		modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC;
+		modifier == LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC;
 }
 
 static bool is_ccs_modifier(uint64_t modifier)
@@ -522,7 +522,7 @@ static bool is_gen12_ccs_plane(const struct igt_fb *fb, int plane)
 
 static bool is_gen12_ccs_cc_plane(const struct igt_fb *fb, int plane)
 {
-	return fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC &&
+	return fb->modifier == LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC &&
 	       plane == 2;
 }
 
@@ -609,7 +609,7 @@ static int fb_num_planes(const struct igt_fb *fb)
 	if (is_ccs_modifier(fb->modifier))
 		num_planes *= 2;
 
-	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC)
+	if (fb->modifier == LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC)
 		num_planes++;
 
 	return num_planes;
@@ -2207,7 +2207,7 @@ static struct intel_buf *create_buf(struct fb_blit_upload *blit,
 				 end - fb->offsets[i]);
 	}
 
-	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC)
+	if (fb->modifier == LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC)
 		buf->cc.offset = fb->offsets[2];
 
 	return buf;
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
