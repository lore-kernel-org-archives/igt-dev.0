Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572E710E711
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 07:57:08 +0000 (UTC)
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
To: 
Date: Wed,  8 Nov 2023 11:57:06 -0800
Message-Id: <33c7095ed8806c063820ced708f36659cc401779.1699473138.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1699473138.git.akshata.jahagirdar@intel.com>
References: <cover.1699473138.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] XE2: xe_ccs IGT changes to enable xe2
 igfx compression
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ayaz.siddiqui@intel.com, "Jahagirdar,
 Akshata" <akshata.jahagirdar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

---
 lib/intel_blt.c       | 18 ++++++++++--------
 lib/intel_blt.h       |  3 ++-
 lib/intel_chipset.h   |  1 +
 lib/intel_pat.c       | 12 +++++++++++-
 lib/intel_pat.h       |  1 +
 tests/intel/gem_ccs.c |  2 +-
 tests/intel/xe_ccs.c  | 37 ++++++++++++++++++-------------------
 7 files changed, 44 insertions(+), 30 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index c0593930c..c60d9fb1e 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -948,15 +948,16 @@ int blt_block_copy(int fd,
 	return ret;
 }
 
-static uint16_t __ccs_size(const struct blt_ctrl_surf_copy_data *surf)
+static uint16_t __ccs_size(int fd, const struct blt_ctrl_surf_copy_data *surf)
 {
 	uint32_t src_size, dst_size;
+	uint16_t ccsratio = CCS_RATIO(fd);
 
 	src_size = surf->src.access_type == DIRECT_ACCESS ?
-				surf->src.size : surf->src.size / CCS_RATIO;
+				surf->src.size : surf->src.size / ccsratio;
 
 	dst_size = surf->dst.access_type == DIRECT_ACCESS ?
-				surf->dst.size : surf->dst.size / CCS_RATIO;
+				surf->dst.size : surf->dst.size / ccsratio;
 
 	igt_assert_f(src_size <= dst_size, "dst size must be >= src size for CCS copy\n");
 
@@ -1136,7 +1137,7 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 		data.xe2.dw00.dst_access_type = surf->dst.access_type;
 
 		/* Ensure dst has size capable to keep src ccs aux */
-		data.xe2.dw00.size_of_ctrl_copy = __ccs_size(surf) / CCS_RATIO - 1;
+		data.xe2.dw00.size_of_ctrl_copy = __ccs_size(fd, surf) / NUM_4KPAGES_OF_CCS - 1;
 		data.xe2.dw00.length = 0x3;
 
 		data.xe2.dw01.src_address_lo = src_offset;
@@ -1155,7 +1156,7 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 		data.gen12.dw00.dst_access_type = surf->dst.access_type;
 
 		/* Ensure dst has size capable to keep src ccs aux */
-		data.gen12.dw00.size_of_ctrl_copy = __ccs_size(surf) / CCS_RATIO - 1;
+		data.gen12.dw00.size_of_ctrl_copy = __ccs_size(fd,surf) / (CCS_RATIO(fd)) - 1;
 		data.gen12.dw00.length = 0x3;
 
 		data.gen12.dw01.src_address_lo = src_offset;
@@ -1794,7 +1795,8 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
 	uint64_t size = width * height * bpp / 8;
 	uint32_t stride = tiling == T_LINEAR ? width * 4 : width;
 	uint32_t handle;
-
+	uint8_t pat_index = compression ? intel_get_pat_idx_uc_comp(blt->fd) : intel_get_pat_idx_uc(blt->fd);
+	uint16_t cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 	igt_assert_f(blt->driver, "Driver isn't set, have you called blt_copy_init()?\n");
 
 	obj = calloc(1, sizeof(*obj));
@@ -1808,13 +1810,13 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
 			flags |= XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
 
 		size = ALIGN(size, xe_get_default_alignment(blt->fd));
-		handle = xe_bo_create_flags(blt->fd, 0, size, flags);
+		handle = xe_bo_create_caching(blt->fd, 0, size, region, cpu_caching);
 	} else {
 		igt_assert(__gem_create_in_memory_regions(blt->fd, &handle,
 							  &size, region) == 0);
 	}
 
-	blt_set_object(obj, handle, size, region, mocs_index, DEFAULT_PAT_INDEX, tiling,
+	blt_set_object(obj, handle, size, region, mocs_index, pat_index, tiling,
 		       compression, compression_type);
 	blt_set_geom(obj, stride, 0, 0, width, height, 0, 0);
 
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 5934ccd67..222c44074 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -52,7 +52,8 @@
 #include "igt.h"
 #include "intel_cmds_info.h"
 
-#define CCS_RATIO 256
+#define CCS_RATIO(xe) IS_XE2(intel_get_drm_devid(xe)) ? 512 : 256
+#define NUM_4KPAGES_OF_CCS 8
 
 enum blt_color_depth {
 	CD_8bit,
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 1edc8e92c..aca429a97 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -205,6 +205,7 @@ void intel_check_pch(void);
 #define IS_METEORLAKE(devid)	(intel_get_device_info(devid)->is_meteorlake)
 #define IS_PONTEVECCHIO(devid)	(intel_get_device_info(devid)->is_pontevecchio)
 #define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
+#define IS_XE2(devid)		(intel_get_device_info(devid)->graphics_ver >= 20)
 
 #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
 #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 2b892ee52..ccda6b786 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -11,7 +11,7 @@ struct intel_pat_cache {
 	uint8_t uc; /* UC + COH_NONE */
 	uint8_t wt; /* WT + COH_NONE */
 	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
-
+	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION*/
 	uint8_t max_index;
 };
 
@@ -23,6 +23,7 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 		pat->uc = 3;
 		pat->wt = 15; /* Compressed + WB-transient */
 		pat->wb = 2;
+		pat->uc_comp = 12; /* Compressed + UC */
 		pat->max_index = 31;
 	} else if (IS_METEORLAKE(dev_id)) {
 		pat->uc = 2;
@@ -60,6 +61,15 @@ uint8_t intel_get_pat_idx_uc(int fd)
 	return pat.uc;
 }
 
+uint8_t intel_get_pat_idx_uc_comp(int fd)
+{
+	struct intel_pat_cache pat = {};
+	uint16_t dev_id = intel_get_drm_devid(fd);
+	
+	intel_get_pat_idx(fd, &pat);
+	return (intel_get_device_info(dev_id)->graphics_ver == 20) ? pat.uc_comp : pat.uc;
+}
+
 uint8_t intel_get_pat_idx_wt(int fd)
 {
 	struct intel_pat_cache pat = {};
diff --git a/lib/intel_pat.h b/lib/intel_pat.h
index c24dbc275..6d68b9fc2 100644
--- a/lib/intel_pat.h
+++ b/lib/intel_pat.h
@@ -13,6 +13,7 @@
 uint8_t intel_get_max_pat_index(int fd);
 
 uint8_t intel_get_pat_idx_uc(int fd);
+uint8_t intel_get_pat_idx_uc_comp(int fd);
 uint8_t intel_get_pat_idx_wt(int fd);
 uint8_t intel_get_pat_idx_wb(int fd);
 
diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
index 0a691778d..5a17be4cb 100644
--- a/tests/intel/gem_ccs.c
+++ b/tests/intel/gem_ccs.c
@@ -99,7 +99,7 @@ static void surf_copy(int i915,
 	struct blt_block_copy_data_ext ext = {};
 	struct blt_ctrl_surf_copy_data surf = {};
 	uint32_t bb1, bb2, ccs, ccs2, *ccsmap, *ccsmap2;
-	uint64_t bb_size, ccssize = mid->size / CCS_RATIO;
+	uint64_t bb_size, ccssize = mid->size / (CCS_RATIO(i915));
 	uint32_t *ccscopy;
 	uint8_t uc_mocs = intel_get_uc_mocs_index(i915);
 	int result;
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 647a6bd2e..f6695f4c0 100644
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
@@ -95,7 +95,8 @@ static void surf_copy(int xe,
 	struct blt_block_copy_data_ext ext = {};
 	struct blt_ctrl_surf_copy_data surf = {};
 	uint32_t bb1, bb2, ccs, ccs2, *ccsmap, *ccsmap2;
-	uint64_t bb_size, ccssize = mid->size / CCS_RATIO;
+	uint64_t ccsratio = CCS_RATIO(xe);
+	uint64_t bb_size, ccssize = mid->size / ccsratio;
 	uint32_t *ccscopy;
 	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
 	uint32_t sysmem = system_memory(xe);
@@ -103,13 +104,13 @@ static void surf_copy(int xe,
 
 	igt_assert(mid->compression);
 	ccscopy = (uint32_t *) malloc(ccssize);
-	ccs = xe_bo_create_flags(xe, 0, ccssize, sysmem);
-	ccs2 = xe_bo_create_flags(xe, 0, ccssize, sysmem);
+	ccs = xe_bo_create_caching(xe, 0, ccssize, sysmem, DRM_XE_GEM_CPU_CACHING_WC);
+	ccs2 = xe_bo_create_caching(xe, 0, ccssize, sysmem, DRM_XE_GEM_CPU_CACHING_WC);
 
 	blt_ctrl_surf_copy_init(xe, &surf);
 	surf.print_bb = param.print_bb;
 	blt_set_ctrl_surf_object(&surf.src, mid->handle, mid->region, mid->size,
-				 uc_mocs, DEFAULT_PAT_INDEX, BLT_INDIRECT_ACCESS);
+				 uc_mocs, intel_get_pat_idx_uc_comp(xe), BLT_INDIRECT_ACCESS);
 	blt_set_ctrl_surf_object(&surf.dst, ccs, sysmem, ccssize, uc_mocs,
 				 DEFAULT_PAT_INDEX, DIRECT_ACCESS);
 	bb_size = xe_get_default_alignment(xe);
@@ -157,7 +158,7 @@ static void surf_copy(int xe,
 	blt_set_ctrl_surf_object(&surf.src, ccs, sysmem, ccssize,
 				 uc_mocs, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
 	blt_set_ctrl_surf_object(&surf.dst, mid->handle, mid->region, mid->size,
-				 uc_mocs, DEFAULT_PAT_INDEX, INDIRECT_ACCESS);
+				 uc_mocs, intel_get_pat_idx_uc_comp(xe), INDIRECT_ACCESS);
 	blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
 	intel_ctx_xe_sync(ctx, true);
 
@@ -234,10 +235,6 @@ static int blt_block_copy3(int xe,
 	igt_assert_f(blt3, "block-copy3 requires data to do blit\n");
 
 	alignment = xe_get_default_alignment(xe);
-	get_offset(ahnd, blt3->src.handle, blt3->src.size, alignment);
-	get_offset(ahnd, blt3->mid.handle, blt3->mid.size, alignment);
-	get_offset(ahnd, blt3->dst.handle, blt3->dst.size, alignment);
-	get_offset(ahnd, blt3->final.handle, blt3->final.size, alignment);
 	bb_offset = get_offset(ahnd, blt3->bb.handle, blt3->bb.size, alignment);
 
 	/* First blit src -> mid */
@@ -284,6 +281,7 @@ static void block_copy(int xe,
 		       enum blt_tiling_type mid_tiling,
 		       const struct test_config *config)
 {
+	bool is_dgfx = is_xe_device(xe) & xe_has_vram(xe) ;
 	struct blt_copy_data blt = {};
 	struct blt_block_copy_data_ext ext = {}, *pext = &ext;
 	struct blt_copy_object *src, *mid, *dst;
@@ -291,8 +289,8 @@ static void block_copy(int xe,
 	uint64_t bb_size = xe_get_default_alignment(xe);
 	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
-	uint32_t mid_region = region2, bb;
-	uint32_t width = param.width, height = param.height;
+	uint32_t mid_region = (IS_XE2(intel_get_drm_devid(xe)) & !is_dgfx) ? region1 : region2;
+	uint32_t width = param.width, height = param.height, bb;
 	enum blt_compression mid_compression = config->compression;
 	int mid_compression_format = param.compression_format;
 	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
@@ -405,6 +403,7 @@ static void block_multicopy(int xe,
 			    enum blt_tiling_type mid_tiling,
 			    const struct test_config *config)
 {
+	bool is_dgfx = is_xe_device(xe) & xe_has_vram(xe) ;
 	struct blt_copy3_data blt3 = {};
 	struct blt_copy_data blt = {};
 	struct blt_block_copy3_data_ext ext3 = {}, *pext3 = &ext3;
@@ -413,8 +412,8 @@ static void block_multicopy(int xe,
 	uint64_t bb_size = xe_get_default_alignment(xe);
 	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
-	uint32_t mid_region = region2, bb;
-	uint32_t width = param.width, height = param.height;
+	uint32_t mid_region = (IS_XE2(intel_get_drm_devid(xe)) & !is_dgfx) ? region1 : region2;
+	uint32_t width = param.width, height = param.height, bb;
 	enum blt_compression mid_compression = config->compression;
 	int mid_compression_format = param.compression_format;
 	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
@@ -539,8 +538,8 @@ static void block_copy_test(int xe,
 			region1 = igt_collection_get_value(regions, 0);
 			region2 = igt_collection_get_value(regions, 1);
 
-			/* Compressed surface must be in device memory */
-			if (config->compression && !XE_IS_VRAM_MEMORY_REGION(xe, region2))
+			/* if not XE2, then Compressed surface must be in device memory */
+			if (config->compression && !(IS_XE2((intel_get_drm_devid(xe)))) && !XE_IS_VRAM_MEMORY_REGION(xe, region2))
 				continue;
 
 			regtxt = xe_memregion_dynamic_subtest_name(xe, regions);
@@ -621,8 +620,8 @@ const char *help_str =
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
