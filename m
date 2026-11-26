Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B0D606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 19:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=L4DcJGyj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEFA1126AC;
	Thu, 26 Nov 2026 19:52:30 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8571126AC
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 19:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1795722684;
 bh=uI8SVU3MvF+gA7K5ZTlRFWHZ8z5nuXRpRYBczjRbAIs=;
 h=From:To:Cc:Subject:Date:From;
 b=L4DcJGyjNmdx/tXZS/JwJkJsSiZoGRSh/s1VJTykB0JdzzZktvy0t6wfs0GgY4f5x
 xlxwZXhY5M4IB6YMKPSlW/NGHjokSDxMBONex9aJ4XHWavyLA2L3FfWzZ0fMxIf8XQ
 mXdCpacKfyNTaAB70Xlxz39HSFNVwnKms1Nc+X2lDtEUYP0ygB4I/xNc+4FVWuYGBm
 rIaauFPPox4IBEo+MYz0vvFxCu63IKSnvrBhV8o6TAzu8YDN5VIxdK76T9cpoqCU7E
 VEbYtDklcECZLrEEV7ZSGPU4d7dv6GiW8KaofwHjDKjj1YgtegAVbZwoZIXWlRFZE7
 tCj7SYnyQjIkg==
Received: from vileplume (unknown [100.64.0.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: simonz)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CDD1117E0311;
 Thu, 26 Nov 2026 20:51:23 +0100 (CET)
From: simon.zeni@collabora.com
To: igt-dev@lists.freedesktop.org
Cc: Simon Zeni <simon.zeni@collabora.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 1/3] drm_uapi/fourcc: sync with drm-next 601c30449
Date: Thu, 26 Nov 2026 14:50:57 -0500
Message-ID: <20261126195103.53198-1-simon.zeni@collabora.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Simon Zeni <simon.zeni@collabora.com>

Sync with drm-next commit 601c30449 ("Merge tag 'drm-misc-next-2026-11-13' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next") will bring the following changes

a77fa227bb0c drm/fourcc: Add Apple Interchange layout format modifier
6a03efb8613a drm/fourcc: Add modifiers for AMD GFX6-8
19d584a634fe drm/fourcc: Fix descriptions of 32b float formats
3c8ed384503f drm/fourcc: Add DRM_FORMAT_XVUY2101010
7db42b1718da drm/fourcc: Add DRM_FORMAT_T430
e8e388c30180 drm/fourcc: Add DRM_FORMAT_XYYY2101010
c0f8aaa7dcec drm/fourcc: Add DRM_FORMAT_Y8
b718f0418420 drm/fourcc: Add DRM_FORMAT_P230
a1b6cf8e5e7e drm: uapi: Use SPDX in DRM core uAPI headers
e9e0b48cd15b drm/fourcc: fix plane order for 10/12/16-bit YCbCr formats
3aecd55af5b8 drm: add ARM interleaved 64k modifier
1cf52a0d4ba0 drm: define NVIDIA DRM format modifiers for GB20x
1aa93cfb1288 drm/fourcc: Add RGB161616 and BGR161616 formats
3529cb5ab16b drm/fourcc: Add 32b float formats
e04c3521df07 drm/fourcc: Add missing half-float formats
2271e0a20ef7 drm: drm_fourcc: add 10/12/16bit software decoder YCbCr formats
c8619f5402cb drm: add modifiers for Apple GPU layouts
3ab334814dc7 drm: add modifiers for MediaTek tiled formats
377dda2cff59 drm/fourcc: add AMD_FMT_MOD_TILE_GFX9_4K_D_X

Signed-off-by: Simon Zeni <simon.zeni@collabora.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 include/drm-uapi/drm_fourcc.h | 465 ++++++++++++++++++++++++++++++----
 1 file changed, 418 insertions(+), 47 deletions(-)

diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
index 27f87be10..07188f219 100644
--- a/include/drm-uapi/drm_fourcc.h
+++ b/include/drm-uapi/drm_fourcc.h
@@ -1,24 +1,6 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright 2011 Intel Corporation
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
  */
 
 #ifndef DRM_FOURCC_H
@@ -210,6 +192,10 @@ extern "C" {
 #define DRM_FORMAT_RGBA1010102	fourcc_code('R', 'A', '3', '0') /* [31:0] R:G:B:A 10:10:10:2 little endian */
 #define DRM_FORMAT_BGRA1010102	fourcc_code('B', 'A', '3', '0') /* [31:0] B:G:R:A 10:10:10:2 little endian */
 
+/* 48 bpp RGB */
+#define DRM_FORMAT_RGB161616 fourcc_code('R', 'G', '4', '8') /* [47:0] R:G:B 16:16:16 little endian */
+#define DRM_FORMAT_BGR161616 fourcc_code('B', 'G', '4', '8') /* [47:0] B:G:R 16:16:16 little endian */
+
 /* 64 bpp RGB */
 #define DRM_FORMAT_XRGB16161616	fourcc_code('X', 'R', '4', '8') /* [63:0] x:R:G:B 16:16:16:16 little endian */
 #define DRM_FORMAT_XBGR16161616	fourcc_code('X', 'B', '4', '8') /* [63:0] x:B:G:R 16:16:16:16 little endian */
@@ -218,7 +204,7 @@ extern "C" {
 #define DRM_FORMAT_ABGR16161616	fourcc_code('A', 'B', '4', '8') /* [63:0] A:B:G:R 16:16:16:16 little endian */
 
 /*
- * Floating point 64bpp RGB
+ * Half-Floating point - 16b/component
  * IEEE 754-2008 binary16 half-precision float
  * [15:0] sign:exponent:mantissa 1:5:10
  */
@@ -228,6 +214,20 @@ extern "C" {
 #define DRM_FORMAT_ARGB16161616F fourcc_code('A', 'R', '4', 'H') /* [63:0] A:R:G:B 16:16:16:16 little endian */
 #define DRM_FORMAT_ABGR16161616F fourcc_code('A', 'B', '4', 'H') /* [63:0] A:B:G:R 16:16:16:16 little endian */
 
+#define DRM_FORMAT_R16F          fourcc_code('R', ' ', ' ', 'H') /* [15:0] R 16 little endian */
+#define DRM_FORMAT_GR1616F       fourcc_code('G', 'R', ' ', 'H') /* [31:0] G:R 16:16 little endian */
+#define DRM_FORMAT_BGR161616F    fourcc_code('B', 'G', 'R', 'H') /* [47:0] B:G:R 16:16:16 little endian */
+
+/*
+ * Floating point - 32b/component
+ * IEEE 754-2008 binary32 float
+ * [31:0] sign:exponent:mantissa 1:8:23
+ */
+#define DRM_FORMAT_R32F          fourcc_code('R', ' ', ' ', 'F') /* [31:0] R 32 little endian */
+#define DRM_FORMAT_GR3232F       fourcc_code('G', 'R', ' ', 'F') /* [63:0] G:R 32:32 little endian */
+#define DRM_FORMAT_BGR323232F    fourcc_code('B', 'G', 'R', 'F') /* [95:0] B:G:R 32:32:32 little endian */
+#define DRM_FORMAT_ABGR32323232F fourcc_code('A', 'B', '8', 'F') /* [127:0] A:B:G:R 32:32:32:32 little endian */
+
 /*
  * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
  * of unused padding per component:
@@ -246,6 +246,7 @@ extern "C" {
 #define DRM_FORMAT_XVUY8888	fourcc_code('X', 'V', 'U', 'Y') /* [31:0] X:Cr:Cb:Y 8:8:8:8 little endian */
 #define DRM_FORMAT_VUY888	fourcc_code('V', 'U', '2', '4') /* [23:0] Cr:Cb:Y 8:8:8 little endian */
 #define DRM_FORMAT_VUY101010	fourcc_code('V', 'U', '3', '0') /* Y followed by U then V, 10:10:10. Non-linear modifier only */
+#define DRM_FORMAT_XVUY2101010	fourcc_code('X', 'Y', '3', '0') /* [31:0] x:Cr:Cb:Y 2:10:10:10 little endian */
 
 /*
  * packed Y2xx indicate for each component, xx valid data occupy msb
@@ -361,6 +362,14 @@ extern "C" {
  */
 #define DRM_FORMAT_P030		fourcc_code('P', '0', '3', '0') /* 2x2 subsampled Cr:Cb plane 10 bits per channel packed */
 
+/*
+ * 2 plane YCbCr422.
+ * 3 10 bit components and 2 padding bits packed into 4 bytes.
+ * index 0 = Y plane, [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian
+ * index 1 = Cr:Cb plane, [63:0] x:Cr2:Cb2:Cr1:x:Cb1:Cr0:Cb0 [2:10:10:10:2:10:10:10] little endian
+ */
+#define DRM_FORMAT_P230		fourcc_code('P', '2', '3', '0') /* 2x1 subsampled Cr:Cb plane 10 bits per channel packed */
+
 /* 3 plane non-subsampled (444) YCbCr
  * 16 bits per component, but only 10 bits are used and 6 bits are padded
  * index 0: Y plane, [15:0] Y:x [10:6] little endian
@@ -377,6 +386,51 @@ extern "C" {
  */
 #define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
 
+/*
+ * 3 plane non-subsampled (444) YCbCr LSB aligned
+ * 10 bpc, 30 bits per sample image data in a single contiguous buffer.
+ * index 0: Y plane,  [31:0] x:Y2:Y1:Y0    [2:10:10:10] little endian
+ * index 1: Cb plane, [31:0] x:Cb2:Cb1:Cb0 [2:10:10:10] little endian
+ * index 2: Cr plane, [31:0] x:Cr2:Cr1:Cr0 [2:10:10:10] little endian
+ */
+#define DRM_FORMAT_T430		fourcc_code('T', '4', '3', '0')
+
+/*
+ * 3 plane YCbCr LSB aligned
+ * In order to use these formats in a similar fashion to MSB aligned ones
+ * implementation can multiply the values by 2^6=64. For that reason the padding
+ * must only contain zeros.
+ * index 0 = Y plane, [15:0] z:Y [6:10] little endian
+ * index 1 = Cb plane, [15:0] z:Cb [6:10] little endian
+ * index 2 = Cr plane, [15:0] z:Cr [6:10] little endian
+ */
+#define DRM_FORMAT_S010	fourcc_code('S', '0', '1', '0') /* 2x2 subsampled Cb (1) and Cr (2) planes 10 bits per channel */
+#define DRM_FORMAT_S210	fourcc_code('S', '2', '1', '0') /* 2x1 subsampled Cb (1) and Cr (2) planes 10 bits per channel */
+#define DRM_FORMAT_S410	fourcc_code('S', '4', '1', '0') /* non-subsampled Cb (1) and Cr (2) planes 10 bits per channel */
+
+/*
+ * 3 plane YCbCr LSB aligned
+ * In order to use these formats in a similar fashion to MSB aligned ones
+ * implementation can multiply the values by 2^4=16. For that reason the padding
+ * must only contain zeros.
+ * index 0 = Y plane, [15:0] z:Y [4:12] little endian
+ * index 1 = Cb plane, [15:0] z:Cb [4:12] little endian
+ * index 2 = Cr plane, [15:0] z:Cr [4:12] little endian
+ */
+#define DRM_FORMAT_S012	fourcc_code('S', '0', '1', '2') /* 2x2 subsampled Cb (1) and Cr (2) planes 12 bits per channel */
+#define DRM_FORMAT_S212	fourcc_code('S', '2', '1', '2') /* 2x1 subsampled Cb (1) and Cr (2) planes 12 bits per channel */
+#define DRM_FORMAT_S412	fourcc_code('S', '4', '1', '2') /* non-subsampled Cb (1) and Cr (2) planes 12 bits per channel */
+
+/*
+ * 3 plane YCbCr
+ * index 0 = Y plane, [15:0] Y little endian
+ * index 1 = Cb plane, [15:0] Cb little endian
+ * index 2 = Cr plane, [15:0] Cr little endian
+ */
+#define DRM_FORMAT_S016	fourcc_code('S', '0', '1', '6') /* 2x2 subsampled Cb (1) and Cr (2) planes 16 bits per channel */
+#define DRM_FORMAT_S216	fourcc_code('S', '2', '1', '6') /* 2x1 subsampled Cb (1) and Cr (2) planes 16 bits per channel */
+#define DRM_FORMAT_S416	fourcc_code('S', '4', '1', '6') /* non-subsampled Cb (1) and Cr (2) planes 16 bits per channel */
+
 /*
  * 3 plane YCbCr
  * index 0: Y plane, [7:0] Y
@@ -397,6 +451,16 @@ extern "C" {
 #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
 #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
 
+/*
+ * Y-only (greyscale) formats
+ *
+ * The Y-only formats are handled similarly to the YCbCr formats in the display
+ * pipeline, with the Cb and Cr implicitly neutral (0.0 in nominal values). This
+ * also means that COLOR_RANGE property applies to the Y-only formats.
+ */
+
+#define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
+#define DRM_FORMAT_XYYY2101010	fourcc_code('Y', 'P', 'A', '4')  /* [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
 
 /*
  * Format Modifiers:
@@ -421,6 +485,8 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
 #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
+#define DRM_FORMAT_MOD_VENDOR_MTK     0x0b
+#define DRM_FORMAT_MOD_VENDOR_APPLE   0x0c
 
 /* add more to the end as needed */
 
@@ -923,14 +989,20 @@ extern "C" {
  *               2 = Gob Height 8, Turing+ Page Kind mapping
  *               3 = Reserved for future use.
  *
- * 22:22 s     Sector layout.  On Tegra GPUs prior to Xavier, there is a further
- *             bit remapping step that occurs at an even lower level than the
- *             page kind and block linear swizzles.  This causes the layout of
- *             surfaces mapped in those SOC's GPUs to be incompatible with the
- *             equivalent mapping on other GPUs in the same system.
- *
- *               0 = Tegra K1 - Tegra Parker/TX2 Layout.
- *               1 = Desktop GPU and Tegra Xavier+ Layout
+ * 22:22 s     Sector layout.  There is a further bit remapping step that occurs
+ * 26:27       at an even lower level than the page kind and block linear
+ *             swizzles.  This causes the bit arrangement of surfaces in memory
+ *             to differ subtly, and prevents direct sharing of surfaces between
+ *             GPUs with different layouts.
+ *
+ *               0 = Tegra K1 - Tegra Parker/TX2 Layout
+ *               1 = Pre-GB20x, GB20x 32+ bpp, GB10, Tegra Xavier-Orin Layout
+ *               2 = GB20x(Blackwell 2)+ 8 bpp surface layout
+ *               3 = GB20x(Blackwell 2)+ 16 bpp surface layout
+ *               4 = Reserved for future use.
+ *               5 = Reserved for future use.
+ *               6 = Reserved for future use.
+ *               7 = Reserved for future use.
  *
  * 25:23 c     Lossless Framebuffer Compression type.
  *
@@ -945,7 +1017,7 @@ extern "C" {
  *               6 = Reserved for future use
  *               7 = Reserved for future use
  *
- * 55:25 -     Reserved for future use.  Must be zero.
+ * 55:28 -     Reserved for future use.  Must be zero.
  */
 #define DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(c, s, g, k, h) \
 	fourcc_mod_code(NVIDIA, (0x10 | \
@@ -953,6 +1025,7 @@ extern "C" {
 				 (((k) & 0xff) << 12) | \
 				 (((g) & 0x3) << 20) | \
 				 (((s) & 0x1) << 22) | \
+				 (((s) & 0x6) << 25) | \
 				 (((c) & 0x7) << 23)))
 
 /* To grandfather in prior block linear format modifiers to the above layout,
@@ -1359,6 +1432,22 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define DRM_FORMAT_MOD_ARM_16X16_BLOCK_U_INTERLEAVED \
 	DRM_FORMAT_MOD_ARM_CODE(DRM_FORMAT_MOD_ARM_TYPE_MISC, 1ULL)
 
+/*
+ * ARM 64k interleaved modifier
+ *
+ * This is used by ARM Mali v10+ GPUs. With this modifier, the plane is divided
+ * into 64k byte 1:1 or 2:1 -sided tiles. The 64k tiles are laid out linearly.
+ * Each 64k tile is divided into blocks of 16x16 texel blocks, which are
+ * themselves laid out linearly within a 64k tile. Then within each 16x16
+ * block, texel blocks are laid out according to U order, similar to
+ * 16X16_BLOCK_U_INTERLEAVED.
+ *
+ * Note that unlike 16X16_BLOCK_U_INTERLEAVED, the layout does not change
+ * depending on whether a format is compressed or not.
+ */
+#define DRM_FORMAT_MOD_ARM_INTERLEAVED_64K \
+	DRM_FORMAT_MOD_ARM_CODE(DRM_FORMAT_MOD_ARM_TYPE_MISC, 2ULL)
+
 /*
  * Allwinner tiled modifier
  *
@@ -1453,6 +1542,114 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
  */
 #define AMLOGIC_FBC_OPTION_MEM_SAVING		(1ULL << 0)
 
+/* MediaTek modifiers
+ * Bits  Parameter                Notes
+ * ----- ------------------------ ---------------------------------------------
+ *   7: 0 TILE LAYOUT              Values are MTK_FMT_MOD_TILE_*
+ *  15: 8 COMPRESSION              Values are MTK_FMT_MOD_COMPRESS_*
+ *  23:16 10 BIT LAYOUT            Values are MTK_FMT_MOD_10BIT_LAYOUT_*
+ *
+ */
+
+#define DRM_FORMAT_MOD_MTK(__flags)		fourcc_mod_code(MTK, __flags)
+
+/*
+ * MediaTek Tiled Modifier
+ * The lowest 8 bits of the modifier is used to specify the tiling
+ * layout. Only the 16L_32S tiling is used for now, but we define an
+ * "untiled" version and leave room for future expansion.
+ */
+#define MTK_FMT_MOD_TILE_MASK     0xf
+#define MTK_FMT_MOD_TILE_NONE     0x0
+#define MTK_FMT_MOD_TILE_16L32S   0x1
+
+/*
+ * Bits 8-15 specify compression options
+ */
+#define MTK_FMT_MOD_COMPRESS_MASK (0xf << 8)
+#define MTK_FMT_MOD_COMPRESS_NONE (0x0 << 8)
+#define MTK_FMT_MOD_COMPRESS_V1   (0x1 << 8)
+
+/*
+ * Bits 16-23 specify how the bits of 10 bit formats are
+ * stored out in memory
+ */
+#define MTK_FMT_MOD_10BIT_LAYOUT_MASK      (0xf << 16)
+#define MTK_FMT_MOD_10BIT_LAYOUT_PACKED    (0x0 << 16)
+#define MTK_FMT_MOD_10BIT_LAYOUT_LSBTILED  (0x1 << 16)
+#define MTK_FMT_MOD_10BIT_LAYOUT_LSBRASTER (0x2 << 16)
+
+/* alias for the most common tiling format */
+#define DRM_FORMAT_MOD_MTK_16L_32S_TILE  DRM_FORMAT_MOD_MTK(MTK_FMT_MOD_TILE_16L32S)
+
+/*
+ * Apple GPU-tiled layouts.
+ *
+ * Apple GPUs support nonlinear tilings with optional lossless compression.
+ *
+ * GPU-tiled images are divided into 16KiB tiles:
+ *
+ *     Bytes per pixel  Tile size
+ *     ---------------  ---------
+ *                   1  128x128
+ *                   2  128x64
+ *                   4  64x64
+ *                   8  64x32
+ *                  16  32x32
+ *
+ * Tiles are raster-order. Pixels within a tile are interleaved (Morton order).
+ *
+ * Compressed images pad the body to 128-bytes and are immediately followed by a
+ * metadata section. The metadata section rounds the image dimensions to
+ * powers-of-two and contains 8 bytes for each 16x16 compression subtile.
+ * Subtiles are interleaved (Morton order).
+ *
+ * All images are 128-byte aligned.
+ *
+ * These layouts fundamentally do not have meaningful strides. No matter how we
+ * specify strides for these layouts, userspace unaware of Apple image layouts
+ * will be unable to use correctly the specified stride for any purpose.
+ * Userspace aware of the image layouts do not use strides. The most "correct"
+ * convention would be setting the image stride to 0. Unfortunately, some
+ * software assumes the stride is at least (width * bytes per pixel). We
+ * therefore require that stride equals (width * bytes per pixel). Since the
+ * stride is arbitrary here, we pick the simplest convention.
+ *
+ * Although containing two sections, compressed image layouts are treated in
+ * software as a single plane. This is modelled after AFBC, a similar
+ * scheme. Attempting to separate the sections to be "explicit" in DRM would
+ * only generate more confusion, as software does not treat the image this way.
+ *
+ * For detailed information on the hardware image layouts, see
+ * https://docs.mesa3d.org/drivers/asahi.html#image-layouts
+ */
+#define DRM_FORMAT_MOD_APPLE_GPU_TILED fourcc_mod_code(APPLE, 1)
+#define DRM_FORMAT_MOD_APPLE_GPU_TILED_COMPRESSED fourcc_mod_code(APPLE, 2)
+
+/*
+ * Apple Interchange layout
+ *
+ * Apple Interchange is a compressed framebuffer format used exclusively for
+ * sharing buffers between hardware blocks (GPU, display controller, video
+ * codecs) on Apple platforms. It is similar to and uses the same compression
+ * scheme as GPU_TILED_COMPRESSED. There is no known uncompressed variant
+ * of Apple Interchange.
+ *
+ * Unlike the GPU layouts, tile size is not dependent on bit depth. RGB
+ * images and the chroma components of YUV images use 16x16 tiles. The
+ * luma component of YUV images uses 32x32 tiles. Compression tiles
+ * are once again 16x16 with 8 bytes of metadata per compression subtile.
+ *
+ * Following the example set by GPU_TILED_{,COMPRESSED}, Interchange images
+ * are treated as a single plane by software and do not have a meaningful
+ * stride.
+ *
+ * AGX has limited support for Apple Interchange. It cannot be used for Z/S
+ * buffers or array images, for example. It is intended for scanout buffer
+ * sharing only.
+ */
+#define DRM_FORMAT_MOD_APPLE_INTERCHANGE fourcc_mod_code(APPLE, 3)
+
 /*
  * AMD modifiers
  *
@@ -1473,36 +1670,69 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
  * For multi-plane formats the above surfaces get merged into one plane for
  * each format plane, based on the required alignment only.
  *
- * Bits  Parameter                Notes
- * ----- ------------------------ ---------------------------------------------
+ * Bits    Parameter                Notes
+ * ------- ------------------------ ---------------------------------------------
+ *
+ * DRM format modifier fields on AMD GPUs:
+ *     7:0 TILE_VERSION             Values are AMD_FMT_MOD_TILE_VER_*
+ *    12:8 TILE                     Values are AMD_FMT_MOD_TILE_<version>_*
+ *      13 DCC                      Delta Color Compression, supported on GFX8 and newer
+ *   55:14 (chip specific)          See below for details, depends on GFX block version
+ *   63:56 Vendor                   Value is DRM_FORMAT_MOD_VENDOR_AMD
+ *
+ * Chip specific fields on Gfx9 and newer:
+ *      14 DCC_RETILE
+ *      15 DCC_PIPE_ALIGN
+ *      16 DCC_INDEPENDENT_64B
+ *      17 DCC_INDEPENDENT_128B
+ *   19:18 DCC_MAX_COMPRESSED_BLOCK Values are AMD_FMT_MOD_DCC_BLOCK_*
+ *      20 DCC_CONSTANT_ENCODE
+ *   23:21 PIPE_XOR_BITS            Only for some chips
+ *   26:24 BANK_XOR_BITS            Only for some chips
+ *   29:27 PACKERS                  Only for some chips
+ *   32:30 RB                       Only for some chips
+ *   35:33 PIPE                     Only for some chips
+ *   55:36 -                        Reserved for future use, must be zero
+ *
+ * Chip specific fields on Gfx6-8:
+ *   16:14 MICROTILE                Micro tile format
+ *   21:17 PIPE_CONFIG              Number of pipes and how pipes are interleaved
+ *   24:22 TILE_SPLIT               Tile split size
+ *   26:25 BANK_WIDTH               Number of tiles in the X direction in the same bank
+ *   28:27 BANK_HEIGHT              Number of tiles in the Y direction in the same bank
+ *   30:29 MACRO_TILE_ASPECT        Macro tile aspect ratio
+ *   32:31 NUM_BANKS                Number of banks
+ *   55:33 -                        Reserved for future use, must be zero
  *
- *   7:0 TILE_VERSION             Values are AMD_FMT_MOD_TILE_VER_*
- *  12:8 TILE                     Values are AMD_FMT_MOD_TILE_<version>_*
- *    13 DCC
- *    14 DCC_RETILE
- *    15 DCC_PIPE_ALIGN
- *    16 DCC_INDEPENDENT_64B
- *    17 DCC_INDEPENDENT_128B
- * 19:18 DCC_MAX_COMPRESSED_BLOCK Values are AMD_FMT_MOD_DCC_BLOCK_*
- *    20 DCC_CONSTANT_ENCODE
- * 23:21 PIPE_XOR_BITS            Only for some chips
- * 26:24 BANK_XOR_BITS            Only for some chips
- * 29:27 PACKERS                  Only for some chips
- * 32:30 RB                       Only for some chips
- * 35:33 PIPE                     Only for some chips
- * 55:36 -                        Reserved for future use, must be zero
  */
 #define AMD_FMT_MOD fourcc_mod_code(AMD, 0)
 
 #define IS_AMD_FMT_MOD(val) (((val) >> 56) == DRM_FORMAT_MOD_VENDOR_AMD)
 
-/* Reserve 0 for GFX8 and older */
+#define AMD_FMT_MOD_TILE_VER_GFX6 0
 #define AMD_FMT_MOD_TILE_VER_GFX9 1
 #define AMD_FMT_MOD_TILE_VER_GFX10 2
 #define AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS 3
 #define AMD_FMT_MOD_TILE_VER_GFX11 4
 #define AMD_FMT_MOD_TILE_VER_GFX12 5
 
+/*
+ * Gfx6-8 tiling modes.
+ * A complete reference implementation is found in addrlib in the Mesa code base.
+ *
+ * - Microtiled modes (1D):
+ *   Pixel data is organized into micro tiles of 8x8 pixels.
+ *
+ * - Macrotiled modes (2D):
+ *   Micro tiles are further organized into macro tiles.
+ *   These are optimized for even load distribution among memory channels.
+ *
+ * Note that only THIN1 modes are exposed here.
+ * THICK and XTHICK are for 3D images and not relevant to DRM format modifiers.
+ */
+#define AMD_FMT_MOD_TILE_GFX6_1D_TILED_THIN1 0x2
+#define AMD_FMT_MOD_TILE_GFX6_2D_TILED_THIN1 0x4
+
 /*
  * 64K_S is the same for GFX9/GFX10/GFX10_RBPLUS and hence has GFX9 as canonical
  * version.
@@ -1516,6 +1746,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
  * 64K_D_2D on GFX12 is identical to 64K_D on GFX11.
  */
 #define AMD_FMT_MOD_TILE_GFX9_64K_D 10
+#define AMD_FMT_MOD_TILE_GFX9_4K_D_X 22
 #define AMD_FMT_MOD_TILE_GFX9_64K_S_X 25
 #define AMD_FMT_MOD_TILE_GFX9_64K_D_X 26
 #define AMD_FMT_MOD_TILE_GFX9_64K_R_X 27
@@ -1600,6 +1831,146 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define AMD_FMT_MOD_PIPE_SHIFT 33
 #define AMD_FMT_MOD_PIPE_MASK 0x7
 
+/*
+ * MICRO_TILE_MODE, 3 bits. Determines the micro tile format.
+ * Only relevant to Gfx6-8.
+ *
+ * DISPLAY - Displayable tiling
+ * THIN - Non-displayable tiling, a.k.a thin micro tiling
+ * DEPTH, THICK - not exposed, not relevant to DRM format modifier use cases
+ * ROTATED - not exposed, not implemented in Linux or Mesa
+ */
+#define AMD_FMT_MOD_MICROTILE_SHIFT 14ULL
+#define AMD_FMT_MOD_MICROTILE_MASK 0x7
+
+#define AMD_FMT_MOD_MICROTILE_DISPLAY 0x0
+#define AMD_FMT_MOD_MICROTILE_THIN 0x1
+
+/*
+ * PIPE_CONFIG, 5 bits. Number of pipes and how pipes are interleaved on the surface,
+ * which means the shader engine tile size and packer tile size.
+ * Typically matches the number of memory channels, or number of RBs.
+ * Only relevant to Gfx6-8 macro tiled modes.
+ *
+ * P<n>_<a>x<b>_<c>x<d>
+ * where:
+ * <n> - number of pipes
+ * <a>x<b> - shader engine tile size
+ * <c>x<d> - packer tile size
+ */
+#define AMD_FMT_MOD_PIPE_CONFIG_SHIFT 17ULL
+#define AMD_FMT_MOD_PIPE_CONFIG_MASK 0x1f
+
+#define AMD_FMT_MOD_PIPE_CONFIG_P2 0x0
+#define AMD_FMT_MOD_PIPE_CONFIG_P4_8x16 0x4
+#define AMD_FMT_MOD_PIPE_CONFIG_P4_16x16 0x5
+#define AMD_FMT_MOD_PIPE_CONFIG_P4_16x32 0x6
+#define AMD_FMT_MOD_PIPE_CONFIG_P4_32x32 0x7
+#define AMD_FMT_MOD_PIPE_CONFIG_P8_16x16_8x16 0x8
+#define AMD_FMT_MOD_PIPE_CONFIG_P8_16x32_8x16 0x9
+#define AMD_FMT_MOD_PIPE_CONFIG_P8_32x32_8x16 0xa
+#define AMD_FMT_MOD_PIPE_CONFIG_P8_16x32_16x16 0xb
+#define AMD_FMT_MOD_PIPE_CONFIG_P8_32x32_16x16 0xc
+#define AMD_FMT_MOD_PIPE_CONFIG_P8_32x32_16x32 0xd
+#define AMD_FMT_MOD_PIPE_CONFIG_P8_32x64_32x32 0xe
+#define AMD_FMT_MOD_PIPE_CONFIG_P16_32x32_8x16 0x10
+#define AMD_FMT_MOD_PIPE_CONFIG_P16_32x32_16x16 0x11
+
+/*
+ * TILE_SPLIT, 3 bits.
+ * Only relevant to Gfx6-8 macro tiled modes.
+ *
+ * On GFX6 (or with depth tiling modes on GFX7 and newer),
+ * the GFX block uses the GB_TILE_MODE.TILE_SPLIT field directly.
+ *
+ * On GFX7 and newer with non-depth tiling modes, the GFX block uses a
+ * split factor which is stored in the GB_TILE_MODE.SAMPLE_SPLIT field.
+ * SAMPLE_SPLIT may be: 0 - 1 byte; 1 - 2 bytes; 2 - 4 bytes; 3 - 8 bytes.
+ * The actual tile size and tile split bytes are calculated as follows:
+ *
+ *    bpp = ... <- bits per pixel in the current image
+ *    thickness = ... <- depends on array mode; may be: 1, 4, 8
+ *    num_samples = ... <- number of samples in the current image
+ *    tile_size_pixels = 8 * 8
+ *    tile_bytes_1x = thickness * tile_size_pixels * bpp / 8
+ *    sample_split_factor = 1 << SAMPLE_SPLIT
+ *    tile_split_bytes = clamp(tile_bytes_1x * sample_split_factor, 256, dram_row_size_bytes)
+ *    tile_bytes = clamp(tile_bytes_1x * num_samples, 64, tile_split_bytes)
+ *
+ * In both cases, the display block (DCE) has no SAMPLE_SPLIT
+ * and just needs the tile split bytes in the GRPH_CONTROL.GRPH_TILE_SPLIT field.
+ * To maximize compatibility between GFX6-7, we don't include the SAMPLE_SPLIT
+ * in the format modifiers.
+ *
+ * The actual tile split in bytes is: 64 << field value
+ * Possible values of this field:
+ *
+ * 0 - Tile split is 64 bytes
+ * 1 - Tile split is 128 bytes
+ * 2 - Tile split is 256 bytes
+ * 3 - Tile split is 512 bytes
+ * 4 - Tile split is 1 KiB
+ * 5 - Tile split is 2 KiB
+ * 6 - Tile split is 4 KiB
+ */
+#define AMD_FMT_MOD_TILE_SPLIT_SHIFT 22ULL
+#define AMD_FMT_MOD_TILE_SPLIT_MASK 0x7
+
+/*
+ * BANK_WIDTH, 2 bits. Number of tiles in the X direction in the same bank.
+ * Only relevant to Gfx6-8 macro tiled modes.
+ * The actual bank width is: 1 << field value
+ * Possible values:
+ *
+ * 0 - bank width is 1
+ * 1 - bank width is 2
+ * 2 - bank width is 4
+ * 3 - bank width is 8
+ */
+#define AMD_FMT_MOD_BANK_WIDTH_SHIFT 25ULL
+#define AMD_FMT_MOD_BANK_WIDTH_MASK 0x3
+
+/*
+ * BANK_HEIGHT, 2 bits. Number of tiles in the Y direction in the same bank.
+ * Only relevant to Gfx6-8 macro tiled modes.
+ * The actual bank height is: 1 << field value
+ * Possible values:
+ *
+ * 0 - bank height is 1
+ * 1 - bank height is 2
+ * 2 - bank height is 4
+ * 3 - bank height is 8
+ */
+#define AMD_FMT_MOD_BANK_HEIGHT_SHIFT 27ULL
+#define AMD_FMT_MOD_BANK_HEIGHT_MASK 0x3
+
+/*
+ * MACRO_TILE_ASPECT, 2 bits. Macro tile aspect ratio.
+ * Only relevant to Gfx6-8 macro tiled modes.
+ * Possible values:
+ *
+ * 0 - aspect ratio is 1:1
+ * 1 - aspect ratio is 4:1
+ * 2 - aspect ratio is 16:1
+ * 3 - aspect ratio is 64:1
+ */
+#define AMD_FMT_MOD_MACRO_TILE_ASPECT_SHIFT 29ULL
+#define AMD_FMT_MOD_MACRO_TILE_ASPECT_MASK 0x3
+
+/*
+ * NUM_BANKS, 2 bits. Number of banks.
+ * Only relevant to Gfx6-8 macro tiled modes.
+ * The actual number of banks is: 2 << field value
+ * Possible values:
+ *
+ * 0 - number of banks is 2
+ * 1 - number of banks is 4
+ * 2 - number of banks is 8
+ * 3 - number of banks is 16
+ */
+#define AMD_FMT_MOD_NUM_BANKS_SHIFT 31ULL
+#define AMD_FMT_MOD_NUM_BANKS_MASK 0x3
+
 #define AMD_FMT_MOD_SET(field, value) \
 	((__u64)(value) << AMD_FMT_MOD_##field##_SHIFT)
 #define AMD_FMT_MOD_GET(field, value) \
-- 
2.53.0

