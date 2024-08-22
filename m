Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0032CC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 11:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BF010E866;
	Thu, 22 Aug 2024 11:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yd5bGwdb";
	dkim-atps=neutral
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6594B10E858
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 11:19:15 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2d3dc25b1b5so461471a91.2
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 04:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724325555; x=1724930355; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G92Ok8Y/gpczqkuj+WZdYXz9nev1rvzvafPpnTRwEt8=;
 b=Yd5bGwdb3TV7QEGAUFWY7ss5ayHHZaZXjtcQsz5hCX4e6d6TWGR8yZKADK567u2K2f
 MbEZNvFuiKQpTqWdab7ljVUsv42xqygg8EMjshN+aMgICpJ5AYRS9R1N9mAN2RK1dNUq
 iD+9FXjhwjEwmfmz3b/IeqSfFuoTzxqcr/6j2gKAkgJBibxvlNxwMU6R1M0t20YnaI3E
 i1aNExdeXE++ihDtA6sF10sbyVs9jRfS2jt/fn+dmsjyQrapnmtooH5jk2HTDeS4AfWM
 QmY9uD6aO2u5dx6a1fwDKLB208xg02fkSYp6gMeqOwZQVBm9+HUT0beYOOUVbiZ/uLIJ
 A5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724325555; x=1724930355;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G92Ok8Y/gpczqkuj+WZdYXz9nev1rvzvafPpnTRwEt8=;
 b=wapohnEiayXUlrGumzRKaKtmzGYBLB8PCuairO0hjCl369ojcF7nz5lwCWXeOtgLIg
 5o4BxCVIstHjRSwT3OpzHnzLyBuB+9dqplXT7xs+gknMk6t9vgwHOgCzLFUUicNUAmvL
 iLR/LoOqrZ/lkG2vNmfKLPFqn4E783LZ1z5fNaik5gW4hrcNNSaAPYH6pF8C41vxlXa6
 uhL/jMDZDIrw+JMel+K71wYHkQzLMObgRYzN+96Kegi5FQpQ5XZQiQ/q27rIF4aOl93q
 qMUDstYvMeEoIj4HOytI9t8kPGu1nsVb/A0UAq6FRpUQjkfIGQYXT0GjZTCKTo/992GU
 SIaA==
X-Gm-Message-State: AOJu0Yz3FW4hmTw5iL1ltCYHTyq/oxWCjmyscPR6qErue/GmMAfxiVMY
 SCu7mj5Qq5//N4OjjsDLwOPL5GS3NGpRcJjm2okCrQr3M6mKPudl7E+ErW0QIlA=
X-Google-Smtp-Source: AGHT+IEt5h90dly5JeyZ9dVPbF+fgXGztiQxYELUomCP5Qygpy/OPVtY2tmkpra5/yQq+PPk7awHWQ==
X-Received: by 2002:a17:90b:4c43:b0:2c9:61ad:dcd9 with SMTP id
 98e67ed59e1d1-2d617073aafmr1736522a91.27.1724325554479; 
 Thu, 22 Aug 2024 04:19:14 -0700 (PDT)
Received: from localhost ([134.134.139.73]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d5eba239f9sm3799491a91.28.2024.08.22.04.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 04:19:14 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/3] drm/fourcc: Import drm_fourcc header from commit
 5151fa3 ("drm/fourcc: define Intel Xe2 related tile4 ccs modifiers")
Date: Thu, 22 Aug 2024 14:22:50 +0300
Message-ID: <20240822112252.4148114-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822112252.4148114-1-juhapekka.heikkila@gmail.com>
References: <20240822112252.4148114-1-juhapekka.heikkila@gmail.com>
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

commit 5151fa35ae5979821d091b80096b4c790b187bac
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Fri Aug 16 14:52:28 2024 +0300

    drm/fourcc: define Intel Xe2 related tile4 ccs modifiers

    Add Tile4 type ccs modifiers to indicate presence of compression on Xe2.
    Here is defined I915_FORMAT_MOD_4_TILED_LNL_CCS which is meant for
    integrated graphics with igpu related limitations
    Here is also defined I915_FORMAT_MOD_4_TILED_BMG_CCS which is meant
    for discrete graphics with dgpu related limitations

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 include/drm-uapi/drm_fourcc.h | 57 +++++++++++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 6 deletions(-)

diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
index 6b6235f7a..78abd819f 100644
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
+ * Intel Color Control Surfaces (CCS) for graphics ver. 20 unified compression
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
+ * Intel Color Control Surfaces (CCS) for graphics ver. 20 unified compression
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

