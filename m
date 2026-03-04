Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A386EB363E
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 07:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6D410E12B;
	Wed,  4 Mar 2026 07:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ow0hGMf2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A6110E12B
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 07:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772610994; x=1804146994;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EpzLm2QPSuz1oq6SFLUKSmsskP3KzvEOsRgTTzZSEFg=;
 b=Ow0hGMf2jpwsYnDxznqq5iWTGIZwrQkz6ajyuARyW7wiiK8stMf1sVIw
 ucs8CO9IP8gs9BcIpy0Q6BEOf/M1zBO6oYp15OJIBxBaG2y8YqHTlBCp7
 iibHtlw29QZSgp/OutqtQWiUk4qgWBzp9dR8PxBSdPa/UgGTAgJsdUsSl
 mamdKRDw0Wwtku6OurCv2eJ3rERRWwBGwCv6ElYk3x3783KCnvYUu5xCo
 z25+urzbFb/P/F9RQ9EIeiYVSOS3mOctR2TzTlS1MecENlIvho+SSKIs8
 IYrfrYTZwh0aEJJ92ruMtnDSc9/x6LMSEFUOqiJ9GBaoUGHYUDsAw/Gu7 Q==;
X-CSE-ConnectionGUID: STgVRJFmTOCfAwb38fxcFQ==
X-CSE-MsgGUID: UazehOpIRN6/LPLuY0TB8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84755471"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="84755471"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 23:56:33 -0800
X-CSE-ConnectionGUID: cWjOvQmfS6aDPTUZ3dRrkg==
X-CSE-MsgGUID: QE3g3JV5QvOcKZXs+82Vnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="215663354"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.141])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 23:56:31 -0800
Date: Wed, 4 Mar 2026 08:56:29 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 3/5] lib/intel_compute: Use user offsets and
 loop size if provided
Message-ID: <obaxykzg7ai3zzw7wsno7cutsugmqwjr4b3mfcq3ko66kq2y32@izontrtbs2nf>
References: <20260303134706.41948-7-zbigniew.kempczynski@intel.com>
 <20260303134706.41948-10-zbigniew.kempczynski@intel.com>
 <f2f35e2a-37ed-44e8-a412-ea621c264876@intel.com>
 <20260303163715.txuyiva3dj4qorf7@kamilkon-DESK.igk.intel.com>
 <MW4PR11MB71517AAC82F5B65854175C2CE47FA@MW4PR11MB7151.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MW4PR11MB71517AAC82F5B65854175C2CE47FA@MW4PR11MB7151.namprd11.prod.outlook.com>
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

On Tue, Mar 03, 2026 at 07:30:06PM +0100, Sharma, Nishit wrote:
>    Hi Kamil,
>    The patch is related to lib changes so singke patch is fine. Depends upon
>    Zbigniew if he wants to take description or let it as it is.
>    Regards
>    Nishit

Please avoid top posting - it is extremely difficult and annoying to
find who actually said what in the email thread.

> 
>      ----------------------------------------------------------------------
> 
>    From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>    Sent: Tuesday, March 3, 2026 10:07 PM
>    To: Sharma, Nishit <nishit.sharma@intel.com>
>    Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>;
>    igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
>    Subject: Re: [PATCH i-g-t v4 3/5] lib/intel_compute: Use user offsets and
>    loop size if provided
>     
>    Hi Nishit,
>    On 2026-03-03 at 20:37:44 +0530, Sharma, Nishit wrote:
>    >
>    > On 3/3/2026 7:17 PM, Zbigniew Kempczyński wrote:
>    > > If user passes its own input/output or number of iterations start
>    > > to use it instead of hardcoded ones. This pattern was already used
>    > > in other pipelines and only Xe3p missed this.
>    > Small Nitpick: Description
>    >
>    > lib/intel_compute: Improve Xe3p pipeline flexibility by allowing
>    > user-provided input/output buffers and iteration count
>
>    lib/intel_compute: Improve Xe3p pipeline flexibility by allowing
>    user-provided input/output buffers and iteration count
> 
>    This subject is too long, it should be short, up to 65 chars, sometimes
>    it could be more. What you proposed above is 119 chars.

Agree with Kamil - subject is too long.

> 
>    Hmm, it could be two patches, one for addresses, another for loop
>    count, no strong opinion here. I prefer it in one piece but if you
>    wish it separated, it could be.
> 
>    Regards,
>    Kamil
> 
>    >
>    > This updates Xe3P compute pipeline to use user-supplied input and output
>    > buffer addresses as well as user-defined iterations/loop count
>    >
>    > when provided. Previously, pipeline used hardcoded buffer addresses and
>    > iteration counts and ignored user overrides. With this change
>    >
>    > Xe3P correctly used user-supplied buffers and counts.

Yes, this is true - series fixes hardcoded addresses and loop count in
Xe3P compute pipeline. I'll reprase description a bit to make it clear.

--
Zbigniew

>    >
>    > Otherwise LGTM
>    >
>    > Acked-by: Nishit Sharma <nishit.sharma@intel.com>
>    >
>    > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>    > > Cc: Nishit Sharma <nishit.sharma@intel.com>
>    > > ---
>    > >   lib/intel_compute.c | 6 ++++--
>    > >   1 file changed, 4 insertions(+), 2 deletions(-)
>    > >
>    > > diff --git a/lib/intel_compute.c b/lib/intel_compute.c
>    > > index 1165bdafd9..bfe0a75a7c 100644
>    > > --- a/lib/intel_compute.c
>    > > +++ b/lib/intel_compute.c
>    > > @@ -2189,6 +2189,8 @@ static void xe3p_compute_exec(int fd, const
>    unsigned char *kernel,
>    > >      struct inline_data idata = {};
>    > >      struct bo_execenv execenv;
>    > >      float *input_data, *output_data;
>    > > +   uint64_t bind_input_addr = (user && user->input_addr) ?
>    user->input_addr : ADDR_INPUT;
>    > > +   uint64_t bind_output_addr = (user && user->output_addr) ?
>    user->output_addr : ADDR_OUTPUT;
>    > >      uint64_t indirect_addr = ADDR_GENERAL_STATE_BASE +
>    OFFSET_INDIRECT_DATA_START;
>    > >      int entries = ARRAY_SIZE(bo_dict);
>    > >      int64_t timeout_one_ns = 1;
>    > > @@ -2205,7 +2207,7 @@ static void xe3p_compute_exec(int fd, const
>    unsigned char *kernel,
>    > >      memcpy(bo_dict[0].data, kernel, size);
>    > >      memset(bo_dict[1].data, 0, 4096);
>    > > -   xe3p_create_indirect_data(bo_dict[1].data, ADDR_INPUT,
>    ADDR_OUTPUT,
>    > > +   xe3p_create_indirect_data(bo_dict[1].data, bind_input_addr,
>    bind_output_addr,
>    > >                                execenv.loop_count);
>    > >      idata.xe3p.indirect_addr_lo = indirect_addr;
>    > >      idata.xe3p.indirect_addr_hi = indirect_addr >> 32;
>    > > @@ -2233,7 +2235,7 @@ static void xe3p_compute_exec(int fd, const
>    unsigned char *kernel,
>    > >      }
>    > >      if (!user || (user && !user->skip_results_check))
>    > > -           bo_check_square(input_data, output_data,
>    execenv.array_size);
>    > > +           bo_check_square(input_data, output_data,
>    execenv.loop_count);
>    > >      bo_execenv_unbind(&execenv, bo_dict, entries);
>    > >      bo_execenv_destroy(&execenv);
