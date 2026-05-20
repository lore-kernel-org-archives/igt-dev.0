Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDC8CD4F3D
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 13:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D7110E65F;
	Wed, 20 May 2026 13:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e0R8iagj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D6310E65F
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 13:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779282680; x=1810818680;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=J0nDbaBnhxJAPDv4aExhTAzclbZah9mcSDuDVYS2VYg=;
 b=e0R8iagjF9CFOtqzDardPJIyxEHEmrINtcJRBvFMSYdU++OKoDvSAS6A
 EO7szAvuqUIhgv2L+sdWqyOsF4RpZDx1jxZ37GFypiBFzKtJIwChgphsF
 Ma+4Ob06OfbMnzv839H+6frQIhdkTa1fkNAiJZm+ekeGa/+uM2aKlN9O9
 c3GRZ8v0vd5J1jzZvyRhvkURE3gUoxJ3rLEVNA7lulZtWL699r+fsdFpE
 I2kcSmio5JEGq67dInWUABKQD+pxFIrl68GIrdHfkR6+wHDHHKxl38FfD
 kSj9+P4L5I+B8uqN9Cvb25Du/j5oZm2RcEWd5Zs+VTVPy+oQlGTLsMuHU w==;
X-CSE-ConnectionGUID: TbIrHBXbQ46vbNmBWqq1eA==
X-CSE-MsgGUID: 04sYUc+XRoWClx7pPF52yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80297364"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="80297364"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 06:11:20 -0700
X-CSE-ConnectionGUID: pHcNeJB+QfO7ZK7TqSQQnQ==
X-CSE-MsgGUID: eEPmHY/GS0aMewc+V6GUag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="235912224"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.99])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 06:11:19 -0700
Date: Wed, 20 May 2026 15:11:17 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 tests/xe_pat: Use S3 instead of standby
Message-ID: <bacfwtozymuhqdeulb2c74idjlfoxoepecwwr5u77u6cb6dvgq@jqmf5g2c6vya>
References: <20260519091108.106853-2-zbigniew.kempczynski@intel.com>
 <177927313516.89640.10530703348221069834@5ab824fced77>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177927313516.89640.10530703348221069834@5ab824fced77>
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

On Wed, May 20, 2026 at 10:32:15AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/xe_pat: Use S3 instead of standby                          
>    URL:     https://patchwork.freedesktop.org/series/166853/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15206/index.html 
> 
>         CI Bug Log - changes from XEIGT_8921_FULL -> XEIGTPW_15206_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_15206_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_15206_FULL, please notify your bug team
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
>    XEIGTPW_15206_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_flip@wf_vblank-ts-check:
>           * shard-bmg: NOTRUN -> ABORT +1 other test abort
> 
>     Warnings
> 
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-lnl: SKIP (Intel XE#6312 / Intel XE#651) -> ABORT
>      * igt@xe_pat@pat-sw-hw-suspend:
> 
>           * shard-bmg: SKIP (Intel XE#7590) -> FAIL
>           * shard-lnl: SKIP (Intel XE#7590) -> FAIL

That's expected. Previous skip wasn't correct result. Fail will be
addressed by a followup or kmd change.

--
Zbigniew


> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_15206_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#7445)
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +4 other tests skip
>      * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7679)
>      * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#367)
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +5 other tests skip
>      * igt@kms_chamelium_color@ctm-green-to-red:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2325 / Intel XE#7358)
>      * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +1 other test skip
>      * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#3304 / Intel XE#7374) +1
>             other test fail
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2390 / Intel XE#6974)
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2321 / Intel XE#7355)
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#7571)
>      * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1508)
>      * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#301) +1 other test fail
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7178 / Intel XE#7351) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656 / Intel XE#7905)
>      * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +17 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +22 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7061 / Intel XE#7356) +2
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#7905)
>      * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7061) +1 other test skip
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1503)
>      * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7922) +3 other tests skip
>      * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7915) +1 other test skip
>      * igt@kms_pipe_crc_basic@disable-crc-after-crtc:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#6557 / Intel XE#6703) +1 other
>             test skip
>      * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7130) +1 other test skip
>      * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7283) +1 other test skip
>      * igt@kms_plane_multiple@2x-tiling-y:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5021 / Intel XE#7377)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2763 / Intel XE#6886) +4
>             other tests skip
>      * igt@kms_pm_dc@dc5-dpms:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#7340 / Intel XE#7504)
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#3141 / Intel
>             XE#7383 / Intel XE#836)
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1489) +2 other tests skip
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2387 / Intel XE#7429)
>      * igt@kms_psr@fbc-pr-dpms:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406)
>      * igt@kms_psr@psr-sprite-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2234 / Intel XE#2850) +3
>             other tests skip
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-lnl: PASS -> SKIP (Intel XE#4692 / Intel XE#7508)
>      * igt@kms_rotation_crc@bad-pixel-format:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3904 / Intel XE#7342)
>      * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#2142) +1 other test fail
>      * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7636) +2 other tests skip
>      * igt@xe_evict@evict-cm-threads-small-multi-queue:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7140)
>      * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322 / Intel XE#7372) +5
>             other tests skip
>      * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7136) +1 other test skip
>      * igt@xe_exec_multi_queue@max-queues-basic:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6874) +14 other tests skip
>      * igt@xe_exec_reset@cm-multi-queue-cat-error:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7866) +2 other tests skip
>      * igt@xe_exec_system_allocator@many-64k-mmap-file-nomemset:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6703) +20 other tests skip
>      * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7138) +3 other tests skip
>      * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6964) +1 other test skip
>      * igt@xe_page_reclaim@invalid-1g:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#7793) +1 other test skip
>      * igt@xe_pat@pat-index-xelpg:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2236 / Intel XE#7590)
>      * igt@xe_query@multigpu-query-topology:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#6703) +146 other tests skip
> 
>     Possible fixes
> 
>      * igt@kms_hdmi_inject@inject-audio:
> 
>           * shard-bmg: SKIP (Intel XE#7308) -> PASS
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-bmg: SKIP (Intel XE#2685 / Intel XE#3307) -> PASS
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-lnl: FAIL (Intel XE#7340) -> PASS
>      * igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap:
> 
>           * shard-lnl: ABORT (Intel XE#8044) -> PASS
>      * igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16:
> 
>           * shard-bmg: FAIL (Intel XE#7992) -> PASS +24 other tests pass
> 
>     Warnings
> 
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-bmg: SKIP (Intel XE#1124) -> SKIP (Intel XE#6703) +1 other
>             test skip
>      * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
> 
>           * shard-bmg: SKIP (Intel XE#367) -> SKIP (Intel XE#6703)
>      * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
> 
>           * shard-bmg: SKIP (Intel XE#2887) -> SKIP (Intel XE#6703) +2 other
>             tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-bmg: SKIP (Intel XE#3432) -> SKIP (Intel XE#6703)
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> 
>           * shard-bmg: SKIP (Intel XE#2652) -> SKIP (Intel XE#6703)
>      * igt@kms_chamelium_edid@dp-mode-timings:
> 
>           * shard-bmg: SKIP (Intel XE#2252) -> SKIP (Intel XE#6703) +2 other
>             tests skip
>      * igt@kms_content_protection@dp-mst-type-0-hdcp14:
> 
>           * shard-bmg: SKIP (Intel XE#6974) -> SKIP (Intel XE#6703)
>      * igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>           * shard-bmg: SKIP (Intel XE#2320) -> SKIP (Intel XE#6703)
>      * igt@kms_dp_linktrain_fallback@dsc-fallback:
> 
>           * shard-bmg: SKIP (Intel XE#4331 / Intel XE#7227) -> SKIP (Intel
>             XE#6703)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
> 
>           * shard-bmg: SKIP (Intel XE#7178 / Intel XE#7351) -> SKIP (Intel
>             XE#6703)
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
> 
>           * shard-bmg: SKIP (Intel XE#7178 / Intel XE#7351) -> SKIP (Intel
>             XE#6557 / Intel XE#6703)
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#6703) +10 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#4141) -> SKIP (Intel XE#6703) +4 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#7061 / Intel XE#7356) -> SKIP (Intel
>             XE#6703)
>      * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#7061) -> SKIP (Intel XE#6703)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#6703) +12 other
>             tests skip
>      * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
> 
>           * shard-bmg: SKIP (Intel XE#7283) -> SKIP (Intel XE#6703) +1 other
>             test skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
> 
>           * shard-bmg: SKIP (Intel XE#2763 / Intel XE#6886) -> SKIP (Intel
>             XE#6703)
>      * igt@kms_pm_backlight@fade:
> 
>           * shard-bmg: SKIP (Intel XE#7376 / Intel XE#7760 / Intel XE#870) ->
>             SKIP (Intel XE#6703)
>      * igt@kms_pm_rpm@package-g7:
> 
>           * shard-bmg: SKIP (Intel XE#6814 / Intel XE#7428) -> SKIP (Intel
>             XE#6703)
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
> 
>           * shard-bmg: SKIP (Intel XE#1489) -> SKIP (Intel XE#6703)
>      * igt@kms_psr@psr-sprite-plane-onoff:
> 
>           * shard-bmg: SKIP (Intel XE#2234 / Intel XE#2850) -> SKIP (Intel
>             XE#6703) +3 other tests skip
>      * igt@kms_sharpness_filter@filter-toggle:
> 
>           * shard-bmg: SKIP (Intel XE#6503) -> SKIP (Intel XE#6703)
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-bmg: FAIL (Intel XE#1729 / Intel XE#7424) -> SKIP (Intel
>             XE#2426 / Intel XE#5848)
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-bmg: SKIP (Intel XE#2509 / Intel XE#7437) -> SKIP (Intel
>             XE#2426 / Intel XE#5848)
>      * igt@kms_tv_load_detect@load-detect:
> 
>           * shard-bmg: SKIP (Intel XE#2450 / Intel XE#5857) -> SKIP (Intel
>             XE#6557 / Intel XE#6703)
>      * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
> 
>           * shard-bmg: SKIP (Intel XE#7636) -> SKIP (Intel XE#6703)
>      * igt@xe_eudebug_sriov@deny-eudebug:
> 
>           * shard-bmg: SKIP (Intel XE#5793 / Intel XE#7320 / Intel XE#7464)
>             -> SKIP (Intel XE#6703)
>      * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
> 
>           * shard-bmg: SKIP (Intel XE#2322 / Intel XE#7372) -> SKIP (Intel
>             XE#6703) +2 other tests skip
>      * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm:
> 
>           * shard-bmg: SKIP (Intel XE#7136) -> SKIP (Intel XE#6703) +3 other
>             tests skip
>      * igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority:
> 
>           * shard-bmg: SKIP (Intel XE#6874) -> SKIP (Intel XE#6703) +6 other
>             tests skip
>      * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
> 
>           * shard-bmg: SKIP (Intel XE#7138) -> SKIP (Intel XE#6703) +2 other
>             tests skip
>      * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
> 
>           * shard-bmg: SKIP (Intel XE#6281 / Intel XE#7426) -> SKIP (Intel
>             XE#6703)
>      * igt@xe_query@multigpu-query-mem-usage:
> 
>           * shard-bmg: SKIP (Intel XE#944) -> SKIP (Intel XE#6703) +1 other
>             test skip
> 
> Build changes
> 
>      * IGT: IGT_8921 -> IGTPW_15206
>      * Linux: xe-5096-eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497 ->
>        xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe
> 
>    IGTPW_15206: 5fecffb7878abce3c65f367c5a27d02423520238 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8921: 8921
>    xe-5096-eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497:
>    eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497
>    xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe:
>    81e61a51364beae8f6e63a2d89c776a6b4b323fe
