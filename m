Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B8EC3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 10:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0F310E90A;
	Thu, 10 Apr 2025 10:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PnAPF1qK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0122810E8FF;
 Thu, 10 Apr 2025 10:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744280148; x=1775816148;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=A9N9FRvVHRfJ+tZw6gyxeyq2+Z5PaOEgcUxfi+VCOcM=;
 b=PnAPF1qKgxmtNW/q0UYYv3Og7cPpls4kbqEqMgzh0AlR4NgcWjBXuJHg
 4RdiTtrgkPaGSoXntS0iTyLrZWVTC1LYJGsOK8lL3O3kgLs+3veXMWlNV
 e4uUD1heHS2Iz0/DpL97VA7u7KTOpt4GANDA9xwhuxAzoh/u4FuZ143Ka
 QnUw12cmE3RA/eTZ8VO8+DwiMZ7LHSFcN8kp3x823dwIqgxt8kxXeFbkK
 05tSWaUFVA0SF96LOwR1TrG5Qq1ONccq6Hs3ugQ5As+/zoYHwq4H9rKlS
 dQgcQStGIeCtS7RQM2JX1MRtT2qGl1HPLS07oAh19Jf+PiNxH/xouPB3F w==;
X-CSE-ConnectionGUID: 9IbgVhvWSfe9jkDFLlUsiA==
X-CSE-MsgGUID: o3QUgFQsQEG16AeymLlloA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45804922"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="45804922"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 03:15:47 -0700
X-CSE-ConnectionGUID: IuolJRYuRHiyfR0kxnoM2A==
X-CSE-MsgGUID: gV059XcpTWGI/d8miNoH/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="128725929"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 03:15:46 -0700
Date: Thu, 10 Apr 2025 12:15:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Runner: sync files and dirs after execution
Message-ID: <20250410101527.wuzznolmmy5fif6r@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250409125543.49920-1-kamil.konieczny@linux.intel.com>
 <174424009922.54413.14653558951661113581@e6b6f09ec485>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174424009922.54413.14653558951661113581@e6b6f09ec485>
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
On 2025-04-09 at 23:08:19 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Runner: sync files and dirs after execution
> URL   : https://patchwork.freedesktop.org/series/147466/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16390_full -> IGTPW_12948_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12948_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12948_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12948/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12948_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a2:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12948/shard-rkl-3/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html
> 

Unrelated, patch touches only igt_runner. No need for respin
as I just send v2.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12948_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][2] ([i915#8411])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12948/shard-dg2-2/igt@api_intel_bb@blit-reloc-keep-cache.html

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8311 -> IGTPW_12948
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_16390: a4fa94e2a40459883139bc058d8c7b47514bb713 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12948: 5d2dde06635605093d3ebb80004275d2a11bb5a7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8311: 851a9c1cb1a690d8c527f26c49c250ec583af65e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12948/index.html
