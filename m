Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D01C71136
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 17:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC9610E6DC;
	Wed, 11 Jun 2025 17:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BQ84ZkPV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD3310E6D8
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 17:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749661967; x=1781197967;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6UyLT3Mf4gA5rbmuYhlXZbznH0ffVJzhKpop4RNkwxg=;
 b=BQ84ZkPVDYs82dRBKKVoQ/zhn2AApzozG/3Sx8uxbEDiNYYEtx3QDzgG
 wzo3wzFOe/MUQk9peKIINk/cedE4snMPMK0XRcnK8eJltoQU6A6xlVgPf
 /IfvGvcvhWSqBiWCsFleaIxmI4DHub0QJTrf0abqOjr07do5mcq8jKQxt
 EzndPTHyLCQ5Xgt93tA5Zn3yUKjZkWQbbgFPamwqb5RnANUIM0h2ocoTs
 62ZqzdGR6xFXh1FTHMlLV7l08ENZN7XCIgLrCnrHWAL+Jw7QbUE7kzy/j
 zvib8kWQZ64jNwQt2Nqaf3q94FdNLmWOGJTcgXNcJsReQbmZ5/44mcahG A==;
X-CSE-ConnectionGUID: ex8nbKr+QMKi6eY22Esu9w==
X-CSE-MsgGUID: yAA6kvkQScWt7qVLuhV9JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63160835"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="63160835"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 10:12:47 -0700
X-CSE-ConnectionGUID: A7WxFL1uRDCysiMpNOfEug==
X-CSE-MsgGUID: 8y3tZHPtRaOG9P1yFKdsKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="152246943"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:12:46 -0700
Date: Wed, 11 Jun 2025 19:12:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Khatri, Sunil" <sukhatri@amd.com>
Cc: igt-dev@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t] tests/amdgpu: Fix compilation warnings for USERQ
Message-ID: <20250611171243.n5wgt2k2be32ivtz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Khatri, Sunil" <sukhatri@amd.com>, igt-dev@lists.freedesktop.org,
 Sunil Khatri <sunil.khatri@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250611140415.158461-1-kamil.konieczny@linux.intel.com>
 <7264a3f2-d860-4804-a614-690d78a2ce01@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7264a3f2-d860-4804-a614-690d78a2ce01@amd.com>
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

Hi Khatri,,
On 2025-06-11 at 20:51:46 +0530, Khatri, Sunil wrote:
> 
> On 6/11/2025 7:34 PM, Kamil Konieczny wrote:
> > Recent change bringed compilation warnings, for example:
> > 
> > ../tests/amdgpu/amd_security.c: In function '__igt_unique____real_main311':
> > ../tests/amdgpu/amd_security.c:319:14: warning: variable 'enable_test' set but not used [-Wunused-but-set-variable]
> >    319 |         bool enable_test = false;
> > 
> > Fix this and move setting var into igt_fixture.
> > Also while at this, print if AMDGPU_USERQ_ENABLED was defined.
> > 
> > Cc: Sunil Khatri<sunil.khatri@amd.com>
> > Cc: Vitaly Prosyak<vitaly.prosyak@amd.com>
> > Fixes: dad4b2bb9e5a ("tests/amdgpu: add environment variable to enable tests")
> > Signed-off-by: Kamil Konieczny<kamil.konieczny@linux.intel.com>
> > ---
> >   tests/amdgpu/amd_cs_nop.c   | 10 ++++++++--
> >   tests/amdgpu/amd_deadlock.c | 11 +++++++++--
> >   tests/amdgpu/amd_security.c | 10 ++++++++--
> >   3 files changed, 25 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
> > index 644016d5d..24fae3635 100644
> > --- a/tests/amdgpu/amd_cs_nop.c
> > +++ b/tests/amdgpu/amd_cs_nop.c
> > @@ -173,8 +173,11 @@ igt_main
> >   	bool userq_arr_cap[AMD_IP_MAX] = {0};
> >   	bool enable_test;
> >   	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
> > -
> > -	enable_test = env && atoi(env);
> > +#ifdef AMDGPU_USERQ_ENABLED
> > +	const char *enable_str = "USERQTEST enabled";
> > +#else
> > +	const char *enable_str = "USERQTEST not enabled";
> > +#endif
> >   	igt_fixture {
> >   		uint32_t major, minor;
> > @@ -189,6 +192,9 @@ igt_main
> >   		igt_assert_eq(err, 0);
> >   		asic_rings_readness(device, 1, arr_cap);
> >   		asic_userq_readiness(device, userq_arr_cap);
> > +		enable_test = env && atoi(env);
> > +		if (enable_test)
> > +			igt_info("%s\n", enable_str);
> >   	}
> >   	for (p = phase; p->name; p++) {
> > diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> > index 45a864feb..d416b4909 100644
> > --- a/tests/amdgpu/amd_deadlock.c
> > +++ b/tests/amdgpu/amd_deadlock.c
> > @@ -45,8 +45,11 @@ igt_main
> >   	struct pci_addr pci;
> >   	bool enable_test = false;
> >   	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
> > -
> > -	enable_test = env && atoi(env);
> > +#ifdef AMDGPU_USERQ_ENABLED
> > +	const char *enable_str = "USERQTEST enabled";
> > +#else
> > +	const char *enable_str = "USERQTEST not enabled";
> > +#endif
> >   	igt_fixture {
> >   		uint32_t major, minor;
> > @@ -71,6 +74,10 @@ igt_main
> >   		igt_skip_on(get_pci_addr_from_fd(fd, &pci));
> >   		igt_info("PCI Address: domain %04x, bus %02x, device %02x, function %02x\n",
> >   				pci.domain, pci.bus, pci.device, pci.function);
> > +		enable_test = env && atoi(env);
> > +		if (enable_test)
> > +			igt_info("%s\n", enable_str);
> 
> enable_test is for test specific which arent supported by user queues in
> kernel driver yet but the enable_str only says user queues is supported and
> not test specific. So both are for different purposes
> 
> all together. I see the warning is coming when AMDGPU_USERQ_ENABLED is not
> set and in that case the variable enable_test is unused.
> 

What about:

#ifdef AMDGPU_USERQ_ENABLED
  	bool enable_test = false;
#endif

and later on, whenever it is set or used:

#ifdef AMDGPU_USERQ_ENABLED
	enable_test = env && atoi(env);
#endif

without any prints.

Is it better? If not feel free take it over and fix it asap
however you like it.

Regards,
Kamil

> > +
> >   	}
> >   	igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
> >   	igt_subtest_with_dynamic("amdgpu-deadlock-sdma") {
> > diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
> > index 45bd7e771..891d8f577 100644
> > --- a/tests/amdgpu/amd_security.c
> > +++ b/tests/amdgpu/amd_security.c
> > @@ -318,8 +318,11 @@ igt_main
> >   	bool userq_arr_cap[AMD_IP_MAX] = {0};
> >   	bool enable_test = false;
> >   	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
> > -
> > -	enable_test = env && atoi(env);
> > +#ifdef AMDGPU_USERQ_ENABLED
> > +	const char *enable_str = "USERQTEST enabled";
> > +#else
> > +	const char *enable_str = "USERQTEST not enabled";
> > +#endif
> >   	igt_fixture {
> >   		uint32_t major, minor;
> > @@ -338,6 +341,9 @@ igt_main
> >   		igt_assert_eq(r, 0);
> >   		asic_userq_readiness(device, userq_arr_cap);
> >   		igt_skip_on(!is_security_tests_enable(device, &gpu_info, major, minor));
> > +		enable_test = env && atoi(env);
> > +		if (enable_test)
> > +			igt_info("%s\n", enable_str);
> 
> We dont want this based on enable_test as its for a different purpose all
> together. Without that the enable_test will again be unused.
> 
> Regards
> Sunil Khatri
> 
> >   	}
> >   	igt_describe("amdgpu security alloc buf test");
