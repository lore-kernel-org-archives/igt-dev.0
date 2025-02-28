Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B323BC282C1
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 15:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5713510ECD0;
	Fri, 28 Feb 2025 15:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fBMotx4A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D2410ECD0;
 Fri, 28 Feb 2025 15:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740755616; x=1772291616;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+dwmsHQw2Go+ztPoTCIndtF/mXTlYs7Aal8y+N1la1U=;
 b=fBMotx4APhbzTq8p8kyYnLcIBsDhj6H1YSrDpnhXil0JwcI1fcqMafjx
 rv5G40QpaOtvr1E/oOGQHV9xpQNdnMDJT3PTh0ZywmHqYpqFSh4UF+Sme
 0YGpXtBNb8ZovA2+bbuqatRxknr6epbC6m9WdYC7KtT0p4SUdzQHXBrqx
 NGek+ONS6JQB/Vdfceb9ZO0IFOl93thXSZYwVYoxN7B+oDHGhXF0bvzl9
 Ld6WLVJpMCITTguA6yuc1LXzlrjpdHNQIa35pwmAg7LnCEcvuonl1WJ49
 JzStxqtgsbPGeuJYWLNFQ52ZQZEtOgNw5vxt8hYt5EhZC+AOPp+xd6YBF Q==;
X-CSE-ConnectionGUID: mMboKWYgQCeocL1iTogdLA==
X-CSE-MsgGUID: 7TAI/S6lTTKKPu8cmE+ZAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41712171"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="41712171"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 07:13:34 -0800
X-CSE-ConnectionGUID: fzb3t0/ERyKNOiD13GHc5g==
X-CSE-MsgGUID: 3VBtmVbwRIiekjHq+EzinQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="117548842"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 07:13:31 -0800
Date: Fri, 28 Feb 2025 16:13:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_series_st?=
 =?utf-8?Q?arting_wit?= =?utf-8?Q?h?= [i-g-t,1/2] lib/syncobj: Make running
 under Valgrind quiet
Message-ID: <20250228151315.2b3uxyd6k6lrqe2g@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250225124454.1976-1-tvrtko.ursulin@igalia.com>
 <174073128581.3129224.13410972400796106331@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174073128581.3129224.13410972400796106331@b555e5b46a47>
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
On 2025-02-28 at 08:28:05 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/2] lib/syncobj: Make running under Valgrind quiet
> URL   : https://patchwork.freedesktop.org/series/145403/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16190_full -> IGTPW_12665_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12665_full absolutely need to be
>   verified manually.
>   

These are unrelated, no need for re-run.

Regards,
Kamil

>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12665_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12665/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12665_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1:
>     - shard-tglu:         [PASS][1] -> [FAIL][2] +2 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16190/shard-tglu-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12665/shard-tglu-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a3:
>     - shard-dg2:          [PASS][3] -> [FAIL][4] +3 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16190/shard-dg2-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a3.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12665/shard-dg2-6/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a3.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-snb:          [PASS][5] -> [INCOMPLETE][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16190/shard-snb7/igt@perf_pmu@module-unload.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12665/shard-snb4/igt@perf_pmu@module-unload.html
>     - shard-tglu:         [PASS][7] -> [INCOMPLETE][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16190/shard-tglu-9/igt@perf_pmu@module-unload.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12665/shard-tglu-6/igt@perf_pmu@module-unload.html
> 
>   * igt@prime_vgem@fence-write-hang:
>     - shard-glk:          NOTRUN -> [ABORT][9]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12665/shard-glk4/igt@prime_vgem@fence-write-hang.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12665_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8411])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12665/shard-dg2-5/igt@api_intel_bb@object-reloc-purge-cache.html
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#11078]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12665/shard-tglu-3/igt@device_reset@cold-reset-bound.html


...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8249 -> IGTPW_12665
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_16190: 8541a64154cd8b9c07977dedc1d22883f43279a0 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12665: 12665
>   IGT_8249: 8cb34f260a285ff7eaa3d79cf71f0a4960e4c890 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12665/index.html
