Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13432C25B78
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 14:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BD910F5B7;
	Wed, 22 May 2024 14:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDqGWYMX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF8C10F53E;
 Wed, 22 May 2024 14:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716387364; x=1747923364;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qn3HHahBd1k2T/81DlW4FLrzJBEraJRAtN4rrL/6bkw=;
 b=oDqGWYMXKNYlKqUB6Lqn8tRzu1BMbvIwEBdWUUX1///srw7A3qAqVcWW
 yuUV1a0mpgVJt6dpFM16FGFWHrmqEYu2yNRui0yO89EPBYHXFDhEBAQIv
 7+zzio5u5qAmwO0LMYfiCxKH76RE2D0dR/BHJoQspAzppsc8WrbvMo74/
 BDhFKD9r8XrHLyp+zeKc5s9Tocnp62gFrcFhb/uHNfxbi8JgNYaj0N6Wk
 AJv2af2i7V9w1DNEaWOe/soK1yRkrvtHzOdWDMUZoGjPohKWxU6RbEp4s
 pYVGESHp1VQ78aHZ48du89CqddhO6N2Zqsq/YbJu998t8SqCsZCqvTpmw w==;
X-CSE-ConnectionGUID: br/IUL8eQKmAhGv1BwvmCw==
X-CSE-MsgGUID: JrFLFF5yTmKvNUbJ8opk4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="30173348"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="30173348"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 07:16:03 -0700
X-CSE-ConnectionGUID: Rnpu5ZOhTNeeFGPS4ncapw==
X-CSE-MsgGUID: bEOzBHtlRkC5HfOOp4JYug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="64143630"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 07:12:34 -0700
Date: Wed, 22 May 2024 16:12:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyX?= CI.xeFULL: failure for L3 bank mask (rev2)
Message-ID: <20240522141217.2hch65qfhass5gth@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240503171539.295801-1-francois.dugast@intel.com>
 <171638258365.2167033.3954157355661267984@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171638258365.2167033.3954157355661267984@8e613ede5ea5>
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
On 2024-05-22 at 12:56:23 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: L3 bank mask (rev2)
> URL   : https://patchwork.freedesktop.org/series/133176/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7867_full -> XEIGTPW_11175_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11175_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11175_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 2)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11175_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11175/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>   * igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][2] -> [ABORT][3] +8 other tests abort
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-433/igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-6.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11175/shard-dg2-466/igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-6.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
>     - shard-dg2-set2:     [SKIP][4] ([Intel XE#1201] / [Intel XE#653]) -> [ABORT][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11175/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
>

Above regressions are unrelated to change in xe_query test,

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
>     - {shard-lnl}:        [SKIP][6] ([Intel XE#656]) -> [ABORT][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11175/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - {shard-lnl}:        NOTRUN -> [ABORT][8]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11175/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_psr@psr2-basic:
>     - {shard-lnl}:        [PASS][9] -> [ABORT][10] +2 other tests abort
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7867/shard-lnl-7/igt@kms_psr@psr2-basic.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11175/shard-lnl-6/igt@kms_psr@psr2-basic.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_7867_full and XEIGTPW_11175_full:
> 
> ### New IGT tests (2) ###
> 
>   * igt@xe_query@multigpu-query-topology-l3-bank-mask:
>     - Statuses :
>     - Exec time: [None] s

Was it a SKIP?

> 
>   * igt@xe_query@query-topology-l3-bank-mask:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.0] s
> 

This looks good.

Regards,
Kamil
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11175_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####

...cut...

> 
> Build changes
> -------------
> 
>   * IGT: IGT_7867 -> IGTPW_11175
>   * Linux: xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd -> xe-1324-e6f323721ccff14f9043937533c2b76d712b40c8
> 
>   IGTPW_11175: 9cf7bd4ce9b660820923b5946f5ffbf6a5c107c7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7867: f3006a13799e3bc45d754aa8ad318394277d69ac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd: b134db8544f8d5b8a960b368afe12820c3cbe8cd
>   xe-1324-e6f323721ccff14f9043937533c2b76d712b40c8: e6f323721ccff14f9043937533c2b76d712b40c8
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11175/index.html
