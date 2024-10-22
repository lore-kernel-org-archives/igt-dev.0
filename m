Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C231BD1CDD3
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 10:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2CC10E30F;
	Tue, 22 Oct 2024 10:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHUdReC+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B5710E30F;
 Tue, 22 Oct 2024 10:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729593117; x=1761129117;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KPURedIZXAhDW8AWaLoapO9qFb8Jw8bV7Q32BCwQ4yY=;
 b=OHUdReC+Zsm1DZco+STw4V49nEcReSQ7OWm3O04V2x2EzadZCbgu/Ssz
 UQqoDg75POI8ryLAlv8orfL6iEgrGQxjlfCHWVOvYwjf6Tdf+W5ikukqp
 kCtijORRG/chPj3EC2kbil7Ah6i5LlHwNTqW2EzNez0Tncy7p64+RRQmH
 jYzTpLH9SztM4j44zcRH0lKaqlThwRhN+m8+kzsqnykp44IrtMTmotRRO
 H89jiEJqLrwucae0fbGIR27eXLMru14L0iOLvpBJOkKJNzW0hYEExpXZV
 90QuccmTTy6bY2/OQQlI7oV8jrwIsBSnbI1JVd9vbTTSqDpHx+rdDcDPc Q==;
X-CSE-ConnectionGUID: FlhnbfRAQjCytLiG2Y4Aig==
X-CSE-MsgGUID: q+bWYAr+TNCoJZZcGBTiUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28899419"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28899419"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 03:31:57 -0700
X-CSE-ConnectionGUID: 1xSMlKJoS+2PVpjJfeWaVQ==
X-CSE-MsgGUID: zgYw1PVaSZSg/FsLrKh1iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="80638774"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 03:31:56 -0700
Date: Tue, 22 Oct 2024 12:31:54 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTA==?= =?utf-8?Q?=3A?= failure for
 xe_find_engine_by_class helper (rev2)
Message-ID: <20241022103154.cgyt7qolr3db6gfb@zkempczy-mobl2>
References: <20241016101933.4191790-1-pravalika.gurram@intel.com>
 <172912106298.1275991.2654929550234752868@2413ebb6fbb6>
 <BL1PR11MB552559AE20791F29562392EE84432@BL1PR11MB5525.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR11MB552559AE20791F29562392EE84432@BL1PR11MB5525.namprd11.prod.outlook.com>
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

On Mon, Oct 21, 2024 at 10:47:40AM +0000, Gurram, Pravalika wrote:
>     
> 
>     
> 
>    From: Patchwork <patchwork@emeril.freedesktop.org>
>    Sent: Thursday, October 17, 2024 4:54 AM
>    To: Gurram, Pravalika <pravalika.gurram@intel.com>
>    Cc: igt-dev@lists.freedesktop.org
>    Subject: ✗ CI.xeFULL: failure for xe_find_engine_by_class helper (rev2)
> 
>     
> 
>    Patch Details
> 
>    Series:  xe_find_engine_by_class helper (rev2)                            
>    URL:     https://patchwork.freedesktop.org/series/140001/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11921/index.html 
> 
>         CI Bug Log - changes from XEIGT_8077_full -> XEIGTPW_11921_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_11921_full absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_11921_full, please notify your bug team
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
>    XEIGTPW_11921_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      o igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>         o shard-lnl: NOTRUN -> FAIL
>      o igt@xe_drm_fdinfo@utilization-single-full-load:
>         o shard-lnl: PASS -> FAIL
> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      o igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>         o {shard-bmg}: SKIP (Intel XE#367) -> SKIP
>      o igt@kms_cursor_crc@cursor-random-128x42:
>         o {shard-bmg}: SKIP (Intel XE#2320) -> SKIP +1 other test skip
>      o igt@kms_vblank@query-forked-busy:
>         o {shard-bmg}: PASS -> SKIP
> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_11921_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      o igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#623)
>      o igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
>         o shard-lnl: NOTRUN -> FAIL (Intel XE#911) +2 other tests fail
>      o igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>         o shard-lnl: PASS -> FAIL (Intel XE#1701) +1 other test fail
>      o igt@kms_big_fb@4-tiled-32bpp-rotate-180:
>         o shard-dg2-set2: PASS -> SKIP (Intel XE#2890)
>      o igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#316) +1 other test skip
>      o igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
>         o shard-dg2-set2: PASS -> SKIP (Intel XE#2351 / Intel XE#2890) +2
>           other tests skip
>      o igt@kms_big_fb@linear-64bpp-rotate-180:
>         o shard-dg2-set2: NOTRUN -> DMESG-WARN (Intel XE#877)
>      o igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#1407)
>      o igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2890)
>      o igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#1124) +3 other tests skip
>      o igt@kms_big_fb@yf-tiled-addfb:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#619)
>      o igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124) +9 other tests skip
>      o igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#367) +4 other tests skip
>      o igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +21
>           other tests skip
>      o igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +83 other tests skip
>      o igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +6 other tests skip
>      o igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2907) +2 other tests skip
>      o igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#2669) +3 other tests skip
>      o igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>         o shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1195)
>      o igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>         o shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#1195 / Intel
>           XE#1727)
>      o igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
>         o shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#1195)
>      o igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
>         o shard-dg2-set2: NOTRUN -> DMESG-WARN (Intel XE#3113)
>      o igt@kms_chamelium_color@ctm-blue-to-red:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#306) +1 other test skip
>      o igt@kms_chamelium_edid@hdmi-mode-timings:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#373) +8 other tests skip
>      o igt@kms_chamelium_frames@dp-crc-single:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#373)
>      o igt@kms_content_protection@srm@pipe-a-dp-4:
>         o shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1178) +3 other tests fail
>      o igt@kms_cursor_crc@cursor-random-128x42:
>         o shard-dg2-set2: PASS -> SKIP (Intel XE#2423 / i915#2575) +2 other
>           tests skip
>      o igt@kms_cursor_crc@cursor-random-512x512:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#308)
>      o igt@kms_cursor_crc@cursor-rapid-movement-128x42:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#1424) +3 other tests skip
>      o igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#323) +3 other tests skip
>      o igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#309) +1 other test skip
>      o igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>         o shard-lnl: PASS -> FAIL (Intel XE#1475) +1 other test fail
>      o igt@kms_fbcon_fbt@psr-suspend:
>         o shard-lnl: PASS -> FAIL (Intel XE#2958)
>      o igt@kms_feature_discovery@dp-mst:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1137)
>      o igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#1421) +3 other tests skip
>      o igt@kms_flip@blocking-wf_vblank:
>         o shard-lnl: PASS -> FAIL (Intel XE#886) +8 other tests fail
>      o igt@kms_flip@flip-vs-absolute-wf_vblank:
>         o shard-lnl: NOTRUN -> FAIL (Intel XE#886) +2 other tests fail
>      o igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:
>         o shard-dg2-set2: NOTRUN -> FAIL (Intel XE#301)
>      o igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
>         o shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1204)
>      o igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#1401 / Intel XE#1745)
>      o igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#1401)
>      o igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#1397 / Intel XE#1745)
>      o igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#1397)
>      o igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +25 other tests skip
>      o igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#656) +9 other tests skip
>      o igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#651) +2 other tests skip
>      o igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#658)
>      o igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +23 other tests skip
>      o igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2351 / Intel XE#2890)
>      o igt@kms_hdr@invalid-hdr:
>         o shard-dg2-set2: PASS -> SKIP (Intel XE#455)
>      o igt@kms_plane@plane-position-covered@pipe-a-plane-1:
>         o shard-lnl: PASS -> DMESG-FAIL (Intel XE#324)
>      o igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:
>         o shard-lnl: PASS -> DMESG-WARN (Intel XE#324) +7 other tests
>           dmesg-warn
>      o igt@kms_plane_lowres@tiling-4:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#599) +3 other tests skip
>      o igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>         o shard-dg2-set2: PASS -> FAIL (Intel XE#361)
>      o igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#2763) +3 other tests skip
>      o igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2763) +2 other tests skip
>      o igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2763 / Intel XE#455)
>      o igt@kms_pm_backlight@fade:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#870)
>      o igt@kms_pm_dc@deep-pkgc:
>         o shard-lnl: PASS -> FAIL (Intel XE#2029)
>      o igt@kms_pm_rpm@universal-planes:
>         o shard-lnl: PASS -> INCOMPLETE (Intel XE#1620 / Intel XE#2864)
>      o igt@kms_pm_rpm@universal-planes@plane-32:
>         o shard-lnl: PASS -> DMESG-FAIL (Intel XE#1620)
>      o igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1489) +6 other tests skip
>      o igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#2893) +1 other test skip
>      o igt@kms_psr2_su@page_flip-p010:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1122)
>      o igt@kms_psr@fbc-pr-cursor-plane-move:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2850 / Intel XE#929) +11
>           other tests skip
>      o igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>         o shard-lnl: PASS -> FAIL (Intel XE#2948) +7 other tests fail
>      o igt@kms_psr@pr-cursor-plane-onoff:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#1406) +1 other test skip
>      o igt@kms_rotation_crc@primary-rotation-180:
>         o shard-lnl: PASS -> DMESG-WARN (Intel XE#2055)
>      o igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1127)
>      o igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#1437)
>      o igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#1127)
>      o igt@kms_rotation_crc@sprite-rotation-270:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#327) +3 other tests skip
>      o igt@kms_vrr@flip-basic:
>         o shard-lnl: PASS -> FAIL (Intel XE#2443) +1 other test fail
>      o igt@kms_vrr@flipline:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +16 other tests skip
>      o igt@kms_vrr@max-min:
>         o shard-lnl: NOTRUN -> FAIL (Intel XE#2443) +1 other test fail
>      o igt@kms_writeback@writeback-fb-id:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#756) +1 other test skip
>      o igt@sriov_basic@enable-vfs-autoprobe-off:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1091 / Intel XE#2849)
>      o igt@xe_compute_preempt@compute-preempt-many:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1280 / Intel XE#455) +1
>           other test skip
>      o igt@xe_copy_basic@mem-set-linear-0xfffe:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1126) +1 other test skip
>      o igt@xe_eudebug@basic-connect:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#2905) +3 other tests skip
>      o igt@xe_eudebug@basic-vm-access-parameters:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2905) +8 other tests skip
>      o igt@xe_evict@evict-cm-threads-small-multi-vm:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#688) +1 other test skip
>      o igt@xe_exec_basic@multigpu-no-exec-basic:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +1 other test skip
>      o igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288) +24 other tests skip
>      o igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2360)
>      o igt@xe_exec_reset@cm-close-execqueues-close-fd:
>         o shard-lnl: PASS -> FAIL (Intel XE#1081)
>         o shard-dg2-set2: PASS -> FAIL (Intel XE#1081)
>      o igt@xe_exec_sip@invalidinstr-disabled:
>         o shard-dg2-set2: PASS -> SKIP (Intel XE#1130) +7 other tests skip
>      o igt@xe_exec_threads@threads-cm-userptr-invalidate:
>         o shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1169 / Intel XE#1195 /
>           Intel XE#1356)
>      o igt@xe_fault_injection@inject-fault-probe:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2931)
>      o igt@xe_gt_freq@freq_suspend:
>         o shard-dg2-set2: PASS -> ABORT (Intel XE#2625)
>      o igt@xe_huc_copy@huc_copy:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#255)
>      o igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#2229)
>      o igt@xe_media_fill@media-fill:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#560)
>      o igt@xe_module_load@force-load:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#378)
>      o igt@xe_oa@mmio-triggered-reports:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2541) +5 other tests skip
>      o igt@xe_pat@pat-index-xelp:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1130) +2 other tests skip
>      o igt@xe_pat@pat-index-xelpg:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#979)
>      o igt@xe_pm@s3-d3cold-basic-exec:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366)
>      o igt@xe_pm@s4-basic:
>         o shard-lnl: PASS -> ABORT (Intel XE#1358 / Intel XE#1607)
>      o igt@xe_pm@s4-multiple-execs:
>         o shard-dg2-set2: PASS -> ABORT (Intel XE#1358 / Intel XE#1794)
>      o igt@xe_pm_residency@toggle-gt-c6:
>         o shard-lnl: PASS -> FAIL (Intel XE#958)
>      o igt@xe_query@multigpu-query-engines:
>         o shard-dg2-set2: NOTRUN -> SKIP (Intel XE#944) +4 other tests skip
>      o igt@xe_query@multigpu-query-mem-usage:
>         o shard-lnl: NOTRUN -> SKIP (Intel XE#944) +1 other test skip
> 
>     Possible fixes
> 
>      o igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs:
>         o shard-lnl: INCOMPLETE -> PASS
>      o igt@kms_atomic_transition@modeset-transition-nonblocking:
>         o shard-lnl: FAIL (Intel XE#1701) -> PASS +1 other test pass
>      o igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
>         o shard-dg2-set2: FAIL (Intel XE#1426) -> PASS +1 other test pass
>      o igt@kms_big_fb@x-tiled-16bpp-rotate-0:
>         o {shard-bmg}: SKIP (Intel XE#2231) -> PASS +2 other tests pass
>      o igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>         o {shard-bmg}: SKIP (Intel XE#2231 / Intel XE#2890) -> PASS +1 other
>           test pass
>      o igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>         o shard-dg2-set2: SKIP (Intel XE#2890) -> PASS +7 other tests pass
>      o igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
>         o shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#2890) -> PASS +2
>           other tests pass
>      o igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>         o shard-lnl: FAIL (Intel XE#1475) -> PASS
>      o igt@kms_display_modes@extended-mode-basic:
>         o {shard-bmg}: DMESG-WARN (Intel XE#877) -> PASS +3 other tests pass
>      o igt@kms_feature_discovery@display-1x:
>         o {shard-bmg}: SKIP -> PASS +15 other tests pass
>      o igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
>         o shard-dg2-set2: FAIL (Intel XE#301) -> PASS +5 other tests pass
>      o igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
>         o {shard-bmg}: FAIL (Intel XE#301) -> PASS +1 other test pass
>      o igt@kms_flip@2x-flip-vs-panning-vs-hang:
>         o {shard-bmg}: SKIP (Intel XE#3007) -> PASS +2 other tests pass
>      o igt@kms_flip@plain-flip-ts-check@c-edp1:
>         o shard-lnl: FAIL (Intel XE#886) -> PASS +3 other tests pass
>      o igt@kms_lease@lease-uevent:
>         o shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> PASS +13 other
>           tests pass
>      o igt@kms_plane@plane-panning-bottom-right-suspend:
>         o shard-dg2-set2: ABORT (Intel XE#1035 / Intel XE#2625) -> PASS +1
>           other test pass
>      o igt@kms_plane@plane-position-covered@pipe-b-plane-4:
>         o shard-lnl: DMESG-WARN (Intel XE#324) -> PASS +3 other tests pass
>      o igt@kms_plane@plane-position-hole:
>         o shard-lnl: DMESG-FAIL (Intel XE#324) -> PASS +1 other test pass
>      o igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>         o shard-dg2-set2: FAIL (Intel XE#361) -> PASS
>      o igt@kms_pm_dc@dc5-dpms:
>         o shard-lnl: FAIL (Intel XE#718) -> PASS
>      o igt@kms_pm_dc@dc6-psr:
>         o shard-lnl: FAIL (Intel XE#1430) -> PASS
>      o igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>         o shard-lnl: DMESG-FAIL (Intel XE#1620) -> PASS
>      o igt@kms_pm_rpm@legacy-planes:
>         o shard-lnl: INCOMPLETE (Intel XE#1620 / Intel XE#2864) -> PASS
>      o igt@kms_pm_rpm@legacy-planes@plane-41:
>         o shard-lnl: DMESG-WARN (Intel XE#1620) -> PASS
>      o igt@kms_pm_rpm@legacy-planes@plane-50:
>         o shard-lnl: FAIL -> PASS +2 other tests pass
>      o igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
>         o shard-lnl: FAIL (Intel XE#1649) -> PASS +1 other test pass
>      o igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>         o shard-lnl: FAIL (Intel XE#899) -> PASS +3 other tests pass
>      o igt@kms_vrr@flipline:
>         o shard-lnl: FAIL (Intel XE#2443) -> PASS +3 other tests pass
>      o igt@xe_evict@evict-beng-threads-large:
>         o {shard-bmg}: TIMEOUT (Intel XE#1473) -> PASS
>      o igt@xe_evict@evict-mixed-many-threads-small:
>         o shard-dg2-set2: TIMEOUT (Intel XE#1473) -> PASS
>      o igt@xe_evict@evict-mixed-threads-large:
>         o shard-dg2-set2: FAIL (Intel XE#1000) -> PASS
>      o igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:
>         o shard-dg2-set2: SKIP (Intel XE#1130) -> PASS +27 other tests pass
>      o igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race:
>         o shard-lnl: FAIL (Intel XE#2754) -> PASS
>      o igt@xe_exec_reset@close-execqueues-close-fd:
>         o {shard-bmg}: DMESG-WARN -> PASS
>      o igt@xe_exec_reset@cm-close-fd:
>         o shard-dg2-set2: FAIL -> PASS
>      o igt@xe_exec_reset@parallel-gt-reset:
>         o shard-dg2-set2: TIMEOUT (Intel XE#2105) -> PASS
>      o igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>         o {shard-bmg}: INCOMPLETE (Intel XE#2998) -> PASS +1 other test pass
>      o igt@xe_live_ktest@xe_migrate:
>         o shard-lnl: SKIP (Intel XE#1192) -> PASS
>      o igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
>         o {shard-bmg}: FAIL (Intel XE#3099) -> PASS +2 other tests pass
>      o igt@xe_pm@s2idle-basic:
>         o shard-dg2-set2: ABORT (Intel XE#1358 / Intel XE#1794) -> PASS
>      o igt@xe_pm@s2idle-basic-exec:
>         o {shard-bmg}: SKIP (Intel XE#1130) -> PASS +38 other tests pass
>      o igt@xe_pm@s4-vm-bind-unbind-all:
>         o shard-lnl: ABORT (Intel XE#1794) -> PASS
> 
>     Warnings
> 
>      o igt@kms_async_flips@async-flip-with-page-flip-events:
>         o shard-lnl: INCOMPLETE -> FAIL (Intel XE#911)
>      o igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>         o shard-dg2-set2: SKIP (Intel XE#2890) -> SKIP (Intel XE#1124) +1
>           other test skip
>      o igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>         o shard-dg2-set2: SKIP (Intel XE#367) -> SKIP (Intel XE#2423 /
>           i915#2575)
>      o igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>         o shard-dg2-set2: INCOMPLETE (Intel XE#1195) -> INCOMPLETE (Intel
>           XE#1195 / Intel XE#1727)
>      o igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
>         o shard-dg2-set2: SKIP (Intel XE#2890) -> SKIP (Intel XE#455 / Intel
>           XE#787) +1 other test skip
>      o igt@kms_chamelium_hpd@vga-hpd-fast:
>         o shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel
>           XE#373) +2 other tests skip
>      o igt@kms_content_protection@atomic:
>         o shard-dg2-set2: INCOMPLETE (Intel XE#1195 / Intel XE#2715) -> FAIL
>           (Intel XE#1178)
>      o igt@kms_content_protection@atomic@pipe-a-dp-4:
>         o shard-dg2-set2: INCOMPLETE (Intel XE#1195) -> FAIL (Intel XE#1178)
>      o igt@kms_flip@flip-vs-expired-vblank-interruptible:
>         o shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> FAIL (Intel
>           XE#301)
>      o igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
>         o shard-dg2-set2: SKIP (Intel XE#455) -> SKIP (Intel XE#2351 / Intel
>           XE#2890)
>      o igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>         o shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#2890) -> SKIP (Intel
>           XE#455)
>      o igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>         o shard-dg2-set2: SKIP (Intel XE#2890) -> SKIP (Intel XE#651) +3
>           other tests skip
>      o igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
>         o shard-dg2-set2: SKIP (Intel XE#651) -> SKIP (Intel XE#2890)
>      o igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>         o shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#2890) -> SKIP (Intel
>           XE#651)
>      o igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
>         o shard-dg2-set2: SKIP (Intel XE#2890) -> SKIP (Intel XE#653) +2
>           other tests skip
>      o igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
>         o shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#2890) -> SKIP (Intel
>           XE#653) +1 other test skip
>      o igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>         o shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel
>           XE#2763 / Intel XE#455)
>      o igt@kms_pm_dc@dc5-psr:
>         o shard-dg2-set2: SKIP (Intel XE#2890) -> SKIP (Intel XE#1129)
>      o igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
>         o shard-dg2-set2: SKIP (Intel XE#2890) -> SKIP (Intel XE#1489) +2
>           other tests skip
>      o igt@kms_psr@fbc-psr2-sprite-blt:
>         o shard-dg2-set2: SKIP (Intel XE#2850 / Intel XE#929) -> SKIP (Intel
>           XE#2351 / Intel XE#2890)
>      o igt@kms_psr@pr-dpms:
>         o shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#2890) -> SKIP (Intel
>           XE#2850 / Intel XE#929) +1 other test skip
>      o igt@kms_psr@psr2-cursor-render:
>         o shard-dg2-set2: SKIP (Intel XE#2890) -> SKIP (Intel XE#2850 / Intel
>           XE#929)
>      o igt@kms_scaling_modes@scaling-mode-full-aspect:
>         o shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel
>           XE#455) +1 other test skip
>      o igt@kms_tiled_display@basic-test-pattern:
>         o shard-dg2-set2: FAIL (Intel XE#1729) -> SKIP (Intel XE#362)
>      o igt@xe_eudebug@multiple-sessions:
>         o shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#2905) +1
>           other test skip
>      o igt@xe_eudebug@sysfs-toggle:
>         o shard-dg2-set2: SKIP (Intel XE#2905) -> SKIP (Intel XE#1130) +1
>           other test skip
>      o igt@xe_evict@evict-beng-mixed-many-threads-large:
>         o shard-dg2-set2: SKIP (Intel XE#1130) -> TIMEOUT (Intel XE#1473)
>      o igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:
>         o shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#288) +5
>           other tests skip
>      o igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>         o shard-dg2-set2: SKIP (Intel XE#288) -> SKIP (Intel XE#1130) +1
>           other test skip
>      o igt@xe_oa@invalid-oa-metric-set-id:
>         o shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#2541) +1
>           other test skip
>      o igt@xe_pm@s2idle-basic-exec:
>         o shard-dg2-set2: SKIP (Intel XE#1130) -> ABORT (Intel XE#1358)
>      o igt@xe_query@multigpu-query-topology-l3-bank-mask:
>         o shard-dg2-set2: SKIP (Intel XE#944) -> SKIP (Intel XE#1130)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>    Above are unrelated to change in xe_exec_compute_mode test and xe_query.

It is very hard to find your answer here. Check how your email client
supports quoting to indent and mark message text you're replying to.

--
Zbigniew

> 
>     
> 
> Build changes
> 
>      o IGT: IGT_8077 -> IGTPW_11921
> 
>    IGTPW_11921: 3fe31edf1e9ef420e80c408980c13b30fb81070b @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8077: 42f9e9702f74a4993318adea936baaa186084689 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519:
>    12e4970af1ecdeb76e94df2daf51a9c3d6b9f519
