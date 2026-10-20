Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1F3606A325
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 19:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BP272Oit
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDDB10E1E2;
	Tue, 20 Oct 2026 19:32:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A656410E1E2
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 19:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792524714; x=1824060714;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hOtG0FfjBo8pg4ItJrD9JfBNOYd9vB5IX/8TVKNLD3c=;
 b=BP272OitncxGw+RSHIy9EtsuybEUivysOk33Aww1T/+/3CDNchIALkuJ
 hKODTGFyN3fkl6dnWpyphr8r4UtM2TrvIQLDwz2DPnl0tt9cpxKeZAiLn
 dEDfRBg6jlS8iLaO63kAG55rkiV4PjcMCRO2+VB96Cx4kuHuWXc8Xu6Gp
 hYTtg+cET/jpeAPVYkKhj+oIvR5Xp1g4wcQTbWu52aesj4O71yu+OLHD4
 jGPerypWpnea708GqksCzThpML7U085vB/TYY12daiH0PWquRbI3FviU8
 yntWGPo5Ho8RWPY8CxaN0ZTnyDMu1X7HHcbjtjsC5z2ltUKpb4ACsq6rH Q==;
X-CSE-ConnectionGUID: NOhyHWZjQDOy/fm8UqCjog==
X-CSE-MsgGUID: /xhoHxEIRsifr0xhj9Wl7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1113926"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1113926"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 12:31:53 -0700
X-CSE-ConnectionGUID: XXIlqqKkS16Sgo8dfCih+w==
X-CSE-MsgGUID: t3+EDnlJSrKdVrQpDzTcZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2804528"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 12:31:53 -0700
Date: Tue, 20 Oct 2026 21:31:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly prosyak <vprosyak@amd.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, Jesse Zhang <jesse.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t] tests/amdgpu: insert pause mnemonic only on x86 /
 x86_64 platforms
Message-ID: <20261020193135.zyucqqpy75yopzsg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly prosyak <vprosyak@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, Jesse Zhang <jesse.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20261002191401.469214-1-dmitry.baryshkov@oss.qualcomm.com>
 <20261006142929.v262wmhkjaia2jmf@kamilkon-DESK.igk.intel.com>
 <ced89749-5a9e-494c-9283-59c9cb6c9eae@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ced89749-5a9e-494c-9283-59c9cb6c9eae@amd.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi vitaly,
On 2026-10-06 at 19:08:58 -0400, vitaly prosyak wrote:
> Thanks Dmitry!
> 
> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> On 2026-10-06 10:29, Kamil Konieczny wrote:
> > Hi Dmitry,
> > On 2026-10-02 at 22:14:01 +0300, Dmitry Baryshkov wrote:
> >> The "pause" assembly mnemonic is only available on IA-32 platforms,
> >> breaking e.g. debug IGT builds on ARM / AArch64. The issue manifests
> >> only with -O1 or -O0, the default -O2 seems to optimize the condition
> >> away.
> >>
> >> Guard this inline assembly with the preprocessor checks, making sure
> >> that other platforms don't see the invalid assembly.
> >>
> >> FAILED: [code=1] tests/amdgpu/amd_basic.p/amd_basic.c.o
> >> Assembler messages:
> >> {standard input}:3702: Error: unknown mnemonic `pause' -- `pause'
> >>
> > Please add in Cc amdgpu devs, found by git log -- testname.c
> > here
> > Cc: Jesse Zhang <jesse.zhang@amd.com>
> > Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> >
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > LGTM
> > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> >
> >
> > Regards,
> > Kamil
> >
> >> ---
> >>  tests/amdgpu/amd_basic.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> >> index 418db286f81f..494934c1c321 100644
> >> --- a/tests/amdgpu/amd_basic.c
> >> +++ b/tests/amdgpu/amd_basic.c
> >> @@ -705,8 +705,10 @@ static int wait_for_value64(volatile uint64_t *ptr, uint64_t expected,
> >>  		/* Sleep if interval specified, otherwise tight loop */
> >>  		if (check_interval_ns > 0)
> >>  			nanosleep(&sleep_time, NULL);
> >> +#if defined(x86_64) || defined(i386)

Our AI review pointed out that there are no such defines used
by gcc, they should be __x86_64__ and __i386__ respectivly,
so this commit 125c0289617f ("tests/amdgpu: insert pause mnemonic only on x86 / x86_64 platforms")
should be fixed. Sorry for this, I should cross check it with
simple

#else
#error "Unexpected"
#endif

and see this error pop-up.



Regards,
Kamil


> >>  		else
> >>  			__asm__ __volatile__("pause" ::: "memory"); /* CPU hint for spin-wait */
> >> +#endif
> >>  	}
> >>  }
> >>  
> >> -- 
> >> 2.53.0
> >>
