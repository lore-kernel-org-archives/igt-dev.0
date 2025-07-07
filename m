Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B492C8303C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 08:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA57310E2E6;
	Mon,  7 Jul 2025 08:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dODWB7d5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5144210E2E6;
 Mon,  7 Jul 2025 08:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751875326; x=1783411326;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FaqHbNezT1s/wWitM67Q3q+VNAR2XGm1okFatdEJx4Y=;
 b=dODWB7d5UJjNhxU6Kaol3dDnMmeOD8kkiNWuwWo1AeaBSf3O+Fy6HNxL
 mOAx6wbxpRlqa0SCTeGRZC4OR5LAhdOhX7h3/BNFczA5PMeUxFtmowhy9
 Ihp1OY+EWvhJHTPguTnDEFlQdGfzu89hpASp0kMmIMA+r9O1d9XHCms4Q
 DzoMAh6ztbfsU4ONX4UWTBkOcNWYbKwxW6Esk1WF14ZiRQFoo3Ec05+Si
 cRHmu72l4/Uqao/2ejpKjyAAxZGTZmYt/QvpQ56g7qR++duT3lQBDc2qz
 VcpC38jJcXgM/yoBAedHW4+D/CMQtnqHrZeI7R6CO6Uqp2X4pi7PZggiQ w==;
X-CSE-ConnectionGUID: /oEhk3XLQmupuSyM5z3ptA==
X-CSE-MsgGUID: U5AiPoIxQjOoCNQbWKHGZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="76637631"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="76637631"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 01:02:06 -0700
X-CSE-ConnectionGUID: gT0DhE7gQf2oQJ92o6Ty9Q==
X-CSE-MsgGUID: nCbxKv43RwKeRtQm47T0GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="159182640"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 01:02:04 -0700
Date: Mon, 7 Jul 2025 10:01:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 msm: recovery and mapping updates (rev2)
Message-ID: <20250707080150.zc5ogjibekgpz3r4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
 <175165225053.136271.8636295660475783129@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175165225053.136271.8636295660475783129@1538d3639d33>
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
On 2025-07-04 at 18:04:10 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: msm: recovery and mapping updates (rev2)
> URL   : https://patchwork.freedesktop.org/series/150977/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8441_full -> IGTPW_13408_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13408_full absolutely need to be
>   verified manually.

Unrelated, these are only changes in msm tests,

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13408_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13408/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13408_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_linear_blits@interruptible:
>     - shard-dg1:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8441/shard-dg1-13/igt@gem_linear_blits@interruptible.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13408/shard-dg1-12/igt@gem_linear_blits@interruptible.html
> 
>   * igt@kms_psr@psr2-cursor-plane-move@edp-1:
>     - shard-mtlp:         [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8441/shard-mtlp-6/igt@kms_psr@psr2-cursor-plane-move@edp-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13408/shard-mtlp-6/igt@kms_psr@psr2-cursor-plane-move@edp-1.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13408_full that come from known issues:
> 
...cut...
