Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB4BCD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 13:10:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D61E10E2D4;
	Wed,  6 May 2026 13:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cpOGBV75";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4473910E2D4
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 13:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778072993; x=1809608993;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=aUdSrRK1jSpUPJ6IpXI92hSSNeK4kaCnCtsnBHZj7B0=;
 b=cpOGBV75AEuiFqQkQnVTKGBKB8krjIyELf12KkB4dltlfzZVWcOlft5q
 Gg4dqA6z80jc83q275mSHuqa8o+MorcY98oseSsluF7Z4VgYFUBRYPMtk
 6UALssYWuO9D2g740Pviv8uGELngtQOcWNXXtmgBkPkM7w6MBeBEOyEvQ
 L/nrfoq/K6TB7FE/7FZFANUJl/8PlV5OnOL8kNbnysOF6fxNNh7YH2wMM
 rbXVuirklrX1hWCb2VsmWKiJpP5cnNyZJzD43SzLqeO0eGZHT+uANrzvu
 MxlFlRdlZqzU6/UlppJxIMv/UUrUb4QyLiwLdmUx41mzvZcdz3EZRdlzG Q==;
X-CSE-ConnectionGUID: UjXp+em2SsaOuOc1FhBHrA==
X-CSE-MsgGUID: OdHy6PiHQcmZgd/KTdqi2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90100245"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="90100245"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 06:09:52 -0700
X-CSE-ConnectionGUID: 3wcjK6wXR/u3zqSGl4cdLg==
X-CSE-MsgGUID: o+TzKiGJQha7ibUqWYBlKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="229730389"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.11])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 06:09:52 -0700
Date: Wed, 6 May 2026 15:09:49 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 Extend gpgpu fill support to XE3P (rev2)
Message-ID: <dc72chqkhanhdw3rlz72gy3wuytsx2f642yqyjyx4u3d5cdtrt@7yd46se3lbtc>
References: <20260506065500.162563-4-zbigniew.kempczynski@intel.com>
 <177805795160.42216.1480922915110248366@5ab824fced77>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177805795160.42216.1480922915110248366@5ab824fced77>
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

On Wed, May 06, 2026 at 08:59:11AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Extend gpgpu fill support to XE3P (rev2)                         
>    URL:     https://patchwork.freedesktop.org/series/165308/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15107/index.html 
> 
>         CI Bug Log - changes from XEIGT_8888_FULL -> XEIGTPW_15107_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_15107_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_15107_FULL, please notify your bug team
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
>    XEIGTPW_15107_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
> 
>           * shard-bmg: NOTRUN -> SKIP +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render:
> 
>           * shard-bmg: PASS -> SKIP +19 other tests skip
>      * igt@xe_gpgpu_fill@offset-4x4 (NEW):

This skip is expected, test was designed to Xe3p+.

Other regressions are not related to the series.

--
Zbigniew


> 
>           * shard-lnl: NOTRUN -> SKIP
>      * igt@xe_wedged@wedged-mode-toggle:
> 
>           * shard-bmg: PASS -> ABORT
> 
>     Warnings
> 
>      * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP +10 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-lnl: SKIP (Intel XE#7905) -> ABORT
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP +12 other tests skip
> 
> New tests
> 
>    New tests have been introduced between XEIGT_8888_FULL and
>    XEIGTPW_15107_FULL:
> 
>   New IGT tests (1)
> 
>      * igt@xe_gpgpu_fill@offset-4x4:
>           * Statuses : 2 skip(s)
>           * Exec time: [0.0] s
> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_15107_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#7445)
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1407)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2327) +1 other test skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124) +1 other test skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +4 other tests skip
>      * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7679) +1 other test skip
>      * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7676)
>      * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2669 / Intel XE#7389) +3
>             other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887)
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +8 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3432) +2 other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3432)
>      * igt@kms_chamelium_frames@hdmi-crc-single:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +6 other tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373) +2 other tests skip
>      * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6974)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6974)
>      * igt@kms_cursor_crc@cursor-onscreen-128x42:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +3 other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424)
>      * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2291) +1 other test skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309 / Intel XE#7343) +1 other
>             test skip
>      * igt@kms_dp_link_training@non-uhbr-mst:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4354 / Intel XE#5882)
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2244) +1 other test skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2244)
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6126 / Intel XE#776)
>      * igt@kms_feature_discovery@psr1:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2374 / Intel XE#6127)
>      * igt@kms_flip@2x-absolute-wf_vblank:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2316) +1 other test skip
>      * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421)
>      * igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2316) +4 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7178 / Intel XE#7349)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7178 / Intel XE#7349) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7178 / Intel XE#7351)
>      * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7179)
>      * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6312 / Intel XE#651) +2 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656 / Intel XE#7905) +8 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-msflip-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6312) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7905) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +35 other tests skip
>      * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7865) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7061) +1 other test skip
>      * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7061)
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +31 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7061 / Intel XE#7356) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7061 / Intel XE#7356)
>      * igt@kms_hdmi_inject@inject-audio:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1470 / Intel XE#2853)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7308)
>      * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4329 / Intel XE#6912 / Intel
>             XE#7375)
>      * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7283)
>      * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7283) +2 other tests skip
>      * igt@kms_plane_lowres@tiling-4:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#599 / Intel XE#7382) +3 other
>             tests skip
>      * igt@kms_plane_multiple@2x-tiling-yf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5021 / Intel XE#7377)
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3307)
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2763 / Intel XE#6886) +3
>             other tests skip
>      * igt@kms_pm_backlight@fade:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7376 / Intel XE#870)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#7340)
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1489) +3 other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2893 / Intel XE#7304)
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2387 / Intel XE#7429)
>      * igt@kms_psr@fbc-pr-primary-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2234 / Intel XE#2850) +4
>             other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406)
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7795)
>      * igt@kms_rotation_crc@primary-rotation-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3904 / Intel XE#7342)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904 / Intel
>             XE#7342) +1 other test skip
>      * igt@kms_scaling_modes@scaling-mode-full-aspect:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2413)
>      * igt@kms_setmode@invalid-clone-single-crtc:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#1435)
>      * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6503) +1 other test skip
>      * igt@kms_vrr@flip-dpms:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1499)
>      * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#2142) +1 other test fail
>      * igt@xe_eudebug@basic-client:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7636) +2 other tests skip
>      * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7636) +8 other tests skip
>      * igt@xe_evict@evict-large-external-cm:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6540 / Intel XE#688) +1 other
>             test skip
>      * igt@xe_evict@evict-small-external-multi-queue-cm:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7140)
>      * igt@xe_exec_balancer@virtual-all-active:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7482) +3 other tests skip
>      * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322 / Intel XE#7372) +5
>             other tests skip
>      * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +1 other test skip
>      * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7136) +5 other tests skip
>      * igt@xe_exec_fault_mode@once-multi-queue-prefetch:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7136) +1 other test skip
>      * igt@xe_exec_multi_queue@few-execs-preempt-mode-basic-smem:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6874) +3 other tests skip
>      * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6874) +15 other tests skip
>      * igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7866) +1 other test skip
>      * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7138) +5 other tests skip
>      * igt@xe_exec_threads@threads-multi-queue-userptr-rebind:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7138) +2 other tests skip
>      * igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6964)
>      * igt@xe_multigpu_svm@mgpu-migration-prefetch:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6964) +1 other test skip
>      * igt@xe_oa@oa-tlb-invalidate:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2248 / Intel XE#7325 / Intel
>             XE#7393)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2248 / Intel XE#7325 / Intel
>             XE#7393)
>      * igt@xe_page_reclaim@binds-full-pd:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7793)
>      * igt@xe_pat@pat-index-xehpc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1420 / Intel XE#7590)
>      * igt@xe_pat@pat-index-xelpg:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2236 / Intel XE#7590)
>      * igt@xe_pm@d3cold-multiple-execs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#7370) +1
>             other test skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366 / Intel
>             XE#7370)
>      * igt@xe_pmu@fn-engine-activity-load:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4650 / Intel XE#7347)
>      * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4733 / Intel XE#7417)
>      * igt@xe_query@multigpu-query-invalid-cs-cycles:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#944) +1 other test skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_sriov_flr@flr-vfs-parallel:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#6569)
>      * igt@xe_sriov_vfio@open-basic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7724)
>      * igt@xe_vm@overcommit-nonfault-vram-lr-defer:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7892)
> 
>     Possible fixes
> 
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-bmg: INCOMPLETE (Intel XE#7084) -> PASS +1 other test pass
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
> 
>           * shard-lnl: FAIL (Intel XE#301 / Intel XE#3149) -> PASS +1 other
>             test pass
>      * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
> 
>           * shard-lnl: FAIL (Intel XE#301) -> PASS +1 other test pass
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-bmg: SKIP (Intel XE#1503) -> PASS
>      * igt@xe_sriov_vram@vf-access-after-resize-up:
> 
>           * shard-bmg: FAIL (Intel XE#5937) -> PASS +2 other tests pass
> 
>     Warnings
> 
>      * igt@kms_content_protection@atomic-hdcp14:
> 
>           * shard-bmg: FAIL (Intel XE#1178 / Intel XE#3304 / Intel XE#7374)
>             -> SKIP (Intel XE#7642) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-move:
> 
>           * shard-lnl: ABORT -> SKIP (Intel XE#7905)
>           * shard-bmg: ABORT -> SKIP (Intel XE#2311)
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>           * shard-bmg: SKIP (Intel XE#4141) -> SKIP (Intel XE#2312) +5 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +11 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +10 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
> 
>           * shard-lnl: SKIP (Intel XE#656) -> SKIP (Intel XE#656 / Intel
>             XE#7905) +225 other tests skip
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-bmg: SKIP (Intel XE#3544) -> SKIP (Intel XE#3374 / Intel
>             XE#3544)
>      * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>           * shard-bmg: SKIP (Intel XE#3904 / Intel XE#7342) -> SKIP (Intel
>             XE#3414 / Intel XE#3904 / Intel XE#7342)
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-bmg: FAIL (Intel XE#1729 / Intel XE#7424) -> SKIP (Intel
>             XE#2426 / Intel XE#5848)
> 
> Build changes
> 
>      * IGT: IGT_8888 -> IGTPW_15107
> 
>    IGTPW_15107: ee35bc09086290ba5522bd7c791d5285105bdf7c @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8888: 77f31f709ee65bb20ad7d64d8aa012ba7688b112 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-4990-835de80ce9b34b618442ba91483170201b50b553:
>    835de80ce9b34b618442ba91483170201b50b553
