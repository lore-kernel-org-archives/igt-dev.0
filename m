Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D19C71147
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 17:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A988410E6FB;
	Wed, 11 Jun 2025 17:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NoA1OQBM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7B910E6DC
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 17:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749664787; x=1781200787;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=T3X69tXpHwruFJmfc9PNZ3B4wzFsB98nZNj4jsooBFY=;
 b=NoA1OQBM2ojV7jPdasR8JUtljw5YzJeDLbT2tsmBAjPZRpkQ/OhoNrk/
 lXu+/5/AB12J49aYFVh7qYN4IGxPnMusS1rxQxlTcwT0PLLW2qfpPrVUC
 fi0HDMiovQEzD1+BWUiMwB14I+5sc4ZkHByohkt4d1L5aDfDeRQ8H1v+5
 smJ5UKTa5RIOw7Drf0SFjfvsyEXDxFj2DER4zOuzDT0QBUsfVIYwM1FlB
 JkWMjNDzJ4jLE7U2OuZXarVvUVUJdBrYf2/89YcJLvhEwYchBeopzEUUh
 kseTGUdslOzCYjUBu/cSFZ5RXh7v8/nUpcqB6R9R22bj6s/SaNu9OXt4Z w==;
X-CSE-ConnectionGUID: /WLMa2MxSOuxwP/mks53+A==
X-CSE-MsgGUID: 8DuVuSM7RTOaJWk451nHFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63226752"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="63226752"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 10:59:47 -0700
X-CSE-ConnectionGUID: rNogZd5bRKiGjf/L8dGKAQ==
X-CSE-MsgGUID: OYG5s9j7SoKnAey0c+/cdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="147757220"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:59:45 -0700
Date: Wed, 11 Jun 2025 19:59:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sunil Khatri <sunil.khatri@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t v2] tests/amdgpu: Fix compilation warnings for USERQ
Message-ID: <20250611175943.nioghetu4ebbw3ew@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250611175212.746883-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250611175212.746883-1-kamil.konieczny@linux.intel.com>
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

Hi igt-dev,
On 2025-06-11 at 19:52:12 +0200, Kamil Konieczny wrote:
> Recent change brings compilation warnings when
> AMDGPU_USERQ_ENABLED was defined, for example:

I made it incorrect, should be 'was not defined':

AMDGPU_USERQ_ENABLED was not defined, for example:

This could be fixed at merge time.
I hope that patch is more aligned now.

Regards,
Kamil

> 
> ../tests/amdgpu/amd_security.c: In function '__igt_unique____real_main311':
> ../tests/amdgpu/amd_security.c:319:14: warning: variable 'enable_test' set but not used [-Wunused-but-set-variable]
>   319 |         bool enable_test = false;
> 
> Fix this and also while at this move setting var into igt_fixture.
> 
> Cc: Sunil Khatri <sunil.khatri@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Fixes: dad4b2bb9e5a ("tests/amdgpu: add environment variable to enable tests")
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/amdgpu/amd_cs_nop.c   | 7 +++++--
>  tests/amdgpu/amd_deadlock.c | 8 ++++++--
>  tests/amdgpu/amd_security.c | 7 +++++--
>  3 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
> index 644016d5d..9b6410352 100644
> --- a/tests/amdgpu/amd_cs_nop.c
> +++ b/tests/amdgpu/amd_cs_nop.c
> @@ -171,10 +171,10 @@ igt_main
>  	int fd = -1;
>  	bool arr_cap[AMD_IP_MAX] = {0};
>  	bool userq_arr_cap[AMD_IP_MAX] = {0};
> +#ifdef AMDGPU_USERQ_ENABLED
>  	bool enable_test;
>  	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
> -
> -	enable_test = env && atoi(env);
> +#endif
>  
>  	igt_fixture {
>  		uint32_t major, minor;
> @@ -189,6 +189,9 @@ igt_main
>  		igt_assert_eq(err, 0);
>  		asic_rings_readness(device, 1, arr_cap);
>  		asic_userq_readiness(device, userq_arr_cap);
> +#ifdef AMDGPU_USERQ_ENABLED
> +		enable_test = env && atoi(env);
> +#endif
>  	}
>  
>  	for (p = phase; p->name; p++) {
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index 45a864feb..4ea2ae8dc 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -43,10 +43,10 @@ igt_main
>  	bool arr_cap[AMD_IP_MAX] = {0};
>  	bool userq_arr_cap[AMD_IP_MAX] = {0};
>  	struct pci_addr pci;
> +#ifdef AMDGPU_USERQ_ENABLED
>  	bool enable_test = false;
>  	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
> -
> -	enable_test = env && atoi(env);
> +#endif
>  
>  	igt_fixture {
>  		uint32_t major, minor;
> @@ -71,6 +71,10 @@ igt_main
>  		igt_skip_on(get_pci_addr_from_fd(fd, &pci));
>  		igt_info("PCI Address: domain %04x, bus %02x, device %02x, function %02x\n",
>  				pci.domain, pci.bus, pci.device, pci.function);
> +#ifdef AMDGPU_USERQ_ENABLED
> +		enable_test = env && atoi(env);
> +#endif
> +
>  	}
>  	igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
>  	igt_subtest_with_dynamic("amdgpu-deadlock-sdma") {
> diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
> index 45bd7e771..a01e339ca 100644
> --- a/tests/amdgpu/amd_security.c
> +++ b/tests/amdgpu/amd_security.c
> @@ -316,10 +316,10 @@ igt_main
>  	int r, fd = -1;
>  	bool is_secure = true;
>  	bool userq_arr_cap[AMD_IP_MAX] = {0};
> +#ifdef AMDGPU_USERQ_ENABLED
>  	bool enable_test = false;
>  	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
> -
> -	enable_test = env && atoi(env);
> +#endif
>  
>  	igt_fixture {
>  		uint32_t major, minor;
> @@ -338,6 +338,9 @@ igt_main
>  		igt_assert_eq(r, 0);
>  		asic_userq_readiness(device, userq_arr_cap);
>  		igt_skip_on(!is_security_tests_enable(device, &gpu_info, major, minor));
> +#ifdef AMDGPU_USERQ_ENABLED
> +		enable_test = env && atoi(env);
> +#endif
>  	}
>  
>  	igt_describe("amdgpu security alloc buf test");
> -- 
> 2.49.0
> 
