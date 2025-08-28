Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EA6C8303F
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 10:21:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C8010E96D;
	Thu, 28 Aug 2025 10:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UsMuz2RX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471D610E95F;
 Thu, 28 Aug 2025 10:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756376495; x=1787912495;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pYMFRuuuJWtStL24mJMS4qYxfAfJAb6bCBTyUcBV4lk=;
 b=UsMuz2RXN86FyNOJLJILttdczF8ItB9RmfWv10Pcu82pryZjOnbL57Gb
 +Goj0et5AqQnkBZTrFmbARj/nDpRdxB4JgXzVT40rMRlM9sxyhNTzggm/
 Pqu18P2/J0FrrfbgtE5XIhu6LFS3tGQSeDWeseA4CqxVritnHC5z76QoI
 ffMHzfIQ496xWay7tGyJw73mSi9WuEdQsfLllpjQ5tihd9hrIBZp7R1df
 22nd2k7Pu4g2WZ+GyYyo0MGO4/rHQi0efkAEbHozXxf11CS3fmcNJaafq
 RoNg2PjPa/Wp4nIcOmvaElFfGHB1JqU4hwlfR6NnRxcTle/RGrxQFgRiN w==;
X-CSE-ConnectionGUID: OLaCAMxaR3e2A3IAbeEJMQ==
X-CSE-MsgGUID: xq3drq2zSru4Bd9yxTb1sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58741815"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58741815"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 03:21:34 -0700
X-CSE-ConnectionGUID: 660QJ6nQRUa1dlteWQn5Bw==
X-CSE-MsgGUID: JSvyg8X4QQW8zn/3X4pGdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="201040160"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 03:21:34 -0700
Date: Thu, 28 Aug 2025 12:21:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXI=?= =?utf-8?Q?e?= for
 runner/executor: Abort if dmesg is flooded (rev5)
Message-ID: <20250828102115.craujdz5pcj2khru@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250826125329.109160-1-kamil.konieczny@linux.intel.com>
 <175623034700.271012.1347811312581079439@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175623034700.271012.1347811312581079439@1538d3639d33>
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
On 2025-08-26 at 17:45:47 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner/executor: Abort if dmesg is flooded (rev5)
> URL   : https://patchwork.freedesktop.org/series/150246/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8511 -> IGTPW_13641
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13641 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13641, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13641/index.html
> 
> Participating hosts (43 -> 43)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13641:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp7:
>     - bat-mtlp-9:         NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13641/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp7.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1:
>     - bat-rpls-4:         [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8511/bat-rpls-4/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13641/bat-rpls-4/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1.html
> 

Unrelated to runner change.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13641 that come from known issues:
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8511 -> IGTPW_13641
>   * Linux: CI_DRM_17071 -> CI_DRM_17072
> 
>   CI-20190529: 20190529
>   CI_DRM_17071: 03ce398526a784c3afb2f18cb7d04b80f1a90ecf @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_17072: 4b94f8fef771cb0b1d0131675e2d794ef6464907 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_13641: 13641
>   IGT_8511: 8511
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13641/index.html
