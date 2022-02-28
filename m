Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79E910E6C0
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Feb 2022 19:51:12 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
To: igt-dev <igt-dev@lists.freedesktop.org>
Date: Tue,  1 Mar 2022 01:21:30 +0530
Message-Id: <20220228195130.18127-4-ramalingam.c@intel.com>
In-Reply-To: <20220228195130.18127-1-ramalingam.c@intel.com>
References: <20220228195130.18127-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/i915/gem_lmem_swapping: ccs
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

Subtests for covering the compressed object's eviction are added.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 tests/i915/gem_lmem_swapping.c | 217 ++++++++++++++++++++++++++++++++-
 1 file changed, 212 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 39f9e1f536dd..220f6713a377 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -22,6 +22,7 @@
 #include <sys/time.h>
 #include <sys/wait.h>
 #include "drm.h"
+#include "i915/i915_blt.h"
 
 IGT_TEST_DESCRIPTION("Exercise local memory swapping.");
 
@@ -30,6 +31,7 @@ IGT_TEST_DESCRIPTION("Exercise local memory swapping.");
 
 #define PAGE_SIZE  (1ULL << 12)
 #define SZ_64K	   (16 * PAGE_SIZE)
+#define DG2_MOCS   (2 << 1)
 
 static const char *readable_unit(uint64_t size)
 {
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
 			  uint64_t size,
 			  struct drm_i915_gem_memory_class_instance *region,
@@ -105,6 +156,51 @@ init_object(int i915, struct object *obj, unsigned long seed, unsigned int flags
 	munmap(buf, obj->size);
 }
 
+#define BATCH_SIZE		4096
+static void
+init_object_ccs(int i915, struct object *obj, struct blt_copy_object *tmp,
+		struct blt_copy_object *cmd, unsigned long seed,
+		unsigned int flags, const intel_ctx_t *ctx, uint32_t region)
+{
+	uint64_t ahnd = intel_allocator_open_full(i915, ctx->id, 0, 0,
+						  INTEL_ALLOCATOR_SIMPLE,
+						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+	struct blt_block_copy_data_ext ext = {}, *pext = &ext;
+	const struct intel_execution_engine2 *e;
+	struct blt_copy_data blt = {};
+	unsigned long *buf, j;
+
+	obj->seed = seed;
+
+	for_each_ctx_engine(i915, ctx, e) {
+		igt_assert_f(gem_engine_can_block_copy(i915, e),
+			     "Ctx dont have Blt engine");
+		break;
+	}
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
+
+	set_object_ext(&ext.src, 0, tmp->x2, tmp->y2, SURFACE_TYPE_2D);
+	set_object_ext(&ext.dst, 0, obj->blt_obj->x2, obj->blt_obj->y2,
+		       SURFACE_TYPE_2D);
+
+	set_batch(&blt.bb, cmd->handle, BATCH_SIZE, region);
+	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
+
+	put_ahnd(ahnd);
+}
+
 static void
 verify_object(int i915, const struct object *obj,  unsigned int flags)
 {
@@ -125,6 +221,56 @@ verify_object(int i915, const struct object *obj,  unsigned int flags)
 	munmap(buf, obj->size);
 }
 
+static void
+verify_object_ccs(int i915, const struct object *obj,
+		  struct blt_copy_object *tmp,
+		  struct blt_copy_object *cmd, unsigned int flags,
+		  const intel_ctx_t *ctx, uint32_t region)
+{
+	uint64_t ahnd = intel_allocator_open_full(i915, ctx->id, 0, 0,
+						  INTEL_ALLOCATOR_SIMPLE,
+						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+	struct blt_block_copy_data_ext ext = {}, *pext = &ext;
+	const struct intel_execution_engine2 *e;
+	struct blt_copy_data blt = {};
+	unsigned long j, val, *buf;
+
+	for_each_ctx_engine(i915, ctx, e) {
+		igt_assert_f(gem_engine_can_block_copy(i915, e),
+			     "ctx dont have Blt engine");
+		break;
+	}
+
+	memset(&blt, 0, sizeof(blt));
+	blt.color_depth = CD_32bit;
+
+	memcpy(&blt.src, obj->blt_obj, sizeof(blt.src));
+	memcpy(&blt.dst, tmp, sizeof(blt.dst));
+
+	set_object_ext(&ext.src, 0, obj->blt_obj->x2, obj->blt_obj->y2,
+		       SURFACE_TYPE_2D);
+	set_object_ext(&ext.dst, 0, tmp->x2, tmp->y2, SURFACE_TYPE_2D);
+	set_batch(&blt.bb, cmd->handle, BATCH_SIZE, region);
+
+	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
+	put_ahnd(ahnd);
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
+}
+
 static void move_to_lmem(int i915,
 			 struct object *list,
 			 unsigned int num,
@@ -160,22 +306,36 @@ static void __do_evict(int i915,
 		       struct params *params,
 		       unsigned int seed)
 {
+	uint32_t region_id = INTEL_MEMORY_REGION_ID(region->memory_class,
+						    region->memory_instance);
 	const unsigned int max_swap_in = params->count / 100 + 1;
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct object *objects, *obj, *list;
-	uint32_t batch;
+	const uint32_t bpp = 32;
+	uint32_t batch, width, height, stride;
+	const intel_ctx_t *blt_ctx;
+	struct blt_copy_object *tmp, *cmd;
 	unsigned int engine = 0;
 	unsigned int i, l;
 	uint64_t size;
 	struct timespec t = {};
 	unsigned int num;
 
+	width = PAGE_SIZE / (bpp / 8);
+	height = params->size.max / (bpp / 8) /  width;
+	stride = width * 4;
+
+	tmp = calloc(1, sizeof(*tmp));
+	cmd = calloc(1, sizeof(*cmd));
+
 	__gem_context_set_persistence(i915, 0, false);
 	size = 4096;
 	batch = create_bo(i915, size, region, params->oom_test);
-
 	gem_write(i915, batch, 0, &bbe, sizeof(bbe));
 
+	if (params->flags & TEST_CCS)
+		blt_ctx = intel_ctx_create_for_engine(i915, I915_ENGINE_CLASS_COPY, 0);
+
 	objects = calloc(params->count, sizeof(*objects));
 	igt_assert(objects);
 
@@ -185,6 +345,18 @@ static void __do_evict(int i915,
 	srand(seed);
 
 	/* Create the initial working set of objects. */
+	if (params->flags & TEST_CCS) {
+		tmp->handle = gem_create_in_memory_regions(i915, params->size.max,
+						   INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0));
+		set_object(tmp, tmp->handle, params->size.max,
+			   INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0), DG2_MOCS,
+			   T_LINEAR, COMPRESSION_DISABLED, COMPRESSION_TYPE_3D);
+		set_geom(tmp, stride, 0, 0, width, height, 0, 0);
+		cmd->handle = gem_create_in_memory_regions(i915, BATCH_SIZE, region_id);
+		set_object(cmd, cmd->handle, BATCH_SIZE, region_id, DG2_MOCS,
+			   T_LINEAR, COMPRESSION_DISABLED, COMPRESSION_TYPE_3D);
+	}
+
 	size = 0;
 	for (i = 0, obj = objects; i < params->count; i++, obj++) {
 		if (params->flags & TEST_RANDOM)
@@ -201,11 +373,24 @@ static void __do_evict(int i915,
 		}
 		obj->handle = create_bo(i915, obj->size, region, params->oom_test);
 
-		if (params->flags & TEST_VERIFY)
+		if (params->flags & TEST_CCS) {
+			width = PAGE_SIZE / (bpp / 8);
+			height = obj->size / (bpp / 8) /  width;
+			stride = width * 4;
+
+			obj->blt_obj = calloc(1, sizeof(*obj->blt_obj));
+			set_object(obj->blt_obj, obj->handle, obj->size, region_id,
+				   DG2_MOCS, T_LINEAR, COMPRESSION_ENABLED,
+				   COMPRESSION_TYPE_3D);
+			set_geom(obj->blt_obj, stride, 0, 0, width, height, 0, 0);
+			init_object_ccs(i915, obj, tmp, cmd, rand(),
+					params->flags, blt_ctx, region_id);
+		} else if (params->flags & TEST_VERIFY) {
 			init_object(i915, obj, rand(), params->flags);
-		else
+		} else {
 			move_to_lmem(i915, objects + i, 1, batch, engine,
 				     params->oom_test);
+		}
 	}
 
 	igt_debug("obj size min/max=%lu %s/%lu %s, count=%u, seed: %u\n",
@@ -232,7 +417,16 @@ static void __do_evict(int i915,
 		if (params->flags & TEST_ENGINES)
 			engine = (engine + 1) % __num_engines__;
 
-		if (params->flags & TEST_VERIFY) {
+		if (params->flags & TEST_CCS) {
+			for (i = 0; i < num; i++)
+				verify_object_ccs(i915, &list[i], tmp,
+						  cmd, params->flags, blt_ctx,
+						  region_id);
+			/* Update random object - may swap it back in. */
+			i = rand() % params->count;
+			init_object_ccs(i915, &objects[i], tmp, cmd, rand(),
+					params->flags, blt_ctx, region_id);
+		} else if (params->flags & TEST_VERIFY) {
 			for (i = 0; i < num; i++)
 				verify_object(i915, &list[i], params->flags);
 
@@ -247,6 +441,11 @@ static void __do_evict(int i915,
 
 	free(list);
 	free(objects);
+	if (params->flags & TEST_CCS) {
+		gem_close(i915, cmd->handle);
+		gem_close(i915, tmp->handle);
+		gem_context_destroy(i915, blt_ctx->id);
+	}
 
 	gem_close(i915, batch);
 }
@@ -349,6 +548,9 @@ static void test_evict(int i915,
 	const unsigned int nproc = sysconf(_SC_NPROCESSORS_ONLN) + 1;
 	struct params params;
 
+	if (flags & TEST_CCS)
+		igt_require(IS_DG2(intel_get_drm_devid(i915)));
+
 	fill_params(i915, &params, region, flags, nproc, false);
 
 	if (flags & TEST_PARALLEL) {
@@ -512,6 +714,11 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		{ "parallel-random-engines", TEST_PARALLEL | TEST_RANDOM | TEST_ENGINES },
 		{ "parallel-random-verify", TEST_PARALLEL | TEST_RANDOM | TEST_VERIFY },
 		{ "parallel-multi", TEST_PARALLEL | TEST_RANDOM | TEST_VERIFY | TEST_ENGINES | TEST_MULTI },
+		{ "verify-ccs", TEST_CCS },
+		{ "verify-random-ccs", TEST_CCS | TEST_RANDOM },
+		{ "heavy-verify-random-ccs", TEST_CCS | TEST_RANDOM | TEST_HEAVY },
+		{ "heavy-verify-multi-ccs", TEST_CCS | TEST_RANDOM | TEST_HEAVY | TEST_ENGINES | TEST_MULTI },
+		{ "parallel-random-verify-ccs", TEST_PARALLEL | TEST_RANDOM | TEST_CCS },
 		{ }
 	};
 	int i915 = -1;
-- 
2.20.1
