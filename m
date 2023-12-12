Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF1710E16D
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 05:39:46 +0000 (UTC)
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Subject: [PATCH i-g-t v5 6/6] tests/intel/xe_ccs: Add compression support for
 Lunarlake
Date: Tue, 12 Dec 2023 09:39:28 -0800
Message-Id: <afdf39527e8ef0e2a6ec39f7c9dfabdc42698c2a.1702402592.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1702402592.git.akshata.jahagirdar@intel.com>
References: <cover.1702402592.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ayaz.siddiqui@intel.com,
 akshata.jahagirdar@intel.com, matthew.auld@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In XE2 IGFX platform, sysmem also participates in compression.
So create all blt objects in sysmem itself, and update the pat-index to reflect
the compression status. Since we need to align the buffer object size with page
size and also have the src size and dst size of CCS copy to be equal,
change the default width and height to 1024.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 tests/intel/xe_ccs.c | 45 +++++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 77d3020bc..23fda5ed3 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -63,8 +63,8 @@ static struct param {
 	.write_png = false,
 	.print_bb = false,
 	.print_surface_info = false,
-	.width = 512,
-	.height = 512,
+	.width = 1024,
+	.height = 1024,
 };
 
 struct test_config {
@@ -95,21 +95,27 @@ static void surf_copy(int xe,
 	struct blt_block_copy_data_ext ext = {};
 	struct blt_ctrl_surf_copy_data surf = {};
 	uint32_t bb1, bb2, ccs, ccs2, *ccsmap, *ccsmap2;
-	uint64_t bb_size, ccssize = mid->size / CCS_RATIO;
+	uint64_t bb_size, ccssize = mid->size / (CCS_RATIO(xe));
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
+	ccs = xe_bo_create_caching(xe, 0, ccssize, sysmem, 0, cpu_caching);
+	ccs2 = xe_bo_create_caching(xe, 0, ccssize, sysmem, 0, cpu_caching);
 
 	blt_ctrl_surf_copy_init(xe, &surf);
 	surf.print_bb = param.print_bb;
 	blt_set_ctrl_surf_object(&surf.src, mid->handle, mid->region, mid->size,
-				 uc_mocs, DEFAULT_PAT_INDEX, BLT_INDIRECT_ACCESS);
+				 uc_mocs, comp_pat_index, BLT_INDIRECT_ACCESS);
 	blt_set_ctrl_surf_object(&surf.dst, ccs, sysmem, ccssize, uc_mocs,
 				 DEFAULT_PAT_INDEX, DIRECT_ACCESS);
 	bb_size = xe_get_default_alignment(xe);
@@ -157,7 +163,7 @@ static void surf_copy(int xe,
 	blt_set_ctrl_surf_object(&surf.src, ccs, sysmem, ccssize,
 				 uc_mocs, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
 	blt_set_ctrl_surf_object(&surf.dst, mid->handle, mid->region, mid->size,
-				 uc_mocs, DEFAULT_PAT_INDEX, INDIRECT_ACCESS);
+				 uc_mocs, comp_pat_index, INDIRECT_ACCESS);
 	blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
 	intel_ctx_xe_sync(ctx, true);
 
@@ -234,10 +240,10 @@ static int blt_block_copy3(int xe,
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
@@ -291,8 +297,8 @@ static void block_copy(int xe,
 	uint64_t bb_size = xe_get_default_alignment(xe);
 	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
-	uint32_t mid_region = region2, bb;
-	uint32_t width = param.width, height = param.height;
+	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) & !xe_has_vram(xe)) ? region1 : region2;
+	uint32_t width = param.width, height = param.height, bb;
 	enum blt_compression mid_compression = config->compression;
 	int mid_compression_format = param.compression_format;
 	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
@@ -413,8 +419,8 @@ static void block_multicopy(int xe,
 	uint64_t bb_size = xe_get_default_alignment(xe);
 	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
-	uint32_t mid_region = region2, bb;
-	uint32_t width = param.width, height = param.height;
+	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) & !xe_has_vram(xe)) ? region1 : region2;
+	uint32_t width = param.width, height = param.height, bb;
 	enum blt_compression mid_compression = config->compression;
 	int mid_compression_format = param.compression_format;
 	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
@@ -539,8 +545,9 @@ static void block_copy_test(int xe,
 			region1 = igt_collection_get_value(regions, 0);
 			region2 = igt_collection_get_value(regions, 1);
 
-			/* Compressed surface must be in device memory */
-			if (config->compression && !XE_IS_VRAM_MEMORY_REGION(xe, region2))
+			/* if not XE2, then Compressed surface must be in device memory */
+			if (config->compression && !(AT_LEAST_GEN((intel_get_drm_devid(xe)), 20)) &&
+									!XE_IS_VRAM_MEMORY_REGION(xe, region2))
 				continue;
 
 			regtxt = xe_memregion_dynamic_subtest_name(xe, regions);
@@ -621,8 +628,8 @@ const char *help_str =
 	"  -p\tWrite PNG\n"
 	"  -s\tPrint surface info\n"
 	"  -t\tTiling format (0 - linear, 1 - XMAJOR, 2 - YMAJOR, 3 - TILE4, 4 - TILE64)\n"
-	"  -W\tWidth (default 512)\n"
-	"  -H\tHeight (default 512)"
+	"  -W\tWidth (default 1024)\n"
+	"  -H\tHeight (default 1024)"
 	;
 
 igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
-- 
2.34.1
