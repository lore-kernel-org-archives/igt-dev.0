Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EEBCCFA1A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 14:46:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8962010E0A9;
	Wed, 12 Nov 2025 14:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fuV9J/Di";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A4F10E0A9
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 14:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762958783; x=1794494783;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Aq0MSCZlSeSQOPaOi34yXQnPiYLZ2SPKD5/sJhtQKoM=;
 b=fuV9J/Di1N4Ff7TnCAWrpeU8mKS0XIdscpxjOnHK06Jdbn8EEzk0jKEB
 w6IlmPmMYKNDLq0XYQwwKsaNO48Wk1rYaTgzV+LMd8niC4l/c8Kff/+Fy
 NE6Z05tD15aPn++gracoUa+y3qnSVzimWamTEgJMNJnkH5mB84BR2IM5C
 E4n15wIIxOvjXAUHEQkm0iCgfUcBi1csZMU6Y5cuwIKdWUknuVQNK3wpl
 lJtU/NwKoHqlJeoePTlUBYksqzfCNhWUfdWfxunyG9D5nw4Re/DQIZdSI
 bzKgl3aMy5ZgbXb/EmDpi5wjfLHrHT+RTrFhG1DstwaO4xtZ2lN0IgvoW w==;
X-CSE-ConnectionGUID: vblppV9FTWaUCEgJmlByGQ==
X-CSE-MsgGUID: PKyD2hy+SA+CyVJwJk3nZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65057255"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="65057255"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 06:46:23 -0800
X-CSE-ConnectionGUID: CXsripokQmqcDTdLTzdb5A==
X-CSE-MsgGUID: e4qEE+8PSui6fIMqpjlQLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="189968258"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.194])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 06:46:22 -0800
Date: Wed, 12 Nov 2025 15:46:19 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Multi-CCS support in IGT (rev15)
Message-ID: <77o6s3tnz7ecazwuudvnfd5gqcoqsn5dl5gzb5resk44vtgah2@dngs72x3x6ug>
References: <20251112093510.15195-1-nishit.sharma@intel.com>
 <176295599117.45975.16258336648888052918@10055242dc62>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176295599117.45975.16258336648888052918@10055242dc62>
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

On Wed, Nov 12, 2025 at 01:59:51PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Multi-CCS support in IGT (rev15)                                 
>    URL:     https://patchwork.freedesktop.org/series/153115/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14043/index.html 
> 
>         CI Bug Log - changes from XEIGT_8621_FULL -> XEIGTPW_14043_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_14043_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_14043_FULL, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
> Participating hosts (4 -> 3)
> 
>    Missing (1): shard-adlp
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    XEIGTPW_14043_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@xe_compute@ccs-mode-basic:
> 
>           * shard-bmg: NOTRUN -> SKIP +1 other test skip
>      * igt@xe_compute@eu-busy-10s (NEW):
> 
>           * shard-lnl: NOTRUN -> SKIP
>      * igt@xe_compute@loop-duration-2s (NEW):
> 
>           * shard-dg2-set2: NOTRUN -> SKIP +1 other test skip

Above skips are expected.

>      * igt@xe_pmu@engine-activity-accuracy-50:
> 
>           * shard-lnl: PASS -> FAIL

Unrelated to the change. 

> 
>     Warnings
> 
>      * igt@xe_compute@ccs-mode-compute-kernel:
>           * shard-bmg: FAIL (Intel XE#5963) -> SKIP

Expected change fail -> skip for sriov.

> 
> New tests
> 
>    New tests have been introduced between XEIGT_8621_FULL and
>    XEIGTPW_14043_FULL:
> 
>   New IGT tests (2)
> 
>      * igt@xe_compute@eu-busy-10s:
> 
>           * Statuses : 3 skip(s)
>           * Exec time: [0.0, 0.05] s

For sriov mode above skips are expected.

>      * igt@xe_compute@loop-duration-2s:
> 
>           * Statuses : 1 pass(s) 1 skip(s)
>           * Exec time: [0.02, 2.05] s

Pass on BMG and skip on rest are expected.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_14043_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#6054) +3 other tests fail
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2370)
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#316) +2 other tests skip
>      * igt@kms_big_fb@linear-32bpp-rotate-270:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2327) +4 other tests skip
>      * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +18 other tests skip
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124) +10 other tests
>             skip
>      * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2314 / Intel XE#2894) +2
>             other tests skip
>      * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2191) +1 other test skip
>      * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#367) +3 other tests skip
>      * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#367) +3 other tests skip
>      * igt@kms_ccs@bad-aux-stride-y-tiled-ccs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887)
>      * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +21 other tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +55 other tests
>             skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2907) +1 other test skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +17
>             other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +15
>             other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#3862) +1 other test
>             incomplete
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3432) +2 other tests skip
>      * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4416) +3 other tests
>             skip
>      * igt@kms_chamelium_color@ctm-0-25:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#306)
>      * igt@kms_chamelium_color@ctm-green-to-red:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#306)
>      * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +14 other tests skip
>      * igt@kms_chamelium_hpd@common-hpd-after-suspend:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373)
>      * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#373) +9 other tests skip
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#307)
>      * igt@kms_content_protection@legacy:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#1178) +7 other tests fail
>      * igt@kms_cursor_crc@cursor-offscreen-128x42:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +8 other tests skip
>      * igt@kms_cursor_crc@cursor-random-512x170:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#308)
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2321) +2 other tests skip
>      * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309) +1 other test skip
>      * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2291)
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2291) +1 other test skip
>      * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#5299)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2286)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1340)
>      * igt@kms_dp_link_training@uhbr-sst:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4354)
>      * igt@kms_dp_linktrain_fallback@dsc-fallback:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4331)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2244) +1 other test skip
>      * igt@kms_fbcon_fbt@fbc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5425)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#776)
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2375)
>      * igt@kms_feature_discovery@psr1:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2374) +1 other test skip
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1135)
>      * igt@kms_flip@2x-flip-vs-panning-vs-hang:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2316) +2 other tests skip
>      * igt@kms_flip@2x-wf_vblank-ts-check:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2316) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293) +6 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293 / Intel XE#2380) +6
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +24 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651)
>      * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6313)
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5390) +20 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2352)
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#6312) +5 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +26 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +39 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +41 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +29 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2312) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +1 other test skip
>      * igt@kms_joiner@basic-force-ultra-joiner:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2934)
>      * igt@kms_joiner@invalid-modeset-big-joiner:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2925 / Intel XE#346)
>      * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2925)
>      * igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2927)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2501)
>      * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4329)
>      * igt@kms_plane_multiple@2x-tiling-y:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4596)
>      * igt@kms_plane_multiple@tiling-y:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#5020)
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5020)
>      * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2571)
>      * igt@kms_pm_backlight@fade-with-suspend:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#870)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#870)
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3309)
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#718)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2499)
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489) +5
>             other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489) +8
>             other tests skip
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2387)
>      * igt@kms_psr@fbc-pr-no-drrs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406)
>      * igt@kms_psr@fbc-psr-primary-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2234 / Intel
>             XE#2850) +15 other tests skip
>      * igt@kms_psr@fbc-psr2-sprite-plane-move:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2850 /
>             Intel XE#929) +14 other tests skip
>      * igt@kms_rotation_crc@primary-rotation-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904) +2
>             other tests skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1127) +1 other test skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3414) +1 other test skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2330)
>      * igt@kms_setmode@clone-exclusive-crtc:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#1435) +1 other test skip
>      * igt@kms_sharpness_filter@invalid-plane-with-filter:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6503) +3 other tests skip
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2426)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1500)
>      * igt@kms_tv_load_detect@load-detect:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2450)
>      * igt@kms_vrr@max-min:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1499) +3 other tests skip
>      * igt@xe_copy_basic@mem-set-linear-0x369:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1126)
>      * igt@xe_copy_basic@mem-set-linear-0x8fffe:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#5503)
>      * igt@xe_create@multigpu-create-massive-size:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2504)
>      * igt@xe_eu_stall@invalid-event-report-count:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#5626)
>      * igt@xe_eudebug@basic-read-event:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837)
>      * igt@xe_eudebug@basic-vm-access-userptr-faultable:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4837) +14 other tests
>             skip
>      * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4837) +18 other tests skip
>      * igt@xe_eudebug_sriov@deny-eudebug:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5793)
>      * igt@xe_evict@evict-beng-mixed-threads-small:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#688) +1 other test skip
>      * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392)
>      * igt@xe_exec_basic@multigpu-once-null-rebind:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +16 other tests skip
>      * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288) +28 other tests
>             skip
>      * igt@xe_exec_system_allocator@many-64k-mmap-free-huge:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5007)
>      * igt@xe_exec_system_allocator@once-mmap-free-huge:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4943) +26 other tests skip
>      * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4915) +314 other tests
>             skip
>      * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4943) +1 other test skip
>      * igt@xe_module_load@load:
> 
>           * shard-dg2-set2: (PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS) -> (PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, SKIP, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS)
>             (Intel XE#378)
>      * igt@xe_oa@non-zero-reason:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3573) +2 other tests
>             skip
>      * igt@xe_oa@non-zero-reason-all:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#6377)
>      * igt@xe_oa@tail-address-wrap:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#6032) +1 other test skip
>      * igt@xe_pat@display-vs-wb-transient:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1337)
>      * igt@xe_pat@pat-index-xehpc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1420)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2838 / Intel XE#979)
>      * igt@xe_peer2peer@write:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2427)
>      * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#6566)
>      * igt@xe_pm@d3cold-i2c:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#5694)
>      * igt@xe_pm@d3cold-mmap-system:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2284) +2 other tests skip
>      * igt@xe_pm@d3cold-mocs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2284)
>      * igt@xe_pmu@all-fn-engine-activity-load:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4650)
>      * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#6251) +4 other tests fail
>      * igt@xe_pmu@gt-c6-idle:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#6366)
>      * igt@xe_pmu@gt-frequency:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#5166) +1 other test fail
>           * shard-lnl: PASS -> FAIL (Intel XE#5841) +1 other test fail
>      * igt@xe_pxp@display-pxp-fb:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4733) +2 other tests skip
>      * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4733) +2 other tests
>             skip
>      * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#944) +2 other tests skip
>      * igt@xe_query@multigpu-query-topology:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#944) +5 other tests skip
>      * igt@xe_render_copy@render-stress-4-copies:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4814) +2 other tests
>             skip
>      * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4130)
> 
>     Possible fixes
> 
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#2705 / Intel XE#4212 / Intel
>             XE#4345) -> PASS +1 other test pass
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#2705 / Intel XE#4212) ->
>             PASS +1 other test pass
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>           * shard-bmg: SKIP (Intel XE#2291) -> PASS +2 other tests pass
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-bmg: FAIL (Intel XE#1475) -> PASS
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-bmg: SKIP (Intel XE#4302) -> PASS
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:
> 
>           * shard-bmg: INCOMPLETE (Intel XE#2049 / Intel XE#2597) -> PASS +1
>             other test pass
>      * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>           * shard-bmg: SKIP (Intel XE#2316) -> PASS +3 other tests pass
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>           * shard-bmg: FAIL (Intel XE#3321) -> PASS +1 other test pass
>      * igt@kms_pm_dc@dc5-dpms:
> 
>           * shard-lnl: FAIL (Intel XE#718) -> PASS
>      * igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>           * shard-bmg: SKIP (Intel XE#1435) -> PASS
>      * igt@xe_exec_threads@threads-bal-shared-vm-rebind:
> 
>           * shard-dg2-set2: INCOMPLETE -> PASS +1 other test pass
>      * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#5893) -> PASS
>      * igt@xe_pm_residency@idle-residency:
> 
>           * shard-dg2-set2: FAIL (Intel XE#6362) -> PASS +1 other test pass
>      * igt@xe_vm@large-misaligned-binds-268435456:
> 
>           * shard-bmg: INCOMPLETE (Intel XE#2594) -> PASS
> 
>     Warnings
> 
>      * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2311) +6 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +6 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#5390) -> SKIP (Intel XE#2312) +2 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#5390)
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2313) +8 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +3 other
>             tests skip
> 
> Build changes
> 
>      * IGT: IGT_8621 -> IGTPW_14043
>      * Linux: xe-4089-f2a06cc6e63a449c2074f95c7a61b18f6326769c ->
>        xe-4090-0961bffa4c3b59fb4c844f2e5687d876a78938c2
> 
>    IGTPW_14043: 147e70bc7600ad1853c2be94884bd3c5943ea443 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8621: 8621
>    xe-4089-f2a06cc6e63a449c2074f95c7a61b18f6326769c:
>    f2a06cc6e63a449c2074f95c7a61b18f6326769c
>    xe-4090-0961bffa4c3b59fb4c844f2e5687d876a78938c2:
>    0961bffa4c3b59fb4c844f2e5687d876a78938c2
