Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B658FC53219
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 14:10:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE2510E926;
	Tue, 28 Jul 2026 14:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xm7haw4g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7256110E91A;
 Tue, 28 Jul 2026 14:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785247805; x=1816783805;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0CbkdEtPngvdz26qjmC0tzQ4kxpQM1CTIQL+ZuaMI44=;
 b=Xm7haw4gLx5tPjB2mlR8vpeGQGYv8wCDQqlw1RqB7YOcvVvdMazl6nTO
 lFZpNlSxffOcTLB6dMqS8fcVcBPJhUyd+KRcBY428f8AUpmDO72AB+0eX
 WipGItSVULwqVH2CfefD7/OH4KIXJF3vrHYHKKSu8Pnf3bAgKRLp3ZBc9
 ByixAOg2Nyj4SDWYI9LWtU/OyDqC+WWwWw8ZJpgJ2XunMJshH2zCvYc65
 /BTbRBZKQmkq8xHJbOSyyk0jsJYsjybu59SqmfIuu45XlcU0IjGCKLgsH
 xJsweNAx3xs98hmYmOqxBYozpa9gLjoweBeXPjJ2sdAe1E2ns1+dlPtAN g==;
X-CSE-ConnectionGUID: sS/lFuI6R++QyVs3aGDh+A==
X-CSE-MsgGUID: +SjpoRhkRC6UYw9QsLGxGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103372932"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="103372932"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 07:10:01 -0700
X-CSE-ConnectionGUID: tv5zW0IJQrKqlEIfDzItSQ==
X-CSE-MsgGUID: 1m+UxeIJTtWzlxJM0a8cpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="260364637"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 07:10:00 -0700
Date: Tue, 28 Jul 2026 16:09:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Robert Mazur <robert.mazur@imgtec.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests=2Fi?=
 =?utf-8?Q?magination?= =?utf-8?Q?=3A?= Add initial test coverage for
 Imagination DRM driver (rev4)
Message-ID: <20260728140957.mvp25mtwd4jvtrjb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Robert Mazur <robert.mazur@imgtec.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
 <178523896909.230870.10478200262801378536@6beec6c84f66>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178523896909.230870.10478200262801378536@6beec6c84f66>
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
On 2026-07-28 at 11:42:49 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/imagination: Add initial test coverage for Imagination DRM driver (rev4)
> URL   : https://patchwork.freedesktop.org/series/170620/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_18909_full -> IGTPW_15600_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15600_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15600_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15600_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
>     - shard-dg2:          [PASS][1] -> [SKIP][2] +68 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][3] +29 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html
> 

These are non-Intel changes so above and below are unrelated.

Regards,
Kamil

>   
> #### Warnings ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-dg2:          [SKIP][4] ([i915#1769] / [i915#3555]) -> [SKIP][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>     - shard-dg2:          [SKIP][6] ([i915#10307] / [i915#6095]) -> [SKIP][7] +9 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-dg2:          [SKIP][8] ([i915#12805]) -> [SKIP][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>     - shard-dg2:          [SKIP][10] ([i915#6095]) -> [SKIP][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-dg2:          [SKIP][12] ([i915#13781]) -> [SKIP][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-7/igt@kms_cdclk@mode-transition.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2:          [SKIP][14] ([i915#16017]) -> [SKIP][15]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-5/igt@kms_cdclk@mode-transition-all-outputs.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2:          [SKIP][16] ([i915#15330] / [i915#3299]) -> [SKIP][17] +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-8/igt@kms_content_protection@dp-mst-type-1.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-dg2:          [SKIP][18] ([i915#15865]) -> [SKIP][19] +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-3/igt@kms_content_protection@type1.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_content_protection@type1.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x10:
>     - shard-dg2:          [SKIP][20] ([i915#3555]) -> [SKIP][21] +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-5/igt@kms_cursor_crc@cursor-random-32x10.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_cursor_crc@cursor-random-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-dg2:          [SKIP][22] ([i915#13049]) -> [SKIP][23] +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-8/igt@kms_cursor_crc@cursor-random-512x512.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
>     - shard-dg2:          [SKIP][24] ([i915#13046] / [i915#5354]) -> [SKIP][25] +4 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-dg2:          [SKIP][26] ([i915#9833]) -> [SKIP][27]
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-dg2:          [SKIP][28] ([i915#13707]) -> [SKIP][29]
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-wc:
>     - shard-dg2:          [SKIP][30] ([i915#8812]) -> [SKIP][31]
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-4/igt@kms_draw_crc@draw-method-mmap-wc.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-wc.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
>     - shard-dg2:          [SKIP][32] ([i915#16361]) -> [SKIP][33] +4 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-cpu:
>     - shard-dg2:          [SKIP][34] ([i915#15989]) -> [SKIP][35] +14 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-1/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-cpu.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2:          [SKIP][36] ([i915#15102]) -> [SKIP][37] +12 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:
>     - shard-dg2:          [SKIP][38] ([i915#15990]) -> [SKIP][39] +23 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2:          [SKIP][40] ([i915#15991]) -> [SKIP][41] +31 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-blt.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
>     - shard-dg2:          [SKIP][42] ([i915#15104] / [i915#15990]) -> [SKIP][43] +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-dg2:          [SKIP][44] ([i915#16518] / [i915#3555] / [i915#8228]) -> [SKIP][45]
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-4/igt@kms_hdr@static-swap.html
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-dg2:          [SKIP][46] ([i915#12755] / [i915#15867]) -> [SKIP][47]
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-270.html
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2:          [SKIP][48] ([i915#8623]) -> [SKIP][49]
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15600/shard-dg2-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15600_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
...cut...
