Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F5AC5AE59
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 08:38:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E3E10E81C;
	Thu,  5 Jun 2025 08:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LI9ovua3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804A510E81C
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jun 2025 08:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749112702; x=1780648702;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=puqz6XEG81d8+tWoVDzTswa2MeOCJru4XBwOR7JTFUA=;
 b=LI9ovua3zRmdmWeKzU2c1Rfm3SZIECdbEaQX0wINiOLfVQH6r/2ISWwL
 ddEjxOwf3q1lNuwZupgb/jhtYnQ/hxNJTwHSzRcRKEa5Dg9YYIiLIoeUw
 n7WFuYXJXTtsKpgl8MzgKldogbEY+hQG8mPZa27pM0V11PYr2NR90yIhg
 SBz+sQM+/FmoMnx8WYOLmXH+ZDUmyelft9382Yr4HfHFpZK83TyCi+tFa
 f9Bwn9TqKPNZXzUci7/YDXxry1B1dEKCGLhQzNGRfzWQA5v6ZW64L60SA
 ooMwL6FrpjOyk+4wWmXrx95Nwfy6oGdMDmuduFLU2kV3cZRiFCeUQDlEg Q==;
X-CSE-ConnectionGUID: +C2UZQbETqa661cy5CGquA==
X-CSE-MsgGUID: 5+d9YgT+RY6zu1DHDNzxNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68773248"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="68773248"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 01:38:21 -0700
X-CSE-ConnectionGUID: UJXeqh/zTJC17cgV5TEpUQ==
X-CSE-MsgGUID: ScrNiH8MTUGQsyLyfJqz9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="176308979"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.2])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 01:38:20 -0700
Date: Thu, 5 Jun 2025 10:38:17 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= success for
 Control compute-preempt bo allocation
Message-ID: <4o74w6cemkejlihrse5lkpgdvgn5rurqw24bfbxzbvffj3vfdy@lymxqpdocm6l>
References: <20250604115024.117036-4-zbigniew.kempczynski@intel.com>
 <174910683920.50857.17226971069868884826@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174910683920.50857.17226971069868884826@1538d3639d33>
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

On Thu, Jun 05, 2025 at 07:00:39AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Control compute-preempt bo allocation                            
>    URL:     https://patchwork.freedesktop.org/series/149833/                 
>    State:   success                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13242/index.html 
> 
>         CI Bug Log - changes from XEIGT_8394_FULL -> XEIGTPW_13242_FULL
> 
> Summary
> 
>    SUCCESS
> 
>    No regressions found.
> 
> Participating hosts (4 -> 3)
> 
>    Missing (1): shard-adlp
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    XEIGTPW_13242_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * {igt@xe_compute_preempt@compute-preempt-many-vram-evict} (NEW):
>           * shard-lnl: NOTRUN -> SKIP +1 other test skip

This skip is expected, as LNL doesn't have vram.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between XEIGT_8394_FULL and
>    XEIGTPW_13242_FULL:
> 
>   New IGT tests (4)
> 
>      * igt@xe_compute_preempt@compute-preempt-many-vram:
> 
>           * Statuses : 1 pass(s) 2 skip(s)
>           * Exec time: [0.0, 2.80] s
>      * igt@xe_compute_preempt@compute-preempt-many-vram-evict:
> 
>           * Statuses : 1 pass(s) 2 skip(s)
>           * Exec time: [0.0, 5.04] s
>      * igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:
> 
>           * Statuses : 1 pass(s) 1 skip(s)
>           * Exec time: [0.0, 5.04] s
>      * igt@xe_compute_preempt@compute-preempt-many-vram@engine-drm_xe_engine_class_compute:
> 
>           * Statuses : 1 pass(s) 1 skip(s)
>           * Exec time: [0.0, 2.80] s
> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_13242_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@intel_hwmon@hwmon-read:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1125) +1 other test skip
>      * igt@kms_async_flips@invalid-async-flip:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#873)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#873)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#873)
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1407) +2 other tests skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2327)
>      * igt@kms_big_fb@linear-16bpp-rotate-270:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#316) +3 other tests skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124) +2 other tests skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +1 other test skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124) +12 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#607)
>      * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2314 / Intel XE#2894)
>      * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2191)
>      * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2314 / Intel XE#2894)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1512) +1 other test skip
>      * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2191) +2 other tests
>             skip
>      * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#367) +1 other test skip
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#367) +1 other test skip
>      * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#367)
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +11
>             other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +5 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +209 other tests
>             skip
>      * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +44
>             other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +6 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3442)
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3432)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1727 / Intel XE#3113
>             / Intel XE#3124 / Intel XE#4345)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#3124)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#1727 / Intel
>             XE#3113)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#2705 / Intel
>             XE#4212)
>      * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4417) +3 other tests
>             skip
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4416) +3 other tests skip
>      * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4416) +3 other tests
>             skip
>      * igt@kms_chamelium_color@ctm-0-50:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2325)
>      * igt@kms_chamelium_color@ctm-green-to-red:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#306)
>      * igt@kms_chamelium_color@ctm-max:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#306) +1 other test skip
>      * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +3 other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373) +4 other tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-fast:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#373) +11 other tests
>             skip
>      * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1178) +1 other test fail
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#1178)
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#307)
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#307)
>      * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#3304)
>      * igt@kms_content_protection@uevent@pipe-a-dp-2:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#1188)
>      * igt@kms_content_protection@uevent@pipe-a-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1188)
>      * igt@kms_cursor_crc@cursor-onscreen-32x10:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +4 other tests skip
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#308)
>      * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424) +5 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +15 other tests
>             skip
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309) +1 other test skip
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2291)
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2291) +2 other tests skip
>      * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1508)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1340) +1 other test skip
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4494 / i915#3804)
>      * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2244)
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4156)
>      * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2316) +1 other test skip
>      * igt@kms_flip@2x-flip-vs-expired-vblank:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421) +3 other tests skip
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#301) +3 other tests fail
>      * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#3321) +4 other tests fail
>      * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#301) +3 other tests fail
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2316) +4 other tests skip
>      * igt@kms_flip@2x-plain-flip-ts-check:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#2882)
>      * igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a2-dp2:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#886) +1 other test fail
>      * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#301 / Intel XE#3321) +1
>             other test fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#4683) +3 other tests fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401 / Intel XE#1745)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401)
>      * igt@kms_force_connector_basic@prune-stale-modes:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#352)
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2312) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +38 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +12 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +12 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#658)
>      * igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1158)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2350)
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +36 other tests
>             skip
>      * igt@kms_getfb@getfb-reject-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#605)
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1503)
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#1503)
>      * igt@kms_joiner@invalid-modeset-big-joiner:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#346)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#346)
>      * igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#3012)
>      * igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1122) +1 other test skip
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3309)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3309)
>      * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1489) +11 other tests
>             skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2893) +3 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2893 / Intel XE#4608)
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4608) +2 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1489) +4 other tests skip
>      * igt@kms_psr@fbc-pr-sprite-plane-move:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406) +2 other tests skip
>      * igt@kms_psr@fbc-psr-cursor-plane-onoff:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2850 / Intel XE#929) +15
>             other tests skip
>      * igt@kms_psr@pr-cursor-plane-onoff:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2234 / Intel XE#2850) +5
>             other tests skip
>      * igt@kms_rotation_crc@primary-rotation-90:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904) +1
>             other test skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3414) +4 other tests
>             skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1127)
>      * igt@kms_rotation_crc@sprite-rotation-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904)
>      * igt@kms_setmode@basic@pipe-b-hdmi-a-2-pipe-a-dp-2:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#2883) +3 other tests
>             fail
>      * igt@kms_tv_load_detect@load-detect:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#330)
>      * igt@kms_vrr@cmrr:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2168)
>      * igt@xe_compute_preempt@compute-preempt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1280 / Intel XE#455) +3
>             other tests skip
>      * igt@xe_copy_basic@mem-copy-linear-0xfffe:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1123)
>      * igt@xe_copy_basic@mem-set-linear-0x369:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1126)
>      * igt@xe_eu_stall@invalid-gt-id:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4497)
>      * igt@xe_eudebug_online@interrupt-other-debuggable:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837) +3 other tests skip
>      * igt@xe_eudebug_online@single-step-one:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4837) +5 other tests skip
>      * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4837) +14 other tests
>             skip
>      * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#688) +3 other tests skip
>      * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1392)
>      * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +5 other tests skip
>      * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1392) +5 other tests skip
>      * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +3 other tests skip
>      * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288) +28 other tests
>             skip
>      * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2360) +1 other test skip
>      * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4943) +11 other tests skip
>      * igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4943) +14 other tests skip
>      * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4915) +294 other tests
>             skip
>      * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
> 
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#4911)
>      * igt@xe_media_fill@media-fill:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2459 / Intel XE#2596)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#560)
>      * igt@xe_module_load@load:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2457)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#378)
>      * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2541 / Intel XE#3573) +7
>             other tests skip
>      * igt@xe_oa@syncs-ufence-wait-cfg:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2541 / Intel XE#3573 /
>             Intel XE#4501)
>      * igt@xe_pat@pat-index-xe2:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#977)
>      * igt@xe_pat@pat-index-xelpg:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#979)
>      * igt@xe_pm@d3cold-basic-exec:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366) +1
>             other test skip
>      * igt@xe_pm@s3-vm-bind-prefetch:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#584)
>      * igt@xe_pm@s4-basic:
> 
>           * shard-lnl: PASS -> ABORT (Intel XE#1794)
>      * igt@xe_pm@vram-d3cold-threshold:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#579)
>      * igt@xe_pxp@pxp-termination-key-update-post-suspend:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4733)
>      * igt@xe_query@multigpu-query-invalid-size:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_query@multigpu-query-oa-units:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#944) +6 other tests skip
>      * igt@xe_render_copy@render-stress-4-copies:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4814)
>      * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4130) +1 other test skip
>      * igt@xe_sriov_auto_provisioning@selfconfig-basic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4130)
> 
>     Possible fixes
> 
>      * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
> 
>           * shard-lnl: FAIL (Intel XE#911) -> PASS +3 other tests pass
>      * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> 
>           * shard-bmg: SKIP (Intel XE#2314 / Intel XE#2894) -> PASS
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1727 / Intel XE#3113 / Intel
>             XE#4212 / Intel XE#4522) -> PASS
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>           * shard-bmg: SKIP (Intel XE#2291) -> PASS +6 other tests pass
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-bmg: SKIP (Intel XE#4302) -> PASS
>      * igt@kms_dp_aux_dev:
> 
>           * shard-bmg: SKIP (Intel XE#3009) -> PASS
>      * igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>           * shard-bmg: SKIP (Intel XE#2316) -> PASS +9 other tests pass
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
> 
>           * shard-dg2-set2: FAIL (Intel XE#301) -> PASS +3 other tests pass
>      * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
> 
>           * shard-dg2-set2: FAIL (Intel XE#301 / Intel XE#3321) -> PASS
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-bmg: SKIP (Intel XE#1503) -> PASS
>      * igt@kms_joiner@basic-force-big-joiner:
> 
>           * shard-bmg: SKIP (Intel XE#3012) -> PASS
>      * igt@kms_setmode@invalid-clone-single-crtc:
> 
>           * shard-bmg: SKIP (Intel XE#1435) -> PASS
>      * igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>           * shard-lnl: FAIL (Intel XE#4459) -> PASS +1 other test pass
>      * igt@xe_exec_basic@multigpu-once-null:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1392) -> PASS +3 other tests pass
>      * igt@xe_exec_system_allocator@process-many-execqueues-free-race:
> 
>           * shard-bmg: INCOMPLETE -> PASS
>      * igt@xe_exec_system_allocator@threads-shared-vm-many-new-bo-map-nomemset:
> 
>           * shard-lnl: FAIL -> PASS
> 
>     Warnings
> 
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1727 / Intel XE#2705 / Intel
>             XE#3113 / Intel XE#4212 / Intel XE#4522) -> INCOMPLETE (Intel
>             XE#2705 / Intel XE#4212)
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-bmg: SKIP (Intel XE#2341) -> FAIL (Intel XE#1178)
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-bmg: FAIL (Intel XE#1178) -> SKIP (Intel XE#2341)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-bmg: SKIP (Intel XE#2341) -> FAIL (Intel XE#1188)
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> 
>           * shard-bmg: FAIL (Intel XE#3321) -> SKIP (Intel XE#2316)
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2311) +20 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +16 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#4141) -> SKIP (Intel XE#2312) +4 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#4141) +20 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +14 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2313) +22 other
>             tests skip
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-bmg: SKIP (Intel XE#3544) -> SKIP (Intel XE#3374 / Intel
>             XE#3544)
>      * igt@xe_peer2peer@read:
> 
>           * shard-dg2-set2: FAIL (Intel XE#1173) -> SKIP (Intel XE#1061) +1
>             other test skip
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * IGT: IGT_8394 -> IGTPW_13242
> 
>    IGTPW_13242: 3e0cb64ac57d4d8b267a53933b7373c6defb54f5 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8394: 8394
>    xe-3191-6517275da428d10d60b2762385ca7daa3a382754:
>    6517275da428d10d60b2762385ca7daa3a382754
