Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B9B10E978
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 17:47:30 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  2 Nov 2023 17:46:53 +0000
Message-ID: <20231102174700.298135-9-matthew.auld@intel.com>
In-Reply-To: <20231102174700.298135-1-matthew.auld@intel.com>
References: <20231102174700.298135-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 08/15] lib/intel_blt: support pat_index
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

For the most part we can just use the default wb, however some users
including display might want to use something else.

v2 (Zbigniew):
  - Fix the formatting slightly.
v3:
  - Rebase on mem_object changes.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_fb.c                    |  2 +
 lib/intel_blt.c                 | 77 +++++++++++++++++++++------------
 lib/intel_blt.h                 | 12 +++--
 tests/intel/gem_ccs.c           | 16 ++++---
 tests/intel/gem_lmem_swapping.c |  4 +-
 tests/intel/xe_ccs.c            | 19 ++++----
 tests/intel/xe_copy_basic.c     |  9 ++--
 7 files changed, 88 insertions(+), 51 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index ad0148339..e8f46534e 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -37,6 +37,7 @@
 #include "i915/gem_mman.h"
 #include "intel_blt.h"
 #include "intel_mocs.h"
+#include "intel_pat.h"
 #include "igt_aux.h"
 #include "igt_color_encoding.h"
 #include "igt_fb.h"
@@ -2768,6 +2769,7 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
 
 	blt_set_object(blt, handle, fb->size, memregion,
 		       intel_get_uc_mocs_index(fb->fd),
+		       intel_get_pat_idx_uc(fb->fd),
 		       blt_tile,
 		       is_ccs_modifier(fb->modifier) ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
 		       is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 5b682c2b6..679b10700 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -14,6 +14,7 @@
 #include "igt_syncobj.h"
 #include "intel_blt.h"
 #include "intel_mocs.h"
+#include "intel_pat.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
@@ -849,10 +850,12 @@ uint64_t emit_blt_block_copy(int fd,
 	igt_assert_f(blt, "block-copy requires data to do blit\n");
 
 	alignment = get_default_alignment(fd, blt->driver);
-	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment)
-		     + blt->src.plane_offset;
-	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment)
-		     + blt->dst.plane_offset;
+	src_offset = get_offset_pat_index(ahnd, blt->src.handle, blt->src.size,
+					  alignment, blt->src.pat_index);
+	src_offset += blt->src.plane_offset;
+	dst_offset = get_offset_pat_index(ahnd, blt->dst.handle, blt->dst.size,
+					  alignment, blt->dst.pat_index);
+	dst_offset += blt->dst.plane_offset;
 	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
 
 	fill_data(&data, blt, src_offset, dst_offset, ext, ip_ver);
@@ -923,8 +926,10 @@ int blt_block_copy(int fd,
 	igt_assert_neq(blt->driver, 0);
 
 	alignment = get_default_alignment(fd, blt->driver);
-	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment);
-	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment);
+	src_offset = get_offset_pat_index(ahnd, blt->src.handle, blt->src.size,
+					  alignment, blt->src.pat_index);
+	dst_offset = get_offset_pat_index(ahnd, blt->dst.handle, blt->dst.size,
+					  alignment, blt->dst.pat_index);
 	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
 
 	emit_blt_block_copy(fd, ahnd, blt, ext, 0, true);
@@ -1128,8 +1133,10 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 	igt_assert_f(surf, "ctrl-surf-copy requires data to do ctrl-surf-copy blit\n");
 
 	alignment = max_t(uint64_t, get_default_alignment(fd, surf->driver), 1ull << 16);
-	src_offset = get_offset(ahnd, surf->src.handle, surf->src.size, alignment);
-	dst_offset = get_offset(ahnd, surf->dst.handle, surf->dst.size, alignment);
+	src_offset = get_offset_pat_index(ahnd, surf->src.handle, surf->src.size,
+					  alignment, surf->src.pat_index);
+	dst_offset = get_offset_pat_index(ahnd, surf->dst.handle, surf->dst.size,
+					  alignment, surf->dst.pat_index);
 	bb_offset = get_offset(ahnd, surf->bb.handle, surf->bb.size, alignment);
 
 	if (ip_ver >= IP_VER(20, 0)) {
@@ -1230,8 +1237,10 @@ int blt_ctrl_surf_copy(int fd,
 	igt_assert_neq(surf->driver, 0);
 
 	alignment = max_t(uint64_t, get_default_alignment(fd, surf->driver), 1ull << 16);
-	src_offset = get_offset(ahnd, surf->src.handle, surf->src.size, alignment);
-	dst_offset = get_offset(ahnd, surf->dst.handle, surf->dst.size, alignment);
+	src_offset = get_offset_pat_index(ahnd, surf->src.handle, surf->src.size,
+					  alignment, surf->src.pat_index);
+	dst_offset = get_offset_pat_index(ahnd, surf->dst.handle, surf->dst.size,
+					  alignment, surf->dst.pat_index);
 	bb_offset = get_offset(ahnd, surf->bb.handle, surf->bb.size, alignment);
 
 	emit_blt_ctrl_surf_copy(fd, ahnd, surf, 0, true);
@@ -1470,10 +1479,12 @@ uint64_t emit_blt_fast_copy(int fd,
 	data.dw03.dst_x2 = blt->dst.x2;
 	data.dw03.dst_y2 = blt->dst.y2;
 
-	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment)
-		     + blt->src.plane_offset;
-	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment)
-		     + blt->dst.plane_offset;
+	src_offset = get_offset_pat_index(ahnd, blt->src.handle, blt->src.size,
+					  alignment, blt->src.pat_index);
+	src_offset += blt->src.plane_offset;
+	dst_offset = get_offset_pat_index(ahnd, blt->dst.handle, blt->dst.size, alignment,
+					  blt->dst.pat_index);
+	dst_offset += blt->dst.plane_offset;
 	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
 
 	data.dw04.dst_address_lo = dst_offset;
@@ -1547,8 +1558,10 @@ int blt_fast_copy(int fd,
 	igt_assert_neq(blt->driver, 0);
 
 	alignment = get_default_alignment(fd, blt->driver);
-	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment);
-	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment);
+	src_offset = get_offset_pat_index(ahnd, blt->src.handle, blt->src.size,
+					  alignment, blt->src.pat_index);
+	dst_offset = get_offset_pat_index(ahnd, blt->dst.handle, blt->dst.size,
+					  alignment, blt->dst.pat_index);
 	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
 
 	emit_blt_fast_copy(fd, ahnd, blt, 0, true);
@@ -1603,8 +1616,10 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
 	uint32_t optype;
 
 	alignment = get_default_alignment(fd, mem->driver);
-	src_offset = get_offset(ahnd, mem->src.handle, mem->src.size, alignment);
-	dst_offset = get_offset(ahnd, mem->dst.handle, mem->dst.size, alignment);
+	src_offset = get_offset_pat_index(ahnd, mem->src.handle, mem->src.size,
+					  alignment, mem->src.pat_index);
+	dst_offset = get_offset_pat_index(ahnd, mem->dst.handle, mem->dst.size,
+					  alignment, mem->dst.pat_index);
 
 	batch = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
 	optype = mem->src.type == M_MATRIX ? 1 << 17 : 0;
@@ -1649,8 +1664,10 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
 	int ret;
 
 	alignment = get_default_alignment(fd, mem->driver);
-	src_offset = get_offset(ahnd, mem->src.handle, mem->src.size, alignment);
-	dst_offset = get_offset(ahnd, mem->dst.handle, mem->dst.size, alignment);
+	src_offset = get_offset_pat_index(ahnd, mem->src.handle, mem->src.size,
+					  alignment, mem->src.pat_index);
+	dst_offset = get_offset_pat_index(ahnd, mem->dst.handle, mem->dst.size,
+					  alignment, mem->dst.pat_index);
 	bb_offset = get_offset(ahnd, mem->bb.handle, mem->bb.size, alignment);
 
 	emit_blt_mem_copy(fd, ahnd, mem);
@@ -1690,7 +1707,8 @@ static void emit_blt_mem_set(int fd, uint64_t ahnd, const struct blt_mem_data *m
 	uint32_t value;
 
 	alignment = get_default_alignment(fd, mem->driver);
-	dst_offset = get_offset(ahnd, mem->dst.handle, mem->dst.size, alignment);
+	dst_offset = get_offset_pat_index(ahnd, mem->dst.handle, mem->dst.size,
+					  alignment, mem->dst.pat_index);
 
 	batch = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
 	value = (uint32_t)fill_data << 24;
@@ -1733,7 +1751,8 @@ int blt_mem_set(int fd, const intel_ctx_t *ctx,
 	int ret;
 
 	alignment = get_default_alignment(fd, mem->driver);
-	dst_offset = get_offset(ahnd, mem->dst.handle, mem->dst.size, alignment);
+	dst_offset = get_offset_pat_index(ahnd, mem->dst.handle, mem->dst.size,
+					  alignment, mem->dst.pat_index);
 	bb_offset = get_offset(ahnd, mem->bb.handle, mem->bb.size, alignment);
 
 	emit_blt_mem_set(fd, ahnd, mem, fill_data);
@@ -1813,7 +1832,7 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
 							  &size, region) == 0);
 	}
 
-	blt_set_object(obj, handle, size, region, mocs_index, tiling,
+	blt_set_object(obj, handle, size, region, mocs_index, DEFAULT_PAT_INDEX, tiling,
 		       compression, compression_type);
 	blt_set_geom(obj, stride, 0, 0, width, height, 0, 0);
 
@@ -1847,7 +1866,7 @@ void blt_destroy_object_and_alloc_free(int fd, uint64_t ahnd,
 
 void blt_set_object(struct blt_copy_object *obj,
 		    uint32_t handle, uint64_t size, uint32_t region,
-		    uint8_t mocs_index, enum blt_tiling_type tiling,
+		    uint8_t mocs_index, uint8_t pat_index, enum blt_tiling_type tiling,
 		    enum blt_compression compression,
 		    enum blt_compression_type compression_type)
 {
@@ -1855,6 +1874,7 @@ void blt_set_object(struct blt_copy_object *obj,
 	obj->size = size;
 	obj->region = region;
 	obj->mocs_index = mocs_index;
+	obj->pat_index = pat_index;
 	obj->tiling = tiling;
 	obj->compression = compression;
 	obj->compression_type = compression_type;
@@ -1863,13 +1883,14 @@ void blt_set_object(struct blt_copy_object *obj,
 void blt_set_mem_object(struct blt_mem_object *obj,
 			uint32_t handle, uint64_t size, uint32_t pitch,
 			uint32_t width, uint32_t height, uint32_t region,
-			uint8_t mocs_index, enum blt_memop_type type,
-			enum blt_compression compression)
+			uint8_t mocs_index, uint8_t pat_index,
+			enum blt_memop_type type, enum blt_compression compression)
 {
 	obj->handle = handle;
 	obj->region = region;
 	obj->size = size;
 	obj->mocs_index = mocs_index;
+	obj->pat_index = pat_index;
 	obj->type = type;
 	obj->compression = compression;
 	obj->width = width;
@@ -1899,12 +1920,14 @@ void blt_set_copy_object(struct blt_copy_object *obj,
 
 void blt_set_ctrl_surf_object(struct blt_ctrl_surf_copy_object *obj,
 			      uint32_t handle, uint32_t region, uint64_t size,
-			      uint8_t mocs_index, enum blt_access_type access_type)
+			      uint8_t mocs_index, uint8_t pat_index,
+			      enum blt_access_type access_type)
 {
 	obj->handle = handle;
 	obj->region = region;
 	obj->size = size;
 	obj->mocs_index = mocs_index;
+	obj->pat_index = pat_index;
 	obj->access_type = access_type;
 }
 
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 118bfe3cd..5934ccd67 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -79,6 +79,7 @@ struct blt_copy_object {
 	uint32_t region;
 	uint64_t size;
 	uint8_t mocs_index;
+	uint8_t pat_index;
 	enum blt_tiling_type tiling;
 	enum blt_compression compression;  /* BC only */
 	enum blt_compression_type compression_type; /* BC only */
@@ -98,6 +99,7 @@ struct blt_mem_object {
 	uint32_t region;
 	uint64_t size;
 	uint8_t mocs_index;
+	uint8_t pat_index;
 	enum blt_memop_type type;
 	enum blt_compression compression;
 	uint32_t width;
@@ -172,6 +174,7 @@ struct blt_ctrl_surf_copy_object {
 	uint32_t region;
 	uint64_t size;
 	uint8_t mocs_index;
+	uint8_t pat_index;
 	enum blt_access_type access_type;
 };
 
@@ -281,15 +284,15 @@ void blt_destroy_object_and_alloc_free(int fd, uint64_t ahnd,
 				       struct blt_copy_object *obj);
 void blt_set_object(struct blt_copy_object *obj,
 		    uint32_t handle, uint64_t size, uint32_t region,
-		    uint8_t mocs_index, enum blt_tiling_type tiling,
+		    uint8_t mocs_index, uint8_t pat_index, enum blt_tiling_type tiling,
 		    enum blt_compression compression,
 		    enum blt_compression_type compression_type);
 
 void blt_set_mem_object(struct blt_mem_object *obj,
 			uint32_t handle, uint64_t size, uint32_t pitch,
 			uint32_t width, uint32_t height, uint32_t region,
-			uint8_t mocs_index, enum blt_memop_type type,
-			enum blt_compression compression);
+			uint8_t mocs_index, uint8_t pat_index,
+			enum blt_memop_type type, enum blt_compression compression);
 
 void blt_set_object_ext(struct blt_block_copy_object_ext *obj,
 			uint8_t compression_format,
@@ -299,7 +302,8 @@ void blt_set_copy_object(struct blt_copy_object *obj,
 			 const struct blt_copy_object *orig);
 void blt_set_ctrl_surf_object(struct blt_ctrl_surf_copy_object *obj,
 			      uint32_t handle, uint32_t region, uint64_t size,
-			      uint8_t mocs_index, enum blt_access_type access_type);
+			      uint8_t mocs_index, uint8_t pat_index,
+			      enum blt_access_type access_type);
 
 void blt_surface_info(const char *info,
 		      const struct blt_copy_object *obj);
diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
index ed149ef9e..0a691778d 100644
--- a/tests/intel/gem_ccs.c
+++ b/tests/intel/gem_ccs.c
@@ -15,6 +15,7 @@
 #include "lib/intel_chipset.h"
 #include "intel_blt.h"
 #include "intel_mocs.h"
+#include "intel_pat.h"
 /**
  * TEST: gem ccs
  * Description: Exercise gen12 blitter with and without flatccs compression
@@ -111,9 +112,9 @@ static void surf_copy(int i915,
 	blt_ctrl_surf_copy_init(i915, &surf);
 	surf.print_bb = param.print_bb;
 	blt_set_ctrl_surf_object(&surf.src, mid->handle, mid->region, mid->size,
-				 uc_mocs, BLT_INDIRECT_ACCESS);
+				 uc_mocs, DEFAULT_PAT_INDEX, BLT_INDIRECT_ACCESS);
 	blt_set_ctrl_surf_object(&surf.dst, ccs, REGION_SMEM, ccssize,
-				 uc_mocs, DIRECT_ACCESS);
+				 uc_mocs, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
 	bb_size = 4096;
 	igt_assert_eq(__gem_create(i915, &bb_size, &bb1), 0);
 	blt_set_batch(&surf.bb, bb1, bb_size, REGION_SMEM);
@@ -133,7 +134,7 @@ static void surf_copy(int i915,
 		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
 
 		blt_set_ctrl_surf_object(&surf.dst, ccs2, REGION_SMEM, ccssize,
-					 0, DIRECT_ACCESS);
+					 0, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
 		blt_ctrl_surf_copy(i915, ctx, e, ahnd, &surf);
 		gem_sync(i915, surf.dst.handle);
 
@@ -155,9 +156,9 @@ static void surf_copy(int i915,
 	for (int i = 0; i < surf.dst.size / sizeof(uint32_t); i++)
 		ccsmap[i] = i;
 	blt_set_ctrl_surf_object(&surf.src, ccs, REGION_SMEM, ccssize,
-				 uc_mocs, DIRECT_ACCESS);
+				 uc_mocs, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
 	blt_set_ctrl_surf_object(&surf.dst, mid->handle, mid->region, mid->size,
-				 uc_mocs, INDIRECT_ACCESS);
+				 uc_mocs, DEFAULT_PAT_INDEX, INDIRECT_ACCESS);
 	blt_ctrl_surf_copy(i915, ctx, e, ahnd, &surf);
 
 	blt_copy_init(i915, &blt);
@@ -399,7 +400,8 @@ static void block_copy(int i915,
 	blt_set_object_ext(&ext.dst, 0, width, height, SURFACE_TYPE_2D);
 	if (config->inplace) {
 		blt_set_object(&blt.dst, mid->handle, dst->size, mid->region, 0,
-			       T_LINEAR, COMPRESSION_DISABLED, comp_type);
+			       DEFAULT_PAT_INDEX, T_LINEAR, COMPRESSION_DISABLED,
+			       comp_type);
 		blt.dst.ptr = mid->ptr;
 	}
 
@@ -475,7 +477,7 @@ static void block_multicopy(int i915,
 
 	if (config->inplace) {
 		blt_set_object(&blt3.dst, mid->handle, dst->size, mid->region,
-			       mid->mocs_index, mid_tiling, COMPRESSION_DISABLED,
+			       mid->mocs_index, DEFAULT_PAT_INDEX, mid_tiling, COMPRESSION_DISABLED,
 			       comp_type);
 		blt3.dst.ptr = mid->ptr;
 	}
diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
index 6aed80629..381510f1a 100644
--- a/tests/intel/gem_lmem_swapping.c
+++ b/tests/intel/gem_lmem_swapping.c
@@ -485,7 +485,7 @@ static void __do_evict(int i915,
 				   INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0));
 		blt_set_object(tmp, tmp->handle, params->size.max,
 			       INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0),
-			       intel_get_uc_mocs_index(i915), T_LINEAR,
+			       intel_get_uc_mocs_index(i915), 0, T_LINEAR,
 			       COMPRESSION_DISABLED, COMPRESSION_TYPE_3D);
 		blt_set_geom(tmp, stride, 0, 0, width, height, 0, 0);
 	}
@@ -515,7 +515,7 @@ static void __do_evict(int i915,
 			obj->blt_obj = calloc(1, sizeof(*obj->blt_obj));
 			igt_assert(obj->blt_obj);
 			blt_set_object(obj->blt_obj, obj->handle, obj->size, region_id,
-				       intel_get_uc_mocs_index(i915), T_LINEAR,
+				       intel_get_uc_mocs_index(i915), 0, T_LINEAR,
 				       COMPRESSION_ENABLED, COMPRESSION_TYPE_3D);
 			blt_set_geom(obj->blt_obj, stride, 0, 0, width, height, 0, 0);
 			init_object_ccs(i915, obj, tmp, rand(), blt_ctx,
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 876c239e4..647a6bd2e 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -13,6 +13,7 @@
 #include "igt_syncobj.h"
 #include "intel_blt.h"
 #include "intel_mocs.h"
+#include "intel_pat.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
@@ -108,8 +109,9 @@ static void surf_copy(int xe,
 	blt_ctrl_surf_copy_init(xe, &surf);
 	surf.print_bb = param.print_bb;
 	blt_set_ctrl_surf_object(&surf.src, mid->handle, mid->region, mid->size,
-				 uc_mocs, BLT_INDIRECT_ACCESS);
-	blt_set_ctrl_surf_object(&surf.dst, ccs, sysmem, ccssize, uc_mocs, DIRECT_ACCESS);
+				 uc_mocs, DEFAULT_PAT_INDEX, BLT_INDIRECT_ACCESS);
+	blt_set_ctrl_surf_object(&surf.dst, ccs, sysmem, ccssize, uc_mocs,
+				 DEFAULT_PAT_INDEX, DIRECT_ACCESS);
 	bb_size = xe_get_default_alignment(xe);
 	bb1 = xe_bo_create_flags(xe, 0, bb_size, sysmem);
 	blt_set_batch(&surf.bb, bb1, bb_size, sysmem);
@@ -130,7 +132,7 @@ static void surf_copy(int xe,
 		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
 
 		blt_set_ctrl_surf_object(&surf.dst, ccs2, system_memory(xe), ccssize,
-					 0, DIRECT_ACCESS);
+					 0, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
 		blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
 		intel_ctx_xe_sync(ctx, true);
 
@@ -153,9 +155,9 @@ static void surf_copy(int xe,
 	for (int i = 0; i < surf.dst.size / sizeof(uint32_t); i++)
 		ccsmap[i] = i;
 	blt_set_ctrl_surf_object(&surf.src, ccs, sysmem, ccssize,
-				 uc_mocs, DIRECT_ACCESS);
+				 uc_mocs, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
 	blt_set_ctrl_surf_object(&surf.dst, mid->handle, mid->region, mid->size,
-				 uc_mocs, INDIRECT_ACCESS);
+				 uc_mocs, DEFAULT_PAT_INDEX, INDIRECT_ACCESS);
 	blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
 	intel_ctx_xe_sync(ctx, true);
 
@@ -369,7 +371,8 @@ static void block_copy(int xe,
 	blt_set_object_ext(&ext.dst, 0, width, height, SURFACE_TYPE_2D);
 	if (config->inplace) {
 		blt_set_object(&blt.dst, mid->handle, dst->size, mid->region, 0,
-			       T_LINEAR, COMPRESSION_DISABLED, comp_type);
+			       DEFAULT_PAT_INDEX, T_LINEAR, COMPRESSION_DISABLED,
+			       comp_type);
 		blt.dst.ptr = mid->ptr;
 	}
 
@@ -450,8 +453,8 @@ static void block_multicopy(int xe,
 
 	if (config->inplace) {
 		blt_set_object(&blt3.dst, mid->handle, dst->size, mid->region,
-			       mid->mocs_index, mid_tiling, COMPRESSION_DISABLED,
-			       comp_type);
+			       mid->mocs_index, DEFAULT_PAT_INDEX, mid_tiling,
+			       COMPRESSION_DISABLED, comp_type);
 		blt3.dst.ptr = mid->ptr;
 	}
 
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index fe78ac50f..2e2485dd8 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -11,6 +11,7 @@
 #include "intel_blt.h"
 #include "lib/intel_cmds_info.h"
 #include "lib/intel_mocs.h"
+#include "lib/intel_pat.h"
 #include "lib/intel_reg.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
@@ -56,9 +57,11 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
 
 	blt_mem_init(fd, &mem);
 	blt_set_mem_object(&mem.src, src_handle, size, 0, width, height,
-			   region, src_mocs, M_LINEAR, COMPRESSION_DISABLED);
+			   region, src_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
+			   COMPRESSION_DISABLED);
 	blt_set_mem_object(&mem.dst, dst_handle, size, 0, width, height,
-			   region, dst_mocs, M_LINEAR, COMPRESSION_DISABLED);
+			   region, dst_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
+			   COMPRESSION_DISABLED);
 	mem.src.ptr = xe_bo_map(fd, src_handle, size);
 	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
 
@@ -105,7 +108,7 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
 	bb = xe_bo_create_flags(fd, 0, bb_size, region);
 	blt_mem_init(fd, &mem);
 	blt_set_mem_object(&mem.dst, dst_handle, size, 0, width, height, region,
-			   dst_mocs, M_LINEAR, COMPRESSION_DISABLED);
+			   dst_mocs, DEFAULT_PAT_INDEX, M_LINEAR, COMPRESSION_DISABLED);
 	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
 	blt_set_batch(&mem.bb, bb, bb_size, region);
 	blt_mem_set(fd, ctx, NULL, ahnd, &mem, fill_data);
-- 
2.41.0
