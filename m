Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA179C48BF6
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 12:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF6110E45D;
	Wed, 21 Feb 2024 12:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Azn+VeJv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE7A10E45D
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 12:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708519762; x=1740055762;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RMdhaPDaX6jqwluxTXpMMfR9yrFfC1C2nlIiEFz0eRM=;
 b=Azn+VeJvhufXFCz0+g0VeuoGm8Q0rRLQP7WfiPNKu+K99O8PKy0FR44u
 M9fsV/L3dF/iaduYcwi1b9a2TXXAc9mkdghXlVUcgaeUDy4SXmbXF8pHG
 Gub+D0TcxebMpH8le2ZNb6RVN92IWfD69PsjWtvSsbhRh7BzmVbgyF+8c
 3IgkwbFAYUM6Em8/z0MalmpAopy5DG4ZQaDlsZrVk+CEAajxVTmKYC+F0
 r4IzWWnjUJqIWEPQOKq1Vk5tD23GseFw4DijTTaY8m1uoD7R35e+UXgKm
 vOl2YNiFyShBzPqHs4EhDPtpH+7I9w/S43UjWrzgEOqLnyg8dymWJdy+A w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2788731"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2788731"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 04:49:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5025675"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 04:49:21 -0800
Date: Wed, 21 Feb 2024 13:49:17 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMva21z?=
 =?utf-8?Q?=5Funiversal=5Fplane?= =?utf-8?Q?=3A?= Re-work expectations for
 non-intel hw (rev2)
Message-ID: <20240221124917.hvvoue5yomsqg3r4@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
References: <20240215222034.327548-1-robdclark@gmail.com>
 <170808183627.36543.9529832699793154418@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170808183627.36543.9529832699793154418@8e613ede5ea5>
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
On 2024-02-16 at 11:10:36 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_universal_plane: Re-work expectations for non-intel hw (rev2)
> URL   : https://patchwork.freedesktop.org/series/128450/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14281 -> IGTPW_10683
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10683 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10683, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10683/index.html
> 
> Participating hosts (36 -> 37)
> ------------------------------
> 
>   Additional (3): bat-atsm-1 bat-arls-2 bat-arls-3 
>   Missing    (2): fi-apl-guc fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10683:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@dmabuf@all-tests@dma_fence_chain:
>     - fi-elk-e7500:       [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14281/fi-elk-e7500/igt@dmabuf@all-tests@dma_fence_chain.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10683/fi-elk-e7500/igt@dmabuf@all-tests@dma_fence_chain.html
> 

This is unrelated to change in kms test,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10683 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_mmap@basic:
>     - bat-atsm-1:         NOTRUN -> [SKIP][3] ([i915#4083])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10683/bat-atsm-1/igt@gem_mmap@basic.html
> 
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7715 -> IGTPW_10683
> 
>   CI-20190529: 20190529
>   CI_DRM_14281: f9855a4be31b723fe67e9b6f6cfb0df7760cd6d8 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10683: 10683
>   IGT_7715: 7715
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10683/index.html
