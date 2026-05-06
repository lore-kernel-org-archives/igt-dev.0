Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7C2CD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 10:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D514410E54A;
	Wed,  6 May 2026 10:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ji39xke6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA1F10ED52
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 10:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778063078; x=1809599078;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/3JWh20T0XasxElw71Z204Odd7+fEXN52KfoPk78TA0=;
 b=Ji39xke6tdyOuG3oQVOoOkof8evFF4PreyhlBJn48XnVdoO7avaYjWEM
 vMSF+BDLVtHoxs+Zd4E/QBfMvbUfEXYCOF/KqfaaFgaFNBMi6K7FuzxLJ
 rgLXwp0FNHhMZpjaLEhyFUNbo4O8UzRlIsHillVGnqnTW6E//SEtf9F3e
 kJbR7QgMF3YiBoJlbLMVKDWsRqrHMiSne5hoDrlaW0Y+ayUtrZ0YYgldT
 jf2kbgaWXJUESEdLb+0yUvaVjaZH1oV+MSv7KG81+rQlVDgNvS+ed6Y7M
 tSWY51hHHHSzKbjPuwbV7rAKCh/CScgYtMMrd4ZAEx4F4tex0a+Gt/cZv Q==;
X-CSE-ConnectionGUID: uZ5XJPhMSjuqFrRdKBxXIA==
X-CSE-MsgGUID: zMSG7kM2QK6jZeX/ap8UOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="82832967"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="82832967"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 03:24:37 -0700
X-CSE-ConnectionGUID: pc4vSxOYTSyzn6ND0MBlcQ==
X-CSE-MsgGUID: l0t5RPAlS5ajMVvkR+zJYg==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 03:24:35 -0700
Date: Wed, 6 May 2026 12:24:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, carlos.santa@intel.com,
 matthew.brost@intel.com, jeevaka.badrappan@intel.com,
 karthik.b.s@intel.com, krzysztof.karas@intel.com,
 kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_exec: Add VM rebind stress test
 with cpumask cycling
Message-ID: <20260506102414.7t4drh2ucvuz2x23@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, igt-dev@lists.freedesktop.org,
 carlos.santa@intel.com, matthew.brost@intel.com,
 jeevaka.badrappan@intel.com, karthik.b.s@intel.com,
 krzysztof.karas@intel.com, kamil.konieczny@intel.com,
 zbigniew.kempczynski@intel.com
References: <20260424042457.2178562-1-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260424042457.2178562-1-s.sebinraj@intel.com>
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

Hi,
On 2026-04-24 at 09:54:57 +0530, S Sebinraj wrote:
> Add a new subtest threads-wq-stress-rebind-bindexecqueue that stresses
> the VM rebind path under workqueue CPU pool migration pressure.
> 
> The test spawns per-engine threads that continuously perform VM unbind/
> rebind cycles using per-slot bind exec queues, while a helper child
> process rapidly cycles the global unbound workqueue cpumask through
> progressively wider CPU sets (f -> ff -> fff -> ffff) at 100ms intervals.
> 
> A new WQ_STRESS flag enables timed fence waits in test_legacy_mode at
> three syncobj_wait() checkpoints (per-exec-queue, bind-chain, and unbind/
> TLB-invalidation fences) using a 5-second deadline. If any fence misses
> the deadline, a shared atomic is set and all threads bail out immediately
> rather than running for the full 30-second window.
> 
> All GPU work runs in a forked child that writes its result via a pipe,
> the parent polls with a 60-second timeout and restores the original
> cpumask regardless of outcome.
> 
> When a hang is detected the child drops the kernel page cache
> and issues xe_force_gt_reset_all() to unblock any DMA fences still
> pending from the stress run, then writes the hang result and calls
> _exit() immediately without closing the DRM fd. Closing the fd while GPU
> work is stuck would block indefinitely in dma_resv_wait_timeout(intr=false,
> TASK_UNINTERRUPTIBLE). For the same reason, GPU resource teardown
> (exec queues, BOs, VMs) is skipped in test_legacy_mode when a hang
> is detected.
> 
> On the failure path the test is aborted, as the process (child) gets into
> a D+ state (hung) and may affect other tests if marked as fail alone. So
> aborting would mean forcing a reboot in testing environment.
> 
> A bug of same signature regressed in Xe driver, where the whole system
> hung due to a fencing signal not completing, which was finaly
> traced to an issue in the kernel workqueue scheduling.
> Hard reboot was the only way to bring the system back to work.
> https://patchwork.freedesktop.org/patch/715805/

Add a description to this link, for example write:

For reference see https://patchwork.freedesktop.org/patch/715805/
("workqueue: Add pool_workqueue to pending_pwqs list when unplugging multiple inactive works")

> 
> v2:
> - Abort the hung test instead of marking as fail alone
> - Code Comment corrections
> - Fix type casting
> - Write check for cpumask
> 
> v3:
> - Rename title of commit
> - Correct commenting style
> 
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> Cc: Santa Carlos <carlos.santa@intel.com>
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  tests/intel/xe_exec_threads.c | 334 +++++++++++++++++++++++++++++++++-
>  1 file changed, 327 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index f082a0eda..7197f4345 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -13,9 +13,15 @@
>   */
>  
>  #include <fcntl.h>
> +#include <inttypes.h>
> +#include <poll.h>
> +#include <signal.h>
> +#include <stdatomic.h>
> +#include <sys/wait.h>
>  
>  #include "igt.h"
>  #include "lib/igt_syncobj.h"
> +#include "lib/igt_thread.h"
>  #include "lib/intel_reg.h"
>  #include "xe_drm.h"
>  
> @@ -42,9 +48,89 @@
>  #define BIND_EXEC_QUEUE	(0x1 << 13)
>  #define MANY_QUEUES	(0x1 << 14)
>  #define MULTI_QUEUE		(0x1 << 15)
> +#define WQ_STRESS		(0x1 << 16)
> +
> +/*
> + * Maximum fence wait time when WQ_STRESS is active. If any bind/unbind
> + * fence takes longer than this to signal, the workqueue is considered stuck
> + * and the test fails — this is the direct symptom of the
> + * Xe hang caused by the kernel workqueue pool_workqueue pending_pwqs bug.
> + */
> +#define WQ_FENCE_TIMEOUT_NS	(5LL * NSEC_PER_SEC)
> +
> +/*
> + * Maximum time the parent waits for the child to write its result byte.
> + * The child's stress loop runs for up to 30s (igt_until_timeout(30)), plus
> + * cleanup overhead (GT reset, drop_caches, cpumask restore, sleep(1)).
> + * 60s gives ample headroom on a healthy kernel.
> + */
> +#define WQ_CHILD_TIMEOUT_MS	(60 * 1000)
> +
> +/* Sysfs node that controls the unbound workqueue CPU affinity mask. */
> +#define WQ_CPUMASK_PATH		"/sys/devices/virtual/workqueue/cpumask"
> +
> +/* Procfs node for dropping the kernel's page, dentry, and inode caches. */
> +#define DROP_CACHES_PATH	"/proc/sys/vm/drop_caches"
>  
>  pthread_barrier_t barrier;
>  
> +/*
> + * Set to true by the first thread that detects a fence stall under WQ_STRESS.
> + * All other threads and the igt_until_timeout loop check this to bail out
> + * immediately rather than hammering a hung kernel for the full timeout.
> + */
> +static _Atomic bool wq_stress_hang_detected;

Small nit: isn't 'volatile' enough?

> +
> +/*
> + * stress_fence_deadline - compute an absolute CLOCK_MONOTONIC deadline
> + * 5 seconds from now, used as the syncobj_wait timeout under WQ_STRESS.
> + */
> +static int64_t stress_fence_deadline(void)
> +{
> +	struct timespec ts;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &ts);
> +	return (int64_t)ts.tv_sec * NSEC_PER_SEC + (int64_t)ts.tv_nsec +
> +		WQ_FENCE_TIMEOUT_NS;
> +}
> +
> +/*
> + * cpumask_stressor_loop
> + *
> + * Rapidly cycles the kernel unbound workqueue cpumask through progressively
> + * wider CPU sets (mirroring the original shell reproduction script). This
> + * forces workqueue work items to be migrated between CPU pools, exercising
> + * the wq_node_nr_active / pool_workqueue plug-unplug path that hides the
> + * pending_pwqs scheduling bug.
> + *
> + * The original reproduction commands were:
> + *   for i in {1..1000}; do
> + *       echo f  > /sys/devices/virtual/workqueue/cpumask
> + *       echo ff > /sys/devices/virtual/workqueue/cpumask
> + *       ...
> + *       sleep .1
> + *   done
> + */
> +static void cpumask_stressor_loop(void)
> +{
> +	static const char * const masks[] = { "f", "ff", "fff", "ffff" };
> +	int wq_fd;
> +
> +	wq_fd = open(WQ_CPUMASK_PATH, O_WRONLY);
> +	if (wq_fd < 0)
> +		exit(IGT_EXIT_FAILURE);
> +
> +	for (;;) {
> +		for (int i = 0; i < ARRAY_SIZE(masks); i++) {
> +			if (write(wq_fd, masks[i], strlen(masks[i])) < 0 &&
> +			    errno != EINVAL)
> +				exit(IGT_EXIT_FAILURE); /* unexpected error - fail the test */
> +			usleep(100000); /* 100ms */
> +		}
> +	}
> +	close(wq_fd);
> +}
> +
>  static void
>  test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
>  	      int class, int n_exec_queues, int n_execs, unsigned int flags)
> @@ -600,6 +686,10 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  		uint64_t exec_addr;
>  		int e = i % n_exec_queues;
>  
> +		/* Bail early if another thread already detected a hang */
> +		if ((flags & WQ_STRESS) && atomic_load(&wq_stress_hang_detected))
> +			goto wq_stress_cleanup;
> +
>  		if (flags & MANY_QUEUES) {
>  			if (exec_queues[e]) {
>  				igt_assert(syncobj_wait(fd, &syncobjs[e], 1,
> @@ -693,15 +783,65 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  		}
>  	}
>  
> -	for (i = 0; i < n_exec_queues; i++)
> -		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> -					NULL));
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +

Remove this empty line, there is already one above.

> +	for (i = 0; i < n_exec_queues; i++) {
> +		if (flags & WQ_STRESS) {
> +			/* Drain all exec-queue fences under a 5 sec deadline */
> +			/* A timeout means the workqueue is hung so bail immediately */
> +			if (atomic_load(&wq_stress_hang_detected) ||
> +			    !syncobj_wait(fd, &syncobjs[i], 1,
> +					  stress_fence_deadline(), 0, NULL)) {
> +				igt_critical("exec-queue[%d] fence stalled "
> +					 "under WQ_STRESS, workqueue "
> +					 "scheduling hang suspected\n", i);
> +				atomic_store(&wq_stress_hang_detected, true);
> +				igt_thread_fail();
> +				goto wq_stress_cleanup;
> +			}
> +		} else {
> +			igt_assert(syncobj_wait(fd, &syncobjs[i], 1,
> +						INT64_MAX, 0, NULL));
> +		}
> +	}
> +
> +	if (flags & WQ_STRESS) {
> +		if (atomic_load(&wq_stress_hang_detected) ||
> +		    !syncobj_wait(fd, &sync[0].handle, 1,
> +				  stress_fence_deadline(), 0, NULL)) {
> +			igt_critical("bind-chain fence stalled under WQ_STRESS\n");
> +			atomic_store(&wq_stress_hang_detected, true);
> +			igt_thread_fail();
> +			goto wq_stress_cleanup;
> +		}
> +	} else {
> +		igt_assert(syncobj_wait(fd, &sync[0].handle, 1,
> +					INT64_MAX, 0, NULL));
> +	}
>  
>  	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>  	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr,
>  			   bo_size, sync, 1);
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	if (flags & WQ_STRESS) {
> +		/*
> +		 * This is the most critical fence under WQ_STRESS: it covers the
> +		 * TLB-invalidation completion triggered by xe_vm_unbind_async().
> +		 * If ttm_bo_delayed_delete() workers are stuck in the workqueue
> +		 * the TLB flush fence will never signal and we will timeout here.
> +		 */
> +		if (atomic_load(&wq_stress_hang_detected) ||
> +		    !syncobj_wait(fd, &sync[0].handle, 1,
> +				  stress_fence_deadline(), 0, NULL)) {
> +			igt_critical("unbind/TLB-invalidation fence stalled "
> +				 "under WQ_STRESS, "
> +				 "ttm_bo_delayed_delete work item likely stuck\n");
> +			atomic_store(&wq_stress_hang_detected, true);
> +			igt_thread_fail();
> +			goto wq_stress_cleanup;
> +		}
> +	} else {
> +		igt_assert(syncobj_wait(fd, &sync[0].handle, 1,
> +					INT64_MAX, 0, NULL));
> +	}
>  
>  	for (i = flags & INVALIDATE ? n_execs - 1 : 0;
>  	     i < n_execs; i++) {
> @@ -713,9 +853,21 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  			igt_assert_eq(data[i].data, 0xc0ffee);
>  	}
>  
> +wq_stress_cleanup:
>  	syncobj_destroy(fd, sync[0].handle);
>  	for (i = 0; i < n_exec_queues; i++) {
>  		syncobj_destroy(fd, syncobjs[i]);
> +		if (flags & WQ_STRESS && atomic_load(&wq_stress_hang_detected)) {
> +			/*
> +			 * Under WQ_STRESS, if a hang was detected skip all GPU resource
> +			 * teardown calls (xe_exec_queue_destroy, xe_vm_destroy, gem_close).
> +			 * Those ioctls wait for pending GPU work to drain and will hang
> +			 * indefinitely if the workqueue is stuck. The kernel reclaims all
> +			 * GPU resources automatically on process exit.
> +			 */
> +			continue;
> +		}
> +
>  		xe_exec_queue_destroy(fd, exec_queues[i]);
>  		if (bind_exec_queues[i])
>  			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> @@ -723,11 +875,14 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  
>  	if (bo) {
>  		munmap(data, bo_size);
> -		gem_close(fd, bo);
> +		if (!(flags & WQ_STRESS) || !atomic_load(&wq_stress_hang_detected))
> +			gem_close(fd, bo);
>  	} else if (!(flags & INVALIDATE)) {
>  		free(data);
>  	}
> -	if (owns_vm)
> +
> +	if (owns_vm &&
> +	    (!(flags & WQ_STRESS) || !atomic_load(&wq_stress_hang_detected)))
>  		xe_vm_destroy(fd, vm);
>  	if (owns_fd)
>  		drm_close_driver(fd);
> @@ -1529,6 +1684,171 @@ int igt_main()
>  		}
>  	}
>  
> +	/**
> +	 * SUBTEST: threads-wq-stress-rebind-bindexecqueue
> +	 * Description: Concurrently hammers VM bind/unbind cycles using per-slot
> +	 *              bind exec queues across all engines while a background
> +	 *              process rapidly cycles the unbound workqueue cpumask,
> +	 *              forcing work items to migrate between CPU pools.
> +	 *
> +	 *              Each bind and unbind fence is waited on with a 5-second
> +	 *              deadline. The test passes if all fences signal within that
> +	 *              window across repeated iterations for up to 30 seconds.
> +	 *              It fails if any fence stalls beyond the deadline, indicating
> +	 *              that GPU work items are no longer being scheduled.
> +	 */
> +	igt_subtest("threads-wq-stress-rebind-bindexecqueue") {
> +		char orig_cpumask[64] = {};
> +		int cfd, result_pipe[2];
> +		pid_t child;
> +		uint8_t result_byte;
> +
> +		struct igt_helper_process cpumask_proc = {};
> +		int child_fd;
> +		bool hang;
> +		uint8_t r;
> +
> +		/* Needs write access to workqueue cpumask sysfs node (root) */
> +		igt_require(access(WQ_CPUMASK_PATH, W_OK) == 0);
> +
> +		/* Save current cpumask so we can restore it after the test */
> +		cfd = open(WQ_CPUMASK_PATH, O_RDONLY);
> +		igt_assert_neq(cfd, -1);
> +		read(cfd, orig_cpumask, sizeof(orig_cpumask) - 1);
> +		close(cfd);
> +		orig_cpumask[strcspn(orig_cpumask, "\n")] = '\0';
> +
> +		/*
> +		 * Start the cpumask stressor in the parent so that any unexpected
> +		 * write failure propagates through igt_stop_helper() and fails
> +		 * the test - running GPU stress without active cpumask cycling
> +		 * would make this test meaningless.
> +		 */
> +		cpumask_proc.use_SIGKILL = true;
> +		igt_fork_helper(&cpumask_proc)
> +			cpumask_stressor_loop();
> +
> +		/* IPC channel: child writes a 1-byte result; parent reads via poll() */
> +		igt_assert_eq(pipe(result_pipe), 0);
> +
> +		/*
> +		 * All GPU work is submitted through child_fd (opened inside the
> +		 * child). The fixture fd held by the parent has no pending GPU
> +		 * work, so drm_close_driver(fd) in the end fixture will never
> +		 * block — even if the child's _exit() gets stuck in
> +		 * dma_resv_wait_timeout() (intr=false, TASK_UNINTERRUPTIBLE).
> +		 */
> +		child = fork();
> +		igt_assert_neq(child, -1);
> +
> +		if (child == 0) {
> +			/* ---- child: owns all GPU resources ---- */
> +			close(result_pipe[0]);
> +
> +			child_fd = drm_open_driver(DRIVER_XE);
> +
> +			atomic_store(&wq_stress_hang_detected, false);
> +			igt_until_timeout(30) {
> +				threads(child_fd,
> +					REBIND | BIND_EXEC_QUEUE | WQ_STRESS);
> +				if (atomic_load(&wq_stress_hang_detected))
> +					break;
> +			}
> +
> +			/* Restore cpumask from child */
> +			cfd = open(WQ_CPUMASK_PATH, O_WRONLY);
> +			if (cfd >= 0) {
> +				write(cfd, orig_cpumask, strlen(orig_cpumask));
> +				close(cfd);
> +			}
> +
> +			hang = atomic_load(&wq_stress_hang_detected);
> +			if (hang) {
> +				int dc_fd;
> +
> +				igt_critical("WorkQueue hang detected; dropping "
> +					     "VM page cache and forcing GT "
> +					     "reset\n");
> +
> +				dc_fd = open(DROP_CACHES_PATH,
> +					     O_WRONLY);
> +				if (dc_fd >= 0) {
> +					write(dc_fd, "3", 1);
> +					close(dc_fd);
> +				}
> +
> +				xe_force_gt_reset_all(child_fd);
> +				sleep(1);
> +			}
> +
> +			/*
> +			 * Write result BEFORE _exit().  When hang == true the
> +			 * subsequent _exit() triggers do_exit() -> exit_files()
> +			 * -> fput(child_fd) -> dma_resv_wait_timeout(intr=false)
> +			 * and blocks in TASK_UNINTERRUPTIBLE.  The parent already
> +			 * has the answer at this point and does not need to wait
> +			 * for the child to actually exit.
> +			 */
> +			r = hang ? 1 : 0;
> +			write(result_pipe[1], &r, 1);
> +			close(result_pipe[1]);
> +
> +			if (!hang)
> +				drm_close_driver(child_fd);
> +			_exit(hang ? IGT_EXIT_FAILURE : IGT_EXIT_SUCCESS);
> +		}
> +
> +		/* ---- parent ---- */
> +		close(result_pipe[1]);
> +
> +		/*
> +		 * Wait up to 60s for the child to write its result byte.
> +		 * The child's stress loop runs for up to 30s, plus cleanup

Imho 30 or 60 seconds for running a test is quite a lot, would 10
or 5 be enough? Your test could end up being blocked due to this.

> +		 * (GT reset, drop_caches, cpumask restore) — 60s total gives
> +		 * enough headroom on a healthy kernel while still catching a
> +		 * child that has silently deadlocked before ever writing.
> +		 *
> +		 * poll() timeout -> treat as hang (result_byte = 0xFF).
> +		 * read() returning 0 (EOF, no byte written) -> same.
> +		 */
> +		{
> +			struct pollfd pfd = {
> +				.fd     = result_pipe[0],
> +				.events = POLLIN,
> +			};
> +			int poll_ret = poll(&pfd, 1, WQ_CHILD_TIMEOUT_MS);
> +
> +			if (poll_ret <= 0) {
> +				/* timeout (0) or poll error (-1) */
> +				igt_warn("Timed out waiting for child result "
> +					 "after 60s - treating as hang\n");

Print this number as %d and use constant WQ_CHILD_TIMEOUT_MS for it.

> +				result_byte = 0xFF;
> +			} else if (read(result_pipe[0], &result_byte, 1) != 1) {
> +				result_byte = 0xFF; /* EOF: child crashed before writing */
> +			}
> +		}
> +		close(result_pipe[0]);
> +
> +		/* Restore cpumask from parent too. */
> +		igt_stop_helper(&cpumask_proc);
> +		cfd = open(WQ_CPUMASK_PATH, O_WRONLY);
> +		if (cfd >= 0) {
> +			write(cfd, orig_cpumask, strlen(orig_cpumask));
> +			close(cfd);
> +		}
> +
> +		/* Abort if hang detected, as moving forward without doing 

Remove trailing whitespace s/doing /doing/

> +		 * so could lead to undefined behavior and further issues in 

Same here, remove space at end.

Regards,
Kamil

> +		 * other tests
> +		 */
> +		igt_assert_f(result_byte == 0,
> +			     "WQ stress worker detected fence stall "
> +			     "- workqueue scheduling hang confirmed\n");
> +
> +		/* Clean path: no hang, reap child normally and continue */
> +		waitpid(child, NULL, 0);
> +	}
> +
>  	igt_fixture()
>  		drm_close_driver(fd);
>  }
> -- 
> 2.43.0
> 
