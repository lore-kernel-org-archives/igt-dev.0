Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D47DC04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 15:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6B510EF06;
	Fri, 17 May 2024 15:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZVFvBWpF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF2410EF06
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 15:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715959899; x=1747495899;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Y2Hl9tl7dhvOVsRolnJ2A2kXvf7osDx1YAie0hyLHNw=;
 b=ZVFvBWpFgYgFvhnuNqtLdS+ISy849ON6/OxAXq3TnnQbfL8DUnUKXRDc
 Yzwxpk5iGHZpXkNHWMcrKT0wyJGKwd2IaqcCEeMgDOMpY+ZY2EwTxDUIn
 b/y5XHTJ68dZ6cx0t91DJ1Pw6qT8/0a+PTty6Rhx5cU6Xi16/NWoKXdgP
 ga+/GIXBOFqmIJJbZPkdeUzxIgGxpyRoDzWtZliAqn99LQEXKZaEun2AP
 NbNndG4FfKUaZu4u6HIK0XyqmvyOPbG7grnyCSKrfXLPmjOMXfseZb6US
 0dpK8jafBjrIfKmUdliV2klR7yrPgKxx+bzw8gz0pyV2jzIqu5sn9Tkgu g==;
X-CSE-ConnectionGUID: B1SaShvzRrG4/gxQABep0A==
X-CSE-MsgGUID: rSFlmyUqQdauPj4/AMNnOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="11984793"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="11984793"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 08:31:39 -0700
X-CSE-ConnectionGUID: etYqJOs3QVugwnqrt9KEhw==
X-CSE-MsgGUID: cTs0HrW/Ty+CS8aGihoy9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="36716022"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 08:31:39 -0700
Date: Fri, 17 May 2024 17:31:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests=2Fintel?=
 =?utf-8?Q?=2Fkms=5Fbig=5Ffb=3A_Introducing_this_restrictio?= =?utf-8?Q?n?=
 to optimize the test execution time on simulation (rev2)
Message-ID: <20240517153135.a3da7teds2gjklsu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pranay Samala <pranay.samala@intel.com>
References: <20240516102817.424967-1-pranay.samala@intel.com>
 <171586132640.2120952.6479628162722155268@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171586132640.2120952.6479628162722155268@8e613ede5ea5>
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
On 2024-05-16 at 12:08:46 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/kms_big_fb: Introducing this restriction to optimize the test execution time on simulation (rev2)
> URL   : https://patchwork.freedesktop.org/series/133675/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7858_full -> XEIGTPW_11150_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11150_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11150_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 


Very unlikly for kms_big_fb test.

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
>   Here are the unknown changes that may have been introduced in XEIGTPW_11150_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7858/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11150/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
> 

Unrelated.

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
>     - {shard-lnl}:        [SKIP][3] ([Intel XE#1134]) -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7858/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11150/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
>     - {shard-lnl}:        NOTRUN -> [INCOMPLETE][5] +2 other tests incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11150/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
> 
>   * igt@kms_getfb@getfb2-handle-protection:
>     - {shard-lnl}:        NOTRUN -> [FAIL][6]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11150/shard-lnl-6/igt@kms_getfb@getfb2-handle-protection.html
> 
>   * igt@xe_intel_bb@destroy-bb:
>     - {shard-lnl}:        [PASS][7] -> [INCOMPLETE][8] +1 other test incomplete
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7858/shard-lnl-4/igt@xe_intel_bb@destroy-bb.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11150/shard-lnl-8/igt@xe_intel_bb@destroy-bb.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - {shard-lnl}:        [PASS][9] -> [FAIL][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7858/shard-lnl-7/igt@xe_pm@s2idle-exec-after.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11150/shard-lnl-6/igt@xe_pm@s2idle-exec-after.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11150_full that come from known issues:
> 

...cut...

> 
> Build changes
> -------------
> 
>   * IGT: IGT_7858 -> IGTPW_11150
>   * Linux: xe-1298-220fb645d6cd4ce4155b5ccfdf52b35d6a7942c3 -> xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab
> 
>   IGTPW_11150: 11150
>   IGT_7858: 133c90d6aabcd90871e36946317c90ee83c2f847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1298-220fb645d6cd4ce4155b5ccfdf52b35d6a7942c3: 220fb645d6cd4ce4155b5ccfdf52b35d6a7942c3
>   xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab: 3b6a503228b84c010794599203ac3e1e3d349bab
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11150/index.html
