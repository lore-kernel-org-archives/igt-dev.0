Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5C1C87FCA
	for <igt-dev@archiver.kernel.org>; Fri, 25 Jul 2025 10:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEED10E9C1;
	Fri, 25 Jul 2025 10:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7cgSXwr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA51110E9AF;
 Fri, 25 Jul 2025 10:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753438521; x=1784974521;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=vI3zCKydt/wENs77KLkZwi86vk2CaagFE1JETVsI1Zg=;
 b=G7cgSXwrzarEoyFKclIE5rlNSNHCAYxs/96GRqTRhGYmtZDPgEq6LeL4
 Qc2A5HhhNM5gpvecd6xaZVvRw+RtckhG3WM8Xh4b7E3GkGEJ9AJqUqzf3
 oG+btWdWF/Vm1jU26L8XlLze0w/ZemHBWbiauIPGcfQhfQiCjGOEYhJVm
 CIl33Th/HIZs+T+0xaexb2Y2yJvj+DW7rTNh3oYMZd9peQKXZ/KdCz5yQ
 MX+e5ujH233Vj1yP5z8rVkQ5jiHMRxzzPKb41Wp7XgXvV3f7WuFWiuyFV
 1vxx+wY0vviNsp5JcCMRlatGODNTqvjPqcyl/L5+i6HJolKRxckCtZVhQ A==;
X-CSE-ConnectionGUID: DePs+8stQxao256oP+NQNQ==
X-CSE-MsgGUID: dujyWrobSTa959seabmi8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66469625"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="66469625"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 03:15:20 -0700
X-CSE-ConnectionGUID: FC/mnGVEQxGr82ynq/NG1Q==
X-CSE-MsgGUID: jxidq26mSci7/ogyL+Mhmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="164893402"
Received: from eanguian-mobl1.amr.corp.intel.com (HELO [10.245.82.244])
 ([10.245.82.244])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 03:15:21 -0700
Message-ID: <c0d28bd6-35c6-41b3-89d3-0e6d2f4bacab@linux.intel.com>
Date: Fri, 25 Jul 2025 12:15:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Add_post-kmo?=
 =?UTF-8?Q?d-unbind_igt=5Fhook_=28rev2=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250723104406.58784-1-peter.senna@linux.intel.com>
 <175328888851.183981.6716423468688617786@1538d3639d33>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <175328888851.183981.6716423468688617786@1538d3639d33>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Dear I915,

On 7/23/2025 6:41 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: Add post-kmod-unbind igt_hook (rev2)
> URL   : https://patchwork.freedesktop.org/series/151642/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8475_BAT -> XEIGTPW_13514_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13514_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13514_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13514_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_pat@pat-index-xe2@render:
>     - bat-bmg-2:          [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8475/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13514/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html

These are unrelated to my change. Thank you.
