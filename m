Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3ACD3B7E2
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 14:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7C210E452;
	Mon,  8 Dec 2025 14:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6ALIc/j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E4210E452;
 Mon,  8 Dec 2025 14:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765203159; x=1796739159;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=D9MWjeCaJETKRxRnurolgvDu7c/zSyrWXFOxyTpAODs=;
 b=I6ALIc/jvhql7JZVI1YNPe1tThQucM63eHUcnScWnwxMEDBdzSW+GMuE
 t7ObMQDRAsLjj/FdqdE/4nCm/qLZgqpaCSIsNHaYuYBaIyS6/Ys43h8OB
 hGdtNGbRcmFtI6N737gIglwD0KuJF4HTVu2XoV9X/8V284eSdONDnPtmm
 SRtCiUMocDwAqXtCeDgASRqY8VMaVq+Cgw8x8YtEADTIQOk0gRZYV15EU
 obguCUE62+K30wFgVEJaP96rvki3p5mZPGMQydOyI8pD+6IDB/xX007NK
 MHmWjObX+fZko2R4KqFpKb+7/a3IQua0Tg/caGrxnbTz/wWYHw8eFU3C9 A==;
X-CSE-ConnectionGUID: rwNekf7gRLCSkCE+jkQdlA==
X-CSE-MsgGUID: abww5Dj1SLWXQr0+73oa0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="89795308"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="89795308"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 06:12:38 -0800
X-CSE-ConnectionGUID: qOZRc9mPS4KESBMW0BLmHw==
X-CSE-MsgGUID: XB4us02uTF2UOLAhhKnGqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="226597923"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 06:12:37 -0800
Date: Mon, 8 Dec 2025 15:12:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 intel-ci: unify Xe and i915 block/test/lists (rev2)
Message-ID: <20251208141218.trmqtlbb3n4i7j6f@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20251204213632.155894-1-kamil.konieczny@linux.intel.com>
 <176507101843.64349.12942765328652422884@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176507101843.64349.12942765328652422884@a3b018990fe9>
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
On 2025-12-07 at 01:30:18 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci: unify Xe and i915 block/test/lists (rev2)
> URL   : https://patchwork.freedesktop.org/series/158391/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8657_full -> IGTPW_14161_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14161_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14161_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14161/index.html
> 
> Participating hosts (10 -> 11)
> ------------------------------
> 
>   Additional (1): shard-dg2-set2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14161_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
>     - shard-tglu:         [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8657/shard-tglu-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14161/shard-tglu-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
> 

This is unrelated to change,

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_8657_full and IGTPW_14161_full:
> 
> ### New IGT tests (2) ###
> 
>   * igt@kms_vblank@ts-continuation-modeset@pipe-a-vga-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.39] s
> 
>   * igt@kms_vblank@ts-continuation-modeset@pipe-b-vga-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.26] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14161_full that come from known issues:
> 
...cut...
