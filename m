Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A0810E46A
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jul 2023 01:21:40 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 26 Jul 2023 18:21:33 -0700
Message-Id: <20230727012136.456190-2-matthew.brost@intel.com>
In-Reply-To: <20230727012136.456190-1-matthew.brost@intel.com>
References: <20230727012136.456190-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/4] xe: Update to new VM bind uAPI
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

Sync vs. async changes and new error handling.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm-uapi/xe_drm.h       |  94 +++--------------
 lib/intel_batchbuffer.c         |   2 +-
 lib/xe/xe_compute.c             |   2 +-
 lib/xe/xe_ioctl.c               |  15 +--
 lib/xe/xe_ioctl.h               |   2 +-
 lib/xe/xe_query.c               |   2 +-
 tests/xe/xe_ccs.c               |   4 +-
 tests/xe/xe_create.c            |   6 +-
 tests/xe/xe_evict.c             |  23 +++--
 tests/xe/xe_exec_balancer.c     |   6 +-
 tests/xe/xe_exec_basic.c        |   5 +-
 tests/xe/xe_exec_compute_mode.c |   6 +-
 tests/xe/xe_exec_fault_mode.c   |   6 +-
 tests/xe/xe_exec_reset.c        |   8 +-
 tests/xe/xe_exec_store.c        |   4 +-
 tests/xe/xe_exec_threads.c      | 122 +++++++---------------
 tests/xe/xe_exercise_blt.c      |   2 +-
 tests/xe/xe_guc_pc.c            |   2 +-
 tests/xe/xe_huc_copy.c          |   2 +-
 tests/xe/xe_intel_bb.c          |   2 +-
 tests/xe/xe_pm.c                |   2 +-
 tests/xe/xe_vm.c                | 178 +++++++-------------------------
 tests/xe/xe_waitfence.c         |  19 +---
 23 files changed, 140 insertions(+), 374 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 1ea4537374..93e0979425 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -3,8 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef _XE_DRM_H_
-#define _XE_DRM_H_
+#ifndef _UAPI_XE_DRM_H_
+#define _UAPI_XE_DRM_H_
 
 #include "drm.h"
 
@@ -29,7 +29,7 @@ extern "C" {
  * redefine the interface more easily than an ever growing struct of
  * increasing complexity, and for large parts of that interface to be
  * entirely optional. The downside is more pointer chasing; chasing across
- * the boundary with pointers encapsulated inside u64.
+ * the __user boundary with pointers encapsulated inside u64.
  *
  * Example chaining:
  *
@@ -475,50 +475,13 @@ struct drm_xe_gem_mmap_offset {
 	__u64 reserved[2];
 };
 
-/**
- * struct drm_xe_vm_bind_op_error_capture - format of VM bind op error capture
- */
-struct drm_xe_vm_bind_op_error_capture {
-	/** @error: errno that occured */
-	__s32 error;
-
-	/** @op: operation that encounter an error */
-	__u32 op;
-
-	/** @addr: address of bind op */
-	__u64 addr;
-
-	/** @size: size of bind */
-	__u64 size;
-};
-
-/** struct drm_xe_ext_vm_set_property - VM set property extension */
-struct drm_xe_ext_vm_set_property {
-	/** @base: base user extension */
-	struct xe_user_extension base;
-
-#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
-	/** @property: property to set */
-	__u32 property;
-
-	/** @pad: MBZ */
-	__u32 pad;
-
-	/** @value: property value */
-	__u64 value;
-
-	/** @reserved: Reserved */
-	__u64 reserved[2];
-};
-
 struct drm_xe_vm_create {
-#define XE_VM_EXTENSION_SET_PROPERTY	0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
 #define DRM_XE_VM_CREATE_SCRATCH_PAGE	(0x1 << 0)
 #define DRM_XE_VM_CREATE_COMPUTE_MODE	(0x1 << 1)
-#define DRM_XE_VM_CREATE_ASYNC_BIND_OPS	(0x1 << 2)
+#define DRM_XE_VM_CREATE_ASYNC_DEFAULT	(0x1 << 2)
 #define DRM_XE_VM_CREATE_FAULT_MODE	(0x1 << 3)
 	/** @flags: Flags */
 	__u32 flags;
@@ -583,30 +546,6 @@ struct drm_xe_vm_bind_op {
 #define XE_VM_BIND_OP_PREFETCH		0x5
 
 #define XE_VM_BIND_FLAG_READONLY	(0x1 << 16)
-	/*
-	 * A bind ops completions are always async, hence the support for out
-	 * sync. This flag indicates the allocation of the memory for new page
-	 * tables and the job to program the pages tables is asynchronous
-	 * relative to the IOCTL. That part of a bind operation can fail under
-	 * memory pressure, the job in practice can't fail unless the system is
-	 * totally shot.
-	 *
-	 * If this flag is clear and the IOCTL doesn't return an error, in
-	 * practice the bind op is good and will complete.
-	 *
-	 * If this flag is set and doesn't return an error, the bind op can
-	 * still fail and recovery is needed. If configured, the bind op that
-	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
-	 * Once the user sees the error (via a ufence +
-	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
-	 * via non-async unbinds, and then restart all queue'd async binds op via
-	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy the
-	 * VM.
-	 *
-	 * This flag is only allowed when DRM_XE_VM_CREATE_ASYNC_BIND_OPS is
-	 * configured in the VM and must be set if the VM is configured with
-	 * DRM_XE_VM_CREATE_ASYNC_BIND_OPS and not in an error state.
-	 */
 #define XE_VM_BIND_FLAG_ASYNC		(0x1 << 17)
 	/*
 	 * Valid on a faulting VM only, do the MAP operation immediately rather
@@ -621,6 +560,7 @@ struct drm_xe_vm_bind_op {
 	 * intended to implement VK sparse bindings.
 	 */
 #define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
+#define XE_VM_BIND_FLAG_RECLAIM		(0x1 << 20)
 	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
 	__u32 op;
 
@@ -735,10 +675,11 @@ struct drm_xe_engine_class_instance {
 #define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
 #define DRM_XE_ENGINE_CLASS_COMPUTE		4
 	/*
-	 * Kernel only class (not actual hardware engine class). Used for
+	 * Kernel only classes (not actual hardware engine class). Used for
 	 * creating ordered queues of VM bind operations.
 	 */
-#define DRM_XE_ENGINE_CLASS_VM_BIND		5
+#define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
+#define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
 	__u16 engine_class;
 
 	__u16 engine_instance;
@@ -908,18 +849,10 @@ struct drm_xe_wait_user_fence {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	union {
-		/**
-		 * @addr: user pointer address to wait on, must qword aligned
-		 */
-		__u64 addr;
-
-		/**
-		 * @vm_id: The ID of the VM which encounter an error used with
-		 * DRM_XE_UFENCE_WAIT_VM_ERROR. Upper 32 bits must be clear.
-		 */
-		__u64 vm_id;
-	};
+	/**
+	 * @addr: user pointer address to wait on, must qword aligned
+	 */
+	__u64 addr;
 
 #define DRM_XE_UFENCE_WAIT_EQ	0
 #define DRM_XE_UFENCE_WAIT_NEQ	1
@@ -932,7 +865,6 @@ struct drm_xe_wait_user_fence {
 
 #define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
 #define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
-#define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
 	/** @flags: wait flags */
 	__u16 flags;
 
@@ -1050,4 +982,4 @@ struct drm_xe_vm_madvise {
 }
 #endif
 
-#endif /* _XE_DRM_H_ */
+#endif /* _UAPI_XE_DRM_H_ */
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 163d39d6b1..386f079119 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -951,7 +951,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 
 		if (!vm) {
 			igt_assert_f(!ctx, "No vm provided for engine");
-			vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+			vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 		}
 
 		ibb->uses_full_ppgtt = true;
diff --git a/lib/xe/xe_compute.c b/lib/xe/xe_compute.c
index 2a3686a1be..e5a8ffcbb8 100644
--- a/lib/xe/xe_compute.c
+++ b/lib/xe/xe_compute.c
@@ -406,7 +406,7 @@ static void tgl_compute_exec(int fd, const unsigned char *kernel,
 	/* Sets Kernel size */
 	bo_dict[0].size = ALIGN(size, 0x1000);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	engine = xe_engine_create_class(fd, vm, DRM_XE_ENGINE_CLASS_RENDER);
 	sync.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL;
 	sync.handle = syncobj_create(fd, 0);
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index a1799e09f7..57c4873fe6 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -200,16 +200,8 @@ void xe_vm_unbind_async(int fd, uint32_t vm, uint32_t engine,
 static void __xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 			      uint64_t addr, uint64_t size, uint32_t op)
 {
-	struct drm_xe_sync sync = {
-		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
-		.handle = syncobj_create(fd, 0),
-	};
-
-	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size, op, &sync, 1, 0,
+	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size, op, NULL, 0, 0,
 			    0);
-
-	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
-	syncobj_destroy(fd, sync.handle);
 }
 
 void xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
@@ -275,10 +267,11 @@ uint32_t xe_bo_create(int fd, int gt, uint32_t vm, uint64_t size)
 	return create.handle;
 }
 
-uint32_t xe_bind_engine_create(int fd, uint32_t vm, uint64_t ext)
+uint32_t xe_bind_engine_create(int fd, uint32_t vm, uint64_t ext, bool async)
 {
 	struct drm_xe_engine_class_instance instance = {
-		.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
+		.engine_class = async ? DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC :
+			DRM_XE_ENGINE_CLASS_VM_BIND_SYNC,
 	};
 	struct drm_xe_engine_create create = {
 		.extensions = ext,
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index f9c3acb4a7..7c220b1034 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -71,7 +71,7 @@ uint32_t xe_bo_create(int fd, int gt, uint32_t vm, uint64_t size);
 uint32_t xe_engine_create(int fd, uint32_t vm,
 			  struct drm_xe_engine_class_instance *instance,
 			  uint64_t ext);
-uint32_t xe_bind_engine_create(int fd, uint32_t vm, uint64_t ext);
+uint32_t xe_bind_engine_create(int fd, uint32_t vm, uint64_t ext, bool async);
 uint32_t xe_engine_create_class(int fd, uint32_t vm, uint16_t class);
 void xe_engine_destroy(int fd, uint32_t engine);
 uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 8963c7b06b..431659e17b 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -316,7 +316,7 @@ bool xe_supports_faults(int fd)
 	bool supports_faults;
 
 	struct drm_xe_vm_create create = {
-		.flags = DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+		.flags = DRM_XE_VM_CREATE_ASYNC_DEFAULT |
 			 DRM_XE_VM_CREATE_FAULT_MODE,
 	};
 
diff --git a/tests/xe/xe_ccs.c b/tests/xe/xe_ccs.c
index 2d5ae33fa0..f112610b59 100644
--- a/tests/xe/xe_ccs.c
+++ b/tests/xe/xe_ccs.c
@@ -340,7 +340,7 @@ static void block_copy(int xe,
 		uint32_t vm, engine;
 
 		if (config->new_ctx) {
-			vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+			vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 			engine = xe_engine_create(xe, vm, &inst, 0);
 			surf_ctx = intel_ctx_xe(xe, vm, engine, 0, 0, 0);
 			surf_ahnd = intel_allocator_open(xe, surf_ctx->vm,
@@ -547,7 +547,7 @@ static void block_copy_test(int xe,
 				      copyfns[copy_function].suffix) {
 				uint32_t sync_bind, sync_out;
 
-				vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+				vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 				engine = xe_engine_create(xe, vm, &inst, 0);
 				sync_bind = syncobj_create(xe, 0);
 				sync_out = syncobj_create(xe, 0);
diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c
index e39e89f7a5..fde97b9f96 100644
--- a/tests/xe/xe_create.c
+++ b/tests/xe/xe_create.c
@@ -55,7 +55,7 @@ static void create_invalid_size(int fd)
 	uint32_t handle;
 	int ret;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 
 	xe_for_each_mem_region(fd, memreg, region) {
 		memregion = xe_mem_region(fd, region);
@@ -140,7 +140,7 @@ static void create_engines(int fd, enum engine_destroy ed)
 
 	fd = drm_reopen_driver(fd);
 	num_engines = xe_number_hw_engines(fd);
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 
 	engines_per_process = max_t(uint32_t, 1, MAXENGINES / nproc);
 	igt_debug("nproc: %u, engines per process: %u\n", nproc, engines_per_process);
@@ -197,7 +197,7 @@ static void create_massive_size(int fd)
 	uint32_t handle;
 	int ret;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 
 	xe_for_each_mem_region(fd, memreg, region) {
 		ret = __create_bo(fd, vm, -1ULL << 32, region, &handle);
diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
index c44cb80dc7..2df3274efc 100644
--- a/tests/xe/xe_evict.c
+++ b/tests/xe/xe_evict.c
@@ -63,15 +63,17 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 
 	fd = drm_open_driver(DRIVER_XE);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	if (flags & BIND_ENGINE)
-		bind_engines[0] = xe_bind_engine_create(fd, vm, 0);
+		bind_engines[0] = xe_bind_engine_create(fd, vm, 0, true);
 	if (flags & MULTI_VM) {
-		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
-		vm3 = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+		vm3 = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 		if (flags & BIND_ENGINE) {
-			bind_engines[1] = xe_bind_engine_create(fd, vm2, 0);
-			bind_engines[2] = xe_bind_engine_create(fd, vm3, 0);
+			bind_engines[1] = xe_bind_engine_create(fd, vm2, 0,
+								true);
+			bind_engines[2] = xe_bind_engine_create(fd, vm3, 0,
+								true);
 		}
 	}
 
@@ -240,15 +242,16 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 
 	fd = drm_open_driver(DRIVER_XE);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
 			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
 	if (flags & BIND_ENGINE)
-		bind_engines[0] = xe_bind_engine_create(fd, vm, 0);
+		bind_engines[0] = xe_bind_engine_create(fd, vm, 0, true);
 	if (flags & MULTI_VM) {
-		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
 				   DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
 		if (flags & BIND_ENGINE)
-			bind_engines[1] = xe_bind_engine_create(fd, vm2, 0);
+			bind_engines[1] = xe_bind_engine_create(fd, vm2, 0,
+								true);
 	}
 
 	for (i = 0; i < n_engines; i++) {
diff --git a/tests/xe/xe_exec_balancer.c b/tests/xe/xe_exec_balancer.c
index 0b00d93ded..acafe71e58 100644
--- a/tests/xe/xe_exec_balancer.c
+++ b/tests/xe/xe_exec_balancer.c
@@ -65,7 +65,7 @@ static void test_all_active(int fd, int gt, int class)
 	if (num_placements < 2)
 		return;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * num_placements;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
@@ -208,7 +208,7 @@ test_exec(int fd, int gt, int class, int n_engines, int n_execs,
 	if (num_placements < 2)
 		return;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
@@ -428,7 +428,7 @@ test_cm(int fd, int gt, int class, int n_engines, int n_execs,
 	if (num_placements < 2)
 		return;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
 			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
index bf3863d486..33750458e9 100644
--- a/tests/xe/xe_exec_basic.c
+++ b/tests/xe/xe_exec_basic.c
@@ -110,7 +110,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert(n_vm <= MAX_N_ENGINES);
 
 	for (i = 0; i < n_vm; ++i)
-		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -152,7 +152,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 		engines[i] = xe_engine_create(fd, __vm, eci, 0);
 		if (flags & BIND_ENGINE)
-			bind_engines[i] = xe_bind_engine_create(fd, __vm, 0);
+			bind_engines[i] = xe_bind_engine_create(fd, __vm, 0,
+								true);
 		else
 			bind_engines[i] = 0;
 		syncobjs[i] = syncobj_create(fd, 0);
diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/xe/xe_exec_compute_mode.c
index ee9756c213..40e892639b 100644
--- a/tests/xe/xe_exec_compute_mode.c
+++ b/tests/xe/xe_exec_compute_mode.c
@@ -114,7 +114,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 	igt_assert(n_engines <= MAX_N_ENGINES);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
 			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
@@ -132,7 +132,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 					      to_user_pointer(&ext));
 		if (flags & BIND_ENGINE)
 			bind_engines[i] =
-				xe_bind_engine_create(fd, vm, 0);
+				xe_bind_engine_create(fd, vm, 0, true);
 		else
 			bind_engines[i] = 0;
 	};
@@ -168,7 +168,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 					      to_user_pointer(&ext));
 		if (flags & BIND_ENGINE)
 			bind_engines[i] =
-				xe_bind_engine_create(fd, vm, 0);
+				xe_bind_engine_create(fd, vm, 0, true);
 		else
 			bind_engines[i] = 0;
 	};
diff --git a/tests/xe/xe_exec_fault_mode.c b/tests/xe/xe_exec_fault_mode.c
index 7dcbb3c45c..20d09c3883 100644
--- a/tests/xe/xe_exec_fault_mode.c
+++ b/tests/xe/xe_exec_fault_mode.c
@@ -132,7 +132,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 	igt_assert(n_engines <= MAX_N_ENGINES);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
 			  DRM_XE_VM_CREATE_FAULT_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
@@ -166,7 +166,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		engines[i] = xe_engine_create(fd, vm, eci, 0);
 		if (flags & BIND_ENGINE)
 			bind_engines[i] =
-				xe_bind_engine_create(fd, vm, 0);
+				xe_bind_engine_create(fd, vm, 0, true);
 		else
 			bind_engines[i] = 0;
 	};
@@ -376,7 +376,7 @@ test_atomic(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t *ptr;
 	int i, b, wait_idx = 0;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
 			  DRM_XE_VM_CREATE_FAULT_MODE, 0);
 	bo_size = sizeof(*data) * n_atomic;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c
index dfbaa6035d..b47a4653d6 100644
--- a/tests/xe/xe_exec_reset.c
+++ b/tests/xe/xe_exec_reset.c
@@ -45,7 +45,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 	uint32_t bo = 0;
 	struct xe_spin *spin;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*spin);
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -183,7 +183,7 @@ test_balancer(int fd, int gt, int class, int n_engines, int n_execs,
 	if (num_placements < 2)
 		return;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -375,7 +375,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -546,7 +546,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
 			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
diff --git a/tests/xe/xe_exec_store.c b/tests/xe/xe_exec_store.c
index fbce1aeccb..ed950d19a0 100644
--- a/tests/xe/xe_exec_store.c
+++ b/tests/xe/xe_exec_store.c
@@ -76,7 +76,7 @@ static void store(int fd)
 	syncobj = syncobj_create(fd, 0);
 	sync.handle = syncobj;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data);
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -134,7 +134,7 @@ static void store_all(int fd, int gt, int class)
 	struct drm_xe_engine_class_instance *hwe;
 	int i, num_placements = 0;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data);
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
index 396398984d..b6421d0235 100644
--- a/tests/xe/xe_exec_threads.c
+++ b/tests/xe/xe_exec_threads.c
@@ -77,7 +77,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 
 	if (!vm) {
-		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 		owns_vm = true;
 	}
 
@@ -285,7 +285,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 
 	if (!vm) {
-		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
 				  XE_ENGINE_SET_PROPERTY_COMPUTE_MODE, 0);
 		owns_vm = true;
 	}
@@ -477,6 +477,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	};
 	uint32_t engines[MAX_N_ENGINES];
 	uint32_t bind_engines[MAX_N_ENGINES];
+	uint32_t restart_engine;
 	uint32_t syncobjs[MAX_N_ENGINES];
 	size_t bo_size;
 	uint32_t bo = 0;
@@ -497,7 +498,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 
 	if (!vm) {
-		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 		owns_vm = true;
 	}
 
@@ -539,13 +540,15 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		else
 			engines[i] = xe_engine_create(fd, vm, eci, 0);
 		if (flags & BIND_ENGINE)
-			bind_engines[i] = xe_bind_engine_create(fd, vm, 0);
+			bind_engines[i] = xe_bind_engine_create(fd, vm, 0,
+								true);
 		else
 			bind_engines[i] = 0;
 		syncobjs[i] = syncobj_create(fd, 0);
 		sync_all[i].flags = DRM_XE_SYNC_SYNCOBJ;
 		sync_all[i].handle = syncobjs[i];
-	};
+	}
+	restart_engine = xe_bind_engine_create(fd, vm, 0, false);
 
 	pthread_barrier_wait(&barrier);
 
@@ -605,17 +608,23 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		if (flags & REBIND && i &&
 		    (!(i & 0x1f) || rebind_error_inject == i)) {
 #define INJECT_ERROR	(0x1 << 31)
-			if (rebind_error_inject == i)
-				__xe_vm_bind_assert(fd, vm, bind_engines[e],
-						    0, 0, addr, bo_size,
-						    XE_VM_BIND_OP_UNMAP |
-						    XE_VM_BIND_FLAG_ASYNC |
-						    INJECT_ERROR, sync_all,
-						    n_engines, 0, 0);
-			else
+			if (rebind_error_inject == i) {
+				__xe_vm_bind(fd, vm, bind_engines[e],
+					     0, 0, addr, bo_size,
+					     XE_VM_BIND_OP_UNMAP |
+					     XE_VM_BIND_FLAG_ASYNC |
+					     INJECT_ERROR, sync_all,
+					     n_engines, 0, 0);
+				__xe_vm_bind_assert(fd, vm, restart_engine,
+						    0, 0, 0, 0,
+						    XE_VM_BIND_OP_RESTART |
+						    XE_VM_BIND_FLAG_RECLAIM, NULL,
+						    0, 0, 0);
+			} else {
 				xe_vm_unbind_async(fd, vm, bind_engines[e],
 						   0, addr, bo_size,
 						   sync_all, n_engines);
+			}
 
 			sync[0].flags |= DRM_XE_SYNC_SIGNAL;
 			addr += bo_size;
@@ -689,6 +698,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		if (bind_engines[i])
 			xe_engine_destroy(fd, bind_engines[i]);
 	}
+	xe_engine_destroy(fd, restart_engine);
 
 	if (bo) {
 		munmap(data, bo_size);
@@ -746,47 +756,6 @@ static void *thread(void *data)
 	return NULL;
 }
 
-struct vm_thread_data {
-	pthread_t thread;
-	struct drm_xe_vm_bind_op_error_capture *capture;
-	int fd;
-	int vm;
-};
-
-static void *vm_async_ops_err_thread(void *data)
-{
-	struct vm_thread_data *args = data;
-	int fd = args->fd;
-	int ret;
-
-	struct drm_xe_wait_user_fence wait = {
-		.vm_id = args->vm,
-		.op = DRM_XE_UFENCE_WAIT_NEQ,
-		.flags = DRM_XE_UFENCE_WAIT_VM_ERROR,
-		.mask = DRM_XE_UFENCE_WAIT_U32,
-#define BASICALLY_FOREVER	0xffffffffffff
-		.timeout = BASICALLY_FOREVER,
-	};
-
-	ret = igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait);
-
-	while (!ret) {
-		struct drm_xe_vm_bind bind = {
-			.vm_id = args->vm,
-			.num_binds = 1,
-			.bind.op = XE_VM_BIND_OP_RESTART,
-		};
-
-		/* Restart and wait for next error */
-		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND,
-					&bind), 0);
-		args->capture->error = 0;
-		ret = igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait);
-	}
-
-	return NULL;
-}
-
 /**
  * SUBTEST: threads-%s
  * Description: Run threads %arg[1] test with multi threads
@@ -838,6 +807,10 @@ static void *vm_async_ops_err_thread(void *data)
  *	shared vm rebind err
  * @shared-vm-userptr-rebind-err:
  *	shared vm userptr rebind err
+ * @rebind-err:
+ *	rebind err
+ * @userptr-rebind-err:
+ *	userptr rebind err
  * @shared-vm-userptr-invalidate:
  *	shared vm userptr invalidate
  * @shared-vm-userptr-invalidate-race:
@@ -854,7 +827,7 @@ static void *vm_async_ops_err_thread(void *data)
  *	fd userptr invalidate race
  * @hang-basic:
  *	hang basic
-  * @hang-userptr:
+ * @hang-userptr:
  *	hang userptr
  * @hang-rebind:
  *	hang rebind
@@ -872,6 +845,10 @@ static void *vm_async_ops_err_thread(void *data)
  *	hang shared vm rebind
  * @hang-shared-vm-userptr-rebind:
  *	hang shared vm userptr rebind
+ * @hang-rebind-err:
+ *	hang rebind err
+ * @hang-userptr-rebind-err:
+ *	hang userptr rebind err
  * @hang-shared-vm-rebind-err:
  *	hang shared vm rebind err
  * @hang-shared-vm-userptr-rebind-err:
@@ -1031,8 +1008,6 @@ static void threads(int fd, int flags)
 	int n_hw_engines = 0, class;
 	uint64_t i = 0;
 	uint32_t vm_legacy_mode = 0, vm_compute_mode = 0;
-	struct drm_xe_vm_bind_op_error_capture capture = {};
-	struct vm_thread_data vm_err_thread = {};
 	bool go = false;
 	int n_threads = 0;
 	int gt;
@@ -1064,28 +1039,13 @@ static void threads(int fd, int flags)
 	pthread_cond_init(&cond, 0);
 
 	if (flags & SHARED_VM) {
-		struct drm_xe_ext_vm_set_property ext = {
-			.base.next_extension = 0,
-			.base.name = XE_VM_EXTENSION_SET_PROPERTY,
-			.property =
-				XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS,
-			.value = to_user_pointer(&capture),
-		};
-
 		vm_legacy_mode = xe_vm_create(fd,
-					      DRM_XE_VM_CREATE_ASYNC_BIND_OPS,
-					      to_user_pointer(&ext));
+					      DRM_XE_VM_CREATE_ASYNC_DEFAULT,
+					      0);
 		vm_compute_mode = xe_vm_create(fd,
-					       DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+					       DRM_XE_VM_CREATE_ASYNC_DEFAULT |
 					       XE_ENGINE_SET_PROPERTY_COMPUTE_MODE,
 					       0);
-
-		vm_err_thread.capture = &capture;
-		vm_err_thread.fd = fd;
-		vm_err_thread.vm = vm_legacy_mode;
-		pthread_create(&vm_err_thread.thread, 0,
-			       vm_async_ops_err_thread, &vm_err_thread);
-
 	}
 
 	xe_for_each_hw_engine(fd, hwe) {
@@ -1212,8 +1172,6 @@ static void threads(int fd, int flags)
 	if (vm_compute_mode)
 		xe_vm_destroy(fd, vm_compute_mode);
 	free(threads_data);
-	if (flags & SHARED_VM)
-		pthread_join(vm_err_thread.thread, NULL);
 	pthread_barrier_destroy(&barrier);
 }
 
@@ -1236,9 +1194,8 @@ igt_main
 		{ "shared-vm-rebind-bindengine", SHARED_VM | REBIND |
 			BIND_ENGINE },
 		{ "shared-vm-userptr-rebind", SHARED_VM | USERPTR | REBIND },
-		{ "shared-vm-rebind-err", SHARED_VM | REBIND | REBIND_ERROR },
-		{ "shared-vm-userptr-rebind-err", SHARED_VM | USERPTR |
-			REBIND | REBIND_ERROR},
+		{ "rebind-err", REBIND | REBIND_ERROR },
+		{ "userptr-rebind-err", USERPTR | REBIND | REBIND_ERROR},
 		{ "shared-vm-userptr-invalidate", SHARED_VM | USERPTR |
 			INVALIDATE },
 		{ "shared-vm-userptr-invalidate-race", SHARED_VM | USERPTR |
@@ -1262,10 +1219,9 @@ igt_main
 		{ "hang-shared-vm-rebind", HANG | SHARED_VM | REBIND },
 		{ "hang-shared-vm-userptr-rebind", HANG | SHARED_VM | USERPTR |
 			REBIND },
-		{ "hang-shared-vm-rebind-err", HANG | SHARED_VM | REBIND |
+		{ "hang-rebind-err", HANG | REBIND | REBIND_ERROR },
+		{ "hang-userptr-rebind-err", HANG | USERPTR | REBIND |
 			REBIND_ERROR },
-		{ "hang-shared-vm-userptr-rebind-err", HANG | SHARED_VM |
-			USERPTR | REBIND | REBIND_ERROR },
 		{ "hang-shared-vm-userptr-invalidate", HANG | SHARED_VM |
 			USERPTR | INVALIDATE },
 		{ "hang-shared-vm-userptr-invalidate-race", HANG | SHARED_VM |
diff --git a/tests/xe/xe_exercise_blt.c b/tests/xe/xe_exercise_blt.c
index 2caed48ff8..05cfd0583a 100644
--- a/tests/xe/xe_exercise_blt.c
+++ b/tests/xe/xe_exercise_blt.c
@@ -279,7 +279,7 @@ static void fast_copy_test(int xe,
 			region1 = igt_collection_get_value(regions, 0);
 			region2 = igt_collection_get_value(regions, 1);
 
-			vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+			vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 			engine = xe_engine_create(xe, vm, &inst, 0);
 			ctx = intel_ctx_xe(xe, vm, engine, 0, 0, 0);
 
diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 8cdd8ba742..eed8c283c8 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -60,7 +60,7 @@ static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert(n_engines <= MAX_N_ENGINES);
 	igt_assert(n_execs > 0);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
diff --git a/tests/xe/xe_huc_copy.c b/tests/xe/xe_huc_copy.c
index d4377f9a11..0d16acbd0f 100644
--- a/tests/xe/xe_huc_copy.c
+++ b/tests/xe/xe_huc_copy.c
@@ -118,7 +118,7 @@ test_huc_copy(int fd)
 		{ .addr = ADDR_BATCH, .size = SIZE_BATCH }, // batch
 	};
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	engine = xe_engine_create_class(fd, vm, DRM_XE_ENGINE_CLASS_VIDEO_DECODE);
 	sync.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL;
 	sync.handle = syncobj_create(fd, 0);
diff --git a/tests/xe/xe_intel_bb.c b/tests/xe/xe_intel_bb.c
index 539f44a0f0..5ad12a60ed 100644
--- a/tests/xe/xe_intel_bb.c
+++ b/tests/xe/xe_intel_bb.c
@@ -194,7 +194,7 @@ static void simple_bb(struct buf_ops *bops, bool new_context)
 	intel_bb_reset(ibb, true);
 
 	if (new_context) {
-		vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+		vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 		ctx = xe_engine_create(xe, vm, xe_hw_engine(xe, 0), 0);
 		intel_bb_destroy(ibb);
 		ibb = intel_bb_create_with_context(xe, ctx, vm, NULL, PAGE_SIZE);
diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
index 559eccdeb3..6a1d4d336c 100644
--- a/tests/xe/xe_pm.c
+++ b/tests/xe/xe_pm.c
@@ -242,7 +242,7 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	if (check_rpm)
 		igt_assert(in_d3(device, d_state));
 
-	vm = xe_vm_create(device.fd_xe, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(device.fd_xe, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 
 	if (check_rpm)
 		igt_assert(out_of_d3(device, d_state));
diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 5703538cc8..f2bd56855f 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -276,7 +276,7 @@ static void unbind_all(int fd, int n_vmas)
 		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
 	};
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo = xe_bo_create(fd, 0, vm, bo_size);
 
 	for (i = 0; i < n_vmas; ++i)
@@ -323,16 +323,6 @@ static void userptr_invalid(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
-struct vm_thread_data {
-	pthread_t thread;
-	struct drm_xe_vm_bind_op_error_capture *capture;
-	int fd;
-	int vm;
-	uint32_t bo;
-	size_t bo_size;
-	bool destroy;
-};
-
 /**
  * SUBTEST: vm-async-ops-err
  * Description: Test VM async ops error
@@ -345,57 +335,6 @@ struct vm_thread_data {
  * Run type: FULL
  */
 
-static void *vm_async_ops_err_thread(void *data)
-{
-	struct vm_thread_data *args = data;
-	int fd = args->fd;
-	uint64_t addr = 0x201a0000;
-	int num_binds = 0;
-	int ret;
-
-	struct drm_xe_wait_user_fence wait = {
-		.vm_id = args->vm,
-		.op = DRM_XE_UFENCE_WAIT_NEQ,
-		.flags = DRM_XE_UFENCE_WAIT_VM_ERROR,
-		.mask = DRM_XE_UFENCE_WAIT_U32,
-		.timeout = MS_TO_NS(1000),
-	};
-
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE,
-				&wait), 0);
-	if (args->destroy) {
-		usleep(5000);	/* Wait other binds to queue up */
-		xe_vm_destroy(fd, args->vm);
-		return NULL;
-	}
-
-	while (!ret) {
-		struct drm_xe_vm_bind bind = {
-			.vm_id = args->vm,
-			.num_binds = 1,
-			.bind.op = XE_VM_BIND_OP_RESTART,
-		};
-
-		/* VM sync ops should work */
-		if (!(num_binds++ % 2)) {
-			xe_vm_bind_sync(fd, args->vm, args->bo, 0, addr,
-					args->bo_size);
-		} else {
-			xe_vm_unbind_sync(fd, args->vm, 0, addr,
-					  args->bo_size);
-			addr += args->bo_size * 2;
-		}
-
-		/* Restart and wait for next error */
-		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND,
-					&bind), 0);
-		args->capture->error = 0;
-		ret = igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait);
-	}
-
-	return NULL;
-}
-
 static void vm_async_ops_err(int fd, bool destroy)
 {
 	uint32_t vm;
@@ -404,99 +343,56 @@ static void vm_async_ops_err(int fd, bool destroy)
 		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
 	};
 #define N_BINDS		32
-	struct drm_xe_vm_bind_op_error_capture capture = {};
-	struct drm_xe_ext_vm_set_property ext = {
-		.base.next_extension = 0,
-		.base.name = XE_VM_EXTENSION_SET_PROPERTY,
-		.property = XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS,
-		.value = to_user_pointer(&capture),
-	};
-	struct vm_thread_data thread = {};
 	uint32_t syncobjs[N_BINDS];
+	uint32_t restart_engine;
 	size_t bo_size = 0x1000 * 32;
 	uint32_t bo;
-	int i, j;
+	int i, j = 0;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS,
-			  to_user_pointer(&ext));
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo = xe_bo_create(fd, 0, vm, bo_size);
-
-	thread.capture = &capture;
-	thread.fd = fd;
-	thread.vm = vm;
-	thread.bo = bo;
-	thread.bo_size = bo_size;
-	thread.destroy = destroy;
-	pthread_create(&thread.thread, 0, vm_async_ops_err_thread, &thread);
+	restart_engine = xe_bind_engine_create(fd, vm, 0, false);
 
 	for (i = 0; i < N_BINDS; i++)
 		syncobjs[i] = syncobj_create(fd, 0);
 
-	for (j = 0, i = 0; i < N_BINDS / 4; i++, j++) {
-		sync.handle = syncobjs[j];
+	for (i = 0; i < N_BINDS; i++) {
+		sync.handle = syncobjs[i];
 #define INJECT_ERROR	(0x1 << 31)
-		if (i == N_BINDS / 8)	/* Inject error on this bind */
-			__xe_vm_bind_assert(fd, vm, 0, bo, 0,
-					    addr + i * bo_size * 2,
-					    bo_size, XE_VM_BIND_OP_MAP |
-					    XE_VM_BIND_FLAG_ASYNC |
-					    INJECT_ERROR, &sync, 1, 0, 0);
-		else
-			xe_vm_bind_async(fd, vm, 0, bo, 0,
-					 addr + i * bo_size * 2,
-					 bo_size, &sync, 1);
-	}
+		if ((i == N_BINDS / 8 && destroy) ||
+		    (!((i + 1) % (N_BINDS / 8)) && !destroy)) { /* Inject error on this bind */
+			__xe_vm_bind(fd, vm, 0, bo, 0,
+				     addr + i * bo_size * 2,
+				     bo_size, XE_VM_BIND_OP_MAP |
+				     XE_VM_BIND_FLAG_ASYNC | INJECT_ERROR,
+				     &sync, 1, 0, 0);
+
+			if (destroy)
+				break;
 
-	for (i = 0; i < N_BINDS / 4; i++, j++) {
-		sync.handle = syncobjs[j];
-		if (i == N_BINDS / 8)
-			__xe_vm_bind_assert(fd, vm, 0, 0, 0,
-					    addr + i * bo_size * 2,
+			__xe_vm_bind_assert(fd, vm, restart_engine, 0, 0,
+					    addr + j++ * bo_size * 2,
 					    bo_size, XE_VM_BIND_OP_UNMAP |
-					    XE_VM_BIND_FLAG_ASYNC |
-					    INJECT_ERROR, &sync, 1, 0, 0);
-		else
-			xe_vm_unbind_async(fd, vm, 0, 0,
-					   addr + i * bo_size * 2,
-					   bo_size, &sync, 1);
-	}
-
-	for (i = 0; i < N_BINDS / 4; i++, j++) {
-		sync.handle = syncobjs[j];
-		if (i == N_BINDS / 8)
-			__xe_vm_bind_assert(fd, vm, 0, bo, 0,
-					    addr + i * bo_size * 2,
-					    bo_size, XE_VM_BIND_OP_MAP |
-					    XE_VM_BIND_FLAG_ASYNC |
-					    INJECT_ERROR, &sync, 1, 0, 0);
-		else
+					    XE_VM_BIND_FLAG_RECLAIM,
+					    0, 0, 0, 0);
+			__xe_vm_bind_assert(fd, vm, restart_engine,
+					    0, 0, 0, 0,
+					    XE_VM_BIND_OP_RESTART |
+					    XE_VM_BIND_FLAG_RECLAIM, NULL,
+					    0, 0, 0);
+		} else {
 			xe_vm_bind_async(fd, vm, 0, bo, 0,
 					 addr + i * bo_size * 2,
 					 bo_size, &sync, 1);
+		}
 	}
 
-	for (i = 0; i < N_BINDS / 4; i++, j++) {
-		sync.handle = syncobjs[j];
-		if (i == N_BINDS / 8)
-			__xe_vm_bind_assert(fd, vm, 0, 0, 0,
-					    addr + i * bo_size * 2,
-					    bo_size, XE_VM_BIND_OP_UNMAP |
-					    XE_VM_BIND_FLAG_ASYNC |
-					    INJECT_ERROR, &sync, 1, 0, 0);
-		else
-			xe_vm_unbind_async(fd, vm, 0, 0,
-					   addr + i * bo_size * 2,
-					   bo_size, &sync, 1);
-	}
-
-	for (i = 0; i < N_BINDS; i++)
+	for (i = 0; i < (destroy ? (N_BINDS / 8 - 1) : N_BINDS); i++)
 		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
 					NULL));
 
 	if (!destroy)
 		xe_vm_destroy(fd, vm);
-
-	pthread_join(thread.thread, NULL);
 }
 
 /**
@@ -549,7 +445,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 	data = malloc(sizeof(*data) * n_bo);
 	igt_assert(data);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(struct shared_pte_page_data);
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -729,7 +625,7 @@ test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci,
 	} *data;
 	int i, b;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * N_ENGINES;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -739,7 +635,7 @@ test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci,
 
 	for (i = 0; i < N_ENGINES; i++) {
 		engines[i] = xe_engine_create(fd, vm, eci, 0);
-		bind_engines[i] = xe_bind_engine_create(fd, vm, 0);
+		bind_engines[i] = xe_bind_engine_create(fd, vm, 0, true);
 		syncobjs[i] = syncobj_create(fd, 0);
 	}
 	syncobjs[N_ENGINES] = syncobj_create(fd, 0);
@@ -909,7 +805,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 
 	igt_assert(n_execs <= BIND_ARRAY_MAX_N_EXEC);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -919,7 +815,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 	data = xe_bo_map(fd, bo, bo_size);
 
 	if (flags & BIND_ARRAY_BIND_ENGINE_FLAG)
-		bind_engine = xe_bind_engine_create(fd, vm, 0);
+		bind_engine = xe_bind_engine_create(fd, vm, 0, true);
 	engine = xe_engine_create(fd, vm, eci, 0);
 
 	for (i = 0; i < n_execs; ++i) {
@@ -1101,7 +997,7 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 	igt_assert(n_engines <= MAX_N_ENGINES);
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 
 	if (flags & LARGE_BIND_FLAG_USERPTR) {
 		map = aligned_alloc(xe_get_default_alignment(fd), bo_size);
@@ -1393,7 +1289,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 			unbind_n_page_offset *= n_page_per_2mb;
 	}
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = page_size * bo_n_pages;
 
 	if (flags & MAP_FLAG_USERPTR) {
@@ -1693,7 +1589,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 			unbind_n_page_offset *= n_page_per_2mb;
 	}
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = page_size * bo_n_pages;
 
 	if (flags & MAP_FLAG_USERPTR) {
diff --git a/tests/xe/xe_waitfence.c b/tests/xe/xe_waitfence.c
index 4f2df2a9d8..7dfa668179 100644
--- a/tests/xe/xe_waitfence.c
+++ b/tests/xe/xe_waitfence.c
@@ -35,7 +35,7 @@ static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 
 	sync[0].addr = to_user_pointer(&wait_fence);
 	sync[0].timeline_value = val;
-	xe_vm_bind(fd, vm, bo, offset, addr, size, sync, 1);
+	xe_vm_bind_async(fd, vm, 0, bo, offset, addr, size, sync, 1);
 }
 
 enum waittype {
@@ -64,7 +64,7 @@ waitfence(int fd, enum waittype wt)
 	uint32_t bo_7;
 	int64_t timeout;
 
-	uint32_t vm = xe_vm_create(fd, 0, 0);
+	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_1 = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
 	do_bind(fd, vm, bo_1, 0, 0x200000, 0x40000, 1);
 	bo_2 = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
@@ -97,21 +97,6 @@ waitfence(int fd, enum waittype wt)
 			  ", elapsed: %" PRId64 "\n",
 			  timeout, signalled, signalled - current);
 	}
-
-	xe_vm_unbind_sync(fd, vm, 0, 0x200000, 0x40000);
-	xe_vm_unbind_sync(fd, vm, 0, 0xc0000000, 0x40000);
-	xe_vm_unbind_sync(fd, vm, 0, 0x180000000, 0x40000);
-	xe_vm_unbind_sync(fd, vm, 0, 0x140000000, 0x10000);
-	xe_vm_unbind_sync(fd, vm, 0, 0x100000000, 0x100000);
-	xe_vm_unbind_sync(fd, vm, 0, 0xc0040000, 0x1c0000);
-	xe_vm_unbind_sync(fd, vm, 0, 0xeffff0000, 0x10000);
-	gem_close(fd, bo_7);
-	gem_close(fd, bo_6);
-	gem_close(fd, bo_5);
-	gem_close(fd, bo_4);
-	gem_close(fd, bo_3);
-	gem_close(fd, bo_2);
-	gem_close(fd, bo_1);
 }
 
 igt_main
-- 
2.34.1
