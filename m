Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3023C10E02A
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 15:44:02 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ac88d9edf3so141792091fa.0
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 08:44:02 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 16 May 2023 18:43:27 +0300
Message-Id: <20230516154329.9002-3-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230516154329.9002-1-juhapekka.heikkila@gmail.com>
References: <20230516154329.9002-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] lib/mtl: Add MTL related tile4 ccs
 modifiers handling
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

Add tile4 type ccs modifiers with aux buffer in fb structure

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c            | 30 +++++++++++++---
 lib/intel_aux_pgtable.c | 79 +++++++++++++++++++++++++++++------------
 lib/intel_batchbuffer.c | 15 ++++++--
 lib/rendercopy.h        |  8 +++++
 lib/rendercopy_gen9.c   | 44 ++++++++++++++++++++++-
 lib/veboxcopy_gen12.c   | 79 +++++++++++++++++++++--------------------
 6 files changed, 186 insertions(+), 69 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 0fe5b6ad..71a199d4 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -454,6 +454,9 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 			*height_ret = 8;
 		}
 		break;
+	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC:
+	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
 	case I915_FORMAT_MOD_Y_TILED:
 	case I915_FORMAT_MOD_Y_TILED_CCS:
 	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
@@ -572,7 +575,8 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 static bool is_gen12_mc_ccs_modifier(uint64_t modifier)
 {
 	return modifier == I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS ||
-		modifier == I915_FORMAT_MOD_4_TILED_DG2_MC_CCS;
+		modifier == I915_FORMAT_MOD_4_TILED_DG2_MC_CCS ||
+		modifier == I915_FORMAT_MOD_4_TILED_MTL_MC_CCS;
 }
 
 static bool is_gen12_ccs_modifier(uint64_t modifier)
@@ -581,7 +585,9 @@ static bool is_gen12_ccs_modifier(uint64_t modifier)
 		modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS ||
 		modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
 		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
-		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC;
+		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ||
+		modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS ||
+		modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC;
 }
 
 static bool is_ccs_modifier(uint64_t modifier)
@@ -611,8 +617,9 @@ static bool is_gen12_ccs_plane(const struct igt_fb *fb, int plane)
 
 static bool is_gen12_ccs_cc_plane(const struct igt_fb *fb, int plane)
 {
-	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC &&
-	    plane == 2)
+	if (plane == 2 &&
+	    (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
+	     fb->modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC))
 		return true;
 
 	if (fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC &&
@@ -706,6 +713,7 @@ static int fb_num_planes(const struct igt_fb *fb)
 		num_planes *= 2;
 
 	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
+	    fb->modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC ||
 	    fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC)
 		num_planes++;
 
@@ -903,6 +911,11 @@ static unsigned int get_plane_alignment(struct igt_fb *fb, int color_plane)
 
 	alignment = lcm(tile_row_size, 64 * 1024);
 
+	if (is_yuv_semiplanar_plane(fb, color_plane) &&
+	    fb->modifier == I915_FORMAT_MOD_4_TILED_MTL_MC_CCS &&
+	    (alignment & ((1 << 20) - 1)))
+		alignment = 1 << 20;
+
 	return alignment;
 }
 
@@ -989,6 +1002,9 @@ uint64_t igt_fb_mod_to_tiling(uint64_t modifier)
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
+	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
+	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC:
 		return I915_TILING_4;
 	case I915_FORMAT_MOD_Yf_TILED:
 	case I915_FORMAT_MOD_Yf_TILED_CCS:
@@ -2614,7 +2630,8 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 				 end - fb->offsets[i]);
 	}
 
-	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC)
+	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
+	    fb->modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC)
 		buf->cc.offset = fb->offsets[2];
 
 	if (fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC)
@@ -4656,10 +4673,13 @@ const char *igt_fb_modifier_name(uint64_t modifier)
 		return "Y-MC_CCS";
 	case I915_FORMAT_MOD_4_TILED:
 		return "4";
+	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
 		return "4-RC_CCS";
+	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
 		return "4-MC_CCS";
+	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC:
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
 		return "4-RC_CCS-CC";
 	default:
diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
index 946ca60b..7c795213 100644
--- a/lib/intel_aux_pgtable.c
+++ b/lib/intel_aux_pgtable.c
@@ -5,6 +5,7 @@
 #include "intel_aux_pgtable.h"
 #include "intel_batchbuffer.h"
 #include "intel_bufops.h"
+#include "intel_chipset.h"
 #include "ioctl_wrappers.h"
 
 #include "i915/gem_mman.h"
@@ -12,22 +13,6 @@
 #define BITMASK(e, s)		((~0ULL << (s)) & \
 				 (~0ULL >> (BITS_PER_LONG_LONG - 1 - (e))))
 
-/* The unit size to which the AUX CCS surface is aligned to. */
-#define AUX_CCS_UNIT_SIZE	64
-/*
- * The block size on the AUX CCS surface which is mapped by one L1 AUX
- * pagetable entry.
- */
-#define AUX_CCS_BLOCK_SIZE	(4 * AUX_CCS_UNIT_SIZE)
-/*
- * The block size on the main surface mapped by one AUX CCS block:
- *   256 bytes per CCS block *
- *   8   bits per byte /
- *   2   bits per main surface CL *
- *   64  bytes per main surface CL
- */
-#define MAIN_SURFACE_BLOCK_SIZE	(AUX_CCS_BLOCK_SIZE * 8 / 2 * 64)
-
 #define GFX_ADDRESS_BITS	48
 
 #define AUX_FORMAT_YCRCB	0x03
@@ -357,14 +342,24 @@ pgt_populate_entries_for_buf(struct pgtable *pgt,
 	uint64_t aux_addr = buf->addr.offset + buf->ccs[surface_idx].offset;
 	uint64_t l1_flags = pgt_get_l1_flags(buf, surface_idx);
 	uint64_t lx_flags = pgt_get_lx_flags();
+	uint64_t aux_ccs_block_size = 1 << pgt->level_info->desc[0].entry_ptr_shift;
+
+	/*
+	 * The block size on the main surface mapped by one AUX CCS block:
+	 *       CCS block size *
+	 *   8   bits per byte /
+	 *   2   bits per main surface CL *
+	 *   64  bytes per main surface CL
+	 */
+	uint64_t main_surface_block_size = aux_ccs_block_size * 8 / 2 * 64;
 
 	igt_assert(!(buf->surface[surface_idx].stride % 512));
 	igt_assert_eq(buf->ccs[surface_idx].stride,
 		      buf->surface[surface_idx].stride / 512 * 64);
 
 	for (; surface_addr < surface_end;
-	     surface_addr += MAIN_SURFACE_BLOCK_SIZE,
-	     aux_addr += AUX_CCS_BLOCK_SIZE) {
+	     surface_addr += main_surface_block_size,
+	     aux_addr += aux_ccs_block_size) {
 		uint64_t table = top_table;
 		int level;
 
@@ -445,7 +440,7 @@ struct intel_buf *
 intel_aux_pgtable_create(struct intel_bb *ibb,
 			 struct intel_buf **bufs, int buf_count)
 {
-	static const struct pgtable_level_desc level_desc[] = {
+	static const struct pgtable_level_desc level_desc_table_tgl[] = {
 		{
 			.idx_shift = 16,
 			.idx_bits = 8,
@@ -458,6 +453,26 @@ intel_aux_pgtable_create(struct intel_bb *ibb,
 			.entry_ptr_shift = 13,
 			.table_size = 32 * 1024,
 		},
+		{
+			.idx_shift = 36,
+			.idx_bits = 12,
+			.entry_ptr_shift = 15,
+			.table_size = 32 * 1024,
+		}
+	};
+	static const struct pgtable_level_desc level_desc_table_mtl[] = {
+		{
+			.idx_shift = 20,
+			.idx_bits = 4,
+			.entry_ptr_shift = 12,
+			.table_size = 8 * 1024,
+		},
+		{
+			.idx_shift = 24,
+			.idx_bits = 12,
+			.entry_ptr_shift = 11,
+			.table_size = 32 * 1024,
+		},
 		{
 			.idx_shift = 36,
 			.idx_bits = 12,
@@ -465,6 +480,9 @@ intel_aux_pgtable_create(struct intel_bb *ibb,
 			.table_size = 32 * 1024,
 		},
 	};
+
+	const struct pgtable_level_desc *level_desc;
+	uint32_t levels;
 	struct pgtable *pgt;
 	struct buf_ops *bops;
 	struct intel_buf *buf;
@@ -472,7 +490,15 @@ intel_aux_pgtable_create(struct intel_bb *ibb,
 	igt_assert(buf_count);
 	bops = bufs[0]->bops;
 
-	pgt = pgt_create(level_desc, ARRAY_SIZE(level_desc), bufs, buf_count);
+	if (IS_METEORLAKE(ibb->devid)) {
+		level_desc = level_desc_table_mtl;
+		levels = ARRAY_SIZE(level_desc_table_mtl);
+	} else {
+		level_desc = level_desc_table_tgl;
+		levels = ARRAY_SIZE(level_desc_table_tgl);
+	}
+
+	pgt = pgt_create(&level_desc[0], levels, bufs, buf_count);
 	pgt->ibb = ibb;
 	pgt->buf = intel_buf_create(bops, pgt->size, 1, 8, 0, I915_TILING_NONE,
 				    I915_COMPRESSION_NONE);
@@ -637,8 +663,17 @@ gen12_create_aux_pgtable_state(struct intel_bb *ibb,
 void
 gen12_emit_aux_pgtable_state(struct intel_bb *ibb, uint32_t state, bool render)
 {
-	uint32_t table_base_reg = render ? GEN12_GFX_AUX_TABLE_BASE_ADDR :
-					   GEN12_VEBOX_AUX_TABLE_BASE_ADDR;
+	uint32_t table_base_reg;
+
+	if (render) {
+		table_base_reg = GEN12_GFX_AUX_TABLE_BASE_ADDR;
+	} else {
+		/* Vebox */
+		if (IS_METEORLAKE(ibb->devid))
+			table_base_reg = 0x380000 + GEN12_VEBOX_AUX_TABLE_BASE_ADDR;
+		else
+			table_base_reg = GEN12_VEBOX_AUX_TABLE_BASE_ADDR;
+	}
 
 	if (!state)
 		return;
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 545d1705..9667c694 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -671,8 +671,10 @@ igt_render_copyfunc_t igt_get_render_copyfunc(int devid)
 		copy = gen9_render_copyfunc;
 	else if (IS_GEN11(devid))
 		copy = gen11_render_copyfunc;
-	else if (HAS_4TILE(devid))
+	else if (HAS_FLATCCS(devid))
 		copy = gen12p71_render_copyfunc;
+	else if (IS_METEORLAKE(devid))
+		copy = mtl_render_copyfunc;
 	else if (IS_GEN12(devid))
 		copy = gen12_render_copyfunc;
 
@@ -691,7 +693,9 @@ igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid)
 
 igt_render_clearfunc_t igt_get_render_clearfunc(int devid)
 {
-	if (IS_DG2(devid)) {
+	if (IS_METEORLAKE(devid)) {
+		return mtl_render_clearfunc;
+	} else if (IS_DG2(devid)) {
 		return gen12p71_render_clearfunc;
 	} else if (IS_GEN12(devid)) {
 		return gen12_render_clearfunc;
@@ -1758,8 +1762,13 @@ __intel_bb_add_intel_buf(struct intel_bb *ibb, struct intel_buf *buf,
 	if (!alignment) {
 		alignment = 0x1000;
 
+		/*
+		 * TODO:
+		 * Find out why MTL need special alignment, spec says 32k
+		 * is enough for MTL.
+		 */
 		if (ibb->gen >= 12 && buf->compression)
-			alignment = 0x10000;
+			alignment = IS_METEORLAKE(ibb->devid) ? 0x100000 : 0x10000;
 
 		/* For gen3 ensure tiled buffers are aligned to power of two size */
 		if (ibb->gen == 3 && buf->tiling) {
diff --git a/lib/rendercopy.h b/lib/rendercopy.h
index 480fdee8..0d81d27f 100644
--- a/lib/rendercopy.h
+++ b/lib/rendercopy.h
@@ -23,6 +23,10 @@ static inline void emit_vertex_normalized(struct intel_bb *ibb,
 	intel_bb_out(ibb, u.ui);
 }
 
+void mtl_render_clearfunc(struct intel_bb *ibb,
+			  struct intel_buf *dst, unsigned int dst_x, unsigned int dst_y,
+			  unsigned int width, unsigned int height,
+			  const float clear_color[4]);
 void gen12p71_render_clearfunc(struct intel_bb *ibb,
 			       struct intel_buf *dst, unsigned int dst_x, unsigned int dst_y,
 			       unsigned int width, unsigned int height,
@@ -31,6 +35,10 @@ void gen12_render_clearfunc(struct intel_bb *ibb,
 			    struct intel_buf *dst, unsigned int dst_x, unsigned int dst_y,
 			    unsigned int width, unsigned int height,
 			    const float clear_color[4]);
+void mtl_render_copyfunc(struct intel_bb *ibb,
+			 struct intel_buf *src, uint32_t src_x, uint32_t src_y,
+			 uint32_t width, uint32_t height,
+			 struct intel_buf *dst, uint32_t dst_x, uint32_t dst_y);
 void gen12p71_render_copyfunc(struct intel_bb *ibb,
 			      struct intel_buf *src, uint32_t src_x, uint32_t src_y,
 			      uint32_t width, uint32_t height,
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 650d0950..db67b5ee 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -277,7 +277,9 @@ gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 
 			ss->ss12.clear_address = (address + buf->cc.offset) >> 6;
 			ss->ss13.clear_address_hi = (address + buf->cc.offset) >> 32;
-		} else if (HAS_FLATCCS(ibb->devid)) {
+		}
+
+		if (HAS_4TILE(ibb->devid)) {
 			ss->ss7.dg2.memory_compression_type = 0;
 			ss->ss7.dg2.memory_compression_enable = 0;
 			ss->ss7.dg2.disable_support_for_multi_gpu_partial_writes = 1;
@@ -1245,6 +1247,27 @@ void gen12p71_render_copyfunc(struct intel_bb *ibb,
 			sizeof(gen12p71_render_copy));
 }
 
+void mtl_render_copyfunc(struct intel_bb *ibb,
+			 struct intel_buf *src,
+			 unsigned int src_x, unsigned int src_y,
+			 unsigned int width, unsigned int height,
+			 struct intel_buf *dst,
+			 unsigned int dst_x, unsigned int dst_y)
+{
+	struct aux_pgtable_info pgtable_info = { };
+
+	gen12_aux_pgtable_init(&pgtable_info, ibb, src, dst);
+
+	_gen9_render_op(ibb, src, src_x, src_y,
+			width, height, dst, dst_x, dst_y,
+			pgtable_info.pgtable_buf,
+			NULL,
+			gen12p71_render_copy,
+			sizeof(gen12p71_render_copy));
+
+	gen12_aux_pgtable_cleanup(ibb, &pgtable_info);
+}
+
 void gen12_render_clearfunc(struct intel_bb *ibb,
 			    struct intel_buf *dst,
 			    unsigned int dst_x, unsigned int dst_y,
@@ -1277,3 +1300,22 @@ void gen12p71_render_clearfunc(struct intel_bb *ibb,
 			gen12p71_render_copy,
 			sizeof(gen12p71_render_copy));
 }
+
+void mtl_render_clearfunc(struct intel_bb *ibb,
+			  struct intel_buf *dst,
+			  unsigned int dst_x, unsigned int dst_y,
+			  unsigned int width, unsigned int height,
+			  const float clear_color[4])
+{
+	struct aux_pgtable_info pgtable_info = { };
+
+	gen12_aux_pgtable_init(&pgtable_info, ibb, NULL, dst);
+
+	_gen9_render_op(ibb, NULL, 0, 0,
+			width, height, dst, dst_x, dst_y,
+			pgtable_info.pgtable_buf,
+			clear_color,
+			gen12p71_render_copy,
+			sizeof(gen12p71_render_copy));
+	gen12_aux_pgtable_cleanup(ibb, &pgtable_info);
+}
diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
index aa90939b..4ab6ced3 100644
--- a/lib/veboxcopy_gen12.c
+++ b/lib/veboxcopy_gen12.c
@@ -158,13 +158,36 @@ static bool format_is_interleaved_yuv(int format)
 	return false;
 }
 
+static uint32_t compression_format(int format, struct intel_buf *buf)
+{
+	if (buf->compression == I915_COMPRESSION_NONE)
+		return 0;
+
+	switch (format) {
+	case R8G8B8A8_UNORM:
+		return 0xa;
+	case PLANAR_420_8:
+		return 0xf;
+	case PLANAR_420_16:
+		return 8;
+	case YCRCB_NORMAL:
+		return 3;
+	case PACKED_444A_8:
+		return 9;
+	default:
+		igt_assert(0);
+	}
+}
+
 static void emit_surface_state_cmd(struct intel_bb *ibb,
 				   int surface_id,
-				   int width, int height, int bpp,
-				   int pitch, uint32_t tiling, int format,
-				   uint32_t uv_offset)
+				   int width, int height,
+				   struct intel_buf *buf, int format)
 {
 	struct vebox_surface_state *ss;
+	int pitch = buf->surface[0].stride;
+	uint32_t uv_offset = buf->surface[1].offset;
+	uint32_t tiling = buf->tiling;
 
 	ss = intel_bb_ptr_align(ibb, 4);
 
@@ -185,35 +208,16 @@ static void emit_surface_state_cmd(struct intel_bb *ibb,
 
 	ss->ss4.u_y_offset = uv_offset / pitch;
 
-	if (HAS_FLATCCS(ibb->devid)) {
+	if (HAS_4TILE(ibb->devid)) {
 		/*
-		 * f-tile = 3 (Tile F)
+		 * tile4 = 3
 		 */
 		ss->ss3.dg2.tile_mode = (tiling != I915_TILING_NONE) ? 3 : 0;
 
-		switch (format) {
-		case R8G8B8A8_UNORM:
-			ss->ss7.dg2.compression_format = 0xa;
-			break;
-		case PLANAR_420_8:
-			ss->ss7.dg2.compression_format = 0xf;
-			break;
-		case PLANAR_420_16:
-			ss->ss7.dg2.compression_format = 8;
-			break;
-		case YCRCB_NORMAL:
-			ss->ss7.dg2.compression_format = 3;
-			break;
-		case PACKED_444A_8:
-			ss->ss7.dg2.compression_format = 0x9;
-			break;
-		default:
-			igt_assert(0);
-		}
+		ss->ss7.dg2.compression_format = compression_format(format, buf);
 	} else {
 		ss->ss3.tgl.tile_walk = (tiling == I915_TILING_Y) ||
-			(tiling == I915_TILING_Yf) ||
-			(tiling == I915_TILING_4);
+			(tiling == I915_TILING_Yf);
 		ss->ss3.tgl.tiled_surface = tiling != I915_TILING_NONE;
 	}
 
@@ -246,9 +250,10 @@ static void emit_tiling_convert_cmd(struct intel_bb *ibb,
 	}
 
 	if (HAS_4TILE(ibb->devid))
-		tc->tc1_2.input_mocs_idx = 3;
-	else
-		tc->tc1_2.input_tiled_resource_mode = src->tiling == I915_TILING_Yf;
+		tc->tc1_2.input_mocs_idx = IS_DG2(ibb->devid) ? 3 : 9;
+
+	tc->tc1_2.input_tiled_resource_mode = src->tiling == I915_TILING_Yf;
+
 	reloc_delta = tc->tc1_2_l;
 
 	igt_assert(src->addr.offset == ALIGN(src->addr.offset, 0x1000));
@@ -267,9 +272,9 @@ static void emit_tiling_convert_cmd(struct intel_bb *ibb,
 	}
 
 	if (HAS_4TILE(ibb->devid))
-		tc->tc3_4.output_mocs_idx = 3;
-	else
-		tc->tc3_4.output_tiled_resource_mode = dst->tiling == I915_TILING_Yf;
+		tc->tc3_4.output_mocs_idx = IS_DG2(ibb->devid) ? 3 : 9;
+
+	tc->tc3_4.output_tiled_resource_mode = dst->tiling == I915_TILING_Yf;
 
 	reloc_delta = tc->tc3_4_l;
 
@@ -344,14 +349,12 @@ void gen12_vebox_copyfunc(struct intel_bb *ibb,
 	igt_assert(!src->format_is_yuv_semiplanar ||
 		   (src->surface[1].offset && dst->surface[1].offset));
 	emit_surface_state_cmd(ibb, VEBOX_SURFACE_INPUT,
-			       width, height, src->bpp,
-			       src->surface[0].stride,
-			       src->tiling, format, src->surface[1].offset);
+			       width, height,
+			       src, format);
 
 	emit_surface_state_cmd(ibb, VEBOX_SURFACE_OUTPUT,
-			       width, height, dst->bpp,
-			       dst->surface[0].stride,
-			       dst->tiling, format, dst->surface[1].offset);
+			       width, height,
+			       dst, format);
 
 	emit_tiling_convert_cmd(ibb, src, dst);
 
-- 
2.25.1
