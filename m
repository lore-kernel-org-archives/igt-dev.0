Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D1BCD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 07:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DED10E4A1;
	Mon, 11 May 2026 07:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QGC/s9sU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D0A10E4A1
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 07:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778484348; x=1810020348;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MdCEGRv6pTTvuctm6mIEi3Wn7QB6NQRsNyokMoTUYMA=;
 b=QGC/s9sUe9yqqjAPQWAVspfCZrpOjC5vo0EMteDWf2BACuIAnUJzBZFs
 rGXGY58vYPWA4zeqkgv5VXpd8dB35XXNuZ6iht6VOXstq/Uw2CMcCcr87
 jooj/98BDC0rEZBrL904Gm49m+l9AocWQ9AZoFCoCbPe231xLDmdY3Eic
 l9Cg09ncIXl8XwjmCPNUX3Y2ozJk4WlxD0yOMVaR2VlK3Sn+xk+dEdanh
 oOsdGMP8Zgp9WL1FYMqws3KrQZYRC7z0ROri2h2EcPAd0/wQwQ3YXSUBJ
 AQxXKlq+lcKYntlRot/2c0oT/jXNpKFclEYt6WCkbxZgOmrHRcp4+/YcH w==;
X-CSE-ConnectionGUID: qroCoCRQQ422tzGQJQR2Uw==
X-CSE-MsgGUID: sZONXb06R/ikdj6AVUyKqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="66895400"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="66895400"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 00:25:48 -0700
X-CSE-ConnectionGUID: abh+lb6lTTajZ7wfFZaj1Q==
X-CSE-MsgGUID: CMtxfL6YStSQROdDBR9eqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="239202020"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa004.fm.intel.com with ESMTP; 11 May 2026 00:25:45 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: carlos.santa@intel.com, matthew.brost@intel.com,
 jeevaka.badrappan@intel.com, karthik.b.s@intel.com,
 krzysztof.karas@intel.com, kamil.konieczny@intel.com,
 zbigniew.kempczynski@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v5] tests/intel/xe_exec: Add VM rebind stress test with
 cpumask cycling
Date: Mon, 11 May 2026 12:32:23 +0530
Message-Id: <20260511070223.3938207-1-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add a new subtest threads-wq-stress-rebind-bindexecqueue that stresses
the VM rebind path under workqueue CPU pool migration pressure.

The test spawns per-engine threads that continuously perform VM unbind/
rebind cycles using per-slot bind exec queues, while a helper child
process rapidly cycles the global unbound workqueue cpumask through
progressively wider CPU sets (f -> ff -> fff -> ffff) at 100ms intervals.

A new WQ_STRESS flag enables timed fence waits in test_legacy_mode at
three syncobj_wait() checkpoints (per-exec-queue, bind-chain, and unbind/
TLB-invalidation fences) using a 5-second deadline. If any fence misses
the deadline, a shared atomic is set and all threads bail out immediately
rather than running for the full 30-second window.

All GPU work runs in a forked child that writes its result via a pipe,
the parent polls with a 60-second timeout and restores the original
cpumask regardless of outcome.

When a hang is detected the child drops the kernel page cache
and issues xe_force_gt_reset_all() to unblock any DMA fences still
pending from the stress run, then writes the hang result and calls
_exit() immediately without closing the DRM fd. Closing the fd while GPU
work is stuck would block indefinitely in dma_resv_wait_timeout(intr=false,
TASK_UNINTERRUPTIBLE). For the same reason, GPU resource teardown
(exec queues, BOs, VMs) is skipped in test_legacy_mode when a hang
is detected.

On the failure path the test is aborted, as the process (child) gets into
a D+ state (hung) and may affect other tests if marked as fail alone. So
aborting would mean forcing a reboot in testing environment.

A bug of same signature regressed in Xe driver, where the whole system
hung due to a fencing signal not completing, which was finaly
traced to an issue in the kernel workqueue scheduling.
Hard reboot was the only way to bring the system back to work.

For reference see https://patchwork.freedesktop.org/patch/715805/
("workqueue: Add pool_workqueue to pending_pwqs list when unplugging
             multiple inactive works")

v5:
- Fix cpumask stressor to signal a shared flag instead of calling exit(),
  preventing igt_stop_helper() SIGABRT on platforms where cpumask writes
  fail

v4:
- Reduce the wq_stress running time and child-timeout to keep the
  test duration less than 10sec
- Fix whitespaces
- Using macros for numericals.

v3:
- Rename title of commit
- Correct commenting style

v2:
- Abort the hung test instead of marking as fail alone
- Code Comment corrections
- Fix type casting
- Write check for cpumask

Cc: Carlos Santa <carlos.santa@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tests/intel/xe_exec_threads.c | 403 +++++++++++++++++++++++++++++++++-
 1 file changed, 396 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index f082a0eda..d84b09634 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -13,9 +13,15 @@
  */
 
 #include <fcntl.h>
+#include <inttypes.h>
+#include <poll.h>
+#include <signal.h>
+#include <stdatomic.h>
+#include <sys/wait.h>
 
 #include "igt.h"
 #include "lib/igt_syncobj.h"
+#include "lib/igt_thread.h"
 #include "lib/intel_reg.h"
 #include "xe_drm.h"
 
@@ -42,9 +48,126 @@
 #define BIND_EXEC_QUEUE	(0x1 << 13)
 #define MANY_QUEUES	(0x1 << 14)
 #define MULTI_QUEUE		(0x1 << 15)
+#define WQ_STRESS		(0x1 << 16)
+
+/*
+ * Maximum fence wait time when WQ_STRESS is active. If any bind/unbind
+ * fence takes longer than this to signal, the workqueue is considered stuck
+ * and the test fails — this is the direct symptom of the
+ * Xe hang caused by the kernel workqueue pool_workqueue pending_pwqs bug.
+ */
+#define WQ_FENCE_TIMEOUT_NS	(1LL * NSEC_PER_SEC)
+
+/* Duration of the child's VM bind/unbind stress loop in seconds. */
+#define WQ_STRESS_DURATION_SEC	5
+
+/*
+ * Maximum time the parent waits for the child to write its result byte.
+ * The child's stress loop runs for up to WQ_STRESS_DURATION_SEC seconds,
+ * plus cleanup overhead (GT reset, drop_caches, cpumask restore, sleep(1)).
+ * 8s gives ample headroom on a healthy kernel.
+ */
+#define WQ_CHILD_TIMEOUT_MS	(8 * 1000)
+
+/*
+ * Time to wait after starting the cpumask stressor before checking whether
+ * the interface is functional. One full stressor iteration writes 4 masks
+ * with 100ms sleep between each, so 400ms covers exactly one pass + 100ms.
+ */
+#define WQ_STRESSOR_WARMUP_US	(5 * 100000)
+
+/* Sysfs node that controls the unbound workqueue CPU affinity mask. */
+#define WQ_CPUMASK_PATH		"/sys/devices/virtual/workqueue/cpumask"
+
+/* Procfs node for dropping the kernel's page, dentry, and inode caches. */
+#define DROP_CACHES_PATH	"/proc/sys/vm/drop_caches"
 
 pthread_barrier_t barrier;
 
+/*
+ * Set to true by the first thread that detects a fence stall under WQ_STRESS.
+ * All other threads and the igt_until_timeout loop check this to bail out
+ * immediately rather than hammering a hung kernel for the full timeout.
+ */
+static _Atomic bool wq_stress_hang_detected;
+
+/*
+ * stress_fence_deadline - compute an absolute CLOCK_MONOTONIC deadline
+ * 5 seconds from now, used as the syncobj_wait timeout under WQ_STRESS.
+ */
+static int64_t stress_fence_deadline(void)
+{
+	struct timespec ts;
+
+	clock_gettime(CLOCK_MONOTONIC, &ts);
+	return (int64_t)ts.tv_sec * NSEC_PER_SEC + (int64_t)ts.tv_nsec +
+		WQ_FENCE_TIMEOUT_NS;
+}
+
+/*
+ * cpumask_stressor_loop
+ *
+ * Rapidly cycles the kernel unbound workqueue cpumask through progressively
+ * wider CPU sets (mirroring the original shell reproduction script). This
+ * forces workqueue work items to be migrated between CPU pools, exercising
+ * the wq_node_nr_active / pool_workqueue plug-unplug path that hides the
+ * pending_pwqs scheduling bug.
+ *
+ * The original reproduction commands were:
+ *   for i in {1..1000}; do
+ *       echo f  > /sys/devices/virtual/workqueue/cpumask
+ *       echo ff > /sys/devices/virtual/workqueue/cpumask
+ *       ...
+ *       sleep .1
+ *   done
+ *
+ * @cpumask_broken is a shared-memory atomic flag (mmap MAP_SHARED). When all
+ * writes in a single iteration fail (excluding EINVAL), the interface is
+ * considered non-functional and the flag is set so the parent can skip the
+ * test before launching GPU work. After setting the flag the helper loops
+ * in pause() — it never exits on its own so that igt_stop_helper() can
+ * always kill it cleanly with SIGKILL (the assert inside igt_stop_helper
+ * requires the helper to have been killed by signal, not exited itself).
+ */
+static void cpumask_stressor_loop(_Atomic bool *cpumask_broken)
+{
+	static const char * const masks[] = { "f", "ff", "fff", "ffff" };
+	int wq_fd;
+
+	wq_fd = open(WQ_CPUMASK_PATH, O_WRONLY);
+	if (wq_fd < 0) {
+		atomic_store(cpumask_broken, true);
+		/*
+		 * Do not return: igt_stop_helper() asserts that the helper was
+		 * killed by SIGKILL, not that it exited on its own. Spin with
+		 * pause() so we stay alive until the parent sends SIGKILL.
+		 */
+		for (;;)
+			pause();
+	}
+
+	for (;;) {
+		int fail_count = 0;
+
+		for (int i = 0; i < ARRAY_SIZE(masks); i++) {
+			if (write(wq_fd, masks[i], strlen(masks[i])) < 0 &&
+			    errno != EINVAL)
+				fail_count++;
+			usleep(100000); /* 100ms */
+		}
+
+		/* All writes in this iteration failed — interface is broken */
+		if (fail_count == ARRAY_SIZE(masks)) {
+			atomic_store(cpumask_broken, true);
+			close(wq_fd);
+			/* Same as above: stay alive for igt_stop_helper(). */
+			for (;;)
+				pause();
+		}
+	}
+	close(wq_fd);
+}
+
 static void
 test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 	      int class, int n_exec_queues, int n_execs, unsigned int flags)
@@ -600,6 +723,10 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		uint64_t exec_addr;
 		int e = i % n_exec_queues;
 
+		/* Bail early if another thread already detected a hang */
+		if ((flags & WQ_STRESS) && atomic_load(&wq_stress_hang_detected))
+			goto wq_stress_cleanup;
+
 		if (flags & MANY_QUEUES) {
 			if (exec_queues[e]) {
 				igt_assert(syncobj_wait(fd, &syncobjs[e], 1,
@@ -693,15 +820,64 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		}
 	}
 
-	for (i = 0; i < n_exec_queues; i++)
-		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
-					NULL));
-	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	for (i = 0; i < n_exec_queues; i++) {
+		if (flags & WQ_STRESS) {
+			/* Drain all exec-queue fences under a 5 sec deadline */
+			/* A timeout means the workqueue is hung so bail immediately */
+			if (atomic_load(&wq_stress_hang_detected) ||
+			    !syncobj_wait(fd, &syncobjs[i], 1,
+					  stress_fence_deadline(), 0, NULL)) {
+				igt_critical("exec-queue[%d] fence stalled "
+					 "under WQ_STRESS, workqueue "
+					 "scheduling hang suspected\n", i);
+				atomic_store(&wq_stress_hang_detected, true);
+				igt_thread_fail();
+				goto wq_stress_cleanup;
+			}
+		} else {
+			igt_assert(syncobj_wait(fd, &syncobjs[i], 1,
+						INT64_MAX, 0, NULL));
+		}
+	}
+
+	if (flags & WQ_STRESS) {
+		if (atomic_load(&wq_stress_hang_detected) ||
+		    !syncobj_wait(fd, &sync[0].handle, 1,
+				  stress_fence_deadline(), 0, NULL)) {
+			igt_critical("bind-chain fence stalled under WQ_STRESS\n");
+			atomic_store(&wq_stress_hang_detected, true);
+			igt_thread_fail();
+			goto wq_stress_cleanup;
+		}
+	} else {
+		igt_assert(syncobj_wait(fd, &sync[0].handle, 1,
+					INT64_MAX, 0, NULL));
+	}
 
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr,
 			   bo_size, sync, 1);
-	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	if (flags & WQ_STRESS) {
+		/*
+		 * This is the most critical fence under WQ_STRESS: it covers the
+		 * TLB-invalidation completion triggered by xe_vm_unbind_async().
+		 * If ttm_bo_delayed_delete() workers are stuck in the workqueue
+		 * the TLB flush fence will never signal and we will timeout here.
+		 */
+		if (atomic_load(&wq_stress_hang_detected) ||
+		    !syncobj_wait(fd, &sync[0].handle, 1,
+				  stress_fence_deadline(), 0, NULL)) {
+			igt_critical("unbind/TLB-invalidation fence stalled "
+				 "under WQ_STRESS, "
+				 "ttm_bo_delayed_delete work item likely stuck\n");
+			atomic_store(&wq_stress_hang_detected, true);
+			igt_thread_fail();
+			goto wq_stress_cleanup;
+		}
+	} else {
+		igt_assert(syncobj_wait(fd, &sync[0].handle, 1,
+					INT64_MAX, 0, NULL));
+	}
 
 	for (i = flags & INVALIDATE ? n_execs - 1 : 0;
 	     i < n_execs; i++) {
@@ -713,9 +889,21 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 			igt_assert_eq(data[i].data, 0xc0ffee);
 	}
 
+wq_stress_cleanup:
 	syncobj_destroy(fd, sync[0].handle);
 	for (i = 0; i < n_exec_queues; i++) {
 		syncobj_destroy(fd, syncobjs[i]);
+		if (flags & WQ_STRESS && atomic_load(&wq_stress_hang_detected)) {
+			/*
+			 * Under WQ_STRESS, if a hang was detected skip all GPU resource
+			 * teardown calls (xe_exec_queue_destroy, xe_vm_destroy, gem_close).
+			 * Those ioctls wait for pending GPU work to drain and will hang
+			 * indefinitely if the workqueue is stuck. The kernel reclaims all
+			 * GPU resources automatically on process exit.
+			 */
+			continue;
+		}
+
 		xe_exec_queue_destroy(fd, exec_queues[i]);
 		if (bind_exec_queues[i])
 			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
@@ -723,11 +911,14 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	if (bo) {
 		munmap(data, bo_size);
-		gem_close(fd, bo);
+		if (!(flags & WQ_STRESS) || !atomic_load(&wq_stress_hang_detected))
+			gem_close(fd, bo);
 	} else if (!(flags & INVALIDATE)) {
 		free(data);
 	}
-	if (owns_vm)
+
+	if (owns_vm &&
+	    (!(flags & WQ_STRESS) || !atomic_load(&wq_stress_hang_detected)))
 		xe_vm_destroy(fd, vm);
 	if (owns_fd)
 		drm_close_driver(fd);
@@ -1529,6 +1720,204 @@ int igt_main()
 		}
 	}
 
+	/**
+	 * SUBTEST: threads-wq-stress-rebind-bindexecqueue
+	 * Description: Concurrently hammers VM bind/unbind cycles using per-slot
+	 *              bind exec queues across all engines while a background
+	 *              process rapidly cycles the unbound workqueue cpumask,
+	 *              forcing work items to migrate between CPU pools.
+	 *
+	 *              Each bind and unbind fence is waited on with a 5-second
+	 *              deadline. The test passes if all fences signal within that
+	 *              window across repeated iterations for up to 30 seconds.
+	 *              It fails if any fence stalls beyond the deadline, indicating
+	 *              that GPU work items are no longer being scheduled.
+	 */
+	igt_subtest("threads-wq-stress-rebind-bindexecqueue") {
+		char orig_cpumask[64] = {};
+		int cfd, result_pipe[2];
+		pid_t child;
+		uint8_t result_byte;
+
+		struct igt_helper_process cpumask_proc = {};
+		_Atomic bool *cpumask_broken;
+		int child_fd;
+		bool hang;
+		uint8_t r;
+
+		/* Needs write access to workqueue cpumask sysfs node (root) */
+		igt_require(access(WQ_CPUMASK_PATH, W_OK) == 0);
+
+		/* Save current cpumask so we can restore it after the test */
+		cfd = open(WQ_CPUMASK_PATH, O_RDONLY);
+		igt_assert_neq(cfd, -1);
+		read(cfd, orig_cpumask, sizeof(orig_cpumask) - 1);
+		close(cfd);
+		orig_cpumask[strcspn(orig_cpumask, "\n")] = '\0';
+
+		/*
+		 * Shared-memory flag: the stressor child sets this if the cpumask
+		 * interface is non-functional (all writes fail in one iteration).
+		 * mmap MAP_SHARED so the flag is visible across the fork boundary.
+		 */
+		cpumask_broken = mmap(NULL, sizeof(*cpumask_broken),
+				      PROT_READ | PROT_WRITE,
+				      MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+		igt_assert(cpumask_broken != MAP_FAILED);
+		atomic_store(cpumask_broken, false);
+
+		/*
+		 * Start the cpumask stressor. It signals cpumask_broken and
+		 * returns (never calls exit) if writes become non-functional,
+		 * so igt_stop_helper() can always deliver SIGKILL cleanly.
+		 */
+		cpumask_proc.use_SIGKILL = true;
+		igt_fork_helper(&cpumask_proc)
+			cpumask_stressor_loop(cpumask_broken);
+
+		/*
+		 * Wait one full stressor iteration (4 masks × 100ms = 400ms)
+		 * before checking the flag. If all writes failed in that first
+		 * pass the cpumask interface is broken on this platform and
+		 * there is no point launching GPU work — the test would be
+		 * silently meaningless without active cpumask cycling.
+		 */
+		usleep(WQ_STRESSOR_WARMUP_US);
+		if (atomic_load(cpumask_broken)) {
+			igt_stop_helper(&cpumask_proc);
+			cfd = open(WQ_CPUMASK_PATH, O_WRONLY);
+			if (cfd >= 0) {
+				write(cfd, orig_cpumask, strlen(orig_cpumask));
+				close(cfd);
+			}
+			munmap(cpumask_broken, sizeof(*cpumask_broken));
+			igt_skip("cpumask writes not functional on this platform"
+				 " - skipping WQ stress test\n");
+		}
+
+		/* IPC channel: child writes a 1-byte result; parent reads via poll() */
+		igt_assert_eq(pipe(result_pipe), 0);
+
+		/*
+		 * All GPU work is submitted through child_fd (opened inside the
+		 * child). The fixture fd held by the parent has no pending GPU
+		 * work, so drm_close_driver(fd) in the end fixture will never
+		 * block — even if the child's _exit() gets stuck in
+		 * dma_resv_wait_timeout() (intr=false, TASK_UNINTERRUPTIBLE).
+		 */
+		child = fork();
+		igt_assert_neq(child, -1);
+
+		if (child == 0) {
+			/* ---- child: owns all GPU resources ---- */
+			close(result_pipe[0]);
+
+			child_fd = drm_open_driver(DRIVER_XE);
+
+			atomic_store(&wq_stress_hang_detected, false);
+			igt_until_timeout(WQ_STRESS_DURATION_SEC) {
+				threads(child_fd,
+					REBIND | BIND_EXEC_QUEUE | WQ_STRESS);
+				if (atomic_load(&wq_stress_hang_detected))
+					break;
+			}
+
+			/* Restore cpumask from child */
+			cfd = open(WQ_CPUMASK_PATH, O_WRONLY);
+			if (cfd >= 0) {
+				write(cfd, orig_cpumask, strlen(orig_cpumask));
+				close(cfd);
+			}
+
+			hang = atomic_load(&wq_stress_hang_detected);
+			if (hang) {
+				int dc_fd;
+
+				igt_critical("WorkQueue hang detected; dropping "
+					     "VM page cache and forcing GT "
+					     "reset\n");
+
+				dc_fd = open(DROP_CACHES_PATH,
+					     O_WRONLY);
+				if (dc_fd >= 0) {
+					write(dc_fd, "3", 1);
+					close(dc_fd);
+				}
+
+				xe_force_gt_reset_all(child_fd);
+				sleep(1);
+			}
+
+			/*
+			 * Write result BEFORE _exit().  When hang == true the
+			 * subsequent _exit() triggers do_exit() -> exit_files()
+			 * -> fput(child_fd) -> dma_resv_wait_timeout(intr=false)
+			 * and blocks in TASK_UNINTERRUPTIBLE.  The parent already
+			 * has the answer at this point and does not need to wait
+			 * for the child to actually exit.
+			 */
+			r = hang ? 1 : 0;
+			write(result_pipe[1], &r, 1);
+			close(result_pipe[1]);
+
+			if (!hang)
+				drm_close_driver(child_fd);
+			_exit(hang ? IGT_EXIT_FAILURE : IGT_EXIT_SUCCESS);
+		}
+
+		/* ---- parent ---- */
+		close(result_pipe[1]);
+
+		/*
+		 * Wait up to 8s for the child to write its result byte.
+		 * The child's stress loop runs for up to 5s, plus cleanup
+		 * (GT reset, drop_caches, cpumask restore) — 8s total gives
+		 * enough headroom on a healthy kernel while still catching a
+		 * child that has silently deadlocked before ever writing.
+		 *
+		 * poll() timeout -> treat as hang (result_byte = 0xFF).
+		 * read() returning 0 (EOF, no byte written) -> same.
+		 */
+		{
+			struct pollfd pfd = {
+				.fd     = result_pipe[0],
+				.events = POLLIN,
+			};
+			int poll_ret = poll(&pfd, 1, WQ_CHILD_TIMEOUT_MS);
+
+			if (poll_ret <= 0) {
+				/* timeout (0) or poll error (-1) */
+				igt_warn("Timed out waiting for child result "
+					 "after %dms - treating as hang\n",
+					 WQ_CHILD_TIMEOUT_MS);
+				result_byte = 0xFF;
+			} else if (read(result_pipe[0], &result_byte, 1) != 1) {
+				result_byte = 0xFF; /* EOF: child crashed before writing */
+			}
+		}
+		close(result_pipe[0]);
+
+		/* Restore cpumask from parent too. */
+		igt_stop_helper(&cpumask_proc);
+		cfd = open(WQ_CPUMASK_PATH, O_WRONLY);
+		if (cfd >= 0) {
+			write(cfd, orig_cpumask, strlen(orig_cpumask));
+			close(cfd);
+		}
+
+		/* Abort if hang detected, as moving forward without doing
+		 * so could lead to undefined behavior and further issues in
+		 * other tests
+		 */
+		igt_assert_f(result_byte == 0,
+			     "WQ stress worker detected fence stall "
+			     "- workqueue scheduling hang confirmed\n");
+
+		/* Clean path: no hang, reap child normally and continue */
+		munmap(cpumask_broken, sizeof(*cpumask_broken));
+		waitpid(child, NULL, 0);
+	}
+
 	igt_fixture()
 		drm_close_driver(fd);
 }
-- 
2.43.0

