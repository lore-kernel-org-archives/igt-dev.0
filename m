Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46EFC04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 15:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA99910EF06;
	Fri, 17 May 2024 15:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l4cKOK67";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AD810E2E6;
 Fri, 17 May 2024 15:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715959838; x=1747495838;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CDe4wyOevg07VRwJsdYEEoi9b/4L6+lYzgsE5i5pVzA=;
 b=l4cKOK67NkuT4NFnPCJzB7gZfFi7kLKM5O5zQEqWTp/J6SbmekYrv0a4
 aJM2VvCrqvJE58OTuJ+Uz3WJgnyjzC7tLHeaZ82ze/pyeflwZF4jVKD4K
 iSj9060HyflKJDFCtz1T5Sixq/L4ZlCyFYQ5OjOvgTZdT5cZPGC9114ev
 Rdme930PvxpeuY4NkrPcLby5dufnWVesZdE1eIl0Do5FBUua5p++kTSoK
 OLhJ1wBRNg6md6o/TV0XFtuOSYlFVObr6xNh4f8XFZ8HHY2zify4KZ39y
 z2+r1Ib4GJLp5Xgmz3BMaJVLZRv1r6RThR5JIhnc/+D93EHngLiHMNfzn Q==;
X-CSE-ConnectionGUID: ptQlVd/YQ3+QAfJbL5ziNg==
X-CSE-MsgGUID: PFSlSU6LQDGNqj7TvEcLGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="15932475"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="15932475"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 08:30:37 -0700
X-CSE-ConnectionGUID: hRQwgwVHTyi+iml+sg2Buw==
X-CSE-MsgGUID: Aeexd54WS5W1VMKqC+G30g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="36238797"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 08:30:35 -0700
Date: Fri, 17 May 2024 17:30:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests=2Finte?=
 =?utf-8?Q?l=2Fkms=5Fbig=5Ffb=3A_Introducing_this_restrictio?= =?utf-8?Q?n?=
 to optimize the test execution time on simulation (rev2)
Message-ID: <20240517153032.2bh6bsh26utg2vjt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pranay Samala <pranay.samala@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240516102817.424967-1-pranay.samala@intel.com>
 <171589457544.2122990.3096183437259050256@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171589457544.2122990.3096183437259050256@8e613ede5ea5>
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
On 2024-05-16 at 21:22:55 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/kms_big_fb: Introducing this restriction to optimize the test execution time on simulation (rev2)
> URL   : https://patchwork.freedesktop.org/series/133675/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14775_full -> IGTPW_11150_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11150_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11150_full, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11150/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11150_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_ctx_shared@q-smoketest-all:
>     - shard-dg2:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14775/shard-dg2-6/igt@gem_ctx_shared@q-smoketest-all.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11150/shard-dg2-3/igt@gem_ctx_shared@q-smoketest-all.html
> 
>   * igt@kms_pm_dc@dc5-dpms-negative:
>     - shard-dg1:          [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14775/shard-dg1-16/igt@kms_pm_dc@dc5-dpms-negative.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11150/shard-dg1-18/igt@kms_pm_dc@dc5-dpms-negative.html
> 

This is unrelated to kms_big_fb,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11150_full that come from known issues:
> 
> ### IGT changes ###
> 
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7858 -> IGTPW_11150
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14775: 3b6a503228b84c010794599203ac3e1e3d349bab @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11150: 11150
>   IGT_7858: 133c90d6aabcd90871e36946317c90ee83c2f847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11150/index.html
