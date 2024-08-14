Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013FCC52D7F
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 08:52:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FDA10E436;
	Wed, 14 Aug 2024 08:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cgZhHgQU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D19F10E431;
 Wed, 14 Aug 2024 08:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723625545; x=1755161545;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eH3y/g4oUeWgfiHPonmQb6DYSPJHZcYjDmU3grwyd9E=;
 b=cgZhHgQUp5lhdz6TwwTfDJ3GaZBItMJVmFNCsiwPca5OkagnK2DPtt7x
 Uu2WaIptdl06vF9DXd8NHJdKLqmV92cvDPp8hD87YJ/E0B6hFIo2QTUG9
 5ghKGOpqM5w+9mH4+xnAisj0BXKR9PLpO/CcOZT89sot99zCTIVVHI2D4
 rH2+XNM2Q4dmpL2X49cQtgNdfK48EnBkQ68Seb3RcRVXErObsa0m1NRbF
 LO3OagpXzU/upzhuPp/HPybP2R2Ohm03CC2iQmFL5p0EmL8KNc7I7+4a5
 m4TtzJQtTVT4i43H9tscE4qzLEkDttk9KgpqIMucbdxoGOfOD5z2fGkI8 A==;
X-CSE-ConnectionGUID: K/a9h+hCQgS+tv66CAAx1A==
X-CSE-MsgGUID: CB+0nMY/Q5yOMf1s1N/f4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="25629921"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="25629921"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 01:52:24 -0700
X-CSE-ConnectionGUID: ajiMpOFCSwSP4SwqVV1Fhg==
X-CSE-MsgGUID: a9jT9JH7SLGaGGYt2ZcTmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="59708332"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.48])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 01:52:22 -0700
Date: Wed, 14 Aug 2024 10:52:17 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_lib|tests?=
 =?utf-8?Q?=3A?= Don't dereference engine outside for_each_ctx_engine macro
Message-ID: <20240814085217.xsfzrgbob3ilyake@zkempczy-mobl2>
References: <20240813124536.66551-1-zbigniew.kempczynski@intel.com>
 <172356591965.613595.3116177232040338565@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172356591965.613595.3116177232040338565@2413ebb6fbb6>
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

On Tue, Aug 13, 2024 at 04:18:39PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib|tests: Don't dereference engine outside for_each_ctx_engine   
>             macro                                                             
>    URL:     https://patchwork.freedesktop.org/series/137235/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11566/index.html  
> 
>         CI Bug Log - changes from XEIGT_7967_full -> XEIGTPW_11566_full
> 
> Summary
> 
>    WARNING
> 
>    Minor unknown changes coming with XEIGTPW_11566_full need to be verified
>    manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_11566_full, please notify your bug team
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
>    XEIGTPW_11566_full:
> 
>   IGT changes
> 
>     Warnings
> 
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#455) -> SKIP
>      * igt@xe_oa@invalid-create-userspace-config:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201) -> SKIP +5 other tests skip
> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * igt@kms_content_protection@mei-interface:
> 
>           * {shard-bmg}: SKIP (Intel XE#2341) -> SKIP
>      * igt@kms_cursor_crc@cursor-suspend:
> 
>           * {shard-bmg}: FAIL (Intel XE#2428) -> INCOMPLETE +1 other test
>             incomplete

Change touches igt_fb but in part used by i915, not Xe so above
is not related to the change.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_11566_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#911) +3 other tests fail
>      * igt@kms_async_flips@invalid-async-flip:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#873)
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124 / Intel XE#1201) +1
>             other test skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124) +2 other tests skip
>      * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2191)
>      * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1399) +1 other test skip
>      * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +6 other tests skip
>      * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +1
>             other test skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#787) +6
>             other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#455 /
>             Intel XE#787) +1 other test skip
>      * igt@kms_chamelium_color@ctm-0-75:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#306)
>      * igt@kms_chamelium_hpd@common-hpd-after-suspend:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#373)
>      * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1188) +1 other test fail
>      * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424)
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#703)
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#2019) +2 other tests
>             dmesg-warn
>      * igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1195)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401 / Intel XE#1745)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401)
>      * igt@kms_force_connector_basic@prune-stale-modes:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#352)
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#616)
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#651) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +4 other tests skip
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1503 / Intel XE#599)
>      * igt@kms_plane@plane-panning-bottom-right-suspend:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#2028) +5 other tests fail
>      * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:
> 
>           * shard-lnl: PASS -> DMESG-WARN (Intel XE#324) +2 other tests
>             dmesg-warn
>      * igt@kms_pm_backlight@basic-brightness:
> 
>           * shard-lnl: PASS -> SKIP (Intel XE#870)
>      * igt@kms_psr@fbc-pr-sprite-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406)
>      * igt@kms_psr@fbc-psr-sprite-render:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#929) +1
>             other test skip
>      * igt@kms_psr@psr-sprite-plane-onoff:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#929)
>      * igt@xe_evict@evict-beng-large-external-cm:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#688)
>      * igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1195 / Intel XE#1473
>             / Intel XE#402)
>      * igt@xe_evict@evict-beng-mixed-threads-large:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1195 / Intel
>             XE#1473) +1 other test incomplete
>      * igt@xe_evict@evict-threads-large:
> 
>           * shard-dg2-set2: PASS -> TIMEOUT (Intel XE#1473)
>      * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#288) +1
>             other test skip
>      * igt@xe_oa@oa-regs-whitelisted@rcs-0:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#2514)
>      * igt@xe_pat@pat-index-xehpc:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#979)
>      * igt@xe_pm@s2idle-d3cold-basic-exec:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366)
>      * igt@xe_pm@s3-multiple-execs:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#1551 / Intel XE#569)
>      * igt@xe_pm@s3-vm-bind-unbind-all:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#1162 / Intel XE#1941
>             / Intel XE#569)
> 
>     Possible fixes
> 
>      * igt@fbdev@unaligned-read:
> 
>           * {shard-bmg}: DMESG-WARN (Intel XE#877) -> PASS
>      * igt@kms_async_flips@async-flip-with-page-flip-events:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1705) -> PASS
>      * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: FAIL (Intel XE#1426) -> PASS +3 other tests pass
>      * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
> 
>           * shard-lnl: FAIL (Intel XE#1426) -> PASS +1 other test pass
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-lnl: FAIL (Intel XE#1659) -> PASS
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3:
> 
>           * {shard-bmg}: FAIL (Intel XE#2436) -> PASS
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * {shard-bmg}: INCOMPLETE -> PASS +3 other tests pass
>      * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#2019) -> PASS
>      * igt@kms_plane@plane-position-covered:
> 
>           * shard-lnl: DMESG-WARN (Intel XE#324) -> PASS +1 other test pass
>      * igt@kms_plane_lowres@tiling-4@pipe-b-dp-2:
> 
>           * {shard-bmg}: FAIL (Intel XE#2058) -> PASS +2 other tests pass
>      * igt@kms_pm_backlight@fade-with-dpms:
> 
>           * shard-lnl: SKIP (Intel XE#870) -> PASS
>      * igt@kms_pm_dc@dc5-dpms:
> 
>           * shard-lnl: FAIL (Intel XE#718) -> PASS
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
> 
>           * shard-lnl: DMESG-WARN (Intel XE#1705) -> PASS +1 other test pass
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2:
> 
>           * {shard-bmg}: FAIL (Intel XE#899) -> PASS
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
> 
>           * shard-lnl: FAIL (Intel XE#899) -> PASS +1 other test pass
>      * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1:
> 
>           * shard-lnl: FAIL -> PASS +1 other test pass
>      * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
> 
>           * shard-lnl: FAIL (Intel XE#2028) -> PASS +4 other tests pass
>      * igt@kms_vrr@flip-basic:
> 
>           * shard-lnl: FAIL (Intel XE#2443) -> PASS +1 other test pass
>      * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
> 
>           * shard-dg2-set2: DMESG-WARN -> PASS +1 other test pass
>      * igt@xe_evict@evict-beng-mixed-threads-large:
> 
>           * {shard-bmg}: TIMEOUT (Intel XE#1473) -> PASS
>      * igt@xe_evict@evict-cm-threads-large:
> 
>           * shard-dg2-set2: TIMEOUT (Intel XE#1473) -> PASS
>      * igt@xe_evict@evict-large-multi-vm-cm:
> 
>           * shard-dg2-set2: FAIL (Intel XE#1600) -> PASS
>      * igt@xe_evict@evict-threads-large:
> 
>           * {shard-bmg}: TIMEOUT (Intel XE#1473 / Intel XE#2472) -> PASS +1
>             other test pass
>      * igt@xe_module_load@unload:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1551 / Intel XE#2019) ->
>             PASS
>      * igt@xe_oa@mmio-triggered-reports:
> 
>           * {shard-bmg}: FAIL (Intel XE#2249) -> PASS
>      * igt@xe_pm@s4-d3hot-basic-exec:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1195 / Intel XE#1358) ->
>             PASS
>      * igt@xe_pm_residency@toggle-gt-c6:
> 
>           * shard-lnl: FAIL (Intel XE#958) -> PASS
> 
>     Warnings
> 
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#623) -> SKIP
>             (Intel XE#623)
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#316) -> SKIP
>             (Intel XE#316) +3 other tests skip
>      * igt@kms_big_fb@linear-16bpp-rotate-90:
> 
>           * shard-dg2-set2: SKIP (Intel XE#316) -> SKIP (Intel XE#1201 /
>             Intel XE#316) +4 other tests skip
>      * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>           * shard-dg2-set2: SKIP (Intel XE#607) -> SKIP (Intel XE#1201 /
>             Intel XE#607)
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1124 / Intel XE#1201) -> SKIP
>             (Intel XE#1124) +10 other tests skip
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1124) -> SKIP (Intel XE#1124 /
>             Intel XE#1201) +10 other tests skip
>      * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2191) -> SKIP (Intel XE#1201 /
>             Intel XE#2191)
>      * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#2191) -> SKIP
>             (Intel XE#2191)
>      * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#367) -> SKIP (Intel XE#1201 /
>             Intel XE#367) +3 other tests skip
>      * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#787) -> SKIP
>             (Intel XE#787) +76 other tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: SKIP (Intel XE#787) -> SKIP (Intel XE#1201 /
>             Intel XE#787) +83 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#455 / Intel
>             XE#787) -> SKIP (Intel XE#455 / Intel XE#787) +21 other tests
>             skip
>      * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455 / Intel XE#787) -> SKIP (Intel
>             XE#1201 / Intel XE#455 / Intel XE#787) +23 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1252) -> SKIP (Intel XE#1201 /
>             Intel XE#1252)
>      * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
> 
>           * shard-dg2-set2: SKIP (Intel XE#314) -> SKIP (Intel XE#1201 /
>             Intel XE#314) +3 other tests skip
>      * igt@kms_chamelium_color@ctm-0-50:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#306) -> SKIP
>             (Intel XE#306) +1 other test skip
>      * igt@kms_chamelium_color@ctm-blue-to-red:
> 
>           * shard-dg2-set2: SKIP (Intel XE#306) -> SKIP (Intel XE#1201 /
>             Intel XE#306)
>      * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#373) -> SKIP
>             (Intel XE#373) +5 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd:
> 
>           * shard-dg2-set2: SKIP (Intel XE#373) -> SKIP (Intel XE#1201 /
>             Intel XE#373) +9 other tests skip
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-dg2-set2: SKIP (Intel XE#307) -> SKIP (Intel XE#1201 /
>             Intel XE#307)
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> 
>           * shard-dg2-set2: SKIP (Intel XE#308) -> SKIP (Intel XE#1201 /
>             Intel XE#308) +1 other test skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#323) -> SKIP
>             (Intel XE#323) +1 other test skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-dg2-set2: SKIP (Intel XE#323) -> SKIP (Intel XE#1201 /
>             Intel XE#323)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / i915#3804) -> SKIP
>             (i915#3804)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-dg2-set2: SKIP (Intel XE#776) -> SKIP (Intel XE#1201 /
>             Intel XE#776)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-dg2-set2: SKIP (Intel XE#701) -> SKIP (Intel XE#1201 /
>             Intel XE#701)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1138) -> SKIP (Intel XE#1138 /
>             Intel XE#1201)
>      * igt@kms_feature_discovery@psr1:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1135 / Intel XE#1201) -> SKIP
>             (Intel XE#1135) +1 other test skip
>      * igt@kms_flip@2x-flip-vs-suspend:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#2019) -> INCOMPLETE (Intel
>             XE#1195 / Intel XE#2019)
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
> 
>           * shard-dg2-set2: SKIP (Intel XE#651) -> SKIP (Intel XE#1201 /
>             Intel XE#651) +33 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#651) -> SKIP
>             (Intel XE#651) +26 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>           * shard-dg2-set2: SKIP (Intel XE#658) -> SKIP (Intel XE#1201 /
>             Intel XE#658)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#653) -> SKIP (Intel XE#1201 /
>             Intel XE#653) +24 other tests skip
>      * igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1158) -> SKIP (Intel XE#1158 /
>             Intel XE#1201)
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#653) -> SKIP
>             (Intel XE#653) +18 other tests skip
>      * igt@kms_getfb@getfb-reject-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#605) -> SKIP (Intel XE#1201 /
>             Intel XE#605)
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#455) -> SKIP
>             (Intel XE#455) +9 other tests skip
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-dg2-set2: SKIP (Intel XE#356) -> SKIP (Intel XE#1201 /
>             Intel XE#356)
>      * igt@kms_plane_lowres@tiling-y:
> 
>           * shard-dg2-set2: SKIP (Intel XE#455) -> SKIP (Intel XE#1201 /
>             Intel XE#455) +17 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#2318 / Intel
>             XE#455) -> SKIP (Intel XE#2318 / Intel XE#455) +3 other tests
>             skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#2318) -> SKIP
>             (Intel XE#2318) +5 other tests skip
>      * igt@kms_pm_backlight@fade-with-dpms:
> 
>           * shard-dg2-set2: SKIP (Intel XE#870) -> SKIP (Intel XE#1201 /
>             Intel XE#870) +1 other test skip
>      * igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1122 / Intel XE#1201) -> SKIP
>             (Intel XE#1122) +1 other test skip
>           * shard-lnl: SKIP (Intel XE#736) -> SKIP (Intel XE#1909)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-dg2-set2: SKIP (Intel XE#908) -> SKIP (Intel XE#1201 /
>             Intel XE#908)
>      * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1489) -> SKIP
>             (Intel XE#1489) +2 other tests skip
>      * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1489) -> SKIP (Intel XE#1201 /
>             Intel XE#1489) +3 other tests skip
>      * igt@kms_psr@fbc-psr2-dpms:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#929) -> SKIP
>             (Intel XE#929) +10 other tests skip
>      * igt@kms_psr@psr-dpms:
> 
>           * shard-dg2-set2: SKIP (Intel XE#929) -> SKIP (Intel XE#1201 /
>             Intel XE#929) +15 other tests skip
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1149) -> SKIP (Intel XE#1149 /
>             Intel XE#1201)
>      * igt@kms_rotation_crc@bad-tiling:
> 
>           * shard-dg2-set2: SKIP (Intel XE#327) -> SKIP (Intel XE#1201 /
>             Intel XE#327) +1 other test skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#327) -> SKIP
>             (Intel XE#327)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1127) -> SKIP (Intel XE#1127 /
>             Intel XE#1201)
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#362) -> SKIP
>             (Intel XE#1201 / Intel XE#1500)
>      * igt@kms_tv_load_detect@load-detect:
> 
>           * shard-dg2-set2: SKIP (Intel XE#330) -> SKIP (Intel XE#1201 /
>             Intel XE#330)
>      * igt@kms_vrr@cmrr:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#2168) -> SKIP
>             (Intel XE#2168)
>      * igt@xe_compute_preempt@compute-preempt-many:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1280 / Intel XE#455) -> SKIP
>             (Intel XE#1201 / Intel XE#1280 / Intel XE#455) +1 other test skip
>      * igt@xe_copy_basic@mem-copy-linear-0xfd:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1123 / Intel XE#1201) -> SKIP
>             (Intel XE#1123)
>      * igt@xe_copy_basic@mem-copy-linear-0xfffe:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1123) -> SKIP (Intel XE#1123 /
>             Intel XE#1201)
>      * igt@xe_copy_basic@mem-set-linear-0x3fff:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1126) -> SKIP (Intel XE#1126 /
>             Intel XE#1201)
>      * igt@xe_evict@evict-beng-threads-large:
> 
>           * shard-dg2-set2: TIMEOUT (Intel XE#1473) -> FAIL (Intel XE#1000)
>      * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#288) -> SKIP
>             (Intel XE#288) +18 other tests skip
>      * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
> 
>           * shard-dg2-set2: SKIP (Intel XE#288) -> SKIP (Intel XE#1201 /
>             Intel XE#288) +25 other tests skip
>      * igt@xe_module_load@load:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#378) -> SKIP
>             (Intel XE#378)
>      * igt@xe_oa@closed-fd-and-unmapped-access:
> 
>           * shard-dg2-set2: SKIP -> SKIP (Intel XE#1201) +8 other tests skip
>      * igt@xe_pm@s4-d3cold-basic-exec:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#2284 / Intel
>             XE#366) -> SKIP (Intel XE#2284 / Intel XE#366)
>      * igt@xe_pm@vram-d3cold-threshold:
> 
>           * shard-dg2-set2: SKIP (Intel XE#579) -> SKIP (Intel XE#1201 /
>             Intel XE#579)
>      * igt@xe_query@multigpu-query-engines:
> 
>           * shard-dg2-set2: SKIP (Intel XE#944) -> SKIP (Intel XE#1201 /
>             Intel XE#944) +1 other test skip
>      * igt@xe_query@multigpu-query-mem-usage:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#944) -> SKIP
>             (Intel XE#944)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * IGT: IGT_7967 -> IGTPW_11566
>      * Linux: xe-1756-bb06cec392c188bc980be5cee9a85240ce866b78 ->
>        xe-1759-924db73e261b7bfd4b70b14db61197f48bf09426
> 
>    IGTPW_11566: 11566
>    IGT_7967: 290bdef9033c8b185922f02cd05d62fcc0091c15 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-1756-bb06cec392c188bc980be5cee9a85240ce866b78:
>    bb06cec392c188bc980be5cee9a85240ce866b78
>    xe-1759-924db73e261b7bfd4b70b14db61197f48bf09426:
>    924db73e261b7bfd4b70b14db61197f48bf09426
