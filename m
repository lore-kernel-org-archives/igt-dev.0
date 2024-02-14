Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26A5C48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 15:10:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809C610E37E;
	Wed, 14 Feb 2024 15:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzeCCwjF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D12610E1F4;
 Wed, 14 Feb 2024 15:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707923441; x=1739459441;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wu0JI0h4/9i153JmEzErhJwA2HcWR/zDoRHMdXaaiHc=;
 b=gzeCCwjFg2wV4wiDZv/K+C0WmCgF3Y6VKGWBBiQPCAJAiEkxs+ZlOCQU
 /W4KY8+HGVSnVamQhpPIr43GDlbgWoyMy4PqSKSuKZYYDWDxR0n4tFSmH
 yIZLOH+wPH1MRNa/lxdvj7mKfacIn4tJ4uch6UDRgI1D3NeBlPPpTCOTt
 5sl9MB66rJaL2ZFh71lQmJVWbXesOTO/aR4BD4epAcL6nApk1b/+bL9PJ
 ssOry/FBT2L3P7U/gCWRZaXKIHZ1fE3Ho3RGtEpZcjITirffBsU5j31lj
 Jryxs4aHZIUA0z/9k+JQlgBsmA2HipjihWYx09PKEORuJJIGbX/rFeLjl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="12604208"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12604208"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 07:10:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="40702980"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 07:10:38 -0800
Date: Wed, 14 Feb 2024 16:10:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 benchmarks/kms_vblank: Add XE support
Message-ID: <20240214151035.r62m7rtva7t47nzo@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240212150113.736295-1-bhanuprakash.modem@intel.com>
 <170776664734.1182955.973861211145205994@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170776664734.1182955.973861211145205994@5338d5abeb45>
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
On 2024-02-12 at 19:37:27 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: benchmarks/kms_vblank: Add XE support
> URL   : https://patchwork.freedesktop.org/series/129779/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14255_full -> IGTPW_10662_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10662_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10662_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10662/index.html
> 
> Participating hosts (8 -> 9)
> ------------------------------
> 
>   Additional (1): shard-snb-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10662_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-dg2:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14255/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10662/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_psr@psr2-sprite-plane-onoff@edp-1}:
>     - shard-mtlp:         [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14255/shard-mtlp-7/igt@kms_psr@psr2-sprite-plane-onoff@edp-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10662/shard-mtlp-6/igt@kms_psr@psr2-sprite-plane-onoff@edp-1.html
> 

Unrelated to change in benchmark, no need for respin.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_14255_full and IGTPW_10662_full:
> 
> ### New IGT tests (4) ###

...cut...

> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7710 -> IGTPW_10662
> 
>   CI-20190529: 20190529
>   CI_DRM_14255: 46cf1a7da57fc4fd2306d52aea58a02c7eb06cce @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10662: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10662/index.html
>   IGT_7710: d87a5d85a60fba1283821d5212c3aece64cb36ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10662/index.html
