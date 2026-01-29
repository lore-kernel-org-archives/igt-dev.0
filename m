Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AB7D358F6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 10:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E6010E316;
	Thu, 29 Jan 2026 10:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFiNj+CL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5763A10E324
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 10:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769683558; x=1801219558;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SyZJ1BFzVXVOHa07Lee88Q5l/2QPN+weYte7gt+2q6M=;
 b=nFiNj+CLFYAGmXm3Fm0I+NjGYGc89VJ3ET8Ec/g2CtdSDfD/+nZgMdfN
 rZI3QziJDBJcS2x74qs7nZSJ3O3b8nWh1Ltnm5u+s5W6R25PuVAVtaDbw
 ofXb8WOWyn8B79rFI90nB5LBR/wtMBVEjiklHf/ih3tTJTwbnCOHPNzlj
 NRiF3Sd9gYzCQOsh3zMiBkudMekknsG5Qu34kadN0iZ172r1b8KXt/5Vl
 MS4nutsfYQzpDsCDimJUlunaSJyCE296XNnAeAw0fVKhpFWhuKOh68cXQ
 eibCfMz3DxZJp46LCT8uRqkY7MnBVcBqvW26wzkcgcTGLXFca0efCOOsF A==;
X-CSE-ConnectionGUID: /nVG+uXKQ0il/Wqa4/2h4w==
X-CSE-MsgGUID: dpR4a6TmS0aCHUxQVsLtqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="69932849"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="69932849"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 02:45:46 -0800
X-CSE-ConnectionGUID: 7dyJnfCaR0++fG6Jlg8BPw==
X-CSE-MsgGUID: zI/RX6/9TuW5zMZMlg5iug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="213506591"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 02:45:45 -0800
Date: Thu, 29 Jan 2026 11:45:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.brost@intel.com
Subject: Re: [PATCH i-g-t 1/1] RFC tests/intel/xe_exec_reset: Filter expected
 timeout dmesg during reset tests
Message-ID: <20260129104528.n2ra4wmmumyrhkaq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, matthew.brost@intel.com
References: <20260123065238.48129-1-sobin.thomas@intel.com>
 <20260123065238.48129-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260123065238.48129-2-sobin.thomas@intel.com>
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

Hi Sobin,
On 2026-01-23 at 06:52:38 +0000, Sobin Thomas wrote:
> During reset testing there are timedout messages with lrc seq no
> and seqno coming in CI Dmesg. These logs are causing CI warnings.
> 
> Since we are intentionally causing the GPU reset, so timeout messages
> are expected behavior rather than actual test failures. These messages
> filtered by CI and incorrectly flagged as errors.
> 
> This change adds ignore_timeout_dmesg() function that registers a regex
> pattern to filter out expected timeout-related dmesg messages:
> - "Timedout"
> - "timeout"
> 
> The function is strategically called before operations that trigger
> resets to proactively filter expected messages:
> - GT reset operations (xe_force_gt_reset_async/sync)
> - Legacy test modes involving resets
> - Compute mode tests with GT reset flags
> - Thread-based reset testing scenarios
> 
> This ensures cleaner test output by suppressing expected noise while
> preserving genuine error reporting for actual test failures.
> 

I am not sure if you really need it, please see some comments
below.

> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_exec_reset.c | 49 +++++++++++++++++++++++++++++++------
>  1 file changed, 41 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 7aaee31dd..19b2c96b9 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -28,6 +28,17 @@
>  
>  #define SYNC_OBJ_SIGNALED	(0x1 << 0)
>  #define LEGACY_MODE_ADDR	0x1a0000
> +static void ignore_timeout_dmesg(void)
> +{
> +	/*
> +	 * Timedout jobs are expected during reset testing,
> +	 * so ignore these in igt_runner.
> +	 */
> +	static const char *store = "Timedout|timeout";
> +
> +	igt_emit_ignore_dmesg_regex(store);
> +}
> +
>  
>  /**
>   * SUBTEST: spin
> @@ -73,6 +84,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
>  
>  	sync[0].handle = syncobj_create(fd, 0);
>  	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> +	ignore_timeout_dmesg();

Why here? You need it only subtest or sub-subtest start,
unless you want to treat timeouts selectivly. Currently
you cannot turn on/off locally, it is a global for a
subtest run. Once turned on, only end of subtest or
starting new subtest clears it.

>  
>  #define N_TIMES 4
>  	for (i = 0; i < N_TIMES; ++i) {
> @@ -260,8 +272,10 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  
>  	}
>  
> -	if (flags & GT_RESET)
> +	if (flags & GT_RESET) {
> +		ignore_timeout_dmesg();
>  		xe_force_gt_reset_async(fd, gt);
> +	}
>  
>  	if (flags & CLOSE_FD) {
>  		if (flags & CLOSE_EXEC_QUEUES) {
> @@ -446,6 +460,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	}
>  
>  	if (flags & GT_RESET) {
> +		ignore_timeout_dmesg();
>  		xe_spin_wait_started(&data[0].spin);
>  		xe_force_gt_reset_sync(fd, eci->gt_id);
>  	}
> @@ -590,6 +605,7 @@ gt_reset(int fd, int n_threads, int n_sec)
>  
>  	pthread_mutex_init(&mutex, 0);
>  	pthread_cond_init(&cond, 0);
> +	ignore_timeout_dmesg();
>  
>  	for (i = 0; i < n_threads; ++i) {
>  		threads[i].mutex = &mutex;
> @@ -650,6 +666,7 @@ gt_mocs_reset(int fd, int gt)
>  	igt_debugfs_dump(fd, path);
>  	igt_debugfs_read(fd, path, mocs_content_pre);
>  
> +	ignore_timeout_dmesg();
>  	xe_force_gt_reset_sync(fd, gt);
>  
>  	igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
> @@ -683,6 +700,7 @@ static void *thread(void *data)
>  		pthread_cond_wait(t->cond, t->mutex);
>  	pthread_mutex_unlock(t->mutex);
>  
> +	ignore_timeout_dmesg();
>  	xe_legacy_test_mode(t->fd, t->hwe, t->n_exec_queue, t->n_exec,
>  			    t->flags, LEGACY_MODE_ADDR, false);
>  
> @@ -739,6 +757,7 @@ static void threads(int fd, int n_exec_queues, int n_execs, unsigned int flags)
>  	pthread_mutex_init(&mutex, 0);
>  	pthread_cond_init(&cond, 0);
>  
> +	ignore_timeout_dmesg();

This seems redundant, please do not spread those ignores in all places
in code, either do it before ioctl which could lead to timeout,
or, preferably, just after subtest started. If you have it at
subtest start, you do not need to add it in other places.

>  	xe_for_each_engine(fd, hwe) {
>  		if (hwe->gt_id && (flags & GT0))
>  			continue;
> @@ -797,12 +816,15 @@ int igt_main()
>  			test_spin(fd, hwe, SYNC_OBJ_SIGNALED);
>  
>  	igt_subtest("cat-error")
> -		xe_for_each_engine(fd, hwe)
> +		xe_for_each_engine(fd, hwe) {
> +			ignore_timeout_dmesg();

move this before xe_for_each_engine()

>  			xe_legacy_test_mode(fd, hwe, 2, 2, CAT_ERROR,
>  					    LEGACY_MODE_ADDR, false);
> +		}
>  
>  	igt_subtest("cancel")
>  		xe_for_each_engine(fd, hwe) {
> +			ignore_timeout_dmesg();

Same here.

>  			xe_legacy_test_mode(fd, hwe, 1, 1, 0,
>  					    LEGACY_MODE_ADDR, false);
>  			break;
> @@ -810,6 +832,7 @@ int igt_main()
>  
>  	igt_subtest("cancel-preempt")
>  		xe_for_each_engine(fd, hwe) {
> +			ignore_timeout_dmesg();

Same here.

>  			xe_legacy_test_mode(fd, hwe, 1, 1, PREEMPT,
>  					    LEGACY_MODE_ADDR, false);
>  			break;
> @@ -897,25 +920,33 @@ int igt_main()
>  			LONG_SPIN_REUSE_QUEUE);
>  
>  	igt_subtest("gt-reset")
> -		xe_for_each_engine(fd, hwe)
> +		xe_for_each_engine(fd, hwe) {
> +			ignore_timeout_dmesg();

Same here.

>  			xe_legacy_test_mode(fd, hwe, 2, 2, GT_RESET,
>  					    LEGACY_MODE_ADDR, false);
> +		}
>  
>  	igt_subtest("close-fd-no-exec")
> -		xe_for_each_engine(fd, hwe)
> +		xe_for_each_engine(fd, hwe) {
> +			ignore_timeout_dmesg();

Same here.

>  			xe_legacy_test_mode(-1, hwe, 16, 0, CLOSE_FD,
>  					    LEGACY_MODE_ADDR, false);
> +		}
>  
>  	igt_subtest("close-fd")
> -		xe_for_each_engine(fd, hwe)
> +		xe_for_each_engine(fd, hwe) {
> +			ignore_timeout_dmesg();

Same here.

>  			xe_legacy_test_mode(-1, hwe, 16, 256, CLOSE_FD,
>  					    LEGACY_MODE_ADDR, false);
> +		}
>  
>  	igt_subtest("close-execqueues-close-fd")
> -		xe_for_each_engine(fd, hwe)
> +		xe_for_each_engine(fd, hwe) {
> +			ignore_timeout_dmesg();

Same here.

>  			xe_legacy_test_mode(-1, hwe, 16, 256, CLOSE_FD |
>  					    CLOSE_EXEC_QUEUES,
>  					    LEGACY_MODE_ADDR, false);
> +		}
>  
>  	igt_subtest("cm-cat-error")
>  		xe_for_each_engine(fd, hwe)
> @@ -941,17 +972,19 @@ int igt_main()
>  	for (const struct section *s = sections; s->name; s++) {
>  		igt_subtest_f("%s-cat-error", s->name)

Here could be a place for adding timout ignore.

>  			xe_for_each_gt(fd, gt)
> -				xe_for_each_engine_class(class)
> +				xe_for_each_engine_class(class) {
>  					test_balancer(fd, gt, class, XE_MAX_ENGINE_INSTANCE + 1,
>  						      XE_MAX_ENGINE_INSTANCE + 1,
>  						      CAT_ERROR | s->flags);
> +				}
>  
>  		igt_subtest_f("%s-gt-reset", s->name)

Same here, a place for ignore.

Regards,
Kamil

>  			xe_for_each_gt(fd, gt)
> -				xe_for_each_engine_class(class)
> +				xe_for_each_engine_class(class) {
>  					test_balancer(fd, gt, class, XE_MAX_ENGINE_INSTANCE + 1,
>  						      XE_MAX_ENGINE_INSTANCE + 1,
>  						      GT_RESET | s->flags);
> +				}
>  
>  		igt_subtest_f("%s-close-fd-no-exec", s->name)
>  			xe_for_each_gt(fd, gt)
> -- 
> 2.51.0
> 
