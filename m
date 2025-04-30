Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24C8C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 08:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8057C10E70B;
	Wed, 30 Apr 2025 08:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CYBdAQve";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B1310E70B;
 Wed, 30 Apr 2025 08:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746002403; x=1777538403;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dMpGhFeXp5TmrX8HpwYhapFAFa2OUZrPhcPQ9aLVl0g=;
 b=CYBdAQveSiWRZ4GBJlqNhrzIuLpjECRa2sss7M7NrJYExrULsM9OGG2Y
 u5rRG5W6OK3HicElXXss2chEk3y4sSX6FjQWXB7FWLgPK2UhepgwgfbaS
 vr5ccgc3+GdsqObqJhwJTMmktEwVjcYmi8Sp7ivGakLX/Zu5YhC5iogEr
 YF8Fiyu1t6n06aWlFPX1pB7u9k4zxH+DdyHXWDwKC8sOp1J799ecCj1gn
 5+u60hl8tRNlBZQ0uCbKxadN24p8molluBLpQLmLC3Tvss1YPaAaTEynF
 GZMGSDi+E/KGddqYsuIRjbdQLtYOyaC5TT6qu1oEN/z1Mcv/fH6T+KysR Q==;
X-CSE-ConnectionGUID: KtkJt5ffSd6Ac3iIpJzctg==
X-CSE-MsgGUID: bUi4co6uRWStAxwwpIIBEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58310479"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="58310479"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 01:40:02 -0700
X-CSE-ConnectionGUID: bpN8TB0dQQGJMZqNobAguw==
X-CSE-MsgGUID: /1ws5zIKRoic+aMkZOCWWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="139177567"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 01:40:01 -0700
Date: Wed, 30 Apr 2025 10:39:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_fo?=
 =?utf-8?Q?r?= tests/intel/xe_exec_system_allocator: Fix 32-bit compilation
Message-ID: <20250430083939.rseygf7ejav2ajul@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250429143051.36969-1-kamil.konieczny@linux.intel.com>
 <174599754131.28526.13030334240023243370@c664b1dc75d1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174599754131.28526.13030334240023243370@c664b1dc75d1>
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
On 2025-04-30 at 07:19:01 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_system_allocator: Fix 32-bit compilation
> URL   : https://patchwork.freedesktop.org/series/148419/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16477_full -> IGTPW_13060_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13060_full absolutely need to be
>   verified manually.

Unrelated to Xe test change, no need for respin, I will merge it soon.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13060_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13060/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13060_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rps@waitboost:
>     - shard-dg2:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16477/shard-dg2-5/igt@i915_pm_rps@waitboost.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13060/shard-dg2-5/igt@i915_pm_rps@waitboost.html
>     - shard-dg1:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16477/shard-dg1-19/igt@i915_pm_rps@waitboost.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13060/shard-dg1-17/igt@i915_pm_rps@waitboost.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
>     - shard-rkl:          [PASS][5] -> [INCOMPLETE][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16477/shard-rkl-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13060/shard-rkl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13060_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][7] ([i915#8411])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13060/shard-dg2-3/igt@api_intel_bb@object-reloc-purge-cache.html

...cut...

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8344 -> IGTPW_13060
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_16477: 1295f065de1df2595f37d907efa3354b19d9b639 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_13060: af7fb58db5e270cc4a52628047dc7cf78f62372c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8344: 00f143c5f06f7d5936aacb70dad22be371570d38 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13060/index.html
