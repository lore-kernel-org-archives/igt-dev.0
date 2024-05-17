Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B25C25B79
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 15:18:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F32410EF08;
	Fri, 17 May 2024 15:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xajsv2wD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD3B10EF06;
 Fri, 17 May 2024 15:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715959119; x=1747495119;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v2cAhadRmLQI5s1VqR/b1Wp+44yv243+m68JVyi8Wec=;
 b=Xajsv2wDI8EvNk1fspx1QBo6PdOY8IxwGtlRD78SPzAGZ23INUtwMsZ0
 h2PQdSOrGZs4kljOQ5/oS1vCYZaOVVvecCPa4m0+7z+aO5kIS59/YOzBY
 z2cXw8R8cSfdhAsObvKSoHQAJRZQV+ev0waV7BOg1Vxwts8ley07nw2TQ
 jw1TaFW3chQQ210e4utwevEmI0O8BwUNmAuDN/z9+1M/1lkKWVakAOlxg
 /AOeueeS3slaxoJ3SxCe5DHMfAmuIgmaiE2nUmkzEdaG7UOzUOAheF2YP
 nZujQ7Kvrs0q1gBs7l3cGB/XK/wirWHvOEqvD6N93ukOgS+gHb3FY2cSZ A==;
X-CSE-ConnectionGUID: stKG+qcLTxedqtTfllf++Q==
X-CSE-MsgGUID: YLHutRSMQC+AX29dTTDjbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="11988798"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="11988798"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 08:18:38 -0700
X-CSE-ConnectionGUID: K0N54FN3TXyBzFBN5DR9lw==
X-CSE-MsgGUID: Gxq5JsSgRR2TZRS9yiKcwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="36625544"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 08:18:36 -0700
Date: Fri, 17 May 2024 17:18:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/xe_pm: Disable display for mocs-rpm test
Message-ID: <20240517151833.lzh52sg6huifw3kb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240516104513.2685597-1-janga.rahul.kumar@intel.com>
 <171593436185.2142370.18419583168521753321@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171593436185.2142370.18419583168521753321@8e613ede5ea5>
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
On 2024-05-17 at 08:26:01 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_pm: Disable display for mocs-rpm test
> URL   : https://patchwork.freedesktop.org/series/133688/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14775_full -> IGTPW_11151_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11151_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11151_full, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11151/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11151_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_clear:
>     - shard-mtlp:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14775/shard-mtlp-1/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_clear.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11151/shard-mtlp-3/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_clear.html
> 
>   * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_range_bias:
>     - shard-mtlp:         [PASS][3] -> [DMESG-FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14775/shard-mtlp-1/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_range_bias.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11151/shard-mtlp-3/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_range_bias.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
>     - shard-mtlp:         [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14775/shard-mtlp-6/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11151/shard-mtlp-5/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:
>     - shard-snb:          [PASS][7] -> [ABORT][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14775/shard-snb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11151/shard-snb7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html
> 

Unrelated to xe_pm test.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_14775_full and IGTPW_11151_full:
> 
> ### New IGT tests (4) ###
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-hdmi-a-1:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.11, 0.15] s
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-hdmi-a-1:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.10, 0.12] s
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c-hdmi-a-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d-hdmi-a-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.11] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11151_full that come from known issues:
> 
> ### IGT changes ###
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7858 -> IGTPW_11151
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14775: 3b6a503228b84c010794599203ac3e1e3d349bab @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11151: 11151
>   IGT_7858: 133c90d6aabcd90871e36946317c90ee83c2f847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11151/index.html
