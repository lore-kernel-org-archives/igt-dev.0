Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5198DCAC599
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 04:48:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C0C10E63D;
	Tue, 16 Sep 2025 04:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRfL/6Ua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92A610E63D
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 04:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757998101; x=1789534101;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=V32gYTm+NWJOeHhKhkzIMWLK1IGvASDlotboLyWGzho=;
 b=eRfL/6Uarv7kGd7+vGIbN2FLmbnRrZ3cdizGRoN7BM0Z6BQbFdtDn2nL
 PlcuklijXgQodePhVcSGIyvxK3j1Ur6VumeHjQf7NsFmNqmRPgg0Vx5JF
 vnatDrXSQ8D3qqzw9RTFxn1ebNerGh4F7gZqVFR7SyITDFLlS8w+whDZb
 hlLB58J+KIytExIMui5AltXju/iWMHR6At5G2YdYsjBAe3eRt9DRsfyTl
 9RYbybL4J7ueNShQQ9sV+eILpcQwXYQJI05rt0AdMwduXUFjsD7vMsUjd
 wc9lKofDs/qAb9aXC4l2qNMuvbD9w8jp1K6Twhl+oXhbgQOmTYhtLWYJd w==;
X-CSE-ConnectionGUID: 9SpAofzLQOi1SXZDyy3W6A==
X-CSE-MsgGUID: CjAVG2PCRgOcovIyCb4Mew==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60215041"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60215041"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 21:48:21 -0700
X-CSE-ConnectionGUID: /c5YSixrSxC3UMwbIfKQmA==
X-CSE-MsgGUID: Zm3kWGf2SauopvlRVU6beQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="174380575"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.140])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 21:48:18 -0700
Date: Tue, 16 Sep 2025 06:48:14 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/gem_exec_schedule: Improve
 synchronization in pi-ringfull
Message-ID: <meqnvgkskt6mq3dshte2u6nlmlahdxqkhgnosprvsew3d7suv6@aiqecfel7qoj>
References: <20250915155427.417074-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915155427.417074-2-krzysztof.niemiec@intel.com>
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

On Mon, Sep 15, 2025 at 05:54:28PM +0200, Krzysztof Niemiec wrote:
> Move the interrupt timer from the parent thread to the child thread as
> an explicit signal raise, and make sure the order of execution between
> them is always the same. This reduces nondeterminism in the test, fixing
> bugs like [1], where the child is starved out of CPU time up until the
> parent gets signalled and monopolizes the CPU before the child could
> submit its own execbuf, failing the test.
> 
> [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14898
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tests/intel/gem_exec_schedule.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
> index 84219b4cf..d387725d2 100644
> --- a/tests/intel/gem_exec_schedule.c
> +++ b/tests/intel/gem_exec_schedule.c
> @@ -2446,6 +2446,7 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
>  	unsigned int last, count;
>  	struct itimerval itv;
>  	IGT_CORK_HANDLE(c);
> +	char volatile sync;
>  	bool *result;
>  
>  	/*
> @@ -2528,10 +2529,15 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
>  
>  	/* both parent + child on the same cpu, only parent is RT */
>  	bind_to_cpu(0);
> +	sync = 0;
>  
>  	igt_fork(child, 1) {
>  		int err;
>  
> +		/* We want the parent to always go first */
> +		if (!sync)
> +			sched_yield();
> +
>  		/* Replace our batch to avoid conflicts over shared resources? */
>  		if (!(flags & SHARED)) {
>  			obj[1].handle = gem_create(fd, 4096);
> @@ -2542,7 +2548,6 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
>  
>  		igt_debug("Waking parent\n");
>  		kill(getppid(), SIGALRM);
> -		sched_yield();
>  		result[1] = true;
>  
>  		sigaction(SIGALRM, &sa, NULL);
> @@ -2566,17 +2571,19 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
>  
>  		if (!(flags & SHARED))
>  			gem_close(fd, obj[1].handle);
> +
> +		/* Interrupt parent's execbuf now that the child is done */
> +		kill(getppid(), SIGALRM);
>  	}
>  
> +	sync = 1;

Why this assignment would be ever visible in child process?

I guess you want to use mmaped mem visible to both?

--
Zbigniew

> +
>  	/* Relinquish CPU just to allow child to create a context */
> -	sleep(1);
> +	pause();
>  	igt_assert_f(result[0], "HP context (child) not created\n");
>  	igt_assert_f(!result[1], "Child released too early!\n");
>  
>  	/* Parent sleeps waiting for ringspace, releasing child */
> -	itv.it_value.tv_sec = 0;
> -	itv.it_value.tv_usec = 50000;
> -	setitimer(ITIMER_REAL, &itv, NULL);
>  	igt_debug("LP parent executing\n");
>  	igt_assert_eq(__execbuf(fd, &execbuf), -EINTR);
>  	igt_assert_f(result[1], "Child was not released!\n");
> -- 
> 2.45.2
> 
