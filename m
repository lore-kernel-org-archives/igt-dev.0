Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7445F10E6C7
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 07:00:08 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun,  9 Oct 2022 23:59:29 -0700
Message-Id: <20221010065929.32110-12-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221010065929.32110-1-niranjana.vishwanathapura@intel.com>
References: <20221010065929.32110-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 11/11] tests/i915/vm_bind: Add
 gem_lmem_swapping@vm_bind sub test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>

Validate eviction of objects with persistent mappings and
check persistent mappings are properly rebound upon subsequent
execbuf3 call.

TODO: Add a new swapping test with just vm_bind mode
      (without legacy execbuf).

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/i915/gem_lmem_swapping.c | 153 ++++++++++++++++++++++++++++++++-
 1 file changed, 152 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index cccdb3195b..07e63496d3 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -3,12 +3,15 @@
  * Copyright © 2021 Intel Corporation
  */
 
+#include <poll.h>
+
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "i915/gem_vm.h"
 #include "i915/intel_memory_region.h"
 #include "igt.h"
 #include "igt_kmod.h"
+#include "igt_syncobj.h"
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdint.h>
@@ -54,6 +57,7 @@ struct params {
 		uint64_t max;
 	} size;
 	unsigned int count;
+	unsigned int vm_bind_count;
 	unsigned int loops;
 	unsigned int mem_limit;
 #define TEST_VERIFY	(1 << 0)
@@ -64,15 +68,18 @@ struct params {
 #define TEST_MULTI	(1 << 5)
 #define TEST_CCS	(1 << 6)
 #define TEST_MASSIVE	(1 << 7)
+#define TEST_VM_BIND	(1 << 8)
 	unsigned int flags;
 	unsigned int seed;
 	bool oom_test;
+	uint64_t va;
 };
 
 struct object {
 	uint64_t size;
 	uint32_t seed;
 	uint32_t handle;
+	uint64_t va;
 	struct blt_copy_object *blt_obj;
 };
 
@@ -278,6 +285,115 @@ verify_object_ccs(int i915, const struct object *obj,
 	free(cmd);
 }
 
+#define BATCH_VA       0xa00000
+
+static void i915_vm_bind(int i915, uint32_t vm_id, uint64_t va, uint32_t handle,
+			 uint64_t length, uint32_t syncobj)
+{
+	struct drm_i915_gem_vm_bind bind;
+
+	memset(&bind, 0, sizeof(bind));
+	bind.vm_id = vm_id;
+	bind.handle = handle;
+	bind.start = va;
+	bind.offset = 0;
+	bind.length = length;
+	bind.fence.flags = I915_TIMELINE_FENCE_SIGNAL;
+	bind.fence.handle = syncobj;
+
+	gem_vm_bind(i915, &bind);
+}
+
+static void i915_vm_unbind(int i915, uint32_t vm_id, uint64_t va, uint64_t length)
+{
+	struct drm_i915_gem_vm_unbind unbind;
+
+	memset(&unbind, 0, sizeof(unbind));
+	unbind.vm_id = vm_id;
+	unbind.start = va;
+	unbind.length = length;
+
+	gem_vm_unbind(i915, &unbind);
+}
+
+static uint64_t gettime_ns(void)
+{
+	struct timespec current;
+	clock_gettime(CLOCK_MONOTONIC, &current);
+	return (uint64_t)current.tv_sec * NSEC_PER_SEC + current.tv_nsec;
+}
+
+static void vm_bind(int i915, struct object *list, unsigned int num, uint64_t *va,
+		    uint32_t batch, uint64_t batch_size, uint32_t vm_id)
+{
+	uint32_t *bind_syncobj;
+	uint64_t *fence_value;
+	unsigned int i;
+
+	bind_syncobj = calloc(num + 1, sizeof(*bind_syncobj));
+	igt_assert(bind_syncobj);
+
+	fence_value = calloc(num + 1, sizeof(*fence_value));
+	igt_assert(fence_value);
+
+	for (i = 0; i < num; i++) {
+		list[i].va = *va;
+		bind_syncobj[i] = syncobj_create(i915, 0);
+		i915_vm_bind(i915, vm_id, *va, list[i].handle, list[i].size, bind_syncobj[i]);
+		*va += list[i].size;
+	}
+	bind_syncobj[i] = syncobj_create(i915, 0);
+	i915_vm_bind(i915, vm_id, BATCH_VA, batch, batch_size, bind_syncobj[i]);
+
+	igt_assert(syncobj_timeline_wait(i915, bind_syncobj, fence_value, num + 1,
+					 gettime_ns() + (2 * NSEC_PER_SEC),
+					 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT, NULL));
+	for (i = 0; i <= num; i++)
+		syncobj_destroy(i915, bind_syncobj[i]);
+}
+
+static void vm_unbind(int i915, struct object *list, unsigned int num,
+		      uint64_t batch_size, uint32_t vm_id)
+{
+	unsigned int i;
+
+	i915_vm_unbind(i915, vm_id, BATCH_VA, batch_size);
+	for (i = 0; i < num; i++)
+		i915_vm_unbind(i915, vm_id, list[i].va, list[i].size);
+}
+
+static void move_to_lmem_execbuf3(int i915,
+				  const intel_ctx_t *ctx,
+				  unsigned int engine,
+				  bool do_oom_test)
+{
+	uint32_t exec_syncobj = syncobj_create(i915, 0);
+	struct drm_i915_gem_timeline_fence exec_fence = {
+		.handle = exec_syncobj,
+		.flags = I915_TIMELINE_FENCE_SIGNAL
+	};
+	struct drm_i915_gem_execbuffer3 eb = {
+		.ctx_id = ctx->id,
+		.batch_address = BATCH_VA,
+		.engine_idx = engine,
+		.fence_count = 1,
+		.timeline_fences = to_user_pointer(&exec_fence),
+	};
+	uint64_t fence_value = 0;
+	int ret;
+
+retry:
+	ret = __gem_execbuf3(i915, &eb);
+	if (do_oom_test && (ret == -ENOMEM || ret == -ENXIO))
+		goto retry;
+	igt_assert_eq(ret, 0);
+
+	igt_assert(syncobj_timeline_wait(i915, &exec_syncobj, &fence_value, 1,
+					 gettime_ns() + (2 * NSEC_PER_SEC),
+					 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT, NULL));
+	syncobj_destroy(i915, exec_syncobj);
+}
+
 static void move_to_lmem(int i915,
 			 const intel_ctx_t *ctx,
 			 struct object *list,
@@ -325,14 +441,16 @@ static void __do_evict(int i915,
 	uint32_t region_id = INTEL_MEMORY_REGION_ID(region->memory_class,
 						    region->memory_instance);
 	const unsigned int max_swap_in = params->count / 100 + 1;
+	uint64_t size, ahnd, batch_size = 4096;
 	struct object *objects, *obj, *list;
 	const uint32_t bpp = 32;
 	uint32_t width, height, stride;
+	const intel_ctx_t *vm_bind_ctx;
 	const intel_ctx_t *blt_ctx;
 	struct blt_copy_object *tmp;
 	unsigned int engine = 0;
+	uint32_t batch, vm_id;
 	unsigned int i, l;
-	uint64_t size, ahnd;
 	struct timespec t = {};
 	unsigned int num;
 
@@ -416,6 +534,20 @@ static void __do_evict(int i915,
 		  readable_size(params->size.max), readable_unit(params->size.max),
 		  params->count, seed);
 
+	/* VM_BIND the specified subset of objects (as persistent mappings) */
+	if (params->flags & TEST_VM_BIND) {
+		const uint32_t bbe = MI_BATCH_BUFFER_END;
+
+		batch = gem_create_from_pool(i915, &batch_size, region_id);
+		gem_write(i915, batch, 0, &bbe, sizeof(bbe));
+
+		vm_id = gem_vm_create_in_vm_bind_mode(i915);
+		vm_bind_ctx = intel_ctx_create(i915, &ctx->cfg);
+		gem_context_set_vm(i915, vm_bind_ctx->id, vm_id);
+		vm_bind(i915, objects, params->vm_bind_count, &params->va,
+			batch, batch_size, vm_id);
+	}
+
 	/*
 	 * Move random objects back into lmem.
 	 * For TEST_MULTI runs, make each object counts a loop to
@@ -454,6 +586,15 @@ static void __do_evict(int i915,
 		}
 	}
 
+	/* Rebind persistent mappings to ensure they are swapped back in */
+	if (params->flags & TEST_VM_BIND) {
+		move_to_lmem_execbuf3(i915, vm_bind_ctx, engine, params->oom_test);
+
+		vm_unbind(i915, objects, params->vm_bind_count, batch_size, vm_id);
+		intel_ctx_destroy(i915, vm_bind_ctx);
+		gem_vm_destroy(i915, vm_id);
+	}
+
 	for (i = 0; i < params->count; i++) {
 		gem_close(i915, objects[i].handle);
 		free(objects[i].blt_obj);
@@ -553,6 +694,15 @@ static void fill_params(int i915, struct params *params,
 	if (flags & TEST_HEAVY)
 		params->loops = params->loops / 2 + 1;
 
+	/*
+	 * Set vm_bind_count and ensure it doesn't over-subscribe LMEM.
+	 * Set va range to ensure it is big enough for all bindings in a VM.
+	 */
+	if (flags & TEST_VM_BIND) {
+		params->vm_bind_count = params->count * 50 / ((flags & TEST_HEAVY) ? 300 : 150);
+		params->va = (uint64_t)params->vm_bind_count * size * 4;
+	}
+
 	params->flags = flags;
 	params->oom_test = do_oom_test;
 
@@ -764,6 +914,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		{ "heavy-verify-random-ccs", TEST_CCS | TEST_RANDOM | TEST_HEAVY },
 		{ "heavy-verify-multi-ccs", TEST_CCS | TEST_RANDOM | TEST_HEAVY | TEST_ENGINES | TEST_MULTI },
 		{ "parallel-random-verify-ccs", TEST_PARALLEL | TEST_RANDOM | TEST_CCS },
+		{ "vm_bind", TEST_VM_BIND },
 		{ }
 	};
 	const intel_ctx_t *ctx;
-- 
2.21.0.rc0.32.g243a4c7e27
