Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC798D41156
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 10:01:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CA810E731;
	Thu, 15 Jan 2026 10:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kv07Fuog";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0247C10E730
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 10:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768471307; x=1800007307;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=ZNa5I3YI0IETwguff0YMENgVD/02osdNVWJK987sJio=;
 b=Kv07FuogTJWLgMFRrKpsGGpfOHJr4w2O0dXJblABGZjqDa5kUA8Tn/hR
 Qc67naW7nOqNJuNbRy1Qi7l1tbJeoXpIsxCyxqyCsx0/O9WBezSSfOir5
 RYKDmZz5k48QnYH5c5h0/il0lSJojrcVNq2YIGVpkzMXdg0ISyQxg7RFz
 ru3n786PeuIMHqI2TTcL6Fvr0CyZ4p13RO0RlF5sf9E/P3xeyRKAiGxep
 /FkqtgKzA5MP5reApxHyS8yixpeS8EWlDgY0uLdmGIxSgjix3jqRhoXff
 31WZCi1hfUL/mTqGOg42DG5m8F06+S80XgTQiufNt4PkQDo8WdZortcLa Q==;
X-CSE-ConnectionGUID: VhAlM6SWRrGIjikWCYCmeQ==
X-CSE-MsgGUID: c+Gs1kADR96B9tHpjAbZvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73627218"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="73627218"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 02:01:46 -0800
X-CSE-ConnectionGUID: EHofRizqR92sfVkXeLCPsA==
X-CSE-MsgGUID: 35KsUGyrScqdFFz3WYfiCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="205327587"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.208])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 02:01:40 -0800
Date: Thu, 15 Jan 2026 11:01:36 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 Add xe3p compute kernels and preemption support (rev3)
Message-ID: <wd23r66l4exmwbqphc3ibrguk23snhlyh2cykxeihjtimtl6xl@vp2vowopn6aj>
References: <20260114151930.211512-7-zbigniew.kempczynski@intel.com>
 <176842379910.155684.14139872737327631146@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176842379910.155684.14139872737327631146@a3b018990fe9>
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

On Wed, Jan 14, 2026 at 08:49:59PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add xe3p compute kernels and preemption support (rev3)          
>    URL:     https://patchwork.freedesktop.org/series/159522/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14344/index.html 
> 
>           CI Bug Log - changes from IGT_8701_full -> IGTPW_14344_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_14344_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_14344_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14344/index.html
> 
> Participating hosts (9 -> 9)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_14344_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> INCOMPLETE +1 other test incomplete
>      * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
> 
>           * shard-dg1: PASS -> FAIL +1 other test fail
>      * igt@kms_rotation_crc@sprite-rotation-90:
> 
>           * shard-dg1: PASS -> INCOMPLETE
>      * igt@perf@polling-parameterized:
> 
>           * shard-tglu: PASS -> INCOMPLETE

Above failures are not related to the series. This applies to Xe.CI.Full
as well but I haven't received email for that.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_14344_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11078 / i915#14544)
>      * igt@drm_buddy@drm_buddy:
> 
>           * shard-glk: NOTRUN -> DMESG-WARN (i915#15095) +1 other test
>             dmesg-warn
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@ctrl-surf-copy:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_close_race@multigpu-basic-process:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7697) +1 other test skip
>      * igt@gem_close_race@multigpu-basic-threads:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_ctx_persistence@heartbeat-many:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8555) +1 other test skip
>      * igt@gem_ctx_persistence@smoketest:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#1099)
>      * igt@gem_ctx_sseu@invalid-args:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#280)
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#280)
>           * shard-dg1: NOTRUN -> SKIP (i915#280)
>           * shard-tglu: NOTRUN -> SKIP (i915#280)
>           * shard-mtlp: NOTRUN -> SKIP (i915#280)
>      * igt@gem_exec_balancer@noheartbeat:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8555) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_exec_balancer@parallel:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525) +2 other tests skip
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#4525)
>           * shard-tglu: NOTRUN -> SKIP (i915#4525) +2 other tests skip
>      * igt@gem_exec_balancer@parallel-out-fence:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_big@single:
> 
>           * shard-tglu: PASS -> ABORT (i915#11713)
>      * igt@gem_exec_capture@capture-invisible:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6334) +1 other test skip
>      * igt@gem_exec_capture@capture-recoverable:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6344)
>      * igt@gem_exec_reloc@basic-cpu-noreloc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +4 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-read-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +13 other tests skip
>      * igt@gem_exec_reloc@basic-write-wc-noreloc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +4 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +4 other tests skip
>      * igt@gem_exec_schedule@preempt-queue:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4537 / i915#4812)
>      * igt@gem_exec_schedule@reorder-wide:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4537 / i915#4812) +1 other test
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4812) +1 other test skip
>      * igt@gem_exec_schedule@semaphore-power:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7276)
>      * igt@gem_exec_suspend@basic-s0@smem:
> 
>           * shard-dg2: PASS -> INCOMPLETE (i915#13356) +3 other tests
>             incomplete
>      * igt@gem_fence_thrash@bo-copy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4860) +1 other test skip
>      * igt@gem_fenced_exec_thrash@too-many-fences:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_lmem_swapping@basic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@heavy-random:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_lmem_swapping@parallel-multi:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +7 other tests skip
>      * igt@gem_media_vme:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#284)
>      * igt@gem_mmap_gtt@coherency:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +5 other tests skip
>      * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +1 other test skip
>      * igt@gem_mmap_gtt@fault-concurrent-x:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +4 other tests skip
>      * igt@gem_mmap_wc@bad-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +1 other test skip
>      * igt@gem_mmap_wc@invalid-flags:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +1 other test skip
>      * igt@gem_partial_pwrite_pread@reads-uncached:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +2 other tests skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +6 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +2 other tests skip
>      * igt@gem_pread@bench:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +2 other tests skip
>      * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>      * igt@gem_pxp@hw-rejects-pxp-buffer:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13398)
>      * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428)
>      * igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +1 other test
>             skip
>      * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8411)
>      * igt@gem_softpin@evict-snoop-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4885)
>           * shard-dg1: NOTRUN -> SKIP (i915#4885)
>           * shard-mtlp: NOTRUN -> SKIP (i915#4885)
>      * igt@gem_tiled_pread_basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079)
>           * shard-dg1: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_userptr_blits@access-control:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_userptr_blits@coherency-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#3323)
>      * igt@gem_userptr_blits@forbidden-operations:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282 / i915#3297)
>      * igt@gem_userptr_blits@unsync-unmap-cycles:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3297) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_workarounds@suspend-resume:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13356 / i915#14586)
>      * igt@gen9_exec_parse@basic-rejected:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856)
>           * shard-dg2: NOTRUN -> SKIP (i915#2856)
>           * shard-dg1: NOTRUN -> SKIP (i915#2527)
>      * igt@gen9_exec_parse@bb-start-param:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2527 / i915#2856)
>      * igt@gen9_exec_parse@cmd-crossing-page:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 other test
>             skip
>      * igt@gen9_exec_parse@secure-batches:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +4 other tests skip
>      * igt@i915_drm_fdinfo@virtual-busy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#14118)
>           * shard-mtlp: NOTRUN -> SKIP (i915#14118) +1 other test skip
>      * igt@i915_drm_fdinfo@virtual-busy-hang-all:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14118) +1 other test skip
>      * igt@i915_module_load@fault-injection:
> 
>           * shard-rkl: NOTRUN -> ABORT (i915#15342 / i915#15481)
>           * shard-tglu-1: NOTRUN -> ABORT (i915#15342 / i915#15481)
>           * shard-glk: NOTRUN -> ABORT (i915#15342 / i915#15481)
>      * igt@i915_module_load@fault-injection@i915_driver_hw_probe:
> 
>           * shard-glk: NOTRUN -> ABORT (i915#15481)
>           * shard-rkl: NOTRUN -> ABORT (i915#15481)
>           * shard-tglu-1: NOTRUN -> ABORT (i915#15481)
>      * igt@i915_module_load@fault-injection@intel_connector_register:
> 
>           * shard-rkl: NOTRUN -> DMESG-WARN (i915#15342)
>           * shard-tglu-1: NOTRUN -> DMESG-WARN (i915#15342)
>           * shard-glk: NOTRUN -> DMESG-WARN (i915#15342)
>      * igt@i915_module_load@fault-injection@intel_gt_init-enodev:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15479) +4 other
>             tests skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15479) +4 other tests skip
>      * igt@i915_pm_freq_api@freq-reset-multiple:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8399)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#8399)
>      * igt@i915_pm_freq_mult@media-freq@gt0:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6590) +1 other test skip
>      * igt@i915_pm_rpm@system-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13356) +2 other tests
>             incomplete
>      * igt@i915_pm_rpm@system-suspend-devices:
> 
>           * shard-rkl: PASS -> ABORT (i915#15060)
>      * igt@i915_pm_rps@thresholds-idle-park:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11681)
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4387)
>      * igt@i915_power@sanity:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7984)
>      * igt@i915_query@test-query-geometry-subslices:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5723)
>      * igt@intel_hwmon@hwmon-read:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7707)
>      * igt@kms_async_flips@async-flip-suspend-resume:
> 
>           * shard-rkl: NOTRUN -> INCOMPLETE (i915#12761) +1 other test
>             incomplete
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#1769) +1 other test skip
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +2 other tests
>             skip
>      * igt@kms_big_fb@4-tiled-addfb:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +6 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +5 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>      * igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638) +6 other tests skip
>      * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3828) +1 other test skip
>      * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3828)
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3638)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-mtlp: NOTRUN -> SKIP +4 other tests skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +3 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538) +1 other test skip
>      * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>      * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +122 other
>             tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +44 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6095) +42 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +85 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +14 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#6095) +1 other test
>             skip
>      * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#14544 / i915#6095)
>      * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#4423)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12805)
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#6095) +64 other
>             tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-glk10: NOTRUN -> SKIP +102 other tests skip
>      * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6095) +34 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +129 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12313)
>           * shard-rkl: NOTRUN -> SKIP (i915#12313)
>           * shard-dg1: NOTRUN -> SKIP (i915#12313)
>           * shard-tglu: NOTRUN -> SKIP (i915#12313) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_chamelium_color@ctm-red-to-blue:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544) +1 other test skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11151 / i915#7828) +3 other
>             tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#11151 / i915#7828) +2 other
>             tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11151 / i915#7828) +2 other tests
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#11151 / i915#7828) +2 other tests
>             skip
>      * igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11151 / i915#7828) +3 other
>             tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#7828) +12 other
>             tests skip
>      * igt@kms_color_pipeline@plane-lut3d-green-only:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15523) +4 other tests skip
>      * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15523) +3 other tests skip
>      * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15523) +3 other tests skip
>      * igt@kms_content_protection@atomic-dpms-hdcp14:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6944)
>      * igt@kms_content_protection@atomic-dpms@pipe-a-dp-3:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#7173)
>      * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15330)
>      * igt@kms_content_protection@dp-mst-type-0-hdcp14:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15330) +1 other test skip
>      * igt@kms_content_protection@legacy-hdcp14:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6944)
>      * igt@kms_content_protection@srm:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118)
>      * igt@kms_content_protection@suspend-resume:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6944) +1 other test skip
>      * igt@kms_content_protection@uevent:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6944 / i915#7118 / i915#9424) +3
>             other tests skip
>      * igt@kms_cursor_crc@cursor-offscreen-128x42:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814)
>      * igt@kms_cursor_crc@cursor-random-128x42:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#13566) +3 other tests fail
>      * igt@kms_cursor_crc@cursor-random-32x32:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-random-512x170:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13049) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#13049) +2 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#13049)
>           * shard-mtlp: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-random-64x21@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#13566) +1 other test fail
>      * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-128x42:
> 
>           * shard-tglu: PASS -> FAIL (i915#13566) +3 other tests fail
>      * igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814)
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +1 other test skip
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP +32 other tests skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4103) +1 other test skip
>      * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
> 
>           * shard-rkl: PASS -> FAIL (i915#15564)
>      * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9809) +2 other tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13046 / i915#5354) +3 other tests
>             skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>           * shard-tglu: NOTRUN -> SKIP +50 other tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>           * shard-dg1: NOTRUN -> SKIP +13 other tests skip
>      * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9067)
>      * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9723)
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13691)
>           * shard-tglu: NOTRUN -> SKIP (i915#13691)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3804)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_dp_link_training@uhbr-mst:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13748)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13748)
>      * igt@kms_dp_link_training@uhbr-sst:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#13748)
>      * igt@kms_dsc@dsc-basic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840) +2 other tests
>             skip
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3840 / i915#9053)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3955)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4854)
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_fence_pin_leak:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4881)
>      * igt@kms_flip@2x-flip-vs-panning:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9934) +1 other test skip
>      * igt@kms_flip@2x-flip-vs-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12745 / i915#4839)
>      * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#4839)
>      * igt@kms_flip@2x-nonexisting-fb:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#9934) +3 other tests
>             skip
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9934) +15 other tests skip
>      * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3637 / i915#9934) +3 other
>             tests skip
>      * igt@kms_flip@2x-wf_vblank-ts-check:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +2 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672) +5 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15573) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2587 / i915#2672) +1 other
>             test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672) +2 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other
>             test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8810 / i915#8813) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672 / i915#3555) +5 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-rte:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15574) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15104)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15102) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15102 / i915#3458) +7 other tests
>             skip
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15102 / i915#3023)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15102 / i915#3023) +28 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +27 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +49 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15574) +4 other tests skip
>           * shard-dg2: NOTRUN -> SKIP (i915#15574) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#15574)
>      * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15574)
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15102)
>           * shard-dg1: NOTRUN -> SKIP (i915#15102)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15102)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15102) +11 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15102) +15 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#1825) +3 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
> 
>           * shard-snb: NOTRUN -> SKIP +115 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-pwrite:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15574) +8 other tests skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15574) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15102 / i915#3458) +7 other tests
>             skip
>      * igt@kms_hdr@bpc-switch-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-dg2: PASS -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228) +4 other tests
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228)
>           * shard-mtlp: NOTRUN -> SKIP (i915#12713 / i915#3555 / i915#8228)
>      * igt@kms_joiner@basic-force-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15459)
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15458)
>      * igt@kms_joiner@invalid-modeset-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15460)
>           * shard-tglu: NOTRUN -> SKIP (i915#15460)
>      * igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15458)
>      * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13522)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1839 / i915#4816)
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6301)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
> 
>           * shard-dg2: NOTRUN -> SKIP
>      * igt@kms_pipe_crc_basic@suspend-read-crc:
> 
>           * shard-glk10: NOTRUN -> INCOMPLETE (i915#12756 / i915#13409 /
>             i915#13476)
>      * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
> 
>           * shard-glk10: NOTRUN -> INCOMPLETE (i915#13409 / i915#13476)
>      * igt@kms_plane@plane-panning-bottom-right-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13026) +1 other test
>             incomplete
>      * igt@kms_plane_alpha_blend@alpha-basic:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#12178)
>      * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#7862) +1 other test fail
>      * igt@kms_plane_multiple@2x-tiling-x:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13958)
>           * shard-rkl: NOTRUN -> SKIP (i915#13958) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#13958)
>           * shard-tglu: NOTRUN -> SKIP (i915#13958) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@2x-tiling-yf:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
> 
>           * shard-glk: NOTRUN -> SKIP +281 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15329) +4 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#15329) +4 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15329) +3 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15329 / i915#3555 / i915#6953)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15329) +3 other tests skip
>      * igt@kms_pm_backlight@bad-brightness:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354)
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12343)
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3828)
>           * shard-dg2: NOTRUN -> SKIP (i915#3828)
>           * shard-rkl: NOTRUN -> SKIP (i915#3828) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3828)
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15073) +1 other test skip
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15073) +2 other tests skip
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15073)
>           * shard-dg1: PASS -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@package-g7:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15403)
>           * shard-mtlp: NOTRUN -> SKIP (i915#15403)
>           * shard-dg2: NOTRUN -> SKIP (i915#15403)
>           * shard-rkl: NOTRUN -> SKIP (i915#15403)
>           * shard-dg1: NOTRUN -> SKIP (i915#15403)
>      * igt@kms_prime@basic-modeset-hybrid:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_prime@d3hot:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6524) +1 other test skip
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11520)
>           * shard-rkl: NOTRUN -> SKIP (i915#11520) +8 other tests skip
>           * shard-snb: NOTRUN -> SKIP (i915#11520)
>           * shard-dg1: NOTRUN -> SKIP (i915#11520)
>           * shard-mtlp: NOTRUN -> SKIP (i915#12316)
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#11520) +5 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
> 
>           * shard-glk10: NOTRUN -> SKIP (i915#11520)
>      * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11520) +5 other tests skip
>      * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-pr-primary-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +8 other tests
>             skip
>      * igt@kms_psr@fbc-psr-sprite-plane-move:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +16 other tests skip
>      * igt@kms_psr@fbc-psr2-primary-mmap-cpu:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +6 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#14544 / i915#9732)
>      * igt@kms_psr@psr-cursor-plane-move:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +8 other tests
>             skip
>      * igt@kms_psr@psr-primary-mmap-cpu:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9732) +8 other tests skip
>      * igt@kms_psr@psr2-cursor-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +29 other tests
>             skip
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_rotation_crc@exhaust-fences:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4884)
>      * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5289)
>           * shard-dg1: NOTRUN -> SKIP (i915#5289)
>           * shard-tglu: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12755 / i915#5190)
>      * igt@kms_rotation_crc@sprite-rotation-270:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12755)
>           * shard-dg2: NOTRUN -> SKIP (i915#12755)
>      * igt@kms_selftest@drm_framebuffer:
> 
>           * shard-tglu: NOTRUN -> ABORT (i915#13179) +1 other test abort
>      * igt@kms_setmode@basic:
> 
>           * shard-tglu: PASS -> FAIL (i915#15106) +2 other tests fail
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_vrr@flip-basic-fastset:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_vrr@flipline:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15243 / i915#3555)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555)
>      * igt@kms_vrr@max-min:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-mtlp: PASS -> FAIL (i915#15420) +1 other test fail
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#9906)
>      * igt@kms_vrr@seamless-rr-switch-virtual:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9906)
>      * igt@perf_pmu@rc6-suspend:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#13520)
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3708) +1 other test skip
>      * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9917) +1 other test skip
>      * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#12910) +8 other tests fail
> 
>     Possible fixes
> 
>      * igt@gem_exec_suspend@basic-s0@smem:
> 
>           * shard-rkl: INCOMPLETE (i915#13356) -> PASS +1 other test pass
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * shard-dg2: DMESG-WARN (i915#5493) -> PASS +1 other test pass
>      * igt@gem_mmap_offset@clear-via-pagefault:
> 
>           * shard-mtlp: ABORT (i915#14809) -> PASS +1 other test pass
>      * igt@gem_softpin@noreloc-s3:
> 
>           * shard-rkl: INCOMPLETE (i915#13809) -> PASS
>      * igt@i915_pm_rc6_residency@rc6-fence:
> 
>           * shard-tglu: WARN (i915#13790 / i915#2681) -> PASS +1 other test
>             pass
>      * igt@i915_pm_rps@reset:
> 
>           * shard-snb: INCOMPLETE (i915#13729 / i915#13821) -> PASS
>      * igt@i915_power@sanity:
> 
>           * shard-mtlp: SKIP (i915#7984) -> PASS
>      * igt@i915_selftest@live@workarounds:
> 
>           * shard-dg2: DMESG-FAIL (i915#12061) -> PASS +1 other test pass
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-rkl: ABORT (i915#15131) -> PASS +3 other tests pass
>      * igt@i915_suspend@sysfs-reader:
> 
>           * shard-glk: INCOMPLETE (i915#4817) -> PASS
>      * igt@kms_atomic_transition@plane-all-transition:
> 
>           * shard-rkl: INCOMPLETE -> PASS
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
> 
>           * shard-mtlp: FAIL (i915#12469 / i915#5138) -> PASS
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-dg1: DMESG-WARN (i915#4423) -> PASS
>      * igt@kms_cursor_crc@cursor-onscreen-128x42:
> 
>           * shard-rkl: FAIL (i915#13566) -> PASS +3 other tests pass
>      * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: FAIL (i915#13566) -> PASS +1 other test pass
>      * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: INCOMPLETE (i915#12358 / i915#14152) -> PASS +1 other
>             test pass
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-glk: FAIL (i915#2346) -> PASS
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-dg2: SKIP (i915#3555) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
> 
>           * shard-dg2: FAIL (i915#15389 / i915#6880) -> PASS
>      * igt@kms_hdr@bpc-switch-suspend:
> 
>           * shard-dg2: SKIP (i915#3555 / i915#8228) -> PASS
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-rkl: SKIP (i915#3555 / i915#8228) -> PASS
>      * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
> 
>           * shard-mtlp: DMESG-WARN -> PASS
>      * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15073) -> PASS
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-dg1: SKIP (i915#15073) -> PASS
>      * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * shard-dg2: SKIP (i915#15073) -> PASS
>      * igt@kms_pm_rpm@system-suspend-idle:
> 
>           * shard-dg2: INCOMPLETE (i915#14419) -> PASS
>      * igt@perf_pmu@busy-double-start@rcs0:
> 
>           * shard-mtlp: FAIL (i915#4349) -> PASS
> 
>     Warnings
> 
>      * igt@gem_exec_balancer@parallel-balancer:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4525) -> SKIP (i915#4525)
>      * igt@gem_exec_reloc@basic-gtt-wc:
> 
>           * shard-rkl: SKIP (i915#3281) -> SKIP (i915#14544 / i915#3281) +1
>             other test skip
>      * igt@gem_exec_reloc@basic-scanout:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3281) -> SKIP (i915#3281) +3
>             other tests skip
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2190) -> SKIP (i915#2190)
>      * igt@gem_lmem_evict@dontneed-evict-race:
> 
>           * shard-rkl: SKIP (i915#4613 / i915#7582) -> SKIP (i915#14544 /
>             i915#4613 / i915#7582)
>      * igt@gem_media_vme:
> 
>           * shard-rkl: SKIP (i915#284) -> SKIP (i915#14544 / i915#284)
>      * igt@gem_partial_pwrite_pread@write-display:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3282) -> SKIP (i915#3282) +1
>             other test skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads:
> 
>           * shard-rkl: SKIP (i915#3282) -> SKIP (i915#14544 / i915#3282) +2
>             other tests skip
>      * igt@gen9_exec_parse@bb-start-cmd:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2527) -> SKIP (i915#2527)
>      * igt@gen9_exec_parse@valid-registers:
> 
>           * shard-rkl: SKIP (i915#2527) -> SKIP (i915#14544 / i915#2527) +1
>             other test skip
>      * igt@i915_module_load@resize-bar:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6412) -> SKIP (i915#6412)
>      * igt@i915_pm_freq_api@freq-basic-api:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8399) -> SKIP (i915#8399)
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-rkl: SKIP (i915#6245) -> SKIP (i915#14544 / i915#6245)
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
> 
>           * shard-rkl: SKIP (i915#5286) -> SKIP (i915#14544 / i915#5286)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#5286) -> SKIP (i915#5286) +2
>             other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>           * shard-dg1: SKIP (i915#4538 / i915#5286) -> SKIP (i915#4423 /
>             i915#4538 / i915#5286)
>      * igt@kms_big_fb@linear-16bpp-rotate-90:
> 
>           * shard-rkl: SKIP (i915#3638) -> SKIP (i915#14544 / i915#3638)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP +5 other tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6095) -> SKIP (i915#6095) +2
>             other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#14098 /
>             i915#14544 / i915#6095) +2 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#6095) -> SKIP (i915#14544 / i915#6095) +1
>             other test skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#14544 / i915#6095) -> SKIP
>             (i915#14098 / i915#6095) +5 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> 
>           * shard-rkl: SKIP (i915#12313 / i915#14544) -> SKIP (i915#12313)
>      * igt@kms_chamelium_hpd@dp-hpd:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#14544 / i915#7828) -> SKIP
>             (i915#11151 / i915#7828) +2 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#7828) -> SKIP (i915#11151 /
>             i915#14544 / i915#7828) +3 other tests skip
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-dg2: SKIP (i915#6944 / i915#7118 / i915#9424) -> FAIL
>             (i915#7173)
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-rkl: SKIP (i915#6944 / i915#9424) -> SKIP (i915#14544 /
>             i915#6944 / i915#9424)
>           * shard-dg1: SKIP (i915#6944 / i915#9424) -> SKIP (i915#9433)
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>           * shard-rkl: SKIP (i915#13049 / i915#14544) -> SKIP (i915#13049)
>      * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>           * shard-rkl: SKIP -> SKIP (i915#14544) +6 other tests skip
>      * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
> 
>           * shard-dg1: SKIP (i915#3555 / i915#4423) -> SKIP (i915#3555)
>      * igt@kms_dp_aux_dev:
> 
>           * shard-rkl: SKIP (i915#1257 / i915#14544) -> SKIP (i915#1257)
>      * igt@kms_dp_link_training@non-uhbr-sst:
> 
>           * shard-rkl: SKIP (i915#13749 / i915#14544) -> SKIP (i915#13749)
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3955) -> SKIP (i915#3955)
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-rkl: SKIP (i915#1839) -> SKIP (i915#14544 / i915#1839)
>      * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9934) -> SKIP (i915#9934) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
> 
>           * shard-rkl: SKIP (i915#2672 / i915#3555) -> SKIP (i915#14544 /
>             i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: SKIP (i915#2672) -> SKIP (i915#14544 / i915#2672)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2672 / i915#3555) -> SKIP
>             (i915#2672 / i915#3555) +2 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2672) -> SKIP (i915#2672) +2
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1825) -> SKIP (i915#1825) +6
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
> 
>           * shard-rkl: SKIP (i915#15102) -> SKIP (i915#14544 / i915#15102)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#15102 / i915#3023) -> SKIP (i915#14544 /
>             i915#15102 / i915#3023) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#15102 / i915#3458) -> SKIP
>             (i915#15102 / i915#3458) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15102) -> SKIP (i915#15102)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
> 
>           * shard-dg1: SKIP (i915#15102 / i915#3458) -> SKIP (i915#15102 /
>             i915#3458 / i915#4423)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15102 / i915#3023) -> SKIP
>             (i915#15102 / i915#3023) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
> 
>           * shard-rkl: SKIP (i915#1825) -> SKIP (i915#14544 / i915#1825) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15574) -> SKIP (i915#15574) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
> 
>           * shard-dg2: SKIP (i915#15102 / i915#3458) -> SKIP (i915#10433 /
>             i915#15102 / i915#3458) +1 other test skip
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-dg2: SKIP (i915#13331) -> SKIP (i915#12713)
>           * shard-dg1: SKIP (i915#12713) -> SKIP (i915#1187 / i915#12713)
>      * igt@kms_hdr@static-swap:
> 
>           * shard-dg2: FAIL -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#14712) -> SKIP (i915#14712)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15329) -> SKIP (i915#15329) +3
>             other tests skip
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
> 
>           * shard-rkl: SKIP (i915#15329) -> SKIP (i915#14544 / i915#15329) +3
>             other tests skip
>      * igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9685) -> SKIP (i915#9685) +1
>             other test skip
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-tglu: SKIP (i915#15128) -> FAIL (i915#9295)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-dg1: SKIP (i915#9340) -> SKIP (i915#3828)
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
> 
>           * shard-dg1: SKIP (i915#11520 / i915#4423) -> SKIP (i915#11520)
>      * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-rkl: SKIP (i915#11520 / i915#14544) -> SKIP (i915#11520) +1
>             other test skip
>      * igt@kms_psr@pr-sprite-render:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 /
>             i915#14544 / i915#9732) +2 other tests skip
>      * igt@kms_psr@psr-primary-mmap-cpu:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#14544 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732) +7 other tests skip
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8623) -> SKIP (i915#8623)
>      * igt@kms_vrr@flip-dpms:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15243 / i915#3555) -> SKIP
>             (i915#15243 / i915#3555)
>      * igt@kms_vrr@lobf:
> 
>           * shard-rkl: SKIP (i915#11920) -> SKIP (i915#11920 / i915#14544)
>      * igt@kms_vrr@seamless-rr-switch-virtual:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9906) -> SKIP (i915#9906)
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8701 -> IGTPW_14344
> 
>    CI-20190529: 20190529
>    CI_DRM_17819: d5b0278e4bea2fb27de6d12b7f865a74072af677 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_14344: 14344
>    IGT_8701: 8701
