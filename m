Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A216D2F036
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 14:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F9710E031;
	Tue, 27 Jan 2026 14:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lh9BmKdm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A972610E031
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 14:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769524836; x=1801060836;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=NfhfCgdf2G/eoovIV07i87EVRjzgzkmVgZhIqQTxmSM=;
 b=lh9BmKdmBmRLDiBfiX5iU68rrR+2zbcV6CKyrFk+4XNz2/Te6iBudgSC
 zkvH8cIdvE8pp6HFkdVMzhePHW2kbJjJXzM/Ja7IyfcdppWep5xflhQkM
 MDy+1vJ+4yUcHvkXm93+ejkKUdX6xz9mmWiYuWoC/UtRQswCRcKOKaoR3
 fz0Y6PSXapU/I5mDjCwtQF08+TmU1XPl+xuSMx5cDyOpoqjjp3RRh7dRx
 5XR6Wm/UYkNVgUkQVNUXAT9O9w5bXAJKHueXODqXUQuGZqiIx1tPhvMXG
 X4dQPjoUmnmzoVGX70eRAKRsJAJ2zzk+xwKVrjamS/myapcpzkbtjcW8P w==;
X-CSE-ConnectionGUID: SUhCHxblToKG2KqqHsWn+A==
X-CSE-MsgGUID: oeXCnR4oSCyMiHZqTHuaIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82086051"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="82086051"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 06:40:36 -0800
X-CSE-ConnectionGUID: kgS2RqLfThKmyUS3I9k0lw==
X-CSE-MsgGUID: fL3mO4JJRKuA9Z6fXyY3Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207787322"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.54])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 06:40:35 -0800
Date: Tue, 27 Jan 2026 15:40:31 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Revert_=22t?=
 =?utf-8?Q?ests=2Fxe=5Frender=5Fcopy?= =?utf-8?Q?=3A?= Skip if platform
 doesn't support flatccs"
Message-ID: <3sym4rubdcd3ocdrkbohfyx2qujsrf7djafahpjhbldzx4q6wm@r5bd3oa7ewes>
References: <20260126121535.336206-2-zbigniew.kempczynski@intel.com>
 <176945404958.193567.4913897634788773747@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176945404958.193567.4913897634788773747@a3b018990fe9>
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

On Mon, Jan 26, 2026 at 07:00:49PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Revert "tests/xe_render_copy: Skip if platform doesn't support    
>             flatccs"                                                          
>    URL:     https://patchwork.freedesktop.org/series/160643/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14417/index.html  
> 
>         CI Bug Log - changes from XEIGT_8717_FULL -> XEIGTPW_14417_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_14417_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_14417_FULL, please notify your bug team
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
>    XEIGTPW_14417_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_color@ctm-0-50:
> 
>           * shard-bmg: PASS -> ABORT +3 other tests abort
>      * igt@xe_pxp@pxp-termination-key-update-post-suspend:
> 
>           * shard-lnl: PASS -> ABORT

Patch is unrelated to the failures above, it touches xe_render_copy
tests only.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_14417_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1407) +2 other tests skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2327) +3 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3658) +1 other test skip
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#1231)
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +3 other tests skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124) +2 other tests skip
>      * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2314 / Intel XE#2894)
>      * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#367)
>      * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +4 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2669 / Intel XE#3433) +3
>             other tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3432) +1 other test skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3432) +1 other test skip
>      * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +4 other tests skip
>      * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +3 other tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373)
>      * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6974)
>      * igt@kms_cursor_crc@cursor-offscreen-128x42:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +2 other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424)
>      * igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2321) +1 other test skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2321)
>      * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309) +1 other test skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>           * shard-bmg: PASS -> DMESG-WARN (Intel XE#5354) +1 other test
>             dmesg-warn
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#4633)
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#5299)
>      * igt@kms_dp_link_training@uhbr-mst:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4354) +1 other test skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4354) +1 other test skip
>      * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4422)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4422)
>      * igt@kms_flip@2x-absolute-wf_vblank:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421)
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#301) +1 other test fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293 / Intel XE#2380)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293)
>      * igt@kms_force_connector_basic@prune-stale-modes:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#352)
>      * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7061) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +9 other tests skip
>      * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6911)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6900)
>      * igt@kms_plane_multiple@2x-tiling-none:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4596)
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6886) +3 other tests skip
>      * igt@kms_pm_dc@dc5-dpms:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#718)
>      * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489) +2
>             other tests skip
>      * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2893) +1
>             other test skip
>      * igt@kms_psr@pr-sprite-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406) +3 other tests skip
>      * igt@kms_psr@psr-primary-page-flip:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2234 / Intel
>             XE#2850) +4 other tests skip
>      * igt@kms_vrr@max-min@pipe-a-edp-1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#4227) +1 other test fail
>      * igt@xe_eudebug@basic-client-th:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837) +2 other tests skip
>      * igt@xe_eudebug@basic-vm-bind-discovery:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4837) +4 other tests skip
>      * igt@xe_eudebug_online@set-breakpoint:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837 / Intel XE#6665)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4837 / Intel XE#6665)
>      * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#688) +5 other tests skip
>      * igt@xe_evict@evict-mixed-many-threads-small:
> 
>           * shard-bmg: PASS -> INCOMPLETE (Intel XE#6321) +1 other test
>             incomplete
>      * igt@xe_evict@evict-small-multi-queue-priority:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7140) +2 other tests skip
>      * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +1 other test skip
>      * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +2 other tests skip
>      * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
> 
>           * shard-lnl: PASS -> DMESG-WARN (Intel XE#4537 / Intel XE#7063)
>      * igt@xe_exec_fault_mode@twice-multi-queue-imm:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7136) +3 other tests skip
>      * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7136) +3 other tests skip
>      * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6874) +11 other tests skip
>      * igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6874) +7 other tests skip
>      * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#5625)
>      * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6196) +1 other test skip
>      * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4943) +8 other tests skip
>      * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4943) +12 other tests skip
>      * igt@xe_exec_system_allocator@twice-malloc-prefetch-race:
> 
>           * shard-lnl: PASS -> DMESG-WARN (Intel XE#7063) +2 other tests
>             dmesg-warn
>      * igt@xe_exec_threads@threads-multi-queue-basic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7138) +1 other test skip
>      * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7138) +5 other tests skip
>      * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6964)
>      * igt@xe_multigpu_svm@mgpu-pagefault-conflict:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6964)
>      * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4733)
>      * igt@xe_query@multigpu-query-config:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#944)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#944)
> 
>     Possible fixes
> 
>      * igt@kms_atomic@plane-invalid-params:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> PASS +11 other tests pass
>      * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
> 
>           * shard-bmg: FAIL (Intel XE#5299) -> PASS
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>           * shard-bmg: FAIL (Intel XE#7030) -> PASS +1 other test pass
>      * igt@kms_flip@flip-vs-suspend:
> 
>           * shard-bmg: INCOMPLETE (Intel XE#2049 / Intel XE#2597) -> PASS +1
>             other test pass
>      * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
> 
>           * shard-lnl: DMESG-WARN (Intel XE#7063) -> PASS +1 other test pass
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-bmg: SKIP (Intel XE#1503) -> PASS
>      * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
> 
>           * shard-lnl: ABORT -> PASS +1 other test pass
>      * igt@xe_exec_basic@many-basic-defer-bind@bcs0:
> 
>           * shard-bmg: DMESG-FAIL -> PASS +1 other test pass
>      * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:
> 
>           * shard-bmg: ABORT -> PASS
>      * igt@xe_exec_system_allocator@many-large-mmap-remap:
> 
>           * shard-bmg: INCOMPLETE -> PASS
>      * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-madvise:
> 
>           * shard-bmg: SKIP (Intel XE#6557 / Intel XE#6703) -> PASS
>      * igt@xe_module_load@load:
> 
>           * shard-lnl: (SKIP, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS) (Intel XE#378) -> (PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS)
>      * igt@xe_pm@s3-d3hot-basic-exec:
> 
>           * shard-bmg: TIMEOUT (Intel XE#5213) -> PASS
> 
>     Warnings
> 
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#1124)
>      * igt@kms_frontbuffer_tracking@fbc-2p-rte:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#4141)
>      * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
> 
>           * shard-bmg: SKIP (Intel XE#1406 / Intel XE#6703) -> SKIP (Intel
>             XE#1406 / Intel XE#1489)
>      * igt@xe_evict@evict-threads-small-multi-queue:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#7140)
>      * igt@xe_exec_multi_queue@max-queues-preempt-mode-userptr-invalidate:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#6874) +1 other
>             test skip
>      * igt@xe_exec_threads@threads-multi-queue-mixed-basic:
> 
>           * shard-bmg: SKIP (Intel XE#6703) -> SKIP (Intel XE#7138)
> 
> Build changes
> 
>      * IGT: IGT_8717 -> IGTPW_14417
>      * Linux: xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b ->
>        xe-4448-0f7122915dfd558c57f69c4f97ebd64707a721cc
> 
>    IGTPW_14417: 14417
>    IGT_8717: 8717
>    xe-4447-6d7af7c5b6b121d5595b64be7dfcbf33be53287b:
>    6d7af7c5b6b121d5595b64be7dfcbf33be53287b
>    xe-4448-0f7122915dfd558c57f69c4f97ebd64707a721cc:
>    0f7122915dfd558c57f69c4f97ebd64707a721cc
