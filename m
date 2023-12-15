Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA10210E990
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Dec 2023 07:42:09 +0000 (UTC)
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Subject: [PATCH i-g-t v7 5/5] tests/intel/xe_ccs: Add compression support for
 Lunarlake
Date: Fri, 15 Dec 2023 11:41:49 -0800
Message-Id: <c3a1762f09f3fe7abaa4a0fb406d661c29a20212.1702669191.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1702669191.git.akshata.jahagirdar@intel.com>
References: <cover.1702669191.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>, akshata.jahagirdar@intel.co,
 ayaz.siddiqui@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In XE2 IGFX platform only sysmem participates in compression.
So for XE2 IGFX platform, create all blt objects in sysmem itself,
For other platform, it will stay the same way as per pervious implementation.
Also update the pat-index to reflect the compression status.
Alter the range to default_alignment before vm bind/unbind operation to
align the buffer object size with page size.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 lib/xe/xe_util.c     |  2 +-
 tests/intel/xe_ccs.c | 38 ++++++++++++++++++++++++--------------
 2 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index ba8eece71..42cac9dc2 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -148,7 +148,7 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(int xe,
 		ops->flags = flags;
 		ops->obj_offset = 0;
 		ops->addr = obj->offset;
-		ops->range = obj->size;
+		ops->range = ALIGN(obj->size, xe_get_default_alignment(xe));
 		ops->prefetch_mem_region_instance = 0;
 		if (obj->pat_index == DEFAULT_PAT_INDEX)
 			ops->pat_index = intel_get_pat_idx_wb(xe);
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index ac0805017..1444b7a66 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -96,20 +96,27 @@ static void surf_copy(int xe,
 	struct blt_ctrl_surf_copy_data surf = {};
 	uint32_t bb1, bb2, ccs, ccs2, *ccsmap, *ccsmap2;
 	uint64_t bb_size, ccssize = mid->size / CCS_RATIO(xe);
+	uint64_t ccs_bo_size = xe_get_default_alignment(xe);
 	uint32_t *ccscopy;
 	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
 	uint32_t sysmem = system_memory(xe);
+	uint8_t comp_pat_index = DEFAULT_PAT_INDEX;
+	uint16_t cpu_caching = __xe_default_cpu_caching(xe, sysmem, 0);
 	int result;
 
 	igt_assert(mid->compression);
+	if (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && mid->compression) {
+		comp_pat_index  = intel_get_pat_idx_uc_comp(xe);
+		cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
+	}
 	ccscopy = (uint32_t *) malloc(ccssize);
-	ccs = xe_bo_create(xe, 0, ccssize, sysmem, 0);
-	ccs2 = xe_bo_create(xe, 0, ccssize, sysmem, 0);
+	ccs = xe_bo_create_caching(xe, 0, ccs_bo_size, sysmem, 0, cpu_caching);
+	ccs2 = xe_bo_create_caching(xe, 0, ccs_bo_size, sysmem, 0, cpu_caching);
 
 	blt_ctrl_surf_copy_init(xe, &surf);
 	surf.print_bb = param.print_bb;
 	blt_set_ctrl_surf_object(&surf.src, mid->handle, mid->region, mid->size,
-				 uc_mocs, DEFAULT_PAT_INDEX, BLT_INDIRECT_ACCESS);
+				 uc_mocs, comp_pat_index, BLT_INDIRECT_ACCESS);
 	blt_set_ctrl_surf_object(&surf.dst, ccs, sysmem, ccssize, uc_mocs,
 				 DEFAULT_PAT_INDEX, DIRECT_ACCESS);
 	bb_size = xe_get_default_alignment(xe);
@@ -157,7 +164,7 @@ static void surf_copy(int xe,
 	blt_set_ctrl_surf_object(&surf.src, ccs, sysmem, ccssize,
 				 uc_mocs, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
 	blt_set_ctrl_surf_object(&surf.dst, mid->handle, mid->region, mid->size,
-				 uc_mocs, DEFAULT_PAT_INDEX, INDIRECT_ACCESS);
+				 uc_mocs, comp_pat_index, INDIRECT_ACCESS);
 	blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
 	intel_ctx_xe_sync(ctx, true);
 
@@ -234,10 +241,10 @@ static int blt_block_copy3(int xe,
 	igt_assert_f(blt3, "block-copy3 requires data to do blit\n");
 
 	alignment = xe_get_default_alignment(xe);
-	get_offset(ahnd, blt3->src.handle, blt3->src.size, alignment);
-	get_offset(ahnd, blt3->mid.handle, blt3->mid.size, alignment);
-	get_offset(ahnd, blt3->dst.handle, blt3->dst.size, alignment);
-	get_offset(ahnd, blt3->final.handle, blt3->final.size, alignment);
+	get_offset_pat_index(ahnd, blt3->src.handle, blt3->src.size, alignment, blt3->src.pat_index);
+	get_offset_pat_index(ahnd, blt3->mid.handle, blt3->mid.size, alignment, blt3->mid.pat_index);
+	get_offset_pat_index(ahnd, blt3->dst.handle, blt3->dst.size, alignment, blt3->dst.pat_index);
+	get_offset_pat_index(ahnd, blt3->final.handle, blt3->final.size, alignment, blt3->final.pat_index);
 	bb_offset = get_offset(ahnd, blt3->bb.handle, blt3->bb.size, alignment);
 
 	/* First blit src -> mid */
@@ -291,8 +298,9 @@ static void block_copy(int xe,
 	uint64_t bb_size = xe_get_default_alignment(xe);
 	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
-	uint32_t mid_region = region2, bb;
-	uint32_t width = param.width, height = param.height;
+	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &
+							!xe_has_vram(xe)) ? region1 : region2;
+	uint32_t width = param.width, height = param.height, bb;
 	enum blt_compression mid_compression = config->compression;
 	int mid_compression_format = param.compression_format;
 	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
@@ -413,8 +421,9 @@ static void block_multicopy(int xe,
 	uint64_t bb_size = xe_get_default_alignment(xe);
 	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
-	uint32_t mid_region = region2, bb;
-	uint32_t width = param.width, height = param.height;
+	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &
+							!xe_has_vram(xe)) ? region1 : region2;
+	uint32_t width = param.width, height = param.height, bb;
 	enum blt_compression mid_compression = config->compression;
 	int mid_compression_format = param.compression_format;
 	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
@@ -539,8 +548,9 @@ static void block_copy_test(int xe,
 			region1 = igt_collection_get_value(regions, 0);
 			region2 = igt_collection_get_value(regions, 1);
 
-			/* Compressed surface must be in device memory */
-			if (config->compression && !XE_IS_VRAM_MEMORY_REGION(xe, region2))
+			/* if not XE2, then Compressed surface must be in device memory */
+			if (config->compression && !(AT_LEAST_GEN((intel_get_drm_devid(xe)), 20)) &&
+									!XE_IS_VRAM_MEMORY_REGION(xe, region2))
 				continue;
 
 			regtxt = xe_memregion_dynamic_subtest_name(xe, regions);
-- 
2.34.1
