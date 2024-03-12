Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B036FC54E66
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 07:21:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EE010F0EB;
	Tue, 12 Mar 2024 07:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YFoTtiZ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F390D10F0EB
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 07:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710228110; x=1741764110;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=ZL52gjXvsX2xVm6TJkFuY4uh/yiXuHwAqqI57/Z3QWk=;
 b=YFoTtiZ25Y3KwY67zlsdG1G8JbjtnoPYu6EYf0AcK3D4fQmVvggxmhiN
 LBQbHF58eaBmzP5jwaCf25zcrRBDgN8C2Mn6fq1NnCsEKxdHyPExWezbt
 C6Gs3KGLKwNCDOgWfXbja61pFk056400KDrf5lpt6S1bh0DqCt7WEGMjp
 BcG44L/TXUOL66UHJVNWoY2qLsIHRj4JlCDyEfbY5LWT4opYtbPzB8/WI
 7pJPAODIrIi/lVuV+q1WXoVXvVkwHEnHEDZsrklHJNptsSBxGbBVtl4Ne
 L1s6/s1LsZVHldmZRxLS3JE917m9zRNzP0kSgNgeuiG8X/gG7oplme1wk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="22378627"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; d="scan'208";a="22378627"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 00:21:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; d="scan'208";a="11540321"
Received: from unknown (HELO localhost) ([10.245.244.207])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 00:21:47 -0700
Date: Tue, 12 Mar 2024 08:21:44 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/xe_ccs: Separate inc dimension start width
Message-ID: <20240312072144.mrkayilli7p6kis3@zkempczy-mobl2>
References: <20240311114730.77947-1-zbigniew.kempczynski@intel.com>
 <171021042545.681939.2783558559244211847@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171021042545.681939.2783558559244211847@8e613ede5ea5>
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

On Tue, Mar 12, 2024 at 02:27:05AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/xe_ccs: Separate inc dimension start width                
>    URL:     https://patchwork.freedesktop.org/series/130977/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10802/index.html 
> 
>         CI Bug Log - changes from CI_DRM_14420_full -> IGTPW_10802_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_10802_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_10802_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10802/index.html
> 
> Participating hosts (8 -> 8)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_10802_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-dg1: PASS -> ABORT
>      * igt@gem_lmem_swapping@verify-ccs@lmem0:
> 
>           * shard-dg2: NOTRUN -> FAIL
>      * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1:
> 
>           * shard-rkl: PASS -> FAIL +1 other test fail

Unrelated to the change, I touch xe_ccs subtest only.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_10802_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@device_reset@unbind-cold-reset-rebind:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7701)
>      * igt@drm_fdinfo@busy-hang@rcs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8414) +12 other tests skip
>      * igt@drm_fdinfo@busy-idle-check-all@ccs3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8414) +30 other tests skip
>      * igt@drm_fdinfo@busy-idle-check-all@vcs1:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8414) +16 other tests skip
>      * igt@drm_fdinfo@virtual-idle:
> 
>           * shard-rkl: PASS -> FAIL (i915#7742)
>      * igt@gem_busy@semaphore:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3936)
>           * shard-dg1: NOTRUN -> SKIP (i915#3936)
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE (i915#9364)
>      * igt@gem_create@create-ext-set-pat:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8562)
>      * igt@gem_ctx_persistence@hang:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@heartbeat-hostile:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_sseu@invalid-args:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#280)
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@kms:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#5784)
>      * igt@gem_eio@reset-stress:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#5784)
>      * igt@gem_exec_balancer@invalid-bonds:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4036)
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_capture@capture-invisible@smem0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6334)
>      * igt@gem_exec_capture@many-4k-incremental:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#9606)
>      * igt@gem_exec_fair@basic-none-share:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +5 other tests
>             skip
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-tglu: PASS -> FAIL (i915#2842) +1 other test fail
>      * igt@gem_exec_fair@basic-pace@bcs0:
> 
>           * shard-rkl: PASS -> FAIL (i915#2842) +1 other test fail
>      * igt@gem_exec_fair@basic-sync:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4473 / i915#4771) +2 other tests
>             skip
>      * igt@gem_exec_fair@basic-throttle:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539)
>      * igt@gem_exec_fence@concurrent:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812) +1 other test skip
>      * igt@gem_exec_fence@submit3@vecs0:
> 
>           * shard-glk: PASS -> DMESG-WARN (i915#118)
>      * igt@gem_exec_fence@submit67:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_flush@basic-uc-rw-default:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852) +3 other tests
>             skip
>      * igt@gem_exec_gttfill@multigpu-basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7697)
>           * shard-dg1: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_exec_reloc@basic-range-active:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +5 other tests skip
>      * igt@gem_exec_reloc@basic-wc-gtt-active:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +3 other tests skip
>      * igt@gem_exec_reloc@basic-wc-read:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +6 other tests skip
>      * igt@gem_exec_reloc@basic-write-read-active:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +13 other tests skip
>      * igt@gem_exec_schedule@reorder-wide:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4537 / i915#4812) +1 other test
>             skip
>      * igt@gem_exec_suspend@basic-s4-devices@smem:
> 
>           * shard-rkl: NOTRUN -> ABORT (i915#7975 / i915#8213)
>      * igt@gem_fence_thrash@bo-write-verify-x:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860) +2 other tests skip
>      * igt@gem_fenced_exec_thrash@2-spare-fences:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4860) +2 other tests skip
>      * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_lmem_evict@dontneed-evict-race:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613 / i915#7582)
>      * igt@gem_lmem_swapping@heavy-multi@lmem0:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#10378)
>      * igt@gem_lmem_swapping@heavy-random:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4565)
>      * igt@gem_lmem_swapping@heavy-verify-multi@lmem0:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#10378)
>      * igt@gem_lmem_swapping@massive-random:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@verify:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_madvise@dontneed-before-exec:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282)
>      * igt@gem_media_fill@media-fill:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8289)
>      * igt@gem_mmap_gtt@hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +20 other tests skip
>      * igt@gem_mmap_gtt@hang-busy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +8 other tests skip
>      * igt@gem_mmap_gtt@medium-copy-odd:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +12 other tests skip
>      * igt@gem_mmap_wc@bad-offset:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +3 other tests skip
>      * igt@gem_mmap_wc@invalid-flags:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +10 other tests skip
>      * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +4 other tests skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +6 other tests skip
>      * igt@gem_pread@snoop:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +5 other tests skip
>      * igt@gem_pxp@display-protected-crc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_pxp@regular-baseline-src-copy-readible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +5 other tests skip
>      * igt@gem_pxp@reject-modify-context-protection-on:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +3 other tests skip
>      * igt@gem_pxp@verify-pxp-stale-buf-execution:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>      * igt@gem_readwrite@write-bad-handle:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +2 other tests skip
>      * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +2 other tests skip
>      * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8411)
>      * igt@gem_set_tiling_vs_gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4079) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_softpin@evict-snoop:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4885) +1 other test skip
>      * igt@gem_softpin@evict-snoop-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4885)
>      * igt@gem_tiled_pread_pwrite:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_unfence_active_buffers:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4879)
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297) +3 other tests skip
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3323)
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@unsync-overlap:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_userptr_blits@unsync-unmap:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@unsync-unmap-after-close:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gen9_exec_parse@basic-rejected-ctx-param:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856)
>      * igt@gen9_exec_parse@bb-secure:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2527) +2 other tests skip
>      * igt@gen9_exec_parse@bb-start-cmd:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527)
>      * igt@gen9_exec_parse@unaligned-access:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +5 other tests skip
>      * igt@i915_module_load@load:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6227)
>           * shard-dg2: NOTRUN -> SKIP (i915#6227)
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-dg1: PASS -> INCOMPLETE (i915#9849)
>      * igt@i915_pm_rps@min-max-config-idle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6621)
>           * shard-dg1: NOTRUN -> SKIP (i915#6621)
>      * igt@i915_pm_rps@thresholds-idle-park@gt0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8925)
>      * igt@i915_pm_rps@thresholds-idle@gt0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8925)
>      * igt@i915_pm_rps@thresholds-idle@gt1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8925)
>      * igt@i915_pm_rps@thresholds-park@gt0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8925)
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4387)
>           * shard-dg1: NOTRUN -> SKIP (i915#4387)
>      * igt@i915_power@sanity:
> 
>           * shard-mtlp: PASS -> SKIP (i915#7984)
>      * igt@i915_query@test-query-geometry-subslices:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5723)
>      * igt@i915_selftest@mock@memory_region:
> 
>           * shard-dg1: NOTRUN -> DMESG-WARN (i915#9311)
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7707)
>      * igt@kms_addfb_basic@clobberred-modifier:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4212) +3 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4212) +1 other test skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8709) +7 other tests skip
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1769 / i915#3555)
>           * shard-rkl: NOTRUN -> SKIP (i915#1769 / i915#3555)
>           * shard-dg1: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +3 other tests
>             skip
>      * igt@kms_big_fb@4-tiled-addfb:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +3 other tests skip
>      * igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>           * shard-mtlp: NOTRUN -> SKIP +9 other tests skip
>      * igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3638) +2 other tests skip
>      * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +10 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#6187)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-tglu: PASS -> FAIL (i915#3743)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +15 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538) +1 other test skip
>      * igt@kms_big_joiner@basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2705)
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +79 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +51 other tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#10278) +1 other test skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +7 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10278) +1 other test skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +27 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#10278)
>      * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307) +143 other tests skip
>      * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7828) +1 other test skip
>      * igt@kms_chamelium_frames@hdmi-crc-fast:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7828) +14 other tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7828) +4 other tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7828) +4 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7828) +3 other tests skip
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7118 / i915#9424) +1 other test
>             skip
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3299) +1 other test skip
>      * igt@kms_content_protection@legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6944 / i915#9424)
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9424) +1 other test skip
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3359) +1 other test skip
>      * igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3359) +1 other test skip
>      * igt@kms_cursor_crc@cursor-random-512x170:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3359) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3359)
>      * igt@kms_cursor_crc@cursor-random-max-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814) +2 other tests
>             skip
>      * igt@kms_cursor_crc@cursor-sliding-32x10:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +3 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-64x21:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814)
>      * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9809) +3 other tests skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4213) +1 other test skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213) +1 other test
>             skip
>      * igt@kms_cursor_legacy@torture-bo@pipe-a:
> 
>           * shard-tglu: PASS -> DMESG-WARN (i915#10166)
>      * igt@kms_cursor_legacy@torture-move@pipe-a:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#10166)
>      * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9723) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP (i915#9833)
>      * igt@kms_draw_crc@draw-method-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8812)
>           * shard-dg2: NOTRUN -> SKIP (i915#8812)
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3840 / i915#9688)
>      * igt@kms_dsc@dsc-with-bpc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#3840) +1 other test
>             skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840)
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3469)
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9337)
>      * igt@kms_feature_discovery@psr1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#658)
>      * igt@kms_feature_discovery@psr2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#658)
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637) +4 other tests skip
>      * igt@kms_flip@2x-modeset-vs-vblank-race:
> 
>           * shard-dg2: NOTRUN -> SKIP +35 other tests skip
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +4 other tests skip
>      * igt@kms_flip@flip-vs-fences-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8381) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#8381)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8810)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672) +3 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8810)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +5 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other test
>             skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +51 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +18 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
> 
>           * shard-snb: PASS -> SKIP
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +14 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-dg1: NOTRUN -> SKIP +37 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#6880)
>           * shard-dg1: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +22 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +12 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:
> 
>           * shard-tglu: NOTRUN -> SKIP +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +13 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP +21 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +25 other tests skip
>      * igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10070)
>           * shard-dg1: NOTRUN -> SKIP (i915#10070)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +13 other tests skip
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@static-swap:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228) +2 other tests
>             skip
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_plane_lowres@tiling-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8821)
>      * igt@kms_plane_lowres@tiling-yf:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8821)
>      * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#8292)
>      * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
> 
>           * shard-dg1: PASS -> FAIL (i915#8292)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9423) +7 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5176) +3 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9423) +3 other tests skip
>      * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9423) +3 other tests skip
>      * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5176 / i915#9423) +3 other tests
>             skip
>      * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5176 / i915#9423) +1 other test
>             skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5235) +5 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5235) +5 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5235) +11 other tests skip
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235 / i915#9423) +19 other tests
>             skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#5235) +1 other test
>             skip
>      * igt@kms_pm_backlight@bad-brightness:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354)
>           * shard-dg1: NOTRUN -> SKIP (i915#5354) +2 other tests skip
>      * igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9685) +1 other test skip
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9340)
>      * igt@kms_pm_lpsp@screens-disabled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8430)
>      * igt@kms_pm_rpm@dpms-non-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * shard-rkl: PASS -> SKIP (i915#9519)
>      * igt@kms_prime@basic-modeset-hybrid:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6524) +1 other test skip
>      * igt@kms_prime@d3hot:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-pr-no-drrs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9732) +9 other tests skip
>      * igt@kms_psr@fbc-psr-primary-page-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9673 / i915#9732) +1 other test
>             skip
>      * igt@kms_psr@pr-primary-render:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +6 other tests skip
>      * igt@kms_psr@pr-sprite-plane-onoff:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9732) +20 other tests skip
>      * igt@kms_psr@psr-primary-mmap-cpu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9732) +27 other tests skip
>      * igt@kms_psr@psr-primary-render:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +2 other tests skip
>      * igt@kms_psr@psr2-sprite-plane-onoff:
> 
>           * shard-glk: NOTRUN -> SKIP +194 other tests skip
>      * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4235)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4235 / i915#5190)
>      * igt@kms_rotation_crc@sprite-rotation-90:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#8875 / i915#9569)
>      * igt@kms_setmode@clone-exclusive-crtc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>      * igt@kms_sysfs_edid_timing:
> 
>           * shard-dg2: PASS -> FAIL (IGT#2)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
> 
>           * shard-snb: PASS -> FAIL (i915#9196)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
> 
>           * shard-tglu: PASS -> FAIL (i915#9196)
>      * igt@kms_vrr@max-min:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_vrr@seamless-rr-switch-vrr:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8808 / i915#9906)
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2437)
>      * igt@kms_writeback@writeback-check-output-xrgb2101010:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#2437)
>      * igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2437 / i915#9412)
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2437)
>      * igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2436)
>      * igt@perf_pmu@busy-double-start@bcs0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#4349)
>      * igt@perf_pmu@frequency@gt0:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#6806)
>      * igt@perf_pmu@rc6-all-gts:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8516)
>      * igt@perf_pmu@rc6@runtime-pm-long-gt0:
> 
>           * shard-dg2: PASS -> ABORT (i915#9853)
>      * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE (i915#5493)
>      * igt@prime_vgem@basic-fence-read:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3291 / i915#3708)
>      * igt@prime_vgem@basic-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3708 / i915#4077)
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708 / i915#4077)
>      * igt@prime_vgem@fence-read-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708)
>      * igt@sriov_basic@enable-vfs-autoprobe-on:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9917)
>      * igt@sriov_basic@enable-vfs-bind-unbind-each:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9917) +2 other tests skip
>      * igt@syncobj_timeline@invalid-wait-zero-handles:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#9781)
>           * shard-dg1: NOTRUN -> FAIL (i915#9781)
>      * igt@v3d/v3d_create_bo@create-bo-zeroed:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2575) +4 other tests skip
>      * igt@v3d/v3d_get_param@get-bad-param:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2575) +10 other tests skip
>      * igt@v3d/v3d_submit_cl@bad-perfmon:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2575)
>      * igt@v3d/v3d_submit_cl@simple-flush-cache:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2575) +19 other tests skip
>      * igt@vc4/vc4_perfmon@destroy-invalid-perfmon:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7711) +3 other tests skip
>      * igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7711) +5 other tests skip
>      * igt@vc4/vc4_purgeable_bo@mark-purgeable:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7711) +2 other tests skip
>      * igt@vc4/vc4_wait_bo@bad-bo:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7711) +12 other tests skip
> 
>     Possible fixes
> 
>      * igt@drm_fdinfo@most-busy-check-all@rcs0:
> 
>           * shard-rkl: FAIL (i915#7742) -> PASS
>      * igt@gem_ctx_isolation@preservation-s3@rcs0:
> 
>           * shard-rkl: FAIL (i915#10086) -> PASS
>      * igt@gem_eio@reset-stress:
> 
>           * shard-dg1: FAIL (i915#5784) -> PASS
>      * igt@gem_exec_fair@basic-none@vcs0:
> 
>           * shard-glk: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-rkl: FAIL (i915#2842) -> PASS +1 other test pass
>      * igt@gem_lmem_swapping@parallel-multi@lmem0:
> 
>           * shard-dg1: INCOMPLETE -> PASS
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-mtlp: ABORT (i915#10131 / i915#9820) -> PASS
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
> 
>           * shard-dg1: FAIL (i915#3591) -> PASS
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-rkl: FAIL (i915#10031) -> PASS
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>           * shard-tglu: FAIL (i915#3743) -> PASS +1 other test pass
>      * igt@kms_cursor_legacy@torture-move@pipe-a:
> 
>           * shard-snb: DMESG-WARN (i915#10166) -> PASS
>      * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
> 
>           * shard-snb: FAIL (i915#2122) -> PASS
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-tglu: FAIL (i915#9295) -> PASS
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-dg2: SKIP (i915#9519) -> PASS +2 other tests pass
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-rkl: SKIP (i915#9519) -> PASS +1 other test pass
>      * igt@kms_pm_rpm@system-suspend-modeset:
> 
>           * shard-dg1: ABORT (i915#10367) -> PASS
>      * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
> 
>           * shard-rkl: INCOMPLETE (i915#8875 / i915#9569) -> PASS
>      * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
> 
>           * shard-snb: FAIL (i915#5465) -> PASS +1 other test pass
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
> 
>           * shard-mtlp: FAIL (i915#9196) -> PASS
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
> 
>           * shard-tglu: FAIL (i915#9196) -> PASS +2 other tests pass
> 
>     Warnings
> 
>      * igt@kms_content_protection@lic-type-1:
> 
>           * shard-snb: INCOMPLETE -> SKIP
>      * igt@kms_content_protection@srm:
> 
>           * shard-snb: INCOMPLETE (i915#8816) -> SKIP
>      * igt@kms_psr@fbc-psr-primary-mmap-gtt:
> 
>           * shard-dg2: SKIP (i915#9673 / i915#9732) -> SKIP (i915#9732) +5
>             other tests skip
>      * igt@kms_psr@fbc-psr2-cursor-render:
> 
>           * shard-dg2: SKIP (i915#9732) -> SKIP (i915#9673 / i915#9732) +5
>             other tests skip
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7754 -> IGTPW_10802
> 
>    CI-20190529: 20190529
>    CI_DRM_14420: 61fa386186cb302cf26e29aef76d5b1a6ffe57ad @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_10802:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10802/index.html
>    IGT_7754: 5fb3239299b5be2c110aafa483c9e197c53f8bb8 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
