Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EA5C0218F
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 04:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772AF10E194;
	Mon, 27 Jan 2025 04:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WS+HuD9G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BECE10E194;
 Mon, 27 Jan 2025 04:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737953759; x=1769489759;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gSh1932ZX37wYvWyOLOxlQvNz7P3hRvnk4ijSVPq01c=;
 b=WS+HuD9GJD26U24PUnBCvmSmp0iIXUwaKm5lteSEM9mPTUzvjC/CDIT8
 u2i5823qMb7ON0Y9DadCkQ5kfJBRBk9RP2iZpXqdUDuCLsWxu0mepke2U
 3hrwQFjr+X/UciB9WidOunqkvg2kN1n6fMjAUNeGGMyEeBo2xzjNroPQ4
 eYvdsHstQxBeOVuIRCioRs6Z6AuMbn7GALHIS9s1xPg287iMTz/pyAyJQ
 TF3PDIr2LpLK4vcdsQeRG612HnqXzQXY9wiV5TPXRQr1A4pGU7mzTZRTP
 qBDR1fu6IE2Fcui3kZ5mWUZdEfckzYZtnuyjKmt01+8yhnFRNpzQ0YVDw Q==;
X-CSE-ConnectionGUID: 16OlfpyfQPSEij91eQB4fg==
X-CSE-MsgGUID: CieHyNsASXOH23YDgje3IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38544206"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="38544206"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 20:55:58 -0800
X-CSE-ConnectionGUID: i4Cr/YEtS2SUhoM1AqUOJA==
X-CSE-MsgGUID: CTvIsQs1Qqqr+26CsPmiJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="139183079"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.231])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 20:55:56 -0800
Date: Mon, 27 Jan 2025 05:55:53 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Drop device scan cache logic (rev2)
Message-ID: <20250127045553.ugxuiooeh7pcbhex@zkempczy-mobl2>
References: <20250123095208.72984-1-zbigniew.kempczynski@intel.com>
 <173767402813.3735370.17467140728397000434@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173767402813.3735370.17467140728397000434@b555e5b46a47>
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

On Thu, Jan 23, 2025 at 11:13:48PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Drop device scan cache logic (rev2)                              
>    URL:     https://patchwork.freedesktop.org/series/143880/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12487/index.html 
> 
>         CI Bug Log - changes from XEIGT_8207_full -> XEIGTPW_12487_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_12487_full absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_12487_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
> Participating hosts (4 -> 4)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    XEIGTPW_12487_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN
>      * igt@kms_content_protection@legacy:
> 
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE +1 other test incomplete
>      * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
> 
>           * shard-bmg: PASS -> INCOMPLETE

These failures are not related to the patch series.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between XEIGT_8207_full and
>    XEIGTPW_12487_full:
> 
>   New IGT tests (1)
> 
>      * igt@xe_intel_bb@multithread-open:
>           * Statuses : 2 pass(s)
>           * Exec time: [1.42, 1.62] s
> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_12487_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1407) +1 other test skip
>      * igt@kms_big_fb@linear-32bpp-rotate-270:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#316) +1 other test skip
>      * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2327)
>      * igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1428) +1 other test skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +3 other tests skip
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124) +9 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124) +2 other tests skip
>      * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2191) +1 other test skip
>      * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2191) +2 other tests
>             skip
>      * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#367) +1 other test skip
>      * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#367) +1 other test skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +104 other tests
>             skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +21
>             other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2907)
>      * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +3 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3433) +3 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#2705 / Intel
>             XE#4010)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#4010)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1033 / Intel XE#2692
>             / Intel XE#4010)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1033 / Intel XE#3113
>             / Intel XE#4010)
>      * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +3 other
>             tests skip
>      * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +1 other test skip
>      * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#314) +3 other tests skip
>      * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1152) +3 other tests
>             skip
>      * igt@kms_chamelium_color@ctm-red-to-blue:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#306)
>      * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#373) +7 other tests skip
>      * igt@kms_chamelium_frames@dp-crc-single:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +2 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373) +4 other tests skip
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1178) +2 other tests
>             fail
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#307)
>      * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#1178)
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2321) +1 other test skip
>      * igt@kms_cursor_crc@cursor-random-32x10:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#308)
>      * igt@kms_cursor_crc@cursor-suspend:
> 
>           * shard-dg2-set2: NOTRUN -> ABORT (Intel XE#2625 / Intel XE#4083)
>             +1 other test abort
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2291) +5 other tests skip
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#1340)
>      * igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#3070)
>      * igt@kms_dsc@dsc-with-bpc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2244)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#776)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#776)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#701)
>      * igt@kms_flip@2x-flip-vs-expired-vblank:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421) +2 other tests skip
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#3321) +1 other test fail
>      * igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2316)
>      * igt@kms_flip@2x-plain-flip-ts-check:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#2882) +1 other test fail
>      * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2316) +6 other tests skip
>      * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#1033) +32 other
>             tests dmesg-warn
>      * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#301) +1 other test fail
>      * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#301 / Intel XE#3321)
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * shard-bmg: NOTRUN -> DMESG-WARN (Intel XE#1033) +5 other tests
>             dmesg-warn
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401 / Intel XE#1745)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401)
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293 / Intel XE#2380)
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293) +1 other test skip
>      * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2312) +1 other test skip
>      * igt@kms_frontbuffer_tracking@drrs-suspend:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +29 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#658) +1 other test skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1469)
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +13 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +8 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-slowdraw:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +27 other tests
>             skip
>      * igt@kms_getfb@getfb-reject-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#605)
>      * igt@kms_hdmi_inject@inject-audio:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1470 / Intel XE#2853)
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#1503)
>      * igt@kms_joiner@basic-force-big-joiner:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#3012)
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2927)
>      * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#599) +3 other tests skip
>      * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309) +1 other test skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2763) +11 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2763) +7 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#1033 / Intel
>             XE#2566)
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#718)
>      * igt@kms_pm_dc@deep-pkgc:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#2029)
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1489) +1 other test skip
>      * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1489) +5 other tests
>             skip
>      * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2893) +1 other test skip
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1122)
>      * igt@kms_psr@fbc-pr-cursor-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2234 / Intel XE#2850) +4
>             other tests skip
>      * igt@kms_psr@fbc-psr-sprite-render:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2850 / Intel XE#929) +10
>             other tests skip
>      * igt@kms_psr@pr-dpms:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406) +1 other test skip
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2939)
>      * igt@kms_rotation_crc@primary-rotation-270:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904) +1
>             other test skip
>      * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3414) +2 other tests
>             skip
>      * igt@kms_sequence@get-idle:
> 
>           * shard-bmg: PASS -> DMESG-WARN (Intel XE#1033) +28 other tests
>             dmesg-warn
>      * igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1435)
>      * igt@kms_vblank@wait-forked-busy:
> 
>           * shard-dg2-set2: NOTRUN -> DMESG-WARN (Intel XE#1033) +13 other
>             tests dmesg-warn
>      * igt@kms_vrr@cmrr:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2168)
>      * igt@kms_vrr@flip-dpms:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +8 other tests skip
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#756)
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#756)
>      * igt@testdisplay:
> 
>           * shard-dg2-set2: NOTRUN -> DMESG-WARN (Intel XE#2705)
>      * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
> 
>           * shard-dg2-set2: PASS -> ABORT (Intel XE#2625) +2 other tests
>             abort
>      * igt@xe_compute_preempt@compute-preempt-many:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1280 / Intel XE#455) +1
>             other test skip
>      * igt@xe_copy_basic@mem-copy-linear-0xfffe:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1123)
>      * igt@xe_eudebug@basic-read-event:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2905) +3 other tests skip
>      * igt@xe_eudebug_online@debugger-reopen:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2905) +6 other tests
>             skip
>      * igt@xe_eudebug_online@stopped-thread:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2905) +2 other tests skip
>      * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +3 other tests skip
>      * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +2 other tests skip
>      * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:
> 
>           * shard-bmg: PASS -> INCOMPLETE (Intel XE#4115)
>      * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288) +21 other tests
>             skip
>      * igt@xe_gt_freq@freq_suspend:
> 
>           * shard-dg2-set2: PASS -> ABORT (Intel XE#1033 / Intel XE#2625)
>      * igt@xe_live_ktest@xe_dma_buf:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#1192) +1 other test skip
>      * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1999) +2 other tests
>             fail
>      * igt@xe_media_fill@media-fill:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#560)
>      * igt@xe_mmap@small-bar:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#512)
>      * igt@xe_module_load@force-load:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#378)
>      * igt@xe_module_load@load:
> 
>           * shard-bmg: (PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS) -> (PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, SKIP, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS) (Intel
>             XE#2457)
>           * shard-dg2-set2: (PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS) -> (SKIP, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS) (Intel XE#378)
>      * igt@xe_oa@missing-sample-flags:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2541 / Intel XE#3573) +2
>             other tests skip
>      * igt@xe_pm@d3cold-mmap-vram:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366) +1
>             other test skip
>      * igt@xe_pm@s3-multiple-execs:
> 
>           * shard-bmg: PASS -> DMESG-WARN (Intel XE#1033 / Intel XE#569) +1
>             other test dmesg-warn
>           * shard-dg2-set2: NOTRUN -> DMESG-WARN (Intel XE#1033 / Intel
>             XE#569)
>      * igt@xe_pm@s3-vm-bind-prefetch:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#584)
>      * igt@xe_pm@s4-mocs:
> 
>           * shard-lnl: PASS -> ABORT (Intel XE#1358 / Intel XE#1794)
>      * igt@xe_pm@s4-vm-bind-unbind-all:
> 
>           * shard-lnl: PASS -> ABORT (Intel XE#1358 / Intel XE#1607 / Intel
>             XE#1794)
>      * igt@xe_query@multigpu-query-gt-list:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_query@multigpu-query-invalid-size:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_query@multigpu-query-oa-units:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_sriov_flr@flr-vf1-clear:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3342)
> 
>     Possible fixes
> 
>      * igt@kms_async_flips@alternate-sync-async-flip:
> 
>           * shard-bmg: FAIL (Intel XE#827) -> PASS +1 other test pass
>      * igt@kms_async_flips@async-flip-with-page-flip-events:
> 
>           * shard-bmg: INCOMPLETE -> PASS +1 other test pass
>      * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#367) -> PASS +4 other tests pass
>      * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> 
>           * shard-bmg: SKIP (Intel XE#2314 / Intel XE#2894) -> PASS
>      * igt@kms_color@ctm-blue-to-red:
> 
>           * shard-bmg: SKIP (Intel XE#3007) -> PASS +19 other tests pass
>      * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> 
>           * shard-bmg: SKIP (Intel XE#2291) -> PASS +2 other tests pass
>      * igt@kms_flip@2x-absolute-wf_vblank:
> 
>           * shard-bmg: SKIP (Intel XE#2316) -> PASS +1 other test pass
>      * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
> 
>           * shard-dg2-set2: FAIL (Intel XE#301 / Intel XE#3321) -> PASS
>      * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
> 
>           * shard-dg2-set2: FAIL (Intel XE#301) -> PASS +1 other test pass
>      * igt@kms_flip@flip-vs-suspend:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#2955) -> PASS
>      * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
> 
>           * shard-lnl: FAIL (Intel XE#886) -> PASS +2 other tests pass
>      * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
> 
>           * shard-bmg: SKIP (Intel XE#2136 / Intel XE#2231) -> PASS +1 other
>             test pass
>      * igt@kms_flip_tiling@flip-change-tiling:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#2049) -> PASS
>      * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-6-4-rc-ccs-cc-to-4-mc-ccs:
> 
>           * shard-dg2-set2: INCOMPLETE -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136 / Intel XE#2351) -> PASS +1
>             other test pass
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> PASS +4 other tests pass
>      * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1033) -> PASS +51 other
>             tests pass
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> PASS +13
>             other tests pass
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#1033) -> PASS +40 other tests
>             pass
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2446) -> PASS
>           * shard-bmg: SKIP (Intel XE#2446) -> PASS
>      * igt@xe_evict@evict-large-multi-vm:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1033 / Intel XE#1473) ->
>             PASS
>      * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1392) -> PASS +4 other tests pass
>      * igt@xe_pm@s3-exec-after:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#1033 / Intel XE#569) -> PASS
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1033 / Intel XE#569) -> PASS
>      * igt@xe_pm_residency@cpg-basic:
> 
>           * shard-dg2-set2: ABORT (Intel XE#4046) -> PASS
>      * igt@xe_spin_batch@spin-all:
> 
>           * shard-bmg: SKIP (Intel XE#1130) -> PASS +42 other tests pass
>      * igt@xe_vm@large-binds-2147483648:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1130) -> PASS +25 other tests pass
> 
>     Warnings
> 
>      * igt@kms_atomic_transition@plane-all-transition-fencing:
> 
>           * shard-bmg: SKIP (Intel XE#3007) -> DMESG-WARN (Intel XE#1033)
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> DMESG-WARN
>             (Intel XE#1033)
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
> 
>           * shard-bmg: SKIP (Intel XE#2136 / Intel XE#2231) -> SKIP (Intel
>             XE#2327) +1 other test skip
>           * shard-dg2-set2: SKIP (Intel XE#2136 / Intel XE#2351) -> SKIP
>             (Intel XE#316)
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> 
>           * shard-bmg: SKIP (Intel XE#2136 / Intel XE#2231) -> SKIP (Intel
>             XE#1124) +2 other tests skip
>           * shard-dg2-set2: SKIP (Intel XE#2136 / Intel XE#2351) -> SKIP
>             (Intel XE#1124)
>      * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> 
>           * shard-bmg: SKIP (Intel XE#3007) -> SKIP (Intel XE#2314 / Intel
>             XE#2894)
>      * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
> 
>           * shard-bmg: SKIP (Intel XE#3007) -> SKIP (Intel XE#367)
>      * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
> 
>           * shard-bmg: SKIP (Intel XE#2136 / Intel XE#2231) -> SKIP (Intel
>             XE#2887) +3 other tests skip
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#455 /
>             Intel XE#787)
>      * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136 / Intel XE#2351) -> SKIP
>             (Intel XE#455 / Intel XE#787) +1 other test skip
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-bmg: SKIP (Intel XE#2136 / Intel XE#2231) -> SKIP (Intel
>             XE#2724)
>      * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
> 
>           * shard-bmg: SKIP (Intel XE#3007) -> SKIP (Intel XE#2252) +1 other
>             test skip
>      * igt@kms_chamelium_hpd@vga-hpd:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel
>             XE#373) +1 other test skip
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-bmg: INCOMPLETE -> SKIP (Intel XE#2341)
>      * igt@kms_content_protection@legacy:
> 
>           * shard-bmg: DMESG-FAIL (Intel XE#877) -> FAIL (Intel XE#1178) +1
>             other test fail
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-bmg: SKIP (Intel XE#2341) -> FAIL (Intel XE#1178)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-dg2-set2: FAIL (Intel XE#1188) -> DMESG-FAIL (Intel
>             XE#1033) +1 other test dmesg-fail
>      * igt@kms_cursor_crc@cursor-offscreen-max-size:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel
>             XE#455)
>      * igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>           * shard-bmg: SKIP (Intel XE#3007) -> SKIP (Intel XE#2320) +2 other
>             tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#1033) -> SKIP (Intel XE#2291)
>      * igt@kms_feature_discovery@psr1:
> 
>           * shard-bmg: SKIP (Intel XE#3007) -> SKIP (Intel XE#2374)
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel
>             XE#1135)
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1033) -> DMESG-WARN (Intel
>             XE#2955)
>      * igt@kms_flip@flip-vs-expired-vblank:
> 
>           * shard-dg2-set2: FAIL (Intel XE#301) -> DMESG-FAIL (Intel XE#1033)
>      * igt@kms_flip@flip-vs-expired-vblank@d-dp4:
> 
>           * shard-dg2-set2: FAIL (Intel XE#301 / Intel XE#3321) -> DMESG-WARN
>             (Intel XE#1033)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#455)
>           * shard-bmg: SKIP (Intel XE#2136 / Intel XE#2231) -> SKIP (Intel
>             XE#2293 / Intel XE#2380)
>      * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
> 
>           * shard-bmg: SKIP (Intel XE#2136 / Intel XE#2231) -> SKIP (Intel
>             XE#2311) +6 other tests skip
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#651) +2
>             other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2311) +9 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +15 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#4141) +3 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2136 / Intel XE#2231) -> SKIP (Intel
>             XE#4141) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>           * shard-bmg: SKIP (Intel XE#4141) -> SKIP (Intel XE#2312) +4 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +17 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2313) +6 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2136 / Intel XE#2231) -> SKIP (Intel
>             XE#2313) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#653) +3
>             other tests skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
> 
>           * shard-bmg: SKIP (Intel XE#3007) -> SKIP (Intel XE#2763) +1 other
>             test skip
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#1489) +1
>             other test skip
>      * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
> 
>           * shard-bmg: SKIP (Intel XE#2136 / Intel XE#2231) -> SKIP (Intel
>             XE#1489) +2 other tests skip
>      * igt@kms_psr@fbc-pr-sprite-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2136 / Intel XE#2231) -> SKIP (Intel
>             XE#2234 / Intel XE#2850) +1 other test skip
>      * igt@kms_psr@psr2-sprite-plane-move:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#2850 /
>             Intel XE#929) +2 other tests skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-bmg: SKIP (Intel XE#3007) -> SKIP (Intel XE#2330)
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-bmg: SKIP (Intel XE#2426) -> FAIL (Intel XE#1729)
>      * igt@xe_eudebug_online@single-step-one:
> 
>           * shard-bmg: SKIP (Intel XE#1130) -> SKIP (Intel XE#2905) +3 other
>             tests skip
>           * shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#2905) +1
>             other test skip
>      * igt@xe_exec_basic@multigpu-no-exec-null:
> 
>           * shard-bmg: SKIP (Intel XE#1130) -> SKIP (Intel XE#2322) +1 other
>             test skip
>      * igt@xe_exec_fault_mode@once-userptr-invalidate-race:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#288) +3
>             other tests skip
>      * igt@xe_pm@s3-basic-exec:
> 
>           * shard-dg2-set2: ABORT (Intel XE#1033 / Intel XE#1358) ->
>             DMESG-WARN (Intel XE#1033 / Intel XE#569)
>      * igt@xe_pm@s3-vm-bind-userptr:
> 
>           * shard-dg2-set2: ABORT (Intel XE#1358 / Intel XE#1794) ->
>             DMESG-WARN (Intel XE#1033 / Intel XE#569)
> 
> Build changes
> 
>      * IGT: IGT_8207 -> IGTPW_12487
>      * Linux: xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2 ->
>        xe-2536-33906a7032dfca356fd7309e6abbdf5a7ea97db4
> 
>    IGTPW_12487: 34ada825e9efa46c9deef07a2117005a1408e090 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-2534-db7cf8d52a41001ea2780cf834fed3dc490343d2:
>    db7cf8d52a41001ea2780cf834fed3dc490343d2
>    xe-2536-33906a7032dfca356fd7309e6abbdf5a7ea97db4:
>    33906a7032dfca356fd7309e6abbdf5a7ea97db4
