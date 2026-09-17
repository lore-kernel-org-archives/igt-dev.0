Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BA5C88E72
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 09:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A56F10E46A;
	Thu, 17 Sep 2026 09:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSXSJQNA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F0F10E46A;
 Thu, 17 Sep 2026 09:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789636633; x=1821172633;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5VDjUQxNMezmT0Wu39gxFpfaipUysbbuELRlIY/MROg=;
 b=GSXSJQNAQtFf1ybIC66EDgccQsLdSAfza66v2oh+u4WMs8xNmt+7XyRV
 GMzC7IPtMvq8CvQ1MDXEdHpsYZ+sTCSTQwiQusxzvYme6/KFS/iKZmwwf
 4tSDwJRaBbJEcD1nwGp0OtrozV+acQzngTbj7Hf9TV6qTiAu2ibBHdvX0
 KMwlY/0d4b8td2Cgdncdv5JqDlcW5Ed2WQSBDzBr3r7c0ybPR69yG4Tz4
 khZw70eXDajxhyB32QDQOL3+4ldLN30XTAUxpivITknR65M3e2hhWlAOm
 VesDM9REWhxYYfu9EyxOMtGG2dExWBLeeLqbDsJFmW8n/AVcFp1h+A+aU A==;
X-CSE-ConnectionGUID: kH0RdqSWQiO1BjE1YCFXww==
X-CSE-MsgGUID: fHxE09N0TDSjqM8bTZ6RmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89175711"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89175711"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 02:17:13 -0700
X-CSE-ConnectionGUID: ODil/qwVSOm+dZrIM1cc4g==
X-CSE-MsgGUID: vKRzW+USRoqwmST1W7DwxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2081373"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 02:17:12 -0700
Date: Thu, 17 Sep 2026 11:17:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 runner: create results incrementally
Message-ID: <20260917091709.edub7s7wbjuxdz3c@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260916154740.130190-1-kamil.konieczny@linux.intel.com>
 <178962895878.175968.15135350259202369493@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178962895878.175968.15135350259202369493@61270ab9df2a>
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
On 2026-09-17 at 07:09:18 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: create results incrementally
> URL   : https://patchwork.freedesktop.org/series/174309/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_19156_full -> IGTPW_15855_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15855_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15855_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15855/index.html
> 
> Participating hosts (11 -> 10)
> ------------------------------
> 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15855_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rps@reset:
>     - shard-dg2:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19156/shard-dg2-1/igt@i915_pm_rps@reset.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15855/shard-dg2-8/igt@i915_pm_rps@reset.html
> 
>   * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:
>     - shard-tglu:         [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19156/shard-tglu-8/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15855/shard-tglu-3/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
> 

Unrelated.



Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_19156_full and IGTPW_15855_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@kms_properties@connector-properties-legacy@pipe-a-vga-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.23] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15855_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][5] ([i915#8411])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15855/shard-rkl-8/igt@api_intel_bb@blit-reloc-keep-cache.html
> 
...cut...
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_9099 -> IGTPW_15855
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_19156: bb38af66c2f21340a7c081afbb7ace249357fbb5 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_15855: 0c2fe5825d97239cdfac6c26fccc097d457872cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_9099: 9099
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15855/index.html
