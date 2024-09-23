Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883D6CF9C6F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 07:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBA510E365;
	Mon, 23 Sep 2024 07:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DENtSHMd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD7C10E365
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 07:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727076300; x=1758612300;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OUq41JDW4TvwdNKwfG6mQLm2pdlErOz9419OVlpjkjs=;
 b=DENtSHMdiAD7Xorv+W+o46EX8kLh9ybfe2QvowNofvfvrfG2zruJE90k
 yafpcgQrDZJSbCJqDyFGe35gd/jMoR6msBgYla6EGa1h7LlfWFWdNldFu
 Kky9RC6jopzpNnAaJxrGBUaUJkyV73zeCVa93x/Flap2WfIBLoM6RZhTo
 aYg+E8W0Uv4+2a3+PZbp3l3kX6rQOf2/YTSwoNi3odocwIp1iSG8Uxevh
 po4ood59nBz1Zzbb++WOtEWG16PG6gPc3JijT8x/ILfg64UwoUG/08hQc
 IepXV1VuGqxEbeJxPkD+76O9mgqkUVzSVBwgQA+l54eba+IcPh27+Ka4v g==;
X-CSE-ConnectionGUID: iFjovBGNR8+SSBynnoyj8Q==
X-CSE-MsgGUID: TDqsyXdjTLemj8vBogBW8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26164023"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="26164023"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 00:24:59 -0700
X-CSE-ConnectionGUID: 3gcAi1mhRR6JZ/fxG+XtvA==
X-CSE-MsgGUID: 2ET+FiVfTO25v9xgc8hkIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="108409301"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 00:24:56 -0700
Date: Mon, 23 Sep 2024 09:24:52 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_lib=2Fgpu=5Fcm?=
 =?utf-8?B?ZHM6?= Correct number of threads in CFE_STATE instruction
Message-ID: <20240923072452.4w5rgxz2gn5k6cqb@zkempczy-mobl2>
References: <20240920132425.226069-1-dominik.grzegorzek@intel.com>
 <172685795202.1051941.3249604429631619014@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172685795202.1051941.3249604429631619014@2413ebb6fbb6>
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

On Fri, Sep 20, 2024 at 06:45:52PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/gpu_cmds: Correct number of threads in CFE_STATE instruction 
>    URL:     https://patchwork.freedesktop.org/series/138924/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11777/index.html 
> 
>         CI Bug Log - changes from XEIGT_8030_full -> XEIGTPW_11777_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_11777_full absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_11777_full, please notify your bug team
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
>    XEIGTPW_11777_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@xe_exec_sip@invalidinstr-walker-enabled:
> 
>           * shard-lnl: PASS -> FAIL +14 other tests fail

Interesting, for ver >= 20 it should work but definitely breaks the
test. 

--
Zbigniew

>      * igt@xe_intel_bb@create-in-region:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN +1 other test dmesg-warn
> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * igt@xe_exec_sip@invalidinstr-thread-enabled:
>           * {shard-bmg}: PASS -> FAIL +14 other tests fail
> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_11777_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_async_flips@alternate-sync-async-flip:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#827) +2 other tests fail
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-linear:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#911) +1 other test fail
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#787) +6
>             other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#455 /
>             Intel XE#787) +1 other test skip
>      * igt@kms_chamelium_frames@hdmi-crc-multiple:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#373)
>      * igt@kms_cursor_legacy@single-bo@pipe-b:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1195) +3 other tests
>             incomplete
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#651)
>      * igt@kms_plane@plane-position-hole:
> 
>           * shard-lnl: PASS -> DMESG-WARN (Intel XE#324) +1 other test
>             dmesg-warn
>      * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#361)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#1430)
>      * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#1489)
>      * igt@kms_psr@psr2-dpms:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#1649) +1 other test fail
>      * igt@kms_vrr@flip-basic:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#2443) +5 other tests fail
>      * igt@xe_evict@evict-large-multi-vm-cm:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#1600)
>      * igt@xe_evict@evict-mixed-many-threads-small:
> 
>           * shard-dg2-set2: PASS -> TIMEOUT (Intel XE#1473)
>      * igt@xe_exec_compute_mode@once-userptr-invalidate:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#1069)
>      * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#288)
>      * igt@xe_exec_reset@parallel-gt-reset:
> 
>           * shard-dg2-set2: PASS -> TIMEOUT (Intel XE#2105)
>      * igt@xe_oa@oa-regs-whitelisted@ccs-0:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#2514)
>      * igt@xe_pm@s2idle-vm-bind-userptr:
> 
>           * shard-lnl: PASS -> INCOMPLETE (Intel XE#1616)
>      * igt@xe_pm@s4-exec-after:
> 
>           * shard-lnl: PASS -> ABORT (Intel XE#1358 / Intel XE#1607)
> 
>     Possible fixes
> 
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-lnl: FAIL (Intel XE#1659) -> PASS
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#455) -> PASS
>      * igt@kms_plane@plane-position-covered:
> 
>           * shard-lnl: DMESG-FAIL (Intel XE#324) -> PASS +1 other test pass
>      * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
> 
>           * shard-lnl: DMESG-WARN (Intel XE#324) -> PASS +3 other tests pass
>      * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: FAIL (Intel XE#361) -> PASS
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:
> 
>           * {shard-bmg}: INCOMPLETE (Intel XE#2566) -> PASS
>           * shard-dg2-set2: INCOMPLETE (Intel XE#2566) -> PASS
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-a:
> 
>           * {shard-bmg}: INCOMPLETE -> PASS
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-c:
> 
>           * shard-dg2-set2: INCOMPLETE -> PASS
>      * igt@kms_vrr@flip-basic-fastset:
> 
>           * shard-lnl: FAIL (Intel XE#2443) -> PASS +1 other test pass
>      * igt@xe_evict@evict-beng-mixed-many-threads-large:
> 
>           * shard-dg2-set2: TIMEOUT (Intel XE#1473) -> PASS
>      * igt@xe_evict@evict-large-multi-vm-cm:
> 
>           * {shard-bmg}: FAIL (Intel XE#2364) -> PASS
>      * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind:
> 
>           * {shard-bmg}: DMESG-WARN (Intel XE#877) -> PASS +4 other tests
>             pass
>      * igt@xe_pm_residency@toggle-gt-c6:
> 
>           * shard-lnl: FAIL (Intel XE#958) -> PASS
>      * igt@xe_wedged@wedged-at-any-timeout:
> 
>           * {shard-bmg}: SKIP (Intel XE#1130) -> PASS
>           * shard-dg2-set2: SKIP (Intel XE#1130 / Intel XE#1201) -> PASS
> 
>     Warnings
> 
>      * igt@kms_big_fb@linear-16bpp-rotate-90:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#316) -> SKIP
>             (Intel XE#316) +1 other test skip
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>           * shard-dg2-set2: SKIP (Intel XE#316) -> SKIP (Intel XE#1201 /
>             Intel XE#316) +1 other test skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1124 / Intel XE#1201) -> SKIP
>             (Intel XE#1124) +7 other tests skip
>      * igt@kms_big_fb@yf-tiled-addfb:
> 
>           * shard-dg2-set2: SKIP (Intel XE#619) -> SKIP (Intel XE#1201 /
>             Intel XE#619)
>      * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>           * shard-dg2-set2: SKIP (Intel XE#610) -> SKIP (Intel XE#1201 /
>             Intel XE#610)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1124) -> SKIP (Intel XE#1124 /
>             Intel XE#1201) +7 other tests skip
>      * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#367) -> SKIP
>             (Intel XE#367) +1 other test skip
>      * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#2191) -> SKIP
>             (Intel XE#2191)
>      * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#367) -> SKIP (Intel XE#1201 /
>             Intel XE#367) +2 other tests skip
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#787) -> SKIP
>             (Intel XE#787) +48 other tests skip
>      * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455 / Intel XE#787) -> SKIP (Intel
>             XE#1201 / Intel XE#455 / Intel XE#787) +7 other tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: SKIP (Intel XE#787) -> SKIP (Intel XE#1201 /
>             Intel XE#787) +27 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1252) -> SKIP
>             (Intel XE#1252)
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1252) -> SKIP (Intel XE#1201 /
>             Intel XE#1252) +2 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#455 / Intel
>             XE#787) -> SKIP (Intel XE#455 / Intel XE#787) +13 other tests
>             skip
>      * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
> 
>           * shard-dg2-set2: SKIP (Intel XE#314) -> SKIP (Intel XE#1201 /
>             Intel XE#314) +3 other tests skip
>      * igt@kms_chamelium_color@ctm-0-25:
> 
>           * shard-dg2-set2: SKIP (Intel XE#306) -> SKIP (Intel XE#1201 /
>             Intel XE#306) +1 other test skip
>      * igt@kms_chamelium_edid@vga-edid-read:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#373) -> SKIP
>             (Intel XE#373) +9 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
> 
>           * shard-dg2-set2: SKIP (Intel XE#373) -> SKIP (Intel XE#1201 /
>             Intel XE#373) +5 other tests skip
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#307) -> SKIP
>             (Intel XE#307) +1 other test skip
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-dg2-set2: SKIP (Intel XE#308) -> SKIP (Intel XE#1201 /
>             Intel XE#308)
>      * igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455) -> SKIP (Intel XE#1201 /
>             Intel XE#455) +12 other tests skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-dg2-set2: SKIP (Intel XE#323) -> SKIP (Intel XE#1201 /
>             Intel XE#323)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#323) -> SKIP
>             (Intel XE#323)
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-dg2-set2: SKIP (Intel XE#703) -> SKIP (Intel XE#1201 /
>             Intel XE#703)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#455) -> SKIP
>             (Intel XE#455) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#651) -> SKIP
>             (Intel XE#651) +20 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#651) -> SKIP (Intel XE#1201 /
>             Intel XE#651) +19 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
> 
>           * shard-dg2-set2: SKIP (Intel XE#653) -> SKIP (Intel XE#1201 /
>             Intel XE#653) +17 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#658) -> SKIP
>             (Intel XE#658)
>      * igt@kms_frontbuffer_tracking@psr-slowdraw:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#653) -> SKIP
>             (Intel XE#653) +19 other tests skip
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-dg2-set2: SKIP (Intel XE#356) -> SKIP (Intel XE#1201 /
>             Intel XE#356)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2763 / Intel XE#455) -> SKIP
>             (Intel XE#1201 / Intel XE#2763 / Intel XE#455) +1 other test skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2763) -> SKIP (Intel XE#1201 /
>             Intel XE#2763) +2 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#2763 / Intel
>             XE#455) -> SKIP (Intel XE#2763 / Intel XE#455) +1 other test skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#2763) -> SKIP
>             (Intel XE#2763) +2 other tests skip
>      * igt@kms_pm_backlight@fade:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#870) -> SKIP
>             (Intel XE#870)
>      * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1489) -> SKIP
>             (Intel XE#1489) +2 other tests skip
>      * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1489) -> SKIP (Intel XE#1201 /
>             Intel XE#1489)
>      * igt@kms_psr@fbc-pr-cursor-plane-move:
> 
>           * shard-dg2-set2: SKIP (Intel XE#929) -> SKIP (Intel XE#1201 /
>             Intel XE#929) +8 other tests skip
>      * igt@kms_psr@psr-dpms:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#929) -> SKIP
>             (Intel XE#929) +9 other tests skip
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1149) -> SKIP (Intel XE#1149 /
>             Intel XE#1201)
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>           * shard-dg2-set2: SKIP (Intel XE#327) -> SKIP (Intel XE#1201 /
>             Intel XE#327) +1 other test skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#327) -> SKIP
>             (Intel XE#327)
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1500) -> SKIP
>             (Intel XE#1201 / Intel XE#362)
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#756) -> SKIP
>             (Intel XE#756)
>      * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1280 / Intel
>             XE#455) -> SKIP (Intel XE#1280 / Intel XE#455) +1 other test skip
>      * igt@xe_copy_basic@mem-copy-linear-0x3fff:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1123) -> SKIP (Intel XE#1123 /
>             Intel XE#1201)
>      * igt@xe_exec_fault_mode@many-basic:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#288) -> SKIP
>             (Intel XE#288) +16 other tests skip
>      * igt@xe_exec_fault_mode@once-rebind-imm:
> 
>           * shard-dg2-set2: SKIP (Intel XE#288) -> SKIP (Intel XE#1201 /
>             Intel XE#288) +16 other tests skip
>      * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#2360) -> SKIP
>             (Intel XE#2360)
>      * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2229) -> SKIP (Intel XE#1201 /
>             Intel XE#2229)
>      * igt@xe_oa@closed-fd-and-unmapped-access:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2541) -> SKIP (Intel XE#1201 /
>             Intel XE#2541) +2 other tests skip
>      * igt@xe_oa@invalid-remove-userspace-config:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#2541) -> SKIP
>             (Intel XE#2541) +2 other tests skip
>      * igt@xe_pat@display-vs-wb-transient:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1337) -> SKIP
>             (Intel XE#1337)
>      * igt@xe_pat@pat-index-xe2:
> 
>           * shard-dg2-set2: SKIP (Intel XE#977) -> SKIP (Intel XE#1201 /
>             Intel XE#977)
>      * igt@xe_pm@vram-d3cold-threshold:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#579) -> SKIP
>             (Intel XE#579)
>      * igt@xe_query@multigpu-query-engines:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#944) -> SKIP
>             (Intel XE#944) +2 other tests skip
>      * igt@xe_query@multigpu-query-oa-units:
> 
>           * shard-dg2-set2: SKIP (Intel XE#944) -> SKIP (Intel XE#1201 /
>             Intel XE#944)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * IGT: IGT_8030 -> IGTPW_11777
> 
>    IGTPW_11777: a2ec1264835c68029b158b2659973bcaaea94a87 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8030: cb008246b0c73b2af9363c3ed0d7a3448e82953c @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990:
>    128ccc5f71d7b9d84ce8f0651aa713ae490f4990
