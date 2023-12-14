Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D970C10E257
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Dec 2023 19:23:46 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] drm-uapi/xe: Remove sync binds
Date: Thu, 14 Dec 2023 11:24:08 -0800
Message-Id: <20231214192408.661690-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Align with commit ("drm/xe/uapi: Remove sync binds")

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 benchmarks/gem_wsim.c                |  3 +-
 include/drm-uapi/xe_drm.h            | 22 +++++++------
 lib/igt_fb.c                         |  2 +-
 lib/intel_batchbuffer.c              |  7 ++--
 lib/intel_compute.c                  |  2 +-
 lib/xe/xe_ioctl.c                    | 48 ++++++++++++----------------
 lib/xe/xe_ioctl.h                    |  9 +-----
 lib/xe/xe_query.c                    |  3 +-
 lib/xe/xe_util.c                     |  4 +--
 tests/intel/xe_access_counter.c      |  2 +-
 tests/intel/xe_ccs.c                 |  4 +--
 tests/intel/xe_copy_basic.c          |  2 +-
 tests/intel/xe_create.c              |  8 ++---
 tests/intel/xe_drm_fdinfo.c          |  4 +--
 tests/intel/xe_evict.c               | 25 ++++++---------
 tests/intel/xe_evict_ccs.c           |  2 +-
 tests/intel/xe_exec_balancer.c       |  7 ++--
 tests/intel/xe_exec_basic.c          |  6 ++--
 tests/intel/xe_exec_compute_mode.c   |  7 ++--
 tests/intel/xe_exec_fault_mode.c     |  5 ++-
 tests/intel/xe_exec_queue_property.c |  2 +-
 tests/intel/xe_exec_reset.c          |  9 +++---
 tests/intel/xe_exec_store.c          |  6 ++--
 tests/intel/xe_exec_threads.c        | 14 +++-----
 tests/intel/xe_exercise_blt.c        |  2 +-
 tests/intel/xe_huc_copy.c            |  2 +-
 tests/intel/xe_intel_bb.c            |  2 +-
 tests/intel/xe_noexec_ping_pong.c    |  4 +--
 tests/intel/xe_pat.c                 |  4 +--
 tests/intel/xe_peer2peer.c           |  4 +--
 tests/intel/xe_pm.c                  |  2 +-
 tests/intel/xe_spin_batch.c          |  2 +-
 tests/intel/xe_vm.c                  | 24 +++++++-------
 tests/intel/xe_waitfence.c           |  8 ++---
 34 files changed, 113 insertions(+), 144 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 30673da8f6..955b6799ea 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -2037,8 +2037,7 @@ static void xe_vm_create_(struct xe_vm *vm)
 	uint32_t flags = 0;
 
 	if (vm->compute_mode)
-		flags |= DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-			 DRM_XE_VM_CREATE_FLAG_LR_MODE;
+		flags |= DRM_XE_VM_CREATE_FLAG_LR_MODE;
 
 	vm->id = xe_vm_create(fd, flags, 0);
 }
diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 590f7b7af4..48025258e8 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -129,7 +129,6 @@ struct xe_user_extension {
  * It is returned as part of the @drm_xe_engine, but it also is used as
  * the input of engine selection for both @drm_xe_exec_queue_create and
  * @drm_xe_query_engine_cycles
- *
  */
 struct drm_xe_engine_class_instance {
 #define DRM_XE_ENGINE_CLASS_RENDER		0
@@ -141,11 +140,12 @@ struct drm_xe_engine_class_instance {
 	 * Kernel only classes (not actual hardware engine class). Used for
 	 * creating ordered queues of VM bind operations.
 	 */
-#define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
-#define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
+#define DRM_XE_ENGINE_CLASS_VM_BIND		5
+	/** @engine_class: engine class id */
 	__u16 engine_class;
-
+	/** @engine_instance: engine instance id */
 	__u16 engine_instance;
+	/** @gt_id: Unique ID of this GT within the PCI Device */
 	__u16 gt_id;
 	/** @pad: MBZ */
 	__u16 pad;
@@ -660,7 +660,6 @@ struct drm_xe_vm_create {
 	 * still enable recoverable pagefaults if supported by the device.
 	 */
 #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
-#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
 	/*
 	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE requires also
 	 * DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to be allocated
@@ -668,7 +667,7 @@ struct drm_xe_vm_create {
 	 * The xe driver internally uses recoverable pagefaults to implement
 	 * this.
 	 */
-#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
+#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
 	/** @flags: Flags */
 	__u32 flags;
 
@@ -736,6 +735,12 @@ struct drm_xe_vm_bind_op {
 	 *
 	 * Note: For userptr and externally imported dma-buf the kernel expects
 	 * either 1WAY or 2WAY for the @pat_index.
+	 *
+	 * For DRM_XE_VM_BIND_FLAG_NULL bindings there are no KMD restrictions
+	 * on the @pat_index. For such mappings there is no actual memory being
+	 * mapped (the address in the PTE is invalid), so the various PAT memory
+	 * attributes likely do not apply.  Simply leaving as zero is one
+	 * option (still a valid pat_index).
 	 */
 	__u16 pat_index;
 
@@ -770,12 +775,11 @@ struct drm_xe_vm_bind_op {
 	__u32 op;
 
 #define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
-#define DRM_XE_VM_BIND_FLAG_ASYNC	(1 << 1)
 	/*
 	 * Valid on a faulting VM only, do the MAP operation immediately rather
 	 * than deferring the MAP to the page fault handler.
 	 */
-#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 2)
+#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
 	/*
 	 * When the NULL flag is set, the page tables are setup with a special
 	 * bit which indicates writes are dropped and all reads return zero.  In
@@ -783,7 +787,7 @@ struct drm_xe_vm_bind_op {
 	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
 	 * intended to implement VK sparse bindings.
 	 */
-#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 3)
+#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
 	/** @flags: Bind flags */
 	__u32 flags;
 
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 0446cefc95..683eb176b7 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2897,7 +2897,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
 							  &bb_size,
 							  mem_region) == 0);
 	} else if (is_xe) {
-		vm = xe_vm_create(dst_fb->fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+		vm = xe_vm_create(dst_fb->fd, 0, 0);
 		exec_queue = xe_exec_queue_create(dst_fb->fd, vm, &inst, 0);
 		xe_ctx = intel_ctx_xe(dst_fb->fd, vm, exec_queue, 0, 0, 0);
 		mem_region = vram_if_possible(dst_fb->fd, 0);
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 1268ac8f0a..ccab55cec7 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -967,7 +967,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 
 		if (!vm) {
 			igt_assert_f(!ctx, "No vm provided for engine");
-			vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+			vm = xe_vm_create(fd, 0, 0);
 		}
 
 		ibb->uses_full_ppgtt = true;
@@ -1347,9 +1347,8 @@ static void __unbind_xe_objects(struct intel_bb *ibb)
 	if (ibb->num_objects > 1) {
 		struct drm_xe_vm_bind_op *bind_ops;
 		uint32_t op = DRM_XE_VM_BIND_OP_UNMAP;
-		uint32_t flags = DRM_XE_VM_BIND_FLAG_ASYNC;
 
-		bind_ops = xe_alloc_bind_ops(ibb, op, flags, 0);
+		bind_ops = xe_alloc_bind_ops(ibb, op, 0, 0);
 		xe_vm_bind_array(ibb->fd, ibb->vm_id, 0, bind_ops,
 				 ibb->num_objects, syncs, 2);
 		free(bind_ops);
@@ -2395,7 +2394,7 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 
 	syncs[0].handle = syncobj_create(ibb->fd, 0);
 	if (ibb->num_objects > 1) {
-		bind_ops = xe_alloc_bind_ops(ibb, DRM_XE_VM_BIND_OP_MAP, DRM_XE_VM_BIND_FLAG_ASYNC, 0);
+		bind_ops = xe_alloc_bind_ops(ibb, DRM_XE_VM_BIND_OP_MAP, 0, 0);
 		xe_vm_bind_array(ibb->fd, ibb->vm_id, 0, bind_ops,
 				 ibb->num_objects, syncs, 1);
 		free(bind_ops);
diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index e657ae915e..bf6a911098 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -73,7 +73,7 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv,
 	execenv->driver = get_intel_driver(fd);
 
 	if (execenv->driver == INTEL_DRIVER_XE) {
-		execenv->vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+		execenv->vm = xe_vm_create(fd, 0, 0);
 
 		if (eci) {
 			execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm,
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index cdad3d7e20..1790f4f84d 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -68,7 +68,7 @@ void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t exec_queue,
 			    uint32_t num_syncs)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, bo, 0, 0, 0,
-			    DRM_XE_VM_BIND_OP_UNMAP_ALL, DRM_XE_VM_BIND_FLAG_ASYNC,
+			    DRM_XE_VM_BIND_OP_UNMAP_ALL, 0,
 			    sync, num_syncs, 0, 0);
 }
 
@@ -129,29 +129,13 @@ void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 				   DEFAULT_PAT_INDEX, ext), 0);
 }
 
-void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
-		uint64_t addr, uint64_t size,
-		struct drm_xe_sync *sync, uint32_t num_syncs)
-{
-	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size,
-			    DRM_XE_VM_BIND_OP_MAP, 0, sync, num_syncs, 0, 0);
-}
-
-void xe_vm_unbind(int fd, uint32_t vm, uint64_t offset,
-		  uint64_t addr, uint64_t size,
-		  struct drm_xe_sync *sync, uint32_t num_syncs)
-{
-	__xe_vm_bind_assert(fd, vm, 0, 0, offset, addr, size,
-			    DRM_XE_VM_BIND_OP_UNMAP, 0, sync, num_syncs, 0, 0);
-}
-
 void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t exec_queue, uint64_t offset,
 			  uint64_t addr, uint64_t size,
 			  struct drm_xe_sync *sync, uint32_t num_syncs,
 			  uint32_t region)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, 0, offset, addr, size,
-			    DRM_XE_VM_BIND_OP_PREFETCH, DRM_XE_VM_BIND_FLAG_ASYNC,
+			    DRM_XE_VM_BIND_OP_PREFETCH, 0,
 			    sync, num_syncs, region, 0);
 }
 
@@ -160,7 +144,7 @@ void xe_vm_bind_async(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 		      struct drm_xe_sync *sync, uint32_t num_syncs)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, bo, offset, addr, size,
-			    DRM_XE_VM_BIND_OP_MAP, DRM_XE_VM_BIND_FLAG_ASYNC, sync,
+			    DRM_XE_VM_BIND_OP_MAP, 0, sync,
 			    num_syncs, 0, 0);
 }
 
@@ -170,7 +154,7 @@ void xe_vm_bind_async_flags(int fd, uint32_t vm, uint32_t exec_queue, uint32_t b
 			    uint32_t flags)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, bo, offset, addr, size,
-			    DRM_XE_VM_BIND_OP_MAP, DRM_XE_VM_BIND_FLAG_ASYNC | flags,
+			    DRM_XE_VM_BIND_OP_MAP, flags,
 			    sync, num_syncs, 0, 0);
 }
 
@@ -179,7 +163,7 @@ void xe_vm_bind_userptr_async(int fd, uint32_t vm, uint32_t exec_queue,
 			      struct drm_xe_sync *sync, uint32_t num_syncs)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, 0, userptr, addr, size,
-			    DRM_XE_VM_BIND_OP_MAP_USERPTR, DRM_XE_VM_BIND_FLAG_ASYNC,
+			    DRM_XE_VM_BIND_OP_MAP_USERPTR, 0,
 			    sync, num_syncs, 0, 0);
 }
 
@@ -189,8 +173,8 @@ void xe_vm_bind_userptr_async_flags(int fd, uint32_t vm, uint32_t exec_queue,
 				    uint32_t num_syncs, uint32_t flags)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, 0, userptr, addr, size,
-			    DRM_XE_VM_BIND_OP_MAP_USERPTR, DRM_XE_VM_BIND_FLAG_ASYNC |
-			    flags, sync, num_syncs, 0, 0);
+			    DRM_XE_VM_BIND_OP_MAP_USERPTR, flags,
+			    sync, num_syncs, 0, 0);
 }
 
 void xe_vm_unbind_async(int fd, uint32_t vm, uint32_t exec_queue,
@@ -198,15 +182,24 @@ void xe_vm_unbind_async(int fd, uint32_t vm, uint32_t exec_queue,
 			struct drm_xe_sync *sync, uint32_t num_syncs)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, 0, offset, addr, size,
-			    DRM_XE_VM_BIND_OP_UNMAP, DRM_XE_VM_BIND_FLAG_ASYNC, sync,
+			    DRM_XE_VM_BIND_OP_UNMAP, 0, sync,
 			    num_syncs, 0, 0);
 }
 
 static void __xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 			      uint64_t addr, uint64_t size, uint32_t op)
 {
-	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size, op, 0, NULL, 0,
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = syncobj_create(fd, 0),
+	};
+
+	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size, op, 0, &sync, 1,
 			    0, 0);
+
+	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+	syncobj_destroy(fd, sync.handle);
 }
 
 void xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
@@ -315,11 +308,10 @@ uint32_t xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t place
 	return handle;
 }
 
-uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext, bool async)
+uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext)
 {
 	struct drm_xe_engine_class_instance instance = {
-		.engine_class = async ? DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC :
-			DRM_XE_ENGINE_CLASS_VM_BIND_SYNC,
+		.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
 	};
 	struct drm_xe_exec_queue_create create = {
 		.extensions = ext,
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index c8d46fb29e..66d3c65fcb 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -25,12 +25,6 @@ void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 			  uint64_t offset, uint64_t addr, uint64_t size,
 			  uint32_t op, uint32_t flags, struct drm_xe_sync *sync,
 			  uint32_t num_syncs, uint32_t prefetch_region, uint64_t ext);
-void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
-		uint64_t addr, uint64_t size,
-		struct drm_xe_sync *sync, uint32_t num_syncs);
-void xe_vm_unbind(int fd, uint32_t vm, uint64_t offset,
-		  uint64_t addr, uint64_t size,
-		  struct drm_xe_sync *sync, uint32_t num_syncs);
 void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t exec_queue,
 			  uint64_t offset, uint64_t addr, uint64_t size,
 			  struct drm_xe_sync *sync, uint32_t num_syncs,
@@ -79,8 +73,7 @@ int __xe_exec_queue_create(int fd, uint32_t vm,
 uint32_t xe_exec_queue_create(int fd, uint32_t vm,
 			  struct drm_xe_engine_class_instance *instance,
 			  uint64_t ext);
-uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext,
-				   bool async);
+uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext);
 uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
 void xe_exec_queue_destroy(int fd, uint32_t exec_queue);
 uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 51d54753fe..729fba6b1a 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -311,8 +311,7 @@ bool xe_supports_faults(int fd)
 	bool supports_faults;
 
 	struct drm_xe_vm_create create = {
-		.flags = DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-			 DRM_XE_VM_CREATE_FLAG_LR_MODE |
+		.flags = DRM_XE_VM_CREATE_FLAG_LR_MODE |
 			 DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
 	};
 
diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index ba8eece71f..e4c97c3a65 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -118,7 +118,7 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(int xe,
 {
 	struct drm_xe_vm_bind_op *bind_ops, *ops;
 	struct xe_object *obj;
-	uint32_t num_objects = 0, i = 0, op, flags;
+	uint32_t num_objects = 0, i = 0, op, flags = 0;
 
 	igt_list_for_each_entry(obj, obj_list, link)
 		num_objects++;
@@ -137,11 +137,9 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(int xe,
 
 		if (obj->bind_op == XE_OBJECT_BIND) {
 			op = DRM_XE_VM_BIND_OP_MAP;
-			flags = DRM_XE_VM_BIND_FLAG_ASYNC;
 			ops->obj = obj->handle;
 		} else {
 			op = DRM_XE_VM_BIND_OP_UNMAP;
-			flags = DRM_XE_VM_BIND_FLAG_ASYNC;
 		}
 
 		ops->op = op;
diff --git a/tests/intel/xe_access_counter.c b/tests/intel/xe_access_counter.c
index 8966bfc9c8..91367f5606 100644
--- a/tests/intel/xe_access_counter.c
+++ b/tests/intel/xe_access_counter.c
@@ -39,7 +39,7 @@ igt_main
 
 	igt_subtest("invalid-param") {
 		struct drm_xe_engine_class_instance instance = {
-			 .engine_class = DRM_XE_ENGINE_CLASS_VM_BIND_SYNC,
+			 .engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
 		 };
 
 		int ret;
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 77d3020bc7..e9df5c2ef1 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -345,7 +345,7 @@ static void block_copy(int xe,
 		uint32_t vm, exec_queue;
 
 		if (config->new_ctx) {
-			vm = xe_vm_create(xe, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+			vm = xe_vm_create(xe, 0, 0);
 			exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
 			surf_ctx = intel_ctx_xe(xe, vm, exec_queue, 0, 0, 0);
 			surf_ahnd = intel_allocator_open(xe, surf_ctx->vm,
@@ -553,7 +553,7 @@ static void block_copy_test(int xe,
 				      copyfns[copy_function].suffix) {
 				uint32_t sync_bind, sync_out;
 
-				vm = xe_vm_create(xe, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+				vm = xe_vm_create(xe, 0, 0);
 				exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
 				sync_bind = syncobj_create(xe, 0);
 				sync_out = syncobj_create(xe, 0);
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index d9c059e4d9..1bde876cd2 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -137,7 +137,7 @@ static void copy_test(int fd, uint32_t size, enum blt_cmd_type cmd, uint32_t reg
 
 	src_handle = xe_bo_create(fd, 0, bo_size, region, 0);
 	dst_handle = xe_bo_create(fd, 0, bo_size, region, 0);
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
 	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
 
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 75f802247e..0aa32c788a 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -73,7 +73,7 @@ static void create_invalid_size(int fd)
 	uint32_t handle;
 	int ret;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 
 	xe_for_each_mem_region(fd, memreg, region) {
 		memregion = xe_mem_region(fd, region);
@@ -172,7 +172,7 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
 
 	fd = drm_reopen_driver(fd);
 	num_engines = xe_number_engines(fd);
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 
 	exec_queues_per_process = max_t(uint32_t, 1, MAXEXECQUEUES / nproc);
 	igt_debug("nproc: %u, exec_queues per process: %u\n", nproc, exec_queues_per_process);
@@ -239,7 +239,7 @@ static void create_massive_size(int fd)
 	uint32_t handle;
 	int ret;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 
 	xe_for_each_mem_region(fd, memreg, region) {
 		ret = __create_bo(fd, vm, -1ULL << 32, region, &handle);
@@ -262,7 +262,7 @@ static void create_big_vram(int fd, int gt)
 	uint64_t vm = 0;
 
 	alignment = xe_get_default_alignment(fd);
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 
 	visible_avail_size = xe_visible_available_vram_size(fd, gt);
 	igt_require(visible_avail_size);
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index fd6c07410a..36bb39a314 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -71,7 +71,7 @@ static void test_active(int fd, struct drm_xe_engine *engine)
 	struct xe_spin_opts spin_opts = { .preempt = true };
 	int i, b, ret;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * N_EXEC_QUEUES;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -91,7 +91,7 @@ static void test_active(int fd, struct drm_xe_engine *engine)
 		for (i = 0; i < N_EXEC_QUEUES; i++) {
 			exec_queues[i] = xe_exec_queue_create(fd, vm,
 							      &engine->instance, 0);
-			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm, 0, true);
+			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm, 0);
 			syncobjs[i] = syncobj_create(fd, 0);
 		}
 		syncobjs[N_EXEC_QUEUES] = syncobj_create(fd, 0);
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 89dc46fae4..7242cde396 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -63,17 +63,15 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 
 	fd = drm_open_driver(DRIVER_XE);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 	if (flags & BIND_EXEC_QUEUE)
-		bind_exec_queues[0] = xe_bind_exec_queue_create(fd, vm, 0, true);
+		bind_exec_queues[0] = xe_bind_exec_queue_create(fd, vm, 0);
 	if (flags & MULTI_VM) {
-		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
-		vm3 = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+		vm2 = xe_vm_create(fd, 0, 0);
+		vm3 = xe_vm_create(fd, 0, 0);
 		if (flags & BIND_EXEC_QUEUE) {
-			bind_exec_queues[1] = xe_bind_exec_queue_create(fd, vm2,
-									0, true);
-			bind_exec_queues[2] = xe_bind_exec_queue_create(fd, vm3,
-									0, true);
+			bind_exec_queues[1] = xe_bind_exec_queue_create(fd, vm2, 0);
+			bind_exec_queues[2] = xe_bind_exec_queue_create(fd, vm3, 0);
 		}
 	}
 
@@ -245,16 +243,13 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 
 	fd = drm_open_driver(DRIVER_XE);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-			  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	if (flags & BIND_EXEC_QUEUE)
-		bind_exec_queues[0] = xe_bind_exec_queue_create(fd, vm, 0, true);
+		bind_exec_queues[0] = xe_bind_exec_queue_create(fd, vm, 0);
 	if (flags & MULTI_VM) {
-		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-				   DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 		if (flags & BIND_EXEC_QUEUE)
-			bind_exec_queues[1] = xe_bind_exec_queue_create(fd, vm2,
-									0, true);
+			bind_exec_queues[1] = xe_bind_exec_queue_create(fd, vm2, 0);
 	}
 
 	for (i = 0; i < n_exec_queues; i++) {
diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
index 674c8537ee..5dd438cad6 100644
--- a/tests/intel/xe_evict_ccs.c
+++ b/tests/intel/xe_evict_ccs.c
@@ -227,7 +227,7 @@ static void evict_single(int fd, int child, const struct config *config)
 	uint32_t kb_left = config->mb_per_proc * SZ_1K;
 	uint32_t min_alloc_kb = config->param->min_size_kb;
 	uint32_t max_alloc_kb = config->param->max_size_kb;
-	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	uint32_t vm = xe_vm_create(fd, 0, 0);
 	uint64_t ahnd = intel_allocator_open(fd, vm, INTEL_ALLOCATOR_RELOC);
 	uint8_t uc_mocs = intel_get_uc_mocs_index(fd);
 	struct object *obj, *tmp;
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 79ff65e891..0b13c32940 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -66,7 +66,7 @@ static void test_all_active(int fd, int gt, int class)
 	if (num_placements < 2)
 		return;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * num_placements;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
@@ -208,7 +208,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	if (num_placements < 2)
 		return;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
@@ -435,8 +435,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	if (num_placements < 2)
 		return;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-			  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 2defd1e358..8994859faf 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -109,7 +109,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert(n_vm <= MAX_N_EXEC_QUEUES);
 
 	for (i = 0; i < n_vm; ++i)
-		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+		vm[i] = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -152,8 +152,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		exec_queues[i] = xe_exec_queue_create(fd, __vm, eci, 0);
 		if (flags & BIND_EXEC_QUEUE)
 			bind_exec_queues[i] = xe_bind_exec_queue_create(fd,
-									__vm, 0,
-									true);
+									__vm, 0);
 		else
 			bind_exec_queues[i] = 0;
 		syncobjs[i] = syncobj_create(fd, 0);
@@ -173,7 +172,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			__xe_vm_bind_assert(fd, vm[i], bind_exec_queues[i],
 					    0, 0, sparse_addr[i], bo_size,
 					    DRM_XE_VM_BIND_OP_MAP,
-					    DRM_XE_VM_BIND_FLAG_ASYNC |
 					    DRM_XE_VM_BIND_FLAG_NULL, sync,
 					    1, 0, 0);
 	}
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 7d3004d658..5453ecdfdf 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -114,8 +114,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-			  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -124,7 +123,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 		if (flags & BIND_EXECQUEUE)
 			bind_exec_queues[i] =
-				xe_bind_exec_queue_create(fd, vm, 0, true);
+				xe_bind_exec_queue_create(fd, vm, 0);
 		else
 			bind_exec_queues[i] = 0;
 	};
@@ -153,7 +152,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 		if (flags & BIND_EXECQUEUE)
 			bind_exec_queues[i] =
-				xe_bind_exec_queue_create(fd, vm, 0, true);
+				xe_bind_exec_queue_create(fd, vm, 0);
 		else
 			bind_exec_queues[i] = 0;
 	};
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index ee7cbb6040..db1ebf24fd 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -131,8 +131,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-			  DRM_XE_VM_CREATE_FLAG_LR_MODE |
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
 			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
@@ -168,7 +167,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 		if (flags & BIND_EXEC_QUEUE)
 			bind_exec_queues[i] =
-				xe_bind_exec_queue_create(fd, vm, 0, true);
+				xe_bind_exec_queue_create(fd, vm, 0);
 		else
 			bind_exec_queues[i] = 0;
 	};
diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 0b578510ce..53e08fb0e6 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -56,7 +56,7 @@ static void test_set_property(int xe, int property_name,
 			      int property_value, int err_val)
 {
 	struct drm_xe_engine_class_instance instance = {
-			.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND_SYNC,
+			.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
 	};
 	struct drm_xe_ext_set_property ext = {
 		.base.next_extension = 0,
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 094b34896b..e0b2594550 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -45,7 +45,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 	struct xe_spin *spin;
 	struct xe_spin_opts spin_opts = { .addr = addr, .preempt = false };
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*spin);
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -177,7 +177,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	if (num_placements < 2)
 		return;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -364,7 +364,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -531,8 +531,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-			  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 7a66d744c6..ec875cffc7 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -106,7 +106,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 	syncobj = syncobj_create(fd, 0);
 	sync.handle = syncobj;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data);
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -116,7 +116,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
-	bind_engine = xe_bind_exec_queue_create(fd, vm, 0, true);
+	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
 	xe_vm_bind_async(fd, vm, bind_engine, bo, 0, addr, bo_size, &sync, 1);
 	data = xe_bo_map(fd, bo, bo_size);
 
@@ -185,7 +185,7 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
 	size_t bo_size = 4096;
 
 	bo_size = ALIGN(bo_size, xe_get_default_alignment(fd));
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
 	exec_queues = xe_exec_queue_create(fd, vm, eci, 0);
 	syncobjs = syncobj_create(fd, 0);
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index fcb9266982..e0670ac684 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -77,7 +77,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 
 	if (!vm) {
-		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+		vm = xe_vm_create(fd, 0, 0);
 		owns_vm = true;
 	}
 
@@ -286,8 +286,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 
 	if (!vm) {
-		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-				  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 		owns_vm = true;
 	}
 
@@ -491,7 +490,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 
 	if (!vm) {
-		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+		vm = xe_vm_create(fd, 0, 0);
 		owns_vm = true;
 	}
 
@@ -535,7 +534,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 		if (flags & BIND_EXEC_QUEUE)
 			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm,
-									0, true);
+									0);
 		else
 			bind_exec_queues[i] = 0;
 		syncobjs[i] = syncobj_create(fd, 0);
@@ -1003,11 +1002,8 @@ static void threads(int fd, int flags)
 	pthread_cond_init(&cond, 0);
 
 	if (flags & SHARED_VM) {
-		vm_legacy_mode = xe_vm_create(fd,
-					      DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT,
-					      0);
+		vm_legacy_mode = xe_vm_create(fd, 0, 0);
 		vm_compute_mode = xe_vm_create(fd,
-					       DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
 					       DRM_XE_VM_CREATE_FLAG_LR_MODE,
 					       0);
 	}
diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
index 655e9a3ea3..cc9060b1b1 100644
--- a/tests/intel/xe_exercise_blt.c
+++ b/tests/intel/xe_exercise_blt.c
@@ -280,7 +280,7 @@ static void fast_copy_test(int xe,
 			region1 = igt_collection_get_value(regions, 0);
 			region2 = igt_collection_get_value(regions, 1);
 
-			vm = xe_vm_create(xe, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+			vm = xe_vm_create(xe, 0, 0);
 			exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
 			ctx = intel_ctx_xe(xe, vm, exec_queue, 0, 0, 0);
 
diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
index 035d86ea8f..ca045c41bf 100644
--- a/tests/intel/xe_huc_copy.c
+++ b/tests/intel/xe_huc_copy.c
@@ -157,7 +157,7 @@ test_huc_copy(int fd)
 	uint32_t vm;
 	uint32_t tested_gts = 0;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 
 	xe_for_each_engine(fd, hwe) {
 		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE &&
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index 804e176ee6..d3d7a4fb69 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -192,7 +192,7 @@ static void simple_bb(struct buf_ops *bops, bool new_context)
 	intel_bb_reset(ibb, true);
 
 	if (new_context) {
-		vm = xe_vm_create(xe, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+		vm = xe_vm_create(xe, 0, 0);
 		ctx = xe_exec_queue_create(xe, vm, &xe_engine(xe, 0)->instance,
 					   0);
 		intel_bb_destroy(ibb);
diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index c91340784a..c372cc82db 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -72,8 +72,8 @@ static void test_ping_pong(int fd, struct drm_xe_engine *engine)
 
 			bo[i][j] = xe_bo_create(fd, vm[i], bo_size,
 						vram_memory(fd, 0), 0);
-			xe_vm_bind(fd, vm[i], bo[i][j], 0, 0x40000 + j*bo_size,
-				   bo_size, NULL, 0);
+			xe_vm_bind_async(fd, vm[i], 0, bo[i][j], 0,
+					 0x40000 + j*bo_size, bo_size, NULL, 0);
 		}
 		exec_queues[i] = xe_exec_queue_create(fd, vm[i],
 						      &engine->instance, 0);
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 7273242b07..c5187bb946 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -254,7 +254,7 @@ static void pat_index_blt(struct xe_pat_param *p)
 
 	igt_require(blt_has_fast_copy(fd));
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
 	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
 	ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
@@ -470,7 +470,7 @@ static void pat_index_dw(struct xe_pat_param *p)
 			break;
 	}
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 	ctx = xe_exec_queue_create(fd, vm, hwe, 0);
 
 	ibb = intel_bb_create_full(fd, ctx, vm, NULL, xe_get_default_alignment(fd),
diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c
index 6cf80f7b5f..44fea6eb18 100644
--- a/tests/intel/xe_peer2peer.c
+++ b/tests/intel/xe_peer2peer.c
@@ -121,7 +121,7 @@ static void test_read(struct gpu_info *ex_gpu, struct gpu_info *im_gpu,
 	};
 	intel_ctx_t *ctx;
 
-	vm = xe_vm_create(im_xe, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(im_xe, 0, 0);
 	exec_queue = xe_exec_queue_create(im_xe, vm, &inst, 0);
 	ctx = intel_ctx_xe(im_xe, vm, exec_queue, 0, 0, 0);
 	ahnd = intel_allocator_open_full(im_xe, ctx->vm, 0, 0,
@@ -203,7 +203,7 @@ static void test_write(struct gpu_info *ex_gpu, struct gpu_info *im_gpu,
 	};
 	intel_ctx_t *ctx;
 
-	vm = xe_vm_create(im_xe, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(im_xe, 0, 0);
 	exec_queue = xe_exec_queue_create(im_xe, vm, &inst, 0);
 	ctx = intel_ctx_xe(im_xe, vm, exec_queue, 0, 0, 0);
 	ahnd = intel_allocator_open_full(im_xe, ctx->vm, 0, 0,
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index c899bd67a0..602729dafb 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -259,7 +259,7 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	if (check_rpm)
 		igt_assert(in_d3(device, d_state));
 
-	vm = xe_vm_create(device.fd_xe, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(device.fd_xe, 0, 0);
 
 	if (check_rpm)
 		igt_assert(out_of_d3(device, d_state));
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index e8dca7826f..3f32838295 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -190,7 +190,7 @@ static void preempter(int fd, struct drm_xe_engine_class_instance *hwe)
 	syncobj = syncobj_create(fd, 0);
 	sync.handle = syncobj;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data);
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index fb65793d11..2200040acf 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -268,7 +268,7 @@ test_bind_one_bo_many_times_many_vm(int fd)
 
 static void test_partial_unbinds(int fd)
 {
-	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	uint32_t vm = xe_vm_create(fd, 0, 0);
 	size_t bo_size = 3 * xe_get_default_alignment(fd);
 	uint32_t bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
 	uint64_t unbind_size = bo_size / 3;
@@ -318,7 +318,7 @@ static void unbind_all(int fd, int n_vmas)
 		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
 
 	for (i = 0; i < n_vmas; ++i)
@@ -416,7 +416,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 	data = malloc(sizeof(*data) * n_bo);
 	igt_assert(data);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(struct shared_pte_page_data);
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -601,7 +601,7 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
 	struct xe_spin_opts spin_opts = { .preempt = true };
 	int i, b;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * N_EXEC_QUEUES;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -612,7 +612,7 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
 
 	for (i = 0; i < N_EXEC_QUEUES; i++) {
 		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
-		bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm, 0, true);
+		bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm, 0);
 		syncobjs[i] = syncobj_create(fd, 0);
 	}
 	syncobjs[N_EXEC_QUEUES] = syncobj_create(fd, 0);
@@ -782,7 +782,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 
 	igt_assert(n_execs <= BIND_ARRAY_MAX_N_EXEC);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -793,7 +793,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 	data = xe_bo_map(fd, bo, bo_size);
 
 	if (flags & BIND_ARRAY_BIND_EXEC_QUEUE_FLAG)
-		bind_exec_queue = xe_bind_exec_queue_create(fd, vm, 0, true);
+		bind_exec_queue = xe_bind_exec_queue_create(fd, vm, 0);
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
 
 	for (i = 0; i < n_execs; ++i) {
@@ -802,7 +802,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 		bind_ops[i].range = bo_size;
 		bind_ops[i].addr = addr;
 		bind_ops[i].op = DRM_XE_VM_BIND_OP_MAP;
-		bind_ops[i].flags = DRM_XE_VM_BIND_FLAG_ASYNC;
+		bind_ops[i].flags = 0;
 		bind_ops[i].prefetch_mem_region_instance = 0;
 		bind_ops[i].pat_index = intel_get_pat_idx_wb(fd);
 		bind_ops[i].reserved[0] = 0;
@@ -848,7 +848,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 	for (i = 0; i < n_execs; ++i) {
 		bind_ops[i].obj = 0;
 		bind_ops[i].op = DRM_XE_VM_BIND_OP_UNMAP;
-		bind_ops[i].flags = DRM_XE_VM_BIND_FLAG_ASYNC;
+		bind_ops[i].flags = 0;
 	}
 
 	syncobj_reset(fd, &sync[0].handle, 1);
@@ -977,7 +977,7 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 
 	if (flags & LARGE_BIND_FLAG_USERPTR) {
 		map = aligned_alloc(xe_get_default_alignment(fd), bo_size);
@@ -1272,7 +1272,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 			unbind_n_page_offset *= n_page_per_2mb;
 	}
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 	bo_size = page_size * bo_n_pages;
 
 	if (flags & MAP_FLAG_USERPTR) {
@@ -1572,7 +1572,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 			unbind_n_page_offset *= n_page_per_2mb;
 	}
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	vm = xe_vm_create(fd, 0, 0);
 	bo_size = page_size * bo_n_pages;
 
 	if (flags & MAP_FLAG_USERPTR) {
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 3be987954d..acd614c96a 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -94,7 +94,7 @@ waitfence(int fd, enum waittype wt)
 	uint32_t bo_7;
 	int64_t timeout;
 
-	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	uint32_t vm = xe_vm_create(fd, 0, 0);
 	bo_1 = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
 	do_bind(fd, vm, bo_1, 0, 0x200000, 0x40000, 1);
 	bo_2 = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
@@ -170,7 +170,7 @@ invalid_flag(int fd)
 		.instances = 0,
 	};
 
-	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	uint32_t vm = xe_vm_create(fd, 0, 0);
 
 	bo = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
 
@@ -195,7 +195,7 @@ invalid_ops(int fd)
 		.instances = 0,
 	};
 
-	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	uint32_t vm = xe_vm_create(fd, 0, 0);
 
 	bo = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
 
@@ -220,7 +220,7 @@ invalid_engine(int fd)
 		.instances = 0,
 	};
 
-	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	uint32_t vm = xe_vm_create(fd, 0, 0);
 
 	bo = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
 
-- 
2.34.1
