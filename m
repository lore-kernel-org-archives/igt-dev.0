Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DBEC36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 04:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7C110E7C9;
	Wed,  9 Apr 2025 04:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K9Pz4Yr7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85CF10E7C8;
 Wed,  9 Apr 2025 04:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744172963; x=1775708963;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=esfqGZp7yGynCKLSBNneUxAkIiukCZkZhgB4QKzBp0s=;
 b=K9Pz4Yr7xrV3P7VCCLNiYwjtm5W+QJJspjHQRjmI688heBKebMU+GTlo
 JHuay7jkP6JnSZvI+YARA768XBfeUeuQg5A6D0tcKDs+sOT3DTHgM2g62
 IvxlA7upUJV3OnZmxrUnQO4zelwhQ4peCXUaekqyD+4SHfBVLoWnBXg2g
 vjvFh+MGAwPeezXWtb9rQgnQFlA7OfqcCFm/JN+//8r/bbGaEdvkqWciE
 F335NwlGbefMSmnceGICtui2YpYSY6xbADvDflSxRxYC/n1jqbAFD8lBF
 WJLzf5LJFKZUEEJDTTUyvJTsyr6Yi+yZ56kr8dVHiiFVcf0NQ6WXQV6qY g==;
X-CSE-ConnectionGUID: e0aEJyZ9QyiZZf3IbP0z/A==
X-CSE-MsgGUID: VpmsYCsnRjW3eKW/yLZdIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44770950"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="44770950"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 21:29:22 -0700
X-CSE-ConnectionGUID: NyT+qre8QCargA6uHes35A==
X-CSE-MsgGUID: 8B11bdmvSoehAPNTzMNxcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="159454076"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.202])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 21:29:20 -0700
Date: Wed, 9 Apr 2025 06:29:17 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Replace loop in WMTP tests (rev3)
Message-ID: <20250409042917.b37oeegwxp5uwkrn@zkempczy-mobl2>
References: <20250408185045.272673-1-zbigniew.kempczynski@intel.com>
 <174415017561.50261.7498934067905407776@e6b6f09ec485>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174415017561.50261.7498934067905407776@e6b6f09ec485>
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

On Tue, Apr 08, 2025 at 10:09:35PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Replace loop in WMTP tests (rev3)                                
>    URL:     https://patchwork.freedesktop.org/series/147263/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12942/index.html 
> 
>         CI Bug Log - changes from XEIGT_8311_FULL -> XEIGTPW_12942_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_12942_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_12942_FULL, please notify your bug team
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
>    XEIGTPW_12942_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE
>      * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
> 
>           * shard-lnl: PASS -> DMESG-WARN
>      * igt@xe_pxp@display-black-pxp-fb:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP
>      * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
> 
>           * shard-bmg: NOTRUN -> SKIP +1 other test skip
> 
>     Warnings
> 
>      * igt@testdisplay:
>           * shard-dg2-set2: ABORT (Intel XE#2705) -> ABORT

Unrelated to the series. Changes are touching xe_compute_preempt test
only.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between XEIGT_8311_FULL and
>    XEIGTPW_12942_FULL:
> 
>   New IGT tests (8)
> 
>      * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ab-hdmi-a2-dp2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.20] s
>      * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ac-hdmi-a2-dp2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.20] s
>      * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@ad-hdmi-a2-dp2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.16] s
>      * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@bc-hdmi-a2-dp2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.11] s
>      * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@bd-hdmi-a2-dp2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.15] s
>      * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible@cd-hdmi-a2-dp2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.15] s
>      * igt@xe_compute_preempt@compute-preempt-many-all-ram:
> 
>           * Statuses : 2 pass(s) 1 skip(s)
>           * Exec time: [0.0, 11.27] s
>      * igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute:
> 
>           * Statuses : 2 pass(s) 1 skip(s)
>           * Exec time: [0.0, 11.27] s
> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_12942_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2233)
>      * igt@kms_atomic_transition@plane-all-modeset-transition:
> 
>           * shard-bmg: PASS -> INCOMPLETE (Intel XE#2613)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2370)
>      * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
> 
>           * shard-bmg: NOTRUN -> INCOMPLETE (Intel XE#2613)
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2327) +4 other tests skip
>      * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1407) +1 other test skip
>      * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#316) +3 other tests skip
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +7 other tests skip
>      * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#607)
>      * igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#610)
>      * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#610)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124) +6 other tests
>             skip
>      * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2314 / Intel XE#2894)
>      * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2191)
>      * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2314 / Intel XE#2894) +1
>             other test skip
>      * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#367) +2 other tests skip
>      * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#367) +1 other test skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +11 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2907) +1 other test skip
>      * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +1 other test skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +46
>             other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3442)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +16
>             other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3432) +1 other test skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +200 other tests
>             skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1727 / Intel XE#3113
>             / Intel XE#4212 / Intel XE#4522)
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2724)
>      * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4417) +3 other tests
>             skip
>      * igt@kms_chamelium_color@ctm-0-25:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#306)
>      * igt@kms_chamelium_color@ctm-0-50:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2325) +1 other test skip
>      * igt@kms_chamelium_hpd@common-hpd-after-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +8 other tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#373) +9 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373) +5 other tests skip
>      * igt@kms_content_protection@atomic:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#1178) +3 other tests fail
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#307)
>      * igt@kms_content_protection@legacy@pipe-a-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1178)
>      * igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2321)
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2321)
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#308)
>      * igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +5 other tests skip
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2291) +3 other tests skip
>      * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#309) +2 other tests skip
>      * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2286)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#323) +1 other test skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2291) +1 other test skip
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#1340)
>      * igt@kms_dp_aux_dev:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#3009)
>      * igt@kms_dp_link_training@non-uhbr-mst:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4354)
>      * igt@kms_dp_link_training@uhbr-sst:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4354)
>      * igt@kms_dp_linktrain_fallback@dsc-fallback:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4331)
>      * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4422)
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2373)
>      * igt@kms_flip@2x-busy-flip:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#310) +2 other tests skip
>      * igt@kms_flip@2x-flip-vs-dpms:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2316) +4 other tests skip
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#301 / Intel XE#3321)
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#301) +2 other tests fail
>      * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#301) +1 other test fail
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421) +1 other test skip
>      * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2316) +3 other tests skip
>      * igt@kms_flip@bo-too-big-interruptible@a-edp1:
> 
>           * shard-lnl: NOTRUN -> TIMEOUT (Intel XE#1504) +1 other test
>             timeout
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#301) +3 other tests fail
>      * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#3321) +1 other test fail
>      * igt@kms_flip@plain-flip-fb-recreate:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#2882)
>      * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#886) +1 other test fail
>      * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#886)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2380) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293) +2 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1397 / Intel XE#1745)
>      * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1397)
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293 / Intel XE#2380) +2
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +16 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +28 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +24 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +8 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#656) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +23 other tests skip
>      * igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2350)
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +26 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#656) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2312) +6 other tests skip
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#1503)
>      * igt@kms_joiner@basic-max-non-joiner:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4298)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4298)
>      * igt@kms_joiner@invalid-modeset-big-joiner:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#346)
>      * igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2927)
>      * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#599) +3 other tests skip
>      * igt@kms_plane_multiple@2x-tiling-4:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#4596)
>      * igt@kms_plane_multiple@tiling-y:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2493)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2763) +2 other tests
>             skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2763 / Intel XE#455) +1
>             other test skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2763) +14 other tests skip
>      * igt@kms_pm_backlight@bad-brightness:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#870)
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1129)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#908)
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#1430)
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2392)
>      * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#836)
>      * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#3141 / Intel
>             XE#836)
>      * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1489) +5 other tests
>             skip
>      * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1489) +6 other tests skip
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1122) +1 other test skip
>      * igt@kms_psr@fbc-pr-cursor-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2234 / Intel XE#2850) +11
>             other tests skip
>      * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406)
>      * igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4609)
>      * igt@kms_psr@psr2-sprite-plane-move:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2850 / Intel XE#929) +11
>             other tests skip
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2939)
>      * igt@kms_rotation_crc@bad-tiling:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3414) +1 other test skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904)
>      * igt@kms_scaling_modes@scaling-mode-none:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2413)
>      * igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1435)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#771) +1 other test fail
>      * igt@kms_vrr@lobf:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2168)
>      * igt@kms_vrr@max-min:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1499) +1 other test skip
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#1499)
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#756)
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#756) +1 other test skip
>      * igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1091 / Intel XE#2849)
>      * igt@xe_eu_stall@non-blocking-read:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4497)
>      * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2905) +10 other tests
>             skip
>      * igt@xe_eudebug_online@single-step:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2905) +10 other tests skip
>      * igt@xe_eudebug_sriov@deny-eudebug:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4518)
>      * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +6 other tests skip
>      * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1392) +6 other tests skip
>      * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +2 other tests skip
>      * igt@xe_exec_basic@multigpu-once-userptr:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1392)
>      * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288) +24 other tests
>             skip
>      * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2360)
>      * igt@xe_exec_sip_eudebug@breakpoint-writesip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2905) +1 other test skip
>      * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2229)
>      * igt@xe_media_fill@media-fill:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#560)
>      * igt@xe_oa@oa-tlb-invalidate:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2248)
>      * igt@xe_oa@privileged-forked-access-vaddr:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2541 / Intel XE#3573) +5
>             other tests skip
>      * igt@xe_oa@syncs-ufence-wait:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2541 / Intel XE#3573 /
>             Intel XE#4501) +1 other test skip
>      * igt@xe_pat@pat-index-xehpc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1420 / Intel XE#2838)
>      * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1173)
>      * igt@xe_pm@d3cold-mocs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2284)
>      * igt@xe_pm@s2idle-d3cold-basic-exec:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2284)
>      * igt@xe_pm@s4-mocs:
> 
>           * shard-lnl: PASS -> ABORT (Intel XE#1794)
>      * igt@xe_pm@vram-d3cold-threshold:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#579)
>      * igt@xe_pmu@all-fn-engine-activity-load:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4650)
>      * igt@xe_query@multigpu-query-cs-cycles:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_query@multigpu-query-invalid-query:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4130) +1 other test skip
>      * igt@xe_sriov_flr@flr-vf1-clear:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3342)
> 
>     Possible fixes
> 
>      * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#2613) -> PASS
>      * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-dp-4:
> 
>           * shard-dg2-set2: INCOMPLETE -> PASS +2 other tests pass
>      * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
> 
>           * shard-lnl: ABORT -> PASS
>      * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2191) -> PASS
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1727 / Intel XE#3113) ->
>             PASS
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#3113) -> PASS
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
> 
>           * shard-dg2-set2: SKIP (Intel XE#309) -> PASS
>      * igt@kms_flip@2x-blocking-wf_vblank:
> 
>           * shard-bmg: SKIP (Intel XE#2316) -> PASS +4 other tests pass
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
> 
>           * shard-bmg: FAIL (Intel XE#3321) -> PASS
>      * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> 
>           * shard-dg2-set2: SKIP (Intel XE#310) -> PASS
>      * igt@kms_flip@flip-vs-expired-vblank:
> 
>           * shard-dg2-set2: FAIL (Intel XE#301) -> PASS
>      * igt@kms_flip@flip-vs-suspend:
> 
>           * shard-bmg: INCOMPLETE (Intel XE#2049 / Intel XE#2597) -> PASS +1
>             other test pass
>      * igt@kms_flip@modeset-vs-vblank-race:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#2049) -> PASS
>      * igt@kms_flip@plain-flip-ts-check@b-edp1:
> 
>           * shard-lnl: FAIL (Intel XE#886) -> PASS +2 other tests pass
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#656) -> PASS
>      * igt@kms_hdr@static-swap:
> 
>           * shard-bmg: SKIP (Intel XE#1503) -> PASS
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-dg2-set2: SKIP (Intel XE#836) -> PASS
>      * igt@kms_psr@psr2-sprite-plane-onoff:
> 
>           * shard-lnl: FAIL (Intel XE#3924) -> PASS +1 other test pass
>      * igt@kms_universal_plane@cursor-fb-leak:
> 
>           * shard-dg2-set2: FAIL (Intel XE#771) -> PASS +1 other test pass
>      * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1392) -> PASS +4 other tests pass
>      * igt@xe_pm@s4-d3hot-basic-exec:
> 
>           * shard-lnl: ABORT (Intel XE#1794) -> PASS
> 
>     Warnings
> 
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
> 
>           * shard-dg2-set2: SKIP (Intel XE#787) -> SKIP (Intel XE#455 / Intel
>             XE#787) +9 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455 / Intel XE#787) -> SKIP (Intel
>             XE#787) +1 other test skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1727 / Intel XE#3113 / Intel
>             XE#3124) -> INCOMPLETE (Intel XE#1727 / Intel XE#2705 / Intel
>             XE#3113 / Intel XE#4212 / Intel XE#4345 / Intel XE#4522)
>      * igt@kms_content_protection@legacy:
> 
>           * shard-bmg: FAIL (Intel XE#1178) -> SKIP (Intel XE#2341)
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2311) +7 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +11 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#4141) +3 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>           * shard-bmg: SKIP (Intel XE#4141) -> SKIP (Intel XE#2312) +5 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#656) -> SKIP (Intel XE#651) +3
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
> 
>           * shard-dg2-set2: SKIP (Intel XE#651) -> SKIP (Intel XE#656) +11
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2313) +7 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +9 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
> 
>           * shard-dg2-set2: SKIP (Intel XE#656) -> SKIP (Intel XE#653) +2
>             other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#653) -> SKIP (Intel XE#656) +13
>             other tests skip
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-bmg: SKIP (Intel XE#3374 / Intel XE#3544) -> SKIP (Intel
>             XE#3544)
>      * igt@kms_plane_multiple@2x-tiling-yf:
> 
>           * shard-bmg: SKIP (Intel XE#2493) -> SKIP (Intel XE#4596)
>      * igt@xe_peer2peer@read:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1061) -> FAIL (Intel XE#1173)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * IGT: IGT_8311 -> IGTPW_12942
>      * Linux: xe-2911-a33da369e8cde6c7208381a592866cd61f1ce188 ->
>        xe-2920-1951437999630d299a063863fb92d235dd8dc3d1
> 
>    IGTPW_12942: 12942
>    IGT_8311: 851a9c1cb1a690d8c527f26c49c250ec583af65e @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-2911-a33da369e8cde6c7208381a592866cd61f1ce188:
>    a33da369e8cde6c7208381a592866cd61f1ce188
>    xe-2920-1951437999630d299a063863fb92d235dd8dc3d1:
>    1951437999630d299a063863fb92d235dd8dc3d1
