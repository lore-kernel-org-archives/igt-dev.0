Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D53EC1EA4
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 11:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6DD10E879;
	Thu,  5 Feb 2026 11:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mVG58jje";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9466710E879
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 11:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770292366; x=1801828366;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=IR5P3NvUC+iVKKd0GUFGHjiL/1bCfgH1Pp0N0vpBnoM=;
 b=mVG58jjedmdUfO6B5/2ZNgt0zugKYpnF0FuHwePrOdvZJ61iqO9MiHn6
 tZESv0ivyqjFIUx/iDVCbUFxAONXIMmM3NnEVliEjNHoQFJQytSshqvif
 tWazUbtz1mxvAxHMlIscP43TgPzYKRnobiq+s/xlYsgrglZZcD0glVg8V
 YeWBX/SfALLjIDoy5MclbPG8TcKWxDupLyBP/2YhsHk9rA2KJ22HCF6pV
 aX8j4RJVpndTcNNVOZs18AzorBIsaJxIf0RMNOOVYBmhrW4Egj5CcAmbr
 DUqaJdgHBJP5KLgxqJCVnqSCLELWy9RELx1CsRoTuMCqTP72QxcCCL4Od Q==;
X-CSE-ConnectionGUID: ++m6l42lQoyPjsHTl/TsWg==
X-CSE-MsgGUID: SoU82j3hR42VeUYuyCNhTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82120476"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="82120476"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 03:52:46 -0800
X-CSE-ConnectionGUID: cfLlG7S6T/WLWV3HISwBqQ==
X-CSE-MsgGUID: ZIdxG3hZS6usdbmLH4/XmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="210367127"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.81])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 03:52:45 -0800
Date: Thu, 5 Feb 2026 12:52:43 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cmUgZm9yIGxpYi9pZ3Rf?=
 =?utf-8?Q?aux=3A?= Protect expressions from premature casting in aux macros
Message-ID: <kw37wgzxj4oeq3z3vzm6epzjaugw5ub33njppvqyh6txl6afvd@kzkrqyfjyqy3>
References: <20260204135500.311469-2-zbigniew.kempczynski@intel.com>
 <177024935758.225549.697431175863767626@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177024935758.225549.697431175863767626@a3b018990fe9>
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

On Wed, Feb 04, 2026 at 11:55:57PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/igt_aux: Protect expressions from premature casting in aux    
>             macros                                                            
>    URL:     https://patchwork.freedesktop.org/series/161144/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14489/index.html  
> 
>         CI Bug Log - changes from XEIGT_8735_FULL -> XEIGTPW_14489_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_14489_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_14489_FULL, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
> Participating hosts (0 -> 2)
> 
>    Additional (2): shard-bmg shard-lnl
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    XEIGTPW_14489_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_pm_dc@dc9-dpms:
> 
>           * shard-lnl: NOTRUN -> FAIL
>      * igt@xe_pmu@gt-frequency:
> 
>           * shard-bmg: NOTRUN -> WARN +1 other test warn

Unrelated to change.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_14489_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@intel_hwmon@hwmon-read:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1125) +1 other test skip
>      * igt@kms_3d@basic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6011)
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1466)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2233)
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3157)
>      * igt@kms_async_flips@test-cursor-atomic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#664) +1 other test skip
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3279)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2370) +1 other test skip
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2327) +23 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3658) +3 other tests skip
>      * igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1407) +25 other tests skip
>      * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7059) +3 other tests skip
>      * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7059) +3 other tests skip
>      * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124) +58 other tests skip
>      * igt@kms_big_fb@y-tiled-addfb:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2328) +1 other test skip
>      * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1477)
>      * igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1428) +1 other test skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#610) +1 other test skip
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +61 other tests skip
>      * igt@kms_big_fb@yf-tiled-addfb:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1467) +1 other test skip
>      * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#607) +1 other test skip
>      * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2191) +6 other tests skip
>      * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2314 / Intel XE#2894) +7
>             other tests skip
>      * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1512) +7 other tests skip
>      * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#367) +15 other tests skip
>      * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#367) +6 other tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +79 other tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2669) +19 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2669 / Intel XE#3433) +3
>             other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3432) +10 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3432) +9 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +44
>             other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +86 other tests skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2724) +2 other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4418)
>      * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4417) +3 other tests skip
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4416) +3 other tests skip
>      * igt@kms_chamelium_color@ctm-0-25:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2325) +10 other tests skip
>      * igt@kms_chamelium_color@ctm-blue-to-red:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#306) +8 other tests skip
>      * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +54 other tests skip
>      * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373) +52 other tests skip
>      * igt@kms_chamelium_sharpness_filter@filter-basic:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6507)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6507)
>      * igt@kms_color_pipeline@plane-ctm3x4@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#6968) +27 other tests fail
>      * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-dp-2:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6969) +2 other tests skip
>      * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6969) +1 other test skip
>      * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6969 / Intel XE#7006) +1
>             other test skip
>      * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-2:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6969 / Intel XE#7006) +1
>             other test skip
>      * igt@kms_content_protection@atomic-dpms-hdcp14:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6973) +3 other tests skip
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2390 / Intel XE#6974) +2
>             other tests skip
>      * igt@kms_content_protection@dp-mst-type-0-hdcp14:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6974) +3 other tests skip
>      * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6974) +2 other tests skip
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#307 / Intel XE#6974) +3 other
>             tests skip
>      * igt@kms_content_protection@legacy:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2341) +5 other tests skip
>      * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#3304) +7 other tests fail
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1468)
>      * igt@kms_content_protection@suspend-resume:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6705)
>      * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#1178 / Intel XE#3304) +7
>             other tests fail
>      * igt@kms_content_protection@uevent:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3278) +8 other tests skip
>      * igt@kms_content_protection@uevent-hdcp14:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#6707) +3 other tests fail
>      * igt@kms_cursor_crc@cursor-offscreen-128x42:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +28 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2321) +7 other tests skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2321) +9 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-64x21:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424) +29 other tests skip
>      * igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#6841) +1 other test fail
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309) +25 other tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2291) +4 other tests skip
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#4633)
>      * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#5299)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#323) +2 other tests skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2286) +2 other tests skip
>      * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1508)
>      * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4210)
>      * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1508) +1 other test skip
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4302)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1340)
>      * igt@kms_dp_link_training@uhbr-mst:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4354) +3 other tests skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4354) +2 other tests skip
>      * igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4294)
>      * igt@kms_dp_linktrain_fallback@dsc-fallback:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4331)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4331)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2244) +6 other tests skip
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2244) +6 other tests skip
>      * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4422) +2 other tests skip
>      * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4422) +2 other tests skip
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4156) +1 other test skip
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#776) +1 other test skip
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2372)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#701)
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#702)
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#703)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2373)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1138)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1138)
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1137)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2375)
>      * igt@kms_feature_discovery@psr1:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2374) +1 other test skip
>      * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421) +40 other tests skip
>      * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2316) +4 other tests skip
>      * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#301 / Intel XE#3149) +1 other
>             test fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1397) +5 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7179) +3 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1397 / Intel XE#1745) +5
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7178) +26 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7178) +26 other tests skip
>      * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7179) +3 other tests skip
>      * igt@kms_force_connector_basic@prune-stale-modes:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#352) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +78 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6312) +10 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +162 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7061) +28 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7061) +27 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651) +68 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1469) +1 other test skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2352) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +161 other tests skip
>      * igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2350)
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2312) +37 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +222 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> ABORT (Intel XE#7169)
>      * igt@kms_hdmi_inject@inject-4k:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1470)
>      * igt@kms_hdmi_inject@inject-audio:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1470 / Intel XE#2853)
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3374 / Intel XE#3544)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3374 / Intel XE#3544)
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1503) +4 other tests skip
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1503)
>      * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1450) +1 other test skip
>      * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1450 / Intel XE#2568) +1
>             other test skip
>      * igt@kms_joiner@basic-big-joiner:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6901) +1 other test skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6901) +1 other test skip
>      * igt@kms_joiner@basic-force-big-joiner:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7086) +1 other test skip
>      * igt@kms_joiner@basic-max-non-joiner:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4298)
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6900) +2 other tests skip
>      * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6911) +3 other tests skip
>      * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4090)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7173)
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2486) +1 other test skip
>      * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6912)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6912)
>      * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4329 / Intel XE#6912)
>      * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7131) +33 other tests skip
>      * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-3:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7130) +126 other tests skip
>      * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-5:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7131) +21 other tests skip
>      * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-0:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7130) +153 other tests skip
>      * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7111 / Intel XE#7130 / Intel
>             XE#7131) +13 other tests skip
>      * igt@kms_plane@pixel-format-y-tiled-modifier:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7111 / Intel XE#7130) +25
>             other tests skip
>      * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7130 / Intel XE#7131) +12
>             other tests skip
>      * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-5:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7111 / Intel XE#7131) +13
>             other tests skip
>      * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#599) +13 other tests skip
>      * igt@kms_plane_lowres@tiling-y:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2393) +1 other test skip
>      * igt@kms_plane_multiple@2x-tiling-4:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4596)
>      * igt@kms_plane_multiple@2x-tiling-none:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4596) +4 other tests skip
>      * igt@kms_plane_multiple@2x-tiling-yf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5021) +1 other test skip
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#5020) +1 other test skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5020) +1 other test skip
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3307)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6886) +53 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6886) +24 other tests skip
>      * igt@kms_pm_backlight@bad-brightness:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#870) +4 other tests skip
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2938)
>      * igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#736)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2391)
>      * igt@kms_pm_dc@dc5-dpms-negative:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1131)
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3309)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#718)
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2392) +1 other test skip
>      * igt@kms_pm_dc@deep-pkgc:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#2029)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2505)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2499)
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#3141 / Intel
>             XE#836) +3 other tests skip
>      * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#836)
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#836)
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#3141) +3
>             other tests skip
>      * igt@kms_pm_rpm@package-g7:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6813)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6814)
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#4608) +21
>             other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2893 / Intel
>             XE#4608) +10 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2893) +22
>             other tests skip
>      * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489) +48
>             other tests skip
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1128 / Intel XE#1406) +3
>             other tests skip
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2387) +3
>             other tests skip
>      * igt@kms_psr@fbc-psr2-no-drrs@edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#4609) +11
>             other tests skip
>      * igt@kms_psr@pr-sprite-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406) +36 other tests skip
>      * igt@kms_psr@psr2-no-drrs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2234 / Intel
>             XE#2850) +73 other tests skip
>      * igt@kms_psr@psr2-primary-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2234)
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2414) +1
>             other test skip
>      * igt@kms_rotation_crc@primary-rotation-90:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904) +11
>             other tests skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2330) +3 other tests skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1127) +2 other tests skip
>      * igt@kms_rotation_crc@sprite-rotation-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904) +10
>             other tests skip
>      * igt@kms_scaling_modes@scaling-mode-center:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2413) +2 other tests skip
>      * igt@kms_setmode@basic:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#6361) +1 other test fail
>      * igt@kms_setmode@basic-clone-single-crtc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1435) +1 other test skip
>      * igt@kms_setmode@invalid-clone-single-crtc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1435) +3 other tests skip
>      * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6503) +14 other tests skip
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2426) +1 other test skip
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#362) +1 other test skip
>      * igt@kms_tv_load_detect@load-detect:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#330)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2450)
>      * igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#4459) +1 other test fail
>      * igt@kms_vrr@flip-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1499) +7 other tests skip
>      * igt@kms_vrr@lobf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2168) +1 other test skip
>      * igt@kms_vrr@lobf@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#6390) +1 other test fail
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1499) +2 other tests skip
>      * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1091 / Intel XE#2849) +1
>             other test skip
>      * igt@xe_compute@ccs-mode-basic:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6599) +2 other tests skip
>      * igt@xe_compute@ccs-mode-compute-kernel:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1447) +1 other test skip
>      * igt@xe_compute@eu-busy-10s:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6592 / Intel XE#6645)
>      * igt@xe_compute_preempt@compute-preempt-many-vram-evict:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#5191) +1 other test skip
>      * igt@xe_configfs@survivability-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6010)
>      * igt@xe_create@create-big-vram:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1062)
>      * igt@xe_create@multigpu-create-massive-size:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2504)
>      * igt@xe_eudebug@basic-vm-access-faultable:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837) +44 other tests skip
>      * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4837) +47 other tests skip
>      * igt@xe_eudebug_online@pagefault-one-of-many:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6665)
>      * igt@xe_eudebug_online@pagefault-read-stress:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6665) +2 other tests skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6665 / Intel XE#6681) +1
>             other test skip
>      * igt@xe_eudebug_online@set-breakpoint:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837 / Intel XE#6665) +29
>             other tests skip
>      * igt@xe_eudebug_online@set-breakpoint-faultable:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4837 / Intel XE#6665) +30
>             other tests skip
>      * igt@xe_eudebug_sriov@deny-sriov:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4518) +1 other test skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5793) +1 other test skip
>      * igt@xe_evict@evict-beng-large-external-cm:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#688) +65 other tests skip
>      * igt@xe_evict@evict-mixed-many-threads-small:
> 
>           * shard-bmg: NOTRUN -> INCOMPLETE (Intel XE#6321)
>      * igt@xe_evict@evict-threads-small-multi-queue:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7140) +8 other tests skip
>      * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +50 other tests skip
>      * igt@xe_exec_basic@multigpu-no-exec-userptr:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +48 other tests skip
>      * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7136) +78 other tests skip
>      * igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7136) +70 other tests skip
>      * igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6874) +163 other tests skip
>      * igt@xe_exec_multi_queue@two-queues-priority:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6874) +172 other tests skip
>      * igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#5007) +5 other tests skip
>      * igt@xe_exec_system_allocator@many-64k-mmap-new-huge:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5007) +4 other tests skip
>      * igt@xe_exec_system_allocator@many-stride-new-prefetch:
> 
>           * shard-bmg: NOTRUN -> INCOMPLETE (Intel XE#7098)
>      * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6196) +3 other tests skip
>      * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4943) +142 other tests skip
>      * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4943) +132 other tests skip
>      * igt@xe_exec_threads@threads-many-queues:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#7166)
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#7166)
>      * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7138) +52 other tests skip
>      * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7138) +55 other tests skip
>      * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6281)
>      * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> 
>           * shard-lnl: NOTRUN -> ABORT (Intel XE#5466)
>           * shard-bmg: NOTRUN -> ABORT (Intel XE#5466)
>      * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
> 
>           * shard-lnl: NOTRUN -> ABORT (Intel XE#4757)
>      * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2229)
>      * igt@xe_live_ktest@xe_eudebug:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2833)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2833)
>      * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2229)
>      * igt@xe_media_fill@media-fill:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#560)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2459 / Intel XE#2596)
>      * igt@xe_mmap@pci-membarrier:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#5100) +3 other tests skip
>      * igt@xe_mmap@small-bar:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#512)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#586)
>      * igt@xe_mmap@vram:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1416)
>      * igt@xe_module_load@force-load:
> 
>           * shard-lnl: NOTRUN -> DMESG-WARN (Intel XE#7145)
>           * shard-bmg: NOTRUN -> DMESG-WARN (Intel XE#7145)
>      * igt@xe_module_load@load:
> 
>           * shard-lnl: NOTRUN -> (PASS, SKIP, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS) (Intel XE#378)
>           * shard-bmg: NOTRUN -> (PASS, PASS, PASS, PASS, SKIP, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS) (Intel XE#2457)
>      * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6964) +18 other tests skip
>      * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6964) +19 other tests skip
>      * igt@xe_noexec_ping_pong@basic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6259)
>      * igt@xe_oa@oa-tlb-invalidate:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2248)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2248)
>      * igt@xe_pat@pat-index-xehpc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1420 / Intel XE#2838)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1420)
>      * igt@xe_pat@pat-index-xelp:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#977)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2245)
>      * igt@xe_pat@pat-index-xelpg:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2236)
>      * igt@xe_peer2peer@read:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1061) +1 other test skip
>      * igt@xe_peer2peer@write:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2427 / Intel XE#6953) +1
>             other test skip
>      * igt@xe_pm@d3cold-basic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366) +7 other
>             tests skip
>      * igt@xe_pm@d3cold-i2c:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#5694)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5694)
>      * igt@xe_pm@d3cold-multiple-execs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2284) +7 other tests skip
>      * igt@xe_pm@d3hot-i2c:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#5742)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5742)
>      * igt@xe_pm@d3hot-mmap-vram:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1948)
>      * igt@xe_pm@s3-mocs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#584) +10 other tests skip
>      * igt@xe_pm@s3-multiple-execs:
> 
>           * shard-bmg: NOTRUN -> DMESG-WARN (Intel XE#3428)
>      * igt@xe_pm@vram-d3cold-threshold:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#579)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#579)
>      * igt@xe_pmu@fn-engine-activity-sched-if-idle:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4650) +2 other tests skip
>      * igt@xe_pxp@pxp-termination-key-update-post-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4733) +15 other tests skip
>      * igt@xe_query@multigpu-query-mem-usage:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#944) +15 other tests skip
>      * igt@xe_query@multigpu-query-pxp-status:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#944) +15 other tests skip
>      * igt@xe_sriov_auto_provisioning@fair-allocation:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4130) +5 other tests skip
>      * igt@xe_sriov_flr@flr-twice:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4273)
>      * igt@xe_sriov_flr@flr-vf1-clear:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3342) +1 other test skip
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#6569)
>      * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4351) +1 other test skip
>      * igt@xe_sriov_vram@vf-access-beyond:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6376) +3 other tests skip
>      * igt@xe_survivability@i2c-functionality:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6529) +1 other test skip
>      * igt@xe_vm@out-of-memory:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#5745)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * IGT: IGT_8735 -> IGTPW_14489
>      * Linux: xe-4495-241994730989320c926da9f2d0a5ec80b48f993d ->
>        xe-4496-ff449f153b0966cfd7a7291670c927f6b6971d2a
> 
>    IGTPW_14489: 14489
>    IGT_8735: 8735
>    xe-4495-241994730989320c926da9f2d0a5ec80b48f993d:
>    241994730989320c926da9f2d0a5ec80b48f993d
>    xe-4496-ff449f153b0966cfd7a7291670c927f6b6971d2a:
>    ff449f153b0966cfd7a7291670c927f6b6971d2a
