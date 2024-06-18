Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6223C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 07:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB6310E5B7;
	Tue, 18 Jun 2024 07:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wg8Lj1+y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4B310E5B7;
 Tue, 18 Jun 2024 07:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718695907; x=1750231907;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VuUMiezfWDaKpr4CptfsxT9eNQrCBpYgX8M25hh4QE4=;
 b=Wg8Lj1+y5niALlJ7eyUxXSWNK2YONyUrUJZJj2jPFbrwttF+t/cbLmbc
 mck+HDVsDTPLZQEYVf1fT6a/Mcfng23QskZ0GhVnqjJBIG+uARwq99c32
 gZ/bBkX5AWjxAQ8eizcOYeGtamx7iGTJegxswT+mzhnWAKmbm4c6200DN
 KsXDY/LvGtPYAGNouiDKP/2YXpJEIwjmeRn3h+K0t2bKpqCfOQt3XjGJl
 Hg+6iSVfLMCZAY3psUPrqaRgIP7Aoh3XaGIC3kYbnuF25EHNgC+7gIrLz
 c/UppXmZ3fpQ0sZ3jJPQu91wMD5akeZYCCJmGhHdwSp8kguJR27VShTOu w==;
X-CSE-ConnectionGUID: l/8padkfThSN63dtOSE/Bw==
X-CSE-MsgGUID: vvmZntioQh2xOnbeplwIuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15317986"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15317986"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 00:31:47 -0700
X-CSE-ConnectionGUID: nc2GGWyESsufLo/SrlC1+g==
X-CSE-MsgGUID: Z/Bx2acBRkSwLwwbRgNCNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="45824160"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 00:31:46 -0700
Date: Tue, 18 Jun 2024 09:31:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 lib/intel_chipset: add Battlemage support
Message-ID: <20240618073126.tt3bzwqlbn5z6i64@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240617-bmg_chipset_info-v1-0-289e3215141e@intel.com>
 <171866224243.99140.471730192670833258@a6498e030952>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171866224243.99140.471730192670833258@a6498e030952>
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
On 2024-06-17 at 22:10:42 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/intel_chipset: add Battlemage support
> URL   : https://patchwork.freedesktop.org/series/134937/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14951_full -> IGTPW_11263_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11263_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11263_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11263/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11263_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11263/shard-dg2-8/igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_setmode@basic@pipe-b-hdmi-a-3:
>     - shard-dg2:          [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14951/shard-dg2-7/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11263/shard-dg2-6/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
>     - shard-tglu:         [PASS][4] -> [ABORT][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14951/shard-tglu-10/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11263/shard-tglu-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
> 

Unrelated to change.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11263_full that come from known issues:
> 
> ### IGT changes ###
> 
...cut...
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7889 -> IGTPW_11263
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14951: 9063661ba438a2b1f01b73b6035be9a7156c4345 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11263: 11263
>   IGT_7889: 9dca15da37f2a385b04427eb39cd460224d09c25 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11263/index.html
