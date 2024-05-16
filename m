Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0D1C25B74
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 11:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080EB10EC81;
	Thu, 16 May 2024 11:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lr+YpT/O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9057810EC7A;
 Thu, 16 May 2024 11:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715859344; x=1747395344;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=F181keCDJcjykfBeIXQ2NeZ3Aza+N080u1Qv/msyzhE=;
 b=lr+YpT/O49kkUSmJfqtmZjph4YDtBOdwAostTzrqetP/mOtIkU/4Aabm
 5D1ZvWARI9x7wbIHHr1a/Sgao/QkmDtpEoja2dDO0GKJBLWtXepQ226MI
 q9BJzMNyH0/qwC+Ji4+QB2p7j792vTTvW0GFPkljIoCZFdj6r1XKtDPna
 NxJsdKr1H03KVE8Qa463ZCvtMghfTBU7MkMQMrZgjFBzAsZVOI+Zwl3Wu
 bBSeGQD3k3hGdMCuDm+AJdxkKJouwG/zSGY6aQ5NAm1tzoN05nosw0HUS
 cTsjyemVz9CULyR0YVjzBta2sxeck7e/M/7A8JlS68BUPd9FWGxKjmUJG w==;
X-CSE-ConnectionGUID: 5pproI+OQHStZOIDjw1Wcg==
X-CSE-MsgGUID: YG+n3zsnS3yLo6qjXBJdJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23366723"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="23366723"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 04:35:42 -0700
X-CSE-ConnectionGUID: 2BFVvc2oQmG0sqUOWYgKeA==
X-CSE-MsgGUID: LnVVWIGXTV2QVZebF0X/RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="68852764"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 04:35:40 -0700
Date: Thu, 16 May 2024 13:35:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/xe_tlb: Test to validate TLB invalidation
Message-ID: <20240516113537.vklcfb4ebs5ahx6c@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 I915-ci-infra@lists.freedesktop.org
References: <20240515070154.6511-1-sai.gowtham.ch@intel.com>
 <171578747937.2118792.17455942160174740950@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171578747937.2118792.17455942160174740950@8e613ede5ea5>
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
On 2024-05-15 at 15:37:59 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_tlb: Test to validate TLB invalidation
> URL   : https://patchwork.freedesktop.org/series/133641/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14764_full -> IGTPW_11144_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11144_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11144_full, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11144/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11144_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-mid:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11144/shard-dg2-10/igt@kms_plane_alpha_blend@constant-alpha-mid.html
> 
>   * igt@kms_psr@psr2-sprite-plane-move@edp-1:
>     - shard-mtlp:         [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14764/shard-mtlp-2/igt@kms_psr@psr2-sprite-plane-move@edp-1.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11144/shard-mtlp-5/igt@kms_psr@psr2-sprite-plane-move@edp-1.html
> 
>   

These are unrelated to new xe_tlb test.

Regards,
Kamil

> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11144_full that come from known issues:
> 
> ### IGT changes ###
> 

...cut...

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7854 -> IGTPW_11144
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14764: cd3ae03d1d2d6a680b4637e99623166340b4dc9f @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11144: 11144
>   IGT_7854: 8abb25ffe588020cf0b797d60ad1f3f9e7c0764a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11144/index.html
