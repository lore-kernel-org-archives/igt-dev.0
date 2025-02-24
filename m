Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E07C021A4
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 12:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0016810E372;
	Mon, 24 Feb 2025 12:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNrFuOqT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885D010E372;
 Mon, 24 Feb 2025 12:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740398903; x=1771934903;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5kqoJD8Gi9u0L65ANix/s20kfvpIakTqC6teu08klB4=;
 b=mNrFuOqTu5WHqAdZ3DNe3c+aPpxwPrNdISAqcRrj3wPYFlP3AGyOMXKX
 WwPzo7C+PUNibFEJQnQztP32Bk72qHcChzN4iUo4WVSnloPhiWf6kNJrm
 kElYrzrkt5Ujgnktv2zmATxp4fq4cQ8Yq67BYOg1uGYvFqtzMauQT/J1W
 L9lMj0NStor47mXDz+DvTQvQa61wf//NVNb0H1ICI6JwL7qTwTQ89q6ZW
 YuXL/kvvdTVY7NTFfEoFj/BQpwojnb1gFCf5r1yPOuV4eSCumz13+Ohr/
 L82hEcchfuS8emiItib7Y5IFqYpYstp+dTzbyrrvZyUeDGyjDW4i5SHr1 A==;
X-CSE-ConnectionGUID: WoNDplDFRZiGnf/D+INviw==
X-CSE-MsgGUID: 67XNdT6bQdSM3krqM10p1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="52550657"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="52550657"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 04:08:23 -0800
X-CSE-ConnectionGUID: NE10EcH7QIi3+jxoi67wvg==
X-CSE-MsgGUID: hW5kfsybQWm7CuWkI7Lkrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121312818"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 04:08:22 -0800
Date: Mon, 24 Feb 2025 13:08:19 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 lib/igt_core: Add ftrace logs at test boundaries (rev2)
Message-ID: <20250224120819.lvaoo6t3rv7yxzlp@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250221223823.2336228-1-umesh.nerlige.ramappa@intel.com>
 <174018905888.626109.17040306311515802458@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174018905888.626109.17040306311515802458@b555e5b46a47>
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
On 2025-02-22 at 01:50:58 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_core: Add ftrace logs at test boundaries (rev2)
> URL   : https://patchwork.freedesktop.org/series/145273/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16169_full -> IGTPW_12653_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12653_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12653_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12653/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12653_full:
> 

Unrelated, no need for rerun.

Regards,
Kamil

> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_setmaster@master-drop-set-shared-fd:
>     - shard-tglu:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16169/shard-tglu-3/igt@core_setmaster@master-drop-set-shared-fd.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12653/shard-tglu-2/igt@core_setmaster@master-drop-set-shared-fd.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices:
>     - shard-glk:          NOTRUN -> [ABORT][3] +1 other test abort
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12653/shard-glk6/igt@gem_exec_suspend@basic-s4-devices.html
> 
>   * igt@gem_tiled_swapping@non-threaded:
>     - shard-glk:          NOTRUN -> [FAIL][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12653/shard-glk6/igt@gem_tiled_swapping@non-threaded.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1:
>     - shard-snb:          [PASS][5] -> [FAIL][6] +1 other test fail
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16169/shard-snb1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12653/shard-snb2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible:
>     - shard-tglu:         [PASS][7] -> [FAIL][8] +1 other test fail
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16169/shard-tglu-7/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12653/shard-tglu-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@plain-flip-ts-check@a-edp1:
>     - shard-mtlp:         NOTRUN -> [FAIL][9] +1 other test fail
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12653/shard-mtlp-5/igt@kms_flip@plain-flip-ts-check@a-edp1.html
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:
>     - shard-mtlp:         [PASS][10] -> [FAIL][11] +2 other tests fail
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16169/shard-mtlp-6/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12653/shard-mtlp-1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-dg1:          [PASS][12] -> [INCOMPLETE][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16169/shard-dg1-18/igt@perf_pmu@module-unload.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12653/shard-dg1-17/igt@perf_pmu@module-unload.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_dp_link_training@non-uhbr-mst}:
>     - shard-tglu:         NOTRUN -> [SKIP][14]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12653/shard-tglu-10/igt@kms_dp_link_training@non-uhbr-mst.html
>     - shard-mtlp:         NOTRUN -> [SKIP][15]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12653/shard-mtlp-8/igt@kms_dp_link_training@non-uhbr-mst.html
>     - shard-dg2:          NOTRUN -> [SKIP][16]
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12653/shard-dg2-11/igt@kms_dp_link_training@non-uhbr-mst.html
>     - shard-rkl:          NOTRUN -> [SKIP][17]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12653/shard-rkl-1/igt@kms_dp_link_training@non-uhbr-mst.html
>     - shard-dg1:          NOTRUN -> [SKIP][18]
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12653/shard-dg1-18/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * {igt@kms_dp_link_training@uhbr-mst}:
>     - shard-tglu-1:       NOTRUN -> [SKIP][19]
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12653/shard-tglu-1/igt@kms_dp_link_training@uhbr-mst.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12653_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-keep-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#8411])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12653/shard-dg2-11/igt@api_intel_bb@object-reloc-keep-cache.html
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8246 -> IGTPW_12653
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_16169: f2a2bd676bde0942c9dfe5c55d54eec298260f88 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12653: 3efafa60fb8776bad333092fb6b26f80434d41be @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8246: 2670886863d5821273146d7f94cdd3c8e3a4fe0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12653/index.html
