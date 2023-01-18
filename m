Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6BE10E6B4
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 07:14:00 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 23:13:48 -0800
Message-Id: <20230118071350.17498-18-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230118071350.17498-1-niranjana.vishwanathapura@intel.com>
References: <20230118071350.17498-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v10 17/19] lib/vm_bind: Add execbuf3 support
 to igt_spin_factory
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

In preparation of some VM_BIND+execbuf3 related tests,
Add execbuf3 support to igt_spin_factory.

Only add the required support which can be expanded as needed
in the future.

v2: Assert if unsupported flag IGT_SPIN_SOFTDEP is used

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/igt_dummyload.c | 245 ++++++++++++++++++++++++++++++++++++++++++--
 lib/igt_dummyload.h |   8 ++
 2 files changed, 246 insertions(+), 7 deletions(-)

diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index 5f3c6b10c..4823c8b35 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -35,11 +35,13 @@
 #include "i915/gem_engine_topology.h"
 #include "i915/gem_mman.h"
 #include "i915/gem_submission.h"
+#include "i915/i915_vm_bind.h"
 #include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_device.h"
 #include "igt_dummyload.h"
 #include "igt_gt.h"
+#include "igt_syncobj.h"
 #include "igt_vgem.h"
 #include "intel_allocator.h"
 #include "intel_chipset.h"
@@ -426,6 +428,214 @@ emit_recursive_batch(igt_spin_t *spin,
 	return fence_fd;
 }
 
+static int
+emit_recursive_batch_execbuf3(igt_spin_t *spin, int fd,
+			      const struct igt_spin_factory *opts)
+{
+#define SCRATCH 0
+#define BATCH IGT_SPIN_BATCH
+	const unsigned int devid = intel_get_drm_devid(fd);
+	uint64_t addr, addr_scratch, ahnd = opts->ahnd;
+	struct drm_i915_gem_timeline_fence *out_fence;
+	const unsigned int gen = intel_gen(devid);
+	struct drm_i915_gem_execbuffer3 *execbuf3;
+	struct drm_i915_gem_exec_object2 *obj;
+	unsigned int flags[GEM_MAX_ENGINES];
+	uint64_t presumed_offset, delta;
+	unsigned int nengine;
+	int fence_fd = -1;
+	uint32_t *cs;
+	int i;
+
+	igt_assert(ahnd);
+	igt_assert(i915_vm_bind_version(fd) == 1);
+	igt_assert(!(opts->flags & (IGT_SPIN_FENCE_OUT | IGT_SPIN_FENCE_IN |
+				    IGT_SPIN_FENCE_SUBMIT | IGT_SPIN_SOFTDEP)));
+	igt_assert(!(opts->ctx && opts->ctx_id));
+
+	execbuf3 = memset(&spin->execbuf3, 0, sizeof(spin->execbuf3));
+	execbuf3->ctx_id = opts->ctx ? opts->ctx->id : opts->ctx_id;
+	obj = memset(spin->obj, 0, sizeof(spin->obj));
+
+	nengine = 0;
+	if (opts->engine == ALL_ENGINES) {
+		struct intel_execution_engine2 *engine;
+
+		igt_assert(opts->ctx);
+		for_each_ctx_engine(fd, opts->ctx, engine) {
+			if (opts->flags & IGT_SPIN_POLL_RUN &&
+			    !gem_class_can_store_dword(fd, engine->class))
+				continue;
+
+			flags[nengine++] = engine->flags;
+		}
+	} else {
+		flags[nengine++] = opts->engine;
+	}
+	igt_require(nengine);
+	spin->nengines = nengine;
+
+	obj[BATCH].handle =
+		handle_create(fd, BATCH_SIZE, opts->flags, &spin->batch);
+	if (!spin->batch) {
+		spin->batch = gem_mmap__device_coherent(fd, obj[BATCH].handle,
+						  0, BATCH_SIZE, PROT_WRITE);
+		gem_set_domain(fd, obj[BATCH].handle,
+			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+	}
+	cs = spin->batch;
+
+	addr = intel_allocator_alloc_with_strategy(ahnd, obj[BATCH].handle,
+						   BATCH_SIZE, 0,
+						   ALLOC_STRATEGY_LOW_TO_HIGH);
+	obj[BATCH].offset = CANONICAL(addr);
+	i915_vm_bind(fd, opts->vm_id, obj[BATCH].offset, obj[BATCH].handle, 0, BATCH_SIZE, 0, 0, 0);
+
+	execbuf3->batch_address = obj[BATCH].offset;
+	addr += BATCH_SIZE;
+
+	if (opts->dependency) {
+		igt_assert(!(opts->flags & IGT_SPIN_POLL_RUN));
+		addr_scratch = intel_allocator_alloc_with_strategy(ahnd, opts->dependency,
+								   BATCH_SIZE, 0,
+								   ALLOC_STRATEGY_LOW_TO_HIGH);
+
+		obj[SCRATCH].handle = opts->dependency;
+		obj[SCRATCH].offset = CANONICAL(addr_scratch);
+		i915_vm_bind(fd, opts->vm_id, obj[SCRATCH].offset, obj[SCRATCH].handle, 0, BATCH_SIZE, 0, 0, 0);
+	} else if (opts->flags & IGT_SPIN_POLL_RUN) {
+		igt_assert(!opts->dependency);
+
+		spin->poll_handle =
+			handle_create(fd, 4096, opts->flags, &spin->poll);
+		obj[SCRATCH].handle = spin->poll_handle;
+
+		if (!spin->poll) {
+			if (__gem_set_caching(fd, spin->poll_handle,
+					      I915_CACHING_CACHED) == 0)
+				spin->poll = gem_mmap__cpu(fd, spin->poll_handle,
+							   0, 4096,
+							   PROT_READ | PROT_WRITE);
+			else
+				spin->poll = gem_mmap__device_coherent(fd,
+								       spin->poll_handle,
+								       0, 4096,
+								       PROT_READ | PROT_WRITE);
+		}
+
+		addr = intel_allocator_alloc_with_strategy(ahnd,
+							   spin->poll_handle,
+							   BATCH_SIZE * 3, 0,
+							   ALLOC_STRATEGY_LOW_TO_HIGH);
+		addr += 4096; /* guard page */
+		obj[SCRATCH].offset = CANONICAL(addr);
+		i915_vm_bind(fd, opts->vm_id, obj[SCRATCH].offset, obj[SCRATCH].handle, 0, 4096, 0, 0, 0);
+		addr += 4096;
+
+		igt_assert_eq(spin->poll[SPIN_POLL_START_IDX], 0);
+
+		presumed_offset = obj[SCRATCH].offset;
+		delta = sizeof(uint32_t) * SPIN_POLL_START_IDX;
+
+		*cs++ = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
+
+		if (gen >= 8) {
+			*cs++ = presumed_offset + delta;
+			*cs++ = (presumed_offset + delta) >> 32;
+		}
+
+		*cs++ = 1;
+	}
+
+	spin->handle = obj[BATCH].handle;
+
+	igt_assert_lt(cs - spin->batch, LOOP_START_OFFSET / sizeof(*cs));
+	spin->condition = spin->batch + LOOP_START_OFFSET / sizeof(*cs);
+	cs = spin->condition;
+
+	/* Allow ourselves to be preempted */
+	if (!(opts->flags & IGT_SPIN_NO_PREEMPTION))
+		*cs++ = MI_ARB_CHK;
+	if (opts->flags & IGT_SPIN_INVALID_CS) {
+		igt_assert(opts->ctx);
+		if (!gem_engine_has_cmdparser(fd, &opts->ctx->cfg, opts->engine))
+			*cs++ = 0xdeadbeef;
+	}
+
+	/* Pad with a few nops so that we do not completely hog the system.
+	 *
+	 * Part of the attraction of using a recursive batch is that it is
+	 * hard on the system (executing the "function" call is apparently
+	 * quite expensive). However, the GPU may hog the entire system for
+	 * a few minutes, preventing even NMI. Quite why this is so is unclear,
+	 * but presumably it relates to the PM_INTRMSK workaround on gen6/gen7.
+	 * If we give the system a break by having the GPU execute a few nops
+	 * between function calls, that appears enough to keep SNB out of
+	 * trouble. See https://bugs.freedesktop.org/show_bug.cgi?id=102262
+	 */
+	if (!(opts->flags & IGT_SPIN_FAST))
+		cs += 960;
+
+	/*
+	 * When using a cmdparser, the batch is copied into a read only location
+	 * and validated. We are then unable to alter the executing batch,
+	 * breaking the older *spin->condition = MI_BB_END termination.
+	 * Instead we can use a conditional MI_BB_END here that looks at
+	 * the user's copy of the batch and terminates when they modified it,
+	 * no matter how they modify it (from either the GPU or CPU).
+	 *
+	 * On Sandybridge+ the comparison is a strict greater-than:
+	 * if the value at spin->condition is greater than BB_END,
+	 * we loop back to the beginning.
+	 * Beginning with Kabylake, we can select the comparison mode
+	 * and loop back to the beginning if spin->condition != BB_END
+	 * (using 5 << 12).
+	 * For simplicity, we try to stick to a one-size fits all.
+	 */
+	spin->condition = spin->batch + BATCH_SIZE / sizeof(*spin->batch) - 2;
+	spin->condition[0] = 0xffffffff;
+	spin->condition[1] = 0xffffffff;
+
+	presumed_offset = obj[BATCH].offset;
+	delta = (spin->condition - spin->batch) * sizeof(*cs);
+	igt_assert(delta < 4096);
+
+	*cs++ = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
+	*cs++ = MI_BATCH_BUFFER_END;
+	*cs++ = presumed_offset + delta;
+	*cs++ = presumed_offset >> 32;
+
+	/* recurse */
+	presumed_offset = obj[BATCH].offset;
+	delta = LOOP_START_OFFSET;
+
+	if (gen >= 8) {
+		*cs++ = MI_BATCH_BUFFER_START | 1 << 8 | 1;
+		*cs++ = presumed_offset + delta;
+		*cs++ = (presumed_offset + delta) >> 32;
+	}
+
+	out_fence = memset(&spin->exec3_out_syncobj, 0, sizeof(*out_fence));
+	out_fence->flags = I915_TIMELINE_FENCE_SIGNAL;
+	execbuf3->fence_count = 1;
+	for (i = 0; i < nengine; i++) {
+		spin->out_syncobj[i] = syncobj_create(fd, 0);
+		out_fence->handle = spin->out_syncobj[i];
+
+		execbuf3->engine_idx = flags[i];
+		execbuf3->timeline_fences = to_user_pointer(out_fence);
+
+		gem_execbuf3(fd, execbuf3);
+	}
+
+	igt_assert_lt(cs - spin->batch, BATCH_SIZE / sizeof(*cs));
+
+	spin->cmd_precondition = *spin->condition;
+	spin->opts = *opts;
+
+	return fence_fd;
+}
+
 static igt_spin_t *
 spin_create(int fd, const struct igt_spin_factory *opts)
 {
@@ -435,8 +645,10 @@ spin_create(int fd, const struct igt_spin_factory *opts)
 	igt_assert(spin);
 
 	spin->timerfd = -1;
-	spin->out_fence = emit_recursive_batch(spin, fd, opts);
-
+	if (opts->flags & IGT_SPIN_EXECBUF3)
+		emit_recursive_batch_execbuf3(spin, fd, opts);
+	else
+		spin->out_fence = emit_recursive_batch(spin, fd, opts);
 	pthread_mutex_lock(&list_lock);
 	igt_list_add(&spin->link, &spin_list);
 	pthread_mutex_unlock(&list_lock);
@@ -466,6 +678,7 @@ igt_spin_t *
 igt_spin_factory(int fd, const struct igt_spin_factory *opts)
 {
 	igt_spin_t *spin;
+	int i = 0;
 
 	if ((opts->flags & IGT_SPIN_POLL_RUN) && opts->engine != ALL_ENGINES) {
 		unsigned int class;
@@ -483,11 +696,17 @@ igt_spin_factory(int fd, const struct igt_spin_factory *opts)
 
 	spin = spin_create(fd, opts);
 
-	if (!(opts->flags & IGT_SPIN_INVALID_CS)) {
-		/*
-		 * When injecting invalid CS into the batch, the spinner may
-		 * be killed immediately -- i.e. may already be completed!
-		 */
+	/*
+	 * When injecting invalid CS into the batch, the spinner may
+	 * be killed immediately -- i.e. may already be completed!
+	 */
+	if (opts->flags & IGT_SPIN_INVALID_CS)
+		return spin;
+
+	if (opts->flags & IGT_SPIN_EXECBUF3) {
+		while (spin->out_syncobj[i])
+			igt_assert(syncobj_busy(fd, spin->out_syncobj[i++]));
+	} else {
 		igt_assert(gem_bo_busy(fd, spin->handle));
 		if (opts->flags & IGT_SPIN_FENCE_OUT) {
 			struct pollfd pfd = { spin->out_fence, POLLIN };
@@ -597,6 +816,8 @@ void igt_spin_end(igt_spin_t *spin)
 
 static void __igt_spin_free(int fd, igt_spin_t *spin)
 {
+	int i = 0;
+
 	if (spin->timerfd >= 0) {
 		pthread_cancel(spin->timer_thread);
 		igt_assert(pthread_join(spin->timer_thread, NULL) == 0);
@@ -610,6 +831,10 @@ static void __igt_spin_free(int fd, igt_spin_t *spin)
 	if (spin->batch)
 		gem_munmap(spin->batch, BATCH_SIZE);
 
+	if ((spin->poll_handle || spin->opts.dependency) &&
+	    (spin->opts.flags & IGT_SPIN_EXECBUF3))
+		i915_vm_unbind(fd, spin->opts.vm_id, spin->obj[SCRATCH].offset, 4096);
+
 	if (spin->poll_handle) {
 		gem_close(fd, spin->poll_handle);
 		if (spin->opts.ahnd)
@@ -617,6 +842,9 @@ static void __igt_spin_free(int fd, igt_spin_t *spin)
 	}
 
 	if (spin->handle) {
+		if (spin->opts.flags & IGT_SPIN_EXECBUF3)
+			i915_vm_unbind(fd, spin->opts.vm_id, spin->obj[BATCH].offset, BATCH_SIZE);
+
 		gem_close(fd, spin->handle);
 		if (spin->opts.ahnd)
 			intel_allocator_free(spin->opts.ahnd, spin->handle);
@@ -625,6 +853,9 @@ static void __igt_spin_free(int fd, igt_spin_t *spin)
 	if (spin->out_fence >= 0)
 		close(spin->out_fence);
 
+	while (spin->out_syncobj[i])
+		syncobj_destroy(fd, spin->out_syncobj[i++]);
+
 	free(spin);
 }
 
diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h
index b247ab02b..4420daa2e 100644
--- a/lib/igt_dummyload.h
+++ b/lib/igt_dummyload.h
@@ -31,6 +31,7 @@
 #include "igt_core.h"
 #include "igt_list.h"
 #include "i915_drm.h"
+#include "i915/i915_drm_local.h"
 #include "intel_ctx.h"
 
 
@@ -48,6 +49,7 @@
 typedef struct igt_spin_factory {
 	uint32_t ctx_id;
 	const intel_ctx_t *ctx;
+	uint32_t vm_id;
 	uint32_t dependency;
 	uint64_t dependency_size;
 	unsigned int engine;
@@ -79,6 +81,11 @@ typedef struct igt_spin {
 #define IGT_SPIN_BATCH   1
 	struct drm_i915_gem_execbuffer2 execbuf;
 
+	struct drm_i915_gem_execbuffer3 execbuf3;
+	uint32_t out_syncobj[GEM_MAX_ENGINES];
+	struct drm_i915_gem_timeline_fence exec3_out_syncobj;
+	unsigned int nengines;
+
 	unsigned int flags;
 #define SPIN_CLFLUSH (1 << 0)
 
@@ -95,6 +102,7 @@ typedef struct igt_spin {
 #define IGT_SPIN_INVALID_CS    (1 << 6)
 #define IGT_SPIN_USERPTR       (1 << 7)
 #define IGT_SPIN_SOFTDEP       (1 << 8)
+#define IGT_SPIN_EXECBUF3      (1 << 9)
 
 igt_spin_t *
 __igt_spin_factory(int fd, const igt_spin_factory_t *opts);
-- 
2.21.0.rc0.32.g243a4c7e27
