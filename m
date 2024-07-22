Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE43C3DA5D
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 18:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB3410E297;
	Mon, 22 Jul 2024 18:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVZ2jvGM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC5710E297;
 Mon, 22 Jul 2024 18:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721674393; x=1753210393;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AjxD5z2N+asYZCqeelCcB4TkecYan8zQLA5ynSjCBmE=;
 b=eVZ2jvGMe1qVJIlMAljWprV4wh2/LQNXsug+pM1HiKoorqI3QBpYCgTP
 pAQqOa9jfSKHR2XczZ420ZMpk63o6AzV0Wwm9TDRFU5QOGd2doMvdvFrM
 JL2v4AwmNTQQD9xYmENaLXagzl26Bi9se0a0Dxxk6W5SGxN/ySOLV4kHi
 j5WBbiGMZul6yss1nnDin1Zci32NlPC2b4YZ4jurhYstGbcdyAGCcxTnm
 OkXMGJzX/gfaTZa6InHRb9mNrKsTObEe/tjjeic7PHtN8DavtVSw5KKXS
 Of8wt0r0uDSTRR3ov/L+SfcpFu3s15oRq5xL7S4B9m7b+ElNFGcwPPawc g==;
X-CSE-ConnectionGUID: VT5a+xmYR9K65lnL+oYddg==
X-CSE-MsgGUID: vhAC7dwmSUeh/nLLi5zLtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="12654613"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="12654613"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 11:53:13 -0700
X-CSE-ConnectionGUID: 7dfzMvGyRAKCicZp3Cv++A==
X-CSE-MsgGUID: 7HzllxHkTmavHOgVFB1nOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="52029146"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.31])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 11:53:10 -0700
Date: Mon, 22 Jul 2024 20:53:07 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTA==?= =?utf-8?Q?=3A?= failure for
 lib/intel_compute: Enable compute tests for BMG
Message-ID: <20240722185307.dpvw2hrbne3w2bj2@zkempczy-mobl2>
References: <20240722102219.109909-1-zbigniew.kempczynski@intel.com>
 <172165589931.327405.885860925069078136@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172165589931.327405.885860925069078136@2413ebb6fbb6>
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

On Mon, Jul 22, 2024 at 01:44:59PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/intel_compute: Enable compute tests for BMG                  
>    URL:     https://patchwork.freedesktop.org/series/136337/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11441/index.html 
> 
>         CI Bug Log - changes from XEIGT_7933_full -> XEIGTPW_11441_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_11441_full absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_11441_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
> Participating hosts (3 -> 3)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    XEIGTPW_11441_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@xe_exec_threads@threads-cm-shared-vm-basic:
>           * shard-lnl: PASS -> ABORT

Unrelated to the change.

--
Zbigniew

> 
>     Warnings
> 
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
>           * shard-dg2-set2: SKIP (Intel XE#1201) -> SKIP +2 other tests skip
> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * {igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1}:
> 
>           * shard-lnl: PASS -> DMESG-WARN
>      * {igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence}:
> 
>           * shard-lnl: FAIL (Intel XE#2343) -> ABORT
> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_11441_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#623)
>      * igt@kms_addfb_basic@unused-pitches:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1201 / i915#6077)
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#1426) +1 other test fail
>      * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#1426) +1 other test fail
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#1659)
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#316) +1
>             other test skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124 / Intel XE#1201) +4
>             other tests skip
>      * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#367)
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#616) +5 other tests fail
>      * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#455 /
>             Intel XE#787) +15 other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1399) +1 other test skip
>      * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#787) +55
>             other tests skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#314)
>      * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#373) +1 other test skip
>      * igt@kms_chamelium_hpd@vga-hpd:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#373) +2
>             other tests skip
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#308) +1
>             other test skip
>      * igt@kms_cursor_crc@cursor-random-32x10:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#455) +6
>             other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#323)
>      * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1195) +3 other tests
>             incomplete
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#702)
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421)
>      * igt@kms_flip@bo-too-big-interruptible:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1201) +2 other tests skip
>      * igt@kms_flip@flip-vs-blocking-wf-vblank:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#886) +3 other tests fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401 / Intel XE#1745)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401)
>      * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +1 other test skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201)
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656)
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#651) +13
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#783)
>      * igt@kms_frontbuffer_tracking@psr-slowdraw:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#653) +9
>             other tests skip
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#599)
>      * igt@kms_pm_backlight@basic-brightness:
> 
>           * shard-lnl: PASS -> SKIP (Intel XE#870)
>      * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#1489) +2
>             other tests skip
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1122 / Intel XE#1201)
>      * igt@kms_psr@fbc-psr2-primary-blt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#929) +8
>             other tests skip
>      * igt@kms_psr@psr2-cursor-plane-move:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#1649) +1 other test fail
>      * igt@kms_rotation_crc@sprite-rotation-270:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#327) +1
>             other test skip
>      * igt@kms_vblank@ts-continuation-dpms-suspend:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#1551) +1 other test
>             dmesg-warn
>      * igt@xe_compute@ccs-mode-compute-kernel:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1050)
>      * igt@xe_evict@evict-cm-threads-large:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1473 / Intel XE#392)
>      * igt@xe_evict@evict-large-multi-vm-cm:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1600)
>      * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#688)
>      * igt@xe_exec_basic@multigpu-no-exec-rebind:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392)
>      * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#288) +12
>             other tests skip
>      * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288) +2 other tests skip
>      * igt@xe_exec_reset@gt-reset-stress:
> 
>           * shard-dg2-set2: PASS -> ABORT (Intel XE#2271) +1 other test abort
>      * igt@xe_gt_freq@freq_fixed_exec:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#2262)
>      * igt@xe_live_ktest@xe_bo:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1192 / Intel XE#1201)
>      * igt@xe_live_ktest@xe_dma_buf:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1192)
>      * igt@xe_module_load@reload-no-display:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#1204)
>      * igt@xe_pm@d3cold-basic:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#366)
>      * igt@xe_pm@s3-d3hot-basic-exec:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#1551 / Intel XE#569)
>      * igt@xe_pm@s3-vm-bind-userptr:
> 
>           * shard-dg2-set2: NOTRUN -> DMESG-WARN (Intel XE#1551 / Intel
>             XE#569)
>      * igt@xe_pm@s4-vm-bind-unbind-all:
> 
>           * shard-lnl: PASS -> ABORT (Intel XE#1794)
>      * igt@xe_pm_residency@toggle-gt-c6:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#958)
> 
>     Possible fixes
> 
>      * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
> 
>           * shard-lnl: FAIL (Intel XE#886) -> PASS +1 other test pass
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#455) -> PASS
>      * {igt@kms_plane@plane-position-covered@pipe-b-plane-3}:
> 
>           * shard-lnl: DMESG-WARN (Intel XE#324) -> PASS +1 other test pass
>      * {igt@kms_plane@plane-position-hole@pipe-a-plane-2}:
> 
>           * shard-lnl: DMESG-FAIL (Intel XE#324) -> PASS
>      * igt@kms_pm_backlight@bad-brightness:
> 
>           * shard-lnl: SKIP (Intel XE#870) -> PASS +1 other test pass
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-lnl: FAIL (Intel XE#718) -> PASS
>      * igt@kms_pm_rpm@system-suspend-modeset:
> 
>           * shard-lnl: DMESG-WARN (Intel XE#2042) -> PASS
>      * igt@kms_sequence@queue-idle@pipe-b-edp-1:
> 
>           * shard-lnl: FAIL -> PASS +1 other test pass
>      * igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>           * shard-dg2-set2: TIMEOUT (Intel XE#1473 / Intel XE#402) -> PASS
>      * igt@xe_evict@evict-beng-mixed-threads-large:
> 
>           * shard-dg2-set2: TIMEOUT (Intel XE#1041 / Intel XE#1473 / Intel
>             XE#392) -> PASS
>      * igt@xe_live_ktest@xe_migrate:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1192 / Intel XE#1201) -> PASS
>      * igt@xe_module_load@many-reload:
> 
>           * shard-lnl: DMESG-WARN (Intel XE#2356) -> PASS
>      * igt@xe_pm@s4-vm-bind-prefetch:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#2019) -> PASS
>      * igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer:
> 
>           * shard-dg2-set2: ABORT (Intel XE#2271) -> PASS
> 
>     Warnings
> 
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#801) -> SKIP
>             (Intel XE#801) +23 other tests skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> 
>           * shard-dg2-set2: SKIP (Intel XE#316) -> SKIP (Intel XE#1201 /
>             Intel XE#316) +1 other test skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#316) -> SKIP
>             (Intel XE#316) +4 other tests skip
>      * igt@kms_big_fb@y-tiled-addfb:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#619) -> SKIP
>             (Intel XE#619)
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1124 / Intel XE#1201) -> SKIP
>             (Intel XE#1124) +4 other tests skip
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1124) -> SKIP (Intel XE#1124 /
>             Intel XE#1201) +3 other tests skip
>      * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#367) -> SKIP
>             (Intel XE#367) +1 other test skip
>      * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#367) -> SKIP (Intel XE#1201 /
>             Intel XE#367)
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#455 / Intel
>             XE#787) -> SKIP (Intel XE#455 / Intel XE#787) +11 other tests
>             skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#787) -> SKIP
>             (Intel XE#787) +41 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1195) -> FAIL (Intel XE#616)
>             +1 other test fail
>      * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:
> 
>           * shard-dg2-set2: SKIP (Intel XE#787) -> SKIP (Intel XE#1201 /
>             Intel XE#787) +41 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1252) -> SKIP
>             (Intel XE#1252)
>      * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455 / Intel XE#787) -> SKIP (Intel
>             XE#1201 / Intel XE#455 / Intel XE#787) +11 other tests skip
>      * igt@kms_chamelium_color@ctm-blue-to-red:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#306) -> SKIP
>             (Intel XE#306)
>      * igt@kms_chamelium_color@degamma:
> 
>           * shard-dg2-set2: SKIP (Intel XE#306) -> SKIP (Intel XE#1201 /
>             Intel XE#306)
>      * igt@kms_chamelium_frames@dp-crc-fast:
> 
>           * shard-dg2-set2: SKIP (Intel XE#373) -> SKIP (Intel XE#1201 /
>             Intel XE#373) +4 other tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#373) -> SKIP
>             (Intel XE#373) +5 other tests skip
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-dg2-set2: SKIP (Intel XE#307) -> SKIP (Intel XE#1201 /
>             Intel XE#307)
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#308) -> SKIP
>             (Intel XE#308)
>      * igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>           * shard-dg2-set2: SKIP (Intel XE#308) -> SKIP (Intel XE#1201 /
>             Intel XE#308) +1 other test skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#323) -> SKIP
>             (Intel XE#323) +1 other test skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-dg2-set2: SKIP (Intel XE#323) -> SKIP (Intel XE#1201 /
>             Intel XE#323)
>      * igt@kms_display_modes@mst-extended-mode-negative:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#307) -> SKIP
>             (Intel XE#307)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-dg2-set2: SKIP (Intel XE#776) -> SKIP (Intel XE#1201 /
>             Intel XE#776)
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#651) -> SKIP (Intel XE#1201 /
>             Intel XE#651) +15 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#651) -> SKIP
>             (Intel XE#651) +15 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#651) -> SKIP
>             (Intel XE#1201) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#653) -> SKIP (Intel XE#1201 /
>             Intel XE#653) +15 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#653) -> SKIP
>             (Intel XE#653) +22 other tests skip
>      * igt@kms_plane_multiple@tiling-y:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455) -> SKIP (Intel XE#1201 /
>             Intel XE#455) +8 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#455) -> SKIP
>             (Intel XE#1201 / Intel XE#2318 / Intel XE#455) +4 other tests
>             skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201) -> SKIP (Intel XE#1201 /
>             Intel XE#2318) +2 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#455) -> SKIP
>             (Intel XE#2318 / Intel XE#455)
>      * igt@kms_pm_backlight@bad-brightness:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#870) -> SKIP
>             (Intel XE#870)
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1129) -> SKIP (Intel XE#1129 /
>             Intel XE#1201)
>      * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1489) -> SKIP (Intel XE#1201 /
>             Intel XE#1489) +1 other test skip
>      * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1489) -> SKIP
>             (Intel XE#1489) +3 other tests skip
>      * igt@kms_psr@fbc-psr-cursor-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#929) -> SKIP
>             (Intel XE#1201)
>      * igt@kms_psr@fbc-psr-sprite-plane-onoff:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#929) -> SKIP
>             (Intel XE#929) +7 other tests skip
>      * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
> 
>           * shard-dg2-set2: SKIP (Intel XE#929) -> SKIP (Intel XE#1201 /
>             Intel XE#929) +2 other tests skip
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1149 / Intel XE#1201) -> SKIP
>             (Intel XE#1149)
>      * igt@kms_rotation_crc@bad-pixel-format:
> 
>           * shard-dg2-set2: SKIP (Intel XE#327) -> SKIP (Intel XE#1201 /
>             Intel XE#327)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1127) -> SKIP (Intel XE#1127 /
>             Intel XE#1201)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1127 / Intel XE#1201) -> SKIP
>             (Intel XE#1127)
>      * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#327) -> SKIP
>             (Intel XE#327)
>      * igt@kms_vrr@flipline:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#455) -> SKIP
>             (Intel XE#455) +10 other tests skip
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-lnl: SKIP (Intel XE#599) -> SKIP (Intel XE#1499 / Intel
>             XE#599) +2 other tests skip
>      * igt@kms_writeback@writeback-check-output-xrgb2101010:
> 
>           * shard-dg2-set2: SKIP (Intel XE#756) -> SKIP (Intel XE#1201 /
>             Intel XE#756)
>      * igt@xe_evict@evict-mixed-many-threads-large:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1195 / Intel XE#1473 / Intel
>             XE#392) -> TIMEOUT (Intel XE#1041 / Intel XE#1473 / Intel XE#392)
>      * igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
> 
>           * shard-dg2-set2: SKIP (Intel XE#288) -> SKIP (Intel XE#1201 /
>             Intel XE#288) +11 other tests skip
>      * igt@xe_exec_fault_mode@once-userptr-invalidate-imm:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#288) -> SKIP
>             (Intel XE#288) +13 other tests skip
>      * igt@xe_exec_reset@parallel-gt-reset:
> 
>           * shard-dg2-set2: TIMEOUT (Intel XE#2105) -> ABORT (Intel XE#2271 /
>             Intel XE#2309)
>      * igt@xe_pat@display-vs-wb-transient:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1337) -> SKIP
>             (Intel XE#1337)
>      * igt@xe_pm@d3cold-basic-exec:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#366) -> SKIP
>             (Intel XE#366)
>      * igt@xe_pm@d3cold-multiple-execs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#366) -> SKIP (Intel XE#1201 /
>             Intel XE#366)
>      * igt@xe_query@multigpu-query-config:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#944) -> SKIP
>             (Intel XE#944) +2 other tests skip
>      * igt@xe_query@multigpu-query-invalid-size:
> 
>           * shard-dg2-set2: SKIP (Intel XE#944) -> SKIP (Intel XE#1201 /
>             Intel XE#944)
>      * igt@xe_wedged@basic-wedged:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1130 / Intel XE#1201) ->
>             DMESG-WARN (Intel XE#1760)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * IGT: IGT_7933 -> IGTPW_11441
>      * Linux: xe-1633-25cbb0b9828d08006be65c72f2ad5e85766d1941 ->
>        xe-1641-867eb2599d00e03d12a2a49b223cf37280d7ee2e
> 
>    IGTPW_11441: 11441
>    IGT_7933: 7933
>    xe-1633-25cbb0b9828d08006be65c72f2ad5e85766d1941:
>    25cbb0b9828d08006be65c72f2ad5e85766d1941
>    xe-1641-867eb2599d00e03d12a2a49b223cf37280d7ee2e:
>    867eb2599d00e03d12a2a49b223cf37280d7ee2e
