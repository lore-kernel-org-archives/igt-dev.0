Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D37FD3B7E5
	for <igt-dev@archiver.kernel.org>; Mon, 29 Dec 2025 08:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF55E11B2F6;
	Mon, 29 Dec 2025 08:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKQXBz4n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B2711B385
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Dec 2025 08:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766995272; x=1798531272;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=iO7cBQI/TJ4S8/REB7KHLfqQPxabLRattpO7mGCXwkw=;
 b=NKQXBz4nMAKWxws+Efl6f10M0o4XMrLYceN7xJ/535LK/Z5bwXuVxg+4
 68agToCzoedLq82rUaENMsworW3CPGKK0xIaVxPT1hmoTukid1pYHkvjC
 vJP0Za7aqbUflBgo74H8o62eePwTDv3uA+U1lxSrDqe31w//mEfBXTdcO
 cWT9/xeAYhytW+jM15coJue6hVm+S8DSZABnkY4c40BaBiOJ732UaO5Nz
 bdUoHBL25d5wEn1KUYhK9bTfEevBNnowGhf/2+e8IDr74GpkKL+PTByUq
 Weev0kN3+3e1jhV7ZwjnBRTO4iXet8h3KA/rzd8sNKf1KI5oxMRFjwpaA w==;
X-CSE-ConnectionGUID: Pwrv5ZO6RKOZI14mcj6dQg==
X-CSE-MsgGUID: 4BVVKiJoSbe3c5GYiZY0ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68677295"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; d="scan'208";a="68677295"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 00:01:12 -0800
X-CSE-ConnectionGUID: gmUOmYe4TBuOVV97GdU2Qg==
X-CSE-MsgGUID: R1IDxw5nRLyzDlMJ7VZtBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; d="scan'208";a="201145765"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.9])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 00:01:11 -0800
Date: Mon, 29 Dec 2025 09:01:08 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_lib=2Fintel?=
 =?utf-8?B?X2NvbXB1dGU6?= Select engine class by engine accessibility
Message-ID: <2pljizqum35kp5f4q2xkon5dkjmnfwwd7vlffn3z3ftlt7evi2@3udweyv4uov5>
References: <20251223102243.113720-2-zbigniew.kempczynski@intel.com>
 <176653145524.114937.13497827899428414337@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176653145524.114937.13497827899428414337@a3b018990fe9>
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

On Tue, Dec 23, 2025 at 11:10:55PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/intel_compute: Select engine class by engine accessibility   
>    URL:     https://patchwork.freedesktop.org/series/159416/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14268/index.html 
> 
>         CI Bug Log - changes from XEIGT_8674_FULL -> XEIGTPW_14268_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_14268_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_14268_FULL, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
> Participating hosts (2 -> 2)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    XEIGTPW_14268_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>           * shard-bmg: PASS -> INCOMPLETE +1 other test incomplete

Patch is unrelated to above regression.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_14268_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1407) +2 other tests skip
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2327) +1 other test skip
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +5 other tests skip
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124) +1 other test skip
>      * igt@kms_big_fb@yf-tiled-addfb:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1467) +1 other test skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2328)
>      * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2314 / Intel XE#2894)
>      * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2314 / Intel XE#2894) +2
>             other tests skip
>      * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2191)
>      * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1512)
>      * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#367)
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2669) +3 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3432)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +7 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +11
>             other tests skip
>      * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +3 other tests skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4418)
>      * igt@kms_chamelium_audio@hdmi-audio-edid:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +4 other tests skip
>      * igt@kms_chamelium_color@ctm-0-25:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2325) +1 other test skip
>      * igt@kms_chamelium_color@degamma:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#306)
>      * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373) +1 other test skip
>      * igt@kms_content_protection@atomic:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#1178) +3 other tests fail
>      * igt@kms_content_protection@uevent:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3278)
>      * igt@kms_cursor_crc@cursor-offscreen-128x42:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +1 other test skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424) +1 other test skip
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2321) +1 other test skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2321) +1 other test skip
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309) +1 other test skip
>           * shard-bmg: PASS -> SKIP (Intel XE#2291) +3 other tests skip
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2291) +1 other test skip
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#6715)
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#5299)
>      * igt@kms_dp_linktrain_fallback@dsc-fallback:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4331)
>      * igt@kms_dsc@dsc-basic:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2244)
>      * igt@kms_fb_coherency@memset-crc:
> 
>           * shard-bmg: NOTRUN -> CRASH (Intel XE#6706) +1 other test crash
>      * igt@kms_fb_coherency@memset-crc@mmap-offset-wc:
> 
>           * shard-lnl: NOTRUN -> CRASH (Intel XE#6706) +1 other test crash
>      * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4422)
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4156)
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2373)
>      * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2316) +1 other test skip
>      * igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421) +1 other test skip
>      * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2316) +2 other tests skip
>      * igt@kms_flip@plain-flip-ts-check:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#6266) +1 other test fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293 / Intel XE#2380) +5
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293) +12 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401) +2 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2380) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401 / Intel XE#1745) +2
>             other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +18 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2312) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +25 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6312)
>      * igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2350)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +21 other tests skip
>      * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:
> 
>           * shard-bmg: PASS -> ABORT (Intel XE#6740) +1 other test abort
>      * igt@kms_joiner@basic-big-joiner:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6901)
>      * igt@kms_joiner@basic-force-ultra-joiner:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6900)
>      * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2925)
>      * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6912)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6912)
>      * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#599) +4 other tests skip
>      * igt@kms_plane_multiple@tiling-y:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5020)
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6886) +3 other tests skip
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2392)
>      * igt@kms_pm_dc@deep-pkgc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2505)
>      * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#836)
>      * igt@kms_pm_rpm@dpms-non-lpsp:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#3141)
>      * igt@kms_pm_rpm@package-g7:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6814)
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2893 / Intel
>             XE#4608)
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#4608) +1
>             other test skip
>      * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2893) +1
>             other test skip
>      * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489) +8
>             other tests skip
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2387)
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1128 / Intel XE#1406)
>      * igt@kms_psr@fbc-psr2-suspend:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406) +1 other test skip
>      * igt@kms_psr@fbc-psr2-suspend@edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#4609)
>      * igt@kms_psr@psr-basic:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2234 / Intel
>             XE#2850) +10 other tests skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904) +2
>             other tests skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904) +1
>             other test skip
>      * igt@kms_scaling_modes@scaling-mode-center:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2413) +1 other test skip
>      * igt@kms_setmode@basic:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#6361) +2 other tests fail
>      * igt@kms_setmode@basic@pipe-b-edp-1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#6361) +2 other tests fail
>      * igt@kms_vrr@seamless-rr-switch-vrr:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1499)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1499)
>      * igt@xe_compute@eu-busy-10s:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6599)
>      * igt@xe_eudebug@basic-vm-bind:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837) +1 other test skip
>      * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4837) +4 other tests skip
>      * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4837 / Intel XE#6665) +2
>             other tests skip
>      * igt@xe_eudebug_online@pagefault-read-stress:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6665)
>      * igt@xe_eudebug_online@pagefault-write-stress:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6665 / Intel XE#6681)
>      * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837 / Intel XE#6665) +1
>             other test skip
>      * igt@xe_eudebug_sriov@deny-sriov:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5793)
>      * igt@xe_evict@evict-beng-threads-large-multi-vm:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#688) +2 other tests skip
>      * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +8 other tests skip
>      * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +1 other test skip
>      * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6874) +11 other tests skip
>      * igt@xe_exec_multi_queue@two-queues-priority:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6874) +26 other tests skip
>      * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4943) +8 other tests skip
>      * igt@xe_exec_system_allocator@many-stride-malloc-prefetch-madvise:
> 
>           * shard-lnl: NOTRUN -> WARN (Intel XE#5786)
>      * igt@xe_exec_system_allocator@many-stride-new-prefetch:
> 
>           * shard-bmg: PASS -> INCOMPLETE (Intel XE#6480)
>      * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6196)
>      * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4943) +20 other tests skip
>      * igt@xe_gt_freq@freq_suspend:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#584) +1 other test skip
>      * igt@xe_media_fill@media-fill:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2459 / Intel XE#2596)
>      * igt@xe_module_load@load:
> 
>           * shard-lnl: (PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS) -> (PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, SKIP, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS) (Intel
>             XE#378)
>      * igt@xe_pm@d3cold-mmap-system:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366)
>      * igt@xe_pm@s2idle-d3cold-basic-exec:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2284) +1 other test skip
>      * igt@xe_pmu@engine-activity-accuracy-50:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#6251) +1 other test fail
>      * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#6251)
>      * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4733) +1 other test skip
>      * igt@xe_query@multigpu-query-mem-usage:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#944) +3 other tests skip
>      * igt@xe_query@multigpu-query-topology-l3-bank-mask:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#944) +1 other test skip
>      * igt@xe_sriov_flr@flr-vfs-parallel:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#6569)
>      * igt@xe_vm@out-of-memory:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#5745)
> 
>     Possible fixes
> 
>      * igt@core_hotunplug@hotreplug-lateclose:
> 
>           * shard-bmg: SKIP (Intel XE#6779) -> PASS
>      * igt@device_reset@unbind-reset-rebind:
> 
>           * shard-bmg: SKIP (Intel XE#6815) -> PASS
>      * igt@fbdev@nullptr:
> 
>           * shard-bmg: SKIP (Intel XE#2134) -> PASS +2 other tests pass
>      * igt@intel_hwmon@hwmon-read:
> 
>           * shard-bmg: SKIP (Intel XE#5177 / Intel XE#6703) -> PASS
>      * igt@kms_addfb_basic@unused-handle:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> PASS +721 other tests pass
>      * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
> 
>           * shard-lnl: FAIL (Intel XE#6054) -> PASS +3 other tests pass
>      * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-a-edp-1:
> 
>           * shard-lnl: FAIL (Intel XE#5993) -> PASS +1 other test pass
>      * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
> 
>           * shard-bmg: SKIP (Intel XE#2291) -> PASS
>      * igt@kms_flip@2x-flip-vs-panning-vs-hang:
> 
>           * shard-bmg: SKIP (Intel XE#2316) -> PASS +1 other test pass
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>           * shard-lnl: FAIL (Intel XE#301 / Intel XE#3149) -> PASS +1 other
>             test pass
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
> 
>           * shard-lnl: FAIL (Intel XE#301) -> PASS
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * shard-bmg: INCOMPLETE (Intel XE#2049 / Intel XE#2597) -> PASS
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-bmg: ABORT (Intel XE#6740) -> PASS +1 other test pass
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-lnl: FAIL (Intel XE#718) -> PASS
>      * igt@kms_pm_rpm@basic-pci-d3-state:
> 
>           * shard-lnl: SKIP (Intel XE#6921) -> PASS
>      * igt@kms_pm_rpm@basic-rte:
> 
>           * shard-bmg: SKIP (Intel XE#6693) -> PASS +4 other tests pass
>      * igt@kms_vblank@ts-continuation-dpms-rpm:
> 
>           * shard-lnl: SKIP (Intel XE#6919) -> PASS +2 other tests pass
>      * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
> 
>           * shard-lnl: FAIL (Intel XE#2142) -> PASS +1 other test pass
>      * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
> 
>           * shard-lnl: FAIL (Intel XE#5625) -> PASS
>      * igt@xe_exec_system_allocator@threads-many-execqueues-new-nomemset:
> 
>           * shard-bmg: SKIP (Intel XE#6557 / Intel XE#6703) -> PASS +12 other
>             tests pass
>      * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
> 
>           * shard-bmg: SKIP (Intel XE#2229) -> PASS
>      * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0:
> 
>           * shard-lnl: FAIL (Intel XE#6251) -> PASS
>      * igt@xe_sriov_auto_provisioning@selfconfig-basic:
> 
>           * shard-bmg: FAIL (Intel XE#5937) -> PASS +1 other test pass
> 
>     Warnings
> 
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2327) +4 other
>             tests skip
>      * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#607)
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#1124) +12 other
>             tests skip
>      * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2314 / Intel
>             XE#2894)
>      * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#367) +2 other
>             tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2887) +21 other
>             tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2652 / Intel
>             XE#787)
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2724)
>      * igt@kms_chamelium_color@ctm-0-75:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2325) +1 other
>             test skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2252) +9 other
>             tests skip
>      * igt@kms_chamelium_sharpness_filter@filter-basic:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#6507)
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2390) +1 other
>             test skip
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2341) +1 other
>             test skip
>      * igt@kms_cursor_crc@cursor-onscreen-max-size:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2320) +4 other
>             tests skip
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2321)
>      * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
> 
>           * shard-bmg: SKIP (Intel XE#6557 / Intel XE#6703) -> SKIP (Intel
>             XE#2320)
>      * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> DMESG-WARN (Intel XE#5354)
>      * igt@kms_dp_link_training@uhbr-sst:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#4354)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2244)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#1138)
>      * igt@kms_feature_discovery@psr2:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2374)
>      * igt@kms_flip@2x-flip-vs-dpms-on-nop:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2316) +1 other
>             test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2293 / Intel
>             XE#2380) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2312) +9 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#4141) +17 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#4141) -> SKIP (Intel XE#2312) +4 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#4141) +4 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2352) +1 other
>             test skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2311) +4 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2311) +29 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +4 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#6557 / Intel XE#6703) -> SKIP (Intel
>             XE#2311)
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +8 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2313) +32 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2313) +3 other
>             tests skip
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#3544)
>      * igt@kms_joiner@basic-max-non-joiner:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#4298)
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2486)
>      * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * shard-lnl: SKIP (Intel XE#4329) -> SKIP (Intel XE#4329 / Intel
>             XE#6912)
>      * igt@kms_plane_multiple@2x-tiling-yf:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#5021)
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#6886)
>      * igt@kms_pm_backlight@fade:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#870)
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#3309)
>      * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * shard-bmg: SKIP (Intel XE#6693) -> SKIP (Intel XE#1439 / Intel
>             XE#3141 / Intel XE#836)
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
> 
>           * shard-bmg: SKIP (Intel XE#1406 / Intel XE#6703) -> SKIP (Intel
>             XE#1406 / Intel XE#1489) +10 other tests skip
>      * igt@kms_psr@psr-primary-page-flip:
> 
>           * shard-bmg: SKIP (Intel XE#1406 / Intel XE#6703) -> SKIP (Intel
>             XE#1406 / Intel XE#2234 / Intel XE#2850) +16 other tests skip
>      * igt@kms_rotation_crc@bad-pixel-format:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#3414 / Intel
>             XE#3904) +1 other test skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2330)
>      * igt@kms_sharpness_filter@filter-formats:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#6503) +4 other
>             tests skip
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-bmg: FAIL (Intel XE#1729) -> SKIP (Intel XE#2426)
>      * igt@kms_tv_load_detect@load-detect:
> 
>           * shard-bmg: SKIP (Intel XE#6557 / Intel XE#6703) -> SKIP (Intel
>             XE#2450)
>      * igt@kms_vrr@cmrr:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2168)
>      * igt@kms_vrr@seamless-rr-switch-virtual:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#1499)
>      * igt@xe_compute@ccs-mode-basic:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#6599)
>      * igt@xe_eudebug@basic-vm-access-userptr:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#4837) +7 other
>             tests skip
>      * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
> 
>           * shard-bmg: SKIP (Intel XE#6557 / Intel XE#6703) -> SKIP (Intel
>             XE#4837)
>      * igt@xe_eudebug_online@set-breakpoint-faultable:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#4837 / Intel
>             XE#6665) +8 other tests skip
>      * igt@xe_exec_basic@multigpu-once-null-rebind:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2322) +9 other
>             tests skip
>      * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#6874) +37 other
>             tests skip
>      * igt@xe_exec_system_allocator@many-64k-mmap-new-huge:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#5007) +1 other
>             test skip
>      * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#4943) +31 other
>             tests skip
>      * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#6281)
>      * igt@xe_mmap@small-bar:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#586)
>      * igt@xe_pm@d3cold-i2c:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#5694)
>      * igt@xe_pm@d3hot-i2c:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#5742)
>      * igt@xe_pm@s3-d3cold-basic-exec:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#2284) +1 other
>             test skip
>      * igt@xe_pm@vram-d3cold-threshold:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#579)
>      * igt@xe_pxp@display-black-pxp-fb:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#4733) +2 other
>             tests skip
>      * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#944) +5 other
>             tests skip
> 
> Build changes
> 
>      * IGT: IGT_8674 -> IGTPW_14268
>      * Linux: xe-4267-e0eb6ad399f8369d978ca40f07cbf5c6c16647d7 ->
>        xe-4296-cab246648fd89efbe8d20ed4c86e7fcebd7606da
> 
>    IGTPW_14268: 14268
>    IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-4267-e0eb6ad399f8369d978ca40f07cbf5c6c16647d7:
>    e0eb6ad399f8369d978ca40f07cbf5c6c16647d7
>    xe-4296-cab246648fd89efbe8d20ed4c86e7fcebd7606da:
>    cab246648fd89efbe8d20ed4c86e7fcebd7606da
