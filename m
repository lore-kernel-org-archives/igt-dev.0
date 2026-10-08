Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D49CA600C
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 14:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4CA10E8A2;
	Thu,  8 Oct 2026 14:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YAtWsEhB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E18810E8A2
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 14:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791469296; x=1823005296;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iWDTpoBA7HuwfWW/VTaDPh8rPCVDyHrx6SEi/dyOrTk=;
 b=YAtWsEhBnl4HzELgXf4WfTIDoPIdPTnZ97adcsSKJ5DeUIgpDvplS1Si
 fR5ScwszzU/5I6frx7QWHncSsoh+oOPdTvTNbOPShO1Fzh9vzq8YyBkyY
 T3Po4TnBBj0L+YxDBUlex1+ERJHsHmLlfszcvbzAMK8Ad40PqZrM8r8XR
 NUsKxmbfiSPvyYa9V8mM6MItKJVDx7KpKp+0IaJmc6CNt+KPEVetYjQJz
 g/Py3n2+yDJWX4DkeW6DCVRgBrjVbkdpnObeXFnW63Q32gH8xB84bHoBp
 12HSThpH7sp0Y8TsCm0gyaM1MmkAE7pBr42hQA5U7EyLCtY6c52U6dMwt Q==;
X-CSE-ConnectionGUID: kVHF+I8DS1qtE2pjXXP73A==
X-CSE-MsgGUID: a+TZjTgESHCSBWNHiliEWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="251347"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="251347"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 07:21:31 -0700
X-CSE-ConnectionGUID: 1BVTTuZOQi+PulsU6UB80w==
X-CSE-MsgGUID: 3rpL41UVRwWfImD44flPDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="1888905"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 07:21:29 -0700
Date: Thu, 8 Oct 2026 16:21:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t] tests/amdgpu: insert pause mnemonic only on x86 /
 x86_64 platforms
Message-ID: <20261008142127.noik7voswee5fhlr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20261002191401.469214-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261002191401.469214-1-dmitry.baryshkov@oss.qualcomm.com>
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

Hi Dmitry,
On 2026-10-02 at 22:14:01 +0300, Dmitry Baryshkov wrote:
> The "pause" assembly mnemonic is only available on IA-32 platforms,
> breaking e.g. debug IGT builds on ARM / AArch64. The issue manifests
> only with -O1 or -O0, the default -O2 seems to optimize the condition
> away.
> 
> Guard this inline assembly with the preprocessor checks, making sure
> that other platforms don't see the invalid assembly.
> 
> FAILED: [code=1] tests/amdgpu/amd_basic.p/amd_basic.c.o
> Assembler messages:
> {standard input}:3702: Error: unknown mnemonic `pause' -- `pause'
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Applied, thanks!


Regards,
Kamil

> ---
>  tests/amdgpu/amd_basic.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> index 418db286f81f..494934c1c321 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -705,8 +705,10 @@ static int wait_for_value64(volatile uint64_t *ptr, uint64_t expected,
>  		/* Sleep if interval specified, otherwise tight loop */
>  		if (check_interval_ns > 0)
>  			nanosleep(&sleep_time, NULL);
> +#if defined(x86_64) || defined(i386)
>  		else
>  			__asm__ __volatile__("pause" ::: "memory"); /* CPU hint for spin-wait */
> +#endif
>  	}
>  }
>  
> -- 
> 2.53.0
> 
