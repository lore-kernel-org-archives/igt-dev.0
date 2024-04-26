Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F654C04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 07:57:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB0811227A;
	Fri, 26 Apr 2024 07:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXOkhpsZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3511511227A;
 Fri, 26 Apr 2024 07:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714118224; x=1745654224;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PlKpBuXfjSZQePynAO6Yqi/mNSz35E4KJ4jDzd583VM=;
 b=YXOkhpsZYcsEgzNFGWOv6CbFo/EhiXw/gUXAfjyC1km3F5ibEn1y6Vqz
 MmHZjgs7PGOw9fSCsvs7z7WV1NP2j5Ek4xOik1dyPxhsyhJguB1HKZT5H
 qfaO3pOKLdq8hJ2pgTNiJ7Xm1BM0bdWSB3uRcQ7XPTfZ4UQhC9VCJcwyB
 nszcSXBdygidCfwuQih1Qr8Nt7mgiO+REO+PrYkRaVWSD0WuN2f/Iwdst
 8VO2ZjfgcUbkFd6194AcbkO5BRrlo4GLxBwsU6x1a7Kga/3CEDzbQtVUz
 ptBhI+NNSzGfoy3aie8VOuUuIfumHu4FTb+aGr/LZ/iGClEoTu9mVUoZ+ g==;
X-CSE-ConnectionGUID: yIb/q8+VQ/2/YJu5eFlBmQ==
X-CSE-MsgGUID: E1g6oEKqTMqXuBbgHQcxWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9679420"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="9679420"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 00:57:04 -0700
X-CSE-ConnectionGUID: g7JWKQQpR/mhpM0mb6UFDw==
X-CSE-MsgGUID: yrgswGhkT7mCWeDfo31GHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="29813222"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 00:57:03 -0700
Date: Fri, 26 Apr 2024 09:56:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests=2Finte?=
 =?utf-8?Q?l=2Fxe=5Fexec=5Fqueue=5Fproperty?= =?utf-8?Q?=3A?= move skip into
 subtest (rev2)
Message-ID: <20240426075642.iaew6bxrjenpo6fz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240425143946.62074-1-kamil.konieczny@linux.intel.com>
 <171408776046.1668716.3401006703189890978@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171408776046.1668716.3401006703189890978@8e613ede5ea5>
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
On 2024-04-25 at 23:29:20 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_queue_property: move skip into subtest (rev2)
> URL   : https://patchwork.freedesktop.org/series/132042/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14657_full -> IGTPW_11072_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11072_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11072_full, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11072/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11072_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_universal_plane@universal-plane-functional@pipe-c-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11072/shard-dg1-16/igt@kms_universal_plane@universal-plane-functional@pipe-c-hdmi-a-4.html
> 
>   

Unrelated to Xe test,

Regards,
Kamil

> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11072_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-mtlp:         NOTRUN -> [SKIP][2] ([i915#8411])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11072/shard-mtlp-1/igt@api_intel_bb@blit-reloc-purge-cache.html

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7824 -> IGTPW_11072
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14657: 92b848b529903fb99d21168491692474aae4872c @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11072: 11072
>   IGT_7824: 7824
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11072/index.html
