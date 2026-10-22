Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A28606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 13:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hgwG7P2u
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D32410E417;
	Thu, 22 Oct 2026 13:14:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5821510E41C
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 13:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792674806; x=1824210806;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZGThxRyxCDZVO7U8XNuNvx9kvdWTl85o3BLQcWRAwA8=;
 b=hgwG7P2uPGWmZK1b0rlWhFFHEFGodm8IOBgDF7x9HXcCe3NVKSAESf/O
 B6R6h9uFd9cyfQTyNbzIqfanRDwaK6on069h2Osjs6FsqP+PMMTYgbTN5
 DLF60Pm1Wzzt317tQXuxSN5AOkDXKw/SrMKuKrGTwLlQgXy4vpM3ui7MR
 MQmFadof5r5sxO9juHouGDzHEOMMXnRE2hP1+lAOi1nvB5yFsXdaUP9aO
 hT0KDwAlRNUVPklaEdFyz+gWz349dobnUjeL9bTrWjWV+Ehla8Jyvcj5f
 RYluDgugTzxXFvqrDeZp1ym1/sJT2hx5YrL/E/hSlEl3JExYjW9cyXQDj A==;
X-CSE-ConnectionGUID: Qlosa8fQQt6rK/qipXaPiw==
X-CSE-MsgGUID: fFXRzx5rS/W8l2x+shbJSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1436337"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1436337"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 06:13:25 -0700
X-CSE-ConnectionGUID: 86aIXDMkRUy0KvS33bruBw==
X-CSE-MsgGUID: Dcit2pExRk+OJ6Hv4BvIJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3697948"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 06:13:23 -0700
Date: Thu, 22 Oct 2026 15:13:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly prosyak <vprosyak@amd.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, Jesse Zhang <jesse.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t] tests/amdgpu: insert pause mnemonic only on x86 /
 x86_64 platforms
Message-ID: <20261022131321.g2wiqv7rlq6soenv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly prosyak <vprosyak@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, Jesse Zhang <jesse.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20261002191401.469214-1-dmitry.baryshkov@oss.qualcomm.com>
 <20261006142929.v262wmhkjaia2jmf@kamilkon-DESK.igk.intel.com>
 <ced89749-5a9e-494c-9283-59c9cb6c9eae@amd.com>
 <20261020193135.zyucqqpy75yopzsg@kamilkon-DESK.igk.intel.com>
 <81a6187d-0454-4188-b655-e3eee2063a80@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <81a6187d-0454-4188-b655-e3eee2063a80@amd.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi vitaly,
On 2026-10-21 at 10:58:43 -0400, vitaly prosyak wrote:
> Hi Kamil,
> 
> Thanks for catching the incorrect macro names.
> 
> As an alternative to correcting the guard, I've prepared a patch removing
> the optional x86 pause instruction and its architecture guard from
> wait_for_value64().
> 
> The sleep path, volatile polling reads, and timeout handling remain
> unchanged. When no polling interval is requested, the function continues
> busy-waiting without a CPU hint.
> 
> This simplifies the helper and removes its x86 assembly dependency, at the
> cost of losing the spin-wait optimization on x86. I verified that amd_basic
> builds on x86_64; ARM/AArch64 cross-compilation remains untested.
> 
> Would you accept this approach instead of correcting the macro names?

Well, it is an AMD GPU test, so I will accept any solution you propose,
and also imho someone from AMD GPU devs could do a review.


Regards,
Kamil

> 
> Regards,
> Vitaly
> 
> 
> On 2026-10-20 15:31, Kamil Konieczny wrote:
> > Hi vitaly,
> > On 2026-10-06 at 19:08:58 -0400, vitaly prosyak wrote:
> >> Thanks Dmitry!
> >>
> >> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> >>
> >> On 2026-10-06 10:29, Kamil Konieczny wrote:
> >>> Hi Dmitry,
> >>> On 2026-10-02 at 22:14:01 +0300, Dmitry Baryshkov wrote:
> >>>> The "pause" assembly mnemonic is only available on IA-32 platforms,
> >>>> breaking e.g. debug IGT builds on ARM / AArch64. The issue manifests
> >>>> only with -O1 or -O0, the default -O2 seems to optimize the condition
> >>>> away.
> >>>>
> >>>> Guard this inline assembly with the preprocessor checks, making sure
> >>>> that other platforms don't see the invalid assembly.
> >>>>
> >>>> FAILED: [code=1] tests/amdgpu/amd_basic.p/amd_basic.c.o
> >>>> Assembler messages:
> >>>> {standard input}:3702: Error: unknown mnemonic `pause' -- `pause'
> >>>>
> >>> Please add in Cc amdgpu devs, found by git log -- testname.c
> >>> here
> >>> Cc: Jesse Zhang <jesse.zhang@amd.com>
> >>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> >>>
> >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> LGTM
> >>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> >>>
> >>>
> >>> Regards,
> >>> Kamil
> >>>
> >>>> ---
> >>>>  tests/amdgpu/amd_basic.c | 2 ++
> >>>>  1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> >>>> index 418db286f81f..494934c1c321 100644
> >>>> --- a/tests/amdgpu/amd_basic.c
> >>>> +++ b/tests/amdgpu/amd_basic.c
> >>>> @@ -705,8 +705,10 @@ static int wait_for_value64(volatile uint64_t *ptr, uint64_t expected,
> >>>>  		/* Sleep if interval specified, otherwise tight loop */
> >>>>  		if (check_interval_ns > 0)
> >>>>  			nanosleep(&sleep_time, NULL);
> >>>> +#if defined(x86_64) || defined(i386)
> > Our AI review pointed out that there are no such defines used
> > by gcc, they should be __x86_64__ and __i386__ respectivly,
> > so this commit 125c0289617f ("tests/amdgpu: insert pause mnemonic only on x86 / x86_64 platforms")
> > should be fixed. Sorry for this, I should cross check it with
> > simple
> >
> > #else
> > #error "Unexpected"
> > #endif
> >
> > and see this error pop-up.
> >
> >
> >
> > Regards,
> > Kamil
> >
> >
> >>>>  		else
> >>>>  			__asm__ __volatile__("pause" ::: "memory"); /* CPU hint for spin-wait */
> >>>> +#endif
> >>>>  	}
> >>>>  }
> >>>>  
> >>>> -- 
> >>>> 2.53.0
> >>>>


