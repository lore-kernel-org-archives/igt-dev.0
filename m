Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1641ACAC5B5
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 08:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C584510E3CB;
	Mon, 29 Sep 2025 08:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U6+SSmUy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E01310E3CB
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 08:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759135447; x=1790671447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6I02AUPzQo1cemVk/FHIDmXLshcQxYsCRhQ9XffUTBQ=;
 b=U6+SSmUyQSkhpOuohIsChdxnzi2RP6bFFzXMgi21RXGv2gc1G6inqTzt
 ZYDXx38ij3SWHqILe9SpCJOnC/e+2C0yYrUREaeD1HQkOxmelhwk9Btu9
 VxNdhw57dJkiE1+ecjhlDDN/SECRH40Ueq83I7T3hVcImS53sPtMY2xq1
 Hq1alX7PIGFAWc6imHrE2oJ0lqYnHnLFQQKCR4CubmpzB1F8FjKB/dJuG
 Y/YgGn9qpTak789cwzj5D5FLSvQw1BW7K3ojXgPFIXyQpwPCBQPlBMvI8
 C5nK5t3SXWcxjKl6klu+YH0KIuRHBwym4BUaPyzAPw1MkVobwSyn9JAVO A==;
X-CSE-ConnectionGUID: EgdFHbbITGacMhfq9gg7Kw==
X-CSE-MsgGUID: fG2yfiwcRvCVq0JlT4HFZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="61290762"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="61290762"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 01:44:06 -0700
X-CSE-ConnectionGUID: G/y2FAbSQZ6+bY2elMQLWQ==
X-CSE-MsgGUID: 0ORyACXTStuV4mLLCKIsjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="183362127"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.245.221])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 01:44:04 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v2 i-g-t] tests/intel/gem_exec_schedule: Improve
 synchronization in pi-ringfull
Date: Mon, 29 Sep 2025 10:44:01 +0200
Message-ID: <24778384.ouqheUzb2q@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250926180302.61612-2-krzysztof.niemiec@intel.com>
References: <20250926180302.61612-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi Krzysztof,

On Friday, 26 September 2025 20:03:03 CEST Krzysztof Niemiec wrote:
> Move the interrupt timer from the parent thread to the child thread as
> an explicit signal raise, and make sure the order of execution between
> them is always the same. This reduces nondeterminism in the test, fixing
> bugs like [1], where the child is starved out of CPU time up until the
> parent gets signalled and monopolizes the CPU before the child could
> submit its own execbuf, failing the test.
> 
> [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14898

If this patch resolves the issue then that link is a good candidate for a 
Closes: tag.

Thanks,
Janusz

> 
> v2: make the sync variable actually work (Zbigniew)
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
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
> 




