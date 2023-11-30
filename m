Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5185E10E774
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 18:46:13 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:45:34 +0000
Message-Id: <20231130184536.7-20-francois.dugast@intel.com>
In-Reply-To: <20231130184536.7-1-francois.dugast@intel.com>
References: <20231130184536.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v5 19/21] tests/intel/xe: Adjust to KMD uAPI
 changes for long-running VMs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oak Zeng <oak.zeng@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Currently we're using "compute mode" for long running VMs using
using preempt-fences for memory management, and "fault mode" for long
running VMs using page faults.

Change this to use the terminology "long-running" abbreviated as LR for
long-running VMs. These VMs can then either be in preempt-fence mode or
fault mode. The user can force fault mode at creation time, but otherwise
the driver can choose whether to use or not use fault mode mode for
long-running vms depending on the device capabilities.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 benchmarks/gem_wsim.c              |  2 +-
 include/drm-uapi/xe_drm.h          | 23 ++++++++++++++++++++++-
 tests/intel/xe_evict.c             |  4 ++--
 tests/intel/xe_exec_balancer.c     |  2 +-
 tests/intel/xe_exec_compute_mode.c |  2 +-
 tests/intel/xe_exec_fault_mode.c   |  1 +
 tests/intel/xe_exec_reset.c        |  2 +-
 tests/intel/xe_exec_threads.c      |  4 ++--
 tests/intel/xe_noexec_ping_pong.c  |  2 +-
 9 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 66ad7563d..e937e1027 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -2038,7 +2038,7 @@ static void xe_vm_create_(struct xe_vm *vm)
 
 	if (vm->compute_mode)
 		flags |= DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-			 DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE;
+			 DRM_XE_VM_CREATE_FLAG_LR_MODE;
 
 	vm->id = xe_vm_create(fd, flags, 0);
 }
diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index aa524f26e..43be76f4d 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -647,8 +647,29 @@ struct drm_xe_vm_create {
 	__u64 extensions;
 
 #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
-#define DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE	(1 << 1)
+	/*
+	 * An LR, or Long Running VM accepts exec submissions
+	 * to its exec_queues that don't have an upper time limit on
+	 * the job execution time. But exec submissions to these
+	 * don't allow any of the flags DRM_XE_SYNC_FLAG_SYNCOBJ,
+	 * DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ, DRM_XE_SYNC_FLAG_DMA_BUF,
+	 * used as out-syncobjs, that is, together with DRM_XE_SYNC_FLAG_SIGNAL.
+	 * LR VMs can be created in recoverable page-fault mode using
+	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE, if the device supports it.
+	 * If that flag is omitted, the UMD can not rely on the slightly
+	 * different per-VM overcommit semantics that are enabled by
+	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE (see below), but KMD may
+	 * still enable recoverable pagefaults if supported by the device.
+	 */
+#define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
 #define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
+	/*
+	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE requires also
+	 * DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to be allocated
+	 * on demand when accessed, and also allows per-VM overcommit of memory.
+	 * The xe driver internally uses recoverable pagefaults to implement
+	 * this.
+	 */
 #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
 	/** @flags: Flags */
 	__u32 flags;
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 5b06b8953..89dc46fae 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -246,12 +246,12 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 	fd = drm_open_driver(DRIVER_XE);
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-			  DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE, 0);
+			  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	if (flags & BIND_EXEC_QUEUE)
 		bind_exec_queues[0] = xe_bind_exec_queue_create(fd, vm, 0, true);
 	if (flags & MULTI_VM) {
 		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-				   DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE, 0);
+				   DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 		if (flags & BIND_EXEC_QUEUE)
 			bind_exec_queues[1] = xe_bind_exec_queue_create(fd, vm2,
 									0, true);
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 742724641..79ff65e89 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -436,7 +436,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		return;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-			  DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE, 0);
+			  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 881f3829b..7d3004d65 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -115,7 +115,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-			  DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE, 0);
+			  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 228e7e44a..ee7cbb604 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -132,6 +132,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
+			  DRM_XE_VM_CREATE_FLAG_LR_MODE |
 			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index b8f5c6fbc..edfd27fe0 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -532,7 +532,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		fd = drm_open_driver(DRIVER_XE);
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-			  DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE, 0);
+			  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 9aa989ab5..fcb926698 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -287,7 +287,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	if (!vm) {
 		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-				  DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE, 0);
+				  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 		owns_vm = true;
 	}
 
@@ -1008,7 +1008,7 @@ static void threads(int fd, int flags)
 					      0);
 		vm_compute_mode = xe_vm_create(fd,
 					       DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-					       DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE,
+					       DRM_XE_VM_CREATE_FLAG_LR_MODE,
 					       0);
 	}
 
diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index 9659272b5..c91340784 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -64,7 +64,7 @@ static void test_ping_pong(int fd, struct drm_xe_engine *engine)
 	 * stats.
 	 */
 	for (i = 0; i < NUM_VMS; ++i) {
-		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE, 0);
+		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 		for (j = 0; j < NUM_BOS; ++j) {
 			igt_debug("Creating bo size %lu for vm %u\n",
 				  (unsigned long) bo_size,
-- 
2.34.1
