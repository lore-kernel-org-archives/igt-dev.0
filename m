Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5431C531F9
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jul 2026 06:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F77B10E197;
	Fri, 24 Jul 2026 06:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qk5WA9Fx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1732610E197
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2026 05:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784872795; x=1816408795;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=DuVSjIntbrzDg/7g/CPeIslxEP5Jy2zPBtz4sELguV0=;
 b=Qk5WA9FxJSn6hUDY8knltsDkYIhXlt3D9XG3Wshipn568+uNCnnUSRgU
 HBu17Uhnvi1ax1Xn8wnZLXPfp89aeqhP7/eoP+Z4wiR7r3BZcyJKtIe8Y
 1+jIaQg+Bm83QfXPz665ppUOY43T1ozyEX5IhqDr/Yad0d7YkJOpBaEU+
 F2zO2TeqibQ3jiZuBx1kItrQ6/l6zGT0FVrFChfRcSXeRzSDKokgfZvib
 lkIFJfsy4K9HFNc2M1qeOjTkFkFuTmjs/AYUfMuMlCWVPaLqVx/wLmz7N
 K1nR3hTQi/yCJUqrDWlZ7n9a1hqPEsaHypuURgNUOf6ykfR1X3QL9wySa Q==;
X-CSE-ConnectionGUID: HomD9EEtR0GFKWzWRgKY7g==
X-CSE-MsgGUID: MKM7VmXAQHuwcck4P0uOiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84515662"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="84515662"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 22:59:55 -0700
X-CSE-ConnectionGUID: OdATLIQdR5ml9C0f80qWZw==
X-CSE-MsgGUID: ZR7LiEmcQnS7BWT8q2w5zA==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.206])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 22:59:54 -0700
Date: Fri, 24 Jul 2026 07:59:51 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 lib/rendercopy_gen9: Bump up URB size
Message-ID: <2l44yd56w5zzd36q6pqqt652njuumda3jr7d2gbz63zv72pi5a@frze6vv63pji>
References: <20260722062458.1250817-2-zbigniew.kempczynski@intel.com>
 <178478283527.219722.10794470766989974316@6beec6c84f66>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178478283527.219722.10794470766989974316@6beec6c84f66>
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

On Thu, Jul 23, 2026 at 05:00:35AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/rendercopy_gen9: Bump up URB size                            
>    URL:     https://patchwork.freedesktop.org/series/170885/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15580/index.html 
> 
>         CI Bug Log - changes from XEIGT_9018_FULL -> XEIGTPW_15580_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_15580_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_15580_FULL, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
> Participating hosts (2 -> 2)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    XEIGTPW_15580_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_universal_plane@cursor-fb-leak:
>           * shard-bmg: PASS -> DMESG-WARN +1 other test dmesg-warn

Change is unrelated to above warning.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_15580_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2233)
>      * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7059 / Intel XE#7085)
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2327)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +5 other tests skip
>      * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7679)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3432)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +5 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2652) +8 other tests skip
>      * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7358) +1 other test skip
>      * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +2 other tests skip
>      * igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#1178 / Intel XE#3304 / Intel
>             XE#7374) +1 other test fail
>      * igt@kms_content_protection@uevent-hdcp14:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#6707 / Intel XE#7439) +1
>             other test fail
>      * igt@kms_cursor_crc@cursor-onscreen-32x10:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2320)
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2321 / Intel XE#7355)
>      * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1508)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1340 / Intel XE#7435)
>      * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#8265) +1 other test skip
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6126 / Intel XE#776)
>      * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#301) +2 other tests fail
>      * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#301 / Intel XE#3149) +1 other
>             test fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7179)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7178 / Intel XE#7351)
>      * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +26 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7061) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +18 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7061 / Intel XE#7356) +1
>             other test skip
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7591)
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2486)
>      * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7283) +1 other test skip
>      * igt@kms_plane_multiple@2x-tiling-y:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5021 / Intel XE#7377)
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2763 / Intel XE#6886) +9
>             other tests skip
>      * igt@kms_pm_backlight@fade:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7376 / Intel XE#7760 / Intel
>             XE#870)
>      * igt@kms_pm_rpm@package-g7:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6814 / Intel XE#7428)
>      * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1489) +1 other test skip
>      * igt@kms_psr@fbc-pr-cursor-plane-onoff:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2234 / Intel XE#2850) +5
>             other tests skip
>      * igt@kms_rotation_crc@bad-pixel-format:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3904 / Intel XE#7342) +1
>             other test skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2330 / Intel XE#5813)
>      * igt@kms_scaling_modes@scaling-mode-full-aspect:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2413)
>      * igt@kms_sharpness_filter@filter-scaler-downscale:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6503)
>      * igt@kms_vrr@flip-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1499)
>      * igt@xe_evict@evict-mixed-many-threads-small:
> 
>           * shard-bmg: PASS -> INCOMPLETE (Intel XE#6321 / Intel XE#8355)
>      * igt@xe_evict@evict-mixed-threads-small-multi-queue:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#8370) +1 other test skip
>      * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322 / Intel XE#7372) +2
>             other tests skip
>      * igt@xe_exec_fault_mode@twice-multi-queue:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#8374) +3 other tests skip
>      * igt@xe_exec_multi_queue@two-queues-basic-smem:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#8364) +12 other tests skip
>      * igt@xe_exec_reset@multi-queue-close-fd:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#8369)
>      * igt@xe_exec_threads@threads-multi-queue-fd-basic:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#8378) +2 other tests skip
>      * igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:
> 
>           * shard-bmg: PASS -> ABORT (Intel XE#8007) +1 other test abort
>      * igt@xe_multigpu_svm@mgpu-pagefault-conflict:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6964)
>      * igt@xe_page_reclaim@many-vma-same-bo:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7793)
>      * igt@xe_peer2peer@read:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2427 / Intel XE#6953 / Intel
>             XE#7326 / Intel XE#7353)
>      * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4733 / Intel XE#7417)
>      * igt@xe_sriov_flr@flr-vfs-parallel:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#6569) +1 other test fail
> 
>     Possible fixes
> 
>      * igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:
> 
>           * shard-bmg: ABORT (Intel XE#8007) -> PASS +1 other test pass
>      * igt@xe_sriov_flr@flr-twice:
> 
>           * shard-bmg: FAIL (Intel XE#6569) -> PASS
>      * igt@xe_sriov_vram@vf-access-after-resize-down:
> 
>           * shard-bmg: FAIL (Intel XE#7992) -> PASS
> 
>     Warnings
> 
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>           * shard-lnl: SKIP (Intel XE#309 / Intel XE#7343 / Intel XE#7935) ->
>             SKIP (Intel XE#309 / Intel XE#7343)
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-bmg: SKIP (Intel XE#2509 / Intel XE#7437) -> SKIP (Intel
>             XE#2426 / Intel XE#5848)
> 
> Build changes
> 
>      * IGT: IGT_9018 -> IGTPW_15580
>      * Linux: xe-5453-5726f9c4bde0290e5e60e636b9632bb03a57498c ->
>        xe-5458-cfee1b098ebceda0381298e945031733a5aec8dd
> 
>    IGTPW_15580: 0e82db417179243aa8e009324a81edde0802ec7c @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_9018: f4345861cbd5d97fd50b73bf7af5fe3286fca056 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-5453-5726f9c4bde0290e5e60e636b9632bb03a57498c:
>    5726f9c4bde0290e5e60e636b9632bb03a57498c
>    xe-5458-cfee1b098ebceda0381298e945031733a5aec8dd:
>    cfee1b098ebceda0381298e945031733a5aec8dd
