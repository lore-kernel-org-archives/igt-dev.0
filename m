Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C925310E421
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 06:06:48 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  6 Jul 2023 08:05:51 +0200
Message-Id: <20230706060555.282757-13-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230706060555.282757-1-zbigniew.kempczynski@intel.com>
References: <20230706060555.282757-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 12/16] lib/intel_blt: Introduce
 blt_copy_init() helper to cache driver
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

Instead of calling is_xe_device() and is_i915_device() multiple
times in code which distincs xe and i915 paths add driver field
to structures used in blitter library.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_fb.c                   |  2 +-
 lib/intel_blt.c                | 40 +++++++++++++++++++++++++++++++---
 lib/intel_blt.h                |  8 ++++++-
 tests/i915/gem_ccs.c           | 34 ++++++++++++++++-------------
 tests/i915/gem_exercise_blt.c  | 22 ++++++++++---------
 tests/i915/gem_lmem_swapping.c |  4 ++--
 6 files changed, 78 insertions(+), 32 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index a8988274f2..1814e8db11 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2900,7 +2900,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
 			src = blt_fb_init(src_fb, i, mem_region);
 			dst = blt_fb_init(dst_fb, i, mem_region);
 
-			memset(&blt, 0, sizeof(blt));
+			blt_copy_init(src_fb->fd, &blt);
 			blt.color_depth = blt_get_bpp(src_fb);
 			blt_set_copy_object(&blt.src, src);
 			blt_set_copy_object(&blt.dst, dst);
diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index bc28f15e8d..f2f86e4947 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -692,6 +692,22 @@ static void dump_bb_ext(struct gen12_block_copy_data_ext *data)
 		 data->dw21.src_array_index);
 }
 
+/**
+ * blt_copy_init:
+ * @fd: drm fd
+ * @blt: structure for initialization
+ *
+ * Function is zeroing @blt and sets fd and driver fields (INTEL_DRIVER_I915 or
+ * INTEL_DRIVER_XE).
+ */
+void blt_copy_init(int fd, struct blt_copy_data *blt)
+{
+	memset(blt, 0, sizeof(*blt));
+
+	blt->fd = fd;
+	blt->driver = get_intel_driver(fd);
+}
+
 /**
  * emit_blt_block_copy:
  * @fd: drm fd
@@ -889,6 +905,22 @@ static void dump_bb_surf_ctrl_cmd(const struct gen12_ctrl_surf_copy_data *data)
 		 cmd[4], data->dw04.dst_address_hi, data->dw04.dst_mocs);
 }
 
+/**
+ * blt_ctrl_surf_copy_init:
+ * @fd: drm fd
+ * @surf: structure for initialization
+ *
+ * Function is zeroing @surf and sets fd and driver fields (INTEL_DRIVER_I915 or
+ * INTEL_DRIVER_XE).
+ */
+void blt_ctrl_surf_copy_init(int fd, struct blt_ctrl_surf_copy_data *surf)
+{
+	memset(surf, 0, sizeof(*surf));
+
+	surf->fd = fd;
+	surf->driver = get_intel_driver(fd);
+}
+
 /**
  * emit_blt_ctrl_surf_copy:
  * @fd: drm fd
@@ -1317,7 +1349,7 @@ void blt_set_batch(struct blt_copy_batch *batch,
 }
 
 struct blt_copy_object *
-blt_create_object(int fd, uint32_t region,
+blt_create_object(const struct blt_copy_data *blt, uint32_t region,
 		  uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs,
 		  enum blt_tiling_type tiling,
 		  enum blt_compression compression,
@@ -1329,10 +1361,12 @@ blt_create_object(int fd, uint32_t region,
 	uint32_t stride = tiling == T_LINEAR ? width * 4 : width;
 	uint32_t handle;
 
+	igt_assert_f(blt->driver, "Driver isn't set, have you called blt_copy_init()?\n");
+
 	obj = calloc(1, sizeof(*obj));
 
 	obj->size = size;
-	igt_assert(__gem_create_in_memory_regions(fd, &handle,
+	igt_assert(__gem_create_in_memory_regions(blt->fd, &handle,
 						  &size, region) == 0);
 
 	blt_set_object(obj, handle, size, region, mocs, tiling,
@@ -1340,7 +1374,7 @@ blt_create_object(int fd, uint32_t region,
 	blt_set_geom(obj, stride, 0, 0, width, height, 0, 0);
 
 	if (create_mapping)
-		obj->ptr = gem_mmap__device_coherent(fd, handle, 0, size,
+		obj->ptr = gem_mmap__device_coherent(blt->fd, handle, 0, size,
 						     PROT_READ | PROT_WRITE);
 
 	return obj;
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 9c4ddc7a89..7516ce8ac7 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -102,6 +102,7 @@ struct blt_copy_batch {
 /* Common for block-copy and fast-copy */
 struct blt_copy_data {
 	int fd;
+	enum intel_driver driver;
 	struct blt_copy_object src;
 	struct blt_copy_object dst;
 	struct blt_copy_batch bb;
@@ -155,6 +156,7 @@ struct blt_ctrl_surf_copy_object {
 
 struct blt_ctrl_surf_copy_data {
 	int fd;
+	enum intel_driver driver;
 	struct blt_ctrl_surf_copy_object src;
 	struct blt_ctrl_surf_copy_object dst;
 	struct blt_copy_batch bb;
@@ -185,6 +187,8 @@ bool blt_uses_extended_block_copy(int fd);
 
 const char *blt_tiling_name(enum blt_tiling_type tiling);
 
+void blt_copy_init(int fd, struct blt_copy_data *blt);
+
 uint64_t emit_blt_block_copy(int fd,
 			     uint64_t ahnd,
 			     const struct blt_copy_data *blt,
@@ -205,6 +209,8 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 				 uint64_t bb_pos,
 				 bool emit_bbe);
 
+void blt_ctrl_surf_copy_init(int fd, struct blt_ctrl_surf_copy_data *surf);
+
 int blt_ctrl_surf_copy(int fd,
 		       const intel_ctx_t *ctx,
 		       const struct intel_execution_engine2 *e,
@@ -230,7 +236,7 @@ void blt_set_batch(struct blt_copy_batch *batch,
 		   uint32_t handle, uint64_t size, uint32_t region);
 
 struct blt_copy_object *
-blt_create_object(int fd, uint32_t region,
+blt_create_object(const struct blt_copy_data *blt, uint32_t region,
 		  uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs,
 		  enum blt_tiling_type tiling,
 		  enum blt_compression compression,
diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
index f9ad9267df..d9d785ed9b 100644
--- a/tests/i915/gem_ccs.c
+++ b/tests/i915/gem_ccs.c
@@ -167,7 +167,7 @@ static void surf_copy(int i915,
 	ccs = gem_create(i915, ccssize);
 	ccs2 = gem_create(i915, ccssize);
 
-	surf.fd = i915;
+	blt_ctrl_surf_copy_init(i915, &surf);
 	surf.print_bb = param.print_bb;
 	set_surf_object(&surf.src, mid->handle, mid->region, mid->size,
 			uc_mocs, BLT_INDIRECT_ACCESS);
@@ -219,7 +219,7 @@ static void surf_copy(int i915,
 			uc_mocs, INDIRECT_ACCESS);
 	blt_ctrl_surf_copy(i915, ctx, e, ahnd, &surf);
 
-	memset(&blt, 0, sizeof(blt));
+	blt_copy_init(i915, &blt);
 	blt.color_depth = CD_32bit;
 	blt.print_bb = param.print_bb;
 	blt_set_copy_object(&blt.src, mid);
@@ -310,7 +310,7 @@ static int blt_block_copy3(int i915,
 	bb_offset = get_offset(ahnd, blt3->bb.handle, blt3->bb.size, alignment);
 
 	/* First blit src -> mid */
-	memset(&blt0, 0, sizeof(blt0));
+	blt_copy_init(i915, &blt0);
 	blt0.src = blt3->src;
 	blt0.dst = blt3->mid;
 	blt0.bb = blt3->bb;
@@ -321,7 +321,7 @@ static int blt_block_copy3(int i915,
 	bb_pos = emit_blt_block_copy(i915, ahnd, &blt0, &ext0, bb_pos, false);
 
 	/* Second blit mid -> dst */
-	memset(&blt0, 0, sizeof(blt0));
+	blt_copy_init(i915, &blt0);
 	blt0.src = blt3->mid;
 	blt0.dst = blt3->dst;
 	blt0.bb = blt3->bb;
@@ -332,7 +332,7 @@ static int blt_block_copy3(int i915,
 	bb_pos = emit_blt_block_copy(i915, ahnd, &blt0, &ext0, bb_pos, false);
 
 	/* Third blit dst -> final */
-	memset(&blt0, 0, sizeof(blt0));
+	blt_copy_init(i915, &blt0);
 	blt0.src = blt3->dst;
 	blt0.dst = blt3->final;
 	blt0.bb = blt3->bb;
@@ -390,11 +390,13 @@ static void block_copy(int i915,
 	if (!blt_uses_extended_block_copy(i915))
 		pext = NULL;
 
-	src = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
+	blt_copy_init(i915, &blt);
+
+	src = blt_create_object(&blt, region1, width, height, bpp, uc_mocs,
 				T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
-	mid = blt_create_object(i915, mid_region, width, height, bpp, uc_mocs,
+	mid = blt_create_object(&blt, mid_region, width, height, bpp, uc_mocs,
 				mid_tiling, mid_compression, comp_type, true);
-	dst = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
+	dst = blt_create_object(&blt, region1, width, height, bpp, uc_mocs,
 				T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
 	igt_assert(src->size == dst->size);
 	PRINT_SURFACE_INFO("src", src);
@@ -404,7 +406,6 @@ static void block_copy(int i915,
 	blt_surface_fill_rect(i915, src, width, height);
 	WRITE_PNG(i915, run_id, "src", src, width, height);
 
-	memset(&blt, 0, sizeof(blt));
 	blt.color_depth = CD_32bit;
 	blt.print_bb = param.print_bb;
 	blt_set_copy_object(&blt.src, src);
@@ -449,7 +450,7 @@ static void block_copy(int i915,
 		}
 	}
 
-	memset(&blt, 0, sizeof(blt));
+	blt_copy_init(i915, &blt);
 	blt.color_depth = CD_32bit;
 	blt.print_bb = param.print_bb;
 	blt_set_copy_object(&blt.src, mid);
@@ -486,6 +487,7 @@ static void block_multicopy(int i915,
 			    const struct test_config *config)
 {
 	struct blt_copy3_data blt3 = {};
+	struct blt_copy_data blt = {};
 	struct blt_block_copy3_data_ext ext3 = {}, *pext3 = &ext3;
 	struct blt_copy_object *src, *mid, *dst, *final;
 	const uint32_t bpp = 32;
@@ -505,13 +507,16 @@ static void block_multicopy(int i915,
 	if (!blt_uses_extended_block_copy(i915))
 		pext3 = NULL;
 
-	src = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
+	/* For object creation */
+	blt_copy_init(i915, &blt);
+
+	src = blt_create_object(&blt, region1, width, height, bpp, uc_mocs,
 				T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
-	mid = blt_create_object(i915, mid_region, width, height, bpp, uc_mocs,
+	mid = blt_create_object(&blt, mid_region, width, height, bpp, uc_mocs,
 				mid_tiling, mid_compression, comp_type, true);
-	dst = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
+	dst = blt_create_object(&blt, region1, width, height, bpp, uc_mocs,
 				mid_tiling, COMPRESSION_DISABLED, comp_type, true);
-	final = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
+	final = blt_create_object(&blt, region1, width, height, bpp, uc_mocs,
 				  T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
 	igt_assert(src->size == dst->size);
 	PRINT_SURFACE_INFO("src", src);
@@ -521,7 +526,6 @@ static void block_multicopy(int i915,
 
 	blt_surface_fill_rect(i915, src, width, height);
 
-	memset(&blt3, 0, sizeof(blt3));
 	blt3.color_depth = CD_32bit;
 	blt3.print_bb = param.print_bb;
 	blt_set_copy_object(&blt3.src, src);
diff --git a/tests/i915/gem_exercise_blt.c b/tests/i915/gem_exercise_blt.c
index 0cd1820430..7355eabbe9 100644
--- a/tests/i915/gem_exercise_blt.c
+++ b/tests/i915/gem_exercise_blt.c
@@ -89,7 +89,7 @@ static int fast_copy_one_bb(int i915,
 	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
 
 	/* First blit */
-	memset(&blt_tmp, 0, sizeof(blt_tmp));
+	blt_copy_init(i915, &blt_tmp);
 	blt_tmp.src = blt->src;
 	blt_tmp.dst = blt->mid;
 	blt_tmp.bb = blt->bb;
@@ -98,7 +98,7 @@ static int fast_copy_one_bb(int i915,
 	bb_pos = emit_blt_fast_copy(i915, ahnd, &blt_tmp, bb_pos, false);
 
 	/* Second blit */
-	memset(&blt_tmp, 0, sizeof(blt_tmp));
+	blt_copy_init(i915, &blt_tmp);
 	blt_tmp.src = blt->mid;
 	blt_tmp.dst = blt->dst;
 	blt_tmp.bb = blt->bb;
@@ -140,6 +140,7 @@ static void fast_copy_emit(int i915, const intel_ctx_t *ctx,
 			   uint32_t region1, uint32_t region2,
 			   enum blt_tiling_type mid_tiling)
 {
+	struct blt_copy_data bltinit = {};
 	struct blt_fast_copy_data blt = {};
 	struct blt_copy_object *src, *mid, *dst;
 	const uint32_t bpp = 32;
@@ -152,11 +153,12 @@ static void fast_copy_emit(int i915, const intel_ctx_t *ctx,
 
 	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
 
-	src = blt_create_object(i915, region1, width, height, bpp, 0,
+	blt_copy_init(i915, &bltinit);
+	src = blt_create_object(&bltinit, region1, width, height, bpp, 0,
 				T_LINEAR, COMPRESSION_DISABLED, 0, true);
-	mid = blt_create_object(i915, region2, width, height, bpp, 0,
+	mid = blt_create_object(&bltinit, region2, width, height, bpp, 0,
 				mid_tiling, COMPRESSION_DISABLED, 0, true);
-	dst = blt_create_object(i915, region1, width, height, bpp, 0,
+	dst = blt_create_object(&bltinit, region1, width, height, bpp, 0,
 				T_LINEAR, COMPRESSION_DISABLED, 0, true);
 	igt_assert(src->size == dst->size);
 
@@ -212,17 +214,17 @@ static void fast_copy(int i915, const intel_ctx_t *ctx,
 
 	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
 
-	src = blt_create_object(i915, region1, width, height, bpp, 0,
+	blt_copy_init(i915, &blt);
+	src = blt_create_object(&blt, region1, width, height, bpp, 0,
 				T_LINEAR, COMPRESSION_DISABLED, 0, true);
-	mid = blt_create_object(i915, region2, width, height, bpp, 0,
+	mid = blt_create_object(&blt, region2, width, height, bpp, 0,
 				mid_tiling, COMPRESSION_DISABLED, 0, true);
-	dst = blt_create_object(i915, region1, width, height, bpp, 0,
+	dst = blt_create_object(&blt, region1, width, height, bpp, 0,
 				T_LINEAR, COMPRESSION_DISABLED, 0, true);
 	igt_assert(src->size == dst->size);
 
 	blt_surface_fill_rect(i915, src, width, height);
 
-	memset(&blt, 0, sizeof(blt));
 	blt.color_depth = CD_32bit;
 	blt.print_bb = param.print_bb;
 	blt_set_copy_object(&blt.src, src);
@@ -235,7 +237,7 @@ static void fast_copy(int i915, const intel_ctx_t *ctx,
 	WRITE_PNG(i915, mid_tiling, "src", &blt.src, width, height);
 	WRITE_PNG(i915, mid_tiling, "mid", &blt.dst, width, height);
 
-	memset(&blt, 0, sizeof(blt));
+	blt_copy_init(i915, &blt);
 	blt.color_depth = CD_32bit;
 	blt.print_bb = param.print_bb;
 	blt_set_copy_object(&blt.src, mid);
diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 83dbebec83..2921de8f9f 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -308,7 +308,7 @@ init_object_ccs(int i915, struct object *obj, struct blt_copy_object *tmp,
 		buf[j] = seed++;
 	munmap(buf, obj->size);
 
-	memset(&blt, 0, sizeof(blt));
+	blt_copy_init(i915, &blt);
 	blt.color_depth = CD_32bit;
 
 	memcpy(&blt.src, tmp, sizeof(blt.src));
@@ -366,7 +366,7 @@ verify_object_ccs(int i915, const struct object *obj,
 	cmd->handle = gem_create_from_pool(i915, &size, region);
 	blt_set_batch(cmd, cmd->handle, size, region);
 
-	memset(&blt, 0, sizeof(blt));
+	blt_copy_init(i915, &blt);
 	blt.color_depth = CD_32bit;
 
 	memcpy(&blt.src, obj->blt_obj, sizeof(blt.src));
-- 
2.34.1
