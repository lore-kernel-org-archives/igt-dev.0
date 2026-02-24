Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94F0F3C985
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 14:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549F210E5A7;
	Tue, 24 Feb 2026 14:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBAtUEKu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769A110E5A7
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 14:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771944294; x=1803480294;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=aBwZlT0EiBSSY5qGJmxRRci7LHD7Pk5fc+ZBnb6XoFY=;
 b=nBAtUEKuWX9iHUzrWrPNTlDJ4b1c8M5DdWyTvt+YMffhkYwV0P996LTA
 ZbfQ6O+gX8yzmwngSaM4tt6vhNdw5mmoFnTpgIr3Ildn3S0synH0ZfFz3
 0eQRxUbkeZPoDVraAu0onHSEq/IeKnMlWp/6bfjgI1/kuZ2fO4IIi1dOi
 ARP3L2HgQBF0yyMJT+V0mN6IZVk3gK11Hijb7VMW1uUzBHEDbuCgtz4F9
 rn9R6Rb40kxemcFGdz0XyS9P5gpJCyszsP+HAql1HSCn66h64170UzWGN
 iqyIQlPJ5XJVFphraScDeNFQdwyN2wWBO1K4d1RW8/V6VIRpnfgvVNPCC g==;
X-CSE-ConnectionGUID: khaGPKoVTseiQ40cDKWBWA==
X-CSE-MsgGUID: KD+TVWrrRLSytu9yFepNaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="84321113"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="84321113"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 06:44:54 -0800
X-CSE-ConnectionGUID: nA9YbpafQD+M3SaoERYjGA==
X-CSE-MsgGUID: W5D6ddYHS+CPzkjbR+AAlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="253657327"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.163])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 06:44:53 -0800
Date: Tue, 24 Feb 2026 15:44:50 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 lib/rendercopy: Alter pipeline and add shader for Xe3p
Message-ID: <qkxrnynhnf2vwzfgivsym7ng77r37aoq3qhe3tx2i52wcpyjwa@ydy5zhyngdab>
References: <20260223163544.1519449-2-zbigniew.kempczynski@intel.com>
 <177194015025.280493.15396205779546930582@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177194015025.280493.15396205779546930582@a3b018990fe9>
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

On Tue, Feb 24, 2026 at 01:35:50PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/rendercopy: Alter pipeline and add shader for Xe3p           
>    URL:     https://patchwork.freedesktop.org/series/161991/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14597/index.html 
> 
>         CI Bug Log - changes from XEIGT_8766_FULL -> XEIGTPW_14597_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_14597_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_14597_FULL, please notify your bug team
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
>    XEIGTPW_14597_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@core_hotunplug@hotreplug:
> 
>           * shard-bmg: PASS -> ABORT
>      * igt@fbdev@eof:
> 
>           * shard-bmg: PASS -> FAIL
>      * igt@xe_exec_system_allocator@many-64k-mmap-shared-remap:
> 
>           * shard-bmg: PASS -> DMESG-WARN

Change is unrelated to above abort/fail/dmesg-warn.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_14597_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3157)
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2327)
>      * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124) +2 other tests skip
>      * igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#610)
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +3 other tests skip
>      * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2191)
>      * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +2 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +2 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3432)
>      * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-1:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2652) +12 other tests skip
>      * igt@kms_chamelium_color@ctm-0-50:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#306)
>      * igt@kms_chamelium_frames@hdmi-crc-planes-random:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373) +1 other test skip
>      * igt@kms_chamelium_hpd@dp-hpd-storm:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +4 other tests skip
>      * igt@kms_color@invalid-ctm-matrix-sizes:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6703) +12 other tests skip
>      * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-0:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#7305) +9 other tests fail
>      * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#3304)
>      * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#1178 / Intel XE#3304) +2
>             other tests fail
>      * igt@kms_cursor_crc@cursor-offscreen-64x21:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +1 other test skip
>      * igt@kms_cursor_crc@cursor-sliding-32x32:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424) +1 other test skip
>      * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309) +1 other test skip
>      * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2244)
>      * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421)
>      * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7179)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7178)
>      * igt@kms_force_connector_basic@prune-stale-modes:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#352)
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7061) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +10 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7061) +1 other test skip
>      * igt@kms_hdmi_inject@inject-audio:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#7308)
>      * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7283) +1 other test skip
>      * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7283) +1 other test skip
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3307)
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#7340)
>      * igt@kms_pm_rpm@legacy-planes:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#6693)
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489) +2
>             other tests skip
>      * igt@kms_psr@fbc-pr-cursor-plane-onoff:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406)
>      * igt@kms_psr@fbc-psr2-primary-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2234 / Intel
>             XE#2850) +2 other tests skip
>      * igt@kms_psr@pr-sprite-plane-onoff:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#6703)
>      * igt@kms_rotation_crc@primary-rotation-270:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904)
>      * igt@kms_rotation_crc@primary-rotation-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1127)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2330)
>      * igt@kms_scaling_modes@scaling-mode-full:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2413)
>      * igt@kms_vrr@cmrr:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2168)
>      * igt@xe_eudebug@basic-vm-bind-extended-discovery:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837) +1 other test skip
>      * igt@xe_eudebug@vma-ufence:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4837) +4 other tests skip
>      * igt@xe_eudebug_online@basic-breakpoint:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837 / Intel XE#6665)
>      * igt@xe_eudebug_online@interrupt-other:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4837 / Intel XE#6665) +2
>             other tests skip
>      * igt@xe_eudebug_online@pagefault-write-stress:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6665)
>      * igt@xe_evict@evict-cm-threads-small-multi-vm:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6540 / Intel XE#688)
>      * igt@xe_evict@evict-small-external-multi-queue-cm:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7140)
>      * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +3 other tests skip
>      * igt@xe_exec_basic@multigpu-once-bindexecqueue:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +2 other tests skip
>      * igt@xe_exec_fault_mode@many-multi-queue-rebind-imm:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7136) +1 other test skip
>      * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7136) +3 other tests skip
>      * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6874) +7 other tests skip
>      * igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6874) +11 other tests skip
>      * igt@xe_exec_system_allocator@many-execqueues-new-busy:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#6703) +124 other tests skip
>      * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6196)
>      * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-madvise:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#6557 / Intel XE#6703)
>      * igt@xe_exec_threads@threads-multi-queue-cm-rebind:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7138)
>      * igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7138)
>      * igt@xe_mmap@pci-membarrier-bad-pagesize:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#5100 / Intel XE#7322)
>      * igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6964) +1 other test skip
>      * igt@xe_multigpu_svm@mgpu-latency-prefetch:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6964) +1 other test skip
>      * igt@xe_pat@pat-index-xehpc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1420)
>      * igt@xe_pm@d3cold-mmap-system:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2284)
>      * igt@xe_pm@s3-d3hot-basic-exec:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#584)
>      * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_sriov_admin@sched-priority-write-readback-vfs-disabled:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7174)
>      * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4130)
>      * igt@xe_sriov_flr@flr-each-isolation:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#6569)
>      * igt@xe_sriov_vram@vf-access-after-resize-up:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#5937)
>      * igt@xe_survivability@runtime-survivability:
> 
>           * shard-bmg: PASS -> DMESG-WARN (Intel XE#6627)
>      * igt@xe_vm@bind-array-many:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6557 / Intel XE#6703)
> 
>     Possible fixes
> 
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-bmg: FAIL (Intel XE#4665) -> PASS
>      * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> 
>           * shard-bmg: SKIP (Intel XE#367) -> PASS
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-bmg: INCOMPLETE (Intel XE#7084) -> PASS +1 other test pass
>      * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#5354) -> PASS
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-lnl: FAIL -> PASS
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-bmg: SKIP (Intel XE#2685 / Intel XE#3307) -> PASS
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-lnl: FAIL (Intel XE#7340) -> PASS
>      * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
> 
>           * shard-lnl: FAIL (Intel XE#5625) -> PASS
>      * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#1727) -> PASS
>      * igt@xe_sriov_flr@flr-twice:
> 
>           * shard-bmg: FAIL (Intel XE#6569) -> PASS
> 
>     Warnings
> 
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-bmg: SKIP (Intel XE#1124) -> SKIP (Intel XE#6703) +2 other
>             tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>           * shard-bmg: SKIP (Intel XE#2887) -> SKIP (Intel XE#6703) +3 other
>             tests skip
>      * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
> 
>           * shard-bmg: SKIP (Intel XE#2252) -> SKIP (Intel XE#6703) +1 other
>             test skip
>      * igt@kms_content_protection@lic-type-0-hdcp14:
> 
>           * shard-bmg: FAIL (Intel XE#1178 / Intel XE#3304) -> SKIP (Intel
>             XE#6703)
>      * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
> 
>           * shard-bmg: SKIP (Intel XE#4422) -> SKIP (Intel XE#6703)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
> 
>           * shard-bmg: SKIP (Intel XE#7178) -> SKIP (Intel XE#6703) +1 other
>             test skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#4141) -> SKIP (Intel XE#6703) +4 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#6703) +5 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#6703) +3 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>           * shard-bmg: SKIP (Intel XE#2350) -> SKIP (Intel XE#6703)
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-bmg: SKIP (Intel XE#3544) -> SKIP (Intel XE#3374 / Intel
>             XE#3544)
>      * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
> 
>           * shard-bmg: SKIP (Intel XE#7283) -> SKIP (Intel XE#6703)
>      * igt@kms_pm_backlight@fade-with-dpms:
> 
>           * shard-bmg: SKIP (Intel XE#870) -> SKIP (Intel XE#6703)
>      * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
> 
>           * shard-bmg: SKIP (Intel XE#1406 / Intel XE#1489) -> SKIP (Intel
>             XE#1406 / Intel XE#6703) +1 other test skip
>      * igt@kms_psr@pr-no-drrs:
> 
>           * shard-bmg: SKIP (Intel XE#1406 / Intel XE#2234 / Intel XE#2850)
>             -> SKIP (Intel XE#1406 / Intel XE#6703) +1 other test skip
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-bmg: SKIP (Intel XE#2426) -> SKIP (Intel XE#2509)
>      * igt@kms_vrr@flip-basic:
> 
>           * shard-bmg: SKIP (Intel XE#1499) -> SKIP (Intel XE#6703)
>      * igt@xe_create@multigpu-create-massive-size:
> 
>           * shard-bmg: SKIP (Intel XE#2504 / Intel XE#7319) -> SKIP (Intel
>             XE#6703)
>      * igt@xe_eudebug@basic-vm-bind-extended:
> 
>           * shard-bmg: SKIP (Intel XE#4837) -> SKIP (Intel XE#6703) +1 other
>             test skip
>      * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
> 
>           * shard-bmg: SKIP (Intel XE#4837 / Intel XE#6665) -> SKIP (Intel
>             XE#6703)
>      * igt@xe_evict@evict-small-multi-queue-priority:
> 
>           * shard-bmg: SKIP (Intel XE#7140) -> SKIP (Intel XE#6703)
>      * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
> 
>           * shard-bmg: SKIP (Intel XE#2322) -> SKIP (Intel XE#6703) +2 other
>             tests skip
>      * igt@xe_exec_fault_mode@once-multi-queue-userptr-prefetch:
> 
>           * shard-bmg: SKIP (Intel XE#7136) -> SKIP (Intel XE#6703) +1 other
>             test skip
>      * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:
> 
>           * shard-bmg: SKIP (Intel XE#6874) -> SKIP (Intel XE#6703) +7 other
>             tests skip
>      * igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate-race:
> 
>           * shard-bmg: SKIP (Intel XE#7138) -> SKIP (Intel XE#6703)
>      * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> 
>           * shard-bmg: ABORT (Intel XE#5466 / Intel XE#6652) -> ABORT (Intel
>             XE#5466)
>      * igt@xe_pxp@pxp-stale-queue-post-suspend:
> 
>           * shard-bmg: SKIP (Intel XE#4733) -> SKIP (Intel XE#6703)
>      * igt@xe_sriov_flr@flr-vfs-parallel:
> 
>           * shard-bmg: FAIL (Intel XE#6569) -> FAIL (Intel XE#5937)
> 
> Build changes
> 
>      * IGT: IGT_8766 -> IGTPW_14597
> 
>    IGTPW_14597: 6a89e69be222393d3dd2f894a914c79f78f612ca @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8766: 8766
>    xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904:
>    45a3045fc0dc46a893cb8bbe304afafd4120c904
