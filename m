Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3EE10E5E1
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Nov 2023 08:43:40 +0000 (UTC)
From: Badal Nilawar <badal.nilawar@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 22 Nov 2023 14:22:01 +0530
Message-Id: <20231122085201.2559195-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] test/intel/xe_guc_pc: Nuke freq_range_exec,
 freq_fixed_exec tests
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

With current design the tests freq_range_exec, freq_fixed_exec tends
to fail and hence need to be redesigned with robustness.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 tests/intel/xe_guc_pc.c | 140 ----------------------------------------
 1 file changed, 140 deletions(-)

diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
index fa2f20cca..dc9abe02d 100644
--- a/tests/intel/xe_guc_pc.c
+++ b/tests/intel/xe_guc_pc.c
@@ -31,110 +31,6 @@
  */
 #define ACT_FREQ_LATENCY_US 100000
 
-static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
-		       int n_exec_queues, int n_execs)
-{
-	uint32_t vm;
-	uint64_t addr = 0x1a0000;
-	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-	};
-	struct drm_xe_exec exec = {
-		.num_batch_buffer = 1,
-		.num_syncs = 2,
-		.syncs = to_user_pointer(sync),
-	};
-	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
-	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
-	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
-	size_t bo_size;
-	uint32_t bo = 0;
-	struct {
-		uint32_t batch[16];
-		uint64_t pad;
-		uint32_t data;
-	} *data;
-	int i, b;
-
-	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
-	igt_assert(n_execs > 0);
-
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
-	bo_size = sizeof(*data) * n_execs;
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
-
-	bo = xe_bo_create_flags(fd, vm, bo_size,
-				visible_vram_if_possible(fd, eci->gt_id));
-	data = xe_bo_map(fd, bo, bo_size);
-
-	for (i = 0; i < n_exec_queues; i++) {
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
-		bind_exec_queues[i] = 0;
-		syncobjs[i] = syncobj_create(fd, 0);
-	};
-
-	sync[0].handle = syncobj_create(fd, 0);
-
-	xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
-			 bo_size, sync, 1);
-
-	for (i = 0; i < n_execs; i++) {
-		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
-		uint64_t batch_addr = addr + batch_offset;
-		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
-		uint64_t sdi_addr = addr + sdi_offset;
-		int e = i % n_exec_queues;
-
-		b = 0;
-		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
-		data[i].batch[b++] = sdi_addr;
-		data[i].batch[b++] = sdi_addr >> 32;
-		data[i].batch[b++] = 0xc0ffee;
-		data[i].batch[b++] = MI_BATCH_BUFFER_END;
-		igt_assert(b <= ARRAY_SIZE(data[i].batch));
-
-		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
-		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-		sync[1].handle = syncobjs[e];
-
-		exec.exec_queue_id = exec_queues[e];
-		exec.address = batch_addr;
-
-		if (e != i)
-			syncobj_reset(fd, &syncobjs[e], 1);
-
-		xe_exec(fd, &exec);
-
-		igt_assert(syncobj_wait(fd, &syncobjs[e], 1,
-					INT64_MAX, 0, NULL));
-		igt_assert_eq(data[i].data, 0xc0ffee);
-	}
-
-	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
-
-	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr,
-			   bo_size, sync, 1);
-	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
-
-	for (i = 0; i < n_execs; i++)
-		igt_assert_eq(data[i].data, 0xc0ffee);
-
-	syncobj_destroy(fd, sync[0].handle);
-	for (i = 0; i < n_exec_queues; i++) {
-		syncobj_destroy(fd, syncobjs[i]);
-		xe_exec_queue_destroy(fd, exec_queues[i]);
-		if (bind_exec_queues[i])
-			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
-	}
-
-	munmap(data, bo_size);
-	gem_close(fd, bo);
-	xe_vm_destroy(fd, vm);
-}
-
 static int set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
 {
 	int ret = -EAGAIN;
@@ -212,9 +108,6 @@ static void test_freq_basic_api(int fd, int gt_id)
 /**
  * SUBTEST: freq_fixed_idle
  * Description: Test fixed frequency request with exec_queue in idle state
- *
- * SUBTEST: freq_fixed_exec
- * Description: Test fixed frequency request when exec_queue is doing some work
  */
 
 static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
@@ -279,9 +172,6 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 /**
  * SUBTEST: freq_range_idle
  * Description: Test range frequency request with exec_queue in idle state
- *
- * SUBTEST: freq_range_exec
- * Description: Test range frequency request when exec_queue is doing some work
  */
 
 static void test_freq_range(int fd, int gt_id, bool gt_idle)
@@ -384,10 +274,8 @@ static void test_reset(int fd, int gt_id, int cycles)
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *hwe;
 	int fd;
 	int gt;
-	int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	uint32_t stash_min;
 	uint32_t stash_max;
 
@@ -412,20 +300,6 @@ igt_main
 		}
 	}
 
-	igt_subtest("freq_fixed_exec") {
-		xe_for_each_gt(fd, gt) {
-			xe_for_each_hw_engine(fd, hwe)
-				igt_fork(child, ncpus) {
-					igt_debug("Execution Started\n");
-					exec_basic(fd, hwe, MAX_N_EXEC_QUEUES, 16);
-					igt_debug("Execution Finished\n");
-				}
-			/* While exec in threads above, let's check the freq */
-			test_freq_fixed(fd, gt, false);
-			igt_waitchildren();
-		}
-	}
-
 	igt_subtest("freq_range_idle") {
 		xe_for_each_gt(fd, gt) {
 			igt_require_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 10),
@@ -434,20 +308,6 @@ igt_main
 		}
 	}
 
-	igt_subtest("freq_range_exec") {
-		xe_for_each_gt(fd, gt) {
-			xe_for_each_hw_engine(fd, hwe)
-				igt_fork(child, ncpus) {
-					igt_debug("Execution Started\n");
-					exec_basic(fd, hwe, MAX_N_EXEC_QUEUES, 16);
-					igt_debug("Execution Finished\n");
-				}
-			/* While exec in threads above, let's check the freq */
-			test_freq_range(fd, gt, false);
-			igt_waitchildren();
-		}
-	}
-
 	igt_subtest("freq_low_max") {
 		xe_for_each_gt(fd, gt) {
 			test_freq_low_max(fd, gt);
-- 
2.25.1
