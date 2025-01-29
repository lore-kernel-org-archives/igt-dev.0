Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7207AC0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 06:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E29E10E03A;
	Wed, 29 Jan 2025 06:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="awESlDcj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1D410E03A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 06:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738131264; x=1769667264;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=mhWcBoPeLY5631oHZPKkImXgXpv2GktEky1lYhwUA6I=;
 b=awESlDcjlQw69FckXmricloCnsLmWk8iBKimW84rzXxGholuFMePLm6i
 H4xNhtYs+coOv/E4i6b1EEJDmcPvXFkdiV4Jk+sDdgWLVEAfIf+n6Flmc
 eCBPBYhGK106psescvAsbd7i2zQ4GIQFFJbS6WlgvaID35cUaaSytHq6Q
 OBAgeXP4MEqxPvY2EBsxITbtsS1vJlb4or/xXuA8GOm6ARPTtV4gp+9F8
 dssbAyU8af1FgCudxc21LefCKwgE+AwASXF2sdhos8O9/Md1ghGJPYs1Z
 JEG2lVlB5YK06KmmXuOjucQu/Hto7IbLbe6DFVPtv0gYBbC70hQXuj8MV g==;
X-CSE-ConnectionGUID: P2NXzZdET1eHBI+tlM1PFA==
X-CSE-MsgGUID: uiJxXnN3SRaB0p+enIw2ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="63988451"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="63988451"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 22:14:24 -0800
X-CSE-ConnectionGUID: nQ6ReD0FTWibqbLb7G3bsQ==
X-CSE-MsgGUID: Sa/J+YwJSOOWihksM9Jvlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="113940295"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 22:14:23 -0800
Date: Wed, 29 Jan 2025 07:14:19 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGxpYi9pZ3Rf?=
 =?utf-8?Q?device=5Fscan=3A?= limit fetched device attributes from udev
Message-ID: <20250129061419.gggomakpllgmcnuk@zkempczy-mobl2>
References: <20250128083014.27713-1-zbigniew.kempczynski@intel.com>
 <173809838936.2094947.5284546107824066882@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173809838936.2094947.5284546107824066882@b555e5b46a47>
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

On Tue, Jan 28, 2025 at 09:06:29PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/igt_device_scan: limit fetched device attributes from udev   
>    URL:     https://patchwork.freedesktop.org/series/144019/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12504/index.html 
> 
>         CI Bug Log - changes from XEIGT_8212_full -> XEIGTPW_12504_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_12504_full absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_12504_full, please notify your bug team
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
>    XEIGTPW_12504_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_atomic_transition@modeset-transition-fencing:
> 
>           * shard-lnl: PASS -> INCOMPLETE +1 other test incomplete
>      * igt@kms_flip@2x-plain-flip@ab-hdmi-a6-dp4:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN +4 other tests dmesg-warn
>      * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
> 
>           * shard-bmg: PASS -> DMESG-WARN
>      * igt@kms_vblank@query-idle@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE +1 other test incomplete
>      * igt@xe_module_load@many-reload:
> 
>           * shard-dg2-set2: NOTRUN -> DMESG-WARN

Above issues are not related to the patch.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_12504_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1466)
>      * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#1033) +60 other
>             tests dmesg-warn
>      * igt@kms_async_flips@invalid-async-flip:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#873)
>      * igt@kms_big_fb@linear-32bpp-rotate-270:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1407) +1 other test skip
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#316) +4 other tests skip
>      * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2327) +1 other test skip
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124) +11 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#607)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124) +4 other tests skip
>      * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2191) +2 other tests
>             skip
>      * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#367) +1 other test skip
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +174 other tests
>             skip
>      * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +40
>             other tests skip
>      * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887)
>      * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2669) +3 other tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2907)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3442)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3433) +3 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3432)
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#3847)
>      * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +7 other tests skip
>      * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#314) +3 other tests skip
>      * igt@kms_chamelium_color@ctm-max:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#306)
>      * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +1 other test skip
>      * igt@kms_chamelium_hpd@hdmi-hpd:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#373) +9 other tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373) +3 other tests skip
>      * igt@kms_content_protection@legacy@pipe-a-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1178)
>      * igt@kms_content_protection@type1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3278)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1188) +1 other test fail
>      * igt@kms_cursor_crc@cursor-offscreen-64x21:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424) +2 other tests skip
>      * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#323)
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>           * shard-bmg: PASS -> DMESG-WARN (Intel XE#877)
>      * igt@kms_cursor_legacy@forked-move:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#3226) +1 other test
>             incomplete
>      * igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic:
> 
>           * shard-dg2-set2: NOTRUN -> DMESG-WARN (Intel XE#1033) +19 other
>             tests dmesg-warn
>      * igt@kms_cursor_legacy@single-move:
> 
>           * shard-bmg: PASS -> INCOMPLETE (Intel XE#3226 / Intel XE#4172)
>      * igt@kms_cursor_legacy@single-move@pipe-c:
> 
>           * shard-bmg: PASS -> INCOMPLETE (Intel XE#3226)
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-dg2-set2: PASS -> DMESG-FAIL (Intel XE#1033)
>      * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421) +3 other tests skip
>      * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#3321) +2 other tests fail
>      * igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#2882) +6 other tests fail
>      * igt@kms_flip@2x-nonexisting-fb:
> 
>           * shard-bmg: PASS -> DMESG-WARN (Intel XE#4172) +59 other tests
>             dmesg-warn
>      * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
> 
>           * shard-bmg: PASS -> DMESG-FAIL (Intel XE#4172)
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#301) +8 other tests fail
>      * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#301 / Intel XE#3321)
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * shard-bmg: PASS -> DMESG-WARN (Intel XE#2955)
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#2049 / Intel
>             XE#2597) +1 other test incomplete
>      * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#886) +2 other tests fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1397 / Intel XE#1745)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1397)
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2352)
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +26 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1469)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +36 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +28 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +5 other tests skip
>      * igt@kms_joiner@basic-force-ultra-joiner:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2934)
>      * igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2927)
>      * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4090)
>      * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:
> 
>           * shard-dg2-set2: NOTRUN -> ABORT (Intel XE#2625 / Intel XE#4080)
>      * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#616) +3 other tests fail
>      * igt@kms_plane_lowres@tiling-yf:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#599)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2763) +3 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2763 / Intel XE#455) +1
>             other test skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2763) +2 other tests
>             skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2763) +4 other tests skip
>      * igt@kms_pm_backlight@fade:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#870) +1 other test skip
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#718)
>      * igt@kms_pm_dc@deep-pkgc:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#908)
>      * igt@kms_pm_rpm@dpms-non-lpsp:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#3141)
>      * igt@kms_pm_rpm@universal-planes-dpms:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#1033 / Intel
>             XE#2042)
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1489) +5 other tests
>             skip
>      * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2893)
>      * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1489)
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1122) +1 other test skip
>      * igt@kms_psr@fbc-pr-cursor-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2234 / Intel XE#2850) +2
>             other tests skip
>      * igt@kms_psr@fbc-psr2-sprite-plane-move:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2850 / Intel XE#929) +13
>             other tests skip
>      * igt@kms_psr@pr-sprite-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1127) +1 other test skip
>      * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3414)
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1729)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#899) +3 other tests fail
>      * igt@kms_vblank@wait-forked-busy@pipe-d-hdmi-a-3:
> 
>           * shard-bmg: NOTRUN -> DMESG-WARN (Intel XE#4172) +2 other tests
>             dmesg-warn
>      * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#1522) +3 other tests fail
>      * igt@kms_vrr@flipline:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +10 other tests
>             skip
>      * igt@kms_vrr@lobf:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1499)
>      * igt@xe_compute@ccs-mode-compute-kernel:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1447)
>      * igt@xe_copy_basic@mem-copy-linear-0xfd:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1123)
>      * igt@xe_copy_basic@mem-set-linear-0xfffe:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1126)
>      * igt@xe_create@create-big-vram:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1062)
>      * igt@xe_eudebug@basic-read-event:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2905) +2 other tests skip
>      * igt@xe_eudebug_online@interrupt-other-debuggable:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2905) +7 other tests skip
>      * igt@xe_eudebug_online@resume-dss:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2905) +10 other tests
>             skip
>      * igt@xe_evict@evict-large-cm:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#688)
>      * igt@xe_evict@evict-large-external-cm:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#1033 / Intel
>             XE#1473) +1 other test dmesg-warn
>      * igt@xe_evict@evict-large-multi-vm:
> 
>           * shard-bmg: NOTRUN -> INCOMPLETE (Intel XE#1473)
>      * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +1 other test skip
>      * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1392) +2 other tests skip
>      * igt@xe_exec_basic@multigpu-once-bindexecqueue:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1392)
>      * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +2 other tests skip
>      * igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288) +17 other tests
>             skip
>      * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2360)
>      * igt@xe_exec_reset@cm-gt-reset:
> 
>           * shard-bmg: PASS -> INCOMPLETE (Intel XE#3592)
>      * igt@xe_gt_freq@freq_suspend:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#584)
>      * igt@xe_live_ktest@xe_bo:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1192) +1 other test skip
>      * igt@xe_live_ktest@xe_mocs:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#1192) +1 other test skip
>      * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1999) +2 other tests
>             fail
>      * igt@xe_mmap@small-bar:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#512)
>      * igt@xe_oa@oa-tlb-invalidate:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2248)
>      * igt@xe_oa@polling-small-buf:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2541 / Intel XE#3573) +6
>             other tests skip
>      * igt@xe_oa@unprivileged-single-ctx-counters:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2248)
>      * igt@xe_pat@pat-index-xe2:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#977)
>      * igt@xe_pat@pat-index-xehpc:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2838 / Intel XE#979)
>      * igt@xe_pm@d3cold-mmap-vram:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366)
>      * igt@xe_pm@s3-basic-exec:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#1033 / Intel XE#569)
>      * igt@xe_pm@s3-d3cold-basic-exec:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366)
>      * igt@xe_pm@s3-multiple-execs:
> 
>           * shard-dg2-set2: PASS -> ABORT (Intel XE#1358 / Intel XE#1794)
>      * igt@xe_pm@s3-vm-bind-prefetch:
> 
>           * shard-bmg: PASS -> DMESG-WARN (Intel XE#4172 / Intel XE#569) +1
>             other test dmesg-warn
>           * shard-dg2-set2: PASS -> ABORT (Intel XE#1033 / Intel XE#1358 /
>             Intel XE#1794)
>      * igt@xe_pm@s4-vm-bind-userptr:
> 
>           * shard-lnl: NOTRUN -> ABORT (Intel XE#1358 / Intel XE#1794)
>      * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#944) +1 other test skip
>      * igt@xe_query@multigpu-query-oa-units:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#944) +2 other tests skip
>      * igt@xe_sriov_flr@flr-vf1-clear:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3342)
> 
>     Possible fixes
> 
>      * igt@core_hotunplug@hotrebind-lateclose:
> 
>           * shard-dg2-set2: ABORT -> PASS
>      * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1033) -> PASS +94 other
>             tests pass
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#4172) -> PASS +76 other tests
>             pass
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1727 / Intel XE#3124 / Intel
>             XE#4010) -> PASS
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#3124 / Intel XE#4010) ->
>             PASS
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1727) -> PASS
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#4172 / Intel XE#877) -> PASS
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
> 
>           * shard-bmg: FAIL (Intel XE#3321) -> PASS
>      * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
> 
>           * shard-dg2-set2: FAIL (Intel XE#301) -> PASS +3 other tests pass
>      * igt@kms_flip@2x-flip-vs-suspend:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#2955) -> PASS
>      * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
> 
>           * shard-bmg: FAIL (Intel XE#2882) -> PASS +1 other test pass
>      * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
> 
>           * shard-lnl: FAIL (Intel XE#886) -> PASS +3 other tests pass
>      * igt@kms_flip_tiling@flip-change-tiling:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#2049) -> PASS
>      * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
> 
>           * shard-dg2-set2: FAIL (Intel XE#616) -> PASS +1 other test pass
>      * igt@kms_plane_lowres@tiling-4:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#4091) -> PASS
>      * igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>           * shard-lnl: FAIL (Intel XE#2159) -> PASS +1 other test pass
>      * igt@xe_exec_basic@multigpu-no-exec-rebind:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1392) -> PASS +1 other test pass
>      * igt@xe_pm@s2idle-basic:
> 
>           * shard-dg2-set2: ABORT (Intel XE#1358 / Intel XE#1794) -> PASS
>      * igt@xe_pm@s2idle-vm-bind-unbind-all:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#1616 / Intel XE#4172) -> PASS
> 
>     Warnings
> 
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#4172) -> FAIL (Intel XE#3847)
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
> 
>           * shard-dg2-set2: FAIL (Intel XE#301) -> DMESG-FAIL (Intel XE#1033)
>             +2 other tests dmesg-fail
>      * igt@kms_pipe_crc_basic@suspend-read-crc:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1033) -> ABORT (Intel
>             XE#2625 / Intel XE#4080)
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-bmg: SKIP (Intel XE#2426) -> SKIP (Intel XE#2509)
>      * igt@testdisplay:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#2705) -> DMESG-WARN (Intel
>             XE#1033 / Intel XE#2705)
>      * igt@xe_live_ktest@xe_bo:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#4172) -> SKIP (Intel XE#1192)
>      * igt@xe_pm@s3-mocs:
> 
>           * shard-dg2-set2: ABORT (Intel XE#1033 / Intel XE#1358 / Intel
>             XE#1794) -> DMESG-WARN (Intel XE#1033 / Intel XE#569)
>      * igt@xe_pm@s4-basic:
> 
>           * shard-dg2-set2: ABORT (Intel XE#1358) -> DMESG-WARN (Intel
>             XE#1033)
> 
> Build changes
> 
>      * IGT: IGT_8212 -> IGTPW_12504
> 
>    IGTPW_12504: 4b3d6ec8a8ad460cbb5aeae1963e88be8ebbba69 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8212: 76102a17560c6e6fc6528db29286b0266ccc48ef @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-2562-73c0fe019ff4bf312f6ae1114f0ca63bd13ea4b7:
>    73c0fe019ff4bf312f6ae1114f0ca63bd13ea4b7
