Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEAA710E26B
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Nov 2023 13:05:48 +0000 (UTC)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Nov 2023 14:05:26 +0100
Message-ID: <20231127130526.30012-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel/xe: Adjust to KMD uAPI changes
 for long-running VMs
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
index df4850086..42dd27667 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -2025,7 +2025,7 @@ static void xe_vm_create_(struct xe_vm *vm)
 
 	if (vm->compute_mode)
 		flags |= DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-			 DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE;
+			 DRM_XE_VM_CREATE_FLAG_LR_MODE;
 
 	vm->id = xe_vm_create(fd, flags, 0);
 }
diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 255b360a1..10a94ad46 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -589,8 +589,29 @@ struct drm_xe_vm_create {
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
index 6d953e58b..1b5220f22 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -243,12 +243,12 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
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
index 8a0165b8c..beeb907a3 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -434,7 +434,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		return;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-			  DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE, 0);
+			  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 20d3fc6e8..ed865bb1b 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -114,7 +114,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-			  DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE, 0);
+			  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 92d552f97..6cf041ab8 100644
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
index 195e62911..0dd75ba7e 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -529,7 +529,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		fd = drm_open_driver(DRIVER_XE);
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-			  DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE, 0);
+			  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index bb979b18c..5d2f0e495 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -286,7 +286,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	if (!vm) {
 		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-				  DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE, 0);
+				  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 		owns_vm = true;
 	}
 
@@ -1005,7 +1005,7 @@ static void threads(int fd, int flags)
 					      0);
 		vm_compute_mode = xe_vm_create(fd,
 					       DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
-					       DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE,
+					       DRM_XE_VM_CREATE_FLAG_LR_MODE,
 					       0);
 	}
 
diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index 9c2a70ff3..48c370173 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -64,7 +64,7 @@ static void test_ping_pong(int fd, struct drm_xe_engine_class_instance *eci)
 	 * stats.
 	 */
 	for (i = 0; i < NUM_VMS; ++i) {
-		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE, 0);
+		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 		for (j = 0; j < NUM_BOS; ++j) {
 			igt_debug("Creating bo size %lu for vm %u\n",
 				  (unsigned long) bo_size,
-- 
2.41.0
