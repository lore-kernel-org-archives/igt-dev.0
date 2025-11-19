Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B58ECF31A6
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 11:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DAB10E238;
	Wed, 19 Nov 2025 11:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZxQbScvi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73DE10E5D7
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 11:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763551403; x=1795087403;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=guObBoQ0UC0+l1xWUy6lqdJqltaxfJ2J9x2WdCyfL6g=;
 b=ZxQbScviwuH6kjomF0CWlYQO84DemAghK3c4+i8BDhfa3tbVwNQvq7cC
 PAOd2XxxtcO158Hfd5qI/kcI33gu1fEc0mhyK2LOw1tSfl2rhTmOJbLH5
 QyDDhCgc6Fi9SP0djE72/jARnWs3GtgZJWtFQkzgOgGZHU7icNQqo0yaf
 VKwhBHsis0Wi1JoeqdbSDal3StxGOMLaYEzfrEkQzxRouremgESLdz8WS
 2+09LQXMU09XaTiybJeqtgb4LWV0h+bzLqP/CMd9qgl/x2/9264iwRgR/
 k8HTfm3wuBi22q7kemHyVgdJ8JOIMSYLPeCvc3HCFqaiVS4U4FGoU84XX A==;
X-CSE-ConnectionGUID: 2oey6Dr7RYelexRf30ZT3g==
X-CSE-MsgGUID: 0yf0Jd75SheXOfVWYs0ucw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65529169"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="65529169"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 03:23:23 -0800
X-CSE-ConnectionGUID: XuzrpM6KRXe1lya+0tFplA==
X-CSE-MsgGUID: FybpLgHwRsSvqTfUnt+poQ==
X-ExtLoop1: 1
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.213])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 03:23:22 -0800
Date: Wed, 19 Nov 2025 12:23:19 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_lib=2Fintel?=
 =?utf-8?B?X2JsdDo=?= fix pointer arithmetic in ctrl-surf-copy and mem-copy
Message-ID: <25smwf67ws4i2g2xi4xlko74mecbznj2lkjpcmab42capeatql@5zabejde7655>
References: <20251118091136.734019-2-zbigniew.kempczynski@intel.com>
 <176346808600.5561.9897438294326531266@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176346808600.5561.9897438294326531266@a3b018990fe9>
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

On Tue, Nov 18, 2025 at 12:14:46PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/intel_blt: fix pointer arithmetic in ctrl-surf-copy and       
>             mem-copy                                                          
>    URL:     https://patchwork.freedesktop.org/series/157699/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14075/index.html  
> 
>         CI Bug Log - changes from XEIGT_8630_FULL -> XEIGTPW_14075_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_14075_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_14075_FULL, please notify your bug team
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
>    XEIGTPW_14075_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@xe_pmu@engine-activity-single-load:
>           * shard-dg2-set2: PASS -> FAIL +1 other test fail

Unrelated to the change.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_14075_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-a-edp-1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#5993)
>      * igt@kms_atomic_transition@plane-all-modeset-transition:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3279)
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2327)
>      * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#316) +1 other test skip
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124) +2 other tests
>             skip
>      * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#607)
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +1 other test skip
>      * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2314 / Intel XE#2894)
>      * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2191)
>      * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +7
>             other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2907)
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +2 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-bmg: PASS -> INCOMPLETE (Intel XE#3862) +1 other test
>             incomplete
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#3862) +1 other test
>             incomplete
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3432)
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +27 other tests
>             skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1727 / Intel XE#2705
>             / Intel XE#3113 / Intel XE#4212 / Intel XE#4345 / Intel XE#4522)
>             +2 other tests incomplete
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#1727 / Intel
>             XE#3113)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1727 / Intel XE#2705
>             / Intel XE#3113 / Intel XE#4212 / Intel XE#4522)
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4418)
>      * igt@kms_chamelium_color@ctm-0-25:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2325)
>      * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#373) +1 other test skip
>      * igt@kms_chamelium_frames@dp-crc-fast:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +1 other test skip
>      * igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#308)
>      * igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2321)
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2291) +3 other tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>           * shard-bmg: PASS -> DMESG-WARN (Intel XE#5354) +1 other test
>             dmesg-warn
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#1475)
>      * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4422)
>      * igt@kms_flip@2x-nonexisting-fb:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2316) +5 other tests skip
>      * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421)
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * shard-bmg: PASS -> INCOMPLETE (Intel XE#2049 / Intel XE#2597) +1
>             other test incomplete
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#2049 / Intel
>             XE#2597) +3 other tests incomplete
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +8 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +12 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +10 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +8 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2312)
>      * igt@kms_hdr@static-swap:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#1503)
>      * igt@kms_plane_lowres@tiling-yf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2393)
>      * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489)
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2387)
>      * igt@kms_psr@fbc-psr2-cursor-plane-move:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2850 /
>             Intel XE#929) +4 other tests skip
>      * igt@kms_psr@psr-sprite-plane-onoff:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2234 / Intel
>             XE#2850) +2 other tests skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2330)
>      * igt@kms_scaling_modes@scaling-mode-full:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2413)
>      * igt@kms_sharpness_filter@filter-modifiers:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6503)
>      * igt@kms_vrr@lobf:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2168)
>      * igt@xe_compute_preempt@compute-preempt-many-vram:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#6360)
>      * igt@xe_eu_stall@blocking-re-enable:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#5626) +1 other test skip
>      * igt@xe_eudebug_online@resume-dss:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4837) +2 other tests
>             skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837)
>      * igt@xe_eudebug_online@tdctl-parameters:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4837) +3 other tests skip
>      * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +3 other tests skip
>      * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392)
>      * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288) +11 other tests
>             skip
>      * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2360)
>      * igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5007)
>      * igt@xe_exec_system_allocator@once-mmap-nomemset:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4915) +98 other tests
>             skip
>      * igt@xe_exec_system_allocator@twice-mmap-huge:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4943) +3 other tests skip
>      * igt@xe_gt_freq@freq_suspend:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#584)
>      * igt@xe_oa@missing-sample-flags:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3573) +2 other tests
>             skip
>      * igt@xe_pat@pat-index-xelpg:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2236)
>      * igt@xe_pm@d3cold-basic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2284)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366)
>      * igt@xe_pm@d3cold-i2c:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#5694)
>      * igt@xe_pm_residency@idle-residency:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#6362) +1 other test fail
>      * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#6251) +1 other test fail
>      * igt@xe_pxp@display-pxp-fb:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4733)
>      * igt@xe_query@multigpu-query-topology-l3-bank-mask:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#944)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_render_copy@render-stress-1-copies:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4814)
>      * igt@xe_sriov_flr@flr-vf1-clear:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#6569)
>      * igt@xe_survivability@runtime-survivability:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#6529)
> 
>     Possible fixes
> 
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#6168) -> PASS
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1727 / Intel XE#3113) ->
>             PASS
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>           * shard-bmg: SKIP (Intel XE#2291) -> PASS +1 other test pass
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-bmg: SKIP (Intel XE#2373) -> PASS
>      * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
> 
>           * shard-bmg: SKIP (Intel XE#2316) -> PASS +5 other tests pass
>      * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> 
>           * shard-lnl: FAIL (Intel XE#301) -> PASS
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455) -> PASS
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-bmg: SKIP (Intel XE#1503) -> PASS +1 other test pass
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-lnl: FAIL (Intel XE#718) -> PASS +1 other test pass
>      * igt@kms_setmode@basic@pipe-b-edp-1:
> 
>           * shard-lnl: FAIL (Intel XE#6361) -> PASS +2 other tests pass
>      * igt@kms_setmode@invalid-clone-single-crtc:
> 
>           * shard-bmg: SKIP (Intel XE#1435) -> PASS
>      * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#4842) -> PASS
>      * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
> 
>           * shard-lnl: FAIL (Intel XE#6251) -> PASS
>      * igt@xe_sriov_flr@flr-vfs-parallel:
> 
>           * shard-bmg: FAIL (Intel XE#6569) -> PASS
>      * igt@xe_sriov_vram@vf-access-after-resize-up:
> 
>           * shard-bmg: FAIL (Intel XE#5937) -> PASS +1 other test pass
> 
>     Warnings
> 
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1727 / Intel XE#3113 / Intel
>             XE#4345 / Intel XE#6168) -> INCOMPLETE (Intel XE#1727 / Intel
>             XE#3113 / Intel XE#4345)
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-bmg: FAIL (Intel XE#1178) -> SKIP (Intel XE#2341)
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +11 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2311) +8 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#4141) +1 other
>             test skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#4141) -> SKIP (Intel XE#2312) +3 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +10 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2313) +5 other
>             tests skip
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-bmg: FAIL (Intel XE#1729) -> SKIP (Intel XE#2426)
>           * shard-dg2-set2: FAIL (Intel XE#1729) -> SKIP (Intel XE#362)
>      * igt@xe_sriov_flr@flr-each-isolation:
> 
>           * shard-bmg: FAIL (Intel XE#5937) -> FAIL (Intel XE#6569)
> 
> Build changes
> 
>      * IGT: IGT_8630 -> IGTPW_14075
> 
>    IGTPW_14075: 14075
>    IGT_8630: 8630
>    xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8:
>    91fc6d984707c9bfd4a60550e6a85f1a991e7ec8
