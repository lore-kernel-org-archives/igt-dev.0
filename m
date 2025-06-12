Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621D6C61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 10:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D8410E766;
	Thu, 12 Jun 2025 10:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B5Sss197";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB2810E769
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749723309; x=1781259309;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+XXTrRVSG692cC+rekpNhUEw8GT3BIaBb3kOzlGSZa4=;
 b=B5Sss197NsTFdDMVaHDHHFOnMwsRzsbu28ZTTXTJKOCjefEjUfGk3KqQ
 YTkj5srzrCnHHcMlIW3f2OQJgsJizMYb8HuVcn/bEbo/stYmJm1jOQZ9o
 ZE0YesyYF0VkCj4AbOBoc3YUTRTVZR9Y1pj6kxw7Kn6NK9xR6BrzUKEdY
 uId+BcAtdq2qat72W6TaDq7H7Q8NJQeWrmBRwkHhT2ePRcxgeXLxRWcvW
 5B1/N/zC2OUVY3/sN6W0+dGR4DoTTPuQxJmm7pHNPXufVWJ8lWP7Qc5cK
 r9jEIiCZ4xm8ltwbgIDFnLwcHMS6Q8ip+gCufI0BXe9qq9xQk/t5/eH91 A==;
X-CSE-ConnectionGUID: +z3zKKHtREiiHTlxwCsFJA==
X-CSE-MsgGUID: vSz+3ZRiQASUMWfCjqsttw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63239543"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="63239543"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:15:09 -0700
X-CSE-ConnectionGUID: 27Nj7S+qSQGVY7puyqiGgQ==
X-CSE-MsgGUID: b+udcyOzShSk3UwQHZrCWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="147462118"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 03:15:03 -0700
Date: Thu, 12 Jun 2025 12:15:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Khatri, Sunil" <Sunil.Khatri@amd.com>
Cc: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3] tests/amdgpu: Fix compilation warnings for USERQ
Message-ID: <20250612101500.5yai7erbon7zxlal@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Khatri, Sunil" <Sunil.Khatri@amd.com>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20250611212500.1940399-1-kamil.konieczny@linux.intel.com>
 <e62158f8-c6ae-4fdc-94d4-b6ee760a63bf@amd.com>
 <BL1PR12MB57533782450275A0F38C58659374A@BL1PR12MB5753.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB57533782450275A0F38C58659374A@BL1PR12MB5753.namprd12.prod.outlook.com>
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
On 2025-06-12 at 05:08:14 +0000, Khatri, Sunil wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> This looks good.
> Reviewed-by: Sunil Khatri <sunil.khatri@amd.com>
> 
> 
> -----Original Message-----
> From: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
> Sent: Thursday, June 12, 2025 4:32 AM
> To: Kamil Konieczny <kamil.konieczny@linux.intel.com>; igt-dev@lists.freedesktop.org
> Cc: Khatri, Sunil <Sunil.Khatri@amd.com>; Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
> Subject: Re: [PATCH i-g-t v3] tests/amdgpu: Fix compilation warnings for USERQ
> 
> Hi Kamil,
> 
> 
> Sorry I missed those warnings and accidentally merged them — my mistake.
> Your change looks great to me. Thanks for taking care of it!
> 
> I hope Sunil will also agree with your proposal. I’m planning to merge it tomorrow — unless you’d prefer to do it yourself?

Thank you all, I merged it.

> 
> Reviewed-by Vitaly Prosyak ,vitaly.prosyak@amd.com>

Here missed ':' and s/,/</, I corrected it at merge.

Few more nits below.

> 
> On 2025-06-11 17:25, Kamil Konieczny wrote:
> > Recent change brings compilation warnings when AMDGPU_USERQ_ENABLED
> > was not defined, for example:
> >
> > ../tests/amdgpu/amd_security.c: In function '__igt_unique____real_main311':
> > ../tests/amdgpu/amd_security.c:319:14: warning: variable 'enable_test' set but not used [-Wunused-but-set-variable]
> >   319 |         bool enable_test = false;
> >
> > Fix this.
> >
> > v2: removed additional vars and prints (Sunil)
> > v3: correcting description, moved var setting back (Kamil)
> >
> > Cc: Sunil Khatri <sunil.khatri@amd.com>
> > Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> > Fixes: dad4b2bb9e5a ("tests/amdgpu: add environment variable to enable
> > tests")
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tests/amdgpu/amd_cs_nop.c   | 2 ++
> >  tests/amdgpu/amd_deadlock.c | 2 ++
> >  tests/amdgpu/amd_security.c | 2 ++
> >  3 files changed, 6 insertions(+)
> >
> > diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
> > index 644016d5d..c406f2fc5 100644
> > --- a/tests/amdgpu/amd_cs_nop.c
> > +++ b/tests/amdgpu/amd_cs_nop.c
> > @@ -171,10 +171,12 @@ igt_main
> >       int fd = -1;
> >       bool arr_cap[AMD_IP_MAX] = {0};
> >       bool userq_arr_cap[AMD_IP_MAX] = {0};
> > +#ifdef AMDGPU_USERQ_ENABLED
> >       bool enable_test;
> >       const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
> >
> >       enable_test = env && atoi(env);
> > +#endif

One more way to have it would be:

	bool enable_test = false;

#ifdef AMDGPU_USERQ_ENABLED
       const char *env = getenv("AMDGPU_DISABLE_USERQTEST");

       enable_test = env && atoi(env);
#endif

and later on use it at least one. Also consider compiling always
USERQ code, for example:

igt_describe("Test-GPU-reset-by-access-umq-gfx-illegal-reg");
igt_subtest("amdgpu-umq-gfx-illegal-reg-access") {
	if (userq_arr_cap[AMD_IP_GFX] &&
	    is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
       		if (enable_test)
			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS, AMDGPU_HW_IP_GFX, &pci, true);
		else
			igt_skip_f(1, "Test still in development\n");
	} else {
		igt_skip_on_f(!userq_arr_cap[AMD_IP_GFX], "No userq CAP\n");
		igt_skip_on_f(!is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci), "No reset per queue\n");
		igt_assert_f(0, "Error - should not reach here\n");
	}
}

Dynamic subtests are used when you will dynamically generete
sub-subtests and you do not know beforehand their names (scope),
for example you could have one, two or more queues depending on
type of GPU tested and then you will have:

for (i = 0; i < max_q; ++i)
	igt_dynamic_f("amdgpu-umq-illegal-reg-access-with-queue-number-%d", num_of_q) {
		test_illegal_reg_queue(amdgpu_fd, i);
	}

For static names there is no point in using dynamics.

Regards,
Kamil

> >
> >       igt_fixture {
> >               uint32_t major, minor;
> > diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> > index 45a864feb..2330b2955 100644
> > --- a/tests/amdgpu/amd_deadlock.c
> > +++ b/tests/amdgpu/amd_deadlock.c
> > @@ -43,10 +43,12 @@ igt_main
> >       bool arr_cap[AMD_IP_MAX] = {0};
> >       bool userq_arr_cap[AMD_IP_MAX] = {0};
> >       struct pci_addr pci;
> > +#ifdef AMDGPU_USERQ_ENABLED
> >       bool enable_test = false;
> >       const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
> >
> >       enable_test = env && atoi(env);
> > +#endif
> >
> >       igt_fixture {
> >               uint32_t major, minor;
> > diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
> > index 45bd7e771..4f38ee04e 100644
> > --- a/tests/amdgpu/amd_security.c
> > +++ b/tests/amdgpu/amd_security.c
> > @@ -316,10 +316,12 @@ igt_main
> >       int r, fd = -1;
> >       bool is_secure = true;
> >       bool userq_arr_cap[AMD_IP_MAX] = {0};
> > +#ifdef AMDGPU_USERQ_ENABLED
> >       bool enable_test = false;
> >       const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
> >
> >       enable_test = env && atoi(env);
> > +#endif
> >
> >       igt_fixture {
> >               uint32_t major, minor;
