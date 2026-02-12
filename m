Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C903EB491D
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 12:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F9210E262;
	Thu, 12 Feb 2026 12:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRKR1KWy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3608210E262
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 12:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770900929; x=1802436929;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=nr2coiuNAE3oJttdhWvyWphggMJwdphRD9Z00VJrbhY=;
 b=ZRKR1KWys2ov1yKozb4q+wUddMQab6mYxszAnnQfEjaOnsuy1ME0sAmQ
 zLwr+SiehFzgRHdnrMhvlak6HH3Y60nw+zoSNO0dN4AikXxKrZRGIVZk1
 +SEVaY/hhWYRXDQOtQg+FliJZGd3ZVsfsLHGOtAqSXJ6UPUCs5GXPomNU
 c1KfWespExCDeVfQE0d/2K4T5dY0xupcwfJzYG2x1y4YRNLtFOIQUukaa
 z4nE6scRPymd6R71i/BqFiOl99UyzR2A5W/1qh/TVOtRDlrnuutXS71Za
 aY8CwB0SfLqS5rpxHk0rdURY5S86Kocgjdwf6AUEBE6/fdY8JpfaevCig g==;
X-CSE-ConnectionGUID: EksDIM0rTgGuGmHBZd4gmw==
X-CSE-MsgGUID: +340FHghQbimdN6/uNwZdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="83167712"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="83167712"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 04:55:28 -0800
X-CSE-ConnectionGUID: TDT963u2QCizFcWLYAnFYA==
X-CSE-MsgGUID: 0+1BrrhrSLauZGIwf9QqZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="217068932"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.107])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 04:55:27 -0800
Date: Thu, 12 Feb 2026 13:55:25 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_lib=2Fintel?=
 =?utf-8?B?X2NvbXB1dGU6?= Add compute and preemption support for NVL-P
Message-ID: <tcat3fimlxlquj2rwu7vbvnkxcm64yd2fev7vpl7eth2767jt5@bplxpam4ou2a>
References: <20260209120622.235501-2-zbigniew.kempczynski@intel.com>
 <177070378614.240455.14801340895900221816@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177070378614.240455.14801340895900221816@a3b018990fe9>
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

On Tue, Feb 10, 2026 at 06:09:46AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/intel_compute: Add compute and preemption support for NVL-P  
>    URL:     https://patchwork.freedesktop.org/series/161353/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14518/index.html 
> 
>         CI Bug Log - changes from XEIGT_8746_FULL -> XEIGTPW_14518_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_14518_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_14518_FULL, please notify your bug team
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
>    XEIGTPW_14518_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@xe_exec_reset@long-spin-many-preempt-threads:
>           * shard-bmg: PASS -> INCOMPLETE

Unrelated to the change.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_14518_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@intel_hwmon@hwmon-read:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1125)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2370)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1407)
>      * igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2327) +1 other test skip
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +3 other tests skip
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124) +6 other tests skip
>      * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2314 / Intel XE#2894)
>      * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2314 / Intel XE#2894)
>      * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#367)
>      * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#367)
>      * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +3 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +5 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3432) +1 other test skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3432) +1 other test skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +7 other
>             tests skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2724)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4418)
>      * igt@kms_chamelium_color@ctm-blue-to-red:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#306) +1 other test skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2325)
>      * igt@kms_chamelium_frames@hdmi-crc-single:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +3 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373) +3 other tests skip
>      * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#3304)
>      * igt@kms_content_protection@content-type-change:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2341) +1 other test skip
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2390 / Intel XE#6974)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3278)
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#6707) +1 other test fail
>      * igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2321) +1 other test skip
>      * igt@kms_cursor_crc@cursor-random-256x256@pipe-d-dp-2:
> 
>           * shard-bmg: PASS -> DMESG-FAIL (Intel XE#6652 / Intel XE#6819) +1
>             other test dmesg-fail
>      * igt@kms_cursor_crc@cursor-random-32x32:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +3 other tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424) +1 other test skip
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2321)
>      * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2291) +5 other tests skip
>      * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2291)
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309) +2 other tests skip
>      * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#5299)
>      * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4210)
>      * igt@kms_dp_aux_dev:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#3009)
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2244) +1 other test skip
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#701)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1138)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1138)
>      * igt@kms_feature_discovery@psr2:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2374)
>      * igt@kms_flip@2x-flip-vs-expired-vblank:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421) +2 other tests skip
>      * igt@kms_flip@2x-flip-vs-panning-vs-hang:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2316)
>      * igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2316) +8 other tests skip
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#301)
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * shard-bmg: PASS -> INCOMPLETE (Intel XE#2049 / Intel XE#2597) +1
>             other test incomplete
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7178) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7179)
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7178) +1 other test skip
>      * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7061)
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7061) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2312) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +20 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +13 other tests skip
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3374 / Intel XE#3544)
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#1503)
>      * igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#7086)
>      * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7130) +8 other tests skip
>      * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-0:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7130) +12 other tests skip
>      * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-5:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7111 / Intel XE#7130) +1
>             other test skip
>      * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7111 / Intel XE#7130 / Intel
>             XE#7131)
>      * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-5:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7131)
>      * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-5:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7111 / Intel XE#7131)
>      * igt@kms_plane_lowres@tiling-yf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2393)
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#718)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2392)
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3309)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3309)
>      * igt@kms_pm_dc@deep-pkgc:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#2029)
>      * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#3141 / Intel
>             XE#836)
>      * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489) +4
>             other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2893 / Intel
>             XE#4608)
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#4608) +1
>             other test skip
>      * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2893) +3
>             other tests skip
>      * igt@kms_psr@pr-primary-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406) +2 other tests skip
>      * igt@kms_psr@psr-basic:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2234 / Intel
>             XE#2850) +3 other tests skip
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2414)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1127) +1 other test skip
>      * igt@kms_setmode@clone-exclusive-crtc:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#1435)
>      * igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1435) +1 other test skip
>      * igt@kms_vrr@flipline:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#4227) +1 other test fail
>      * igt@kms_vrr@lobf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2168)
>      * igt@kms_vrr@lobf@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#6390) +1 other test fail
>      * igt@xe_eudebug@discovery-empty-clients:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837) +3 other tests skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4837) +1 other test skip
>      * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837 / Intel XE#6665) +2
>             other tests skip
>      * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4837 / Intel XE#6665) +2
>             other tests skip
>      * igt@xe_eudebug_sriov@deny-sriov:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4518)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5793)
>      * igt@xe_evict@evict-small-external-multi-queue:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7140)
>      * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#688) +4 other tests skip
>      * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +4 other tests skip
>      * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +4 other tests skip
>      * igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7136) +5 other tests skip
>      * igt@xe_exec_fault_mode@twice-multi-queue-invalid-fault:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7136) +7 other tests skip
>      * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6874) +12 other tests skip
>      * igt@xe_exec_multi_queue@two-queues-priority:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6874) +11 other tests skip
>      * igt@xe_exec_system_allocator@many-64k-mmap-huge:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5007)
>      * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6196)
>      * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4943) +11 other tests skip
>      * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-huge:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4943) +9 other tests skip
>      * igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7138) +2 other tests skip
>      * igt@xe_exec_threads@threads-multi-queue-fd-rebind:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7138) +2 other tests skip
>      * igt@xe_live_ktest@xe_eudebug:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2833)
>      * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6964)
>      * igt@xe_multigpu_svm@mgpu-pagefault-conflict:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6964) +1 other test skip
>      * igt@xe_pm@d3cold-mocs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2284)
>      * igt@xe_pm@s2idle-basic-exec:
> 
>           * shard-lnl: PASS -> ABORT (Intel XE#7169)
>      * igt@xe_pm@s3-vm-bind-unbind-all:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#584) +1 other test skip
>      * igt@xe_pmu@fn-engine-activity-sched-if-idle:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4650)
>      * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4733)
>      * igt@xe_query@multigpu-query-config:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_query@multigpu-query-engines:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#944) +1 other test skip
>      * igt@xe_sriov_admin@sched-priority-write-readback-vfs-disabled:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7174)
>      * igt@xe_sriov_flr@flr-vfs-parallel:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4273)
>      * igt@xe_sriov_scheduling@equal-throughput:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4351)
> 
>     Possible fixes
> 
>      * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> 
>           * shard-bmg: SKIP (Intel XE#2314 / Intel XE#2894) -> PASS
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-bmg: INCOMPLETE (Intel XE#7084) -> PASS +1 other test pass
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>           * shard-bmg: SKIP (Intel XE#2291) -> PASS +2 other tests pass
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> 
>           * shard-bmg: FAIL (Intel XE#6715) -> PASS
>      * igt@kms_flip@2x-nonexisting-fb:
> 
>           * shard-bmg: SKIP (Intel XE#2316) -> PASS +6 other tests pass
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
> 
>           * shard-lnl: FAIL (Intel XE#301) -> PASS
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-lnl: FAIL (Intel XE#718) -> PASS
>      * igt@kms_pm_rpm@universal-planes-dpms:
> 
>           * shard-lnl: SKIP (Intel XE#7197) -> PASS
>      * igt@xe_prime_self_import@basic-with_two_bos:
> 
>           * shard-bmg: ABORT (Intel XE#7169) -> PASS
> 
>     Warnings
> 
>      * igt@kms_content_protection@atomic:
> 
>           * shard-bmg: FAIL (Intel XE#1178 / Intel XE#3304) -> SKIP (Intel
>             XE#2341) +2 other tests skip
>      * igt@kms_content_protection@atomic-dpms-hdcp14:
> 
>           * shard-bmg: SKIP (Intel XE#7194) -> FAIL (Intel XE#3304)
>      * igt@kms_flip@flip-vs-suspend:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#5208) -> INCOMPLETE (Intel
>             XE#2049 / Intel XE#2597)
>      * igt@kms_flip@flip-vs-suspend@d-hdmi-a3:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#3428) -> INCOMPLETE (Intel
>             XE#2049 / Intel XE#2597)
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +12 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
> 
>           * shard-bmg: SKIP (Intel XE#4141) -> SKIP (Intel XE#2312) +9 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#4141) +11 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2311) +14 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2313) +17 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +18 other
>             tests skip
>      * igt@kms_plane_multiple@2x-tiling-yf:
> 
>           * shard-bmg: SKIP (Intel XE#5021) -> SKIP (Intel XE#4596)
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-bmg: SKIP (Intel XE#2509) -> SKIP (Intel XE#2426)
>      * igt@xe_exec_multi_queue@few-execs-basic-smem:
> 
>           * shard-bmg: SKIP (Intel XE#6874) -> ABORT (Intel XE#7169)
>      * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> 
>           * shard-bmg: ABORT (Intel XE#5466) -> ABORT (Intel XE#5466 / Intel
>             XE#6652)
> 
> Build changes
> 
>      * IGT: IGT_8746 -> IGTPW_14518
>      * Linux: xe-4529-5e0595fbb024e9b7e243a7ca8a028f93a37883f2 ->
>        xe-4532-d2a98b98376b6a16c835a131b12f295848c656db
> 
>    IGTPW_14518: a3cf2db28f4ef9388182b6046c14a99b919fc7f1 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8746: 8746
>    xe-4529-5e0595fbb024e9b7e243a7ca8a028f93a37883f2:
>    5e0595fbb024e9b7e243a7ca8a028f93a37883f2
>    xe-4532-d2a98b98376b6a16c835a131b12f295848c656db:
>    d2a98b98376b6a16c835a131b12f295848c656db
