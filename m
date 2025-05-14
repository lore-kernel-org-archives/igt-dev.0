Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE84C3ABC5
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 05:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72A110E24F;
	Wed, 14 May 2025 05:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bqpgq18C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BBC10E24B;
 Wed, 14 May 2025 05:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747199076; x=1778735076;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9OFPdWNZoPjz6dH2RWefQDbFjPhEPW6MWsZTCpYOpQQ=;
 b=Bqpgq18CuwjBQ0xl/h68G5BXvVpdZRrCf11bTYZDcaGGhiwl0Mctg2ET
 gNjBIFOALziN/9fuPCEcy2uVBOZnWVDxzF89As6/sWMIfvZQ4bCzZp8tt
 Xdarlsd64WoTbphUTwHzSxFPzxZ3B4JYrwJVtHmoYBJGFBI0Z+AOQAtJg
 vTTkcuBGWEL8mqmvbtOfxdZbYb7QY/cjDILw+QV2TEosUWvD4c+UKXw0i
 v9hnnjVgp+eh4rl+5RYpNwp0C3RpTW4gWLnKZBu47PR3PV2UDK1sdkA/d
 J4BbGSwaseZL3DxIYLNcweImQ0gv3D9XK5Tj9gB7aotJdi3aSQ+ciCePT w==;
X-CSE-ConnectionGUID: 43hDRwoMT8+atm10QZTFUw==
X-CSE-MsgGUID: K4z6skOOTVCVi8gRrsawog==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="74476163"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="74476163"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 22:04:35 -0700
X-CSE-ConnectionGUID: h303gagYRoiEemo5ngmhCw==
X-CSE-MsgGUID: UA5I9d5hQneV3V2sJai0jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="137842693"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 22:04:33 -0700
Date: Wed, 14 May 2025 07:04:30 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Improve mem-copy/mem-set lib and tests
Message-ID: <hkjybvtv7ubgy3bbxcwpqwc2b6a6p7h6sg6eyqvnizmrm5ht6e@dtcmealoimyc>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
 <174717367276.76908.12657829526952963522@c664b1dc75d1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174717367276.76908.12657829526952963522@c664b1dc75d1>
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

On Tue, May 13, 2025 at 10:01:12PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Improve mem-copy/mem-set lib and tests                           
>    URL:     https://patchwork.freedesktop.org/series/148977/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13120/index.html 
> 
>         CI Bug Log - changes from XEIGT_8362_FULL -> XEIGTPW_13120_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_13120_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_13120_FULL, please notify your bug team
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
>    XEIGTPW_13120_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * {igt@xe_copy_basic@mem-page-copy-17} (NEW):
> 
>           * shard-dg2-set2: NOTRUN -> SKIP +3 other tests skip

Skip is expected on dg2. Other issues are not caused by the series.

--
Zbigniew


>      * igt@xe_exec_threads@threads-shared-vm-userptr-invalidate:
> 
>           * shard-lnl: PASS -> SKIP +5 other tests skip
> 
>     Warnings
> 
>      * igt@xe_evict@evict-small-multi-vm:
> 
>           * shard-lnl: SKIP (Intel XE#688) -> SKIP
>      * igt@xe_exec_sip_eudebug@wait-writesip-nodebug:
> 
>           * shard-lnl: SKIP (Intel XE#4837) -> SKIP +1 other test skip
>      * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> ABORT
> 
> New tests
> 
>    New tests have been introduced between XEIGT_8362_FULL and
>    XEIGTPW_13120_FULL:
> 
>   New IGT tests (6)
> 
>      * igt@xe_copy_basic@mem-copy-linear-0x8fffe:
> 
>           * Statuses : 2 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.13] s
>      * igt@xe_copy_basic@mem-matrix-copy-200x127:
> 
>           * Statuses : 1 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.10] s
>      * igt@xe_copy_basic@mem-matrix-copy-2x2:
> 
>           * Statuses : 2 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@xe_copy_basic@mem-page-copy-1:
> 
>           * Statuses : 2 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.02] s
>      * igt@xe_copy_basic@mem-page-copy-17:
> 
>           * Statuses : 2 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@xe_copy_basic@mem-set-linear-0x8fffe:
> 
>           * Statuses : 2 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.01] s
> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_13120_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@core_getversion@all-cards:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#4208)
>      * igt@core_setmaster@master-drop-set-user:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#4208)
>      * igt@fbdev@pan:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#2134)
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3157)
>      * igt@kms_atomic@plane-invalid-params-fence:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#4208 / i915#2575) +90
>             other tests skip
>      * igt@kms_big_fb@linear-16bpp-rotate-270:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1407) +2 other tests skip
>      * igt@kms_big_fb@linear-16bpp-rotate-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2327) +1 other test skip
>      * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +2 other tests skip
>      * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#607)
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124) +4 other tests skip
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124) +4 other tests
>             skip
>      * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2314 / Intel XE#2894) +1 other
>             test skip
>      * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1512)
>      * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#367)
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +174 other tests
>             skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +3 other
>             tests skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +30
>             other tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887)
>      * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +3 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3432)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3432)
>      * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2669) +3 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#3124)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> DMESG-WARN (Intel XE#1727 / Intel
>             XE#3113)
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2724)
>      * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4417) +3 other tests skip
>      * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4417) +3 other tests
>             skip
>      * igt@kms_chamelium_edid@dp-edid-resolution-list:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373) +1 other test skip
>      * igt@kms_chamelium_hpd@vga-hpd:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#373) +3 other tests skip
>      * igt@kms_content_protection@atomic@pipe-a-dp-2:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#1178)
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#307)
>      * igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2321)
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#308)
>      * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424) +1 other test skip
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2291) +8 other tests skip
>      * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4208 / i915#2575) +15
>             other tests skip
>      * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309)
>      * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#4667)
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#4302)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4494 / i915#3804)
>      * igt@kms_draw_crc@fill-fb:
> 
>           * shard-lnl: PASS -> SKIP (Intel XE#2351 / Intel XE#4996) +1 other
>             test skip
>           * shard-bmg: PASS -> SKIP (Intel XE#2231 / Intel XE#4996)
>      * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4422)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#701)
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#3321) +4 other tests fail
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#301 / Intel XE#3321)
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#301) +15 other tests
>             fail
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421) +5 other tests skip
>      * igt@kms_flip@2x-nonexisting-fb:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2316) +13 other tests skip
>      * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2316)
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#3321) +1 other test fail
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#301) +2 other tests fail
>      * igt@kms_flip@plain-flip-ts-check:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#3149 / Intel XE#886)
>      * igt@kms_flip@plain-flip-ts-check@c-edp1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#886) +4 other tests fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#2351 / Intel XE#4208) +17
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +11 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401 / Intel XE#1745)
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401)
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2312) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +16 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +8 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1469)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2352)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +8 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
> 
>           * shard-lnl: PASS -> SKIP (Intel XE#2351) +1 other test skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2351 / Intel XE#4208) +3
>             other tests skip
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#1503) +1 other test skip
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2927)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2927)
>      * igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#3012)
>      * igt@kms_plane_lowres@tiling-4:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#599) +3 other tests skip
>      * igt@kms_plane_multiple@2x-tiling-4:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#4596) +1 other test skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2763) +11 other tests
>             skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2763) +11 other tests skip
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2763 / Intel XE#455) +4
>             other tests skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2763) +9 other tests skip
>      * igt@kms_pm_backlight@fade-with-dpms:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#870)
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#718)
>      * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1489) +1 other test skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4608) +1 other test skip
>      * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2893)
>      * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1489)
>      * igt@kms_psr@fbc-psr2-primary-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2234 / Intel XE#2850) +2
>             other tests skip
>      * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4609)
>      * igt@kms_psr@pr-no-drrs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406) +4 other tests skip
>      * igt@kms_psr@psr-primary-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2351)
>      * igt@kms_psr@psr2-suspend:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2850 / Intel XE#929) +1
>             other test skip
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-lnl: PASS -> SKIP (Intel XE#4692) +1 other test skip
>      * igt@kms_rotation_crc@primary-rotation-270:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904)
>      * igt@kms_rotation_crc@primary-rotation-90:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904) +1
>             other test skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1127)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2330)
>      * igt@kms_tv_load_detect@load-detect:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#330)
>      * igt@kms_writeback@writeback-check-output-xrgb2101010:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#756)
>      * igt@xe_compute@ccs-mode-compute-kernel:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1447)
>      * igt@xe_create@create-big-vram:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1062)
>      * igt@xe_eudebug@discovery-empty:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837) +2 other tests skip
>      * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4837) +2 other tests
>             skip
>      * igt@xe_eudebug_sriov@deny-eudebug:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4518) +1 other test skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4518)
>      * igt@xe_evict@evict-beng-large-cm:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#688) +3 other tests skip
>      * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#4208) +199 other tests
>             skip
>      * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322)
>      * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +1 other test skip
>      * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1392) +3 other tests skip
>      * igt@xe_exec_basic@once-userptr-invalidate-race:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4208) +80 other tests
>             skip
>      * igt@xe_exec_compute_mode@twice-userptr:
> 
>           * shard-lnl: PASS -> SKIP (Intel XE#4996) +10 other tests skip
>      * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288) +11 other tests
>             skip
>      * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2360)
>      * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4943) +1 other test skip
>      * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-race:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4915) +49 other tests
>             skip
>      * igt@xe_exec_system_allocator@threads-many-mmap-mlock-nomemset:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4996)
>      * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4943) +10 other tests skip
>      * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#5018)
>      * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-race:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#4996) +8 other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4996)
>      * igt@xe_exec_threads@threads-bal-shared-vm-rebind:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#4954 / Intel XE#4996) +2 other
>             tests skip
>      * igt@xe_live_ktest@xe_bo:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#2229 / Intel XE#455) +1
>             other test skip
>      * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#2229)
>      * igt@xe_mmap@pci-membarrier-parallel:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4045)
>      * igt@xe_oa@non-system-wide-paranoid:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2541 / Intel XE#3573)
>      * igt@xe_oa@syncs-userptr-wait:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2541 / Intel XE#3573 /
>             Intel XE#4501)
>      * igt@xe_peer2peer@read:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1061)
>      * igt@xe_peer2peer@write:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1061 / Intel XE#4208)
>      * igt@xe_prime_self_import@basic-with_one_bo:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#4954) +6 other tests skip
>      * igt@xe_pxp@pxp-termination-key-update-post-rpm:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4733) +2 other tests
>             skip
>      * igt@xe_query@multigpu-query-oa-units:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_query@multigpu-query-pxp-status:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#944) +1 other test skip
>      * igt@xe_sriov_flr@flr-each-isolation:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3342)
>      * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4351)
> 
>     Possible fixes
> 
>      * igt@core_hotunplug@unplug-rescan:
> 
>           * shard-bmg: SKIP (Intel XE#4963) -> PASS
>           * shard-lnl: SKIP (Intel XE#4963) -> PASS
>      * igt@fbdev@eof:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2134) -> PASS +2 other tests pass
>      * igt@kms_async_flips@alternate-sync-async-flip:
> 
>           * shard-bmg: FAIL (Intel XE#827) -> PASS +1 other test pass
>      * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> PASS +121
>             other tests pass
>      * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> 
>           * shard-bmg: SKIP (Intel XE#2314 / Intel XE#2894) -> PASS
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>           * shard-bmg: SKIP (Intel XE#2291) -> PASS +2 other tests pass
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-bmg: SKIP (Intel XE#1340) -> PASS
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-lnl: FAIL (Intel XE#4164) -> PASS
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-bmg: SKIP (Intel XE#2373) -> PASS
>      * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
> 
>           * shard-bmg: SKIP (Intel XE#2316) -> PASS +5 other tests pass
>      * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
> 
>           * shard-bmg: FAIL (Intel XE#3321) -> PASS +3 other tests pass
>      * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
> 
>           * shard-lnl: FAIL (Intel XE#886) -> PASS +2 other tests pass
>      * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#4208) -> PASS +12
>             other tests pass
>      * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2231 / Intel XE#4208) -> PASS +1
>             other test pass
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-bmg: SKIP (Intel XE#1503) -> PASS
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-lnl: FAIL (Intel XE#718) -> PASS
>      * igt@kms_psr@psr2-sprite-plane-onoff:
> 
>           * shard-lnl: SKIP (Intel XE#2351) -> PASS +3 other tests pass
>      * igt@kms_sequence@get-idle:
> 
>           * shard-bmg: SKIP (Intel XE#4954) -> PASS +15 other tests pass
>      * igt@kms_setmode@clone-exclusive-crtc:
> 
>           * shard-bmg: SKIP (Intel XE#1435) -> PASS +1 other test pass
>      * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1392) -> PASS +2 other tests pass
>      * igt@xe_exec_system_allocator@many-free:
> 
>           * shard-bmg: SKIP (Intel XE#4996) -> PASS +24 other tests pass
>      * {igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-shared-remap}:
> 
>           * shard-lnl: SKIP (Intel XE#4996) -> PASS +38 other tests pass
>      * igt@xe_mmap@bad-object:
> 
>           * shard-bmg: SKIP (Intel XE#4954 / Intel XE#4996) -> PASS +1 other
>             test pass
>      * igt@xe_module_load@reload-no-display:
> 
>           * shard-dg2-set2: FAIL (Intel XE#4208) -> PASS
>      * igt@xe_pm@s4-d3hot-basic-exec:
> 
>           * shard-lnl: ABORT (Intel XE#1794) -> PASS
>      * igt@xe_vm@large-split-binds-536870912:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> PASS +274 other tests
>             pass
> 
>     Warnings
> 
>      * igt@kms_async_flips@invalid-async-flip-atomic:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel
>             XE#3768)
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>           * shard-dg2-set2: SKIP (Intel XE#316) -> SKIP (Intel XE#2351 /
>             Intel XE#4208) +1 other test skip
>      * igt@kms_big_fb@linear-16bpp-rotate-90:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#4208) -> SKIP
>             (Intel XE#316) +2 other tests skip
>      * igt@kms_big_fb@linear-32bpp-rotate-270:
> 
>           * shard-bmg: SKIP (Intel XE#2231 / Intel XE#4996) -> SKIP (Intel
>             XE#2327)
>           * shard-dg2-set2: SKIP (Intel XE#2231 / Intel XE#4208) -> SKIP
>             (Intel XE#316)
>           * shard-lnl: SKIP (Intel XE#2351 / Intel XE#4996) -> SKIP (Intel
>             XE#1407)
>      * igt@kms_big_fb@linear-8bpp-rotate-90:
> 
>           * shard-bmg: SKIP (Intel XE#2231) -> SKIP (Intel XE#2327)
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> 
>           * shard-dg2-set2: SKIP (Intel XE#316) -> SKIP (Intel XE#4208) +1
>             other test skip
>      * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#316) +3
>             other tests skip
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2231 / Intel XE#4208) -> SKIP
>             (Intel XE#1124) +1 other test skip
>           * shard-lnl: SKIP (Intel XE#2351) -> SKIP (Intel XE#1124) +1 other
>             test skip
>      * igt@kms_big_fb@y-tiled-addfb:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#4208) -> SKIP
>             (Intel XE#619)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#4208) -> SKIP
>             (Intel XE#1124) +8 other tests skip
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
> 
>           * shard-bmg: SKIP (Intel XE#1124) -> SKIP (Intel XE#2231 / Intel
>             XE#4996)
>           * shard-dg2-set2: SKIP (Intel XE#1124) -> SKIP (Intel XE#2351 /
>             Intel XE#4208) +2 other tests skip
>           * shard-lnl: SKIP (Intel XE#1124) -> SKIP (Intel XE#2351 / Intel
>             XE#4996)
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1124) -> SKIP (Intel XE#4208) +5
>             other tests skip
>      * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>           * shard-dg2-set2: SKIP (Intel XE#607) -> SKIP (Intel XE#4208)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#1124) +6
>             other tests skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-bmg: SKIP (Intel XE#2231) -> SKIP (Intel XE#1124)
>      * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel
>             XE#2191) +1 other test skip
>      * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2191) -> SKIP (Intel XE#4208 /
>             i915#2575) +1 other test skip
>      * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel
>             XE#367) +3 other tests skip
>      * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#367) -> SKIP (Intel XE#4208 /
>             i915#2575) +1 other test skip
>           * shard-lnl: SKIP (Intel XE#1512) -> SKIP (Intel XE#4996)
>           * shard-bmg: SKIP (Intel XE#367) -> SKIP (Intel XE#4996)
>      * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
> 
>           * shard-bmg: SKIP (Intel XE#2887) -> SKIP (Intel XE#2231 / Intel
>             XE#4996)
>           * shard-lnl: SKIP (Intel XE#2887) -> SKIP (Intel XE#2351 / Intel
>             XE#4996)
>      * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455 / Intel XE#787) -> SKIP (Intel
>             XE#4208) +7 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#2907) +1
>             other test skip
>      * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#4208) -> SKIP
>             (Intel XE#455 / Intel XE#787)
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455 / Intel XE#787) -> SKIP (Intel
>             XE#2351 / Intel XE#4208) +2 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#3442) -> SKIP (Intel XE#4208)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#3442)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>           * shard-bmg: SKIP (Intel XE#2231) -> SKIP (Intel XE#2887)
>           * shard-dg2-set2: SKIP (Intel XE#2231 / Intel XE#4208) ->
>             INCOMPLETE (Intel XE#1727 / Intel XE#3113 / Intel XE#3124 / Intel
>             XE#4345)
>           * shard-lnl: SKIP (Intel XE#2351) -> SKIP (Intel XE#2887)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1727 / Intel XE#3113 / Intel
>             XE#3124) -> SKIP (Intel XE#4208)
>      * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2907) -> SKIP (Intel XE#4208) +1
>             other test skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#455 /
>             Intel XE#787) +9 other tests skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4418) -> SKIP (Intel XE#2351 /
>             Intel XE#4208)
>      * igt@kms_chamelium_color@ctm-limited-range:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel
>             XE#306) +1 other test skip
>      * igt@kms_chamelium_color@ctm-max:
> 
>           * shard-dg2-set2: SKIP (Intel XE#306) -> SKIP (Intel XE#4208 /
>             i915#2575)
>      * igt@kms_chamelium_hpd@hdmi-hpd:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel
>             XE#373) +15 other tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
> 
>           * shard-lnl: SKIP (Intel XE#4996) -> SKIP (Intel XE#373)
>           * shard-bmg: SKIP (Intel XE#4996) -> SKIP (Intel XE#2252)
>      * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> 
>           * shard-dg2-set2: SKIP (Intel XE#373) -> SKIP (Intel XE#4208 /
>             i915#2575) +8 other tests skip
>      * igt@kms_content_protection@atomic:
> 
>           * shard-bmg: SKIP (Intel XE#2341) -> FAIL (Intel XE#1178)
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel
>             XE#307)
>      * igt@kms_content_protection@legacy:
> 
>           * shard-bmg: FAIL (Intel XE#1178) -> SKIP (Intel XE#2341)
>           * shard-dg2-set2: FAIL (Intel XE#1178) -> SKIP (Intel XE#4208 /
>             i915#2575) +1 other test skip
>      * igt@kms_content_protection@uevent:
> 
>           * shard-lnl: SKIP (Intel XE#4996) -> SKIP (Intel XE#3278)
>           * shard-bmg: SKIP (Intel XE#4996) -> SKIP (Intel XE#2341)
>      * igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel
>             XE#308) +4 other tests skip
>      * igt@kms_cursor_crc@cursor-onscreen-32x32:
> 
>           * shard-bmg: SKIP (Intel XE#2320) -> SKIP (Intel XE#4996)
>           * shard-lnl: SKIP (Intel XE#1424) -> SKIP (Intel XE#4996)
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-dg2-set2: SKIP (Intel XE#308) -> SKIP (Intel XE#4208 /
>             i915#2575)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel
>             XE#323)
>      * igt@kms_dp_link_training@non-uhbr-mst:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4354) -> SKIP (Intel XE#4208)
>      * igt@kms_dp_link_training@non-uhbr-sst:
> 
>           * shard-bmg: SKIP (Intel XE#2231) -> SKIP (Intel XE#4354)
>           * shard-lnl: SKIP (Intel XE#2351) -> SKIP (Intel XE#4354)
>      * igt@kms_dp_link_training@uhbr-mst:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#4356)
>      * igt@kms_dp_link_training@uhbr-sst:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4356) -> SKIP (Intel XE#4208)
>      * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4422) -> SKIP (Intel XE#4208)
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-dg2-set2: SKIP (Intel XE#776) -> SKIP (Intel XE#4208)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel
>             XE#1138)
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1137) -> SKIP (Intel XE#4208 /
>             i915#2575)
>      * igt@kms_feature_discovery@psr1:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel
>             XE#1135)
>      * igt@kms_flip@2x-plain-flip-interruptible:
> 
>           * shard-lnl: SKIP (Intel XE#1421) -> SKIP (Intel XE#4996)
>      * igt@kms_flip@flip-vs-expired-vblank:
> 
>           * shard-dg2-set2: FAIL (Intel XE#301) -> SKIP (Intel XE#4208 /
>             i915#2575)
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> FAIL (Intel
>             XE#301) +1 other test fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#4208) -> SKIP
>             (Intel XE#455) +2 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455) -> SKIP (Intel XE#4208) +5
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#455) +2
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455) -> SKIP (Intel XE#2351 /
>             Intel XE#4208)
>      * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-lnl: SKIP (Intel XE#651) -> SKIP (Intel XE#2351)
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2231 / Intel
>             XE#4954)
>      * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
> 
>           * shard-lnl: SKIP (Intel XE#2351) -> SKIP (Intel XE#651)
>           * shard-bmg: SKIP (Intel XE#2231 / Intel XE#4954) -> SKIP (Intel
>             XE#2311)
>           * shard-dg2-set2: SKIP (Intel XE#2231 / Intel XE#4208) -> SKIP
>             (Intel XE#651)
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
> 
>           * shard-dg2-set2: SKIP (Intel XE#651) -> SKIP (Intel XE#4208) +20
>             other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +25 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@drrs-suspend:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#4208) -> SKIP
>             (Intel XE#651) +10 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#4141) -> SKIP (Intel XE#2231 / Intel
>             XE#4954)
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
> 
>           * shard-bmg: SKIP (Intel XE#2231 / Intel XE#4954) -> SKIP (Intel
>             XE#2312)
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2231 / Intel XE#4954) -> SKIP (Intel
>             XE#4141) +1 other test skip
>           * shard-dg2-set2: SKIP (Intel XE#2231 / Intel XE#4208) -> SKIP
>             (Intel XE#2351 / Intel XE#4208) +1 other test skip
>           * shard-lnl: SKIP (Intel XE#2351) -> SKIP (Intel XE#656) +1 other
>             test skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#4141) -> SKIP (Intel XE#2312) +14 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#4141) +7 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#651) +31
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2311) +15 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
> 
>           * shard-dg2-set2: SKIP (Intel XE#651) -> SKIP (Intel XE#2351 /
>             Intel XE#4208) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#4208) -> SKIP
>             (Intel XE#658) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#2231 / Intel XE#4954 / Intel XE#4996)
>             -> SKIP (Intel XE#2312)
>           * shard-lnl: SKIP (Intel XE#2351 / Intel XE#4996) -> SKIP (Intel
>             XE#656)
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +25 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
> 
>           * shard-dg2-set2: SKIP (Intel XE#653) -> SKIP (Intel XE#4208) +20
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2313) +11 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2231 / Intel XE#4208) -> SKIP
>             (Intel XE#4208) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2231 / Intel
>             XE#4954) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#2231 / Intel XE#4954) -> SKIP (Intel
>             XE#2313) +1 other test skip
>           * shard-dg2-set2: SKIP (Intel XE#2231 / Intel XE#4208) -> SKIP
>             (Intel XE#653)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#653) +24
>             other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#4208) -> SKIP
>             (Intel XE#653) +10 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
> 
>           * shard-dg2-set2: SKIP (Intel XE#653) -> SKIP (Intel XE#2351 /
>             Intel XE#4208) +1 other test skip
>      * igt@kms_getfb@getfb-reject-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#605) -> SKIP (Intel XE#4208 /
>             i915#2575)
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-bmg: SKIP (Intel XE#3544) -> SKIP (Intel XE#3374 / Intel
>             XE#3544)
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#2927)
>      * igt@kms_joiner@invalid-modeset-big-joiner:
> 
>           * shard-dg2-set2: SKIP (Intel XE#346) -> SKIP (Intel XE#4208)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-dg2-set2: SKIP (Intel XE#356) -> SKIP (Intel XE#4208 /
>             i915#2575)
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-bmg: SKIP (Intel XE#4954) -> SKIP (Intel XE#2486)
>      * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#4359)
>      * igt@kms_plane_multiple@2x-tiling-y:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel
>             XE#5021)
>      * igt@kms_plane_multiple@2x-tiling-yf:
> 
>           * shard-bmg: SKIP (Intel XE#5021) -> SKIP (Intel XE#4596)
>      * igt@kms_plane_multiple@tiling-y:
> 
>           * shard-dg2-set2: SKIP (Intel XE#5020) -> SKIP (Intel XE#4208 /
>             i915#2575)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel
>             XE#2763 / Intel XE#455) +2 other tests skip
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#2938)
>      * igt@kms_pm_backlight@fade:
> 
>           * shard-dg2-set2: SKIP (Intel XE#870) -> SKIP (Intel XE#4208)
>      * igt@kms_pm_backlight@fade-with-dpms:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#870) +1
>             other test skip
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-dg2-set2: SKIP (Intel XE#3309) -> SKIP (Intel XE#4208)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-dg2-set2: SKIP (Intel XE#908) -> SKIP (Intel XE#2351 /
>             Intel XE#4208)
>      * igt@kms_pm_dc@deep-pkgc:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#908)
>      * igt@kms_properties@get_properties-sanity-non-atomic:
> 
>           * shard-dg2-set2: FAIL (Intel XE#5017) -> SKIP (Intel XE#4208 /
>             i915#2575) +1 other test skip
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1489) -> SKIP (Intel XE#4208) +6
>             other tests skip
>      * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#1489) +8
>             other tests skip
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#1122)
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-lnl: SKIP (Intel XE#1128) -> SKIP (Intel XE#2351)
>           * shard-bmg: SKIP (Intel XE#2387) -> SKIP (Intel XE#2231 / Intel
>             XE#4954)
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1122) -> SKIP (Intel XE#4208)
>      * igt@kms_psr@fbc-pr-sprite-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2231 / Intel XE#4954) -> SKIP (Intel
>             XE#2234 / Intel XE#2850) +1 other test skip
>           * shard-dg2-set2: SKIP (Intel XE#2231 / Intel XE#4208) -> SKIP
>             (Intel XE#2850 / Intel XE#929) +1 other test skip
>           * shard-lnl: SKIP (Intel XE#2351) -> SKIP (Intel XE#1406)
>      * igt@kms_psr@fbc-psr-sprite-plane-onoff:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2850 / Intel XE#929) -> SKIP
>             (Intel XE#2351 / Intel XE#4208) +3 other tests skip
>      * igt@kms_psr@fbc-psr2-primary-render:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2850 / Intel XE#929) -> SKIP
>             (Intel XE#4208) +12 other tests skip
>      * igt@kms_psr@pr-primary-page-flip:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#4208) -> SKIP
>             (Intel XE#2850 / Intel XE#929) +4 other tests skip
>      * igt@kms_psr@psr-primary-render:
> 
>           * shard-bmg: SKIP (Intel XE#2234 / Intel XE#2850) -> SKIP (Intel
>             XE#2231 / Intel XE#4954)
>      * igt@kms_psr@psr2-basic:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#2850 /
>             Intel XE#929) +14 other tests skip
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#4208) -> SKIP
>             (Intel XE#2939)
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2939) -> SKIP (Intel XE#4208)
>      * igt@kms_rotation_crc@primary-rotation-90:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel
>             XE#3414)
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel
>             XE#1127) +1 other test skip
>      * igt@kms_rotation_crc@sprite-rotation-270:
> 
>           * shard-dg2-set2: SKIP (Intel XE#3414) -> SKIP (Intel XE#4208 /
>             i915#2575)
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1500) -> SKIP (Intel XE#4208 /
>             i915#2575)
>      * igt@kms_vrr@flip-dpms:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455) -> SKIP (Intel XE#4208 /
>             i915#2575) +8 other tests skip
>      * igt@kms_vrr@flip-suspend:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel
>             XE#455) +6 other tests skip
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-lnl: SKIP (Intel XE#4996) -> SKIP (Intel XE#1499)
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel
>             XE#756) +1 other test skip
>      * igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>           * shard-bmg: SKIP (Intel XE#4954) -> SKIP (Intel XE#1091 / Intel
>             XE#2849)
>           * shard-lnl: SKIP (Intel XE#4996) -> SKIP (Intel XE#1091 / Intel
>             XE#2849)
>      * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1091 / Intel XE#2849) -> SKIP
>             (Intel XE#4208 / i915#2575)
>      * igt@testdisplay:
> 
>           * shard-dg2-set2: ABORT (Intel XE#2705) -> SKIP (Intel XE#4208)
>      * igt@xe_copy_basic@mem-copy-linear-0x369:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1123) -> SKIP (Intel XE#4208)
>      * igt@xe_copy_basic@mem-set-linear-0xfffe:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1126) -> SKIP (Intel XE#4208)
>      * igt@xe_eu_stall@invalid-gt-id:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#4497) +1
>             other test skip
>      * igt@xe_eudebug@basic-exec-queues-enable:
> 
>           * shard-bmg: SKIP (Intel XE#4837) -> SKIP (Intel XE#4954) +1 other
>             test skip
>      * igt@xe_eudebug@multiple-sessions:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4837) -> SKIP (Intel XE#4208) +11
>             other tests skip
>      * igt@xe_eudebug_online@basic-breakpoint:
> 
>           * shard-bmg: SKIP (Intel XE#4954) -> SKIP (Intel XE#4837)
>           * shard-lnl: SKIP (Intel XE#4996) -> SKIP (Intel XE#4837)
>      * igt@xe_eudebug_online@interrupt-other-debuggable:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#4837) +15
>             other tests skip
>      * igt@xe_eudebug_sriov@deny-eudebug:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#4518)
>      * igt@xe_exec_basic@multigpu-no-exec-basic:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1392) -> SKIP (Intel XE#4208) +1
>             other test skip
>      * igt@xe_exec_basic@multigpu-once-null:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#1392) +1
>             other test skip
>      * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
> 
>           * shard-lnl: SKIP (Intel XE#4996) -> SKIP (Intel XE#1392)
>           * shard-bmg: SKIP (Intel XE#4954) -> SKIP (Intel XE#2322)
>      * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
> 
>           * shard-dg2-set2: SKIP (Intel XE#288) -> SKIP (Intel XE#4208) +30
>             other tests skip
>      * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#288) +36
>             other tests skip
>      * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2360) -> SKIP (Intel XE#4208) +1
>             other test skip
>      * igt@xe_exec_system_allocator@many-mmap-free-huge:
> 
>           * shard-lnl: SKIP (Intel XE#4943) -> SKIP (Intel XE#4996) +2 other
>             tests skip
>      * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4915) -> SKIP (Intel XE#4208) +190
>             other tests skip
>      * igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge-nomemset:
> 
>           * shard-bmg: SKIP (Intel XE#4943) -> SKIP (Intel XE#4996) +2 other
>             tests skip
>      * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
> 
>           * shard-lnl: FAIL (Intel XE#4929 / Intel XE#5018) -> FAIL (Intel
>             XE#5018)
>      * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#4915) +242
>             other tests skip
>      * igt@xe_oa@buffer-size:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#4501)
>      * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2541 / Intel XE#3573) -> SKIP
>             (Intel XE#4208) +7 other tests skip
>      * igt@xe_oa@syncs-syncobj-wait-cfg:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#2541 /
>             Intel XE#3573 / Intel XE#4501) +1 other test skip
>      * igt@xe_oa@syncs-userptr-wait-cfg:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2541 / Intel XE#3573 / Intel
>             XE#4501) -> SKIP (Intel XE#4208) +2 other tests skip
>      * igt@xe_oa@whitelisted-registers-userspace-config:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#2541 /
>             Intel XE#3573) +9 other tests skip
>      * igt@xe_pat@pat-index-xe2:
> 
>           * shard-dg2-set2: SKIP (Intel XE#977) -> SKIP (Intel XE#4208)
>      * igt@xe_peer2peer@read:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1061 / Intel XE#4208) -> SKIP
>             (Intel XE#1061)
>      * igt@xe_pm@vram-d3cold-threshold:
> 
>           * shard-dg2-set2: SKIP (Intel XE#579) -> SKIP (Intel XE#4208)
>      * igt@xe_pmu@fn-engine-activity-sched-if-idle:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4650) -> SKIP (Intel XE#4208)
>      * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#4733) +3
>             other tests skip
>      * igt@xe_query@multigpu-query-config:
> 
>           * shard-bmg: SKIP (Intel XE#4954) -> SKIP (Intel XE#944)
>      * igt@xe_query@multigpu-query-topology:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#944) +1
>             other test skip
>      * igt@xe_query@multigpu-query-uc-fw-version-guc:
> 
>           * shard-dg2-set2: SKIP (Intel XE#944) -> SKIP (Intel XE#4208) +1
>             other test skip
>      * igt@xe_render_copy@render-stress-4-copies:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4814) -> SKIP (Intel XE#4208)
>      * igt@xe_spin_batch@spin-mem-copy:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4821) -> SKIP (Intel XE#4208)
>      * igt@xe_sriov_auto_provisioning@exclusive-ranges:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4130) -> SKIP (Intel XE#4208)
>      * igt@xe_sriov_auto_provisioning@selfconfig-basic:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#4130) +2
>             other tests skip
>      * igt@xe_sriov_flr@flr-vf1-clear:
> 
>           * shard-dg2-set2: SKIP (Intel XE#3342) -> SKIP (Intel XE#4208)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * IGT: IGT_8362 -> IGTPW_13120
>      * Linux: xe-3069-3db1bb52113808f8bc72a7049e2d36e76acc882c ->
>        xe-3082-d0d3c136f60cbee6ede33f207b4e6d6b2f04779d
> 
>    IGTPW_13120: 13120
>    IGT_8362: 8362
>    xe-3069-3db1bb52113808f8bc72a7049e2d36e76acc882c:
>    3db1bb52113808f8bc72a7049e2d36e76acc882c
>    xe-3082-d0d3c136f60cbee6ede33f207b4e6d6b2f04779d:
>    d0d3c136f60cbee6ede33f207b4e6d6b2f04779d
