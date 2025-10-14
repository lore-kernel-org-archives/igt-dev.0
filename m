Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B48FCCD184
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 10:30:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2139910E5AC;
	Tue, 14 Oct 2025 10:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GVeC6zqB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058E210E5AC
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 10:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760437846; x=1791973846;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MbWOyxwZ6aevUmpZFMt3Gfqn6TL/aMF2Vy/zw0TsUE8=;
 b=GVeC6zqB+kj+CKcMw6Z1Yrxbenqwl7Uoi59tk2nwcKszU2cAUQLcEzOS
 ObS6co17e3LIWaHc+uePygrNCJeujaKXpLIVMJRrfZSoao6pLOPtZHawQ
 YBgUaus35ypD3XDQDBqOGnTzBF4KA/JcIYF/JCjS4JT9jrj0+cpszj7tB
 pBbsevzTar1JmEXu7qbzKP22Yti1j3EDB1hHdKJbIcfaP0IUlsb2Qxi56
 WQpK485v89Y8zKHp4yrQLRWUv3ly2NofhmEa4C5tblKLFLgQVat9dXLJ+
 ebOxGbjEHaNvSnvSbFupKFrjitfVhqQp8GmNPjvqCWA8npsVNlq17Scc3 Q==;
X-CSE-ConnectionGUID: 8rsLMcNdT+qkdxQdBepEqw==
X-CSE-MsgGUID: Tt/gsXbIRAGQGl7F9UcAZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="88055694"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="88055694"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 03:30:45 -0700
X-CSE-ConnectionGUID: IBJt4+HeR5qyh/DO2zxtMQ==
X-CSE-MsgGUID: SPh4YoFwRxiILiJmzPD9Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181656815"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.155])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 03:30:44 -0700
Date: Tue, 14 Oct 2025 12:30:42 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sobin Thomas <sobin.thomas@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 tests/intel/xe_compute_preempt: Compute preemption check
Message-ID: <cfi6wiscq2cki5a7a3n5ofk3ele5vii6nvkhqkutktffjyj5ca@hdatsyb4x5r2>
References: <20251013133439.543393-1-sobin.thomas@intel.com>
 <176038245898.7451.15358917062086345952@97596180aaec>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176038245898.7451.15358917062086345952@97596180aaec>
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

On Mon, Oct 13, 2025 at 07:07:38PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/intel/xe_compute_preempt: Compute preemption check         
>    URL:     https://patchwork.freedesktop.org/series/155832/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13891/index.html 
> 
>         CI Bug Log - changes from XEIGT_8582_FULL -> XEIGTPW_13891_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_13891_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_13891_FULL, please notify your bug team
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
>    XEIGTPW_13891_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_vblank@wait-forked-busy-hang:
> 
>           * shard-bmg: PASS -> FAIL +1 other test fail
>      * igt@xe_compute_preempt@compute-threadgroup-preempt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP

This is expected change after applying series.

--
Zbigniew


>      * igt@xe_pm@s4-basic:
> 
>           * shard-lnl: PASS -> FAIL +2 other tests fail
> 
>     Warnings
> 
>      * igt@xe_compute_preempt@compute-preempt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1280 / Intel XE#455) -> SKIP
>      * igt@xe_compute_preempt@compute-preempt-many:
> 
>           * shard-dg2-set2: FAIL (Intel XE#5890) -> SKIP +1 other test skip
> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * {igt@xe_compute_preempt@compute-preempt-many-vram-evict}:
>           * shard-dg2-set2: FAIL (Intel XE#5890) -> SKIP +1 other test skip
> 
> New tests
> 
>    New tests have been introduced between XEIGT_8582_FULL and
>    XEIGTPW_13891_FULL:
> 
>   New IGT tests (1)
> 
>      * igt@kms_atomic@crtc-invalid-params@pipe-b-hdmi-a-3:
>           * Statuses : 1 pass(s)
>           * Exec time: [0.46] s
> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_13891_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#6054) +3 other tests fail
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#316) +1 other test skip
>      * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-bmg: PASS -> DMESG-WARN (Intel XE#3428) +4 other tests
>             dmesg-warn
>      * igt@kms_big_fb@y-tiled-addfb:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2328)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124)
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124)
>      * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2191)
>      * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2314 / Intel XE#2894)
>      * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2314 / Intel XE#2894)
>      * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2669) +3 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3432)
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887)
>      * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +7
>             other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +27 other tests
>             skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1727 / Intel XE#2705
>             / Intel XE#3113 / Intel XE#4212 / Intel XE#4522)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1727 / Intel XE#3113
>             / Intel XE#4345) +1 other test incomplete
>      * igt@kms_chamelium_color@degamma:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2325)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#306)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#306) +1 other test skip
>      * igt@kms_chamelium_frames@dp-crc-fast:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#373) +1 other test skip
>      * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373)
>      * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252)
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#307)
>      * igt@kms_cursor_crc@cursor-sliding-32x32:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2320)
>      * igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424) +1 other test skip
>      * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309)
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2291) +5 other tests skip
>      * igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#4294)
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2244)
>      * igt@kms_fbcon_fbt@fbc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5425)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#701)
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2373)
>      * igt@kms_flip@2x-flip-vs-dpms-on-nop:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2316) +6 other tests skip
>      * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2316)
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#301 / Intel XE#3149)
>      * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#301) +2 other tests fail
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * shard-bmg: PASS -> INCOMPLETE (Intel XE#2049 / Intel XE#2597) +1
>             other test incomplete
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293 / Intel XE#2380)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401 / Intel XE#1745)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293)
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5390) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +10 other tests
>             skip
>      * igt@kms_hdmi_inject@inject-audio:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1470 / Intel XE#2853)
>      * igt@kms_hdr@static-swap:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#1503) +1 other test skip
>      * igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#3012)
>      * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#616) +3 other tests fail
>      * igt@kms_plane_multiple@2x-tiling-y:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4596)
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2685 / Intel XE#3307)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2763) +3 other tests skip
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#718) +1 other test fail
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2392)
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489)
>      * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2893 / Intel
>             XE#4608)
>      * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#4608) +1
>             other test skip
>      * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489)
>      * igt@kms_psr@pr-primary-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2234 / Intel
>             XE#2850) +1 other test skip
>      * igt@kms_psr@psr2-suspend:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2850 /
>             Intel XE#929)
>      * igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#4459) +1 other test fail
>      * igt@kms_vrr@flip-basic-fastset:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +4 other tests skip
>      * igt@xe_eu_stall@unprivileged-access:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#5626)
>      * igt@xe_eudebug_online@interrupt-other-debuggable:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4837) +4 other tests
>             skip
>      * igt@xe_eudebug_online@preempt-breakpoint:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837) +3 other tests skip
>      * igt@xe_eudebug_online@stopped-thread:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4837) +3 other tests skip
>      * igt@xe_evict@evict-large-external-cm:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#688) +1 other test skip
>      * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288) +4 other tests skip
>      * igt@xe_exec_system_allocator@threads-many-stride-mmap-huge:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4943) +2 other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4943)
>      * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4915) +72 other tests
>             skip
>      * igt@xe_live_ktest@xe_migrate:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#3099) +9 other tests fail
>      * igt@xe_oa@mmio-triggered-reports-read:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#6032)
>      * igt@xe_oa@syncs-syncobj-cfg:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3573) +1 other test skip
>      * igt@xe_pm@s3-basic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#584)
>      * igt@xe_pmu@gt-frequency:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#5166) +1 other test fail
>      * igt@xe_pxp@display-pxp-fb:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4733)
>      * igt@xe_query@multigpu-query-oa-units:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_query@multigpu-query-uc-fw-version-huc:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#944)
> 
>     Possible fixes
> 
>      * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
> 
>           * shard-lnl: FAIL (Intel XE#5993) -> PASS +3 other tests pass
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1727 / Intel XE#3113 / Intel
>             XE#4345) -> PASS
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1727 / Intel XE#3113) ->
>             PASS
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>           * shard-bmg: SKIP (Intel XE#2291) -> PASS +2 other tests pass
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> 
>           * shard-bmg: FAIL (Intel XE#4633) -> PASS +1 other test pass
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
> 
>           * shard-dg2-set2: FAIL (Intel XE#301) -> PASS +1 other test pass
>      * igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>           * shard-bmg: SKIP (Intel XE#2316) -> PASS +1 other test pass
>      * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> 
>           * shard-lnl: FAIL (Intel XE#301) -> PASS
>      * igt@kms_plane_cursor@viewport:
> 
>           * shard-dg2-set2: FAIL (Intel XE#616) -> PASS +1 other test pass
>      * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>           * shard-bmg: SKIP (Intel XE#2571) -> PASS
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-lnl: FAIL (Intel XE#718) -> PASS
>      * {igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma}:
> 
>           * shard-lnl: FAIL (Intel XE#5625) -> PASS
> 
>     Warnings
> 
>      * igt@kms_content_protection@atomic:
> 
>           * shard-bmg: FAIL (Intel XE#1178) -> SKIP (Intel XE#2341) +1 other
>             test skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +19 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#5390) +2 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>           * shard-bmg: SKIP (Intel XE#5390) -> SKIP (Intel XE#2312) +12 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2311) +5 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2313) +5 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +18 other
>             tests skip
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-dg2-set2: SKIP (Intel XE#362) -> SKIP (Intel XE#1500)
>      * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> 
>           * shard-bmg: ABORT (Intel XE#5466 / Intel XE#5530) -> ABORT (Intel
>             XE#4917 / Intel XE#5466 / Intel XE#5530)
>      * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
> 
>           * shard-dg2-set2: SKIP (Intel XE#2229) -> FAIL (Intel XE#3099)
>      * igt@xe_module_load@load:
> 
>           * shard-bmg: (PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, SKIP,
>             PASS, PASS, PASS, PASS, PASS, PASS) (Intel XE#2457) -> (PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, DMESG-WARN, SKIP, PASS, PASS,
>             PASS, PASS, PASS) (Intel XE#2457 / Intel XE#3428)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * IGT: IGT_8582 -> IGTPW_13891
>      * Linux: xe-3900-06342be0412e879eaede7e6932e651f8cb630203 ->
>        xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626
> 
>    IGTPW_13891: 13891
>    IGT_8582: 8582
>    xe-3900-06342be0412e879eaede7e6932e651f8cb630203:
>    06342be0412e879eaede7e6932e651f8cb630203
>    xe-3908-61b16793c3bbb8e740cf9afb36258dee61346626:
>    61b16793c3bbb8e740cf9afb36258dee61346626
