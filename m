Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71701C3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 19:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B629010E17C;
	Thu, 10 Apr 2025 19:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ns529IZn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E69B10E07A;
 Thu, 10 Apr 2025 19:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744312271; x=1775848271;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IL6wCJvb89dkLACfqSLuyIcJAQ7Vmp1ONN/TZ2OR4CU=;
 b=Ns529IZnEP2ry2S0m6fndO2zD98gioGUz+pt98XQ+FG9AO0qEotGG02l
 mDnfSUJ+rSrbZLfYrkLviCguADVjpQ9YIfh9AJAiRrdwifmjZEDGkbXsv
 0eNYfYhqGe4xdxuWPUyzLn8wi27hny62eL43YD0rZQpndNWB3j6YTGDml
 tx3VNPQDgdd6ej/ygESeAnYvdTAJ5aO1z5WMxK/gTS4OY81nzR87lYD0B
 MbaiW6B1OtSzahuKWGjkeX6UB2T+XFEMrTI5MxijJbS/jWS8WXJjAkleZ
 GdEv0jZr3KPjo4O7L1XJzpuuPqPBiQ81CNarRq/YZLVZBlXtS60vV2QFv w==;
X-CSE-ConnectionGUID: 6ZFoL0UUQLOyIujF4POrBw==
X-CSE-MsgGUID: CJl5pYImTAe6n9LMiDtDSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="33463842"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="33463842"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 12:10:18 -0700
X-CSE-ConnectionGUID: cpGIOIBfRomv1fqXmuchVA==
X-CSE-MsgGUID: c6mieguCQ4GyuC45GmJIYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="152170069"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 12:10:17 -0700
Date: Thu, 10 Apr 2025 21:10:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 Runner: sync files and dirs after execution (rev2)
Message-ID: <20250410191015.im53oszxgnirob44@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250410100537.61489-1-kamil.konieczny@linux.intel.com>
 <174431043597.367.14035557419110592579@32c37dd7f93d>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174431043597.367.14035557419110592579@32c37dd7f93d>
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
On 2025-04-10 at 18:40:35 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Runner: sync files and dirs after execution (rev2)
> URL   : https://patchwork.freedesktop.org/series/147466/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16395_full -> IGTPW_12957_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12957_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12957_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12957/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12957_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@overlay-atomic:
>     - shard-rkl:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12957/shard-rkl-5/igt@kms_async_flips@overlay-atomic.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>     - shard-rkl:          [PASS][2] -> [INCOMPLETE][3] +1 other test incomplete
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16395/shard-rkl-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12957/shard-rkl-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>     - shard-tglu:         [PASS][4] -> [INCOMPLETE][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16395/shard-tglu-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12957/shard-tglu-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>   * igt@perf_pmu@all-busy-check-all:
>     - shard-dg2:          [PASS][6] -> [FAIL][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16395/shard-dg2-6/igt@perf_pmu@all-busy-check-all.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12957/shard-dg2-11/igt@perf_pmu@all-busy-check-all.html
>     - shard-mtlp:         [PASS][8] -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16395/shard-mtlp-2/igt@perf_pmu@all-busy-check-all.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12957/shard-mtlp-3/igt@perf_pmu@all-busy-check-all.html
> 
>   * igt@perf_pmu@interrupts-sync:
>     - shard-rkl:          NOTRUN -> [FAIL][10]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12957/shard-rkl-1/igt@perf_pmu@interrupts-sync.html
> 

Unrelated to change in runner, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12957_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-keep-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#8411]) +3 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12957/shard-rkl-8/igt@api_intel_bb@object-reloc-keep-cache.html
>     - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#8411])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12957/shard-mtlp-3/igt@api_intel_bb@object-reloc-keep-cache.html
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8313 -> IGTPW_12957
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_16395: e74ca4100a9da8d41d1024e16165f7fe17f09427 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12957: 16da6279b7c028e3621ad1931364ebb9bd60921f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8313: 8313
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12957/index.html
