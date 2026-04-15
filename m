Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F729F433CE
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 22:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246C410E1FA;
	Wed, 15 Apr 2026 22:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/9OiFFE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA4D10E1FA
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 22:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776290860; x=1807826860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NBiTxs8XIoAxO4jPXuAwfBidqfM1Arw2jzG2yBN8Uhk=;
 b=S/9OiFFEHLMayyCwrsOi7an25f6pb8L6itZd8yZstUNLC0BswyKoIVbe
 fcI1kD18g0/V2C0HIWR1ipJb4yYYZfaAb4rnaOlmh+8dH++oJ8rrOOM7t
 mZ9JH26Fn6O8a53uqZ0iPueU5oJYDnueqDVtoW17ZyR6JvHre/FbGqxll
 Ak2sLB6ecRW3eJhMG3LoLVqokbwKvlBLowmfcWkNFfkmdKb0O5y0fqciW
 0U9fQZhT4rzxyIM0pb//tRRnV9Jbf/c7wY1J3X/lrpwVI5dALmiBgyvc6
 mA11TDc+Se/Tbc/58wGzy+GUT6KtzkrX9yKguUV4GEjupjGSyDZXPnmNO g==;
X-CSE-ConnectionGUID: S6kioRAJTfylgBOYlwPPkw==
X-CSE-MsgGUID: EumtTzyaQf2rzIS/8xHdGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77397189"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77397189"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 15:07:40 -0700
X-CSE-ConnectionGUID: 64sYtyxbSdCKVJZlZZQwCw==
X-CSE-MsgGUID: /7SjlqxET5apblIOw0WyHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="234926128"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 15:07:39 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 06/10] lib/rendercopy: Convert surface state and sampler setup
 to genxml
Date: Thu, 16 Apr 2026 00:07:16 +0200
Message-Id: <20260415220720.1594414-7-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415220720.1594414-1-jan.maslak@intel.com>
References: <20260415220720.1594414-1-jan.maslak@intel.com>
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

Replace intel_bb_out() calls in gen9_bind_buf(), gen8_bind_surfaces(),
and gen8_create_sampler() with igt_genxml_pack_state macros backed by
the genxml pack headers.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/rendercopy_gen9.c | 284 +++++++++++++++++++++++-------------------
 1 file changed, 158 insertions(+), 126 deletions(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index d44988010..9c5833a74 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -21,11 +21,17 @@
 #include "intel_io.h"
 #include "intel_mocs.h"
 #include "rendercopy.h"
-#include "gen9_render.h"
+#include "surfaceformat.h"
 #include "xe2_render.h"
 #include "intel_reg.h"
 #include "igt_aux.h"
 #include "intel_chipset.h"
+#include "intel/genxml/igt_genxml.h"
+#include "gen90_pack.h"
+#include "gen110_pack.h"
+#include "gen120_pack.h"
+#include "gen125_pack.h"
+#include "xe2_pack.h"
 
 #define VERTEX_SIZE (3*4)
 
@@ -187,13 +193,60 @@ static uint32_t dg2_compression_format(const struct intel_buf *buf)
 	}
 }
 
-/* Mostly copy+paste from gen6, except height, width, pitch moved */
+/*
+ * IGT_RSS_COMMON - set RENDER_SURFACE_STATE fields shared across all gens.
+ * Works via C preprocessor structural typing: all gen-specific structs
+ * have identical field names for these members.
+ */
+#define IGT_RSS_COMMON(ss, buf, mocs_val, rd, wd)                          \
+	do {                                                               \
+		ss.SurfaceType = GFX9_SURFTYPE_2D;                        \
+		ss.SurfaceFormat = gen4_surface_format((buf)->bpp,         \
+					       (buf)->depth);      \
+		ss.SurfaceVerticalAlignment = GFX9_VALIGN_4;              \
+		ss.MOCS = (mocs_val);                                      \
+		ss.Width = intel_buf_width(buf) - 1;                       \
+		ss.Height = intel_buf_height(buf) - 1;                     \
+		ss.SurfacePitch = (buf)->surface[0].stride - 1;            \
+		ss.ShaderChannelSelectRed = (int)GFX9_SCS_RED;                 \
+		ss.ShaderChannelSelectGreen = (int)GFX9_SCS_GREEN;             \
+		ss.ShaderChannelSelectBlue = (int)GFX9_SCS_BLUE;               \
+		ss.ShaderChannelSelectAlpha = (int)GFX9_SCS_ALPHA;             \
+		ss.SurfaceBaseAddress =                                    \
+			igt_address_of((buf), (buf)->surface[0].offset,    \
+				       (rd), (wd));                        \
+	} while (0)
+
+/*
+ * IGT_RSS_TILING - set TileMode from buf->tiling.  The numeric encoding is
+ * identical across gen9/gen12/gen12.5/xe2, but the enum names differ per gen.
+ * We use xe2 (GFX20) names as they best reflect the modern tile semantics;
+ * (int) casts suppress -Wenum-conversion when used with older-gen structs.
+ */
+#define IGT_RSS_TILING(ss, buf)                                            \
+	do {                                                               \
+		switch ((buf)->tiling) {                                    \
+		case I915_TILING_NONE:                                     \
+			ss.TileMode = (int)GFX20_LINEAR;                  \
+			break;                                             \
+		case I915_TILING_X:                                        \
+			ss.TileMode = (int)GFX20_XMAJOR;                  \
+			break;                                             \
+		case I915_TILING_64:                                       \
+			ss.TileMode = (int)GFX20_TILE64;                  \
+			ss.MipTailStartLOD = 0xf;                          \
+			break;                                             \
+		default:                                                   \
+			ss.TileMode = (int)GFX20_TILE4;                   \
+		}                                                          \
+	} while (0)
+
 static uint32_t
-gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
-	      bool fast_clear) {
-	struct gen9_surface_state *ss;
+gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst) {
 	uint32_t write_domain, read_domain;
-	uint64_t address;
+	unsigned int gen = intel_gen(ibb->devid);
+	uint32_t mocs;
+	void *ss_ptr;
 
 	igt_assert_lte(buf->surface[0].stride, 256*1024);
 	igt_assert_lte(intel_buf_width(buf), 16384);
@@ -206,120 +259,103 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 		read_domain = I915_GEM_DOMAIN_SAMPLER;
 	}
 
-	ss = intel_bb_ptr_align(ibb, 64);
-
-	ss->ss0.surface_type = SURFACE_2D;
-	ss->ss0.surface_format = gen4_surface_format(buf->bpp, buf->depth);
-	ss->ss0.vertical_alignment = 1; /* align 4 */
-	ss->ss0.horizontal_alignment = 1; /* align 4 or HALIGN_32 on display ver >= 13*/
+	mocs = intel_buf_mocs(buf);
 
-	ss->ss1.mocs_index = buf->mocs_index;
-
-	if (HAS_4TILE(ibb->devid)) {
-		ss->ss5.mip_tail_start_lod = 0;
-	} else {
-		ss->ss0.render_cache_read_write = 1;
-		ss->ss5.mip_tail_start_lod = 1; /* needed with trmode */
-	}
+	ss_ptr = intel_bb_ptr_align(ibb, 64);
 
-	switch (buf->tiling) {
-	case I915_TILING_NONE:
-		ss->ss0.tiled_mode = 0;
-		break;
-	case I915_TILING_X:
-		ss->ss0.tiled_mode = 2;
-		break;
-	case I915_TILING_64:
-		ss->ss0.tiled_mode = 1;
-		ss->ss5.mip_tail_start_lod = 0xf;
-		break;
-	default:
-		ss->ss0.tiled_mode = 3;
-		if (buf->tiling == I915_TILING_Yf)
-			ss->ss5.trmode = 1;
-		else if (buf->tiling == I915_TILING_Ys)
-			ss->ss5.trmode = 2;
-		break;
-	}
+	if (gen >= 20) {
+		/* -- Xe2 (LNL+) -- */
+		igt_genxml_pack_state(ibb, GFX20_RENDER_SURFACE_STATE, ss_ptr, ss) {
+			IGT_RSS_COMMON(ss, buf, mocs, read_domain, write_domain);
+			IGT_RSS_TILING(ss, buf);
+			ss.SurfaceHorizontalAlignment = GFX20_HALIGN_32;
 
-	if (intel_buf_pxp(buf))
-		ss->ss1.pxp = 1;
-
-	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
-						   read_domain, write_domain,
-						   buf->surface[0].offset,
-						   intel_bb_offset(ibb) + 4 * 8,
-						   buf->addr.offset);
-	ss->ss8.base_addr = (address + buf->surface[0].offset);
-	ss->ss9.base_addr_hi = (address + buf->surface[0].offset) >> 32;
-
-	ss->ss2.height = intel_buf_height(buf) - 1;
-	ss->ss2.width  = intel_buf_width(buf) - 1;
-	ss->ss3.pitch  = buf->surface[0].stride - 1;
-
-	ss->ss7.skl.shader_chanel_select_r = 4;
-	ss->ss7.skl.shader_chanel_select_g = 5;
-	ss->ss7.skl.shader_chanel_select_b = 6;
-	ss->ss7.skl.shader_chanel_select_a = 7;
-
-	if (buf->compression == I915_COMPRESSION_MEDIA)
-		ss->ss7.tgl.media_compression = 1;
-	else if (buf->compression == I915_COMPRESSION_RENDER) {
-		if (intel_gen(ibb->devid) >= 20)
-			ss->ss6.aux_mode = 0x0; /* AUX_NONE, unified compression */
-		else
-			ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
-
-		if (intel_gen(ibb->devid) < 12 && buf->ccs[0].stride) {
-			ss->ss6.aux_pitch = (buf->ccs[0].stride / 128) - 1;
-
-			address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
-								   read_domain, write_domain,
-								   (buf->cc.offset ? (1 << 10) : 0)
-								   | buf->ccs[0].offset,
-								   intel_bb_offset(ibb) + 4 * 10,
-								   buf->addr.offset);
-			ss->ss10.aux_base_addr = (address + buf->ccs[0].offset) >> 12;
-			ss->ss11.aux_base_addr_hi = (address + buf->ccs[0].offset) >> 32;
+			if (buf->compression == I915_COMPRESSION_RENDER) {
+				ss.AuxiliarySurfaceMode = GFX20_AUX_NONE;
+				ss.CompressionFormat = lnl_compression_format(buf);
+			}
 		}
 
-		if (buf->cc.offset) {
-			igt_assert(buf->compression == I915_COMPRESSION_RENDER);
-
-			ss->ss10.clearvalue_addr_enable = 1;
-
-			address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
-								   read_domain, write_domain,
-								   buf->cc.offset,
-								   intel_bb_offset(ibb) + 4 * 12,
-								   buf->addr.offset);
-
-			/*
-			 * If this assert doesn't hold below clear address will be
-			 * written wrong.
-			 */
-
-			igt_assert(__builtin_ctzl(address + buf->cc.offset) >= 6 &&
-				   (__builtin_clzl(address + buf->cc.offset) >= 16));
-
-			ss->ss12.dg2.clear_address = (address + buf->cc.offset) >> 6;
-			ss->ss13.clear_address_hi = (address + buf->cc.offset) >> 32;
+	} else if (HAS_4TILE(ibb->devid)) {
+		/* -- Gen12.5 / DG2 -- */
+		igt_genxml_pack_state(ibb, GFX125_RENDER_SURFACE_STATE, ss_ptr, ss) {
+			IGT_RSS_COMMON(ss, buf, mocs, read_domain, write_domain);
+			IGT_RSS_TILING(ss, buf);
+			ss.SurfaceHorizontalAlignment = GFX125_HALIGN_32;
+
+			if (buf->compression == I915_COMPRESSION_MEDIA) {
+				ss.MemoryCompressionEnable = true;
+				ss.MemoryCompressionMode = GFX125_MEDIACOMPRESSION;
+			} else if (buf->compression == I915_COMPRESSION_RENDER) {
+				ss.AuxiliarySurfaceMode = GFX125_AUX_CCS_E;
+				ss.CompressionFormat = dg2_compression_format(buf);
+
+				if (buf->cc.offset) {
+					ss.ClearValueAddressEnable = true;
+					ss.ClearValueAddress =
+						igt_address_of(buf, buf->cc.offset,
+							       read_domain, write_domain);
+				}
+			}
 		}
 
-		if (HAS_4TILE(ibb->devid)) {
-			ss->ss7.dg2.memory_compression_type = 0;
-			ss->ss7.dg2.memory_compression_enable = 0;
-			ss->ss7.dg2.disable_support_for_multi_gpu_partial_writes = 1;
-			ss->ss7.dg2.disable_support_for_multi_gpu_atomics = 1;
+	} else if (gen >= 12) {
+		/* -- Gen12 / TGL -- */
+		igt_genxml_pack_state(ibb, GFX12_RENDER_SURFACE_STATE, ss_ptr, ss) {
+			IGT_RSS_COMMON(ss, buf, mocs, read_domain, write_domain);
+			IGT_RSS_TILING(ss, buf);
+			ss.SurfaceHorizontalAlignment = GFX12_HALIGN_4;
+			ss.RenderCacheReadWriteMode = GFX12_READWRITECACHE;
+			ss.MipTailStartLOD = 1;
+
+			if (buf->compression == I915_COMPRESSION_MEDIA) {
+				ss.MemoryCompressionEnable = true;
+				ss.MemoryCompressionMode = GFX12_HORIZONTAL;
+			} else if (buf->compression == I915_COMPRESSION_RENDER) {
+				ss.AuxiliarySurfaceMode = GFX12_AUX_CCS_E;
+
+				if (buf->cc.offset) {
+					ss.ClearValueAddressEnable = true;
+					ss.ClearValueAddress =
+						igt_address_of(buf, buf->cc.offset,
+							       read_domain, write_domain);
+				}
+			}
+		}
 
-			if (intel_gen(ibb->devid) >= 20)
-				ss->ss12.lnl.compression_format = lnl_compression_format(buf);
-			else
-				ss->ss12.dg2.compression_format = dg2_compression_format(buf);
+	} else {
+		/* -- Gen9 / Gen11 -- */
+		igt_genxml_pack_state(ibb, GFX9_RENDER_SURFACE_STATE, ss_ptr, ss) {
+			IGT_RSS_COMMON(ss, buf, mocs, read_domain, write_domain);
+			IGT_RSS_TILING(ss, buf);
+			ss.SurfaceHorizontalAlignment = GFX9_HALIGN_4;
+			ss.RenderCacheReadWriteMode = GFX9_READWRITECACHE;
+			ss.MipTailStartLOD = 1;
+
+			if (buf->tiling == I915_TILING_Yf)
+				ss.TiledResourceMode = GFX9_TILEYF;
+			else if (buf->tiling == I915_TILING_Ys)
+				ss.TiledResourceMode = GFX9_TILEYS;
+
+			if (buf->compression == I915_COMPRESSION_MEDIA) {
+				ss.MemoryCompressionEnable = true;
+				ss.MemoryCompressionMode = GFX9_HORIZONTAL;
+			} else if (buf->compression == I915_COMPRESSION_RENDER) {
+				ss.AuxiliarySurfaceMode = GFX9_AUX_CCS_E;
+
+				if (buf->ccs[0].stride) {
+					ss.AuxiliarySurfacePitch =
+						(buf->ccs[0].stride / 128) - 1;
+					ss.AuxiliarySurfaceBaseAddress =
+						igt_address_of(buf, buf->ccs[0].offset,
+							       read_domain, write_domain);
+				}
+			}
 		}
 	}
 
-	return intel_bb_ptr_add_return_prev_offset(ibb, sizeof(*ss));
+	return intel_bb_ptr_add_return_prev_offset(ibb,
+		GFX9_RENDER_SURFACE_STATE_length * 4);
 }
 
 static uint32_t
@@ -328,15 +364,14 @@ gen8_bind_surfaces(struct intel_bb *ibb,
 		   const struct intel_buf *dst)
 {
 	uint32_t *binding_table, binding_table_offset;
-	bool fast_clear = !src;
 
 	binding_table = intel_bb_ptr_align(ibb, 32);
 	binding_table_offset = intel_bb_ptr_add_return_prev_offset(ibb, 32);
 
-	binding_table[0] = gen9_bind_buf(ibb, dst, 1, fast_clear);
+	binding_table[0] = gen9_bind_buf(ibb, dst, 1);
 
 	if (src != NULL)
-		binding_table[1] = gen9_bind_buf(ibb, src, 0, false);
+		binding_table[1] = gen9_bind_buf(ibb, src, 0);
 
 	return binding_table_offset;
 }
@@ -344,21 +379,18 @@ gen8_bind_surfaces(struct intel_bb *ibb,
 /* Mostly copy+paste from gen6, except wrap modes moved */
 static uint32_t
 gen8_create_sampler(struct intel_bb *ibb) {
-	struct gen8_sampler_state *ss;
-
-	ss = intel_bb_ptr_align(ibb, 64);
-
-	ss->ss0.min_filter = GEN4_MAPFILTER_NEAREST;
-	ss->ss0.mag_filter = GEN4_MAPFILTER_NEAREST;
-	ss->ss3.r_wrap_mode = GEN4_TEXCOORDMODE_CLAMP;
-	ss->ss3.s_wrap_mode = GEN4_TEXCOORDMODE_CLAMP;
-	ss->ss3.t_wrap_mode = GEN4_TEXCOORDMODE_CLAMP;
-
-	/* I've experimented with non-normalized coordinates and using the LD
-	 * sampler fetch, but couldn't make it work. */
-	ss->ss3.non_normalized_coord = 0;
+	void *ptr = intel_bb_ptr_align(ibb, 64);
+
+	igt_genxml_pack_state(ibb, GFX9_SAMPLER_STATE, ptr, ss) {
+		ss.MinModeFilter = GFX9_MAPFILTER_NEAREST;
+		ss.MagModeFilter = GFX9_MAPFILTER_NEAREST;
+		ss.TCZAddressControlMode = GFX9_TCM_CLAMP;
+		ss.TCYAddressControlMode = GFX9_TCM_CLAMP;
+		ss.TCXAddressControlMode = GFX9_TCM_CLAMP;
+	}
 
-	return intel_bb_ptr_add_return_prev_offset(ibb, sizeof(*ss));
+	return intel_bb_ptr_add_return_prev_offset(ibb,
+						   GFX9_SAMPLER_STATE_length * 4);
 }
 
 static uint32_t
-- 
2.34.1

