Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBE4CF6499
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 11:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83E210E3E7;
	Mon, 30 Sep 2024 11:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8eSC5SH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3C110E311;
 Mon, 30 Sep 2024 11:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727695186; x=1759231186;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=siTFo0icVOvUbAEGgRcR9U0VjBpsY4sjyTh/d2tOBgg=;
 b=C8eSC5SHkyhHVYUj+9N18B4xWpvkl5d8IDWdyM0tuqqGaJmiBH73nd4o
 YOq+e9Bs/1A5zLmMz/MlDBv/gO0R3gwUSflze8Xmg1hnpmaTEYs80KsDL
 5qwHleUK7Z4giG+xKXh9q9nV1ZDxMXtl/Atab5hYRJXlRXU7S6w3jRGkw
 g9GZV53QbeiEoyDmIGDgck+hck9ugCnUM8AQFFw30t44nzTWEJW6hzBwC
 1OMRzKo2gRlihSxQcIfOGbQ2LVLXFAY6N+f6SxYJEkHEeY/ew0J61zsHy
 t4BFi0Pm1RAXA6AxIjsgudOKweyJ98mwAdEDR2PZDXnNvIZSrzjmUahlp w==;
X-CSE-ConnectionGUID: j4VT/3NiT6aNINc+mXB0aA==
X-CSE-MsgGUID: aYDwvLJeT7akoaV+ZHzbcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26901045"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="26901045"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 04:19:43 -0700
X-CSE-ConnectionGUID: oWx9KJ6mQKStWxRwUCuSfw==
X-CSE-MsgGUID: QD/XtnNHQ/+o1wrN7K1toQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="73540754"
Received: from morganmc-mobl.ger.corp.intel.com (HELO [10.213.199.177])
 ([10.213.199.177])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 04:19:43 -0700
Message-ID: <517f0ee1-b775-4732-9dc0-28fbe7b3a3a6@linux.intel.com>
Date: Mon, 30 Sep 2024 13:19:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests/intel/?=
 =?UTF-8?Q?xe=5Fpm=3A_one_suspend/resume_cycle_for_all_xe_engines_=28rev3=29?=
To: I915-ci-infra@lists.freedesktop.org,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <5cdb17b6-7045-40c7-89b1-b55b6eff6623@linux.intel.com>
 <172754874629.1131615.945394936379825301@2413ebb6fbb6>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <172754874629.1131615.945394936379825301@2413ebb6fbb6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Dear I915,


On 28.09.2024 20:39, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_pm: one suspend/resume cycle for all xe engines (rev3)
> URL   : https://patchwork.freedesktop.org/series/139093/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15452_full -> IGTPW_11825_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11825_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11825_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11825/index.html
> 
> Participating hosts (9 -> 8)
> ------------------------------
> 
>   Missing    (1): shard-glk 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11825_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_freq_api@freq-suspend@gt0:
>     - shard-dg2:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15452/shard-dg2-8/igt@i915_pm_freq_api@freq-suspend@gt0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11825/shard-dg2-5/igt@i915_pm_freq_api@freq-suspend@gt0.html
> 
>   * igt@kms_big_joiner@basic-force-joiner:
>     - shard-tglu:         NOTRUN -> [SKIP][3] +10 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11825/shard-tglu-6/igt@kms_big_joiner@basic-force-joiner.html
> 
>   * igt@kms_big_joiner@invalid-modeset-force-joiner:
>     - shard-rkl:          NOTRUN -> [SKIP][4] +10 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11825/shard-rkl-2/igt@kms_big_joiner@invalid-modeset-force-joiner.html
> 
>   * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
>     - shard-tglu:         [PASS][5] -> [SKIP][6] +29 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15452/shard-tglu-7/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11825/shard-tglu-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_flip@plain-flip-ts-check@b-edp1:
>     - shard-mtlp:         [PASS][7] -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15452/shard-mtlp-5/igt@kms_flip@plain-flip-ts-check@b-edp1.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11825/shard-mtlp-6/igt@kms_flip@plain-flip-ts-check@b-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][9] +20 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11825/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][10] +23 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11825/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-mtlp:         NOTRUN -> [SKIP][11] +11 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11825/shard-mtlp-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html


These are unrelated. Please update the filters.

>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-tglu:         [SKIP][12] ([i915#5286]) -> [SKIP][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15452/shard-tglu-6/igt@kms_big_fb@4-tiled-addfb.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11825/shard-tglu-8/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
>     - shard-tglu:         [SKIP][14] ([i915#6095]) -> [SKIP][15] +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15452/shard-tglu-2/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11825/shard-tglu-8/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>     - shard-tglu:         [SKIP][16] ([i915#12042]) -> [SKIP][17]
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15452/shard-tglu-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11825/shard-tglu-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x32:
>     - shard-tglu:         [SKIP][18] ([i915#3555]) -> [SKIP][19]
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15452/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen-32x32.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11825/shard-tglu-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-tglu:         [SKIP][20] ([i915#11453]) -> [SKIP][21]
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15452/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11825/shard-tglu-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-tglu:         [SKIP][22] ([i915#4103]) -> [SKIP][23]
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15452/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11825/shard-tglu-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-tglu:         [SKIP][24] ([i915#9723]) -> [SKIP][25]
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15452/shard-tglu-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11825/shard-tglu-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-dg2:          [SKIP][26] ([i915#5354]) -> [SKIP][27] +6 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15452/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11825/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 

These are also unrelated.

[...]
