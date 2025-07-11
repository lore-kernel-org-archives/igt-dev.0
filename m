Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85420C8303C
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 11:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E6D10EA21;
	Fri, 11 Jul 2025 11:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CYSJuBEh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6CF10E27D;
 Fri, 11 Jul 2025 11:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752231907; x=1783767907;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NgZ6MbeHZJQROhDQATCtHnRB3mJmcJnj25+h8X6ox50=;
 b=CYSJuBEh6wcIBkyJbDSjLH0k2FzwBRnPYfQFSMM+pYa5WXA3TKc+qy5m
 vTcDkzubUpOWumWmrz9bOZ9b/ZKo0bDJZPdjLrPM6UZKp/nu/zc+LMnAX
 IXm1PoyUAI1xUtCG5sQqF4UYomLjTCPbkKqyJwwTuTmSvR3d7Dl4gCjDv
 ugibPfXtl17NiJVSQCInqcG0itti+BOzx2bl1lqQuIuSDYJQZZKltFBb6
 3bCNGrtm4AxZwcVmBhA2oECD3qb7z0F9/VkB7A5bqdefoSP4p18KCWQ3f
 4xyxQ+NHOZ6QrPYV1aSAaxm8ICEDfwk5KL3KbBYrfH+NWFCyDWSAme8Xu A==;
X-CSE-ConnectionGUID: PBE2zI69R4qHto1toIXbiw==
X-CSE-MsgGUID: RETAyDAaRquwd+nmdieRPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54687317"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="54687317"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 04:05:07 -0700
X-CSE-ConnectionGUID: J0wn60EwQZ2dbkJZambfyg==
X-CSE-MsgGUID: iWSjVlLZT5GuDPnpa7yyiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="187345550"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 04:05:06 -0700
Date: Fri, 11 Jul 2025 13:05:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 tests/amdgpu/amd_basic: fix compilation warning
Message-ID: <20250711110503.5j54p2s4e73jrnqe@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250710123406.84306-1-kamil.konieczny@linux.intel.com>
 <175217351765.151663.14526401428387676997@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175217351765.151663.14526401428387676997@1538d3639d33>
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
On 2025-07-10 at 18:51:57 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/amdgpu/amd_basic: fix compilation warning
> URL   : https://patchwork.freedesktop.org/series/151439/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8450_FULL -> XEIGTPW_13444_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13444_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13444_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 

This is unrelated to change in amdgpu.

Regards,
Kamil

>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13444_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_psr@psr2-primary-blt@edp-1:
>     - shard-lnl:          [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8450/shard-lnl-7/igt@kms_psr@psr2-primary-blt@edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13444/shard-lnl-7/igt@kms_psr@psr2-primary-blt@edp-1.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13444_FULL that come from known issues:

...cut...

