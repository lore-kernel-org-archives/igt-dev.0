Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAE510E05C
 for <igt-dev@lists.freedesktop.org>; Mon,  1 May 2023 23:04:19 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  1 May 2023 16:04:16 -0700
Message-Id: <20230501230416.3210262-6-matthew.brost@intel.com>
In-Reply-To: <20230501230416.3210262-1-matthew.brost@intel.com>
References: <20230501230416.3210262-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 5/5] xe: Update to new VM bind uAPI
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
 include/drm-uapi/xe_drm.h       |  79 ++-------------
 lib/intel_batchbuffer.c         |   2 +-
 lib/xe/xe_compute.c             |   2 +-
 lib/xe/xe_ioctl.c               |  15 +--
 lib/xe/xe_ioctl.h               |   2 +-
 lib/xe/xe_query.c               |   2 +-
 tests/xe/xe_create.c            |   2 +-
 tests/xe/xe_evict.c             |  23 +++--
 tests/xe/xe_exec_balancer.c     |   6 +-
 tests/xe/xe_exec_basic.c        |   5 +-
 tests/xe/xe_exec_compute_mode.c |   6 +-
 tests/xe/xe_exec_fault_mode.c   |   6 +-
 tests/xe/xe_exec_reset.c        |   8 +-
 tests/xe/xe_exec_threads.c      | 112 ++++++---------------
 tests/xe/xe_guc_pc.c            |   2 +-
 tests/xe/xe_huc_copy.c          |   2 +-
 tests/xe/xe_intel_bb.c          |   2 +-
 tests/xe/xe_pm.c                |   2 +-
 tests/xe/xe_vm.c                | 168 +++++++-------------------------
 tests/xe/xe_waitfence.c         |  18 +---
 20 files changed, 120 insertions(+), 344 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 27c51946f..cb4debe4e 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -145,10 +145,11 @@ struct drm_xe_engine_class_instance {
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
 
 	__u16 engine_instance;
 	__u16 gt_id;
@@ -312,39 +313,8 @@ struct drm_xe_gem_mmap_offset {
 	__u64 reserved[2];
 };
 
-/**
- * struct drm_xe_vm_bind_op_error_capture - format of VM bind op error capture
- */
-struct drm_xe_vm_bind_op_error_capture {
-	/** @error: errno that occured */
-	__s32 error;
-	/** @op: operation that encounter an error */
-	__u32 op;
-	/** @addr: address of bind op */
-	__u64 addr;
-	/** @size: size of bind */
-	__u64 size;
-};
-
-/** struct drm_xe_ext_vm_set_property - VM set property extension */
-struct drm_xe_ext_vm_set_property {
-	/** @base: base user extension */
-	struct xe_user_extension base;
-
-	/** @property: property to set */
-#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
-	__u32 property;
-
-	/** @value: property value */
-	__u64 value;
-
-	/** @reserved: Reserved */
-	__u64 reserved[2];
-};
-
 struct drm_xe_vm_create {
 	/** @extensions: Pointer to the first extension struct, if any */
-#define XE_VM_EXTENSION_SET_PROPERTY	0
 	__u64 extensions;
 
 	/** @flags: Flags */
@@ -352,7 +322,7 @@ struct drm_xe_vm_create {
 
 #define DRM_XE_VM_CREATE_SCRATCH_PAGE	(0x1 << 0)
 #define DRM_XE_VM_CREATE_COMPUTE_MODE	(0x1 << 1)
-#define DRM_XE_VM_CREATE_ASYNC_BIND_OPS	(0x1 << 2)
+#define DRM_XE_VM_CREATE_ASYNC_DEFAULT	(0x1 << 2)
 #define DRM_XE_VM_CREATE_FAULT_MODE	(0x1 << 3)
 
 	/** @vm_id: Returned VM ID */
@@ -417,30 +387,6 @@ struct drm_xe_vm_bind_op {
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
-	 * If this flag is set and doesn't return return an error, the bind op
-	 * can still fail and recovery is needed. If configured, the bind op that
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
@@ -455,6 +401,7 @@ struct drm_xe_vm_bind_op {
 	 * VK sparse bindings.
 	 */
 #define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
+#define XE_VM_BIND_FLAG_RECLAIM		(0x1 << 20)
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
@@ -702,17 +649,10 @@ struct drm_xe_mmio {
 struct drm_xe_wait_user_fence {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
-	union {
-		/**
-		 * @addr: user pointer address to wait on, must qword aligned
-		 */
-		__u64 addr;
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
 	/** @op: wait operation (type of comparison) */
 #define DRM_XE_UFENCE_WAIT_EQ	0
 #define DRM_XE_UFENCE_WAIT_NEQ	1
@@ -724,7 +664,6 @@ struct drm_xe_wait_user_fence {
 	/** @flags: wait flags */
 #define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
 #define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
-#define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
 	__u16 flags;
 	/** @value: compare value */
 	__u64 value;
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 545d17054..b4a6db566 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -940,7 +940,7 @@ __intel_bb_create(int fd, uint32_t ctx, const intel_ctx_cfg_t *cfg,
 		ibb->gtt_size = 1ull << xe_va_bits(fd);
 
 		if (!ctx)
-			ctx = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+			ctx = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 
 		ibb->uses_full_ppgtt = true;
 		ibb->allocator_handle =
diff --git a/lib/xe/xe_compute.c b/lib/xe/xe_compute.c
index 2a3686a1b..e5a8ffcbb 100644
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
index 66a8393fe..77e6d2d13 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -199,16 +199,8 @@ void xe_vm_unbind_async(int fd, uint32_t vm, uint32_t engine,
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
@@ -260,10 +252,11 @@ uint32_t xe_bo_create(int fd, int gt, uint32_t vm, uint64_t size)
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
index 049cd183d..f5d39e81c 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -69,7 +69,7 @@ uint32_t xe_bo_create(int fd, int gt, uint32_t vm, uint64_t size);
 uint32_t xe_engine_create(int fd, uint32_t vm,
 			  struct drm_xe_engine_class_instance *instance,
 			  uint64_t ext);
-uint32_t xe_bind_engine_create(int fd, uint32_t vm, uint64_t ext);
+uint32_t xe_bind_engine_create(int fd, uint32_t vm, uint64_t ext, bool async);
 uint32_t xe_engine_create_class(int fd, uint32_t vm, uint16_t class);
 void xe_engine_destroy(int fd, uint32_t engine);
 uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index bd5eb1d18..b3a6c5546 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -300,7 +300,7 @@ bool xe_supports_faults(int fd)
 	bool supports_faults;
 
 	struct drm_xe_vm_create create = {
-		.flags = DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+		.flags = DRM_XE_VM_CREATE_ASYNC_DEFAULT |
 			 DRM_XE_VM_CREATE_FAULT_MODE,
 	};
 
diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c
index ae841f809..07744753b 100644
--- a/tests/xe/xe_create.c
+++ b/tests/xe/xe_create.c
@@ -54,7 +54,7 @@ static void create_invalid_size(int fd)
 	uint32_t handle;
 	int ret;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 
 	xe_for_each_mem_region(fd, memreg, region) {
 		memregion = xe_mem_region(fd, region);
diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
index 5687cce30..d5ddf9003 100644
--- a/tests/xe/xe_evict.c
+++ b/tests/xe/xe_evict.c
@@ -64,15 +64,17 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 	fd = drm_open_driver(DRIVER_XE);
 	xe_device_get(fd);
 
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
 
@@ -241,15 +243,16 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 	fd = drm_open_driver(DRIVER_XE);
 	xe_device_get(fd);
 
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
index 2018c8104..7096243d7 100644
--- a/tests/xe/xe_exec_balancer.c
+++ b/tests/xe/xe_exec_balancer.c
@@ -66,7 +66,7 @@ static void test_all_active(int fd, int gt, int class)
 	if (num_placements < 2)
 		return;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * num_placements;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
@@ -212,7 +212,7 @@ test_exec(int fd, int gt, int class, int n_engines, int n_execs,
 	if (num_placements < 2)
 		return;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
@@ -435,7 +435,7 @@ test_cm(int fd, int gt, int class, int n_engines, int n_execs,
 	if (num_placements < 2)
 		return;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
 			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
index f7ad6aeeb..98b7252fa 100644
--- a/tests/xe/xe_exec_basic.c
+++ b/tests/xe/xe_exec_basic.c
@@ -113,7 +113,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert(n_vm <= MAX_N_ENGINES);
 
 	for (i = 0; i < n_vm; ++i)
-		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -156,7 +156,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 		engines[i] = xe_engine_create(fd, __vm, eci, 0);
 		if (flags & BIND_ENGINE)
-			bind_engines[i] = xe_bind_engine_create(fd, __vm, 0);
+			bind_engines[i] = xe_bind_engine_create(fd, __vm, 0,
+								true);
 		else
 			bind_engines[i] = 0;
 		syncobjs[i] = syncobj_create(fd, 0);
diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/xe/xe_exec_compute_mode.c
index 685193990..750815764 100644
--- a/tests/xe/xe_exec_compute_mode.c
+++ b/tests/xe/xe_exec_compute_mode.c
@@ -116,7 +116,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 	igt_assert(n_engines <= MAX_N_ENGINES);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
 			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
@@ -134,7 +134,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 					      to_user_pointer(&ext));
 		if (flags & BIND_ENGINE)
 			bind_engines[i] =
-				xe_bind_engine_create(fd, vm, 0);
+				xe_bind_engine_create(fd, vm, 0, true);
 		else
 			bind_engines[i] = 0;
 	};
@@ -170,7 +170,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 					      to_user_pointer(&ext));
 		if (flags & BIND_ENGINE)
 			bind_engines[i] =
-				xe_bind_engine_create(fd, vm, 0);
+				xe_bind_engine_create(fd, vm, 0, true);
 		else
 			bind_engines[i] = 0;
 	};
diff --git a/tests/xe/xe_exec_fault_mode.c b/tests/xe/xe_exec_fault_mode.c
index a3ab17270..9950ab542 100644
--- a/tests/xe/xe_exec_fault_mode.c
+++ b/tests/xe/xe_exec_fault_mode.c
@@ -136,7 +136,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 	igt_assert(n_engines <= MAX_N_ENGINES);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
 			  DRM_XE_VM_CREATE_FAULT_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
@@ -168,7 +168,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		engines[i] = xe_engine_create(fd, vm, eci, 0);
 		if (flags & BIND_ENGINE)
 			bind_engines[i] =
-				xe_bind_engine_create(fd, vm, 0);
+				xe_bind_engine_create(fd, vm, 0, true);
 		else
 			bind_engines[i] = 0;
 	};
@@ -382,7 +382,7 @@ test_atomic(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t *ptr;
 	int i, b, wait_idx = 0;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
 			  DRM_XE_VM_CREATE_FAULT_MODE, 0);
 	bo_size = sizeof(*data) * n_atomic;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c
index 0d72a3f20..6007bcf6b 100644
--- a/tests/xe/xe_exec_reset.c
+++ b/tests/xe/xe_exec_reset.c
@@ -46,7 +46,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 	uint32_t bo = 0;
 	struct xe_spin *spin;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*spin);
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -192,7 +192,7 @@ test_balancer(int fd, int gt, int class, int n_engines, int n_execs,
 	if (num_placements < 2)
 		return;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -393,7 +393,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		xe_device_get(fd);
 	}
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -571,7 +571,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		xe_device_get(fd);
 	}
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
 			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
index 3f2c2de9e..01bfa6d9e 100644
--- a/tests/xe/xe_exec_threads.c
+++ b/tests/xe/xe_exec_threads.c
@@ -78,7 +78,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 
 	if (!vm) {
-		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 		owns_vm = true;
 	}
 
@@ -287,7 +287,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 
 	if (!vm) {
-		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT |
 				  XE_ENGINE_SET_PROPERTY_COMPUTE_MODE, 0);
 		owns_vm = true;
 	}
@@ -475,6 +475,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	};
 	uint32_t engines[MAX_N_ENGINES];
 	uint32_t bind_engines[MAX_N_ENGINES];
+	uint32_t restart_engine;
 	uint32_t syncobjs[MAX_N_ENGINES];
 	size_t bo_size;
 	uint32_t bo = 0;
@@ -496,7 +497,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 
 	if (!vm) {
-		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 		owns_vm = true;
 	}
 
@@ -537,13 +538,15 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
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
 
@@ -603,17 +606,23 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
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
@@ -687,6 +696,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
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
@@ -1032,8 +1001,6 @@ static void threads(int fd, int flags)
 	int n_hw_engines = 0, class;
 	uint64_t i = 0;
 	uint32_t vm_legacy_mode = 0, vm_compute_mode = 0;
-	struct drm_xe_vm_bind_op_error_capture capture = {};
-	struct vm_thread_data vm_err_thread = {};
 	bool go = false;
 	int n_threads = 0;
 	int gt;
@@ -1065,28 +1032,13 @@ static void threads(int fd, int flags)
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
@@ -1213,8 +1165,6 @@ static void threads(int fd, int flags)
 	if (vm_compute_mode)
 		xe_vm_destroy(fd, vm_compute_mode);
 	free(threads_data);
-	if (flags & SHARED_VM)
-		pthread_join(vm_err_thread.thread, NULL);
 	pthread_barrier_destroy(&barrier);
 }
 
@@ -1237,9 +1187,8 @@ igt_main
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
@@ -1263,10 +1212,9 @@ igt_main
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
diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 5c71ae147..4025bb312 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -59,7 +59,7 @@ static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert(n_engines <= MAX_N_ENGINES);
 	igt_assert(n_execs > 0);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
diff --git a/tests/xe/xe_huc_copy.c b/tests/xe/xe_huc_copy.c
index fdac907d6..cff212180 100644
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
index 35d61608e..5e24360c2 100644
--- a/tests/xe/xe_intel_bb.c
+++ b/tests/xe/xe_intel_bb.c
@@ -195,7 +195,7 @@ static void simple_bb(struct buf_ops *bops, bool new_context)
 	intel_bb_reset(ibb, true);
 
 	if (new_context) {
-		ctx = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+		ctx = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 		intel_bb_destroy(ibb);
 		ibb = intel_bb_create_with_context(xe, ctx, NULL, PAGE_SIZE);
 		intel_bb_out(ibb, MI_BATCH_BUFFER_END);
diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
index 44154143c..97e73e82a 100644
--- a/tests/xe/xe_pm.c
+++ b/tests/xe/xe_pm.c
@@ -238,7 +238,7 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	if (check_rpm)
 		igt_assert(in_d3(device, d_state));
 
-	vm = xe_vm_create(device.fd_xe, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(device.fd_xe, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 
 	if (check_rpm)
 		igt_assert(out_of_d3(device, d_state));
diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 694f829b3..96cb06779 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -275,7 +275,7 @@ static void unbind_all(int fd, int n_vmas)
 		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
 	};
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo = xe_bo_create(fd, 0, vm, bo_size);
 
 	for (i = 0; i < n_vmas; ++i)
@@ -344,57 +344,6 @@ struct vm_thread_data {
  * TODO: change ``'Run type' == FULL`` to a better category
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
-		.timeout = 1000,
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
@@ -403,99 +352,56 @@ static void vm_async_ops_err(int fd, bool destroy)
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
@@ -547,7 +453,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 	data = malloc(sizeof(*data) * n_bo);
 	igt_assert(data);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(struct shared_pte_page_data);
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -717,7 +623,7 @@ test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci)
 	} *data;
 	int i, b;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * N_ENGINES;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -726,7 +632,7 @@ test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci)
 
 	for (i = 0; i < N_ENGINES; i++) {
 		engines[i] = xe_engine_create(fd, vm, eci, 0);
-		bind_engines[i] = xe_bind_engine_create(fd, vm, 0);
+		bind_engines[i] = xe_bind_engine_create(fd, vm, 0, true);
 		syncobjs[i] = syncobj_create(fd, 0);
 	}
 	syncobjs[N_ENGINES] = syncobj_create(fd, 0);
@@ -873,7 +779,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 
 	igt_assert(n_execs <= BIND_ARRAY_MAX_N_EXEC);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
@@ -882,7 +788,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 	data = xe_bo_map(fd, bo, bo_size);
 
 	if (flags & BIND_ARRAY_BIND_ENGINE_FLAG)
-		bind_engine = xe_bind_engine_create(fd, vm, 0);
+		bind_engine = xe_bind_engine_create(fd, vm, 0, true);
 	engine = xe_engine_create(fd, vm, eci, 0);
 
 	for (i = 0; i < n_execs; ++i) {
@@ -1050,7 +956,7 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 	igt_assert(n_engines <= MAX_N_ENGINES);
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 
 	if (flags & LARGE_BIND_FLAG_USERPTR) {
 		map = aligned_alloc(xe_get_default_alignment(fd), bo_size);
@@ -1337,7 +1243,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 			unbind_n_page_offset *= n_page_per_2mb;
 	}
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = page_size * bo_n_pages;
 
 	if (flags & MAP_FLAG_USERPTR) {
@@ -1636,7 +1542,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 			unbind_n_page_offset *= n_page_per_2mb;
 	}
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_size = page_size * bo_n_pages;
 
 	if (flags & MAP_FLAG_USERPTR) {
diff --git a/tests/xe/xe_waitfence.c b/tests/xe/xe_waitfence.c
index cdfcacdb4..917957442 100644
--- a/tests/xe/xe_waitfence.c
+++ b/tests/xe/xe_waitfence.c
@@ -34,7 +34,7 @@ static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 
 	sync[0].addr = to_user_pointer(&wait_fence);
 	sync[0].timeline_value = val;
-	xe_vm_bind(fd, vm, bo, offset, addr, size, sync, 1);
+	xe_vm_bind_async(fd, vm, 0, bo, offset, addr, size, sync, 1);
 }
 
 /**
@@ -52,7 +52,7 @@ test(int fd)
 	uint32_t bo_6;
 	uint32_t bo_7;
 
-	uint32_t vm = xe_vm_create(fd, 0, 0);
+	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
 	bo_1 = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
 	do_bind(fd, vm, bo_1, 0, 0x200000, 0x40000, 1);
 	bo_2 = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
@@ -68,20 +68,6 @@ test(int fd)
 	bo_7 = xe_bo_create_flags(fd, vm, 0x10000, MY_FLAG);
 	do_bind(fd, vm, bo_7, 0, 0xeffff0000, 0x10000, 7);
 	xe_wait_ufence(fd, &wait_fence, 7, NULL, 2000);
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
