Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A9D10EF25
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 22:21:34 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 zbigniew.kempczynski@intel.com
Date: Tue, 10 May 2022 03:50:20 +0530
Message-Id: <20220509222020.27447-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_capture : Add support
 for local memory
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

v1: Adding local memory support to many-4K-zero subtest
    and used new macro for_each_memory_region for memory regioning.

v2: Add 48b exec flag for execbuf.

v3: Iterate make-4k-incremental subtest over memory region and
    also reducing the number of objects created in lmem so that
    allocations in lmem is done adequate based on the allocation size
    available , as lmem is occupied by flatccs + gtt.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_exec_capture.c | 103 ++++++++++++++++++++--------------
 1 file changed, 61 insertions(+), 42 deletions(-)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index 60f8df04..ca3703a3 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -250,7 +250,8 @@ static void wait_to_die(int fence_out)
 
 static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 		       const struct intel_execution_engine2 *e,
-		       uint32_t target, uint64_t target_size, uint32_t region)
+		       uint32_t target, uint64_t target_size,
+		       struct drm_i915_gem_memory_class_instance *region)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 obj[4];
@@ -268,13 +269,13 @@ static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 	saved_engine = configure_hangs(fd, e, ctx->id);
 
 	memset(obj, 0, sizeof(obj));
-	obj[SCRATCH].handle = gem_create_in_memory_regions(fd, 4096, region);
+	obj[SCRATCH].handle = gem_create_in_memory_region_list(fd, 4096, region, 1);
 	obj[SCRATCH].flags = EXEC_OBJECT_WRITE;
 	obj[CAPTURE].handle = target;
 	obj[CAPTURE].flags = EXEC_OBJECT_CAPTURE;
 	obj[NOCAPTURE].handle = gem_create(fd, 4096);
 
-	obj[BATCH].handle = gem_create_in_memory_regions(fd, 4096, region);
+	obj[BATCH].handle = gem_create_in_memory_region_list(fd, 4096, region, 1);
 	obj[BATCH].relocs_ptr = (uintptr_t)reloc;
 	obj[BATCH].relocation_count = !ahnd ? ARRAY_SIZE(reloc) : 0;
 
@@ -384,12 +385,13 @@ static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 }
 
 static void capture(int fd, int dir, const intel_ctx_t *ctx,
-		    const struct intel_execution_engine2 *e, uint32_t region)
+		const struct intel_execution_engine2 *e,
+		struct drm_i915_gem_memory_class_instance *region)
 {
 	uint32_t handle;
 	uint64_t ahnd, obj_size = 4096;
 
-	igt_assert_eq(__gem_create_in_memory_regions(fd, &handle, &obj_size, region), 0);
+	igt_assert_eq(__gem_create_in_memory_region_list(fd, &handle, &obj_size, region, 1), 0);
 	ahnd = get_reloc_ahnd(fd, ctx->id);
 
 	__capture1(fd, dir, ahnd, ctx, e, handle, obj_size, region);
@@ -415,7 +417,8 @@ static struct offset *
 __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 	   const struct intel_execution_engine2 *e,
 	   unsigned int size, int count,
-	   unsigned int flags, int *_fence_out)
+	   unsigned int flags, int *_fence_out,
+	   struct drm_i915_gem_memory_class_instance *region)
 #define INCREMENTAL 0x1
 #define ASYNC 0x2
 {
@@ -436,9 +439,10 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 	obj = calloc(count + 2, sizeof(*obj));
 	igt_assert(obj);
 
-	obj[0].handle = gem_create(fd, 4096);
+	obj[0].handle = gem_create_in_memory_region_list(fd, 4096, region, 1);
 	obj[0].offset = get_offset(ahnd, obj[0].handle, 4096, 0);
-	obj[0].flags = EXEC_OBJECT_WRITE | (ahnd ? EXEC_OBJECT_PINNED : 0);
+	obj[0].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS | EXEC_OBJECT_WRITE |
+			(ahnd ? EXEC_OBJECT_PINNED : 0);
 
 	for (i = 0; i < count; i++) {
 		obj[i + 1].handle = gem_create(fd, size);
@@ -459,11 +463,12 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 		}
 	}
 
-	obj[count + 1].handle = gem_create(fd, 4096);
+	obj[count + 1].handle = gem_create_in_memory_region_list(fd, 4096, region, 1);
 	obj[count + 1].relocs_ptr = (uintptr_t)reloc;
 	obj[count + 1].relocation_count = !ahnd ? ARRAY_SIZE(reloc) : 0;
 	obj[count + 1].offset = get_offset(ahnd, obj[count + 1].handle, 4096, 0);
-	obj[count + 1].flags = ahnd ? EXEC_OBJECT_PINNED : 0;
+	obj[count + 1].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS |
+			(ahnd ? EXEC_OBJECT_PINNED : 0);
 
 	memset(reloc, 0, sizeof(reloc));
 	reloc[0].target_handle = obj[count + 1].handle; /* recurse */
@@ -585,29 +590,41 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 		saved = configure_hangs(fd, e, ctx->id); \
 	} while(0)
 
-static void many(int fd, int dir, uint64_t size, unsigned int flags)
+static void many(int fd, int dir, uint64_t size, unsigned int flags,
+		struct drm_i915_gem_memory_class_instance *region)
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
-	uint64_t ram, gtt, ahnd;
+	uint64_t ram, gtt, ahnd, lmem_size;
 	unsigned long count, blobs;
 	struct offset *offsets;
 	struct gem_engine_properties saved_engine;
+	struct drm_i915_query_memory_regions *info;
 
 	find_first_available_engine(fd, ctx, e, saved_engine);
 
 	gtt = gem_aperture_size(fd) / size;
-	ram = (intel_get_avail_ram_mb() << 20) / size;
+	ram = (intel_get_avail_ram_mb() << 20) / (size * 32);
 	igt_debug("Available objects in GTT:%"PRIu64", RAM:%"PRIu64"\n",
 		  gtt, ram);
 
-	count = min(gtt, ram) / 4;
-	igt_require(count > 1);
+	info = gem_get_query_memory_regions(fd);
+	lmem_size = gpu_meminfo_region_total_size(info, I915_MEMORY_CLASS_DEVICE) / (size * 16);
+
+	if (region->memory_class == I915_MEMORY_CLASS_SYSTEM) {
+		count = min(gtt, ram) / 4;
+		igt_require(count > 1);
+		intel_require_memory(count, size, CHECK_RAM);
+
+	} else {
+		count = min(gtt, lmem_size) / 4;
+		igt_require(count > 1);
+	}
 
-	intel_require_memory(count, size, CHECK_RAM);
 	ahnd = get_reloc_ahnd(fd, ctx->id);
 
-	offsets = __captureN(fd, dir, ahnd, ctx, e, size, count, flags, NULL);
+	offsets = __captureN(fd, dir, ahnd, ctx, e, size, count, flags, NULL,
+			region);
 
 	blobs = check_error_state(dir, offsets, count, size, !!(flags & INCREMENTAL));
 	igt_info("Captured %lu %"PRId64"-blobs out of a total of %lu\n",
@@ -620,7 +637,8 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
 }
 
 static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
-		    const struct intel_execution_engine2 *e)
+		    const struct intel_execution_engine2 *e,
+		    struct drm_i915_gem_memory_class_instance *region)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 obj = {
@@ -677,7 +695,8 @@ static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
 		/* Reopen the allocator in the new process. */
 		ahnd = get_reloc_ahnd(fd, ctx2->id);
 
-		free(__captureN(fd, dir, ahnd, ctx2, e, size, count, ASYNC, &fence_out));
+		free(__captureN(fd, dir, ahnd, ctx2, e, size, count, ASYNC,
+					&fence_out, region));
 		put_ahnd(ahnd);
 
 		write(link[1], &fd, sizeof(fd)); /* wake the parent up */
@@ -708,7 +727,8 @@ static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
 	put_ahnd(ahnd);
 }
 
-static void userptr(int fd, int dir)
+static void userptr(int fd, int dir,
+		struct drm_i915_gem_memory_class_instance *region)
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
@@ -716,7 +736,7 @@ static void userptr(int fd, int dir)
 	uint64_t ahnd;
 	void *ptr;
 	int obj_size = 4096;
-	uint32_t system_region = INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0);
+
 	struct gem_engine_properties saved_engine;
 
 	find_first_available_engine(fd, ctx, e, saved_engine);
@@ -726,7 +746,8 @@ static void userptr(int fd, int dir)
 	igt_require(__gem_userptr(fd, ptr, obj_size, 0, 0, &handle) == 0);
 	ahnd = get_reloc_ahnd(fd, ctx->id);
 
-	__capture1(fd, dir, ahnd, ctx, e, handle, obj_size, system_region);
+	__capture1(fd, dir, ahnd, ctx, e, handle, obj_size,
+			region);
 
 	gem_close(fd, handle);
 	put_ahnd(ahnd);
@@ -764,9 +785,10 @@ igt_main
 	int fd = -1;
 	int dir = -1;
 	struct drm_i915_query_memory_regions *query_info;
-	struct igt_collection *regions, *set;
-	char *sub_name;
-	uint32_t region;
+	struct drm_i915_gem_memory_class_instance region_smem = {
+		.memory_class = I915_MEMORY_CLASS_SYSTEM,
+		.memory_instance = 0,
+	};
 
 	igt_fixture {
 		int gen;
@@ -788,56 +810,53 @@ igt_main
 		igt_require(safer_strlen(igt_sysfs_get(dir, "error")) > 0);
 		query_info = gem_get_query_memory_regions(fd);
 		igt_assert(query_info);
-		set = get_memory_region_set(query_info,
-				I915_SYSTEM_MEMORY,
-				I915_DEVICE_MEMORY);
 	}
 
 	test_each_engine("capture", fd, ctx, e) {
-		for_each_combination(regions, 1, set) {
-			sub_name = memregion_dynamic_subtest_name(regions);
-			region = igt_collection_get_value(regions, 0);
-			igt_dynamic_f("%s-%s", e->name, sub_name)
-				capture(fd, dir, ctx, e, region);
-			free(sub_name);
+		for_each_memory_region(r, fd) {
+			igt_dynamic_f("%s-%s", e->name, r->name)
+				capture(fd, dir, ctx, e, &r->ci);
 		}
 	}
 
 	igt_subtest_f("many-4K-zero") {
 		igt_require(gem_can_store_dword(fd, 0));
-		many(fd, dir, 1<<12, 0);
+		many(fd, dir, 1<<12, 0, &region_smem);
 	}
 
-	igt_subtest_f("many-4K-incremental") {
+	igt_subtest_with_dynamic("many-4K-incremental") {
 		igt_require(gem_can_store_dword(fd, 0));
-		many(fd, dir, 1<<12, INCREMENTAL);
+		for_each_memory_region(r, fd) {
+			igt_dynamic_f("%s", r->name)
+				many(fd, dir, 1<<12, INCREMENTAL, &r->ci);
+		}
 	}
 
 	igt_subtest_f("many-2M-zero") {
 		igt_require(gem_can_store_dword(fd, 0));
-		many(fd, dir, 2<<20, 0);
+		many(fd, dir, 2<<20, 0, &region_smem);
 	}
 
 	igt_subtest_f("many-2M-incremental") {
 		igt_require(gem_can_store_dword(fd, 0));
-		many(fd, dir, 2<<20, INCREMENTAL);
+		many(fd, dir, 2<<20, INCREMENTAL, &region_smem);
 	}
 
 	igt_subtest_f("many-256M-incremental") {
 		igt_require(gem_can_store_dword(fd, 0));
-		many(fd, dir, 256<<20, INCREMENTAL);
+		many(fd, dir, 256<<20, INCREMENTAL, &region_smem);
 	}
 
 	/* And check we can read from different types of objects */
 
 	igt_subtest_f("userptr") {
 		igt_require(gem_can_store_dword(fd, 0));
-		userptr(fd, dir);
+		userptr(fd, dir, &region_smem);
 	}
 
 	test_each_engine("pi", fd, ctx, e)
 		igt_dynamic_f("%s", (e)->name)
-			prioinv(fd, dir, ctx, e);
+			prioinv(fd, dir, ctx, e, &region_smem);
 
 	igt_fixture {
 		close(dir);
-- 
2.35.1
