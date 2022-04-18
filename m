Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B6D10E37E
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Apr 2022 15:29:02 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
To: igt-dev <igt-dev@lists.freedesktop.org>
Date: Mon, 18 Apr 2022 20:59:54 +0530
Message-Id: <20220418152954.5327-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v10] tests/i915/gem_lmem_swapping: Add ccs
 subtests
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

Add subtests for covering the compressed object's eviction.

v2:
  gem_sync after the block_copy blit for init
v3:
  ahnd is passed in as a param [Zbigniew]
  cmd is bb [Zbigniew]
  blt src and dst sizes supposed to be same [Zbigniew]
v4:
  Use gem_create_from_pool [Zbigniew]
v5:
  Mark only blt_ctx as non-persistence [Ashutosh]
v6:
  Move the intel_allocator_open/clsoe is moved under TEST-CCS [Arjun]
  blt_ctx through intel_ctx_0 [Arjun]
v7:
  Get the blt engine for init and verify of ccs obj [Zbigniew]
v8:
  Newline for assert msg [Petri]
v9:
  free obj->blt_obj [Zbigniew]
  use intel_get_uc_mocs() [Zbigniew]
  Free tmp.
v10:
  New ctx creation for blt. [Zbigniew]
  dynamic alloc result check [Zbigniew]
  parallel-random-verify-ccs is dropped.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_lmem_swapping.c | 236 ++++++++++++++++++++++++++++++++-
 1 file changed, 229 insertions(+), 7 deletions(-)

diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 2f9f32685cd8..60588d0f6b9a 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -22,6 +22,8 @@
 #include <sys/time.h>
 #include <sys/wait.h>
 #include "drm.h"
+#include "i915/i915_blt.h"
+#include "i915/intel_mocs.h"
 
 IGT_TEST_DESCRIPTION("Exercise local memory swapping.");
 
@@ -60,6 +62,7 @@ struct params {
 #define TEST_RANDOM	(1 << 3)
 #define TEST_ENGINES	(1 << 4)
 #define TEST_MULTI	(1 << 5)
+#define TEST_CCS	(1 << 6)
 	unsigned int flags;
 	unsigned int seed;
 	bool oom_test;
@@ -69,8 +72,56 @@ struct object {
 	uint64_t size;
 	uint32_t seed;
 	uint32_t handle;
+	struct blt_copy_object *blt_obj;
 };
 
+static void set_object(struct blt_copy_object *obj,
+		       uint32_t handle, uint64_t size, uint32_t region,
+		       uint8_t mocs, enum blt_tiling tiling,
+		       enum blt_compression compression,
+		       enum blt_compression_type compression_type)
+{
+	obj->handle = handle;
+	obj->size = size;
+	obj->region = region;
+	obj->mocs = mocs;
+	obj->tiling = tiling;
+	obj->compression = compression;
+	obj->compression_type = compression_type;
+}
+
+static void set_geom(struct blt_copy_object *obj, uint32_t pitch,
+		     int16_t x1, int16_t y1, int16_t x2, int16_t y2,
+		     uint16_t x_offset, uint16_t y_offset)
+{
+	obj->pitch = pitch;
+	obj->x1 = x1;
+	obj->y1 = y1;
+	obj->x2 = x2;
+	obj->y2 = y2;
+	obj->x_offset = x_offset;
+	obj->y_offset = y_offset;
+}
+
+static void set_batch(struct blt_copy_batch *batch,
+		      uint32_t handle, uint64_t size, uint32_t region)
+{
+	batch->handle = handle;
+	batch->size = size;
+	batch->region = region;
+}
+
+static void set_object_ext(struct blt_block_copy_object_ext *obj,
+			   uint8_t compression_format,
+			   uint16_t surface_width, uint16_t surface_height,
+			   enum blt_surface_type surface_type)
+{
+	obj->compression_format = compression_format;
+	obj->surface_width = surface_width;
+	obj->surface_height = surface_height;
+	obj->surface_type = surface_type;
+}
+
 static uint32_t create_bo(int i915,
 			  uint64_t *size,
 			  struct drm_i915_gem_memory_class_instance *region,
@@ -105,6 +156,52 @@ init_object(int i915, struct object *obj, unsigned long seed, unsigned int flags
 	munmap(buf, obj->size);
 }
 
+static void
+init_object_ccs(int i915, struct object *obj, struct blt_copy_object *tmp,
+		unsigned long seed, const intel_ctx_t *ctx, uint32_t region,
+		uint64_t ahnd)
+{
+	struct blt_block_copy_data_ext ext = {}, *pext = &ext;
+	const struct intel_execution_engine2 *e;
+	struct blt_copy_data blt = {};
+	struct blt_copy_batch *cmd;
+	uint64_t size = 4096;
+	unsigned long *buf, j;
+
+	obj->seed = seed;
+	for_each_ctx_engine(i915, ctx, e) {
+		if (gem_engine_can_block_copy(i915, e))
+			break;
+	}
+	igt_assert_f(e, "Ctx don't have blt engine\n");
+
+	cmd = calloc(1, sizeof(*cmd));
+	igt_assert(cmd);
+	cmd->handle = gem_create_from_pool(i915, &size, region);
+	set_batch(cmd, cmd->handle, size, region);
+
+	buf = gem_mmap__device_coherent(i915, tmp->handle, 0, obj->size, PROT_WRITE);
+	gem_set_domain(i915, tmp->handle, I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
+
+	for (j = 0; j < obj->size / sizeof(*buf); j++)
+		buf[j] = seed++;
+	munmap(buf, obj->size);
+
+	memset(&blt, 0, sizeof(blt));
+	blt.color_depth = CD_32bit;
+
+	memcpy(&blt.src, tmp, sizeof(blt.src));
+	memcpy(&blt.dst, obj->blt_obj, sizeof(blt.dst));
+	memcpy(&blt.bb, cmd, sizeof(blt.bb));
+
+	set_object_ext(&ext.src, 0, tmp->x2, tmp->y2, SURFACE_TYPE_2D);
+	set_object_ext(&ext.dst, 0, obj->blt_obj->x2, obj->blt_obj->y2,
+		       SURFACE_TYPE_2D);
+
+	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
+	free(cmd);
+}
+
 static void
 verify_object(int i915, const struct object *obj,  unsigned int flags)
 {
@@ -125,6 +222,61 @@ verify_object(int i915, const struct object *obj,  unsigned int flags)
 	munmap(buf, obj->size);
 }
 
+static void
+verify_object_ccs(int i915, const struct object *obj,
+		  struct blt_copy_object *tmp, const intel_ctx_t *ctx,
+		  uint32_t region, uint64_t ahnd)
+{
+	struct blt_block_copy_data_ext ext = {}, *pext = &ext;
+	const struct intel_execution_engine2 *e;
+	struct blt_copy_data blt = {};
+	struct blt_copy_batch *cmd;
+	uint64_t size = 4096;
+	unsigned long j, val, *buf;
+
+	for_each_ctx_engine(i915, ctx, e) {
+		if (gem_engine_can_block_copy(i915, e))
+			break;
+	}
+	igt_assert_f(e, "Ctx don't have blt engine\n");
+
+	cmd = calloc(1, sizeof(*cmd));
+	igt_assert(cmd);
+	cmd->handle = gem_create_from_pool(i915, &size, region);
+	set_batch(cmd, cmd->handle, size, region);
+
+	memset(&blt, 0, sizeof(blt));
+	blt.color_depth = CD_32bit;
+
+	memcpy(&blt.src, obj->blt_obj, sizeof(blt.src));
+	memcpy(&blt.dst, tmp, sizeof(blt.dst));
+	memcpy(&blt.bb, cmd, sizeof(blt.bb));
+
+	blt.dst.x2 = min(obj->blt_obj->x2, tmp->x2);
+	blt.dst.y2 = min(obj->blt_obj->y2, tmp->y2);
+
+	set_object_ext(&ext.src, 0, obj->blt_obj->x2, obj->blt_obj->y2,
+		       SURFACE_TYPE_2D);
+	set_object_ext(&ext.dst, 0, tmp->x2, tmp->y2, SURFACE_TYPE_2D);
+	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
+
+	buf = gem_mmap__device_coherent(i915, tmp->handle, 0,
+					obj->size, PROT_READ);
+	gem_set_domain(i915, tmp->handle, I915_GEM_DOMAIN_WC, 0);
+
+	for (j = 0; j < obj->size / PAGE_SIZE; j++) {
+		unsigned long x = (j * PAGE_SIZE + rand() % PAGE_SIZE) / sizeof(*buf);
+
+		val = obj->seed + x;
+		igt_assert_f(buf[x] == val,
+			     "Object mismatch at offset %lu - found %lx, expected %lx, difference:%lx!\n",
+			     x * sizeof(*buf), buf[x], val, buf[x] ^ val);
+	}
+
+	munmap(buf, obj->size);
+	free(cmd);
+}
+
 static void move_to_lmem(int i915,
 			 const intel_ctx_t *ctx,
 			 struct object *list,
@@ -173,13 +325,27 @@ static void __do_evict(int i915,
 						    region->memory_instance);
 	const unsigned int max_swap_in = params->count / 100 + 1;
 	struct object *objects, *obj, *list;
+	const uint32_t bpp = 32;
+	uint32_t width, height, stride;
+	const intel_ctx_t *blt_ctx;
+	struct blt_copy_object *tmp;
 	unsigned int engine = 0;
 	unsigned int i, l;
-	uint64_t size;
+	uint64_t size, ahnd;
 	struct timespec t = {};
 	unsigned int num;
 
-	size = 4096;
+	width = PAGE_SIZE / (bpp / 8);
+	height = params->size.max / (bpp / 8) /  width;
+	stride = width * 4;
+
+	if (params->flags & TEST_CCS) {
+		tmp = calloc(1, sizeof(*tmp));
+		igt_assert(tmp);
+
+		blt_ctx = intel_ctx_create(i915, &ctx->cfg);
+		__gem_context_set_persistence(i915, blt_ctx->id, false);
+	}
 
 	objects = calloc(params->count, sizeof(*objects));
 	igt_assert(objects);
@@ -190,6 +356,20 @@ static void __do_evict(int i915,
 	srand(seed);
 
 	/* Create the initial working set of objects. */
+	if (params->flags & TEST_CCS) {
+		ahnd = intel_allocator_open_full(i915, blt_ctx->id, 0, 0,
+						 INTEL_ALLOCATOR_SIMPLE,
+						 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+
+		tmp->handle = gem_create_in_memory_regions(i915, params->size.max,
+				   INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0));
+		set_object(tmp, tmp->handle, params->size.max,
+			   INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0),
+			   intel_get_uc_mocs(i915), T_LINEAR,
+			   COMPRESSION_DISABLED, COMPRESSION_TYPE_3D);
+		set_geom(tmp, stride, 0, 0, width, height, 0, 0);
+	}
+
 	size = 0;
 	for (i = 0, obj = objects; i < params->count; i++, obj++) {
 		if (params->flags & TEST_RANDOM)
@@ -199,6 +379,7 @@ static void __do_evict(int i915,
 		else
 			obj->size = params->size.min;
 
+		obj->size = ALIGN(obj->size, 4096);
 		size += obj->size;
 		if ((size >> 20) > params->mem_limit) {
 			params->count = i;
@@ -206,10 +387,27 @@ static void __do_evict(int i915,
 		}
 		obj->handle = create_bo(i915, &obj->size, region, params->oom_test);
 
-		move_to_lmem(i915, ctx, objects + i, 1, region_id, engine,
-			     params->oom_test);
-		if (params->flags & TEST_VERIFY)
+		if (params->flags & TEST_CCS) {
+			width = PAGE_SIZE / (bpp / 8);
+			height = obj->size / (bpp / 8) /  width;
+			stride = width * 4;
+
+			obj->blt_obj = calloc(1, sizeof(*obj->blt_obj));
+			igt_assert(obj->blt_obj);
+			set_object(obj->blt_obj, obj->handle, obj->size, region_id,
+				   intel_get_uc_mocs(i915), T_LINEAR,
+				   COMPRESSION_ENABLED, COMPRESSION_TYPE_3D);
+			set_geom(obj->blt_obj, stride, 0, 0, width, height, 0, 0);
+			init_object_ccs(i915, obj, tmp, rand(), blt_ctx,
+					region_id, ahnd);
+		} else if (params->flags & TEST_VERIFY) {
 			init_object(i915, obj, rand(), params->flags);
+			move_to_lmem(i915, ctx, objects + i, 1, region_id, engine,
+				     params->oom_test);
+		} else {
+			move_to_lmem(i915, ctx, objects + i, 1, region_id, engine,
+				     params->oom_test);
+		}
 	}
 
 	igt_debug("obj size min/max=%lu %s/%lu %s, count=%u, seed: %u\n",
@@ -237,7 +435,15 @@ static void __do_evict(int i915,
 		if (params->flags & TEST_ENGINES)
 			engine = (engine + 1) % __num_engines__;
 
-		if (params->flags & TEST_VERIFY) {
+		if (params->flags & TEST_CCS) {
+			for (i = 0; i < num; i++)
+				verify_object_ccs(i915, &list[i], tmp,
+						  blt_ctx, region_id, ahnd);
+			/* Update random object - may swap it back in. */
+			i = rand() % params->count;
+			init_object_ccs(i915, &objects[i], tmp, rand(),
+					blt_ctx, region_id, ahnd);
+		} else if (params->flags & TEST_VERIFY) {
 			for (i = 0; i < num; i++)
 				verify_object(i915, &list[i], params->flags);
 
@@ -247,11 +453,20 @@ static void __do_evict(int i915,
 		}
 	}
 
-	for (i = 0; i < params->count; i++)
+	for (i = 0; i < params->count; i++) {
 		gem_close(i915, objects[i].handle);
+		free(objects[i].blt_obj);
+	}
 
 	free(list);
 	free(objects);
+
+	if (params->flags & TEST_CCS) {
+		gem_close(i915, tmp->handle);
+		free(tmp);
+		intel_ctx_destroy(i915, blt_ctx);
+		put_ahnd(ahnd);
+	}
 }
 
 static void fill_params(int i915, struct params *params,
@@ -353,6 +568,9 @@ static void test_evict(int i915,
 	const unsigned int nproc = sysconf(_SC_NPROCESSORS_ONLN) + 1;
 	struct params params;
 
+	if (flags & TEST_CCS)
+		igt_require(IS_DG2(intel_get_drm_devid(i915)));
+
 	fill_params(i915, &params, region, flags, nproc, false);
 
 	if (flags & TEST_PARALLEL) {
@@ -525,6 +743,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		{ "parallel-random-engines", TEST_PARALLEL | TEST_RANDOM | TEST_ENGINES },
 		{ "parallel-random-verify", TEST_PARALLEL | TEST_RANDOM | TEST_VERIFY },
 		{ "parallel-multi", TEST_PARALLEL | TEST_RANDOM | TEST_VERIFY | TEST_ENGINES | TEST_MULTI },
+		{ "verify-ccs", TEST_CCS },
+		{ "verify-random-ccs", TEST_CCS | TEST_RANDOM },
+		{ "heavy-verify-random-ccs", TEST_CCS | TEST_RANDOM | TEST_HEAVY },
+		{ "heavy-verify-multi-ccs", TEST_CCS | TEST_RANDOM | TEST_HEAVY | TEST_ENGINES | TEST_MULTI },
 		{ }
 	};
 	const intel_ctx_t *ctx;
-- 
2.20.1
