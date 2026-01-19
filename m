Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC8ECCF2E6
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 11:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE50D10E244;
	Mon, 19 Jan 2026 11:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="elZWyRd0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE99710E244
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 11:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768821286; x=1800357286;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=rwbNdaO9KZazZIbGPYBcLEXNluLO110l7R2dC1FseGM=;
 b=elZWyRd0UUjv/xVS5lYo7NlsF4kTQSlRmlvYnM01leEy8NnDb4hnq6ou
 dHyz1VpAKNgXuM5JUeqdalhb1MEp9xPHHeJO7baKgdPFh6vHutuHzisYj
 hOMU2WWb+iSci/hmt4sukxcUklOnaO00R+QbVPkOcue0ACXxaTkHDyj6g
 zyC+9runBqbUuRO9oYNgkFCaYudb45ZHCyiZkyQjcBQlIbM96Z380wIYA
 LtXl4DN+SD5XK9UJCElyr98P3fJR0iWEfMDGSVUo5wrDuf/jOZikIDSx4
 61lm5nGZc0a/s9ZMkIhsLkBK5esuEYgImPHBGvfQ8MK6tLm9rd8SZtkLZ w==;
X-CSE-ConnectionGUID: jFit0BX8Tea8BR8DFyEh1Q==
X-CSE-MsgGUID: RBh8PZbnSdendZNnW6x0NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="73885857"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="73885857"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 03:14:45 -0800
X-CSE-ConnectionGUID: OUD4rg2eQWCXGfbydEYkGw==
X-CSE-MsgGUID: eIJb/86CSESQo36NgRnNfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="228779428"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.56])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 03:14:44 -0800
Date: Mon, 19 Jan 2026 12:14:42 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 Add xe3p compute kernels and preemption support (rev4)
Message-ID: <as4tgov3rp2zzzqil7nsqoqi72dwcvkmhmgzza42ssndsdxe2e@4pmksj23cmeg>
References: <20260116154636.204553-7-zbigniew.kempczynski@intel.com>
 <176859290386.162646.10540229348906439883@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176859290386.162646.10540229348906439883@a3b018990fe9>
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

On Fri, Jan 16, 2026 at 07:48:23PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add xe3p compute kernels and preemption support (rev4)           
>    URL:     https://patchwork.freedesktop.org/series/159522/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14358/index.html 
> 
>         CI Bug Log - changes from XEIGT_8704_FULL -> XEIGTPW_14358_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_14358_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_14358_FULL, please notify your bug team
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
>    XEIGTPW_14358_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_plane_alpha_blend@coverage-7efc:
> 
>           * shard-bmg: PASS -> FAIL +2 other tests fail
>      * igt@kms_universal_plane@universal-plane-functional@pipe-c-dp-2:
> 
>           * shard-bmg: PASS -> INCOMPLETE +1 other test incomplete

Above failures are unrelated to the series.

--
Zbigniew

> 
>     Warnings
> 
>      * igt@xe_pm@d3cold-basic:
>           * shard-bmg: SKIP (Intel XE#2284) -> ABORT
> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_14358_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#5993) +3 other tests fail
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>           * shard-bmg: PASS -> INCOMPLETE (Intel XE#6819 / Intel XE#6904) +1
>             other test incomplete
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2327) +4 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3658)
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1407)
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +7 other tests skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124) +6 other tests skip
>      * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1512)
>      * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#367)
>      * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#367) +3 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +5 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2669) +3 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3432) +1 other test skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +8 other
>             tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3432) +1 other test skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +10 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-a-edp-1:
> 
>           * shard-lnl: PASS -> DMESG-WARN (Intel XE#7063) +5 other tests
>             dmesg-warn
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2724)
>      * igt@kms_chamelium_color@ctm-blue-to-red:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2325) +1 other test skip
>      * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373) +5 other tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-storm:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +8 other tests skip
>      * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6974)
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2390 / Intel XE#6974)
>      * igt@kms_content_protection@legacy:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#1178 / Intel XE#3304) +1
>             other test fail
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3278) +1 other test skip
>      * igt@kms_cursor_crc@cursor-offscreen-32x10:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424)
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2321)
>      * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +1 other test skip
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2321) +1 other test skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309) +1 other test skip
>      * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
> 
>           * shard-bmg: PASS -> DMESG-WARN (Intel XE#5354)
>      * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1508)
>      * igt@kms_dp_link_training@non-uhbr-mst:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4354)
>      * igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4294)
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2244)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#776) +1 other test skip
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2372)
>      * igt@kms_feature_discovery@psr1:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2374)
>      * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421) +4 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1397) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293 / Intel XE#2380) +3
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401 / Intel XE#1745) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7061) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +13 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +24 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +21 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7061) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +28 other tests skip
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2486)
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2938)
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2392)
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3309)
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#836)
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489) +5
>             other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2893 / Intel
>             XE#4608)
>      * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#4608) +1
>             other test skip
>      * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2893) +1
>             other test skip
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1128 / Intel XE#1406)
>      * igt@kms_psr@fbc-psr2-primary-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406) +1 other test skip
>      * igt@kms_psr@fbc-psr2-primary-render@edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#4609)
>      * igt@kms_psr@psr-basic:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2234 / Intel
>             XE#2850) +10 other tests skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904) +2
>             other tests skip
>      * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904)
>      * igt@kms_sequence@get-forked-busy:
> 
>           * shard-lnl: PASS -> DMESG-WARN (Intel XE#4537 / Intel XE#7063) +2
>             other tests dmesg-warn
>      * igt@kms_setmode@basic:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#6361) +1 other test fail
>      * igt@kms_setmode@basic-clone-single-crtc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1435)
>      * igt@kms_sharpness_filter@filter-basic:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6503)
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#1729)
>      * igt@kms_tv_load_detect@load-detect:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#330)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2450)
>      * igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#4459) +1 other test fail
>      * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#2142) +1 other test fail
>      * igt@xe_compute@ccs-mode-basic:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6599) +1 other test skip
>      * igt@xe_eudebug@basic-vm-bind-extended-discovery:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837) +2 other tests skip
>      * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4837) +5 other tests skip
>      * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837 / Intel XE#6665)
>      * igt@xe_eudebug_online@pagefault-one-of-many:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6665)
>      * igt@xe_eudebug_online@pagefault-write-stress:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6665)
>      * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4837 / Intel XE#6665) +1
>             other test skip
>      * igt@xe_eudebug_sriov@deny-eudebug:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4518)
>      * igt@xe_evict@evict-beng-large-cm:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#688) +5 other tests skip
>      * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +6 other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +2 other tests skip
>      * igt@xe_exec_multi_queue@many-execs-preempt-mode-userptr:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6874) +13 other tests skip
>      * igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6874) +25 other tests skip
>      * igt@xe_exec_reset@gt-reset-stress:
> 
>           * shard-lnl: PASS -> DMESG-WARN (Intel XE#7023)
>      * igt@xe_exec_system_allocator@once-large-mmap-prefetch:
> 
>           * shard-bmg: PASS -> ABORT (Intel XE#3970 / Intel XE#5545)
>      * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6196)
>      * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4943) +14 other tests skip
>      * igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4943) +19 other tests skip
>      * igt@xe_module_load@load:
> 
>           * shard-bmg: (PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS) -> (PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, SKIP, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS)
>             (Intel XE#2457)
>      * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6964) +3 other tests skip
>      * igt@xe_multigpu_svm@mgpu-pagefault-basic:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6964) +3 other tests skip
>      * igt@xe_pm@d3cold-i2c:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#5694)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5694)
>      * igt@xe_pm@d3cold-mocs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2284)
>      * igt@xe_pm@d3hot-i2c:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5742)
>      * igt@xe_pm@s3-exec-after:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#584)
>      * igt@xe_pm@vram-d3cold-threshold:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#579)
>      * igt@xe_pxp@pxp-stale-queue-post-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4733)
>      * igt@xe_query@multigpu-query-invalid-query:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_query@multigpu-query-invalid-size:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_sriov_flr@flr-vfs-parallel:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#6569) +1 other test fail
>      * igt@xe_sriov_vram@vf-access-after-resize-down:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6376)
>      * igt@xe_vm@out-of-memory:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#5745)
> 
>     Possible fixes
> 
>      * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
> 
>           * shard-lnl: FAIL (Intel XE#6054) -> PASS +3 other tests pass
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-bmg: INCOMPLETE (Intel XE#7084) -> PASS +1 other test pass
>      * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> 
>           * shard-lnl: FAIL (Intel XE#301) -> PASS +1 other test pass
>      * igt@kms_pm_dc@dc5-dpms:
> 
>           * shard-lnl: FAIL (Intel XE#718) -> PASS
>      * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
> 
>           * shard-lnl: DMESG-WARN (Intel XE#4537) -> PASS +1 other test pass
>      * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
> 
>           * shard-lnl: DMESG-WARN (Intel XE#7063) -> PASS +10 other tests
>             pass
> 
>     Warnings
> 
>      * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
> 
>           * shard-bmg: SKIP (Intel XE#7064) -> SKIP (Intel XE#7064 / Intel
>             XE#7081) +2 other tests skip
>      * igt@xe_exec_system_allocator@many-stride-new-prefetch:
> 
>           * shard-bmg: INCOMPLETE (Intel XE#6480) -> INCOMPLETE (Intel
>             XE#7098)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * IGT: IGT_8704 -> IGTPW_14358
>      * Linux: xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d ->
>        xe-4396-eaf341ec50e661b2c81347e4bb9f3348b7fea5b9
> 
>    IGTPW_14358: 14358
>    IGT_8704: 8704
>    xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d:
>    733664f1edf3c01cc68e6dd0bbdb135158a98a1d
>    xe-4396-eaf341ec50e661b2c81347e4bb9f3348b7fea5b9:
>    eaf341ec50e661b2c81347e4bb9f3348b7fea5b9
