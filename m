Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE4AC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 14:12:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD6410FF28;
	Fri, 19 Apr 2024 14:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HRykaWOQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C7810FF21;
 Fri, 19 Apr 2024 14:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713535935; x=1745071935;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=miEgCPyv+L/Rm5QLsnWF/KhJVO37Gz7gVCeD73P/0sU=;
 b=HRykaWOQK49g3R0IkWT8DPBmw6NxFV3BRYtyChpmoxHAoDvsUgnvErQ6
 2XxeOs40kaCdTMVsVg4ukVjhH351Q0EMi8IWSVMYlBPnWms0hC4l/gwUb
 82GUbEJRuTHrpccgR49V4tX0QIWIZ2yJ5xl0odXLBVTg0ZPFUq4OGlZfK
 zjLwoNCZW1aLeHwW2b0pc7HbdI0CCUZF0CBpGrXEgD9VWExsVX5n1aJr/
 WNMQHrNtxCqF0SHQh6rhTtSYJIDDhqDW90PTPgW/rGHoKJPIAyCAvYQ6m
 LWLneGpi3rNieh3Qw253qVRVMcYz/pdhixZnN0mHNeY31j78RIgc9n1Y2 g==;
X-CSE-ConnectionGUID: 0CqQ8lqSQUG2B/W6oVx27A==
X-CSE-MsgGUID: CGSA8R+JQZuGzmPs5u9t/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="12973881"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="12973881"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:12:14 -0700
X-CSE-ConnectionGUID: pKB/oeErTAmjnHlEFLnwiA==
X-CSE-MsgGUID: WX5KzWkkTB24jz1kTS8CUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23417711"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 07:12:13 -0700
Date: Fri, 19 Apr 2024 16:12:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for Put
 "Run type" highest in documentation hierarchy
Message-ID: <20240419141210.cjkvcz4r2ybm2x37@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20240417111324.3231762-1-katarzyna.piecielska@intel.com>
 <171340514262.1483937.7199588920403383678@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171340514262.1483937.7199588920403383678@8e613ede5ea5>
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
On 2024-04-18 at 01:52:22 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Put "Run type" highest in documentation hierarchy
> URL   : https://patchwork.freedesktop.org/series/132552/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14593_full -> IGTPW_11031_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11031_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11031_full, please notify your bug team (&quot;I915-ci-infra@lists.freedesktop.org&quot;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11031/index.html
> 
> Participating hosts (9 -> 10)
> ------------------------------
> 
>   Additional (1): shard-snb-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11031_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-edp-1:
>     - shard-mtlp:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14593/shard-mtlp-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11031/shard-mtlp-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html
> 

This is unrelated to change in tests documentation,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11031_full that come from known issues:
> 

...cut...

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7810 -> IGTPW_11031
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14593: 75418ec1fe7737396419e6447005b10e666aeaec @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11031: 11031
>   IGT_7810: 189483744e9ff56ea573e07a049c5365404c7ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11031/index.html
