Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C1EC5B552
	for <igt-dev@archiver.kernel.org>; Mon,  9 Jun 2025 06:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F7B10EB35;
	Mon,  9 Jun 2025 06:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MGyUuvjN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998A910E5F1
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jun 2025 06:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749450495; x=1780986495;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=oD+vHBJ+xSLUT5imjKR3TykyDcfibTpj308k/1Oszdc=;
 b=MGyUuvjN7r9ekeDyRfWh2KMeVa17ztmfpm27HQlGAY4NLqrUy/L+nbU1
 Fnjri0QiITu1mMc/qknMsRzTebvhASThK2urvFiMypw8xpvmSGB+3yjFd
 DZoUhdTEk73UCedopOpY3d7DJfIOjC8micY5snhSowNzN4Qa3OebQTTtd
 u7BC9TOrYNTKNQ1hFMyVhG9Ag85HLj1KhO+RC+pgn0jZhL3L0OfNXrGle
 +cwlwH+/LTvtt7MopuOa9yJzfJdbeBE/qe9+2kosSWwbk/L/dafrhRmZC
 OwpiVOui0RFh9ffTowTGO/vlwlVGvAgJUiCoSeB9L8/VT8KXDvXdU8Y2Q A==;
X-CSE-ConnectionGUID: YqVmezj2RQyLgsp4AfHBSA==
X-CSE-MsgGUID: v3taJmk9QLKRPwPJthGsIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="39144408"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="39144408"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2025 23:28:14 -0700
X-CSE-ConnectionGUID: EmEMnYAqS7aNjKwF8D31PQ==
X-CSE-MsgGUID: NkKa8mTRRraTl3w8Q1NNjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="151412587"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.244])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2025 23:28:12 -0700
Date: Mon, 9 Jun 2025 08:28:09 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_lib=2Fintel?=
 =?utf-8?B?X2NvbXB1dGU6?= change shader and logic for threadgroup preemption
Message-ID: <amfi5rej45hl4psbkktudl2uhcwdi57yallx4jbwyr6uw6hkd3@5wfbjx2hqrtz>
References: <20250606103937.576276-2-zbigniew.kempczynski@intel.com>
 <174942564027.58527.18030616442021535922@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174942564027.58527.18030616442021535922@1538d3639d33>
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

On Sun, Jun 08, 2025 at 11:34:00PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/intel_compute: change shader and logic for threadgroup        
>             preemption                                                        
>    URL:     https://patchwork.freedesktop.org/series/149934/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13254/index.html  
> 
>         CI Bug Log - changes from XEIGT_8401_FULL -> XEIGTPW_13254_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_13254_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_13254_FULL, please notify your bug team
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
>    XEIGTPW_13254_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_pipe_stress@stress-xrgb8888-untiled:
>           * shard-dg2-set2: PASS -> INCOMPLETE

Unrelated to the patch, it touches xe_compute_preempt only.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_13254_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1125)
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1466)
>      * igt@kms_async_flips@alternate-sync-async-flip:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#827) +1 other test fail
>      * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#911) +3 other tests fail
>      * igt@kms_async_flips@invalid-async-flip:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#873)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2370)
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#316) +4 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3658)
>      * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +5 other tests skip
>      * igt@kms_big_fb@y-tiled-addfb:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#619)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124) +9 other tests
>             skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124) +6 other tests skip
>      * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2191)
>      * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2314 / Intel XE#2894)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1512)
>      * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2191) +2 other tests
>             skip
>      * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#367)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#367)
>      * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#367) +2 other tests skip
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +104 other tests
>             skip
>      * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-dp-2:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +24
>             other tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +8 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2907) +1 other test skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2669) +3 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-bmg: PASS -> INCOMPLETE (Intel XE#3862) +1 other test
>             incomplete
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3442)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +8 other
>             tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3432)
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3432) +1 other test skip
>      * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +4 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#2705 / Intel
>             XE#4212 / Intel XE#4345)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#1727 / Intel
>             XE#3113) +1 other test incomplete
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#2705 / Intel
>             XE#4212)
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4418)
>      * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4417) +3 other tests skip
>      * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4416) +3 other tests
>             skip
>      * igt@kms_chamelium_color@ctm-0-50:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2325) +1 other test skip
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#306) +1 other test skip
>      * igt@kms_chamelium_color@ctm-green-to-red:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#306)
>      * igt@kms_chamelium_edid@dp-edid-resolution-list:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +2 other tests skip
>      * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#373) +6 other tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373) +8 other tests skip
>      * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1178) +4 other tests
>             fail
>      * igt@kms_content_protection@content-type-change:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2341)
>      * igt@kms_content_protection@srm@pipe-a-dp-2:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#1178)
>      * igt@kms_cursor_crc@cursor-offscreen-128x42:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +3 other tests skip
>      * igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#308) +1 other test skip
>      * igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424) +6 other tests skip
>      * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309) +3 other tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2291) +2 other tests skip
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#1475)
>      * igt@kms_dp_link_training@non-uhbr-sst:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#4354)
>      * igt@kms_dp_link_training@uhbr-mst:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4356)
>      * igt@kms_dp_link_training@uhbr-sst:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4354)
>      * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4422)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#776)
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#703)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2373)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1138)
>      * igt@kms_flip@2x-dpms-vs-vblank-race:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421) +4 other tests skip
>      * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#3321) +3 other tests fail
>      * igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a2-dp2:
> 
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#2049 / Intel
>             XE#2597) +3 other tests incomplete
>      * igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2316) +5 other tests skip
>      * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#301 / Intel XE#3321) +1
>             other test fail
>      * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#301) +1 other test fail
>      * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#301 / Intel XE#3149) +1 other
>             test fail
>      * igt@kms_flip@plain-flip-fb-recreate:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#2882)
>      * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#886) +1 other test fail
>      * igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a6:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#886) +2 other tests fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293 / Intel XE#2380)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401) +3 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401 / Intel XE#1745) +3
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1397) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#3106 / Intel XE#4683) +1
>             other test fail
>      * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1397 / Intel XE#1745) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +13 other tests
>             skip
>      * igt@kms_force_connector_basic@prune-stale-modes:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#352)
>      * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-suspend:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +24 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1469)
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +25 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-slowdraw:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +24 other tests
>             skip
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1503)
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#1503) +1 other test skip
>      * igt@kms_joiner@basic-big-joiner:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#346)
>      * igt@kms_joiner@basic-force-big-joiner:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#3012)
>      * igt@kms_joiner@invalid-modeset-big-joiner:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#346)
>      * igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2927)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2927)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#356)
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2685 / Intel XE#3307)
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#455)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2763) +3 other tests skip
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3309)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#718) +1 other test fail
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#718)
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#3141 / Intel
>             XE#836)
>      * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1489) +5 other tests
>             skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2893) +1 other test skip
>      * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2893 / Intel XE#4608) +2
>             other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4608) +6 other tests skip
>      * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1489) +3 other tests skip
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2387) +1 other test skip
>      * igt@kms_psr@fbc-psr2-dpms:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2850 / Intel XE#929) +9
>             other tests skip
>      * igt@kms_psr@fbc-psr2-sprite-plane-move:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406) +4 other tests skip
>      * igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4609)
>      * igt@kms_psr@pr-sprite-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2234 / Intel XE#2850) +4
>             other tests skip
>      * igt@kms_rotation_crc@bad-pixel-format:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904) +1
>             other test skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3414) +1 other test skip
>      * igt@kms_setmode@invalid-clone-single-crtc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1435)
>      * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1280 / Intel XE#455) +1
>             other test skip
>      * igt@xe_copy_basic@mem-set-linear-0x3fff:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1126)
>      * igt@xe_create@create-big-vram:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1062)
>      * igt@xe_eudebug@discovery-empty-clients:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837) +11 other tests skip
>      * igt@xe_eudebug@vma-ufence-faultable:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4837) +10 other tests
>             skip
>      * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4837) +5 other tests skip
>      * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#688) +2 other tests skip
>      * igt@xe_exec_basic@multigpu-no-exec-null:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1392)
>      * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1392) +1 other test skip
>      * igt@xe_exec_basic@multigpu-once-null-rebind:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +4 other tests skip
>      * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +7 other tests skip
>      * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288) +26 other tests
>             skip
>      * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2360)
>      * igt@xe_exec_system_allocator@process-many-stride-mmap-huge:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4943) +18 other tests skip
>      * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4915) +222 other tests
>             skip
>      * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4943) +7 other tests skip
>      * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> 
>           * shard-lnl: NOTRUN -> ABORT (Intel XE#4917)
>      * igt@xe_huc_copy@huc_copy:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#255)
>      * igt@xe_live_ktest@xe_eudebug:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2833)
>      * igt@xe_media_fill@media-fill:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#560)
>      * igt@xe_noexec_ping_pong:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#379)
>      * igt@xe_oa@mi-rpc:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2541 / Intel XE#3573) +3
>             other tests skip
>      * igt@xe_oa@oa-tlb-invalidate:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2248)
>      * igt@xe_pat@display-vs-wb-transient:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1337)
>      * igt@xe_pm@d3hot-mmap-vram:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1948)
>      * igt@xe_pm@s2idle-d3cold-basic-exec:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366)
>      * igt@xe_pm@s3-d3cold-basic-exec:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2284)
>      * igt@xe_pm@s3-mocs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#584) +1 other test skip
>      * igt@xe_pm@s4-mocs:
> 
>           * shard-lnl: PASS -> ABORT (Intel XE#1794)
>      * igt@xe_pxp@display-black-pxp-fb:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4733) +1 other test skip
>      * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4733)
>      * igt@xe_query@multigpu-query-invalid-cs-cycles:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_query@multigpu-query-oa-units:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#944) +3 other tests skip
>      * igt@xe_query@multigpu-query-pxp-status:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#944) +1 other test skip
>      * igt@xe_render_copy@render-stress-4-copies:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4814)
>      * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4130)
>      * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4130)
>      * igt@xe_sriov_scheduling@equal-throughput:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4351)
> 
>     Possible fixes
> 
>      * igt@core_getversion@all-cards:
> 
>           * shard-dg2-set2: FAIL (Intel XE#4208) -> PASS
>      * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
> 
>           * shard-lnl: FAIL (Intel XE#911) -> PASS +3 other tests pass
>      * igt@kms_cursor_edge_walk@128x128-right-edge:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> PASS +9 other
>             tests pass
>      * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
> 
>           * shard-bmg: SKIP (Intel XE#2291) -> PASS
>      * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
> 
>           * shard-bmg: SKIP (Intel XE#2316) -> PASS +4 other tests pass
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
> 
>           * shard-bmg: FAIL (Intel XE#3321) -> PASS +3 other tests pass
>      * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
> 
>           * shard-lnl: FAIL (Intel XE#886) -> PASS +1 other test pass
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> PASS +20 other tests pass
>      * igt@kms_hdr@static-swap:
> 
>           * shard-bmg: SKIP (Intel XE#1503) -> PASS +1 other test pass
>      * igt@kms_pm_dc@dc5-dpms:
> 
>           * shard-lnl: FAIL (Intel XE#718) -> PASS
>      * igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>           * shard-bmg: SKIP (Intel XE#1435) -> PASS
>      * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1392) -> PASS +2 other tests pass
>      * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
> 
>           * shard-lnl: FAIL (Intel XE#5018) -> PASS
>      * igt@xe_pm@s4-vm-bind-prefetch:
> 
>           * shard-lnl: ABORT (Intel XE#1794) -> PASS +1 other test pass
> 
>     Warnings
> 
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#1124) +2
>             other tests skip
>      * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#4208) -> SKIP
>             (Intel XE#455 / Intel XE#787)
>      * igt@kms_chamelium_hpd@hdmi-hpd:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel
>             XE#373) +1 other test skip
>      * igt@kms_content_protection@srm:
> 
>           * shard-bmg: SKIP (Intel XE#2341) -> FAIL (Intel XE#1178)
>      * igt@kms_cursor_crc@cursor-onscreen-32x32:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel
>             XE#455)
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> SKIP (Intel
>             XE#703)
>      * igt@kms_flip@flip-vs-expired-vblank:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208 / i915#2575) -> FAIL (Intel
>             XE#301)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#455)
>      * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
> 
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +13 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2311) +6 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#651)
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#4141) -> SKIP (Intel XE#2312) +9 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#4141) +1 other
>             test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#653) +2
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2313) +9 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +15 other
>             tests skip
>      * igt@kms_plane_multiple@2x-tiling-y:
> 
>           * shard-bmg: SKIP (Intel XE#5021) -> SKIP (Intel XE#4596)
>      * igt@kms_psr@pr-sprite-render:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#4208) -> SKIP
>             (Intel XE#2850 / Intel XE#929)
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-bmg: SKIP (Intel XE#2426) -> FAIL (Intel XE#1729)
>      * igt@xe_eudebug@basic-vm-access-parameters-userptr:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#4837) +1
>             other test skip
>      * igt@xe_exec_fault_mode@many-rebind-imm:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#288) +3
>             other tests skip
>      * igt@xe_exec_system_allocator@threads-many-large-malloc-fork-read-after:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#4915) +27
>             other tests skip
>      * igt@xe_oa@buffer-size:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#4501)
>      * igt@xe_oa@missing-sample-flags:
> 
>           * shard-dg2-set2: SKIP (Intel XE#4208) -> SKIP (Intel XE#2541 /
>             Intel XE#3573)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * IGT: IGT_8401 -> IGTPW_13254
>      * Linux: xe-3210-8c96c8b7753fa6146836b12a379a53cac71894c5 ->
>        xe-3211-2f92a5cfa1b06e29699d63b805ce3e4aab6c4f77
> 
>    IGTPW_13254: 13254
>    IGT_8401: 8401
>    xe-3210-8c96c8b7753fa6146836b12a379a53cac71894c5:
>    8c96c8b7753fa6146836b12a379a53cac71894c5
>    xe-3211-2f92a5cfa1b06e29699d63b805ce3e4aab6c4f77:
>    2f92a5cfa1b06e29699d63b805ce3e4aab6c4f77
