Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6370DF9EDF6
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 14:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C4B10EA45;
	Wed, 22 Apr 2026 14:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhznCEfV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D007510EA72;
 Wed, 22 Apr 2026 14:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776869365; x=1808405365;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=duzYfJJUliDB7oqIXSknl3Z4sSTQWrZDskZ4TtZFm4s=;
 b=RhznCEfVUIKLkE+z3XKcrcsB9fCGjsRITCMG4wh4+boXCImz6EG5C50N
 nh2IypeeBeoCErtbYiaKLO0TkidaUGfBZtyN6P8fgucPjMT3s5c75icx+
 g6omUmyVw6RvSyXA5SxSVkt4eOKnJXZHiO9Ezapwt+llS1hEteMiIi+jq
 hNem51RyDh+2drIwc48GKGQBzn6Tvl+v2veuxBedXSc+HxM2ilTLXZwsd
 9Fd3E5vgRBVmUiYsDOosPHtQUZzAoPfL8rDyINyyojbYJFMWeYfIjAaLN
 ThILkm+l4ivegScN2StjlY+bSGW/IcRNkhQbOl/V+ZAhDewXirFz3167t Q==;
X-CSE-ConnectionGUID: VWq6wvPdSUeiWdDnhr54Vg==
X-CSE-MsgGUID: 6p651L+EQTyRKCc8suo+Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77701884"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="77701884"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 07:49:24 -0700
X-CSE-ConnectionGUID: p8YzN5rUTy+NfSlVqwpOdw==
X-CSE-MsgGUID: FwnxpX/DRvOhaCm1EuCdpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="236746588"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 07:49:23 -0700
Date: Wed, 22 Apr 2026 16:49:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Various fixes for prime_udl test (rev2)
Message-ID: <20260422144908.khogmk5kwdvzaknu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20251215223639.117028-1-kamil.konieczny@linux.intel.com>
 <177684157952.484983.15494297251144971746@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177684157952.484983.15494297251144971746@a3b018990fe9>
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
On 2026-04-22 at 07:06:19 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Various fixes for prime_udl test (rev2)
> URL   : https://patchwork.freedesktop.org/series/159052/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_18352_full -> IGTPW_15028_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15028_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15028_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15028/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15028_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-hdmi-a-3:
>     - shard-dg2:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18352/shard-dg2-5/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-hdmi-a-3.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15028/shard-dg2-8/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-hdmi-a-3.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-tglu:         [SKIP][3] ([i915#15949]) -> [SKIP][4] +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18352/shard-tglu-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15028/shard-tglu-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg1:          [SKIP][5] ([i915#15949]) -> [SKIP][6] +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18352/shard-dg1-12/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15028/shard-dg1-18/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>     - shard-dg2:          [SKIP][7] ([i915#15949]) -> [SKIP][8] +1 other test skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18352/shard-dg2-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15028/shard-dg2-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>     - shard-rkl:          [SKIP][9] ([i915#15949]) -> [SKIP][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18352/shard-rkl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15028/shard-rkl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
>     - shard-glk:          [ABORT][11] ([i915#13179]) -> [DMESG-FAIL][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18352/shard-glk4/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15028/shard-glk1/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html
> 

Above are unrelated.

Below is a bug in my change in prime_udl, please do not file a bug for it.

>   * igt@prime_udl:
>     - shard-glk:          [SKIP][13] -> [FAIL][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18352/shard-glk3/igt@prime_udl.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15028/shard-glk4/igt@prime_udl.html
>     - shard-dg2:          [SKIP][15] -> [FAIL][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18352/shard-dg2-4/igt@prime_udl.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15028/shard-dg2-8/igt@prime_udl.html
>     - shard-rkl:          [SKIP][17] -> [FAIL][18]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18352/shard-rkl-1/igt@prime_udl.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15028/shard-rkl-2/igt@prime_udl.html
>     - shard-dg1:          [SKIP][19] -> [FAIL][20]
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18352/shard-dg1-12/igt@prime_udl.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15028/shard-dg1-19/igt@prime_udl.html
>     - shard-snb:          [SKIP][21] -> [FAIL][22]
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18352/shard-snb1/igt@prime_udl.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15028/shard-snb6/igt@prime_udl.html
>     - shard-tglu:         [SKIP][23] -> [FAIL][24]
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18352/shard-tglu-9/igt@prime_udl.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15028/shard-tglu-6/igt@prime_udl.html
>     - shard-mtlp:         [SKIP][25] -> [FAIL][26]
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18352/shard-mtlp-5/igt@prime_udl.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15028/shard-mtlp-8/igt@prime_udl.html
> 

Below are unrelated.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_18352_full and IGTPW_15028_full:
> 
> ### New IGT tests (41) ###
> 
>   * igt@kms_plane_alpha_blend@128x128-right-edge:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@allocator-basic-reserve:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@alternate-sync-async-flip-atomic:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@basic:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@basic-fence-flip:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@basic-max-non-joiner:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@basic-with_two_bos:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@cliprects_ptr-dirt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@dpms-vs-vblank-race-interruptible:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@fast-copy-emit:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@fbc-1p-primscrn-cur-indfb-draw-render:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@fbc-2p-scndscrn-shrfb-pgflip-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@flink-interruptible:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@gem-execbuf-stress:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@getfb2-handle-not-fb:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@invalid:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@invalid-clone-single-crtc:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@invalid-query-zero-handles:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@lease-invalid-crtc:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@load:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@mmap-offset-banned:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@pixel-format-yf-tiled-modifier-source-clamping:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@plane-downscale-factor-0-5-with-rotation:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@planes-upscale-factor-0-25:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@preempt-hang:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@psr-2p-primscrn-pri-shrfb-draw-render:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@psr-rgb565-draw-mmap-gtt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@read-writes:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@read-writes@pipe-a-hdmi-a-3:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@read-writes@pipe-d-hdmi-a-3:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@render-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@single-wait-all-for-submit-signaled:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@single-wait-for-submit-available-submitted:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@too-high:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@y-tiled-8bpp-rotate-0:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_plane_alpha_blend@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15028_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
...cut...
