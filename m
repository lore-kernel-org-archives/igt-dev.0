Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6032DC3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 18:07:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2040A10E249;
	Wed, 31 Jul 2024 18:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cYKR2Cs/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F48F10E249;
 Wed, 31 Jul 2024 18:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722449230; x=1753985230;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aY2JQ5leMm7DoiE3z6m5+C4idDd5T8loAJUlHxbSRzk=;
 b=cYKR2Cs/E28yMTfZ7wuah/p++Vqzm7z0jxCOZuFk2bcoHocKzyvt0i0D
 KkNndJFyfYQrs7nwd3OvTOF662UFcy71T6SIiCm20DthgQVfBoVjLoWkQ
 9dTmO9ccgse+oSBkpKJlr38CUwHi2PDYqrY/Raj/LQPhdbEU13IFweMTW
 r1hFvDA3xT3WOJ7kAhxQwC+ahrTQdZniy3Tt/K4pbh0rBaichThYIT7Ci
 n5NNAErviCM+gE5rOnmf+Pe1ro46Z1g/tHGPMAzkWG0Hi5ilHLzMQXO/g
 oPJ6L3J6lCU5XpbS3rs4SomN4YmQXkJSidEU4NN79Ik0UX3orm3HjzjZZ w==;
X-CSE-ConnectionGUID: 648RPpjERCKrFuKtiDI1Lw==
X-CSE-MsgGUID: fDiPoYpaR6yM0qb3xkHB2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37821885"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="37821885"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 11:07:08 -0700
X-CSE-ConnectionGUID: WLBLPEapSPCzHfn7xpX+Bg==
X-CSE-MsgGUID: ynwa23uGSliSv0mCi0pmXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54688033"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 11:07:07 -0700
Date: Wed, 31 Jul 2024 20:07:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zack Rusin <zack.rusin@broadcom.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlQkFU?= =?utf-8?Q?=3A?= failure for Add
 vmwgfx prime tests (rev5)
Message-ID: <20240731180703.h3e6p5okoo2sabc4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Zack Rusin <zack.rusin@broadcom.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240730190037.1134020-1-zack.rusin@broadcom.com>
 <172236863359.450882.2549528200866825318@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172236863359.450882.2549528200866825318@2413ebb6fbb6>
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
On 2024-07-30 at 19:43:53 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add vmwgfx prime tests (rev5)
> URL   : https://patchwork.freedesktop.org/series/133402/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7942_BAT -> XEIGTPW_11499_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11499_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11499_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (7 -> 7)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11499_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@fbdev@nullptr:
>     - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-bmg-1/igt@fbdev@nullptr.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/bat-bmg-1/igt@fbdev@nullptr.html
> 

Unrelated to vmwgfx changes.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11499_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@xe_intel_bb@blit-simple:
>     - {bat-lnl-2}:        [DMESG-WARN][3] ([Intel XE#1705]) -> [PASS][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-lnl-2/igt@xe_intel_bb@blit-simple.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/bat-lnl-2/igt@xe_intel_bb@blit-simple.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-bmg-1:          [ABORT][5] ([Intel XE#2418]) -> [ABORT][6] ([Intel XE#2418] / [Intel XE#2421])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
>     - bat-adlp-7:         [ABORT][7] ([Intel XE#2418]) -> [ABORT][8] ([Intel XE#2418] / [Intel XE#2421])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
>     - bat-lnl-1:          [ABORT][9] ([Intel XE#2418]) -> [ABORT][10] ([Intel XE#2418] / [Intel XE#2421])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
>   [Intel XE#2418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418
>   [Intel XE#2421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7942 -> IGTPW_11499
>   * Linux: xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d -> xe-1691-acd846e309e206a4dbc83e4b857b6604aa0741af
> 
>   IGTPW_11499: 11499
>   IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d: 3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d
>   xe-1691-acd846e309e206a4dbc83e4b857b6604aa0741af: acd846e309e206a4dbc83e4b857b6604aa0741af
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/index.html
