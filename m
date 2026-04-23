Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27165F589DB
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 14:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B167710F156;
	Thu, 23 Apr 2026 14:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WqOcYZpC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB20C10F156
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 14:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776953801; x=1808489801;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jkHlZh0BGvI5UO38TdGGQFfXkMCCUIETuYg19AbReUw=;
 b=WqOcYZpC7bxnMvKb0kmdveg7ECx1hLpzB+DeoDW6tRtXEXtUOHBst4xZ
 2vFkNYdbOyOeH5zVSLXHG6sTniTXX0qXoAJScpMviQOlWa5/Oaf2aPKBq
 LRcZn5aEedv4ftIFXIUqxoYs3bUauegU4RJfNP3ocbUYMJdDy+PVio8g2
 sABmgJHjbxnJI65oZbhoikoa6/KLyeiYzEt6WvK9QagM07EzuKssUHOZF
 uUAqE9AVgoMax/HUorydj1R9XSzNFAFf5M0YX9JT+Zax5R/wrn9tbbPNi
 ZfL0Tg8RbbKVQuMWLMADrkyNADwGbxpG5y1hHhTMqx6XSKcABkZNtGiX2 Q==;
X-CSE-ConnectionGUID: PTft6KAmRU6JrYaKeUFSkg==
X-CSE-MsgGUID: dJAisWxNTOC5e5OS+DbgVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="88533603"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="88533603"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 07:16:41 -0700
X-CSE-ConnectionGUID: LdKaORd+SB2P19kqC6VUkQ==
X-CSE-MsgGUID: U/k5mOnbSv2T9cWatOW8lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="228101988"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 07:16:39 -0700
Date: Thu, 23 Apr 2026 16:16:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, carlos.santa@intel.com,
 matthew.brost@intel.com, jeevaka.badrappan@intel.com,
 karthik.b.s@intel.com, krzysztof.karas@intel.com,
 kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH i-g-t v2] tests/xe_exec: Add VM rebind stress test under
 workqueue cpumask cycling
Message-ID: <20260423141623.rgyvhqey4yc75prj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, igt-dev@lists.freedesktop.org,
 carlos.santa@intel.com, matthew.brost@intel.com,
 jeevaka.badrappan@intel.com, karthik.b.s@intel.com,
 krzysztof.karas@intel.com, kamil.konieczny@intel.com,
 zbigniew.kempczynski@intel.com
References: <20260423005118.2033963-1-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260423005118.2033963-1-s.sebinraj@intel.com>
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
On 2026-04-23 at 06:21:18 +0530, S Sebinraj wrote:

I have few nits, first about subject, it is now:

[PATCH i-g-t v2] tests/xe_exec: Add VM rebind stress test under workqueue cpumask cycling

imho better:

[PATCH i-g-t v2] tests/intel/xe_exec: Add VM rebind stress test with cpumask cycling

More nits below.

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
> 
> v2:
> - Abort the hung test instead of marking as fail alone
> - Code Comment corrections
> - Fix type casting
> - Write check for cpumask
> 
> Cc: Santa Carlos <carlos.santa@intel.com>
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  tests/intel/xe_exec_threads.c | 333 +++++++++++++++++++++++++++++++++-
>  1 file changed, 326 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index f082a0eda..abd57e94b 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -13,6 +13,11 @@
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
> @@ -23,6 +28,7 @@
>  #include "xe/xe_query.h"
>  #include "xe/xe_gt.h"
>  #include "xe/xe_spin.h"
> +#include "lib/igt_thread.h"

Move it above, it should be after "lib/igt_syncobj.h"

>  #include <string.h>
>  
>  #define MAX_N_EXEC_QUEUES	16
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

30 seconds is a lot, so this should not be in BAT testing.

Regards,
Kamil

> +
> +/* sysfs node that controls the unbound workqueue CPU affinity mask */
> +#define WQ_CPUMASK_PATH		"/sys/devices/virtual/workqueue/cpumask"
> +
> +/* procfs node for dropping the kernel's page, dentry, and inode caches */
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
> +
[cut]
