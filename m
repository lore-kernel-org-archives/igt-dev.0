Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612AAC52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 20:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165A710E1D4;
	Mon, 12 Aug 2024 20:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cDK7hk3Y";
	dkim-atps=neutral
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD37010E1D4
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 20:07:48 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2d1daa2577bso2798260a91.2
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 13:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723493268; x=1724098068; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=El3Sz7ERg5Eiyypo+DAN4rRcn1hcnoASU3u/Un27wRU=;
 b=cDK7hk3Yn4OfmeHiaUsaHL6vNMfaI7OqLEfHvSto4fHQB8dBEHHyujEOmFrSFdPTPt
 4HpeyZ4KnD3ZoFUulj5C4pgHPGIr8wAqKY8gJhy35lsJM0YZm5cf6RqT6L4pFZZ2uwzs
 Cp2MXAsNwSDQF2GnWsid17nxoVDjUmyS8vaH8DQTtdQNADdL0rp3LQ/lxPFWVGvvGSgi
 R9ISrQFy4UlCyyfnYqlKS/1V8S+0FnNtvBUcVW1zhdV6UOBoTB/pxZ+GTpNptSoarhnY
 MYu00cPGU6HorcmGjXe1Z4QKD4PtqfyPzKP3C/SPwvMKYcG4rm4q8Dyo3eejtlvqWmJ5
 VrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723493268; x=1724098068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=El3Sz7ERg5Eiyypo+DAN4rRcn1hcnoASU3u/Un27wRU=;
 b=RFKnipAhbHNvgMgJXfMkvZi7fiaCNg5fcOUxYF80kAKhkKWC6L0P5sfZg9STU05rwd
 xntczldrUZI44mukUxGLW78O0jkSCWxBtUzEJvjlgeisMm8StOYVrxNNJXl7EQ+N5qA9
 kPRGbJz7Mo4hnOD4s2udVouoYDfcyVUwm8bg811XQQQeya8efqMWu1/zTn2F4ylS4M2P
 XOzh6t06YUxaep6R8KiHH7SRY1i9we54PPhQYUtZ5Nis361DX0pgnC0gWgYBVxUA+kuz
 u1Zdcugczx79+ZY4xPT+eQCbE4YkOlgHD2A8pkcgcXUmj90DvIT1zUj6ZO/khw8Qw2gb
 Bk4A==
X-Gm-Message-State: AOJu0Yx/oNADYfo3S1pRGEj2fQdrY4ejMB5GMC5fuNG8C8RhFRbqj4rz
 WGQIXOMg5ptQC45SotjDHMSBx/BxwQqgXviYQupzsuPkAr5+SFWB7NjB99Wy3yA=
X-Google-Smtp-Source: AGHT+IGYD6dteTo4DrkDcu54P7/zHIohVjU0ukhUGRy3zCmEh5+eiAEut/Ky1EItMmvrEL+AInaFmg==
X-Received: by 2002:a17:90a:6048:b0:2cb:e429:f525 with SMTP id
 98e67ed59e1d1-2d392631024mr1520994a91.33.1723493267789; 
 Mon, 12 Aug 2024 13:07:47 -0700 (PDT)
Received: from localhost ([134.134.137.76]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d3931f1255sm516445a91.53.2024.08.12.13.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 13:07:47 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/3] Ignore. This patch need to be recreated later on
Date: Mon, 12 Aug 2024 23:11:22 +0300
Message-ID: <20240812201124.2013652-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240812201124.2013652-1-juhapekka.heikkila@gmail.com>
References: <20240812201124.2013652-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Here is copied drm_fourcc.h which will include xe2 ccs modifier

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 include/drm-uapi/drm_fourcc.h | 57 +++++++++++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 6 deletions(-)

diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
index 6b6235f7a..b7f0cc536 100644
--- a/include/drm-uapi/drm_fourcc.h
+++ b/include/drm-uapi/drm_fourcc.h
@@ -54,7 +54,7 @@ extern "C" {
  * Format modifiers may change any property of the buffer, including the number
  * of planes and/or the required allocation size. Format modifiers are
  * vendor-namespaced, and as such the relationship between a fourcc code and a
- * modifier is specific to the modifer being used. For example, some modifiers
+ * modifier is specific to the modifier being used. For example, some modifiers
  * may preserve meaning - such as number of planes - from the fourcc code,
  * whereas others may not.
  *
@@ -79,7 +79,7 @@ extern "C" {
  *   format.
  * - Higher-level programs interfacing with KMS/GBM/EGL/Vulkan/etc: these users
  *   see modifiers as opaque tokens they can check for equality and intersect.
- *   These users musn't need to know to reason about the modifier value
+ *   These users mustn't need to know to reason about the modifier value
  *   (i.e. they are not expected to extract information out of the modifier).
  *
  * Vendors should document their modifier usage in as much detail as
@@ -323,6 +323,8 @@ extern "C" {
  * index 1 = Cr:Cb plane, [39:0] Cr1:Cb1:Cr0:Cb0 little endian
  */
 #define DRM_FORMAT_NV15		fourcc_code('N', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane */
+#define DRM_FORMAT_NV20		fourcc_code('N', 'V', '2', '0') /* 2x1 subsampled Cr:Cb plane */
+#define DRM_FORMAT_NV30		fourcc_code('N', 'V', '3', '0') /* non-subsampled Cr:Cb plane */
 
 /*
  * 2 plane YCbCr MSB aligned
@@ -538,7 +540,7 @@ extern "C" {
  * This is a tiled layout using 4Kb tiles in row-major layout.
  * Within the tile pixels are laid out in 16 256 byte units / sub-tiles which
  * are arranged in four groups (two wide, two high) with column-major layout.
- * Each group therefore consits out of four 256 byte units, which are also laid
+ * Each group therefore consists out of four 256 byte units, which are also laid
  * out as 2x2 column-major.
  * 256 byte units are made out of four 64 byte blocks of pixels, producing
  * either a square block or a 2:1 unit.
@@ -700,6 +702,31 @@ extern "C" {
  */
 #define I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC fourcc_mod_code(INTEL, 15)
 
+/*
+ * Intel Color Control Surfaces (CCS) for graphics ver. 20 render compression
+ * on integrated graphics
+ *
+ * The main surface is Tile 4 and at plane index 0. For semi-planar formats
+ * like NV12, the Y and UV planes are Tile 4 and are located at plane indices
+ * 0 and 1, respectively. The CCS for all planes are stored outside of the
+ * GEM object in a reserved memory area dedicated for the storage of the
+ * CCS data for all compressible GEM objects.
+ */
+#define I915_FORMAT_MOD_4_TILED_LNL_CCS fourcc_mod_code(INTEL, 16)
+
+/*
+ * Intel Color Control Surfaces (CCS) for graphics ver. 20 render compression
+ * on discrete graphics
+ *
+ * The main surface is Tile 4 and at plane index 0. For semi-planar formats
+ * like NV12, the Y and UV planes are Tile 4 and are located at plane indices
+ * 0 and 1, respectively. The CCS for all planes are stored outside of the
+ * GEM object in a reserved memory area dedicated for the storage of the
+ * CCS data for all compressible GEM objects. The GEM object must be stored in
+ * contiguous memory with a size aligned to 64KB
+ */
+#define I915_FORMAT_MOD_4_TILED_BMG_CCS fourcc_mod_code(INTEL, 17)
+
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
  *
@@ -934,7 +961,7 @@ extern "C" {
  * which corresponds to the "generic" kind used for simple single-sample
  * uncompressed color formats on Fermi - Volta GPUs.
  */
-static __inline__ __u64
+static inline __u64
 drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 {
 	if (!(modifier & 0x10) || (modifier & (0xff << 12)))
@@ -1101,7 +1128,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
  */
 
 /*
- * The top 4 bits (out of the 56 bits alloted for specifying vendor specific
+ * The top 4 bits (out of the 56 bits allotted for specifying vendor specific
  * modifiers) denote the category for modifiers. Currently we have three
  * categories of modifiers ie AFBC, MISC and AFRC. We can have a maximum of
  * sixteen different categories.
@@ -1417,7 +1444,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
  * Amlogic FBC Memory Saving mode
  *
  * Indicates the storage is packed when pixel size is multiple of word
- * boudaries, i.e. 8bit should be stored in this mode to save allocation
+ * boundaries, i.e. 8bit should be stored in this mode to save allocation
  * memory.
  *
  * This mode reduces body layout to 3072 bytes per 64x32 superblock with
@@ -1474,6 +1501,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define AMD_FMT_MOD_TILE_VER_GFX10 2
 #define AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS 3
 #define AMD_FMT_MOD_TILE_VER_GFX11 4
+#define AMD_FMT_MOD_TILE_VER_GFX12 5
 
 /*
  * 64K_S is the same for GFX9/GFX10/GFX10_RBPLUS and hence has GFX9 as canonical
@@ -1484,6 +1512,8 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 /*
  * 64K_D for non-32 bpp is the same for GFX9/GFX10/GFX10_RBPLUS and hence has
  * GFX9 as canonical version.
+ *
+ * 64K_D_2D on GFX12 is identical to 64K_D on GFX11.
  */
 #define AMD_FMT_MOD_TILE_GFX9_64K_D 10
 #define AMD_FMT_MOD_TILE_GFX9_64K_S_X 25
@@ -1491,6 +1521,21 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define AMD_FMT_MOD_TILE_GFX9_64K_R_X 27
 #define AMD_FMT_MOD_TILE_GFX11_256K_R_X 31
 
+/* Gfx12 swizzle modes:
+ *    0 - LINEAR
+ *    1 - 256B_2D  - 2D block dimensions
+ *    2 - 4KB_2D
+ *    3 - 64KB_2D
+ *    4 - 256KB_2D
+ *    5 - 4KB_3D   - 3D block dimensions
+ *    6 - 64KB_3D
+ *    7 - 256KB_3D
+ */
+#define AMD_FMT_MOD_TILE_GFX12_256B_2D 1
+#define AMD_FMT_MOD_TILE_GFX12_4K_2D 2
+#define AMD_FMT_MOD_TILE_GFX12_64K_2D 3
+#define AMD_FMT_MOD_TILE_GFX12_256K_2D 4
+
 #define AMD_FMT_MOD_DCC_BLOCK_64B 0
 #define AMD_FMT_MOD_DCC_BLOCK_128B 1
 #define AMD_FMT_MOD_DCC_BLOCK_256B 2
-- 
2.45.2

