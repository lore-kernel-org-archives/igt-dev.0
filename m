Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39C8C369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 04:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B5110E07C;
	Tue, 15 Apr 2025 04:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBJh4/ME";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2958E10E07C
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 04:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744690806; x=1776226806;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AEdSsHDLdbhFRABbZptjQ2UvLQBXtAlHq5cPt9aCWZ4=;
 b=GBJh4/MEuf1tHAihtlPy9YcUF0mEDBunwsAJn5PMgfpEk9KVeHrM935k
 Ps5a2LV2HogtXiXU9NnoGNq321QICuYq7LshgFq/CQGmKYiwX4+r5IS/w
 OmqmsubvVZFxfMeD+qk3V89b4HYmzTkvX1Zo7CE6yo3+DsBwhRbHTItqT
 PhFqGTZy9HD16z/hnBeT0Mu06vGLVaKXD23x2X83yM0KuRTOLJtNuGk8B
 vJ9+311oSL5JMpgCfvAriYugRA+OYosarPP2YbzZ1DcwVUb/MVckqanC5
 Hm0eFys2FAzmws1GuLo8cCfa0NZi8YS+t9In2cGdU/3IIkw8VmFMUKgyO Q==;
X-CSE-ConnectionGUID: LHtm56vJS+egovDO45UE/A==
X-CSE-MsgGUID: +OlpgcOaSNuAxVBMHIORtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45415569"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45415569"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 21:20:05 -0700
X-CSE-ConnectionGUID: Ug83Lln2SqKRClt27ybv9A==
X-CSE-MsgGUID: YjGUiRQgSM26a7+Ffi93ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130972692"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.1])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 21:20:04 -0700
Date: Tue, 15 Apr 2025 06:20:00 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Stress copy engines during render (rev8)
Message-ID: <20250415042000.ewchgfg3gkxrdzuh@zkempczy-mobl2>
References: <20250414103316.27082-1-francois.dugast@intel.com>
 <174467988910.3787.13333299185629844491@b68e5b3b99e1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174467988910.3787.13333299185629844491@b68e5b3b99e1>
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

On Tue, Apr 15, 2025 at 01:18:09AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Stress copy engines during render (rev8)                         
>    URL:     https://patchwork.freedesktop.org/series/145831/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12970/index.html 
> 
>         CI Bug Log - changes from XEIGT_8318_FULL -> XEIGTPW_12970_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_12970_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_12970_FULL, please notify your bug team
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
>    XEIGTPW_12970_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_pm_rpm@legacy-planes-dpms@plane-68:
> 
>           * shard-bmg: PASS -> DMESG-WARN +2 other tests dmesg-warn
>      * igt@xe_render_copy@render-stress-4-copies (NEW):
> 
>           * shard-dg2-set2: NOTRUN -> SKIP +3 other tests skip
>      * igt@xe_spin_batch@spin-mem-copy (NEW):
> 
>           * shard-dg2-set2: NOTRUN -> FAIL

It seems fail should be skip on dg2 where's no mem-copy command.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between XEIGT_8318_FULL and
>    XEIGTPW_12970_FULL:
> 
>   New IGT tests (5)
> 
>      * igt@xe_render_copy@render-stress-0-copies:
> 
>           * Statuses : 2 pass(s) 1 skip(s)
>           * Exec time: [0.0, 3.23] s
>      * igt@xe_render_copy@render-stress-1-copies:
> 
>           * Statuses : 2 pass(s) 1 skip(s)
>           * Exec time: [0.0, 3.23] s
>      * igt@xe_render_copy@render-stress-2-copies:
> 
>           * Statuses : 2 pass(s) 1 skip(s)
>           * Exec time: [0.0, 3.23] s
>      * igt@xe_render_copy@render-stress-4-copies:
> 
>           * Statuses : 2 pass(s) 1 skip(s)
>           * Exec time: [0.0, 3.26] s
>      * igt@xe_spin_batch@spin-mem-copy:
> 
>           * Statuses : 1 fail(s) 2 pass(s)
>           * Exec time: [0.11, 5.90] s
> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_12970_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3767) +15 other tests
>             skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2550 / Intel XE#3767)
>             +15 other tests skip
>      * igt@kms_async_flips@invalid-async-flip-atomic:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3768)
>      * igt@kms_big_fb@linear-32bpp-rotate-270:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2327)
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#316) +1 other test skip
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1407) +2 other tests skip
>      * igt@kms_big_fb@y-tiled-addfb:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2328)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124) +6 other tests skip
>      * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#607)
>      * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1428)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +4 other tests skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124) +6 other tests
>             skip
>      * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2314 / Intel XE#2894)
>      * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1512) +1 other test skip
>      * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#367) +2 other tests skip
>      * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#367)
>      * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#367)
>      * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +172 other tests
>             skip
>      * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +35
>             other tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2669) +11 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +9 other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +5 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +12
>             other tests skip
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3432)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1727 / Intel XE#3113
>             / Intel XE#3124)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#1727 / Intel
>             XE#3113)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#3124)
>      * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4417) +3 other tests
>             skip
>      * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4416) +3 other tests
>             skip
>      * igt@kms_chamelium_color@ctm-limited-range:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2325)
>      * igt@kms_chamelium_color@ctm-max:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#306)
>      * igt@kms_chamelium_color@gamma:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#306) +1 other test skip
>      * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#373) +7 other tests skip
>      * igt@kms_chamelium_frames@vga-frame-dump:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +6 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373) +5 other tests skip
>      * igt@kms_content_protection@atomic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3278)
>      * igt@kms_content_protection@atomic@pipe-a-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1178)
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#307)
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2390)
>      * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#1178)
>      * igt@kms_content_protection@type1:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2341)
>      * igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2321)
>      * igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#308) +1 other test skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424) +3 other tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2321)
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2291) +1 other test skip
>      * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#309)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#323)
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309) +2 other tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2291) +5 other tests skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2286)
>      * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1508)
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#4302)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_dp_link_training@non-uhbr-sst:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#4354)
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2244) +1 other test skip
>      * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4422)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#776)
>      * igt@kms_flip@2x-dpms-vs-vblank-race:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#310) +5 other tests skip
>      * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#3321)
>      * igt@kms_flip@2x-flip-vs-panning:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2316)
>      * igt@kms_flip@2x-flip-vs-rmfb:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421) +1 other test skip
>      * igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2316) +9 other tests skip
>      * igt@kms_flip@blocking-wf_vblank:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#886) +2 other tests fail
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#301) +1 other test fail
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#301) +2 other tests fail
>      * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#301 / Intel XE#3321) +3
>             other tests fail
>      * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#301) +1 other test fail
>      * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#301 / Intel XE#3149)
>      * igt@kms_flip@flip-vs-suspend@a-hdmi-a3:
> 
>           * shard-bmg: PASS -> INCOMPLETE (Intel XE#2049 / Intel XE#2597)
>      * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#2882) +2 other tests fail
>      * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#886) +1 other test fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1397 / Intel XE#1745)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1397)
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293 / Intel XE#2380) +4
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293) +4 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401 / Intel XE#1745) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +14 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2312) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +28 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#656) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#656) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1469)
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +14 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651) +12 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2352)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +14 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +9 other tests skip
>      * igt@kms_getfb@getfb-reject-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#605)
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1503) +1 other test skip
>      * igt@kms_joiner@basic-big-joiner:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#346)
>      * igt@kms_joiner@basic-max-non-joiner:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4298)
>      * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2925) +1 other test skip
>      * igt@kms_plane_lowres@tiling-yf:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#599)
>      * igt@kms_plane_multiple@2x-tiling-x:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#4596)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2763) +3 other tests skip
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2763) +5 other tests
>             skip
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2763 / Intel XE#455) +3
>             other tests skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2763) +4 other tests skip
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2938)
>      * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#3141 / Intel
>             XE#836)
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#836) +1 other test skip
>      * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2893) +2 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4608) +5 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1489) +6 other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2893 / Intel XE#4608) +2
>             other tests skip
>      * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1489) +4 other tests
>             skip
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2387)
>      * igt@kms_psr@fbc-psr2-primary-render:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2850 / Intel XE#929) +9
>             other tests skip
>      * igt@kms_psr@fbc-psr2-sprite-plane-move:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406) +2 other tests skip
>      * igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4609) +1 other test skip
>      * igt@kms_psr@pr-sprite-plane-onoff:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2234 / Intel XE#2850) +4
>             other tests skip
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2939)
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3414) +2 other tests
>             skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904)
>      * igt@kms_scaling_modes@scaling-mode-none:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2413 / Intel XE#374)
>      * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#374) +2 other tests skip
>      * igt@kms_setmode@invalid-clone-single-crtc:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#455)
>      * igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#4459) +1 other test fail
>      * igt@kms_vrr@flip-dpms:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1499) +1 other test skip
>      * igt@kms_vrr@flip-suspend:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +6 other tests skip
>      * igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#756)
>      * igt@xe_compute_preempt@compute-preempt-many:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1280 / Intel XE#455) +1
>             other test skip
>      * igt@xe_eu_stall@unprivileged-access:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4497)
>      * igt@xe_eudebug@basic-close:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2905) +9 other tests
>             skip
>      * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2905) +6 other tests skip
>      * igt@xe_eudebug@discovery-race-sigint:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2905 / Intel XE#4259)
>      * igt@xe_eudebug_online@single-step:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2905) +6 other tests skip
>      * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#688) +2 other tests skip
>      * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +4 other tests skip
>      * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +4 other tests skip
>      * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1392) +1 other test skip
>      * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1392) +5 other tests skip
>      * igt@xe_exec_fault_mode@twice-invalid-fault:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288) +14 other tests
>             skip
>      * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2229)
>      * igt@xe_media_fill@media-fill:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#560)
>      * igt@xe_module_load@load:
> 
>           * shard-lnl: (PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS) -> (PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             SKIP, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS)
>             (Intel XE#378)
>      * igt@xe_oa@buffer-size:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#4541)
>      * igt@xe_oa@buffer-size@ccs-0-128k:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#4541)
>      * igt@xe_oa@oa-tlb-invalidate:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2248)
>      * igt@xe_oa@polling-small-buf:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2541 / Intel XE#3573) +4
>             other tests skip
>      * igt@xe_pat@pat-index-xelpg:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#979)
>      * igt@xe_peer2peer@read:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1061)
>      * igt@xe_pm@d3cold-mmap-vram:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366) +1
>             other test skip
>      * igt@xe_pm@s4-vm-bind-userptr:
> 
>           * shard-lnl: PASS -> ABORT (Intel XE#1794)
>      * igt@xe_pm_residency@cpg-basic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#584)
>      * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4733)
>      * igt@xe_pxp@pxp-stale-queue-post-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4733) +1 other test skip
>      * igt@xe_query@multigpu-query-gt-list:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4130)
>      * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4130)
>      * igt@xe_sriov_flr@flr-each-isolation:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3342)
> 
>     Possible fixes
> 
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-bmg: INCOMPLETE (Intel XE#3862) -> PASS +1 other test pass
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1727 / Intel XE#3113) ->
>             PASS +1 other test pass
>      * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
> 
>           * shard-dg2-set2: SKIP (Intel XE#309) -> PASS +4 other tests pass
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
> 
>           * shard-bmg: SKIP (Intel XE#2291) -> PASS +1 other test pass
>      * igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>           * shard-bmg: SKIP (Intel XE#4294) -> PASS
>           * shard-dg2-set2: SKIP (Intel XE#4331) -> PASS
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-bmg: SKIP (Intel XE#2373) -> PASS
>      * igt@kms_flip@2x-blocking-absolute-wf_vblank:
> 
>           * shard-dg2-set2: SKIP (Intel XE#310) -> PASS +9 other tests pass
>      * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
> 
>           * shard-bmg: FAIL (Intel XE#3321) -> PASS +1 other test pass
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-bmg: SKIP (Intel XE#2316) -> PASS +6 other tests pass
>      * igt@kms_flip@dpms-off-confusion:
> 
>           * shard-dg2-set2: FAIL -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#656) -> PASS +5 other tests pass
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
> 
>           * shard-lnl: ABORT (Intel XE#4624) -> PASS +1 other test pass
>      * igt@kms_hdr@static-swap:
> 
>           * shard-dg2-set2: FAIL (Intel XE#4426) -> PASS +1 other test pass
>      * igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>           * shard-bmg: SKIP (Intel XE#1435) -> PASS
>      * igt@kms_vblank@wait-idle-hang@pipe-a-dp-2:
> 
>           * shard-bmg: FAIL -> PASS +2 other tests pass
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-bmg: SKIP (Intel XE#1499) -> PASS
>           * shard-dg2-set2: SKIP (Intel XE#455) -> PASS
>      * igt@xe_ccs@suspend-resume:
> 
>           * shard-bmg: DMESG-WARN -> PASS +3 other tests pass
>      * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1392) -> PASS +6 other tests pass
>      * igt@xe_pm@s3-mocs:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#569) -> PASS
> 
>     Warnings
> 
>      * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#367) -> SKIP (Intel XE#2191)
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455 / Intel XE#787) -> SKIP (Intel
>             XE#787) +9 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
> 
>           * shard-dg2-set2: SKIP (Intel XE#787) -> SKIP (Intel XE#455 / Intel
>             XE#787) +8 other tests skip
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-bmg: FAIL (Intel XE#1178) -> SKIP (Intel XE#2341)
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-bmg: SKIP (Intel XE#2341) -> FAIL (Intel XE#1178)
>      * igt@kms_content_protection@srm:
> 
>           * shard-dg2-set2: FAIL (Intel XE#1178) -> SKIP (Intel XE#455)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-dg2-set2: FAIL (Intel XE#1188) -> SKIP (Intel XE#455)
>           * shard-bmg: FAIL (Intel XE#1188) -> SKIP (Intel XE#2341)
>      * igt@kms_flip@flip-vs-expired-vblank:
> 
>           * shard-lnl: FAIL (Intel XE#301) -> FAIL (Intel XE#301 / Intel
>             XE#3149)
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2311) +14 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
> 
>           * shard-dg2-set2: SKIP (Intel XE#651) -> SKIP (Intel XE#656) +9
>             other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +20 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#4141) +5 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>           * shard-bmg: SKIP (Intel XE#4141) -> SKIP (Intel XE#2312) +6 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#656) -> SKIP (Intel XE#651) +13
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +17 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#656) -> SKIP (Intel XE#653) +18
>             other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2313) +7 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
> 
>           * shard-dg2-set2: SKIP (Intel XE#653) -> SKIP (Intel XE#656) +11
>             other tests skip
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-bmg: SKIP (Intel XE#3544) -> SKIP (Intel XE#3374 / Intel
>             XE#3544)
>      * igt@kms_plane_multiple@2x-tiling-y:
> 
>           * shard-bmg: SKIP (Intel XE#4596) -> SKIP (Intel XE#2493)
>           * shard-dg2-set2: SKIP (Intel XE#4596) -> SKIP (Intel XE#455)
>      * igt@kms_plane_multiple@2x-tiling-yf:
> 
>           * shard-bmg: SKIP (Intel XE#2493) -> SKIP (Intel XE#4596)
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-dg2-set2: ABORT (Intel XE#4760) -> ABORT (Intel XE#2705 /
>             Intel XE#4760)
>      * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: ABORT (Intel XE#4760) -> ABORT (Intel XE#4502 /
>             Intel XE#4760)
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-bmg: SKIP (Intel XE#2426) -> FAIL (Intel XE#1729)
>      * igt@xe_module_load@load:
> 
>           * shard-bmg: (PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             SKIP, PASS, PASS, PASS, PASS, PASS, DMESG-WARN, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS) (Intel XE#2457) ->
>             (PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             SKIP, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS) (Intel XE#2457)
>      * igt@xe_peer2peer@write:
> 
>           * shard-dg2-set2: FAIL (Intel XE#1173) -> SKIP (Intel XE#1061)
> 
> Build changes
> 
>      * IGT: IGT_8318 -> IGTPW_12970
>      * Linux: xe-2947-7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa ->
>        xe-2948-24805f4111e68bf0f6f7a513d2145fe7debd7eea
> 
>    IGTPW_12970: 81ce2d1aee5e9fecf6a4fa6767f4c4be01453eda @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8318: 6a33ce105328c5c7cdc63cdd799698638f20db28 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-2947-7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa:
>    7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa
>    xe-2948-24805f4111e68bf0f6f7a513d2145fe7debd7eea:
>    24805f4111e68bf0f6f7a513d2145fe7debd7eea
