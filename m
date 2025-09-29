Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7040CAC5B5
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 05:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B9D10E20E;
	Mon, 29 Sep 2025 05:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9aLZJrg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B036210E20E
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 05:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759124876; x=1790660876;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KGFoXHLOg0DTC+RPDmOuVDhQUjtUzklnvx8pxt5LlxY=;
 b=a9aLZJrgDrDex0zLGNSY4Z5IFQa+mbl6fP12zLIWD2KhVSyDlU4bwrz9
 ih2bJNJxPpl965u1d2HXAUqe7nSbgh9wg0v1FN9aH+6pC1UK81KK1FNms
 +8qsp2NyWlCF/ldb+X3mQQgAliZeUFpxkNl4BZAwCact5vvq+8CZa5hAf
 LgGLceew8LpZISn735Fk6/iBNupIxqREn4vrsbmHX2G4t2yObEtHA8rTw
 /WRNY5MW7AKKDDy8TVC/aKRUtRdgbetd8TKCNu/7P0+skUruxrPclD5wX
 V2saX52yJnjoaHucuaXN2J+l/1X5RrhIrlEmqUiw+O7Hj0wr65xe/9Gja g==;
X-CSE-ConnectionGUID: 6/BW7KtvQc2PvDgxUCiSaA==
X-CSE-MsgGUID: qw7F5S6TR1SHrwBQQY86hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="61279017"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="61279017"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 22:47:55 -0700
X-CSE-ConnectionGUID: ftOkjO1wTQeXpxYLFCSbgA==
X-CSE-MsgGUID: jZ+P4R2CToW8HTmBaKqmSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="177719082"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.168])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 22:47:53 -0700
Date: Mon, 29 Sep 2025 07:47:49 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v2 i-g-t] tests/intel/gem_exec_schedule: Improve
 synchronization in pi-ringfull
Message-ID: <2tbkluryzjny5trscz6jemdxcqgdx7t5yvtmojzkd2bmcrkniz@ajfzwnxrjtuj>
References: <20250926180302.61612-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250926180302.61612-2-krzysztof.niemiec@intel.com>
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

On Fri, Sep 26, 2025 at 08:03:03PM +0200, Krzysztof Niemiec wrote:
> Move the interrupt timer from the parent thread to the child thread as
> an explicit signal raise, and make sure the order of execution between
> them is always the same. This reduces nondeterminism in the test, fixing
> bugs like [1], where the child is starved out of CPU time up until the
> parent gets signalled and monopolizes the CPU before the child could
> submit its own execbuf, failing the test.
> 
> [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14898
> 
> v2: make the sync variable actually work (Zbigniew)
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Ok, I think it may work right now. Let's wait for CI.
From me:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  tests/intel/gem_exec_schedule.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
> index 84219b4cf..2f3958723 100644
> --- a/tests/intel/gem_exec_schedule.c
> +++ b/tests/intel/gem_exec_schedule.c
> @@ -2447,6 +2447,7 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
>  	struct itimerval itv;
>  	IGT_CORK_HANDLE(c);
>  	bool *result;
> +	bool *sync;
>  
>  	/*
>  	 * We start simple. A low priority client should never prevent a high
> @@ -2469,6 +2470,8 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
>  	result = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>  	igt_assert(result != MAP_FAILED);
>  
> +	sync = result + 0x100;
> +
>  	memset(&execbuf, 0, sizeof(execbuf));
>  	memset(&obj, 0, sizeof(obj));
>  
> @@ -2528,10 +2531,15 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
>  
>  	/* both parent + child on the same cpu, only parent is RT */
>  	bind_to_cpu(0);
> +	*sync = 0;
>  
>  	igt_fork(child, 1) {
>  		int err;
>  
> +		/* We want the parent to always go first */
> +		while (!*sync)
> +			sched_yield();
> +
>  		/* Replace our batch to avoid conflicts over shared resources? */
>  		if (!(flags & SHARED)) {
>  			obj[1].handle = gem_create(fd, 4096);
> @@ -2542,7 +2550,6 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
>  
>  		igt_debug("Waking parent\n");
>  		kill(getppid(), SIGALRM);
> -		sched_yield();
>  		result[1] = true;
>  
>  		sigaction(SIGALRM, &sa, NULL);
> @@ -2566,17 +2573,19 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
>  
>  		if (!(flags & SHARED))
>  			gem_close(fd, obj[1].handle);
> +
> +		/* Interrupt parent's execbuf now that the child is done */
> +		kill(getppid(), SIGALRM);
>  	}
>  
> +	*sync = 1;
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
