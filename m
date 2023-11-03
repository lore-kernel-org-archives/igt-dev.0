Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A827710EA0A
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:44:20 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:03 +0000
Message-Id: <20231103144359.7-9-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 08/64] drm-uapi/xe: Add _FLAG to uAPI constants
 usable for flags
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

Align with commit ("Add _FLAG to uAPI constants usable for flags")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 benchmarks/gem_wsim.c              |  12 +--
 include/drm-uapi/xe_drm.h          |  30 +++----
 lib/igt_fb.c                       |   2 +-
 lib/intel_batchbuffer.c            |  12 +--
 lib/intel_compute.c                |   6 +-
 lib/intel_ctx.c                    |   4 +-
 lib/xe/xe_ioctl.c                  |   6 +-
 lib/xe/xe_query.c                  |   4 +-
 lib/xe/xe_spin.c                   |   4 +-
 lib/xe/xe_util.c                   |   4 +-
 tests/intel/xe_ccs.c               |   4 +-
 tests/intel/xe_copy_basic.c        |   2 +-
 tests/intel/xe_create.c            |   6 +-
 tests/intel/xe_dma_buf_sync.c      |   4 +-
 tests/intel/xe_drm_fdinfo.c        |  18 ++---
 tests/intel/xe_evict.c             |  24 +++---
 tests/intel/xe_evict_ccs.c         |   2 +-
 tests/intel/xe_exec_balancer.c     |  34 ++++----
 tests/intel/xe_exec_basic.c        |  16 ++--
 tests/intel/xe_exec_compute_mode.c |   6 +-
 tests/intel/xe_exec_fault_mode.c   |  14 ++--
 tests/intel/xe_exec_reset.c        |  42 +++++-----
 tests/intel/xe_exec_store.c        |  16 ++--
 tests/intel/xe_exec_threads.c      |  44 +++++------
 tests/intel/xe_exercise_blt.c      |   2 +-
 tests/intel/xe_guc_pc.c            |  12 +--
 tests/intel/xe_huc_copy.c          |   4 +-
 tests/intel/xe_intel_bb.c          |   2 +-
 tests/intel/xe_noexec_ping_pong.c  |   2 +-
 tests/intel/xe_perf_pmu.c          |  24 +++---
 tests/intel/xe_pm.c                |  12 +--
 tests/intel/xe_pm_residency.c      |   2 +-
 tests/intel/xe_spin_batch.c        |   2 +-
 tests/intel/xe_vm.c                | 122 ++++++++++++++---------------
 tests/intel/xe_waitfence.c         |   4 +-
 35 files changed, 252 insertions(+), 252 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 28b809520..df4850086 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1772,21 +1772,21 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
 	i = 0;
 	/* out fence */
 	w->xe.syncs[i].handle = syncobj_create(fd, 0);
-	w->xe.syncs[i++].flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL;
+	w->xe.syncs[i++].flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL;
 	/* in fence(s) */
 	for_each_dep(dep, w->data_deps) {
 		int dep_idx = w->idx + dep->target;
 
 		igt_assert(wrk->steps[dep_idx].xe.syncs && wrk->steps[dep_idx].xe.syncs[0].handle);
 		w->xe.syncs[i].handle = wrk->steps[dep_idx].xe.syncs[0].handle;
-		w->xe.syncs[i++].flags = DRM_XE_SYNC_SYNCOBJ;
+		w->xe.syncs[i++].flags = DRM_XE_SYNC_FLAG_SYNCOBJ;
 	}
 	for_each_dep(dep, w->fence_deps) {
 		int dep_idx = w->idx + dep->target;
 
 		igt_assert(wrk->steps[dep_idx].xe.syncs && wrk->steps[dep_idx].xe.syncs[0].handle);
 		w->xe.syncs[i].handle = wrk->steps[dep_idx].xe.syncs[0].handle;
-		w->xe.syncs[i++].flags = DRM_XE_SYNC_SYNCOBJ;
+		w->xe.syncs[i++].flags = DRM_XE_SYNC_FLAG_SYNCOBJ;
 	}
 	w->xe.exec.syncs = to_user_pointer(w->xe.syncs);
 }
@@ -2024,8 +2024,8 @@ static void xe_vm_create_(struct xe_vm *vm)
 	uint32_t flags = 0;
 
 	if (vm->compute_mode)
-		flags |= DRM_XE_VM_CREATE_ASYNC_DEFAULT |
-			 DRM_XE_VM_CREATE_COMPUTE_MODE;
+		flags |= DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
+			 DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE;
 
 	vm->id = xe_vm_create(fd, flags, 0);
 }
@@ -2363,7 +2363,7 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 		if (w->type == SW_FENCE) {
 			w->xe.syncs = calloc(1, sizeof(struct drm_xe_sync));
 			w->xe.syncs[0].handle = syncobj_create(fd, 0);
-			w->xe.syncs[0].flags = DRM_XE_SYNC_SYNCOBJ;
+			w->xe.syncs[0].flags = DRM_XE_SYNC_FLAG_SYNCOBJ;
 		}
 
 	return 0;
diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 599ee980c..9dc40898c 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -672,10 +672,10 @@ struct drm_xe_vm_create {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-#define DRM_XE_VM_CREATE_SCRATCH_PAGE		(0x1 << 0)
-#define DRM_XE_VM_CREATE_COMPUTE_MODE		(0x1 << 1)
-#define DRM_XE_VM_CREATE_ASYNC_DEFAULT		(0x1 << 2)
-#define DRM_XE_VM_CREATE_FAULT_MODE		(0x1 << 3)
+#define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(0x1 << 0)
+#define DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE	(0x1 << 1)
+#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(0x1 << 2)
+#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(0x1 << 3)
 	/** @flags: Flags */
 	__u32 flags;
 
@@ -907,11 +907,11 @@ struct drm_xe_sync {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-#define DRM_XE_SYNC_SYNCOBJ		0x0
-#define DRM_XE_SYNC_TIMELINE_SYNCOBJ	0x1
-#define DRM_XE_SYNC_DMA_BUF		0x2
-#define DRM_XE_SYNC_USER_FENCE		0x3
-#define DRM_XE_SYNC_SIGNAL		0x10
+#define DRM_XE_SYNC_FLAG_SYNCOBJ		0x0
+#define DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ	0x1
+#define DRM_XE_SYNC_FLAG_DMA_BUF		0x2
+#define DRM_XE_SYNC_FLAG_USER_FENCE		0x3
+#define DRM_XE_SYNC_FLAG_SIGNAL		0x10
 	__u32 flags;
 
 	/** @pad: MBZ */
@@ -997,8 +997,8 @@ struct drm_xe_wait_user_fence {
 	/** @op: wait operation (type of comparison) */
 	__u16 op;
 
-#define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
-#define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
+#define DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
+#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 1)
 	/** @flags: wait flags */
 	__u16 flags;
 
@@ -1016,10 +1016,10 @@ struct drm_xe_wait_user_fence {
 	__u64 mask;
 	/**
 	 * @timeout: how long to wait before bailing, value in nanoseconds.
-	 * Without DRM_XE_UFENCE_WAIT_ABSTIME flag set (relative timeout)
+	 * Without DRM_XE_UFENCE_WAIT_FLAG_ABSTIME flag set (relative timeout)
 	 * it contains timeout expressed in nanoseconds to wait (fence will
 	 * expire at now() + timeout).
-	 * When DRM_XE_UFENCE_WAIT_ABSTIME flat is set (absolute timeout) wait
+	 * When DRM_XE_UFENCE_WAIT_FLAG_ABSTIME flat is set (absolute timeout) wait
 	 * will end at timeout (uses system MONOTONIC_CLOCK).
 	 * Passing negative timeout leads to neverending wait.
 	 *
@@ -1032,13 +1032,13 @@ struct drm_xe_wait_user_fence {
 
 	/**
 	 * @num_engines: number of engine instances to wait on, must be zero
-	 * when DRM_XE_UFENCE_WAIT_SOFT_OP set
+	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
 	 */
 	__u64 num_engines;
 
 	/**
 	 * @instances: user pointer to array of drm_xe_engine_class_instance to
-	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_SOFT_OP set
+	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
 	 */
 	__u64 instances;
 
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index e531a041e..e70d2e3ce 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2892,7 +2892,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
 							  &bb_size,
 							  mem_region) == 0);
 	} else if (is_xe) {
-		vm = xe_vm_create(dst_fb->fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+		vm = xe_vm_create(dst_fb->fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 		exec_queue = xe_exec_queue_create(dst_fb->fd, vm, &inst, 0);
 		xe_ctx = intel_ctx_xe(dst_fb->fd, vm, exec_queue, 0, 0, 0);
 		mem_region = vram_if_possible(dst_fb->fd, 0);
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index eb47ede50..b59c490db 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -953,7 +953,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 
 		if (!vm) {
 			igt_assert_f(!ctx, "No vm provided for engine");
-			vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+			vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 		}
 
 		ibb->uses_full_ppgtt = true;
@@ -1315,8 +1315,8 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
 static void __unbind_xe_objects(struct intel_bb *ibb)
 {
 	struct drm_xe_sync syncs[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	int ret;
 
@@ -2302,8 +2302,8 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 	uint32_t engine = flags & (I915_EXEC_BSD_MASK | I915_EXEC_RING_MASK);
 	uint32_t engine_id;
 	struct drm_xe_sync syncs[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_vm_bind_op *bind_ops;
 	void *map;
@@ -2371,7 +2371,7 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 	}
 	ibb->xe_bound = true;
 
-	syncs[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+	syncs[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 	ibb->engine_syncobj = syncobj_create(ibb->fd, 0);
 	syncs[1].handle = ibb->engine_syncobj;
 
diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 7f1ea90e7..7cb0f001c 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -80,7 +80,7 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv)
 		else
 			engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
 
-		execenv->vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+		execenv->vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 		execenv->exec_queue = xe_exec_queue_create_class(fd, execenv->vm,
 								 engine_class);
 	}
@@ -106,7 +106,7 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
 		uint64_t alignment = xe_get_default_alignment(fd);
 		struct drm_xe_sync sync = { 0 };
 
-		sync.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL;
+		sync.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL;
 		sync.handle = syncobj_create(fd, 0);
 
 		for (int i = 0; i < entries; i++) {
@@ -162,7 +162,7 @@ static void bo_execenv_unbind(struct bo_execenv *execenv,
 		uint32_t vm = execenv->vm;
 		struct drm_xe_sync sync = { 0 };
 
-		sync.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL;
+		sync.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL;
 		sync.handle = syncobj_create(fd, 0);
 
 		for (int i = 0; i < entries; i++) {
diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
index f927b7df8..f82564572 100644
--- a/lib/intel_ctx.c
+++ b/lib/intel_ctx.c
@@ -423,8 +423,8 @@ intel_ctx_t *intel_ctx_xe(int fd, uint32_t vm, uint32_t exec_queue,
 int __intel_ctx_xe_exec(const intel_ctx_t *ctx, uint64_t ahnd, uint64_t bb_offset)
 {
 	struct drm_xe_sync syncs[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.exec_queue_id = ctx->exec_queue,
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 21a85225f..06c3cb782 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -399,7 +399,7 @@ void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
 void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr)
 {
 	struct drm_xe_sync sync = {
-		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
 		.handle = syncobj_create(fd, 0),
 	};
 
@@ -416,7 +416,7 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 	struct drm_xe_wait_user_fence wait = {
 		.addr = to_user_pointer(addr),
 		.op = DRM_XE_UFENCE_WAIT_EQ,
-		.flags = !eci ? DRM_XE_UFENCE_WAIT_SOFT_OP : 0,
+		.flags = !eci ? DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP : 0,
 		.value = value,
 		.mask = DRM_XE_UFENCE_WAIT_U64,
 		.timeout = timeout,
@@ -448,7 +448,7 @@ int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
 	struct drm_xe_wait_user_fence wait = {
 		.addr = to_user_pointer(addr),
 		.op = DRM_XE_UFENCE_WAIT_EQ,
-		.flags = !eci ? DRM_XE_UFENCE_WAIT_SOFT_OP | DRM_XE_UFENCE_WAIT_ABSTIME : 0,
+		.flags = !eci ? DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | DRM_XE_UFENCE_WAIT_FLAG_ABSTIME : 0,
 		.value = value,
 		.mask = DRM_XE_UFENCE_WAIT_U64,
 		.timeout = timeout,
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index bb54f0fd6..76e245f9c 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -314,8 +314,8 @@ bool xe_supports_faults(int fd)
 	bool supports_faults;
 
 	struct drm_xe_vm_create create = {
-		.flags = DRM_XE_VM_CREATE_ASYNC_DEFAULT |
-			 DRM_XE_VM_CREATE_FAULT_MODE,
+		.flags = DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
+			 DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
 	};
 
 	supports_faults = !igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index b05b38829..cfc663acc 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -191,7 +191,7 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
 	struct igt_spin *spin;
 	struct xe_spin *xe_spin;
 	struct drm_xe_sync sync = {
-		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -288,7 +288,7 @@ void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
 	uint32_t vm, bo, exec_queue, syncobj;
 	struct xe_spin *spin;
 	struct drm_xe_sync sync = {
-		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 780125f92..2635edf72 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -179,8 +179,8 @@ void xe_bind_unbind_async(int xe, uint32_t vm, uint32_t bind_engine,
 {
 	struct drm_xe_vm_bind_op *bind_ops;
 	struct drm_xe_sync tabsyncs[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ, .handle = sync_in },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, .handle = sync_out },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ, .handle = sync_in },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, .handle = sync_out },
 	};
 	struct drm_xe_sync *syncs;
 	uint32_t num_binds = 0;
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index bb844b641..465f67e23 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -343,7 +343,7 @@ static void block_copy(int xe,
 		uint32_t vm, exec_queue;
 
 		if (config->new_ctx) {
-			vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+			vm = xe_vm_create(xe, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 			exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
 			surf_ctx = intel_ctx_xe(xe, vm, exec_queue, 0, 0, 0);
 			surf_ahnd = intel_allocator_open(xe, surf_ctx->vm,
@@ -550,7 +550,7 @@ static void block_copy_test(int xe,
 				      copyfns[copy_function].suffix) {
 				uint32_t sync_bind, sync_out;
 
-				vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+				vm = xe_vm_create(xe, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 				exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
 				sync_bind = syncobj_create(xe, 0);
 				sync_out = syncobj_create(xe, 0);
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index 1dafbb276..191c29155 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -134,7 +134,7 @@ static void copy_test(int fd, uint32_t size, enum blt_cmd_type cmd, uint32_t reg
 
 	src_handle = xe_bo_create_flags(fd, 0, bo_size, region);
 	dst_handle = xe_bo_create_flags(fd, 0, bo_size, region);
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
 	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
 
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index d99bd51cf..4242e1a67 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -54,7 +54,7 @@ static void create_invalid_size(int fd)
 	uint32_t handle;
 	int ret;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 
 	xe_for_each_mem_region(fd, memreg, region) {
 		memregion = xe_mem_region(fd, region);
@@ -140,7 +140,7 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
 
 	fd = drm_reopen_driver(fd);
 	num_engines = xe_number_hw_engines(fd);
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 
 	exec_queues_per_process = max_t(uint32_t, 1, MAXEXECQUEUES / nproc);
 	igt_debug("nproc: %u, exec_queues per process: %u\n", nproc, exec_queues_per_process);
@@ -199,7 +199,7 @@ static void create_massive_size(int fd)
 	uint32_t handle;
 	int ret;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 
 	xe_for_each_mem_region(fd, memreg, region) {
 		ret = __create_bo(fd, vm, -1ULL << 32, region, &handle);
diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index 5c401b6dd..0d835dddb 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -144,8 +144,8 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 		uint64_t sdi_addr = addr + sdi_offset;
 		uint64_t spin_offset = (char *)&data[i]->spin - (char *)data[i];
 		struct drm_xe_sync sync[2] = {
-			{ .flags = DRM_XE_SYNC_SYNCOBJ, },
-			{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+			{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ, },
+			{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 		};
 		struct drm_xe_exec exec = {
 			.num_batch_buffer = 1,
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 64168ed19..4ef30cf49 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -48,8 +48,8 @@ static void test_active(int fd, struct drm_xe_engine_class_instance *eci)
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -71,7 +71,7 @@ static void test_active(int fd, struct drm_xe_engine_class_instance *eci)
 	struct xe_spin_opts spin_opts = { .preempt = true };
 	int i, b, ret;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * N_EXEC_QUEUES;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -110,20 +110,20 @@ static void test_active(int fd, struct drm_xe_engine_class_instance *eci)
 				xe_spin_init(&data[i].spin, &spin_opts);
 				exec.exec_queue_id = exec_queues[e];
 				exec.address = spin_opts.addr;
-				sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
-				sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+				sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+				sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 				sync[1].handle = syncobjs[e];
 				xe_exec(fd, &exec);
 				xe_spin_wait_started(&data[i].spin);
 
 				addr += bo_size;
-				sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
+				sync[1].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 				sync[1].handle = syncobjs[e];
 				xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo, 0, addr,
 						 bo_size, sync + 1, 1);
 				addr += bo_size;
 			} else {
-				sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+				sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 				xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo, 0, addr,
 						 bo_size, sync, 1);
 			}
@@ -149,7 +149,7 @@ static void test_active(int fd, struct drm_xe_engine_class_instance *eci)
 
 		syncobj_destroy(fd, sync[0].handle);
 		sync[0].handle = syncobj_create(fd, 0);
-		sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 		xe_vm_unbind_all_async(fd, vm, 0, bo, sync, 1);
 		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
@@ -221,7 +221,7 @@ static void test_total_resident(int xe)
 	uint64_t addr = 0x1a0000;
 	int ret;
 
-	vm = xe_vm_create(xe, DRM_XE_VM_CREATE_SCRATCH_PAGE, 0);
+	vm = xe_vm_create(xe, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
 
 	xe_for_each_mem_region(xe, memreg, region) {
 		uint64_t pre_size;
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 5d8463270..6d953e58b 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -38,8 +38,8 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t bind_exec_queues[3] = { 0, 0, 0 };
 	uint64_t addr = 0x100000000, base_addr = 0x100000000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -63,12 +63,12 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 
 	fd = drm_open_driver(DRIVER_XE);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	if (flags & BIND_EXEC_QUEUE)
 		bind_exec_queues[0] = xe_bind_exec_queue_create(fd, vm, 0, true);
 	if (flags & MULTI_VM) {
-		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
-		vm3 = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+		vm3 = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 		if (flags & BIND_EXEC_QUEUE) {
 			bind_exec_queues[1] = xe_bind_exec_queue_create(fd, vm2,
 									0, true);
@@ -121,7 +121,7 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 				 ALIGN(sizeof(*data) * n_execs, 0x1000));
 
 		if (i < n_execs / 2) {
-			sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+			sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 			sync[0].handle = syncobj_create(fd, 0);
 			if (flags & MULTI_VM) {
 				xe_vm_bind_async(fd, vm3, bind_exec_queues[2], __bo,
@@ -149,7 +149,7 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 		data[i].batch[b++] = MI_BATCH_BUFFER_END;
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 		if (i >= n_exec_queues)
 			syncobj_reset(fd, &syncobjs[e], 1);
 		sync[1].handle = syncobjs[e];
@@ -216,7 +216,7 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 	uint64_t addr = 0x100000000, base_addr = 0x100000000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_USER_FENCE | DRM_XE_SYNC_SIGNAL,
+		{ .flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
 		  .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
@@ -242,13 +242,13 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 
 	fd = drm_open_driver(DRIVER_XE);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
-			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
+			  DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE, 0);
 	if (flags & BIND_EXEC_QUEUE)
 		bind_exec_queues[0] = xe_bind_exec_queue_create(fd, vm, 0, true);
 	if (flags & MULTI_VM) {
-		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
-				   DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
+		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
+				   DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE, 0);
 		if (flags & BIND_EXEC_QUEUE)
 			bind_exec_queues[1] = xe_bind_exec_queue_create(fd, vm2,
 									0, true);
diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
index 4f2876ecb..1f5c795ef 100644
--- a/tests/intel/xe_evict_ccs.c
+++ b/tests/intel/xe_evict_ccs.c
@@ -226,7 +226,7 @@ static void evict_single(int fd, int child, const struct config *config)
 	uint32_t kb_left = config->mb_per_proc * SZ_1K;
 	uint32_t min_alloc_kb = config->param->min_size_kb;
 	uint32_t max_alloc_kb = config->param->max_size_kb;
-	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	uint64_t ahnd = intel_allocator_open(fd, vm, INTEL_ALLOCATOR_RELOC);
 	uint8_t uc_mocs = intel_get_uc_mocs_index(fd);
 	struct object *obj, *tmp;
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 3ca3de881..8a0165b8c 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -37,8 +37,8 @@ static void test_all_active(int fd, int gt, int class)
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -66,7 +66,7 @@ static void test_all_active(int fd, int gt, int class)
 	if (num_placements < 2)
 		return;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * num_placements;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
@@ -93,8 +93,8 @@ static void test_all_active(int fd, int gt, int class)
 	for (i = 0; i < num_placements; i++) {
 		spin_opts.addr = addr + (char *)&data[i].spin - (char *)data;
 		xe_spin_init(&data[i].spin, &spin_opts);
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
-		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 		sync[1].handle = syncobjs[i];
 
 		exec.exec_queue_id = exec_queues[i];
@@ -110,7 +110,7 @@ static void test_all_active(int fd, int gt, int class)
 	}
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
@@ -176,8 +176,8 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_syncs = 2,
@@ -207,7 +207,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	if (num_placements < 2)
 		return;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
@@ -269,8 +269,8 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		data[i].batch[b++] = MI_BATCH_BUFFER_END;
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
-		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 		sync[1].handle = syncobjs[e];
 
 		exec.exec_queue_id = exec_queues[e];
@@ -281,11 +281,11 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		xe_exec(fd, &exec);
 
 		if (flags & REBIND && i + 1 != n_execs) {
-			sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
+			sync[1].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 			xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size,
 					   sync + 1, 1);
 
-			sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+			sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 			addr += bo_size;
 			if (bo)
 				xe_vm_bind_async(fd, vm, 0, bo, 0, addr,
@@ -329,7 +329,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 					NULL));
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
@@ -399,7 +399,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	uint64_t addr = 0x1a0000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_USER_FENCE | DRM_XE_SYNC_SIGNAL,
+		{ .flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
 	          .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
@@ -433,8 +433,8 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	if (num_placements < 2)
 		return;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
-			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
+			  DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 232ddde8e..a401f0165 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -81,8 +81,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	  int n_exec_queues, int n_execs, int n_vm, unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -109,7 +109,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert(n_vm <= MAX_N_EXEC_QUEUES);
 
 	for (i = 0; i < n_vm; ++i)
-		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -199,9 +199,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		data[i].batch[b++] = MI_BATCH_BUFFER_END;
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 		sync[0].handle = bind_syncobjs[cur_vm];
-		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 		sync[1].handle = syncobjs[e];
 
 		exec.exec_queue_id = exec_queues[e];
@@ -213,11 +213,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		if (flags & REBIND && i + 1 != n_execs) {
 			uint32_t __vm = vm[cur_vm];
 
-			sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
+			sync[1].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 			xe_vm_unbind_async(fd, __vm, bind_exec_queues[e], 0,
 					   __addr, bo_size, sync + 1, 1);
 
-			sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+			sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 			addr[i % n_vm] += bo_size;
 			__addr = addr[i % n_vm];
 			if (bo)
@@ -266,7 +266,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		igt_assert(syncobj_wait(fd, &bind_syncobjs[i], 1, INT64_MAX, 0,
 					NULL));
 
-	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	for (i = 0; i < n_vm; ++i) {
 		syncobj_reset(fd, &sync[0].handle, 1);
 		xe_vm_unbind_async(fd, vm[i], bind_exec_queues[i], 0, addr[i],
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index b0a677dca..20d3fc6e8 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -88,7 +88,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	uint64_t addr = 0x1a0000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_USER_FENCE | DRM_XE_SYNC_SIGNAL,
+		{ .flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
 	          .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
@@ -113,8 +113,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
-			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
+			  DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 92359d1a7..b66f31419 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -8,7 +8,7 @@
  * Category: Hardware building block
  * Sub-category: execbuf
  * Functionality: fault mode
- * GPU requirements: GPU needs support for DRM_XE_VM_CREATE_FAULT_MODE
+ * GPU requirements: GPU needs support for DRM_XE_VM_CREATE_FLAG_FAULT_MODE
  */
 
 #include <fcntl.h>
@@ -107,7 +107,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	uint64_t addr = 0x1a0000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_USER_FENCE | DRM_XE_SYNC_SIGNAL,
+		{ .flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
 	          .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
@@ -131,8 +131,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
-			  DRM_XE_VM_CREATE_FAULT_MODE, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -347,7 +347,7 @@ test_atomic(int fd, struct drm_xe_engine_class_instance *eci,
 	uint64_t addr = 0x1a0000, addr_wait;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_USER_FENCE | DRM_XE_SYNC_SIGNAL,
+		{ .flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
 	          .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
@@ -375,8 +375,8 @@ test_atomic(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t *ptr;
 	int i, b, wait_idx = 0;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
-			  DRM_XE_VM_CREATE_FAULT_MODE, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
 	bo_size = sizeof(*data) * n_atomic;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 39647b736..195e62911 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -30,8 +30,8 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -45,7 +45,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 	struct xe_spin *spin;
 	struct xe_spin_opts spin_opts = { .addr = addr, .preempt = false };
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*spin);
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -62,8 +62,8 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 
 	xe_spin_init(spin, &spin_opts);
 
-	sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
-	sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	sync[1].handle = syncobj;
 
 	exec.exec_queue_id = exec_queue;
@@ -78,7 +78,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
@@ -140,8 +140,8 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_syncs = 2,
@@ -176,7 +176,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	if (num_placements < 2)
 		return;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -257,8 +257,8 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		for (j = 0; j < num_placements && flags & PARALLEL; ++j)
 			batches[j] = exec_addr;
 
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
-		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 		sync[1].handle = syncobjs[e];
 
 		exec.exec_queue_id = exec_queues[e];
@@ -288,7 +288,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 					NULL));
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
@@ -336,8 +336,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -362,7 +362,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -425,8 +425,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 			exec_addr = batch_addr;
 		}
 
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
-		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 		sync[1].handle = syncobjs[e];
 
 		exec.exec_queue_id = exec_queues[e];
@@ -455,7 +455,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 					NULL));
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
@@ -501,7 +501,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	uint64_t addr = 0x1a0000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_USER_FENCE | DRM_XE_SYNC_SIGNAL,
+		{ .flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
 	          .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
@@ -528,8 +528,8 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
-			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
+			  DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 90684b8cb..46caa2e0c 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -55,7 +55,7 @@ static void store_dword_batch(struct data *data, uint64_t addr, int value)
 static void store(int fd)
 {
 	struct drm_xe_sync sync = {
-		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -75,7 +75,7 @@ static void store(int fd)
 	syncobj = syncobj_create(fd, 0);
 	sync.handle = syncobj;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data);
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -91,7 +91,7 @@ static void store(int fd)
 	exec_queue = xe_exec_queue_create(fd, vm, hw_engine, 0);
 	exec.exec_queue_id = exec_queue;
 	exec.address = data->addr;
-	sync.flags &= DRM_XE_SYNC_SIGNAL;
+	sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_exec(fd, &exec);
 
 	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
@@ -112,8 +112,8 @@ static void store(int fd)
 static void store_all(int fd, int gt, int class)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, }
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, }
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -132,7 +132,7 @@ static void store_all(int fd, int gt, int class)
 	struct drm_xe_engine_class_instance *hwe;
 	int i, num_placements = 0;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data);
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -169,8 +169,8 @@ static void store_all(int fd, int gt, int class)
 	for (i = 0; i < num_placements; i++) {
 
 		store_dword_batch(data, addr, i);
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
-		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 		sync[1].handle = syncobjs[i];
 
 		exec.exec_queue_id = exec_queues[i];
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index b814dcdf5..bb979b18c 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -47,8 +47,8 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 	      int class, int n_exec_queues, int n_execs, unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_sync sync_all[MAX_N_EXEC_QUEUES];
 	struct drm_xe_exec exec = {
@@ -77,7 +77,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 
 	if (!vm) {
-		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 		owns_vm = true;
 	}
 
@@ -125,7 +125,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 					&create), 0);
 		exec_queues[i] = create.exec_queue_id;
 		syncobjs[i] = syncobj_create(fd, 0);
-		sync_all[i].flags = DRM_XE_SYNC_SYNCOBJ;
+		sync_all[i].flags = DRM_XE_SYNC_FLAG_SYNCOBJ;
 		sync_all[i].handle = syncobjs[i];
 	};
 	exec.num_batch_buffer = flags & PARALLEL ? num_placements : 1;
@@ -158,8 +158,8 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		data[i].batch[b++] = MI_BATCH_BUFFER_END;
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
-		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 		sync[1].handle = syncobjs[e];
 
 		exec.exec_queue_id = exec_queues[e];
@@ -173,7 +173,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 			xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size,
 					   sync_all, n_exec_queues);
 
-			sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+			sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 			addr += bo_size;
 			if (bo)
 				xe_vm_bind_async(fd, vm, 0, bo, 0, addr,
@@ -221,7 +221,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 					NULL));
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
@@ -254,7 +254,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 {
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_USER_FENCE | DRM_XE_SYNC_SIGNAL,
+		{ .flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
 	          .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
@@ -285,8 +285,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 
 	if (!vm) {
-		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
-				  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
+				  DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE, 0);
 		owns_vm = true;
 	}
 
@@ -457,8 +457,8 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		 int n_execs, unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_sync sync_all[MAX_N_EXEC_QUEUES];
 	struct drm_xe_exec exec = {
@@ -489,7 +489,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 
 	if (!vm) {
-		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 		owns_vm = true;
 	}
 
@@ -536,7 +536,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		else
 			bind_exec_queues[i] = 0;
 		syncobjs[i] = syncobj_create(fd, 0);
-		sync_all[i].flags = DRM_XE_SYNC_SYNCOBJ;
+		sync_all[i].flags = DRM_XE_SYNC_FLAG_SYNCOBJ;
 		sync_all[i].handle = syncobjs[i];
 	};
 
@@ -576,8 +576,8 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 			exec_addr = batch_addr;
 		}
 
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
-		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 		sync[1].handle = syncobjs[e];
 
 		exec.exec_queue_id = exec_queues[e];
@@ -599,7 +599,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 					   0, addr, bo_size,
 					   sync_all, n_exec_queues);
 
-			sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+			sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 			addr += bo_size;
 			if (bo)
 				xe_vm_bind_async(fd, vm, bind_exec_queues[e],
@@ -649,7 +649,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 					NULL));
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr,
 			   bo_size, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
@@ -1001,11 +1001,11 @@ static void threads(int fd, int flags)
 
 	if (flags & SHARED_VM) {
 		vm_legacy_mode = xe_vm_create(fd,
-					      DRM_XE_VM_CREATE_ASYNC_DEFAULT,
+					      DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT,
 					      0);
 		vm_compute_mode = xe_vm_create(fd,
-					       DRM_XE_VM_CREATE_ASYNC_DEFAULT |
-					       DRM_XE_VM_CREATE_COMPUTE_MODE,
+					       DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
+					       DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE,
 					       0);
 	}
 
diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
index df774130f..fd310138d 100644
--- a/tests/intel/xe_exercise_blt.c
+++ b/tests/intel/xe_exercise_blt.c
@@ -280,7 +280,7 @@ static void fast_copy_test(int xe,
 			region1 = igt_collection_get_value(regions, 0);
 			region2 = igt_collection_get_value(regions, 1);
 
-			vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+			vm = xe_vm_create(xe, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 			exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
 			ctx = intel_ctx_xe(xe, vm, exec_queue, 0, 0, 0);
 
diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
index 3f2c4ae23..fa2f20cca 100644
--- a/tests/intel/xe_guc_pc.c
+++ b/tests/intel/xe_guc_pc.c
@@ -37,8 +37,8 @@ static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -60,7 +60,7 @@ static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 	igt_assert(n_execs > 0);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -95,8 +95,8 @@ static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
 		data[i].batch[b++] = MI_BATCH_BUFFER_END;
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
-		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 		sync[1].handle = syncobjs[e];
 
 		exec.exec_queue_id = exec_queues[e];
@@ -114,7 +114,7 @@ static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
 
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr,
 			   bo_size, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
index 4f5ce2212..eda9e5216 100644
--- a/tests/intel/xe_huc_copy.c
+++ b/tests/intel/xe_huc_copy.c
@@ -118,7 +118,7 @@ __test_huc_copy(int fd, uint32_t vm, struct drm_xe_engine_class_instance *hwe)
 	};
 
 	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
-	sync.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL;
+	sync.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL;
 	sync.handle = syncobj_create(fd, 0);
 
 	for(int i = 0; i < BO_DICT_ENTRIES; i++) {
@@ -156,7 +156,7 @@ test_huc_copy(int fd)
 	uint32_t vm;
 	uint32_t tested_gts = 0;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 
 	xe_for_each_hw_engine(fd, hwe) {
 		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE &&
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index 26e4dcc85..d66996cd5 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -191,7 +191,7 @@ static void simple_bb(struct buf_ops *bops, bool new_context)
 	intel_bb_reset(ibb, true);
 
 	if (new_context) {
-		vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+		vm = xe_vm_create(xe, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 		ctx = xe_exec_queue_create(xe, vm, xe_hw_engine(xe, 0), 0);
 		intel_bb_destroy(ibb);
 		ibb = intel_bb_create_with_context(xe, ctx, vm, NULL, PAGE_SIZE);
diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index 88b22ed11..9c2a70ff3 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -64,7 +64,7 @@ static void test_ping_pong(int fd, struct drm_xe_engine_class_instance *eci)
 	 * stats.
 	 */
 	for (i = 0; i < NUM_VMS; ++i) {
-		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
+		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE, 0);
 		for (j = 0; j < NUM_BOS; ++j) {
 			igt_debug("Creating bo size %lu for vm %u\n",
 				  (unsigned long) bo_size,
diff --git a/tests/intel/xe_perf_pmu.c b/tests/intel/xe_perf_pmu.c
index a0dd30e50..e9d05cf2b 100644
--- a/tests/intel/xe_perf_pmu.c
+++ b/tests/intel/xe_perf_pmu.c
@@ -81,8 +81,8 @@ static void test_any_engine_busyness(int fd, struct drm_xe_engine_class_instance
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -98,7 +98,7 @@ static void test_any_engine_busyness(int fd, struct drm_xe_engine_class_instance
 	uint32_t pmu_fd;
 	uint64_t count, idle;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*spin);
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -118,8 +118,8 @@ static void test_any_engine_busyness(int fd, struct drm_xe_engine_class_instance
 
 	xe_spin_init(spin, &spin_opts);
 
-	sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
-	sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	sync[1].handle = syncobj;
 
 	exec.exec_queue_id = exec_queue;
@@ -135,7 +135,7 @@ static void test_any_engine_busyness(int fd, struct drm_xe_engine_class_instance
 	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
@@ -185,8 +185,8 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -219,7 +219,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 	igt_skip_on_f(!num_placements, "Engine class:%d gt:%d not enabled on this platform\n",
 		      class, gt);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * num_placements;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
@@ -250,8 +250,8 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 	for (i = 0; i < num_placements; i++) {
 		spin_opts.addr = addr + (char *)&data[i].spin - (char *)data;
 		xe_spin_init(&data[i].spin, &spin_opts);
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
-		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 		sync[1].handle = syncobjs[i];
 
 		exec.exec_queue_id = exec_queues[i];
@@ -268,7 +268,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index d07ed4535..18afb68b0 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -231,8 +231,8 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -259,7 +259,7 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	if (check_rpm)
 		igt_assert(in_d3(device, d_state));
 
-	vm = xe_vm_create(device.fd_xe, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(device.fd_xe, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 
 	if (check_rpm)
 		igt_assert(out_of_d3(device, d_state));
@@ -304,8 +304,8 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		data[i].batch[b++] = MI_BATCH_BUFFER_END;
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
-		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 		sync[1].handle = syncobjs[e];
 
 		exec.exec_queue_id = exec_queues[e];
@@ -331,7 +331,7 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	if (check_rpm && runtime_usage_available(device.pci_xe))
 		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
 
-	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_vm_unbind_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
 			   bo_size, sync, 1);
 	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 8e9197fae..c87eeef3c 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -87,7 +87,7 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
 	} *data;
 
 	struct drm_xe_sync sync = {
-		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
 	};
 
 	struct drm_xe_exec exec = {
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index eb5d6aba8..6ab604d9b 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -145,7 +145,7 @@ static void xe_spin_fixed_duration(int fd)
 {
 	struct drm_xe_sync sync = {
 		.handle = syncobj_create(fd, 0),
-		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 73dc23771..7164f8c12 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -89,7 +89,7 @@ write_dwords(int fd, uint32_t vm, int n_dwords, uint64_t *addrs)
 static void
 test_scratch(int fd)
 {
-	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_SCRATCH_PAGE, 0);
+	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
 	uint64_t addrs[] = {
 		0x000000000000ull,
 		0x7ffdb86402d8ull,
@@ -124,7 +124,7 @@ __test_bind_one_bo(int fd, uint32_t vm, int n_addrs, uint64_t *addrs)
 		uint64_t bind_addr = addrs[i] & ~(uint64_t)(bo_size - 1);
 
 		if (!vm)
-			vms[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_SCRATCH_PAGE,
+			vms[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE,
 					      0);
 		igt_debug("Binding addr %"PRIx64"\n", addrs[i]);
 		xe_vm_bind_sync(fd, vm ? vm : vms[i], bo, 0,
@@ -214,7 +214,7 @@ test_bind_once(int fd)
 	uint64_t addr = 0x7ffdb86402d8ull;
 
 	__test_bind_one_bo(fd,
-			   xe_vm_create(fd, DRM_XE_VM_CREATE_SCRATCH_PAGE, 0),
+			   xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0),
 			   1, &addr);
 }
 
@@ -234,7 +234,7 @@ test_bind_one_bo_many_times(int fd)
 						ARRAY_SIZE(addrs_48b);
 
 	__test_bind_one_bo(fd,
-			   xe_vm_create(fd, DRM_XE_VM_CREATE_SCRATCH_PAGE, 0),
+			   xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0),
 			   addrs_size, addrs);
 }
 
@@ -272,10 +272,10 @@ static void unbind_all(int fd, int n_vmas)
 	uint32_t vm;
 	int i;
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo = xe_bo_create(fd, 0, vm, bo_size);
 
 	for (i = 0; i < n_vmas; ++i)
@@ -347,8 +347,8 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 	uint32_t vm;
 	uint64_t addr = 0x1000 * 512;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_sync sync_all[MAX_N_EXEC_QUEUES + 1];
 	struct drm_xe_exec exec = {
@@ -372,7 +372,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 	data = malloc(sizeof(*data) * n_bo);
 	igt_assert(data);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(struct shared_pte_page_data);
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -387,7 +387,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 	for (i = 0; i < n_exec_queues; i++) {
 		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 		syncobjs[i] = syncobj_create(fd, 0);
-		sync_all[i].flags = DRM_XE_SYNC_SYNCOBJ;
+		sync_all[i].flags = DRM_XE_SYNC_FLAG_SYNCOBJ;
 		sync_all[i].handle = syncobjs[i];
 	};
 
@@ -412,8 +412,8 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 		data[i]->batch[b++] = MI_BATCH_BUFFER_END;
 		igt_assert(b <= ARRAY_SIZE(data[i]->batch));
 
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
-		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 		sync[1].handle = syncobjs[e];
 
 		exec.exec_queue_id = exec_queues[e];
@@ -425,7 +425,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 		if (i % 2)
 			continue;
 
-		sync_all[n_execs].flags = DRM_XE_SYNC_SIGNAL;
+		sync_all[n_execs].flags = DRM_XE_SYNC_FLAG_SIGNAL;
 		sync_all[n_execs].handle = sync[0].handle;
 		xe_vm_unbind_async(fd, vm, 0, 0, addr + i * addr_stride,
 				   bo_size, sync_all, n_execs + 1);
@@ -461,8 +461,8 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 		data[i]->batch[b++] = MI_BATCH_BUFFER_END;
 		igt_assert(b <= ARRAY_SIZE(data[i]->batch));
 
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
-		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 		sync[1].handle = syncobjs[e];
 
 		exec.exec_queue_id = exec_queues[e];
@@ -475,7 +475,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 		if (!(i % 2))
 			continue;
 
-		sync_all[n_execs].flags = DRM_XE_SYNC_SIGNAL;
+		sync_all[n_execs].flags = DRM_XE_SYNC_FLAG_SIGNAL;
 		sync_all[n_execs].handle = sync[0].handle;
 		xe_vm_unbind_async(fd, vm, 0, 0, addr + i * addr_stride,
 				   bo_size, sync_all, n_execs + 1);
@@ -530,8 +530,8 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -553,7 +553,7 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
 	struct xe_spin_opts spin_opts = { .preempt = true };
 	int i, b;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * N_EXEC_QUEUES;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -587,22 +587,22 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
 			xe_spin_init(&data[i].spin, &spin_opts);
 			exec.exec_queue_id = exec_queues[e];
 			exec.address = spin_opts.addr;
-			sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
-			sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+			sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+			sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 			sync[1].handle = syncobjs[e];
 			xe_exec(fd, &exec);
 			xe_spin_wait_started(&data[i].spin);
 
 			/* Do bind to 1st exec_queue blocked on cork */
 			addr += (flags & CONFLICT) ? (0x1 << 21) : bo_size;
-			sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
+			sync[1].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 			sync[1].handle = syncobjs[e];
 			xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo, 0, addr,
 					 bo_size, sync + 1, 1);
 			addr += bo_size;
 		} else {
 			/* Do bind to 2nd exec_queue which blocks write below */
-			sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+			sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 			xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo, 0, addr,
 					 bo_size, sync, 1);
 		}
@@ -620,8 +620,8 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
 		data[i].batch[b++] = MI_BATCH_BUFFER_END;
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
-		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 		sync[1].handle = syncobjs[!i ? N_EXEC_QUEUES : e];
 
 		exec.num_syncs = 2;
@@ -665,7 +665,7 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
 
 	syncobj_destroy(fd, sync[0].handle);
 	sync[0].handle = syncobj_create(fd, 0);
-	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_vm_unbind_all_async(fd, vm, 0, bo, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
@@ -712,8 +712,8 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 	uint32_t vm;
 	uint64_t addr = 0x1a0000, base_addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -733,7 +733,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 
 	igt_assert(n_execs <= BIND_ARRAY_MAX_N_EXEC);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -779,8 +779,8 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 		data[i].batch[b++] = MI_BATCH_BUFFER_END;
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
-		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 		if (i == n_execs - 1) {
 			sync[1].handle = syncobj_create(fd, 0);
 			exec.num_syncs = 2;
@@ -802,8 +802,8 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 	}
 
 	syncobj_reset(fd, &sync[0].handle, 1);
-	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
-	sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_vm_bind_array(fd, vm, bind_exec_queue, bind_ops, n_execs, sync, 2);
 
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
@@ -900,8 +900,8 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 		 unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -927,7 +927,7 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 
 	if (flags & LARGE_BIND_FLAG_USERPTR) {
 		map = aligned_alloc(xe_get_default_alignment(fd), bo_size);
@@ -984,8 +984,8 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 		data[i].batch[b++] = MI_BATCH_BUFFER_END;
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
-		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 		sync[1].handle = syncobjs[e];
 
 		if (i != e)
@@ -1007,7 +1007,7 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
 	syncobj_reset(fd, &sync[0].handle, 1);
-	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	if (flags & LARGE_BIND_FLAG_SPLIT) {
 		xe_vm_unbind_async(fd, vm, 0, 0, base_addr,
 				   bo_size / 2, NULL, 0);
@@ -1060,7 +1060,7 @@ static void *hammer_thread(void *tdata)
 {
 	struct thread_data *t = tdata;
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -1184,8 +1184,8 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 			 unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -1219,7 +1219,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 			unbind_n_page_offset *= n_page_per_2mb;
 	}
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo_size = page_size * bo_n_pages;
 
 	if (flags & MAP_FLAG_USERPTR) {
@@ -1287,10 +1287,10 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 		data->batch[b++] = MI_BATCH_BUFFER_END;
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 		if (i)
 			syncobj_reset(fd, &sync[1].handle, 1);
-		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 
 		exec.exec_queue_id = exec_queue;
 		exec.address = batch_addr;
@@ -1302,8 +1302,8 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 
 	/* Unbind some of the pages */
 	syncobj_reset(fd, &sync[0].handle, 1);
-	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
-	sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_vm_unbind_async(fd, vm, 0, 0,
 			   addr + unbind_n_page_offset * page_size,
 			   unbind_n_pages * page_size, sync, 2);
@@ -1344,9 +1344,9 @@ try_again_after_invalidate:
 			data->batch[b++] = MI_BATCH_BUFFER_END;
 			igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
-			sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+			sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 			syncobj_reset(fd, &sync[1].handle, 1);
-			sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+			sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 
 			exec.exec_queue_id = exec_queue;
 			exec.address = batch_addr;
@@ -1387,7 +1387,7 @@ try_again_after_invalidate:
 
 	/* Confirm unbound region can be rebound */
 	syncobj_reset(fd, &sync[0].handle, 1);
-	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	if (flags & MAP_FLAG_USERPTR)
 		xe_vm_bind_userptr_async(fd, vm, 0,
 					 addr + unbind_n_page_offset * page_size,
@@ -1415,9 +1415,9 @@ try_again_after_invalidate:
 		data->batch[b++] = MI_BATCH_BUFFER_END;
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 		syncobj_reset(fd, &sync[1].handle, 1);
-		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 
 		exec.exec_queue_id = exec_queue;
 		exec.address = batch_addr;
@@ -1485,8 +1485,8 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 		     int unbind_n_pages, unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -1519,7 +1519,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 			unbind_n_page_offset *= n_page_per_2mb;
 	}
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo_size = page_size * bo_n_pages;
 
 	if (flags & MAP_FLAG_USERPTR) {
@@ -1593,10 +1593,10 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 		data->batch[b++] = MI_BATCH_BUFFER_END;
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 		if (i)
 			syncobj_reset(fd, &sync[1].handle, 1);
-		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 
 		exec.exec_queue_id = exec_queue;
 		exec.address = batch_addr;
@@ -1608,8 +1608,8 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 
 	/* Bind some of the pages to different BO / userptr */
 	syncobj_reset(fd, &sync[0].handle, 1);
-	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
-	sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 	if (flags & MAP_FLAG_USERPTR)
 		xe_vm_bind_userptr_async(fd, vm, 0, addr + bo_size +
 					 unbind_n_page_offset * page_size,
@@ -1661,10 +1661,10 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 		data->batch[b++] = MI_BATCH_BUFFER_END;
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
-		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 		if (i)
 			syncobj_reset(fd, &sync[1].handle, 1);
-		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 
 		exec.exec_queue_id = exec_queue;
 		exec.address = batch_addr;
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index e0116f181..05060f329 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -30,7 +30,7 @@ static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 		    uint64_t addr, uint64_t size, uint64_t val)
 {
 	struct drm_xe_sync sync[1] = {};
-	sync[0].flags = DRM_XE_SYNC_USER_FENCE | DRM_XE_SYNC_SIGNAL;
+	sync[0].flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL;
 
 	sync[0].addr = to_user_pointer(&wait_fence);
 	sync[0].timeline_value = val;
@@ -63,7 +63,7 @@ waitfence(int fd, enum waittype wt)
 	uint32_t bo_7;
 	int64_t timeout;
 
-	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo_1 = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
 	do_bind(fd, vm, bo_1, 0, 0x200000, 0x40000, 1);
 	bo_2 = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
-- 
2.34.1
