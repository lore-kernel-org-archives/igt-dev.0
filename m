Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86477CD343B
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 07:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFDC10EF97;
	Thu,  7 May 2026 07:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nddZtc2j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D40A10EF9F
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 07:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778138520; x=1809674520;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VIvmKv1gssOIVC2L8NDzcihcRp5hxR7YAbRVpJrRjL0=;
 b=nddZtc2jJewMP6sJsnAKYGxV+Bi7TI6Q+04Cwhj+nMn5UwLUcRnSKXwF
 8kbxRcYaie/SlFHZHQFyvY3l2aPzQEV/XzLnfPKhsFM16zZQLpBXaupTL
 mLogHvCOy4m0qDfvHiq4NqCg/9rhki0EpDoo1USo3dwhuzGixVk2MPva9
 brn0YrYAiVyJdiKtiZupKdAVxeOYV+yBB8AnDaR7I2i0LJn9BUtaozMvD
 PWCA2K6UD8/OBiHBV8ueCn0vRM8z6BpuRAKQxduhR3puZsGyT4ZLB7tBx
 gnCp+0mrJJWNexbZSTBH5Ov9+Fmhzdj1qZVt0ItunMvsMm3+lBIrgFj9N Q==;
X-CSE-ConnectionGUID: 4DZO7etbQ+C01Z4xMA7XMw==
X-CSE-MsgGUID: 3Y3V38s3SOCAZ/0gOkfqlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78977877"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="78977877"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 00:21:59 -0700
X-CSE-ConnectionGUID: 2FkLfqPIQ6axQ3ZBxJOvcw==
X-CSE-MsgGUID: p3NUYQ05QUSedcpFjblRNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="236302283"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.81])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 00:21:58 -0700
Date: Thu, 7 May 2026 09:21:54 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Test
 madvise(MADV_DONTNEED)
Message-ID: <oug4lkibyyxne5y4bdqg2wy4b5e2y2ko3wk5r7ss7235v2kgd7@76i7mljhpbkh>
References: <20260424081647.516473-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260424081647.516473-1-francois.dugast@intel.com>
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

On Fri, Apr 24, 2026 at 10:16:47AM +0200, Francois Dugast wrote:
> Extend the compute test to make use of madvise(MADV_DONTNEED) on the input
> array before reading from it after computation, so that its effects can be
> checked by looking at GT stats or tracing for example with:
> 
>     sudo bpftrace -e 'kprobe:xe_migrate_from_vram { printf("%llu,%d,VRAM->SYSTEM\n", nsecs, tid); }'

This probe is not triggered for 'dontneed' tests, at least on BMG
and drm-tip.

To be honest I don't like the fact we need to run external tool manually
to check is the test really doing what it is supposed to do.

Functional tests should directly return success/fail/skip but here we
always return success. For local testing it is fine but from CI point
of view it's fake test.

I think proper solution would be to execute bpftrace in separate
process and parse its output. Sth like:


	int ret, p[2];
	char c;

	igt_assert_eq(pipe(p), 0);
	igt_fork(child, 1) {
		char end = '^', fail = '!';
		close(1);
		dup2(p[1], 1);
		igt_system_cmd(ret, "bpftrace ...");
		if (ret)
			write(p[1], &fail, 1);
		write(p[1], &end, 1);
	}
	alarm(5); // just in case
	while(read(p[0], &c, 1) > 0 && c != '^' && c != '!')
		igt_info("%c", c);

	igt_waitchildren();

In case of missing bpftrace we need to ask CI team to add it to
the image and skip if executing binary will fail.

--
Zbigniew

> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 32 +++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 5580099f7..5a6334b73 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2267,6 +2267,7 @@ static void read_gt_stats_snapshot(int fd,
>  /* compute flags */
>  #define TOUCH_ONCE		(0x1 << 0)
>  #define ACCESS_DEVICE_HOST	(0x1 << 1)
> +#define USE_MADV_DONTNEED	(0x1 << 2)
>  
>  /**
>   * SUBTEST: compute
> @@ -2285,6 +2286,18 @@ static void read_gt_stats_snapshot(int fd,
>   * Description: Run a simple compute kernel %arg[1] on a 2MB malloc'ed buffer
>   * Test category: performance test
>   *
> + * SUBTEST: eu-fault-4k-range-device-host-madvise-dontneed
> + * Description: Run a simple compute kernel %arg[1] on a 4KB malloc'ed buffer for which madvise(MADV_DONTNEED) is used
> + * Test category: performance test
> + *
> + * SUBTEST: eu-fault-64k-range-device-host-madvise-dontneed
> + * Description: Run a simple compute kernel %arg[1] on a 64KB malloc'ed buffer for which madvise(MADV_DONTNEED) is used
> + * Test category: performance test
> + *
> + * SUBTEST: eu-fault-2m-range-device-host-madvise-dontneed
> + * Description: Run a simple compute kernel %arg[1] on a 2MB malloc'ed buffer for which madvise(MADV_DONTNEED) is used
> + * Test category: performance test
> + *
>   * arg[1]:
>   *
>   * @once-device:				touch the buffer only once, from the device
> @@ -2321,7 +2334,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
>  	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
>  
>  	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
> -	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
> +	env.skip_results_check = true;
>  	env.vm = vm;
>  
>  	read_gt_stats_snapshot(fd, eci, &stats_before);
> @@ -2343,6 +2356,22 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
>  
>  		xe_run_intel_compute_kernel_on_engine(fd, eci, &env, EXECENV_PREF_SYSTEM);
>  
> +		if (flags & ACCESS_DEVICE_HOST) {
> +			float total = 0;
> +
> +			if (flags & USE_MADV_DONTNEED)
> +				madvise(compute_input, size, MADV_DONTNEED);
> +
> +			/*
> +			 * No functional purpose, just force a read on host
> +			 */
> +			for (int j = 0; j < env.array_size; j++)
> +				total += compute_input[i];
> +
> +			if (!total)
> +				igt_debug("compute_input is zeros\n");
> +		}
> +
>  		free(compute_input);
>  	}
>  
> @@ -2524,6 +2553,7 @@ int igt_main()
>  		{ "once-device-host", TOUCH_ONCE | ACCESS_DEVICE_HOST },
>  		{ "range-device", 0 },
>  		{ "range-device-host", ACCESS_DEVICE_HOST },
> +		{ "range-device-host-madvise-dontneed", ACCESS_DEVICE_HOST | USE_MADV_DONTNEED },
>  		{ NULL },
>  	};
>  
> -- 
> 2.43.0
> 
