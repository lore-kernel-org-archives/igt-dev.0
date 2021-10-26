Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA2E6E49A
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Oct 2021 21:26:24 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Wed, 27 Oct 2021 00:26:17 +0300
Message-Id: <20211026212620.2718277-2-imre.deak@intel.com>
In-Reply-To: <20211026212620.2718277-1-imre.deak@intel.com>
References: <20211026212620.2718277-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] lib/igt_fb/adlp: Remove CCS FB stride
 alignment restrictions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

As opposed to other GEN12 platforms ADLP provides a way to program the
stride of CCS surfaces independently of the main surface stride (within
the corresponding limit of the preceeding and succeeding power-of-two
values of the main surface). Using that feature we can remove the
restriction on the strides of both the main and CCS surfaces, making the
ADLP CCS FB uAPI (FB modifiers) identical to that of TGL.

Remove the stride alignment restrictions and the special casing of the
ADLP AUX pagetable setup - which was only required assuming the pre-ADLP
fixed CCS stride logic.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_fb.c            | 26 ++--------------
 lib/intel_aux_pgtable.c | 66 +++++------------------------------------
 2 files changed, 11 insertions(+), 81 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 216b1d5c4..b8b2396d3 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -761,16 +761,8 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 		/*
 		 * The CCS surface stride is
 		 *    ccs_stride = main_surface_stride_in_bytes / 512 * 64.
-		 *
-		 * On ADL_P this stride must be minimum 128 bytes corresponding
-		 * to 8 tiles on the main surface and it must be power-of-two
-		 * sized. The allocated main surface stride doesn't need to be
-		 * POT sized, which is auto-padded by the kernel to the POT size.
 		 */
-		if (IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)))
-			return roundup_power_of_two(max(min_stride, 128u));
-		else
-			return ALIGN(min_stride, 64);
+		return ALIGN(min_stride, 64);
 	} else if (!fb->modifier && is_nouveau_device(fb->fd)) {
 		int align;
 
@@ -788,20 +780,8 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 		igt_get_fb_tile_size(fb->fd, fb->modifier, fb->plane_bpp[plane],
 				     &tile_width, &tile_height);
 
-		if (is_gen12_ccs_modifier(fb->modifier)) {
-			if (IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)))
-				/*
-				 * The main surface stride must be aligned to the CCS AUX
-				 * page table block size (covered by one AUX PTE). This
-				 * block size is 64kb -> 16 tiles.
-				 * We can do away padding an 8 tile stride to 16, since in
-				 * this case one AUX PTE entry will cover 2 main surface
-				 * tile rows.
-				 */
-				tile_align = (min_stride <= 8 * tile_width) ? 8 : 16;
-			else
-				tile_align = 4;
-		}
+		if (is_gen12_ccs_modifier(fb->modifier))
+			tile_align = 4;
 
 		return ALIGN(min_stride, tile_width * tile_align);
 	}
diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
index 6346053de..f5796fdf8 100644
--- a/lib/intel_aux_pgtable.c
+++ b/lib/intel_aux_pgtable.c
@@ -7,8 +7,6 @@
 #include "intel_bufops.h"
 #include "ioctl_wrappers.h"
 
-#include "lib/intel_chipset.h"
-
 #include "i915/gem_mman.h"
 
 #define BITS_PER_LONG_LONG	(sizeof(long long) * 8)
@@ -358,70 +356,22 @@ pgt_populate_entries_for_buf(struct pgtable *pgt,
 	uint64_t aux_addr = buf->addr.offset + buf->ccs[surface_idx].offset;
 	uint64_t l1_flags = pgt_get_l1_flags(buf, surface_idx);
 	uint64_t lx_flags = pgt_get_lx_flags();
-	int surface_tile_align;
-	int surface_src_row_tiles = buf->surface[surface_idx].stride / 128;
-	/*
-	 * The span of tiles in the FB object mapped by one AUX PTE
-	 * entry, which can be one or more tile rows.
-	 */
-	int surface_src_span_tiles = ALIGN(surface_src_row_tiles, 16);
-	int surface_src_span_size = surface_src_span_tiles * 4096;
-	/*
-	 * The number of tiles in a tile row on the surface auto-padded by
-	 * the kernel if necessary (to a power-of-two size on ADL-P).
-	 */
-	int surface_dst_row_tiles;
-	/*
-	 * The span of tiles on the auto-padded surface, including the
-	 * tiles in the FB object accounted by surface_src_span_tiles and
-	 * any padding tiles.
-	 */
-	int surface_dst_span_tiles;
-	/*
-	 * The size of CCS data mapping a surface_dst_span_tiles sized area
-	 * on the main surface.
-	 */
-	int aux_dst_span_size;
-	int surface_span_offset = 0;
-	int aux_span_offset = 0;
 
-	if (IS_ALDERLAKE_P(buf->ibb->devid)) {
-		surface_tile_align = surface_src_row_tiles <= 8 ? 8 : 16;
-		surface_dst_row_tiles = roundup_power_of_two(surface_src_row_tiles);
-		surface_dst_span_tiles = roundup_power_of_two(surface_src_span_tiles);
-	} else {
-		surface_tile_align = 4;
-		surface_dst_row_tiles = surface_src_row_tiles;
-		surface_dst_span_tiles = surface_src_span_tiles;
-	}
+	igt_assert(!(buf->surface[surface_idx].stride % 512));
+	igt_assert_eq(buf->ccs[surface_idx].stride,
+		      buf->surface[surface_idx].stride / 512 * 64);
 
-	aux_dst_span_size = surface_dst_span_tiles / 16 * AUX_CCS_BLOCK_SIZE;
-
-	igt_assert_eq(buf->surface[surface_idx].stride % (128 * surface_tile_align), 0);
-	igt_assert_eq(buf->ccs[surface_idx].stride, surface_dst_row_tiles / 4 * 64);
-
-	while (surface_addr + surface_span_offset < surface_end) {
+	for (; surface_addr < surface_end;
+	     surface_addr += MAIN_SURFACE_BLOCK_SIZE,
+	     aux_addr += AUX_CCS_BLOCK_SIZE) {
 		uint64_t table = top_table;
 		int level;
 
 		for (level = pgt->levels - 1; level >= 1; level--)
 			table = pgt_get_child_table(pgt, table, level,
-						    surface_addr + surface_span_offset, lx_flags);
+						    surface_addr, lx_flags);
 
-		pgt_set_l1_entry(pgt, table,
-				 surface_addr + surface_span_offset,
-				 aux_addr + aux_span_offset, l1_flags);
-
-		surface_span_offset += MAIN_SURFACE_BLOCK_SIZE;
-		aux_span_offset += AUX_CCS_BLOCK_SIZE;
-
-		if (surface_span_offset >= surface_src_span_size) {
-			surface_addr += surface_src_span_size;
-			surface_span_offset = 0;
-
-			aux_addr += aux_dst_span_size;
-			aux_span_offset = 0;
-		}
+		pgt_set_l1_entry(pgt, table, surface_addr, aux_addr, l1_flags);
 	}
 }
 
-- 
2.27.0
