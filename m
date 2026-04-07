Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93ABFEEF41
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 13:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8620D10E42C;
	Tue,  7 Apr 2026 13:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifQuvdHL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710AC10E417
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 13:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775568395; x=1807104395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fs/yYVwoj5ahZNQ+SSMCMJcEJqDtNZrLP6YiTq5p1Ew=;
 b=ifQuvdHLid4BY4O85Ty+5xnPnFoQl9Q/DW7jbTojIJljJf7Y7Rntagx4
 9eJmF88Ou8jB3V0sF2Ex5ucX27nHLKV3yQuCB6wq7LOy5PTK2MnoU1W/e
 nG7vp2UcrRxXphMk+CH4I+8f5W44WLpylKoyg1cRHDBebaN7qktGEdmOV
 xDy057UuR99uSavRj5SgcHO7mG1YPL1nHI/9XWxuJgVPkxmFbq5S3leYj
 h1kItiZnSE9lWc2+sKIlJKk+aEYmt3jT3SUZgQbP5k23JSoViJOJhHZgM
 Fb8ZwE8pyM3cqKPzSCEEByqL8F4jJR3zdDCj26k4BqyPldFL7ldAdfiob A==;
X-CSE-ConnectionGUID: g49ZpCSHR/izz8oi9b5Y5A==
X-CSE-MsgGUID: 6MQBHyKDRC60BhSyD/6Tyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76425609"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76425609"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 06:26:35 -0700
X-CSE-ConnectionGUID: 5jagbR66Qw6tVjcbfR/jBQ==
X-CSE-MsgGUID: AWxSknfdQAKzjMb3Qk970A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="224983935"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 06:26:34 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 2/3] lib/rendercopy: Convert rendercopy_gen9 to use genxml
 pack headers
Date: Tue,  7 Apr 2026 15:26:19 +0200
Message-Id: <20260407132620.1397340-3-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260407132620.1397340-1-jan.maslak@intel.com>
References: <20260407132620.1397340-1-jan.maslak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Replace hand-written struct assignments and intel_bb_out() calls in
rendercopy_gen9.c with igt_genxml_emit and igt_genxml_pack_state calls
backed by the genxml pack headers.  Command emission is now driven directly
from the hardware XML definitions rather than manually maintained structs.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/rendercopy_gen9.c | 1117 ++++++++++++++++++++---------------------
 1 file changed, 551 insertions(+), 566 deletions(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index d44988010..eecb20a32 100644
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
+#include "genxml/igt_genxml.h"
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
@@ -206,120 +259,106 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 		read_domain = I915_GEM_DOMAIN_SAMPLER;
 	}
 
-	ss = intel_bb_ptr_align(ibb, 64);
-
-	ss->ss0.surface_type = SURFACE_2D;
-	ss->ss0.surface_format = gen4_surface_format(buf->bpp, buf->depth);
-	ss->ss0.vertical_alignment = 1; /* align 4 */
-	ss->ss0.horizontal_alignment = 1; /* align 4 or HALIGN_32 on display ver >= 13*/
+	/* MOCS encoding: genxml has a single 7-bit MOCS field (bits 30:24).
+	 * The old struct had mocs_index:6 at bits 30:25 and pxp:1 at bit 24.
+	 * Reproduce the same bit layout. */
+	mocs = (buf->mocs_index << 1) | (intel_buf_pxp(buf) ? 1 : 0);
 
-	ss->ss1.mocs_index = buf->mocs_index;
+	ss_ptr = intel_bb_ptr_align(ibb, 64);
 
-	if (HAS_4TILE(ibb->devid)) {
-		ss->ss5.mip_tail_start_lod = 0;
-	} else {
-		ss->ss0.render_cache_read_write = 1;
-		ss->ss5.mip_tail_start_lod = 1; /* needed with trmode */
-	}
-
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
+		/* ── Xe2 (LNL+) ── */
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
+		/* ── Gen12.5 / DG2 ── */
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
+		/* ── Gen12 / TGL ── */
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
+		/* ── Gen9 / Gen11 ── */
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
@@ -328,15 +367,14 @@ gen8_bind_surfaces(struct intel_bb *ibb,
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
@@ -344,21 +382,18 @@ gen8_bind_surfaces(struct intel_bb *ibb,
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
@@ -531,50 +566,62 @@ gen7_fill_vertex_buffer_data(struct intel_bb *ibb,
  */
 static void
 gen6_emit_vertex_elements(struct intel_bb *ibb) {
+	void *ve_ptr;
+
 	/*
 	 * The VUE layout
 	 *    dword 0-3: pad (0, 0, 0. 0)
 	 *    dword 4-7: position (x, y, 0, 1.0),
 	 *    dword 8-11: texture coordinate 0 (u0, v0, 0, 1.0)
 	 */
-	intel_bb_out(ibb, GEN4_3DSTATE_VERTEX_ELEMENTS | (3 * 2 + 1 - 2));
+	{
+		struct GFX9_3DSTATE_VERTEX_ELEMENTS ves = { GFX9_3DSTATE_VERTEX_ELEMENTS_header };
+		ves.DWordLength = 3 * GFX9_VERTEX_ELEMENT_STATE_length - 1;
+		GFX9_3DSTATE_VERTEX_ELEMENTS_pack(ibb, intel_bb_ptr(ibb), &ves);
+		intel_bb_ptr_add(ibb, 4);
+	}
 
-	/* Element state 0. These are 4 dwords of 0 required for the VUE format.
-	 * We don't really know or care what they do.
-	 */
-	intel_bb_out(ibb, 0 << GEN6_VE0_VERTEX_BUFFER_INDEX_SHIFT | GEN6_VE0_VALID |
-		     SURFACEFORMAT_R32G32B32A32_FLOAT << VE0_FORMAT_SHIFT |
-		     0 << VE0_OFFSET_SHIFT); /* we specify 0, but it's really does not exist */
-	intel_bb_out(ibb, GEN4_VFCOMPONENT_STORE_0 << VE1_VFCOMPONENT_0_SHIFT |
-		     GEN4_VFCOMPONENT_STORE_0 << VE1_VFCOMPONENT_1_SHIFT |
-		     GEN4_VFCOMPONENT_STORE_0 << VE1_VFCOMPONENT_2_SHIFT |
-		     GEN4_VFCOMPONENT_STORE_0 << VE1_VFCOMPONENT_3_SHIFT);
-
-	/* Element state 1 - Our "destination" vertices. These are passed down
-	 * through the pipeline, and eventually make it to the pixel shader as
-	 * the offsets in the destination surface. It's packed as the 16
-	 * signed/scaled because of gen6 rendercopy. I see no particular reason
-	 * for doing this though.
-	 */
-	intel_bb_out(ibb, 0 << GEN6_VE0_VERTEX_BUFFER_INDEX_SHIFT | GEN6_VE0_VALID |
-		     SURFACEFORMAT_R16G16_SSCALED << VE0_FORMAT_SHIFT |
-		     0 << VE0_OFFSET_SHIFT); /* offsets vb in bytes */
-	intel_bb_out(ibb, GEN4_VFCOMPONENT_STORE_SRC << VE1_VFCOMPONENT_0_SHIFT |
-		     GEN4_VFCOMPONENT_STORE_SRC << VE1_VFCOMPONENT_1_SHIFT |
-		     GEN4_VFCOMPONENT_STORE_0 << VE1_VFCOMPONENT_2_SHIFT |
-		     GEN4_VFCOMPONENT_STORE_1_FLT << VE1_VFCOMPONENT_3_SHIFT);
-
-	/* Element state 2. Last but not least we store the U,V components as
-	 * normalized floats. These will be used in the pixel shader to sample
-	 * from the source buffer.
-	 */
-	intel_bb_out(ibb, 0 << GEN6_VE0_VERTEX_BUFFER_INDEX_SHIFT | GEN6_VE0_VALID |
-		     SURFACEFORMAT_R32G32_FLOAT << VE0_FORMAT_SHIFT |
-		     4 << VE0_OFFSET_SHIFT);	/* offset vb in bytes */
-	intel_bb_out(ibb, GEN4_VFCOMPONENT_STORE_SRC << VE1_VFCOMPONENT_0_SHIFT |
-		     GEN4_VFCOMPONENT_STORE_SRC << VE1_VFCOMPONENT_1_SHIFT |
-		     GEN4_VFCOMPONENT_STORE_0 << VE1_VFCOMPONENT_2_SHIFT |
-		     GEN4_VFCOMPONENT_STORE_1_FLT << VE1_VFCOMPONENT_3_SHIFT);
+	/* Element state 0. These are 4 dwords of 0 required for the VUE format. */
+	ve_ptr = intel_bb_ptr(ibb);
+	igt_genxml_pack_state(ibb, GFX9_VERTEX_ELEMENT_STATE, ve_ptr, ve0) {
+		ve0.VertexBufferIndex = 0;
+		ve0.Valid = true;
+		ve0.SourceElementFormat = SURFACEFORMAT_R32G32B32A32_FLOAT;
+		ve0.SourceElementOffset = 0;
+		ve0.Component0Control = GFX9_VFCOMP_STORE_0;
+		ve0.Component1Control = GFX9_VFCOMP_STORE_0;
+		ve0.Component2Control = GFX9_VFCOMP_STORE_0;
+		ve0.Component3Control = GFX9_VFCOMP_STORE_0;
+	}
+	intel_bb_ptr_add(ibb, GFX9_VERTEX_ELEMENT_STATE_length * 4);
+
+	/* Element state 1 - destination vertices (16-bit signed/scaled). */
+	ve_ptr = intel_bb_ptr(ibb);
+	igt_genxml_pack_state(ibb, GFX9_VERTEX_ELEMENT_STATE, ve_ptr, ve1) {
+		ve1.VertexBufferIndex = 0;
+		ve1.Valid = true;
+		ve1.SourceElementFormat = SURFACEFORMAT_R16G16_SSCALED;
+		ve1.SourceElementOffset = 0;
+		ve1.Component0Control = GFX9_VFCOMP_STORE_SRC;
+		ve1.Component1Control = GFX9_VFCOMP_STORE_SRC;
+		ve1.Component2Control = GFX9_VFCOMP_STORE_0;
+		ve1.Component3Control = GFX9_VFCOMP_STORE_1_FP;
+	}
+	intel_bb_ptr_add(ibb, GFX9_VERTEX_ELEMENT_STATE_length * 4);
+
+	/* Element state 2 - texture coordinates (normalized floats). */
+	ve_ptr = intel_bb_ptr(ibb);
+	igt_genxml_pack_state(ibb, GFX9_VERTEX_ELEMENT_STATE, ve_ptr, ve2) {
+		ve2.VertexBufferIndex = 0;
+		ve2.Valid = true;
+		ve2.SourceElementFormat = SURFACEFORMAT_R32G32_FLOAT;
+		ve2.SourceElementOffset = 4;
+		ve2.Component0Control = GFX9_VFCOMP_STORE_SRC;
+		ve2.Component1Control = GFX9_VFCOMP_STORE_SRC;
+		ve2.Component2Control = GFX9_VFCOMP_STORE_0;
+		ve2.Component3Control = GFX9_VFCOMP_STORE_1_FP;
+	}
+	intel_bb_ptr_add(ibb, GFX9_VERTEX_ELEMENT_STATE_length * 4);
 }
 
 /*
@@ -585,161 +632,185 @@ gen6_emit_vertex_elements(struct intel_bb *ibb) {
  */
 static void gen7_emit_vertex_buffer(struct intel_bb *ibb, uint32_t offset)
 {
-	intel_bb_out(ibb, GEN4_3DSTATE_VERTEX_BUFFERS | (1 + (4 * 1) - 2));
-	intel_bb_out(ibb, 0 << GEN6_VB0_BUFFER_INDEX_SHIFT | /* VB 0th index */
-		     GEN8_VB0_BUFFER_ADDR_MOD_EN | /* Address Modify Enable */
-		     VERTEX_SIZE << VB0_BUFFER_PITCH_SHIFT);
-	intel_bb_emit_reloc(ibb, ibb->handle,
-			    I915_GEM_DOMAIN_VERTEX, 0,
-			    offset, ibb->batch_offset);
-	intel_bb_out(ibb, 3 * VERTEX_SIZE);
+	void *vb_ptr;
+
+	/* Variable-length: 1 header dword + VERTEX_BUFFER_STATE element */
+	{
+		struct GFX9_3DSTATE_VERTEX_BUFFERS vbs = { GFX9_3DSTATE_VERTEX_BUFFERS_header };
+		/* Default DWordLength=3 is correct for 1 element (1 + 4 - 2 = 3) */
+		GFX9_3DSTATE_VERTEX_BUFFERS_pack(ibb, intel_bb_ptr(ibb), &vbs);
+		intel_bb_ptr_add(ibb, 4);
+	}
+
+	vb_ptr = intel_bb_ptr(ibb);
+	igt_genxml_pack_state(ibb, GFX9_VERTEX_BUFFER_STATE, vb_ptr, vb) {
+		vb.VertexBufferIndex = 0;
+		vb.AddressModifyEnable = true;
+		vb.MOCS = intel_get_wb_mocs_index(ibb->fd);
+		vb.BufferPitch = VERTEX_SIZE;
+		vb.BufferStartingAddress = (struct igt_address){
+			.offset = ibb->batch_offset + offset,
+			.handle = ibb->handle,
+			.read_domains = I915_GEM_DOMAIN_VERTEX,
+			.write_domain = 0,
+			.presumed_offset = ibb->batch_offset,
+		};
+		vb.BufferSize = 3 * VERTEX_SIZE;
+	}
+	intel_bb_ptr_add(ibb, GFX9_VERTEX_BUFFER_STATE_length * 4);
 }
 
 static uint32_t
 gen6_create_cc_state(struct intel_bb *ibb)
 {
-	struct gen6_color_calc_state *cc_state;
+	void *ptr = intel_bb_ptr_align(ibb, 64);
 
-	cc_state = intel_bb_ptr_align(ibb, 64);
+	igt_genxml_pack_state(ibb, GFX9_COLOR_CALC_STATE, ptr, cc_state) { }
 
-	return intel_bb_ptr_add_return_prev_offset(ibb, sizeof(*cc_state));
+	return intel_bb_ptr_add_return_prev_offset(ibb,
+						   GFX9_COLOR_CALC_STATE_length * 4);
 }
 
 static uint32_t
 gen8_create_blend_state(struct intel_bb *ibb)
 {
-	struct gen8_blend_state *blend;
-	int i;
-
-	blend = intel_bb_ptr_align(ibb, 64);
-
-	for (i = 0; i < 16; i++) {
-		blend->bs[i].dest_blend_factor = GEN6_BLENDFACTOR_ZERO;
-		blend->bs[i].source_blend_factor = GEN6_BLENDFACTOR_ONE;
-		blend->bs[i].color_blend_func = GEN6_BLENDFUNCTION_ADD;
-		blend->bs[i].pre_blend_color_clamp = 1;
-		blend->bs[i].color_buffer_blend = 0;
+	void *ptr = intel_bb_ptr_align(ibb, 64);
+
+	/* Blend state header (1 dword) - all defaults (zeros) */
+	igt_genxml_pack_state(ibb, GFX9_BLEND_STATE, ptr, bs) { }
+	ptr += GFX9_BLEND_STATE_length * 4;
+
+	/* 16 per-RT blend state entries */
+	for (int i = 0; i < 16; i++) {
+		igt_genxml_pack_state(ibb, GFX9_BLEND_STATE_ENTRY, ptr, entry) {
+			entry.DestinationBlendFactor = GFX9_BLENDFACTOR_ZERO;
+			entry.SourceBlendFactor = GFX9_BLENDFACTOR_ONE;
+			entry.ColorBlendFunction = GFX9_BLENDFUNCTION_ADD;
+			entry.PreBlendColorClampEnable = true;
+		}
+		ptr += GFX9_BLEND_STATE_ENTRY_length * 4;
 	}
 
-	return intel_bb_ptr_add_return_prev_offset(ibb, sizeof(*blend));
+	return intel_bb_ptr_add_return_prev_offset(ibb,
+		(GFX9_BLEND_STATE_length + 16 * GFX9_BLEND_STATE_ENTRY_length) * 4);
 }
 
 static uint32_t
 gen6_create_cc_viewport(struct intel_bb *ibb)
 {
-	struct gen4_cc_viewport *vp;
-
-	vp = intel_bb_ptr_align(ibb, 32);
+	void *ptr = intel_bb_ptr_align(ibb, 32);
 
-	/* XXX I don't understand this */
-	vp->min_depth = -1.e35;
-	vp->max_depth = 1.e35;
+	igt_genxml_pack_state(ibb, GFX9_CC_VIEWPORT, ptr, vp) {
+		vp.MinimumDepth = -1.e35;
+		vp.MaximumDepth = 1.e35;
+	}
 
-	return intel_bb_ptr_add_return_prev_offset(ibb, sizeof(*vp));
+	return intel_bb_ptr_add_return_prev_offset(ibb,
+						   GFX9_CC_VIEWPORT_length * 4);
 }
 
 static uint32_t
 gen7_create_sf_clip_viewport(struct intel_bb *ibb) {
-	/* XXX these are likely not needed */
-	struct gen7_sf_clip_viewport *scv_state;
-
-	scv_state = intel_bb_ptr_align(ibb, 64);
+	void *ptr = intel_bb_ptr_align(ibb, 64);
 
-	scv_state->guardband.xmin = 0;
-	scv_state->guardband.xmax = 1.0f;
-	scv_state->guardband.ymin = 0;
-	scv_state->guardband.ymax = 1.0f;
+	igt_genxml_pack_state(ibb, GFX9_SF_CLIP_VIEWPORT, ptr, scv) {
+		scv.XMinClipGuardband = 0;
+		scv.XMaxClipGuardband = 1.0f;
+		scv.YMinClipGuardband = 0;
+		scv.YMaxClipGuardband = 1.0f;
+	}
 
-	return intel_bb_ptr_add_return_prev_offset(ibb, sizeof(*scv_state));
+	return intel_bb_ptr_add_return_prev_offset(ibb,
+						   GFX9_SF_CLIP_VIEWPORT_length * 4);
 }
 
 static uint32_t
 gen6_create_scissor_rect(struct intel_bb *ibb)
 {
-	struct gen6_scissor_rect *scissor;
+	void *ptr = intel_bb_ptr_align(ibb, 64);
 
-	scissor = intel_bb_ptr_align(ibb, 64);
+	igt_genxml_pack_state(ibb, GFX9_SCISSOR_RECT, ptr, sr) { }
 
-	return intel_bb_ptr_add_return_prev_offset(ibb, sizeof(*scissor));
+	return intel_bb_ptr_add_return_prev_offset(ibb,
+						   GFX9_SCISSOR_RECT_length * 4);
 }
 
 static void
 gen8_emit_sip(struct intel_bb *ibb) {
-	intel_bb_out(ibb, GEN4_STATE_SIP | (3 - 2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_STATE_SIP, sip) {
+		/* SystemInstructionPointer left as zero */
+	}
 }
 
 static void
 gen7_emit_push_constants(struct intel_bb *ibb) {
-	intel_bb_out(ibb, GEN7_3DSTATE_PUSH_CONSTANT_ALLOC_VS);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, GEN8_3DSTATE_PUSH_CONSTANT_ALLOC_HS);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, GEN8_3DSTATE_PUSH_CONSTANT_ALLOC_DS);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, GEN8_3DSTATE_PUSH_CONSTANT_ALLOC_GS);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, GEN7_3DSTATE_PUSH_CONSTANT_ALLOC_PS);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_PUSH_CONSTANT_ALLOC_VS, vs) { }
+	igt_genxml_emit(ibb, GFX9_3DSTATE_PUSH_CONSTANT_ALLOC_HS, hs) { }
+	igt_genxml_emit(ibb, GFX9_3DSTATE_PUSH_CONSTANT_ALLOC_DS, ds) { }
+	igt_genxml_emit(ibb, GFX9_3DSTATE_PUSH_CONSTANT_ALLOC_GS, gs) { }
+	igt_genxml_emit(ibb, GFX9_3DSTATE_PUSH_CONSTANT_ALLOC_PS, ps) { }
 }
 
+/*
+ * IGT_SBA_COMMON - shared STATE_BASE_ADDRESS fields across gen9/gen11/gen125.
+ * All three variants have identical field names for the fields we set.
+ */
+#define IGT_SBA_COMMON(sba, mocs_val, surf, dyn, inst)                     \
+	do {                                                               \
+		sba.GeneralStateBaseAddressModifyEnable = true;            \
+		sba.GeneralStateMOCS = (mocs_val);                         \
+		sba.StatelessDataPortAccessMOCS = (mocs_val);              \
+		sba.SurfaceStateBaseAddressModifyEnable = true;            \
+		sba.SurfaceStateMOCS = (mocs_val);                         \
+		sba.SurfaceStateBaseAddress = (surf);                      \
+		sba.DynamicStateBaseAddressModifyEnable = true;            \
+		sba.DynamicStateMOCS = (mocs_val);                         \
+		sba.DynamicStateBaseAddress = (dyn);                       \
+		sba.IndirectObjectMOCS = (mocs_val);                       \
+		sba.InstructionBaseAddressModifyEnable = true;             \
+		sba.InstructionMOCS = (mocs_val);                          \
+		sba.InstructionBaseAddress = (inst);                       \
+		sba.GeneralStateBufferSizeModifyEnable = true;             \
+		sba.GeneralStateBufferSize = 0xfffff;                      \
+		sba.DynamicStateBufferSizeModifyEnable = true;             \
+		sba.DynamicStateBufferSize = 1;                            \
+		sba.IndirectObjectBufferSizeModifyEnable = true;           \
+		sba.IndirectObjectBufferSize = 0xfffff;                    \
+		sba.InstructionBuffersizeModifyEnable = true;              \
+		sba.InstructionBufferSize = 1;                             \
+		sba.BindlessSurfaceStateMOCS = (mocs_val);                 \
+	} while (0)
+
 static void
 gen9_emit_state_base_address(struct intel_bb *ibb) {
+	uint8_t mocs = intel_get_wb_mocs_index(ibb->fd);
 
-	/* WaBindlessSurfaceStateModifyEnable:skl,bxt */
-	/* The length has to be one less if we dont modify
-	   bindless state */
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
-		intel_bb_out(ibb, GEN4_STATE_BASE_ADDRESS | 20);
-	else
-		intel_bb_out(ibb, GEN4_STATE_BASE_ADDRESS | (19 - 1 - 2));
-
-	/* general */
-	intel_bb_out(ibb, 0 | BASE_ADDRESS_MODIFY);
-	intel_bb_out(ibb, 0);
-
-	/* stateless data port */
-	intel_bb_out(ibb, 0 | BASE_ADDRESS_MODIFY);
-
-	/* surface */
-	intel_bb_emit_reloc(ibb, ibb->handle,
-			    I915_GEM_DOMAIN_SAMPLER, 0,
-			    BASE_ADDRESS_MODIFY, ibb->batch_offset);
-
-	/* dynamic */
-	intel_bb_emit_reloc(ibb, ibb->handle,
-			    I915_GEM_DOMAIN_RENDER | I915_GEM_DOMAIN_INSTRUCTION, 0,
-			    BASE_ADDRESS_MODIFY, ibb->batch_offset);
-
-	/* indirect */
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-
-	/* instruction */
-	intel_bb_emit_reloc(ibb, ibb->handle,
-			    I915_GEM_DOMAIN_INSTRUCTION, 0,
-			    BASE_ADDRESS_MODIFY, ibb->batch_offset);
-
-	/* general state buffer size */
-	intel_bb_out(ibb, 0xfffff000 | 1);
-	/* dynamic state buffer size */
-	intel_bb_out(ibb, 1 << 12 | 1);
-	/* indirect object buffer size */
-	intel_bb_out(ibb, 0xfffff000 | 1);
-	/* intruction buffer size */
-	intel_bb_out(ibb, 1 << 12 | 1);
-
-	/* Bindless surface state base address */
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	struct igt_address surf_base =
+		igt_address_of_batch(ibb, I915_GEM_DOMAIN_SAMPLER, 0);
+	struct igt_address dyn_base =
+		igt_address_of_batch(ibb,
+				     I915_GEM_DOMAIN_RENDER | I915_GEM_DOMAIN_INSTRUCTION, 0);
+	struct igt_address inst_base =
+		igt_address_of_batch(ibb, I915_GEM_DOMAIN_INSTRUCTION, 0);
 
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20) {
-		/* Bindless sampler */
-		intel_bb_out(ibb, 0);
-		intel_bb_out(ibb, 0);
-		intel_bb_out(ibb, 0);
+	if (HAS_4TILE(ibb->devid) || intel_gen(ibb->devid) > 12) {
+		igt_genxml_emit(ibb, GFX125_STATE_BASE_ADDRESS, sba) {
+			IGT_SBA_COMMON(sba, mocs, surf_base, dyn_base, inst_base);
+			/* WBP (0) and UC (1) are marked dont_use in the XML for this field. */
+			sba.L1CacheControl = GFX125_L1CC_WB;
+			sba.BindlessSamplerStateBaseAddressModifyEnable = true;
+			sba.BindlessSamplerStateMOCS = mocs;
+		}
+	} else if (intel_gen(ibb->devid) >= 11) {
+		igt_genxml_emit(ibb, GFX11_STATE_BASE_ADDRESS, sba) {
+			IGT_SBA_COMMON(sba, mocs, surf_base, dyn_base, inst_base);
+			sba.BindlessSamplerStateBaseAddressModifyEnable = true;
+			sba.BindlessSamplerStateMOCS = mocs;
+		}
+	} else {
+		igt_genxml_emit(ibb, GFX9_STATE_BASE_ADDRESS, sba) {
+			IGT_SBA_COMMON(sba, mocs, surf_base, dyn_base, inst_base);
+		}
 	}
 }
 
@@ -750,184 +821,119 @@ gen7_emit_urb(struct intel_bb *ibb) {
 	const int vs_size = 2;
 	const int vs_start = 4;
 
-	intel_bb_out(ibb, GEN7_3DSTATE_URB_VS);
-	intel_bb_out(ibb, vs_entries | ((vs_size - 1) << 16) | (vs_start << 25));
-	intel_bb_out(ibb, GEN7_3DSTATE_URB_GS);
-	intel_bb_out(ibb, vs_start << 25);
-	intel_bb_out(ibb, GEN7_3DSTATE_URB_HS);
-	intel_bb_out(ibb, vs_start << 25);
-	intel_bb_out(ibb, GEN7_3DSTATE_URB_DS);
-	intel_bb_out(ibb, vs_start << 25);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_URB_VS, urb) {
+		urb.VSNumberofURBEntries = vs_entries;
+		urb.VSURBEntryAllocationSize = vs_size - 1;
+		urb.VSURBStartingAddress = vs_start;
+	}
+	igt_genxml_emit(ibb, GFX9_3DSTATE_URB_GS, urb) {
+		urb.GSURBStartingAddress = vs_start;
+	}
+	igt_genxml_emit(ibb, GFX9_3DSTATE_URB_HS, urb) {
+		urb.HSURBStartingAddress = vs_start;
+	}
+	igt_genxml_emit(ibb, GFX9_3DSTATE_URB_DS, urb) {
+		urb.DSURBStartingAddress = vs_start;
+	}
 }
 
 static void
 gen8_emit_cc(struct intel_bb *ibb) {
-	intel_bb_out(ibb, GEN7_3DSTATE_BLEND_STATE_POINTERS);
-	intel_bb_out(ibb, cc.blend_state | 1);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_BLEND_STATE_POINTERS, bsp) {
+		bsp.BlendStatePointer = cc.blend_state;
+		bsp.BlendStatePointerValid = true;
+	}
 
-	intel_bb_out(ibb, GEN6_3DSTATE_CC_STATE_POINTERS);
-	intel_bb_out(ibb, cc.cc_state | 1);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_CC_STATE_POINTERS, ccp) {
+		ccp.ColorCalcStatePointer = cc.cc_state;
+		ccp.ColorCalcStatePointerValid = true;
+	}
 }
 
 static void
 gen8_emit_multisample(struct intel_bb *ibb) {
-	intel_bb_out(ibb, GEN8_3DSTATE_MULTISAMPLE | 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_MULTISAMPLE, ms) { }
 
-	intel_bb_out(ibb, GEN6_3DSTATE_SAMPLE_MASK);
-	intel_bb_out(ibb, 1);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_SAMPLE_MASK, sm) {
+		sm.SampleMask = 1;
+	}
 }
 
 static void
 gen8_emit_vs(struct intel_bb *ibb) {
-	intel_bb_out(ibb, GEN6_3DSTATE_CONSTANT_VS | (11-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-
-	intel_bb_out(ibb, GEN7_3DSTATE_BINDING_TABLE_POINTERS_VS);
-	intel_bb_out(ibb, 0);
-
-	intel_bb_out(ibb, GEN7_3DSTATE_SAMPLER_STATE_POINTERS_VS);
-	intel_bb_out(ibb, 0);
-
-	intel_bb_out(ibb, GEN6_3DSTATE_VS | (9-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_CONSTANT_VS, cvs) {
+		cvs.MOCS = intel_get_wb_mocs_index(ibb->fd);
+	}
+
+	igt_genxml_emit(ibb, GFX9_3DSTATE_BINDING_TABLE_POINTERS_VS, bt) { }
+
+	igt_genxml_emit(ibb, GFX9_3DSTATE_SAMPLER_STATE_POINTERS_VS, sp) { }
+
+	igt_genxml_emit(ibb, GFX9_3DSTATE_VS, vs) { }
 }
 
 static void
 gen8_emit_hs(struct intel_bb *ibb) {
-	intel_bb_out(ibb, GEN7_3DSTATE_CONSTANT_HS | (11-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-
-	intel_bb_out(ibb, GEN7_3DSTATE_HS | (9-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-
-	intel_bb_out(ibb, GEN7_3DSTATE_BINDING_TABLE_POINTERS_HS);
-	intel_bb_out(ibb, 0);
-
-	intel_bb_out(ibb, GEN8_3DSTATE_SAMPLER_STATE_POINTERS_HS);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_CONSTANT_HS, chs) {
+		chs.MOCS = intel_get_wb_mocs_index(ibb->fd);
+	}
+
+	if (intel_gen(ibb->devid) >= 20)
+		igt_genxml_emit(ibb, GFX20_3DSTATE_HS, hs) { }
+	else
+		igt_genxml_emit(ibb, GFX9_3DSTATE_HS, hs) { }
+
+	igt_genxml_emit(ibb, GFX9_3DSTATE_BINDING_TABLE_POINTERS_HS, bt) { }
+
+	igt_genxml_emit(ibb, GFX9_3DSTATE_SAMPLER_STATE_POINTERS_HS, sp) { }
 }
 
 static void
 gen8_emit_gs(struct intel_bb *ibb) {
-	intel_bb_out(ibb, GEN6_3DSTATE_CONSTANT_GS | (11-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-
-	intel_bb_out(ibb, GEN6_3DSTATE_GS | (10-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-
-	intel_bb_out(ibb, GEN7_3DSTATE_BINDING_TABLE_POINTERS_GS);
-	intel_bb_out(ibb, 0);
-
-	intel_bb_out(ibb, GEN7_3DSTATE_SAMPLER_STATE_POINTERS_GS);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_CONSTANT_GS, cgs) {
+		cgs.MOCS = intel_get_wb_mocs_index(ibb->fd);
+	}
+
+	igt_genxml_emit(ibb, GFX9_3DSTATE_GS, gs) { }
+
+	igt_genxml_emit(ibb, GFX9_3DSTATE_BINDING_TABLE_POINTERS_GS, bt) { }
+
+	igt_genxml_emit(ibb, GFX9_3DSTATE_SAMPLER_STATE_POINTERS_GS, sp) { }
 }
 
 static void
 gen9_emit_ds(struct intel_bb *ibb) {
-	intel_bb_out(ibb, GEN7_3DSTATE_CONSTANT_DS | (11-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-
-	intel_bb_out(ibb, GEN7_3DSTATE_DS | (11-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-
-	intel_bb_out(ibb, GEN7_3DSTATE_BINDING_TABLE_POINTERS_DS);
-	intel_bb_out(ibb, 0);
-
-	intel_bb_out(ibb, GEN8_3DSTATE_SAMPLER_STATE_POINTERS_DS);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_CONSTANT_DS, cds) {
+		cds.MOCS = intel_get_wb_mocs_index(ibb->fd);
+	}
+
+	igt_genxml_emit(ibb, GFX9_3DSTATE_DS, ds) { }
+
+	igt_genxml_emit(ibb, GFX9_3DSTATE_BINDING_TABLE_POINTERS_DS, bt) { }
+
+	igt_genxml_emit(ibb, GFX9_3DSTATE_SAMPLER_STATE_POINTERS_DS, sp) { }
 }
 
 
 static void
 gen8_emit_wm_hz_op(struct intel_bb *ibb) {
 	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20) {
-		intel_bb_out(ibb, GEN8_3DSTATE_WM_HZ_OP | (6-2));
-		intel_bb_out(ibb, 0);
+		igt_genxml_emit(ibb, GFX20_3DSTATE_WM_HZ_OP, hz) { }
 	} else {
-		intel_bb_out(ibb, GEN8_3DSTATE_WM_HZ_OP | (5-2));
+		igt_genxml_emit(ibb, GFX9_3DSTATE_WM_HZ_OP, hz) { }
 	}
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
 }
 
 static void
 gen8_emit_null_state(struct intel_bb *ibb) {
 	gen8_emit_wm_hz_op(ibb);
 	gen8_emit_hs(ibb);
-	intel_bb_out(ibb, GEN7_3DSTATE_TE | (4-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+
+	if (intel_gen(ibb->devid) >= 12)
+		igt_genxml_emit(ibb, GFX12_3DSTATE_TE, te) { }
+	else
+		igt_genxml_emit(ibb, GFX9_3DSTATE_TE, te) { }
+
 	gen8_emit_gs(ibb);
 	gen9_emit_ds(ibb);
 	gen8_emit_vs(ibb);
@@ -935,137 +941,109 @@ gen8_emit_null_state(struct intel_bb *ibb) {
 
 static void
 gen7_emit_clip(struct intel_bb *ibb) {
-	intel_bb_out(ibb, GEN6_3DSTATE_CLIP | (4 - 2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0); /*  pass-through */
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_CLIP, clip) {
+		/* All fields zero = pass-through */
+	}
 }
 
 static void
 gen8_emit_sf(struct intel_bb *ibb)
 {
-	int i;
-
-	intel_bb_out(ibb, GEN7_3DSTATE_SBE | (6 - 2));
-	intel_bb_out(ibb, 1 << GEN7_SBE_NUM_OUTPUTS_SHIFT |
-		     GEN8_SBE_FORCE_URB_ENTRY_READ_LENGTH |
-		     GEN8_SBE_FORCE_URB_ENTRY_READ_OFFSET |
-		     1 << GEN7_SBE_URB_ENTRY_READ_LENGTH_SHIFT |
-		     1 << GEN8_SBE_URB_ENTRY_READ_OFFSET_SHIFT);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, GEN9_SBE_ACTIVE_COMPONENT_XYZW << 0);
-	intel_bb_out(ibb, 0);
-
-	intel_bb_out(ibb, GEN8_3DSTATE_SBE_SWIZ | (11 - 2));
-	for (i = 0; i < 8; i++)
-		intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-
-	intel_bb_out(ibb, GEN8_3DSTATE_RASTER | (5 - 2));
-	intel_bb_out(ibb, GEN8_RASTER_FRONT_WINDING_CCW | GEN8_RASTER_CULL_NONE);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-
-	intel_bb_out(ibb, GEN6_3DSTATE_SF | (4 - 2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_SBE, sbe) {
+		sbe.NumberofSFOutputAttributes = 1;
+		sbe.ForceVertexURBEntryReadLength = true;
+		sbe.ForceVertexURBEntryReadOffset = true;
+		sbe.VertexURBEntryReadLength = 1;
+		sbe.VertexURBEntryReadOffset = 1;
+		sbe.AttributeActiveComponentFormat[0] = GFX9_ACTIVE_COMPONENT_XYZW;
+	}
+
+	igt_genxml_emit(ibb, GFX9_3DSTATE_SBE_SWIZ, swiz) { }
+
+	igt_genxml_emit(ibb, GFX9_3DSTATE_RASTER, raster) {
+		raster.FrontWinding = 1; /* CCW */
+		raster.CullMode = GFX9_CULLMODE_NONE;
+	}
+
+	igt_genxml_emit(ibb, GFX9_3DSTATE_SF, sf) { }
 }
 
 static void
 gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear) {
 	const int max_threads = 63;
 
-	intel_bb_out(ibb, GEN6_3DSTATE_WM | (2 - 2));
-	intel_bb_out(ibb, /* XXX: I don't understand the BARYCENTRIC stuff, but it
-		   * appears we need it to put our setup data in the place we
-		   * expect (g6, see below) */
-		     GEN8_3DSTATE_PS_PERSPECTIVE_PIXEL_BARYCENTRIC);
-
-	intel_bb_out(ibb, GEN6_3DSTATE_CONSTANT_PS | (11-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-
-	intel_bb_out(ibb, GEN7_3DSTATE_PS | (12-2));
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
-		intel_bb_out(ibb, kernel | 1);
-	else
-		intel_bb_out(ibb, kernel);
-	intel_bb_out(ibb, 0); /* kernel hi */
+	igt_genxml_emit(ibb, GFX9_3DSTATE_WM, wm) {
+		wm.BarycentricInterpolationMode = GFX9_BIM_PERSPECTIVE_PIXEL;
+	}
 
-	if (fast_clear)
-		intel_bb_out(ibb, 1 <<  GEN6_3DSTATE_WM_BINDING_TABLE_ENTRY_COUNT_SHIFT);
-	else
-		intel_bb_out(ibb, 1 << GEN6_3DSTATE_WM_SAMPLER_COUNT_SHIFT |
-		             2 << GEN6_3DSTATE_WM_BINDING_TABLE_ENTRY_COUNT_SHIFT);
-
-	intel_bb_out(ibb, 0); /* scratch space stuff */
-	intel_bb_out(ibb, 0); /* scratch hi */
-	intel_bb_out(ibb, (max_threads - 1) << GEN8_3DSTATE_PS_MAX_THREADS_SHIFT |
-	             GEN6_3DSTATE_WM_16_DISPATCH_ENABLE |
-	             (fast_clear ? GEN8_3DSTATE_FAST_CLEAR_ENABLE : 0));
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
-		intel_bb_out(ibb, 6 << GEN6_3DSTATE_WM_DISPATCH_START_GRF_0_SHIFT |
-			     GENXE_KERNEL0_POLY_PACK16_FIXED << GENXE_KERNEL0_PACKING_POLICY);
-	else
-		intel_bb_out(ibb, 6 << GEN6_3DSTATE_WM_DISPATCH_START_GRF_0_SHIFT);
-	intel_bb_out(ibb, 0); // kernel 1
-	intel_bb_out(ibb, 0); /* kernel 1 hi */
-	intel_bb_out(ibb, 0); // kernel 2
-	intel_bb_out(ibb, 0); /* kernel 2 hi */
+	igt_genxml_emit(ibb, GFX9_3DSTATE_CONSTANT_PS, cps) {
+		cps.MOCS = intel_get_wb_mocs_index(ibb->fd);
+	}
 
-	intel_bb_out(ibb, GEN8_3DSTATE_PS_BLEND | (2 - 2));
-	intel_bb_out(ibb, GEN8_PS_BLEND_HAS_WRITEABLE_RT);
+	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20) {
+		igt_genxml_emit(ibb, GFX20_3DSTATE_PS, ps) {
+			ps.KernelStartPointer0 = kernel;
+			ps.Kernel0Enable = true;
+			ps.BindingTableEntryCount = fast_clear ? 1 : 2;
+			ps.SamplerCount = fast_clear ? 0 : 1;
+			ps.Kernel0SIMDWidth = GFX20_PS_SIMD16;
+			ps.RenderTargetFastClearEnable = fast_clear;
+			ps.MaximumNumberofThreadsPerPSD = max_threads - 1;
+			ps.DispatchGRFStartRegisterForConstantSetupData0 = 6;
+			ps.Kernel0PolyPackingPolicy = GFX20_POLY_PACK16_FIXED;
+		}
+	} else {
+		igt_genxml_emit(ibb, GFX9_3DSTATE_PS, ps) {
+			ps.KernelStartPointer0 = kernel;
+			ps.BindingTableEntryCount = fast_clear ? 1 : 2;
+			ps.SamplerCount = fast_clear ? 0 : 1;
+			ps._16PixelDispatchEnable = true;
+			ps.RenderTargetFastClearEnable = fast_clear;
+			ps.MaximumNumberofThreadsPerPSD = max_threads - 1;
+			ps.DispatchGRFStartRegisterForConstantSetupData0 = 6;
+		}
+	}
+
+	igt_genxml_emit(ibb, GFX9_3DSTATE_PS_BLEND, blend) {
+		blend.HasWriteableRT = true;
+	}
 
-	intel_bb_out(ibb, GEN8_3DSTATE_PS_EXTRA | (2 - 2));
-	intel_bb_out(ibb, GEN8_PSX_PIXEL_SHADER_VALID | GEN8_PSX_ATTRIBUTE_ENABLE);
+	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20) {
+		igt_genxml_emit(ibb, GFX20_3DSTATE_PS_EXTRA, extra) {
+			extra.PixelShaderValid = true;
+		}
+	} else {
+		igt_genxml_emit(ibb, GFX9_3DSTATE_PS_EXTRA, extra) {
+			extra.PixelShaderValid = true;
+			extra.AttributeEnable = true;
+		}
+	}
 }
 
 static void
 gen9_emit_depth(struct intel_bb *ibb)
 {
-	bool need_10dw = HAS_4TILE(ibb->devid);
-
-	intel_bb_out(ibb, GEN8_3DSTATE_WM_DEPTH_STENCIL | (4 - 2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-
-	intel_bb_out(ibb, GEN7_3DSTATE_DEPTH_BUFFER | (need_10dw ? (10-2) : (8-2)));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	if (need_10dw) {
-		intel_bb_out(ibb, 0);
-		intel_bb_out(ibb, 0);
+	uint8_t mocs = intel_get_wb_mocs_index(ibb->fd);
+
+	igt_genxml_emit(ibb, GFX9_3DSTATE_WM_DEPTH_STENCIL, wds) { }
+
+	if (HAS_4TILE(ibb->devid)) {
+		igt_genxml_emit(ibb, GFX125_3DSTATE_DEPTH_BUFFER, db) {
+			db.MOCS = mocs;
+		}
+	} else {
+		igt_genxml_emit(ibb, GFX9_3DSTATE_DEPTH_BUFFER, db) {
+			db.MOCS = mocs;
+		}
 	}
 
-	intel_bb_out(ibb, GEN8_3DSTATE_HIER_DEPTH_BUFFER | (5-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-
-	intel_bb_out(ibb, GEN8_3DSTATE_STENCIL_BUFFER | (5-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_HIER_DEPTH_BUFFER, hdb) {
+		hdb.MOCS = mocs;
+	}
+
+	igt_genxml_emit(ibb, GFX9_3DSTATE_STENCIL_BUFFER, sb) {
+		sb.MOCS = mocs;
+	}
 }
 
 static void
@@ -1073,46 +1051,45 @@ gen7_emit_clear(struct intel_bb *ibb) {
 	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
 		return;
 
-	intel_bb_out(ibb, GEN7_3DSTATE_CLEAR_PARAMS | (3-2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 1); // clear valid
+	igt_genxml_emit(ibb, GFX9_3DSTATE_CLEAR_PARAMS, cp) {
+		cp.DepthClearValueValid = true;
+	}
 }
 
 static void
 gen6_emit_drawing_rectangle(struct intel_bb *ibb, const struct intel_buf *dst)
 {
-	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
-		intel_bb_out(ibb, GENXE2_3DSTATE_DRAWING_RECTANGLE_FAST | (4 - 2));
-	else
-		intel_bb_out(ibb, GEN4_3DSTATE_DRAWING_RECTANGLE | (4 - 2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, (intel_buf_height(dst) - 1) << 16 | (intel_buf_width(dst) - 1));
-	intel_bb_out(ibb, 0);
+	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20) {
+		igt_genxml_emit(ibb, GFX20_3DSTATE_DRAWING_RECTANGLE_FAST, dr) {
+			dr.ClippedDrawingRectangleXMax = intel_buf_width(dst) - 1;
+			dr.ClippedDrawingRectangleYMax = intel_buf_height(dst) - 1;
+		}
+	} else {
+		igt_genxml_emit(ibb, GFX9_3DSTATE_DRAWING_RECTANGLE, dr) {
+			dr.ClippedDrawingRectangleXMax = intel_buf_width(dst) - 1;
+			dr.ClippedDrawingRectangleYMax = intel_buf_height(dst) - 1;
+		}
+	}
 }
 
 static void gen8_emit_vf_topology(struct intel_bb *ibb)
 {
-	intel_bb_out(ibb, GEN8_3DSTATE_VF_TOPOLOGY);
-	intel_bb_out(ibb, _3DPRIM_RECTLIST);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_VF_TOPOLOGY, vft) {
+		vft.PrimitiveTopologyType = GFX9_3DPRIM_RECTLIST;
+	}
 }
 
 /* Vertex elements MUST be defined before this according to spec */
 static void gen8_emit_primitive(struct intel_bb *ibb, uint32_t offset)
 {
-	intel_bb_out(ibb, GEN8_3DSTATE_VF | (2 - 2));
-	intel_bb_out(ibb, 0);
-
-	intel_bb_out(ibb, GEN8_3DSTATE_VF_INSTANCING | (3 - 2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-
-	intel_bb_out(ibb, GEN4_3DPRIMITIVE | (7-2));
-	intel_bb_out(ibb, 0);	/* gen8+ ignore the topology type field */
-	intel_bb_out(ibb, 3);	/* vertex count */
-	intel_bb_out(ibb, 0);	/*  We're specifying this instead with offset in GEN6_3DSTATE_VERTEX_BUFFERS */
-	intel_bb_out(ibb, 1);	/* single instance */
-	intel_bb_out(ibb, 0);	/* start instance location */
-	intel_bb_out(ibb, 0);	/* index buffer offset, ignored */
+	igt_genxml_emit(ibb, GFX9_3DSTATE_VF, vf) { }
+
+	igt_genxml_emit(ibb, GFX9_3DSTATE_VF_INSTANCING, vfi) { }
+
+	igt_genxml_emit(ibb, GFX9_3DPRIMITIVE, prim) {
+		prim.VertexCountPerInstance = 3;
+		prim.InstanceCount = 1;
+	}
 }
 
 #define PIPE_CONTROL_RENDER_TARGET_FLUSH    (1 << 12)
@@ -1244,8 +1221,13 @@ void _gen9_render_op(struct intel_bb *ibb,
 
 	/* Start emitting the commands. The order roughly follows the mesa blorp
 	 * order */
-	intel_bb_out(ibb, G4X_PIPELINE_SELECT | PIPELINE_SELECT_3D |
-		     GEN9_PIPELINE_SELECTION_MASK);
+	igt_genxml_emit(ibb, GFX9_PIPELINE_SELECT, ps) {
+		ps.PipelineSelection = GFX9_3D;
+		/* MaskBits 15:8 is a write-enable mask for bits 5:4 (Force Media
+		 * Awake and Media Sampler DOP Clock Gate Enable).  Value 0x3
+		 * enables writes to both bits so PipelineSelection takes effect. */
+		ps.MaskBits = 3;
+	}
 
 	gen12_emit_aux_pgtable_state(ibb, aux_pgtable_state, true);
 
@@ -1276,17 +1258,21 @@ void _gen9_render_op(struct intel_bb *ibb,
 	gen9_emit_state_base_address(ibb);
 
 	if (HAS_4TILE(ibb->devid) || intel_gen(ibb->devid) > 12) {
-		intel_bb_out(ibb, GEN4_3DSTATE_BINDING_TABLE_POOL_ALLOC | 2);
-		intel_bb_emit_reloc(ibb, ibb->handle,
-				    I915_GEM_DOMAIN_RENDER | I915_GEM_DOMAIN_INSTRUCTION, 0,
-				    0, ibb->batch_offset);
-		intel_bb_out(ibb, 1 << 12);
+		igt_genxml_emit(ibb, GFX9_3DSTATE_BINDING_TABLE_POOL_ALLOC, btpa) {
+			btpa.MOCS = intel_get_wb_mocs_index(ibb->fd);
+			btpa.BindingTablePoolBaseAddress =
+				igt_address_of_batch(ibb,
+					I915_GEM_DOMAIN_RENDER | I915_GEM_DOMAIN_INSTRUCTION, 0);
+			btpa.BindingTablePoolBufferSize = 1;
+		}
 	}
 
-	intel_bb_out(ibb, GEN7_3DSTATE_VIEWPORT_STATE_POINTERS_CC);
-	intel_bb_out(ibb, viewport.cc_state);
-	intel_bb_out(ibb, GEN8_3DSTATE_VIEWPORT_STATE_POINTERS_SF_CLIP);
-	intel_bb_out(ibb, viewport.sf_clip_state);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_VIEWPORT_STATE_POINTERS_CC, vp) {
+		vp.CCViewportPointer = viewport.cc_state;
+	}
+	igt_genxml_emit(ibb, GFX9_3DSTATE_VIEWPORT_STATE_POINTERS_SF_CLIP, vp) {
+		vp.SFClipViewportPointer = viewport.sf_clip_state;
+	}
 
 	gen7_emit_urb(ibb);
 
@@ -1296,11 +1282,7 @@ void _gen9_render_op(struct intel_bb *ibb,
 
 	gen8_emit_null_state(ibb);
 
-	intel_bb_out(ibb, GEN7_3DSTATE_STREAMOUT | (5 - 2));
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
-	intel_bb_out(ibb, 0);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_STREAMOUT, so) { }
 
 	gen7_emit_clip(ibb);
 
@@ -1308,14 +1290,17 @@ void _gen9_render_op(struct intel_bb *ibb,
 
 	gen8_emit_ps(ibb, ps_kernel_off, fast_clear);
 
-	intel_bb_out(ibb, GEN7_3DSTATE_BINDING_TABLE_POINTERS_PS);
-	intel_bb_out(ibb, ps_binding_table);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_BINDING_TABLE_POINTERS_PS, bt) {
+		bt.PointertoPSBindingTable = ps_binding_table;
+	}
 
-	intel_bb_out(ibb, GEN7_3DSTATE_SAMPLER_STATE_POINTERS_PS);
-	intel_bb_out(ibb, ps_sampler_state);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_SAMPLER_STATE_POINTERS_PS, sp) {
+		sp.PointertoPSSamplerState = ps_sampler_state;
+	}
 
-	intel_bb_out(ibb, GEN8_3DSTATE_SCISSOR_STATE_POINTERS);
-	intel_bb_out(ibb, scissor_state);
+	igt_genxml_emit(ibb, GFX9_3DSTATE_SCISSOR_STATE_POINTERS, ssp) {
+		ssp.ScissorRectPointer = scissor_state;
+	}
 
 	gen9_emit_depth(ibb);
 
-- 
2.34.1

