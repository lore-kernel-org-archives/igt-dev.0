Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F1ED41D68
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 08:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A5210E585;
	Tue, 12 Nov 2024 08:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f6p2+Hkm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DC710E588
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 08:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731400261; x=1762936261;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=2r8LKZBWhsdcJnCc3nXANp4CXsBeXBr324CblKaNWjI=;
 b=f6p2+HkmQu06tekI7Hm73uWU4Alhjfd3THdQkSO6NKvSK1SIzPyChUwz
 Gravp849X/d2YWOkD539p+ebLFGG9o1xTL9Tq4WwEFesCu5MiDSlh1UNd
 iXu7dT7Y/Dp4Fzf1oe1vtsxPKRz9ib0E0GLYoFZnhlivsnpif0Ji828Gj
 mHFr6nkoU+DNQoEKNe+aMQFbzKphkjdwkWzxmpdAW2EAQcGasSUkYNU3G
 TrhC/A7gMRixPULcdZHTvKl3P7qUyBitEsXl5T7O7hRvbwVoa7ED0jdVB
 f+fkytYnM8eheYPvtSa+TvRYZLOW9RLzL6W2xBkQebhyJBMxdKJ+zgaer A==;
X-CSE-ConnectionGUID: r42QvemfTeebOyc8QfZLiw==
X-CSE-MsgGUID: tD1vriyVSS6OXZSpirsVRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41783743"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41783743"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 00:31:01 -0800
X-CSE-ConnectionGUID: 71uWVYQYS5WwJ1JbVgyj5Q==
X-CSE-MsgGUID: 6SAy0q2SSKWjd+dYGUpyFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="118149960"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.106])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 00:30:59 -0800
Date: Tue, 12 Nov 2024 09:30:55 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for
 Extend intel_blt to support large ctrl-surf-copy blits
Message-ID: <20241112083055.6tswxsnx5rqjfven@zkempczy-mobl2>
References: <20241108064712.252927-1-zbigniew.kempczynski@intel.com>
 <173115299347.1639888.7038332651695267406@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173115299347.1639888.7038332651695267406@2413ebb6fbb6>
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

On Sat, Nov 09, 2024 at 11:49:53AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Extend intel_blt to support large ctrl-surf-copy blits           
>    URL:     https://patchwork.freedesktop.org/series/141084/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12068/index.html 
> 
>         CI Bug Log - changes from XEIGT_8100_full -> XEIGTPW_12068_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_12068_full absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_12068_full, please notify your bug team
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
>    XEIGTPW_12068_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
> 
>           * shard-bmg: PASS -> SKIP +2 other tests skip

Skip is related to missing crt-0 control file so this is not related
to the patch series.

>      * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> TIMEOUT
>      * igt@kms_cursor_legacy@torture-move@all-pipes:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN

There are currently 3 tests which are using ctrl-surf-copy blits
changed in the series and they are: gem_ccs, xe_ccs and kms_ccs.
So any issue which occurs here is not related to the patch series.

--
Zbigniew


>      * igt@kms_flip@dpms-off-confusion-interruptible@b-dp2:
> 
>           * shard-bmg: PASS -> INCOMPLETE +1 other test incomplete
>      * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-5:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL
>      * igt@kms_psr@fbc-psr2-basic@edp-1:
> 
>           * shard-lnl: PASS -> FAIL +1 other test fail
>      * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP +1 other test skip
>      * igt@xe_exec_compute_mode@lr-mode-workload:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE
> 
>     Warnings
> 
>      * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
>           * shard-bmg: SKIP (Intel XE#2887) -> SKIP
> 
> New tests
> 
>    New tests have been introduced between XEIGT_8100_full and
>    XEIGTPW_12068_full:
> 
>   New IGT tests (1)
> 
>      * igt@xe_ccs@large-ctrl-surf-copy:
>           * Statuses : 3 pass(s)
>           * Exec time: [0.36, 0.49] s
> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_12068_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@core_hotunplug@hotrebind:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1885) +1 other test skip
>      * igt@core_hotunplug@unbind-rebind:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1885) +1 other test skip
>      * igt@fbdev@eof:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2134)
>      * igt@fbdev@read:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#2134) +2 other tests skip
>      * igt@kms_addfb_basic@bad-pitch-63:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2461)
>      * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#2423 / i915#2575) +98
>             other tests skip
>           * shard-lnl: PASS -> FAIL (Intel XE#1701) +1 other test fail
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#1426) +1 other test fail
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#316) +3 other tests skip
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1407)
>      * igt@kms_big_fb@4-tiled-addfb-size-overflow:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#2890) +31 other tests skip
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#829)
>      * igt@kms_big_fb@y-tiled-addfb:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#619)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +1 other test skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124) +13 other tests
>             skip
>      * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#367)
>      * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#367) +5 other tests skip
>      * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +96 other tests
>             skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +8 other
>             tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +2 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2669) +3 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +28
>             other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1195 / Intel
>             XE#3113)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#1195)
>      * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2907) +3 other tests
>             skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#314)
>      * igt@kms_chamelium_audio@dp-audio:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373) +1 other test skip
>      * igt@kms_chamelium_color@ctm-limited-range:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#306) +1 other test skip
>      * igt@kms_chamelium_color@ctm-max:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2325)
>      * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#373) +10 other tests
>             skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252)
>      * igt@kms_content_protection@legacy:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1178) +1 other test fail
>      * igt@kms_content_protection@uevent@pipe-a-dp-5:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1188)
>      * igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#308) +3 other tests skip
>      * igt@kms_cursor_crc@cursor-offscreen-max-size:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424)
>      * igt@kms_cursor_crc@cursor-onscreen-256x256:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#3189) +8 other tests skip
>      * igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2321) +1 other test skip
>      * igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2321)
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309) +1 other test skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#323) +2 other tests skip
>      * igt@kms_cursor_legacy@torture-move:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#3184)
>      * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#301) +6 other tests fail
>      * igt@kms_flip@2x-flip-vs-panning-interruptible:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421)
>      * igt@kms_flip@busy-flip:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2423 / i915#2575) +57
>             other tests skip
>      * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#3149 / Intel XE#886)
>      * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#886) +2 other tests fail
>      * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#886) +3 other tests fail
>      * igt@kms_flip@flip-vs-expired-vblank:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#3149 / Intel XE#3152)
>      * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#301) +4 other tests fail
>      * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#3149)
>      * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#3403 / Intel XE#886) +1 other
>             test fail
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +18 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@basic:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#2351)
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +34 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651)
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#2351 / Intel XE#2890) +10
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2351 / Intel XE#2890)
>             +23 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#2333) +1 other test fail
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2890) +57 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +35 other tests
>             skip
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2927)
>      * igt@kms_joiner@invalid-modeset-big-joiner:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#346)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#356)
>      * igt@kms_plane@pixel-format-source-clamping:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#829) +1 other test skip
>      * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#616) +1 other test fail
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#361)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2763) +2 other tests
>             skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2763 / Intel XE#455) +1
>             other test skip
>      * igt@kms_pm_backlight@bad-brightness:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#870)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#1430)
>      * igt@kms_pm_rpm@cursor:
> 
>           * shard-lnl: PASS -> DMESG-WARN (Intel XE#3184)
>      * igt@kms_pm_rpm@i2c:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#2446) +2 other tests skip
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2446) +1 other test skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1489)
>      * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2893)
>      * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1489) +6 other tests
>             skip
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1122)
>      * igt@kms_psr@fbc-psr-no-drrs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2234 / Intel XE#2850)
>      * igt@kms_psr@fbc-psr2-primary-render:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2850 / Intel XE#929) +10
>             other tests skip
>      * igt@kms_psr@pr-sprite-plane-move:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406) +2 other tests skip
>      * igt@kms_psr@psr-sprite-plane-onoff:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2351)
>      * igt@kms_psr@psr2-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3189) +1 other test skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1127)
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1729)
>      * igt@kms_universal_plane@cursor-fb-leak:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#899) +2 other tests fail
>      * igt@testdisplay:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2423) +1 other test skip
>      * igt@xe_copy_basic@mem-copy-linear-0x369:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1123)
>      * igt@xe_copy_basic@mem-set-linear-0xfffe:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1126) +1 other test skip
>      * igt@xe_eudebug@basic-client:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2905) +3 other tests skip
>      * igt@xe_eudebug@multiple-sessions:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2905) +1 other test skip
>      * igt@xe_eudebug_online@debugger-reopen:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2905) +11 other tests
>             skip
>      * igt@xe_evict@evict-mixed-many-threads-large:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1000)
>      * igt@xe_evict@evict-mixed-threads-small-multi-vm:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#688) +1 other test skip
>      * igt@xe_exec_basic@many-null-rebind:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1130) +194 other tests
>             skip
>      * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392)
>      * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322)
>      * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#1630)
>      * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#3320)
>      * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#1630)
>      * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288) +27 other tests
>             skip
>      * igt@xe_module_load@many-reload:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#2136)
>      * igt@xe_module_load@reload-no-display:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#2136)
>      * igt@xe_oa@polling-small-buf:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2541) +7 other tests
>             skip
>      * igt@xe_pat@display-vs-wb-transient:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1337)
>      * igt@xe_pat@pat-index-xe2:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2839 / Intel XE#977)
>      * igt@xe_pat@pat-index-xelpg:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#979)
>      * igt@xe_pm@d3cold-basic-exec:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366)
>      * igt@xe_pm@s2idle-exec-after:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1130) +87 other tests
>             skip
>      * igt@xe_pm@s4-exec-after:
> 
>           * shard-lnl: PASS -> ABORT (Intel XE#1358 / Intel XE#1607)
>      * igt@xe_query@multigpu-query-invalid-extension:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_query@multigpu-query-invalid-query:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#944) +1 other test skip
>      * igt@xe_query@multigpu-query-mem-usage:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_wedged@basic-wedged:
> 
>           * shard-dg2-set2: NOTRUN -> DMESG-WARN (Intel XE#2919)
>      * igt@xe_wedged@wedged-at-any-timeout:
> 
>           * shard-lnl: PASS -> DMESG-WARN (Intel XE#3119)
> 
>     Possible fixes
> 
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1195 / Intel XE#1727) ->
>             PASS
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1195) -> PASS
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#3113) -> PASS
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1195 / Intel XE#3124) ->
>             PASS
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
> 
>           * shard-dg2-set2: DMESG-WARN -> PASS
>      * igt@kms_color@ctm-0-50@pipe-c-edp-1:
> 
>           * shard-lnl: DMESG-WARN (Intel XE#2929) -> PASS +1 other test pass
>      * igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-edp-1:
> 
>           * shard-lnl: FAIL (Intel XE#2577) -> PASS +1 other test pass
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-dg2-set2: FAIL (Intel XE#1475) -> PASS
>           * shard-lnl: FAIL (Intel XE#1475) -> PASS
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
> 
>           * shard-bmg: FAIL (Intel XE#301) -> PASS +3 other tests pass
>      * igt@kms_flip@blocking-wf_vblank:
> 
>           * shard-lnl: FAIL (Intel XE#886) -> PASS +4 other tests pass
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455) -> PASS
>      * igt@kms_lease@lease-uevent:
> 
>           * shard-lnl: FAIL -> PASS +1 other test pass
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-lnl: FAIL (Intel XE#718) -> PASS
>      * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
> 
>           * shard-lnl: FAIL (Intel XE#1630) -> PASS +2 other tests pass
>      * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
> 
>           * shard-bmg: FAIL (Intel XE#1630) -> PASS +2 other tests pass
>      * igt@xe_gt_freq@freq_suspend:
> 
>           * shard-dg2-set2: ABORT (Intel XE#2625) -> PASS
>      * igt@xe_module_load@reload:
> 
>           * shard-dg2-set2: FAIL (Intel XE#2136) -> PASS
>           * shard-bmg: FAIL (Intel XE#2136) -> PASS
>      * igt@xe_pm@s2idle-mocs:
> 
>           * shard-lnl: DMESG-WARN (Intel XE#2932) -> PASS
>      * igt@xe_pm@s2idle-vm-bind-prefetch:
> 
>           * shard-dg2-set2: ABORT (Intel XE#1694) -> PASS
>      * igt@xe_pm@s4-basic-exec:
> 
>           * shard-lnl: ABORT (Intel XE#1358 / Intel XE#1607 / Intel XE#1794)
>             -> PASS
>      * igt@xe_pm@s4-mocs:
> 
>           * shard-lnl: ABORT (Intel XE#1794) -> PASS
> 
>     Warnings
> 
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>           * shard-bmg: SKIP (Intel XE#2327) -> SKIP (Intel XE#829)
>      * igt@kms_big_fb@linear-16bpp-rotate-90:
> 
>           * shard-dg2-set2: SKIP (Intel XE#316) -> SKIP (Intel XE#2351 /
>             Intel XE#2890) +2 other tests skip
>      * igt@kms_big_fb@linear-64bpp-rotate-0:
> 
>           * shard-lnl: DMESG-WARN (Intel XE#1725) -> DMESG-FAIL (Intel
>             XE#1725)
>      * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> 
>           * shard-dg2-set2: SKIP (Intel XE#316) -> SKIP (Intel XE#2890) +3
>             other tests skip
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
> 
>           * shard-bmg: SKIP (Intel XE#1124) -> SKIP (Intel XE#829) +1 other
>             test skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1124) -> SKIP (Intel XE#2890) +3
>             other tests skip
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1124) -> SKIP (Intel XE#2351 /
>             Intel XE#2890) +4 other tests skip
>      * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2191) -> SKIP (Intel XE#2423 /
>             i915#2575) +1 other test skip
>      * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
> 
>           * shard-bmg: SKIP (Intel XE#2314 / Intel XE#2894) -> SKIP (Intel
>             XE#3189)
>      * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#367) -> SKIP (Intel XE#2423 /
>             i915#2575) +4 other tests skip
>      * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455 / Intel XE#787) -> SKIP (Intel
>             XE#2890) +11 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2907) -> SKIP (Intel XE#2890) +2
>             other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1195) -> INCOMPLETE (Intel
>             XE#1195 / Intel XE#1727)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1195 / Intel XE#1727) ->
>             INCOMPLETE (Intel XE#1195 / Intel XE#2692)
>      * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455 / Intel XE#787) -> SKIP (Intel
>             XE#2351 / Intel XE#2890) +1 other test skip
>      * igt@kms_chamelium_color@ctm-blue-to-red:
> 
>           * shard-dg2-set2: SKIP (Intel XE#306) -> SKIP (Intel XE#2423 /
>             i915#2575)
>      * igt@kms_chamelium_frames@hdmi-aspect-ratio:
> 
>           * shard-bmg: SKIP (Intel XE#2252) -> SKIP (Intel XE#3189) +1 other
>             test skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> 
>           * shard-dg2-set2: SKIP (Intel XE#373) -> SKIP (Intel XE#2423 /
>             i915#2575) +12 other tests skip
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-dg2-set2: FAIL (Intel XE#1178) -> SKIP (Intel XE#2423 /
>             i915#2575)
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-dg2-set2: SKIP (Intel XE#307) -> SKIP (Intel XE#2423 /
>             i915#2575) +1 other test skip
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-dg2-set2: FAIL (Intel XE#1178) -> TIMEOUT (Intel XE#3208)
>      * igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>           * shard-dg2-set2: SKIP (Intel XE#308) -> SKIP (Intel XE#2423 /
>             i915#2575) +1 other test skip
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455) -> SKIP (Intel XE#2351 /
>             Intel XE#2890) +1 other test skip
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455) -> SKIP (Intel XE#2890) +4
>             other tests skip
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1138) -> SKIP (Intel XE#2423 /
>             i915#2575)
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>           * shard-dg2-set2: FAIL (Intel XE#301) -> SKIP (Intel XE#2423 /
>             i915#2575) +1 other test skip
>      * igt@kms_flip@wf_vblank-ts-check:
> 
>           * shard-lnl: FAIL (Intel XE#886) -> FAIL (Intel XE#3403 / Intel
>             XE#886)
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#3189) +4 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@drrs-suspend:
> 
>           * shard-dg2-set2: SKIP (Intel XE#651) -> SKIP (Intel XE#2351 /
>             Intel XE#2890) +12 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
> 
>           * shard-bmg: FAIL (Intel XE#2333) -> SKIP (Intel XE#3189)
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-dg2-set2: SKIP (Intel XE#651) -> SKIP (Intel XE#2890) +24
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#653) -> SKIP (Intel XE#2890) +27
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
> 
>           * shard-dg2-set2: SKIP (Intel XE#653) -> SKIP (Intel XE#2351 /
>             Intel XE#2890) +8 other tests skip
>      * igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>           * shard-bmg: SKIP (Intel XE#2350) -> SKIP (Intel XE#3189)
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#3189) +3 other
>             tests skip
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-dg2-set2: FAIL (Intel XE#3312) -> SKIP (Intel XE#2423 /
>             i915#2575)
>      * igt@kms_joiner@basic-big-joiner:
> 
>           * shard-dg2-set2: SKIP (Intel XE#346) -> SKIP (Intel XE#2890) +1
>             other test skip
>      * igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2927) -> SKIP (Intel XE#2890)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2763 / Intel XE#455) -> SKIP
>             (Intel XE#2423 / i915#2575) +1 other test skip
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2938) -> SKIP (Intel XE#2890)
>      * igt@kms_pm_backlight@fade:
> 
>           * shard-dg2-set2: SKIP (Intel XE#870) -> SKIP (Intel XE#2890)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-bmg: FAIL (Intel XE#1430) -> SKIP (Intel XE#3189)
>      * igt@kms_pm_dc@deep-pkgc:
> 
>           * shard-dg2-set2: SKIP (Intel XE#908) -> SKIP (Intel XE#2890)
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-bmg: SKIP (Intel XE#1489) -> SKIP (Intel XE#3189) +1 other
>             test skip
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1489) -> SKIP (Intel XE#2890) +11
>             other tests skip
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1122) -> SKIP (Intel XE#2890)
>      * igt@kms_psr@fbc-psr-sprite-plane-onoff:
> 
>           * shard-bmg: SKIP (Intel XE#2234 / Intel XE#2850) -> SKIP (Intel
>             XE#3189) +1 other test skip
>      * igt@kms_psr@pr-primary-page-flip:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2850 / Intel XE#929) -> SKIP
>             (Intel XE#2351 / Intel XE#2890) +3 other tests skip
>      * igt@kms_psr@pr-sprite-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2850 / Intel XE#929) -> SKIP
>             (Intel XE#2890) +7 other tests skip
>      * igt@kms_psr@psr-cursor-plane-move:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2850 / Intel XE#929) -> SKIP
>             (Intel XE#2351)
>      * igt@kms_rotation_crc@bad-pixel-format:
> 
>           * shard-dg2-set2: SKIP -> SKIP (Intel XE#2423 / i915#2575) +2 other
>             tests skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1127) -> SKIP (Intel XE#2423 /
>             i915#2575)
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-dg2-set2: SKIP (Intel XE#362) -> SKIP (Intel XE#1500)
>      * igt@kms_vrr@flipline:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455) -> SKIP (Intel XE#2423 /
>             i915#2575) +8 other tests skip
>      * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1091 / Intel XE#2849) -> SKIP
>             (Intel XE#2423 / i915#2575)
>      * igt@xe_copy_basic@mem-set-linear-0x3fff:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1126) -> SKIP (Intel XE#1130)
>      * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2905) -> SKIP (Intel XE#1130) +10
>             other tests skip
>      * igt@xe_evict@evict-large-multi-vm-cm:
> 
>           * shard-dg2-set2: FAIL (Intel XE#1600) -> SKIP (Intel XE#1130)
>      * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
> 
>           * shard-dg2-set2: SKIP (Intel XE#288) -> SKIP (Intel XE#1130) +32
>             other tests skip
>      * igt@xe_huc_copy@huc_copy:
> 
>           * shard-dg2-set2: SKIP (Intel XE#255) -> SKIP (Intel XE#1130)
>      * igt@xe_oa@syncs-userptr-wait-cfg:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2541) -> SKIP (Intel XE#1130) +9
>             other tests skip
>      * igt@xe_peer2peer@read:
> 
>           * shard-dg2-set2: FAIL (Intel XE#1173) -> SKIP (Intel XE#1061)
>      * igt@xe_pm@d3cold-mocs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2284) -> SKIP (Intel XE#1130)
>      * igt@xe_pm@d3cold-multiple-execs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2284 / Intel XE#366) -> SKIP
>             (Intel XE#1130)
>      * igt@xe_pm@s2idle-basic:
> 
>           * shard-dg2-set2: ABORT (Intel XE#1358 / Intel XE#1794) -> SKIP
>             (Intel XE#1130)
>      * igt@xe_query@multigpu-query-engines:
> 
>           * shard-dg2-set2: SKIP (Intel XE#944) -> SKIP (Intel XE#1130) +1
>             other test skip
>      * igt@xe_tlb@basic-tlb:
> 
>           * shard-dg2-set2: FAIL (Intel XE#2922) -> SKIP (Intel XE#1130)
> 
> Build changes
> 
>      * IGT: IGT_8100 -> IGTPW_12068
>      * Linux: xe-2179-438ef86a725b59a171dba81fc258bb23a0ff536c ->
>        xe-2188-5f445c6723de9ac7087170f4ee8fcb2050ab8346
> 
>    IGTPW_12068: 12068
>    IGT_8100: 84e42580f918da926481fd2fb37be01451d6ee9a @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-2179-438ef86a725b59a171dba81fc258bb23a0ff536c:
>    438ef86a725b59a171dba81fc258bb23a0ff536c
>    xe-2188-5f445c6723de9ac7087170f4ee8fcb2050ab8346:
>    5f445c6723de9ac7087170f4ee8fcb2050ab8346
