Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7C8CA5FED
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 14:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148FD10E411;
	Tue,  6 Oct 2026 14:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QRG5GnZd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0EE10E373
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 14:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791296973; x=1822832973;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WcbUbyoldkYlNSZnIiPp53VxmlLI1DNJ7ywog8ll3Rc=;
 b=QRG5GnZdz3Fk/zKJ91Clj+JMiNCdpOOE8iC3BBba8aJyKW7iRN5ftH6+
 4oHpBA8Xa4Gf0Mjs1NW6GehluCbv/MexyFCgcGesUQFebTP3g7HwThIe3
 v70+uhxbtL8Ttv+SosUkg/5t/oN/p1kU9TTBfpAQSB4VYn47xYJdSBPQE
 MaVcKE8XcrmOhltVxYUG4XELNR3hEP0k3RW7/AS3IrkbYUnLPkAhvFgSj
 UeSUFo7+a89IowlJMf/1Uud+meJE2c0pSWFJWsbSqY9WYUt6A84pFVS+S
 IZCPVuFPdexEm1Vjg027deB4R/Y6d4FWfhEvKcu9QAALWx0+mP54Lq1+m g==;
X-CSE-ConnectionGUID: yukhn3XVSVupAtRtxxmfqQ==
X-CSE-MsgGUID: RFwRsrwKRkas7UYqWOFdIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="28338"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="28338"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 07:29:33 -0700
X-CSE-ConnectionGUID: /aZyp9mTSVuXQucXdw64Rw==
X-CSE-MsgGUID: zMl9Q2i2QtqH3pJZg2ePiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="281949341"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 07:29:32 -0700
Date: Tue, 6 Oct 2026 16:29:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, Jesse Zhang <jesse.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t] tests/amdgpu: insert pause mnemonic only on x86 /
 x86_64 platforms
Message-ID: <20261006142929.v262wmhkjaia2jmf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, Jesse Zhang <jesse.zhang@amd.com>,
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

Please add in Cc amdgpu devs, found by git log -- testname.c
here
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


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
