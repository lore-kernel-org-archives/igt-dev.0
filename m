Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750041.outbound.protection.outlook.com [40.107.75.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893BF6EBD0
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Feb 2021 20:56:35 +0000 (UTC)
From: Sung Joon Kim <sungkim@amd.com>
Date: Wed,  3 Feb 2021 15:56:02 -0500
Message-Id: <20210203205604.24494-1-sungkim@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v3 1/3] drm-uapi: Add AMD DRM Modifier update to
 IGT
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

Aligns IGT drm_fourcc.h to the AMD's latest commit to this file in drm-next:
8ba16d5993749c3f31fd2b49e16f0dc1e1770b9c: drm/fourcc: Add AMD DRM modifiers.

Signed-off-by: Sung Joon Kim <sungkim@amd.com>
---
 include/drm-uapi/drm_fourcc.h | 135 ++++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
index 82f32780..a7bc058c 100644
--- a/include/drm-uapi/drm_fourcc.h
+++ b/include/drm-uapi/drm_fourcc.h
@@ -1056,8 +1056,143 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
  */
 #define AMLOGIC_FBC_OPTION_MEM_SAVING		(1ULL << 0)
 
+/*
+ * AMD modifiers
+ *
+ * Memory layout:
+ *
+ * without DCC:
+ *   - main surface
+ *
+ * with DCC & without DCC_RETILE:
+ *   - main surface in plane 0
+ *   - DCC surface in plane 1 (RB-aligned, pipe-aligned if DCC_PIPE_ALIGN is set)
+ *
+ * with DCC & DCC_RETILE:
+ *   - main surface in plane 0
+ *   - displayable DCC surface in plane 1 (not RB-aligned & not pipe-aligned)
+ *   - pipe-aligned DCC surface in plane 2 (RB-aligned & pipe-aligned)
+ *
+ * For multi-plane formats the above surfaces get merged into one plane for
+ * each format plane, based on the required alignment only.
+ *
+ * Bits  Parameter                Notes
+ * ----- ------------------------ ---------------------------------------------
+ *
+ *   7:0 TILE_VERSION             Values are AMD_FMT_MOD_TILE_VER_*
+ *  12:8 TILE                     Values are AMD_FMT_MOD_TILE_<version>_*
+ *    13 DCC
+ *    14 DCC_RETILE
+ *    15 DCC_PIPE_ALIGN
+ *    16 DCC_INDEPENDENT_64B
+ *    17 DCC_INDEPENDENT_128B
+ * 19:18 DCC_MAX_COMPRESSED_BLOCK Values are AMD_FMT_MOD_DCC_BLOCK_*
+ *    20 DCC_CONSTANT_ENCODE
+ * 23:21 PIPE_XOR_BITS            Only for some chips
+ * 26:24 BANK_XOR_BITS            Only for some chips
+ * 29:27 PACKERS                  Only for some chips
+ * 32:30 RB                       Only for some chips
+ * 35:33 PIPE                     Only for some chips
+ * 55:36 -                        Reserved for future use, must be zero
+ */
+#define AMD_FMT_MOD fourcc_mod_code(AMD, 0)
+
+#define IS_AMD_FMT_MOD(val) (((val) >> 56) == DRM_FORMAT_MOD_VENDOR_AMD)
+
+/* Reserve 0 for GFX8 and older */
+#define AMD_FMT_MOD_TILE_VER_GFX9 1
+#define AMD_FMT_MOD_TILE_VER_GFX10 2
+#define AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS 3
+
+/*
+ * 64K_S is the same for GFX9/GFX10/GFX10_RBPLUS and hence has GFX9 as canonical
+ * version.
+ */
+#define AMD_FMT_MOD_TILE_GFX9_64K_S 9
+
+/*
+ * 64K_D for non-32 bpp is the same for GFX9/GFX10/GFX10_RBPLUS and hence has
+ * GFX9 as canonical version.
+ */
+#define AMD_FMT_MOD_TILE_GFX9_64K_D 10
+#define AMD_FMT_MOD_TILE_GFX9_64K_S_X 25
+#define AMD_FMT_MOD_TILE_GFX9_64K_D_X 26
+#define AMD_FMT_MOD_TILE_GFX9_64K_R_X 27
+
+#define AMD_FMT_MOD_DCC_BLOCK_64B 0
+#define AMD_FMT_MOD_DCC_BLOCK_128B 1
+#define AMD_FMT_MOD_DCC_BLOCK_256B 2
+
+#define AMD_FMT_MOD_TILE_VERSION_SHIFT 0
+#define AMD_FMT_MOD_TILE_VERSION_MASK 0xFF
+#define AMD_FMT_MOD_TILE_SHIFT 8
+#define AMD_FMT_MOD_TILE_MASK 0x1F
+
+/* Whether DCC compression is enabled. */
+#define AMD_FMT_MOD_DCC_SHIFT 13
+#define AMD_FMT_MOD_DCC_MASK 0x1
+
+/*
+ * Whether to include two DCC surfaces, one which is rb & pipe aligned, and
+ * one which is not-aligned.
+ */
+#define AMD_FMT_MOD_DCC_RETILE_SHIFT 14
+#define AMD_FMT_MOD_DCC_RETILE_MASK 0x1
+
+/* Only set if DCC_RETILE = false */
+#define AMD_FMT_MOD_DCC_PIPE_ALIGN_SHIFT 15
+#define AMD_FMT_MOD_DCC_PIPE_ALIGN_MASK 0x1
+
+#define AMD_FMT_MOD_DCC_INDEPENDENT_64B_SHIFT 16
+#define AMD_FMT_MOD_DCC_INDEPENDENT_64B_MASK 0x1
+#define AMD_FMT_MOD_DCC_INDEPENDENT_128B_SHIFT 17
+#define AMD_FMT_MOD_DCC_INDEPENDENT_128B_MASK 0x1
+#define AMD_FMT_MOD_DCC_MAX_COMPRESSED_BLOCK_SHIFT 18
+#define AMD_FMT_MOD_DCC_MAX_COMPRESSED_BLOCK_MASK 0x3
+
+/*
+ * DCC supports embedding some clear colors directly in the DCC surface.
+ * However, on older GPUs the rendering HW ignores the embedded clear color
+ * and prefers the driver provided color. This necessitates doing a fastclear
+ * eliminate operation before a process transfers control.
+ *
+ * If this bit is set that means the fastclear eliminate is not needed for these
+ * embeddable colors.
+ */
+#define AMD_FMT_MOD_DCC_CONSTANT_ENCODE_SHIFT 20
+#define AMD_FMT_MOD_DCC_CONSTANT_ENCODE_MASK 0x1
+
+/*
+ * The below fields are for accounting for per GPU differences. These are only
+ * relevant for GFX9 and later and if the tile field is *_X/_T.
+ *
+ * PIPE_XOR_BITS = always needed
+ * BANK_XOR_BITS = only for TILE_VER_GFX9
+ * PACKERS = only for TILE_VER_GFX10_RBPLUS
+ * RB = only for TILE_VER_GFX9 & DCC
+ * PIPE = only for TILE_VER_GFX9 & DCC & (DCC_RETILE | DCC_PIPE_ALIGN)
+ */
+#define AMD_FMT_MOD_PIPE_XOR_BITS_SHIFT 21
+#define AMD_FMT_MOD_PIPE_XOR_BITS_MASK 0x7
+#define AMD_FMT_MOD_BANK_XOR_BITS_SHIFT 24
+#define AMD_FMT_MOD_BANK_XOR_BITS_MASK 0x7
+#define AMD_FMT_MOD_PACKERS_SHIFT 27
+#define AMD_FMT_MOD_PACKERS_MASK 0x7
+#define AMD_FMT_MOD_RB_SHIFT 30
+#define AMD_FMT_MOD_RB_MASK 0x7
+#define AMD_FMT_MOD_PIPE_SHIFT 33
+#define AMD_FMT_MOD_PIPE_MASK 0x7
+
+#define AMD_FMT_MOD_SET(field, value) \
+	((uint64_t)(value) << AMD_FMT_MOD_##field##_SHIFT)
+#define AMD_FMT_MOD_GET(field, value) \
+	(((value) >> AMD_FMT_MOD_##field##_SHIFT) & AMD_FMT_MOD_##field##_MASK)
+#define AMD_FMT_MOD_CLEAR(field) \
+	(~((uint64_t)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
+
 #if defined(__cplusplus)
 }
 #endif
 
 #endif /* DRM_FOURCC_H */
+
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
