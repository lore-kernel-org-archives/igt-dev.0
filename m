Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F56E7BD8B
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 10:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811A410E202;
	Mon, 16 Feb 2026 10:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mMm0wVQF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B9E10E202
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Feb 2026 10:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771238660; x=1802774660;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=1CA6YOWW0N8qSb5L9ZrRRh6DiwvE6119zzHkSli1CCc=;
 b=mMm0wVQFVX42kakSBk7M9HXLs4aS9ZMcERiyG/rRnftXhQHICg/u1Nmp
 +mdn09ZVQ0o1SDGsKfPeOr5IuW+cpOh2FSrYAk0LJY2aMqo2hWHX+pBHp
 2fUiVNIyMnzRLo/c0kuYHaNMQvGTQZHSExHV8RDnv4839G2pno3CdzTU6
 yAfS+wCBnKPFKFc+xHfI9RW8l1CETiepUW6qYvklm4Q1YbKpw1aiodicT
 3PUUetnuPd7EYE7mJMFF/cFIEi1FFOgnDUZiO1dyT2TD+xYBVGkInud3/
 4ZLg/clrDAWzqJfqJIsl7YLxGwSud678LMIENZheZWCqkYCNPvz0DfsIH Q==;
X-CSE-ConnectionGUID: Gd6xuXifRAe1AH3i5hhkLA==
X-CSE-MsgGUID: wdUMfm81Ryal9er+FkPRCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="83417423"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="83417423"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 02:44:19 -0800
X-CSE-ConnectionGUID: HTicZBswQ/KNq6BNwflk7Q==
X-CSE-MsgGUID: vR6L+EYKS/2ogIgNDJWVBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="236582230"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 02:44:18 -0800
Date: Mon, 16 Feb 2026 11:44:16 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
cc: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_kms=5Ff?=
 =?UTF-8?Q?lip=3A_limit_number_of_subtests_run_=28rev5=29?=
In-Reply-To: <177123363454.255555.1717647215479203813@a3b018990fe9>
Message-ID: <f9aa69af-ed0d-741c-bb8f-0cc6df8dac65@intel.com>
References: <20260213084930.252273-1-michal.grzelak@intel.com>
 <177123363454.255555.1717647215479203813@a3b018990fe9>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="1527428566-771139672-1771238658=:356414"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1527428566-771139672-1771238658=:356414
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 16 Feb 2026, Patchwork wrote:
> Patch Details
> Series:
> kms_flip: limit number of subtests run (rev5)
> URL:
> https://patchwork.freedesktop.org/series/161389/
> State:
> failure
> Details:
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14554/index.html
>                                             CI Bug Log - changes from XEIGT_8753_FULL -> XEIGTPW_14554_FULL
> 
> SUMMARY
> 
> FAILURE
> 
> Serious unknown changes coming with XEIGTPW_14554_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_14554_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> PARTICIPATING HOSTS (2 -> 2)
> 
> No changes in participating hosts
> 
> POSSIBLE NEW ISSUES
> 
> Here are the unknown changes that may have been introduced in XEIGTPW_14554_FULL:
>
>   IGT changes
>
>     Possible regressions
>
>  *  igt@xe_pm@s4-multiple-execs:
>      +  shard-lnl: PASS -> DMESG-WARN

<3> [339.918730] intel_vpu 0000:00:0b.0: [drm] *ERROR* ivpu_ipc_send_receive_internal(): IPC receive failed: type VPU_JSM_MSG_PWR_D0I3_ENTER, ret -110
<3> [339.921704] intel_vpu 0000:00:0b.0: [drm] *ERROR* ivpu_pm_runtime_suspend_cb(): Failed to prepare for d0i3: -110
<3> [339.922932] intel_vpu 0000:00:0b.0: [drm] *ERROR* ivpu_pm_runtime_suspend_cb(): Forcing cold boot due to previous errors

Unrelated issue.

BR,
Michał

> 
> NEW TESTS
> 
> New tests have been introduced between XEIGT_8753_FULL and XEIGTPW_14554_FULL:
>
>   New IGT tests (9)
>
>  * 
>
>     igt@core_setmaster@master-drop-set-root:
>
>      +  Statuses : 2 pass(s)
>      +  Exec time: [0.01] s
>  * 
>
>     igt@core_setmaster@master-drop-set-shared-fd:
>
>      +  Statuses : 2 pass(s)
>      +  Exec time: [0.02, 0.03] s
>  * 
>
>     igt@core_setmaster@master-drop-set-user:
>
>      +  Statuses : 2 pass(s)
>      +  Exec time: [0.03, 0.04] s
>  * 
>
>     igt@kms_cursor_edge_walk@256x256-left-edge@pipe-c-edp-1:
>
>      +  Statuses : 1 pass(s)
>      +  Exec time: [4.26] s
>  * 
>
>     igt@kms_cursor_edge_walk@64x64-left-edge@pipe-c-edp-1:
>
>      +  Statuses : 1 pass(s)
>      +  Exec time: [4.25] s
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>
>      +  Statuses : 1 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 5.37] s
>  * 
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>      +  Statuses : 1 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 12.97] s
>  * 
>
>     igt@xe_exec_multi_queue:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random:
>
>      +  Statuses : 1 pass(s)
>      +  Exec time: [3.63] s
> 
> KNOWN ISSUES
> 
> Here are the changes found in XEIGTPW_14554_FULL that come from known issues:
>
>   IGT changes
>
>     Issues hit
>
>  * 
>
>     igt@kms_atomic_transition@plane-all-modeset-transition:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#3279)
>  * 
>
>     igt@kms_big_fb@linear-32bpp-rotate-270:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2327)
>  * 
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +7 other tests skip
>  * 
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#1124)
>  * 
>
>     igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#2191)
>  * 
>
>     igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#1512)
>  * 
>
>     igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#367)
>  * 
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +4 other tests skip
>  * 
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +1 other test skip
>  * 
>
>     igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#3432) +1 other test skip
>  * 
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-dp-1:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +7 other tests skip
>  * 
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2724)
>  * 
>
>     igt@kms_chamelium_color@ctm-0-75:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#306)
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2325)
>  * 
>
>     igt@kms_chamelium_edid@dp-edid-read:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +5 other tests skip
>  * 
>
>     igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#373)
>  * 
>
>     igt@kms_chamelium_sharpness_filter@filter-basic:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#6507)
>  * 
>
>     igt@kms_color_pipeline@plane-ctm3x4@pipe-a-edp-1:
>
>      +  shard-lnl: NOTRUN -> FAIL (Intel XE#6968) +3 other tests fail
>  * 
>
>     igt@kms_content_protection@legacy:
>
>      +  shard-bmg: NOTRUN -> FAIL (Intel XE#1178 / Intel XE#3304) +5 other tests fail
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#3278)
>  * 
>
>     igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
>
>      +  shard-bmg: NOTRUN -> FAIL (Intel XE#3304) +1 other test fail
>  * 
>
>     igt@kms_content_protection@mei-interface:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2341)
>  * 
>
>     igt@kms_cursor_crc@cursor-offscreen-max-size:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +2 other tests skip
>  * 
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#309)
>  * 
>
>     igt@kms_dsc@dsc-fractional-bpp:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2244)
>  * 
>
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#4422)
>  * 
>
>     igt@kms_feature_discovery@display-2x:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#702)
>  * 
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>
>      +  shard-lnl: PASS -> FAIL (Intel XE#301) +1 other test fail
>  * 
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#7178) +1 other test skip
>  * 
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#1397 / Intel XE#1745)
>  * 
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#1397)
>  * 
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#7178) +2 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#656) +3 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#651)
>  * 
>
>     igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +17 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +9 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#7061) +1 other test skip
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#7061)
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2352)
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +13 other tests skip
>  * 
>
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#6911)
>  * 
>
>     igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#6912)
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#6912)
>  * 
>
>     igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#4329 / Intel XE#6912)
>  * 
>
>     igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#7250) +2 other tests skip
>  * 
>
>     igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#7111) +1 other test skip
>  * 
>
>     igt@kms_plane_lowres@tiling-yf:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2393)
>  * 
>
>     igt@kms_plane_multiple@2x-tiling-yf:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#5021)
>  * 
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#6886) +3 other tests skip
>  * 
>
>     igt@kms_pm_backlight@fade-with-suspend:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#870)
>  * 
>
>     igt@kms_pm_dc@deep-pkgc:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2505)
>  * 
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2893 / Intel XE#4608)
>  * 
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#4608) +1 other test skip
>  * 
>
>     igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489) +7 other tests skip
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2893)
>  * 
>
>     igt@kms_psr@fbc-pr-primary-render:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#1406)
>  * 
>
>     igt@kms_psr@psr2-primary-page-flip:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2234 / Intel XE#2850) +8 other tests skip
>  * 
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2414)
>  * 
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904)
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904) +2 other tests skip
>  * 
>
>     igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#6503) +2 other tests skip
>  * 
>
>     igt@kms_vrr@cmrr:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2168)
>  * 
>
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
>
>      +  shard-lnl: PASS -> FAIL (Intel XE#4459) +1 other test fail
>  * 
>
>     igt@kms_vrr@flip-suspend:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#1499)
>  * 
>
>     igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>
>      +  shard-lnl: PASS -> FAIL (Intel XE#2142) +1 other test fail
>  * 
>
>     igt@xe_eudebug@basic-client:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#4837) +2 other tests skip
>  * 
>
>     igt@xe_eudebug@vma-ufence:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#4837) +3 other tests skip
>  * 
>
>     igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#4837 / Intel XE#6665) +2 other tests skip
>  * 
>
>     igt@xe_eudebug_online@interrupt-reconnect:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#4837 / Intel XE#6665)
>  * 
>
>     igt@xe_eudebug_online@pagefault-one-of-many:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#6665)
>  * 
>
>     igt@xe_evict@evict-beng-small-multi-vm:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#688)
>  * 
>
>     igt@xe_evict@evict-threads-small-multi-queue:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#7140)
>  * 
>
>     igt@xe_exec_basic@multigpu-no-exec-null:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +4 other tests skip
>  * 
>
>     igt@xe_exec_basic@multigpu-no-exec-userptr:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#1392)
>  * 
>
>     igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#7136)
>  * 
>
>     igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#7136) +6 other tests skip
>  * 
>
>     igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic-smem:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#6874) +14 other tests skip
>  * 
>
>     igt@xe_exec_multi_queue@two-queues-preempt-mode-close-fd-smem:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#6874) +5 other tests skip
>  * 
>
>     igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-ro:
>
>      +  shard-bmg: PASS -> INCOMPLETE (Intel XE#2594)
>  * 
>
>     igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#7138) +7 other tests skip
>  * 
>
>     igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#6964) +3 other tests skip
>  * 
>
>     igt@xe_multigpu_svm@mgpu-migration-prefetch:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#6964)
>  * 
>
>     igt@xe_pat@pat-index-xelpg:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2236)
>  * 
>
>     igt@xe_pm@d3cold-multiple-execs:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2284)
>  * 
>
>     igt@xe_pm@s3-multiple-execs:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#584)
>  * 
>
>     igt@xe_pxp@pxp-stale-queue-post-suspend:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#4733)
>  * 
>
>     igt@xe_query@multigpu-query-mem-usage:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#944)
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#944)
>  * 
>
>     igt@xe_sriov_flr@flr-each-isolation:
>
>      +  shard-bmg: PASS -> FAIL (Intel XE#6569)
>
>     Possible fixes
>
>  * 
>
>     igt@kms_cursor_crc@cursor-sliding-256x256:
>
>      +  shard-bmg: FAIL (Intel XE#6747) -> PASS
>  * 
>
>     igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2:
>
>      +  shard-bmg: FAIL (Intel XE#6841) -> PASS +1 other test pass
>  * 
>
>     igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>
>      +  shard-bmg: FAIL (Intel XE#5299) -> PASS
>  * 
>
>     igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
>
>      +  shard-bmg: ABORT (Intel XE#2705 / Intel XE#4760 / Intel XE#7169) -> PASS
>  * 
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>      +  shard-bmg: INCOMPLETE (Intel XE#6321) -> PASS
>  * 
>
>     igt@xe_module_load@load:
>
>      +  shard-lnl: (PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>         PASS, PASS, PASS, SKIP) (Intel XE#378) -> (PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>         PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS)
>      +  shard-bmg: (PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, SKIP, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>         PASS, PASS, PASS, PASS) (Intel XE#2457) -> (PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>         PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS)
>  * 
>
>     igt@xe_sriov_flr@flr-vfs-parallel:
>
>      +  shard-bmg: FAIL (Intel XE#6569) -> PASS +1 other test pass
>
>     Warnings
>
>  *  igt@kms_tiled_display@basic-test-pattern:
>      +  shard-bmg: SKIP (Intel XE#2426) -> FAIL (Intel XE#1729)
> 
> BUILD CHANGES
>
>  *  IGT: IGT_8753 -> IGTPW_14554
>  *  Linux: xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92 -> xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc
> 
> IGTPW_14554: 14554
> IGT_8753: 8753
> xe-4548-ec995dd44a15b6f448fa3c7c8967f71443264b92: ec995dd44a15b6f448fa3c7c8967f71443264b92
> xe-4561-eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc: eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc
> 
> 
>
--1527428566-771139672-1771238658=:356414--
