Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B3AC54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 11:10:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B41910F2B8;
	Fri, 22 Mar 2024 11:10:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QRKM6uVg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4AA910F2B8;
 Fri, 22 Mar 2024 11:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711105829; x=1742641829;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ysBbHPqLrC8d/hzsz6CALpJXsNHBtJ3k8HiuCXn7Nw4=;
 b=QRKM6uVgZ4iHHST1Czv0VZ54/F3jA7G6AQnHgGaW1yJEaeNnaR5L6EDb
 BrzikHAxqRt1ciOBOZIZAUiB/kfGdQqigxiiKSkd8W+iX0yrni+pDyvvi
 Fp13D193eDvmHiIhpMywskzb4hwTA2ghQxf4ETHqZWmmAH6BzyvSkxrS9
 JI8t2xVK4H5XRh7C0JQOZZVl3SYtfSaD3o0VcJRgRJh/WA32Jyb/CY+gY
 DqfqmMzPwDtUovrjg7W3OjavKi9HSKnMugjMXadzRcOOlAHubuSbQbyl7
 8jUHr1SHgAiJa2sjb8+//5R6PLXNXizYFZLaSovtOZ1oQvqgzpiGMnB9Q g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6042815"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="6042815"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 04:10:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="14969651"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 04:10:27 -0700
Date: Fri, 22 Mar 2024 12:10:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Hung <alex.hung@amd.com>, I915-ci-infra@lists.freedesktop.org,
 lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_series_start?=
 =?utf-8?Q?ing_wit?= =?utf-8?Q?h?= [1/2] lib/amd: check output has hpd before
 trigger hotplug
Message-ID: <20240322111024.mtmrb4iq6nmaohh7@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240321020354.843729-1-alex.hung@amd.com>
 <171106991688.941104.1117244549826403356@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171106991688.941104.1117244549826403356@8e613ede5ea5>
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
On 2024-03-22 at 01:11:56 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/2] lib/amd: check output has hpd before trigger hotplug
> URL   : https://patchwork.freedesktop.org/series/131396/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7773_full -> IGTPW_10868_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10868_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10868_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10868/index.html
> 
> Participating hosts (10 -> 9)
> ------------------------------
> 
>   Missing    (1): shard-snb-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10868_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_create@create-clear@smem0:
>     - shard-snb:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7773/shard-snb6/igt@gem_create@create-clear@smem0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10868/shard-snb7/igt@gem_create@create-clear@smem0.html
> 
>   * igt@gem_eio@kms:
>     - shard-dg1:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10868/shard-dg1-13/igt@gem_eio@kms.html
> 

Unrelated to amdgpu test, no need for respin (already merged).

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10868_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#8411])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10868/shard-dg1-14/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#8411])

...cut...

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7773 -> IGTPW_10868
> 
>   CI-20190529: 20190529
>   CI_DRM_14459: b8290992108644cb99d7d9db2921bb25369ead3c @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10868: 10868
>   IGT_7773: 7773
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10868/index.html
