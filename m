Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A9DC282EC
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 10:47:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85AC289135;
	Thu,  6 Mar 2025 10:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a8LyP/aj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CA489135;
 Thu,  6 Mar 2025 10:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741258039; x=1772794039;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IP7XZDb1VjAyeZsMj/dXOE2EaHcZnQCEtbqhU5tUjFs=;
 b=a8LyP/aj8hDa7b97G1hbV3f4NI5d2VWN2t9Qjz7i9vXVeyDtQhw43/uW
 M5gLSdqCxSb3jJkP+7LabJVtcNkhlJ2aSBkixlOL2zJhlym1yMcBErW6G
 qbifRXYG5NtqJFnG4Osrc0yBtCW5smCdCZ6myKjy4Jz7fb0STfyaagRg3
 LSCKaw0t/3RZ5poKLiO+tsa+jPQNdFSS1r+jm66zOpoC2ldKwyltKnNZg
 qeLNmhf6HbQTdlOVuO92JcQFmUqdAD2PpFE16OG6lgxcULp39lXG7kjJn
 ANSkg7WCRmBzAqNike/bG6xyA+pL6pchm1r998gCwuECT4X9WjyZPv+4W g==;
X-CSE-ConnectionGUID: SeDzEq6mQxaE5/37ZzMJsg==
X-CSE-MsgGUID: mMVNWnrBQXWFZPGrQJJVpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53245123"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="53245123"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 02:47:19 -0800
X-CSE-ConnectionGUID: ZqMwYbwDTvuRn4lG6x5xhA==
X-CSE-MsgGUID: pdi3I6q+Q16eZ8PFxMo1cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="119487106"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 02:47:17 -0800
Date: Thu, 6 Mar 2025 11:47:01 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 runner: Parse results harder (rev5)
Message-ID: <20250306104701.an763qx6kdkgy44b@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250305193137.295162-1-kamil.konieczny@linux.intel.com>
 <174125708249.66954.15652324430336917724@64e06c682a23>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174125708249.66954.15652324430336917724@64e06c682a23>
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
On 2025-03-06 at 10:31:22 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Parse results harder (rev5)
> URL   : https://patchwork.freedesktop.org/series/145520/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8262_full -> IGTPW_12713_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12713_full absolutely need to be
>   verified manually.

Unrelated to change in igt_results, no need for re-run.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12713_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12713/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12713_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_compute@compute-square:
>     - shard-mtlp:         NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12713/shard-mtlp-8/igt@gem_compute@compute-square.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_psr@pr-sprite-blt:
>     - shard-snb:          [SKIP][2] -> [ABORT][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-snb6/igt@kms_psr@pr-sprite-blt.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12713/shard-snb2/igt@kms_psr@pr-sprite-blt.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12713_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-keep-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][4] ([i915#8411]) +1 other test skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12713/shard-rkl-3/igt@api_intel_bb@object-reloc-keep-cache.html
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-dg2-9:        NOTRUN -> [SKIP][5] ([i915#11078])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12713/shard-dg2-9/igt@device_reset@unbind-cold-reset-rebind.html
> 
>   * igt@drm_fdinfo@most-busy-check-all@bcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#8414]) +7 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12713/shard-dg2-7/igt@drm_fdinfo@most-busy-check-all@bcs0.html
> 
>   * igt@drm_fdinfo@virtual-busy-hang:
>     - shard-dg2-9:        NOTRUN -> [SKIP][7] ([i915#8414])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12713/shard-dg2-9/igt@drm_fdinfo@virtual-busy-hang.html
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8262 -> IGTPW_12713
> 
>   CI-20190529: 20190529
>   CI_DRM_16231: 3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12713: 12713
>   IGT_8262: 8262
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12713/index.html
