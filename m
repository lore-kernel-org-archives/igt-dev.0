Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935B8EDA698
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 16:37:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EC010E85E;
	Tue,  3 Mar 2026 16:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UKad/4Sp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5C510E85E
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 16:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772555839; x=1804091839;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zMlCmsYKur9wiu/ce+2IFxos0EaJUn7okWMIW6/HpKA=;
 b=UKad/4SpTkO/T70LCHXU6Me1HYtEoL3r0q8jYxyx0QNWD8f2cquHMbAA
 5zHp93cuXp+y4RSZZa/pjCbSQVZ016yy7MYngDz3yvLBFvGcxmVLN7jFV
 o64eDXn/m5ajOH+I2mpyEAyuDBANGqSL1BlppvSy/kdOYev4UQdZIWSCk
 vQ8sRD4lZfNeUkafKbJu1uywfhpWNFaKw2vnvyMMZjBMot4npF1GoMZ3t
 OMdOH+bqaNCjdANvXGh0BEiyrZwzjkRsC1gvrs0Mv/HMUXfOlL7tFZ+zF
 txaQ9xa6qyGHfXNrVfFCfttanr0c0l9RJwdfblnA7ApF/U8uDmJbnP6fx Q==;
X-CSE-ConnectionGUID: Zg+CD+rYTL+M3jthnuu4Mw==
X-CSE-MsgGUID: NHLFHZ0rRC2j2+TgWq2BRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73723581"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73723581"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 08:37:19 -0800
X-CSE-ConnectionGUID: vWV6VHEJSN2cZXBNJYfMtQ==
X-CSE-MsgGUID: dnKK98+NRHaBjNvfnEMxWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="222201965"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 08:37:17 -0800
Date: Tue, 3 Mar 2026 17:37:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v4 3/5] lib/intel_compute: Use user offsets and
 loop size if provided
Message-ID: <20260303163715.txuyiva3dj4qorf7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Sharma, Nishit" <nishit.sharma@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260303134706.41948-7-zbigniew.kempczynski@intel.com>
 <20260303134706.41948-10-zbigniew.kempczynski@intel.com>
 <f2f35e2a-37ed-44e8-a412-ea621c264876@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2f35e2a-37ed-44e8-a412-ea621c264876@intel.com>
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

Hi Nishit,
On 2026-03-03 at 20:37:44 +0530, Sharma, Nishit wrote:
> 
> On 3/3/2026 7:17 PM, Zbigniew Kempczyński wrote:
> > If user passes its own input/output or number of iterations start
> > to use it instead of hardcoded ones. This pattern was already used
> > in other pipelines and only Xe3p missed this.
> Small Nitpick: Description
> 
> lib/intel_compute: Improve Xe3p pipeline flexibility by allowing
> user-provided input/output buffers and iteration count

lib/intel_compute: Improve Xe3p pipeline flexibility by allowing user-provided input/output buffers and iteration count

This subject is too long, it should be short, up to 65 chars, sometimes
it could be more. What you proposed above is 119 chars.

Hmm, it could be two patches, one for addresses, another for loop
count, no strong opinion here. I prefer it in one piece but if you
wish it separated, it could be.

Regards,
Kamil

> 
> This updates Xe3P compute pipeline to use user-supplied input and output
> buffer addresses as well as user-defined iterations/loop count
> 
> when provided. Previously, pipeline used hardcoded buffer addresses and
> iteration counts and ignored user overrides. With this change
> 
> Xe3P correctly used user-supplied buffers and counts.
> 
> Otherwise LGTM
> 
> Acked-by: Nishit Sharma <nishit.sharma@intel.com>
> 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Nishit Sharma <nishit.sharma@intel.com>
> > ---
> >   lib/intel_compute.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> > index 1165bdafd9..bfe0a75a7c 100644
> > --- a/lib/intel_compute.c
> > +++ b/lib/intel_compute.c
> > @@ -2189,6 +2189,8 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
> >   	struct inline_data idata = {};
> >   	struct bo_execenv execenv;
> >   	float *input_data, *output_data;
> > +	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
> > +	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
> >   	uint64_t indirect_addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START;
> >   	int entries = ARRAY_SIZE(bo_dict);
> >   	int64_t timeout_one_ns = 1;
> > @@ -2205,7 +2207,7 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
> >   	memcpy(bo_dict[0].data, kernel, size);
> >   	memset(bo_dict[1].data, 0, 4096);
> > -	xe3p_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT,
> > +	xe3p_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr,
> >   				  execenv.loop_count);
> >   	idata.xe3p.indirect_addr_lo = indirect_addr;
> >   	idata.xe3p.indirect_addr_hi = indirect_addr >> 32;
> > @@ -2233,7 +2235,7 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
> >   	}
> >   	if (!user || (user && !user->skip_results_check))
> > -		bo_check_square(input_data, output_data, execenv.array_size);
> > +		bo_check_square(input_data, output_data, execenv.loop_count);
> >   	bo_execenv_unbind(&execenv, bo_dict, entries);
> >   	bo_execenv_destroy(&execenv);
