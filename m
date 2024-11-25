Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCB1D3B7DD
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 07:16:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12E410E05A;
	Mon, 25 Nov 2024 07:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="agRrU/PQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB5F10E05A;
 Mon, 25 Nov 2024 07:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732518994; x=1764054994;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tB3xzckenUJtV2Fk+ZzNudDEfYgEV07JPkczliNvM9g=;
 b=agRrU/PQ4DktTgnUR8qPIsy7h0gVftgbe/WSSFUJIwW2qnVY5nBQUr9o
 h3tFpSRpqQhk9HgcYUDF+W1pXTN+JCcFhKMFmTHs9pvvbVC8y43GWJnCh
 riBa1XFTz66D+1BTnWHqchpgqsvSfIQf0ylfn56i7lkoBvry6GrQDOhRR
 7PTf6WQrTzgu1NJniG3LD6xg0tUfKeAZTPBVxEp+AARw3hRLTL21jis0+
 63OikHmYW4UYhNWvFhiHyKhkVGdJsjVEIMZzLDjpfMeU5g/xaU87F1qci
 AqGZ+mODMB9xOHvol7z+cbN++OHFt8qKbfQ1xOalZcYgmKwzmk3PaRBLC Q==;
X-CSE-ConnectionGUID: e4unQXa7TSek4TDw/ilBsg==
X-CSE-MsgGUID: Ydk9QWIBSde1nWIX/7xILw==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="31986272"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="31986272"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 23:16:34 -0800
X-CSE-ConnectionGUID: UkTUdHifRwi+OK/9Iiftqw==
X-CSE-MsgGUID: rIe6EbeFSKKZ6M3kkFJ9gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="95952746"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.224])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 23:16:33 -0800
Date: Mon, 25 Nov 2024 08:16:30 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 intel_compute: Use valid number of array size for unbind
Message-ID: <20241125071630.5gmd24gjfvn5wa34@zkempczy-mobl2>
References: <20241122102931.210761-1-zbigniew.kempczynski@intel.com>
 <173237596620.2124684.892640930405457518@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173237596620.2124684.892640930405457518@b555e5b46a47>
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

On Sat, Nov 23, 2024 at 03:32:46PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  intel_compute: Use valid number of array size for unbind         
>    URL:     https://patchwork.freedesktop.org/series/141693/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12175/index.html 
> 
>         CI Bug Log - changes from XEIGT_8123_full -> XEIGTPW_12175_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_12175_full absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_12175_full, please notify your bug team
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
>    XEIGTPW_12175_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-dp2-hdmi-a3:
> 
>           * shard-bmg: NOTRUN -> DMESG-WARN
>      * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3:
> 
>           * shard-bmg: PASS -> INCOMPLETE +1 other test incomplete
>      * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
> 
>           * shard-lnl: PASS -> ABORT

Unrelated with above regressions. It touches only xe_compute for Xe2.

--
Zbigniew
> 
>     Warnings
> 
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#3468) -> DMESG-WARN
>      * igt@xe_exec_reset@cm-gt-reset:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1130) -> INCOMPLETE
>      * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
> 
>           * shard-dg2-set2: TIMEOUT (Intel XE#2961 / Intel XE#3191) ->
>             INCOMPLETE +1 other test incomplete
>      * igt@xe_module_load@reload-no-display:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#3467) -> FAIL
> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_12175_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@core_getversion@basic:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#3440)
>      * igt@core_hotunplug@hotrebind-lateclose:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#3468)
>      * igt@core_setmaster@master-drop-set-shared-fd:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#3453)
>      * igt@core_setmaster_vs_auth:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#2423)
>      * igt@fbdev@write:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#2134) +2 other tests skip
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1125)
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2550) +23 other tests
>             skip
>      * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#3557)
>      * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#2423 / i915#2575) +85
>             other tests skip
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1407)
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2327)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-bmg: PASS -> DMESG-WARN (Intel XE#3468) +29 other tests
>             dmesg-warn
>      * igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#316)
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
> 
>           * shard-bmg: NOTRUN -> DMESG-FAIL (Intel XE#3468) +3 other tests
>             dmesg-fail
>      * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124)
>      * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1477)
>      * igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#610)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +3 other tests skip
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124)
>      * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2314 / Intel XE#2894)
>      * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1512)
>      * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#367)
>      * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +139 other tests
>             skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#2136 / Intel XE#2351) +10
>             other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +12
>             other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +4 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3432)
>      * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +1 other test skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#1727 / Intel
>             XE#3113)
>      * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +21
>             other tests skip
>      * igt@kms_chamelium_audio@dp-audio:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373) +2 other tests skip
>      * igt@kms_chamelium_color@ctm-0-50:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#306)
>      * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252)
>      * igt@kms_content_protection@atomic:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#1178) +1 other test fail
>      * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
> 
>           * shard-bmg: NOTRUN -> INCOMPLETE (Intel XE#2715 / Intel XE#3468)
>      * igt@kms_content_protection@legacy:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2341)
>      * igt@kms_content_protection@legacy@pipe-a-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1178) +1 other test fail
>      * igt@kms_content_protection@lic-type-1:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +6 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2321) +1 other test skip
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2291) +3 other tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
> 
>           * shard-bmg: NOTRUN -> DMESG-WARN (Intel XE#877)
>      * igt@kms_dp_aux_dev:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2423)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2372)
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2373)
>      * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421) +2 other tests skip
>      * igt@kms_flip@2x-blocking-absolute-wf_vblank@ac-dp2-hdmi-a3:
> 
>           * shard-bmg: NOTRUN -> DMESG-WARN (Intel XE#3468) +23 other tests
>             dmesg-warn
>      * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2316) +5 other tests skip
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#2882) +5 other tests fail
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#3321 / Intel XE#3486)
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#3486) +2 other tests fail
>      * igt@kms_flip@flip-vs-blocking-wf-vblank:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2423 / i915#2575) +22
>             other tests skip
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#3486)
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#301 / Intel XE#3486)
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#301) +2 other tests fail
>      * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#3321 / Intel XE#3487)
>      * igt@kms_flip@flip-vs-expired-vblank@d-dp4:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#301 / Intel XE#3321 /
>             Intel XE#3487)
>      * igt@kms_flip@flip-vs-suspend:
> 
>           * shard-lnl: PASS -> INCOMPLETE (Intel XE#2049) +1 other test
>             incomplete
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * shard-bmg: PASS -> DMESG-FAIL (Intel XE#1727 / Intel XE#3468) +6
>             other tests dmesg-fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401 / Intel XE#1745) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293 / Intel XE#2380) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293) +1 other test skip
>      * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#2136) +28 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#2333) +3 other tests fail
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2312) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2136) +21 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +7 other tests skip
>      * igt@kms_hdmi_inject@inject-4k:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1470)
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1503)
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1503)
>      * igt@kms_plane@pixel-format-source-clamping:
> 
>           * shard-bmg: PASS -> INCOMPLETE (Intel XE#2566 / Intel XE#3468)
>      * igt@kms_plane@plane-panning-bottom-right-suspend:
> 
>           * shard-bmg: PASS -> INCOMPLETE (Intel XE#1727 / Intel XE#3468) +5
>             other tests incomplete
>      * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
> 
>           * shard-bmg: PASS -> DMESG-FAIL (Intel XE#3468) +9 other tests
>             dmesg-fail
>      * igt@kms_plane_lowres@tiling-y:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#599)
>      * igt@kms_plane_lowres@tiling-yf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2393)
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3307)
>      * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#361)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2763) +4 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2763) +3 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2763) +2 other tests
>             skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2763 / Intel XE#455)
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#718)
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#3141)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2446) +1 other test skip
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#3141)
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#2446) +1 other test skip
>      * igt@kms_pm_rpm@universal-planes-dpms@plane-50:
> 
>           * shard-bmg: PASS -> DMESG-WARN (Intel XE#1727 / Intel XE#3468) +10
>             other tests dmesg-warn
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1489) +3 other tests skip
>      * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1489) +2 other tests
>             skip
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1122)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2387)
>      * igt@kms_psr@fbc-pr-cursor-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2234 / Intel XE#2850) +4
>             other tests skip
>      * igt@kms_psr@pr-cursor-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406)
>      * igt@kms_psr@pr-dpms:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2136 / Intel XE#2351) +2
>             other tests skip
>      * igt@kms_psr@psr-basic:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2850 / Intel XE#929)
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2330)
>      * igt@kms_scaling_modes@scaling-mode-full-aspect:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2413)
>      * igt@kms_tv_load_detect@load-detect:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#330)
>      * igt@kms_vblank@query-busy@pipe-d-hdmi-a-3:
> 
>           * shard-bmg: PASS -> DMESG-WARN (Intel XE#877) +3 other tests
>             dmesg-warn
>      * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2:
> 
>           * shard-bmg: NOTRUN -> DMESG-WARN (Intel XE#1727 / Intel XE#3468)
>      * igt@kms_vrr@lobf:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2168)
>      * igt@kms_writeback@writeback-check-output-xrgb2101010:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#756)
>      * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2905) +3 other tests skip
>      * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2905) +1 other test skip
>      * igt@xe_evict@evict-large-multi-vm:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#688) +1 other test skip
>      * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +3 other tests skip
>      * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392)
>      * igt@xe_exec_fault_mode@many-basic-prefetch:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288) +4 other tests skip
>      * igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2905) +1 other test skip
>      * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
> 
>           * shard-bmg: PASS -> DMESG-WARN (Intel XE#3467)
>      * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
> 
>           * shard-bmg: PASS -> DMESG-WARN (Intel XE#3467 / Intel XE#3468) +1
>             other test dmesg-warn
>      * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#2229) +1 other test skip
>      * igt@xe_media_fill@media-fill:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#560)
>      * igt@xe_module_load@many-reload:
> 
>           * shard-lnl: PASS -> DMESG-WARN (Intel XE#3560)
>      * igt@xe_module_load@reload:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#3546) +1 other test fail
>      * igt@xe_oa@polling:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3573)
>      * igt@xe_oa@syncs-ufence-wait:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1130) +34 other tests
>             skip
>      * igt@xe_pat@pat-index-xehpc:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2838 / Intel XE#979)
>      * igt@xe_pm@d3cold-mmap-system:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2284)
>      * igt@xe_pm@s4-vm-bind-unbind-all:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#1727 / Intel XE#2280
>             / Intel XE#3468)
>      * igt@xe_query@multigpu-query-invalid-extension:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_query@multigpu-query-oa-units:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_vm@large-userptr-split-misaligned-binds-2097152:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#1727) +1 other test
>             dmesg-warn
>      * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1130) +151 other tests
>             skip
> 
>     Possible fixes
> 
>      * igt@core_getstats:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2423) -> PASS
>      * igt@core_hotunplug@unbind-rebind:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1885) -> PASS +2 other tests pass
>      * igt@fbdev@read:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2134) -> PASS
>      * igt@kms_async_flips@alternate-sync-async-flip:
> 
>           * shard-bmg: FAIL (Intel XE#827) -> PASS +1 other test pass
>      * igt@kms_async_flips@async-flip-suspend-resume:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#3468) -> PASS +1 other test
>             pass
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-bmg: DMESG-FAIL (Intel XE#2705 / Intel XE#3468) -> PASS
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#2705 / Intel XE#3468) -> PASS
>      * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> 
>           * shard-bmg: SKIP (Intel XE#2314 / Intel XE#2894) -> PASS +1 other
>             test pass
>      * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-dp-2:
> 
>           * shard-bmg: DMESG-FAIL (Intel XE#3468) -> PASS +11 other tests
>             pass
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>           * shard-bmg: INCOMPLETE (Intel XE#1727) -> PASS
>      * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>           * shard-bmg: SKIP (Intel XE#2291) -> PASS +2 other tests pass
>      * igt@kms_dp_aux_dev:
> 
>           * shard-bmg: SKIP (Intel XE#3009) -> PASS
>      * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
> 
>           * shard-dg2-set2: FAIL (Intel XE#301) -> PASS +5 other tests pass
>      * igt@kms_flip@2x-nonexisting-fb:
> 
>           * shard-bmg: SKIP (Intel XE#2316) -> PASS +5 other tests pass
>      * igt@kms_flip@busy-flip:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> PASS +111
>             other tests pass
>      * igt@kms_flip@flip-vs-absolute-wf_vblank:
> 
>           * shard-lnl: FAIL (Intel XE#886) -> PASS +6 other tests pass
>      * igt@kms_flip@flip-vs-expired-vblank:
> 
>           * shard-bmg: FAIL (Intel XE#2882) -> PASS +1 other test pass
>      * igt@kms_flip@flip-vs-expired-vblank@b-dp2:
> 
>           * shard-bmg: FAIL (Intel XE#3321 / Intel XE#3487) -> PASS
>      * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
> 
>           * shard-lnl: FAIL (Intel XE#3149 / Intel XE#886) -> PASS +1 other
>             test pass
>      * igt@kms_flip@modeset-vs-vblank-race@a-hdmi-a6:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1727) -> PASS +1 other test
>             pass
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> PASS +34 other tests pass
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136 / Intel XE#2351) -> PASS +11
>             other tests pass
>      * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#3468) -> PASS +72 other tests
>             pass
>      * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>           * shard-bmg: SKIP (Intel XE#2571) -> PASS
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-lnl: FAIL (Intel XE#1430) -> PASS
>      * igt@kms_pm_rpm@legacy-planes-dpms@plane-59:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#1727 / Intel XE#3468) -> PASS +8
>             other tests pass
>      * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2446) -> PASS +4 other tests pass
>      * igt@kms_setmode@basic:
> 
>           * shard-bmg: FAIL (Intel XE#2883) -> PASS +2 other tests pass
>      * igt@kms_setmode@clone-exclusive-crtc:
> 
>           * shard-bmg: SKIP (Intel XE#1435) -> PASS
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-bmg: SKIP (Intel XE#1499) -> PASS
>      * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1130) -> PASS +200 other tests
>             pass
>      * igt@xe_exec_basic@many-null-rebind:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#1727) -> PASS +2 other tests pass
>      * igt@xe_exec_reset@cm-close-execqueues-close-fd:
> 
>           * shard-lnl: FAIL (Intel XE#1081) -> PASS
>           * shard-bmg: FAIL (Intel XE#1081) -> PASS
>      * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#3467 / Intel XE#3468) -> PASS +1
>             other test pass
>      * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
> 
>           * shard-bmg: DMESG-WARN -> PASS +3 other tests pass
>      * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#3343 / Intel XE#3468) -> PASS +1
>             other test pass
>      * igt@xe_pm@s2idle-basic-exec:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#1616 / Intel XE#3468) -> PASS
>      * igt@xe_pm@s3-mocs:
> 
>           * shard-bmg: DMESG-FAIL (Intel XE#1727 / Intel XE#3468) -> PASS
>      * igt@xe_pm@s3-vm-bind-prefetch:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#1727 / Intel XE#3468 / Intel
>             XE#569) -> PASS
> 
>     Warnings
> 
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * shard-dg2-set2: SKIP (Intel XE#623) -> SKIP (Intel XE#2423 /
>             i915#2575)
>      * igt@kms_addfb_basic@unused-offsets:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1727) -> SKIP (Intel XE#2423
>             / i915#2575)
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#316) +2
>             other tests skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> 
>           * shard-dg2-set2: SKIP (Intel XE#316) -> SKIP (Intel XE#2136) +2
>             other tests skip
>      * igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136 / Intel XE#2351) -> SKIP
>             (Intel XE#316) +2 other tests skip
>      * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1124) -> SKIP (Intel XE#2136 /
>             Intel XE#2351) +2 other tests skip
>      * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136 / Intel XE#2351) -> SKIP
>             (Intel XE#607)
>      * igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>           * shard-dg2-set2: SKIP (Intel XE#610) -> SKIP (Intel XE#2136)
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#1124) +4
>             other tests skip
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1124) -> SKIP (Intel XE#2136) +6
>             other tests skip
>      * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#610)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136 / Intel XE#2351) -> SKIP
>             (Intel XE#1124) +5 other tests skip
>      * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#367) -> SKIP (Intel XE#2423 /
>             i915#2575)
>      * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2191) -> SKIP (Intel XE#2423 /
>             i915#2575) +1 other test skip
>      * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel
>             XE#367) +6 other tests skip
>      * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136 / Intel XE#2351) -> SKIP
>             (Intel XE#455 / Intel XE#787) +4 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455 / Intel XE#787) -> SKIP (Intel
>             XE#2136 / Intel XE#2351) +1 other test skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455 / Intel XE#787) -> SKIP (Intel
>             XE#2136) +11 other tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#2907) +2
>             other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#3442) -> SKIP (Intel XE#2136)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#3442)
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-dg2-set2: FAIL (Intel XE#616) -> SKIP (Intel XE#2136)
>      * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2907) -> SKIP (Intel XE#2136) +1
>             other test skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136 / Intel XE#2351) ->
>             INCOMPLETE (Intel XE#1727)
>      * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#455 /
>             Intel XE#787) +12 other tests skip
>      * igt@kms_chamelium_color@ctm-green-to-red:
> 
>           * shard-dg2-set2: SKIP (Intel XE#306) -> SKIP (Intel XE#2423 /
>             i915#2575) +4 other tests skip
>      * igt@kms_chamelium_color@degamma:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel
>             XE#306) +1 other test skip
>      * igt@kms_chamelium_edid@hdmi-edid-read:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel
>             XE#373) +14 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
> 
>           * shard-dg2-set2: SKIP (Intel XE#373) -> SKIP (Intel XE#2423 /
>             i915#2575) +9 other tests skip
>      * igt@kms_content_protection@atomic:
> 
>           * shard-dg2-set2: FAIL (Intel XE#1178) -> SKIP (Intel XE#2423 /
>             i915#2575)
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-bmg: SKIP (Intel XE#2341) -> INCOMPLETE (Intel XE#2715 /
>             Intel XE#3468)
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-dg2-set2: SKIP (Intel XE#307) -> SKIP (Intel XE#2423 /
>             i915#2575) +1 other test skip
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel
>             XE#307) +1 other test skip
>      * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
> 
>           * shard-bmg: FAIL (Intel XE#1178) -> INCOMPLETE (Intel XE#2715 /
>             Intel XE#3468) +1 other test incomplete
>      * igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel
>             XE#308) +3 other tests skip
>      * igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>           * shard-dg2-set2: SKIP (Intel XE#308) -> SKIP (Intel XE#2423 /
>             i915#2575) +1 other test skip
>      * igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel
>             XE#455) +9 other tests skip
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#3468) -> SKIP (Intel XE#2291)
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1727) -> SKIP (Intel XE#2423
>             / i915#2575)
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#877) -> SKIP (Intel XE#2291)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>           * shard-dg2-set2: SKIP (Intel XE#323) -> SKIP (Intel XE#2423 /
>             i915#2575) +1 other test skip
>      * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3:
> 
>           * shard-bmg: DMESG-FAIL (Intel XE#3468) -> FAIL (Intel XE#2141) +1
>             other test fail
>      * igt@kms_dsc@dsc-basic:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2351) -> SKIP (Intel XE#455)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#776)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-dg2-set2: SKIP (Intel XE#701) -> SKIP (Intel XE#2423 /
>             i915#2575)
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1137) -> SKIP (Intel XE#2423 /
>             i915#2575)
>      * igt@kms_feature_discovery@psr2:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel
>             XE#1135)
>      * igt@kms_flip@2x-flip-vs-expired-vblank:
> 
>           * shard-bmg: FAIL (Intel XE#2882) -> SKIP (Intel XE#2316)
>      * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
> 
>           * shard-bmg: SKIP (Intel XE#2316) -> DMESG-WARN (Intel XE#3468) +2
>             other tests dmesg-warn
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>           * shard-bmg: ABORT (Intel XE#3468) -> SKIP (Intel XE#2316)
>      * igt@kms_flip@bo-too-big-interruptible:
> 
>           * shard-lnl: TIMEOUT (Intel XE#1504) -> INCOMPLETE (Intel XE#1504)
>             +1 other test incomplete
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> FAIL (Intel
>             XE#301)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455) -> SKIP (Intel XE#2136) +6
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136 / Intel XE#2351) -> SKIP
>             (Intel XE#455)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#455) +5
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455) -> SKIP (Intel XE#2136 /
>             Intel XE#2351) +4 other tests skip
>      * igt@kms_force_connector_basic@prune-stale-modes:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP
>             (i915#5274)
>      * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:
> 
>           * shard-dg2-set2: SKIP (Intel XE#651) -> SKIP (Intel XE#2136 /
>             Intel XE#2351) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
> 
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +19 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#651) +28
>             other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2311) +22 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-bmg: FAIL (Intel XE#2333) -> SKIP (Intel XE#2312) +8 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
> 
>           * shard-bmg: DMESG-FAIL (Intel XE#3468) -> FAIL (Intel XE#2333) +2
>             other tests fail
>      * igt@kms_frontbuffer_tracking@fbc-2p-rte:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> DMESG-FAIL (Intel XE#3468) +1
>             other test dmesg-fail
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
> 
>           * shard-bmg: FAIL (Intel XE#2333) -> DMESG-FAIL (Intel XE#3468) +3
>             other tests dmesg-fail
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-bmg: DMESG-FAIL (Intel XE#3468) -> SKIP (Intel XE#2312)
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> FAIL (Intel XE#2333) +7 other
>             tests fail
>      * igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>           * shard-dg2-set2: SKIP (Intel XE#658) -> SKIP (Intel XE#2136 /
>             Intel XE#2351) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
> 
>           * shard-dg2-set2: SKIP (Intel XE#651) -> SKIP (Intel XE#2136) +15
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136 / Intel XE#2351) -> SKIP
>             (Intel XE#651) +10 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136 / Intel XE#2351) -> SKIP
>             (Intel XE#658)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#653) +27
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#653) -> SKIP (Intel XE#2136) +25
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136 / Intel XE#2351) -> SKIP
>             (Intel XE#653) +17 other tests skip
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>           * shard-bmg: INCOMPLETE (Intel XE#1727 / Intel XE#2050 / Intel
>             XE#3468) -> FAIL (Intel XE#2333)
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:
> 
>           * shard-bmg: INCOMPLETE (Intel XE#1727 / Intel XE#3468) -> FAIL
>             (Intel XE#2333)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#653) -> SKIP (Intel XE#2136 /
>             Intel XE#2351) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +18 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2313) +19 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:
> 
>           * shard-dg2-set2: SKIP (Intel XE#653) -> SKIP (Intel XE#2924)
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#3189)
>      * igt@kms_joiner@basic-big-joiner:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#346)
>      * igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#2927)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-dg2-set2: SKIP (Intel XE#356) -> SKIP (Intel XE#2423 /
>             i915#2575)
>      * igt@kms_plane_multiple@tiling-y:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455) -> SKIP (Intel XE#2423 /
>             i915#2575) +7 other tests skip
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> FAIL (Intel
>             XE#361)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2763 / Intel XE#455) -> SKIP
>             (Intel XE#2423 / i915#2575) +1 other test skip
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b:
> 
>           * shard-bmg: DMESG-WARN -> DMESG-WARN (Intel XE#3468)
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel
>             XE#2763 / Intel XE#455)
>      * igt@kms_pm_backlight@fade:
> 
>           * shard-dg2-set2: SKIP (Intel XE#870) -> SKIP (Intel XE#2136) +1
>             other test skip
>      * igt@kms_pm_backlight@fade-with-suspend:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#870)
>      * igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136 / Intel XE#2351) -> SKIP
>             (Intel XE#1122)
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136 / Intel XE#2351) -> SKIP
>             (Intel XE#1129)
>      * igt@kms_pm_dc@deep-pkgc:
> 
>           * shard-dg2-set2: SKIP (Intel XE#908) -> SKIP (Intel XE#2136)
>      * igt@kms_pm_rpm@cursor-dpms:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2446) -> DMESG-WARN (Intel XE#1727
>             / Intel XE#3468)
>      * igt@kms_pm_rpm@legacy-planes-dpms:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#3468) -> SKIP (Intel
>             XE#2446)
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#1489) +10
>             other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1489) -> SKIP (Intel XE#2136) +9
>             other tests skip
>      * igt@kms_psr@fbc-pr-primary-render:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2850 / Intel XE#929) -> SKIP
>             (Intel XE#2136 / Intel XE#2351) +4 other tests skip
>      * igt@kms_psr@fbc-psr-no-drrs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136 / Intel XE#2351) -> SKIP
>             (Intel XE#2850 / Intel XE#929) +8 other tests skip
>      * igt@kms_psr@fbc-psr-sprite-render:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136) -> SKIP (Intel XE#2850 /
>             Intel XE#929) +16 other tests skip
>      * igt@kms_psr@fbc-psr2-primary-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2850 / Intel XE#929) -> SKIP
>             (Intel XE#2136) +12 other tests skip
>      * igt@kms_psr@psr-cursor-plane-move:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2850 / Intel XE#929) -> SKIP
>             (Intel XE#2351)
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2136 / Intel XE#2351) -> SKIP
>             (Intel XE#2939)
>      * igt@kms_rotation_crc@primary-rotation-270:
> 
>           * shard-dg2-set2: SKIP (Intel XE#3414) -> SKIP (Intel XE#2423 /
>             i915#2575) +3 other tests skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1127) -> SKIP (Intel XE#2423 /
>             i915#2575)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel
>             XE#3414) +2 other tests skip
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-bmg: SKIP (Intel XE#2426) -> FAIL (Intel XE#1729)
>           * shard-dg2-set2: DMESG-FAIL (Intel XE#1727) -> SKIP (Intel XE#2423
>             / i915#2575)
>      * igt@kms_tv_load_detect@load-detect:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel
>             XE#330)
>      * igt@kms_vblank@wait-forked-hang:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#3468) -> DMESG-FAIL (Intel
>             XE#3468)
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-dg2-set2: SKIP (Intel XE#756) -> SKIP (Intel XE#2423 /
>             i915#2575)
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel
>             XE#756)
>      * igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel
>             XE#1091 / Intel XE#2849)
>      * igt@xe_copy_basic@mem-copy-linear-0x3fff:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#1123)
>      * igt@xe_copy_basic@mem-set-linear-0x3fff:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1126) -> SKIP (Intel XE#1130)
>      * igt@xe_eudebug_online@basic-breakpoint:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#2905) +13
>             other tests skip
>      * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2905) -> SKIP (Intel XE#1130) +10
>             other tests skip
>      * igt@xe_evict@evict-beng-mixed-many-threads-large:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1473) -> SKIP (Intel
>             XE#1130)
>           * shard-bmg: INCOMPLETE (Intel XE#1473 / Intel XE#3468) -> TIMEOUT
>             (Intel XE#1473)
>      * igt@xe_evict@evict-large-multi-vm-cm:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1130) -> FAIL (Intel XE#1600)
>      * igt@xe_evict@evict-mixed-many-threads-large:
> 
>           * shard-dg2-set2: TIMEOUT (Intel XE#1473) -> SKIP (Intel XE#1130)
>      * igt@xe_exec_balancer@twice-virtual-userptr-invalidate-race:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1130) -> DMESG-WARN (Intel
>             XE#1727)
>      * igt@xe_exec_fault_mode@once-basic:
> 
>           * shard-dg2-set2: SKIP (Intel XE#288) -> SKIP (Intel XE#1130) +23
>             other tests skip
>      * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#288) +37
>             other tests skip
>      * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#3467) -> SKIP (Intel
>             XE#1130) +1 other test skip
>      * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#3343) -> DMESG-WARN (Intel
>             XE#3343 / Intel XE#3468)
>      * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#3343) -> SKIP (Intel
>             XE#1130) +1 other test skip
>      * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
> 
>           * shard-bmg: DMESG-FAIL (Intel XE#3467) -> FAIL (Intel XE#3499)
>      * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1130) -> DMESG-WARN (Intel
>             XE#3467) +2 other tests dmesg-warn
>      * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#3468) -> DMESG-WARN (Intel
>             XE#3467)
>      * igt@xe_mmap@small-bar:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#512)
>      * igt@xe_module_load@reload-no-display:
> 
>           * shard-dg2-set2: FAIL (Intel XE#3546) -> DMESG-FAIL (Intel
>             XE#3467)
>      * igt@xe_oa@invalid-oa-metric-set-id:
> 
>           * shard-dg2-set2: SKIP (Intel XE#3573) -> SKIP (Intel XE#1130) +8
>             other tests skip
>      * igt@xe_oa@non-system-wide-paranoid:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#3573) +8
>             other tests skip
>      * igt@xe_pat@pat-index-xelpg:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#979)
>      * igt@xe_peer2peer@read:
> 
>           * shard-dg2-set2: FAIL (Intel XE#1173) -> SKIP (Intel XE#1061)
>      * igt@xe_pm@d3cold-basic:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2284 / Intel XE#366) -> SKIP
>             (Intel XE#1130)
>      * igt@xe_pm@d3cold-mmap-system:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#2284 /
>             Intel XE#366) +2 other tests skip
>      * igt@xe_pm@d3hot-basic:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#3468) -> SKIP (Intel
>             XE#1130)
>      * igt@xe_pm@s2idle-basic-exec:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1727 / Intel XE#3468) ->
>             DMESG-FAIL (Intel XE#1727 / Intel XE#3468)
>      * igt@xe_pm@s3-mocs:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1727 / Intel XE#3468) ->
>             SKIP (Intel XE#1130)
>      * igt@xe_pm_residency@idle-residency-on-exec:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1727) -> SKIP (Intel
>             XE#1130)
>      * igt@xe_query@multigpu-query-engines:
> 
>           * shard-dg2-set2: SKIP (Intel XE#944) -> SKIP (Intel XE#1130) +5
>             other tests skip
>      * igt@xe_query@multigpu-query-uc-fw-version-huc:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#944) +4
>             other tests skip
>      * igt@xe_wedged@wedged-at-any-timeout:
> 
>           * shard-bmg: SKIP (Intel XE#1130) -> ABORT (Intel XE#3421)
>      * igt@xe_wedged@wedged-mode-toggle:
> 
>           * shard-dg2-set2: ABORT (Intel XE#3075 / Intel XE#3084) -> SKIP
>             (Intel XE#1130)
> 
> Build changes
> 
>      * IGT: IGT_8123 -> IGTPW_12175
> 
>    IGTPW_12175: 12175
>    IGT_8123: fb343db7fc59c760ef0a0c19303e7bcec177dbd9 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-2263-a381faddbfc974e7bd57efe953a738415afccd6a:
>    a381faddbfc974e7bd57efe953a738415afccd6a
