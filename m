Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B972CC4345F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 15:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1A110F182;
	Thu, 11 Apr 2024 15:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hvh78+Zl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EE710F190
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 15:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712849143; x=1744385143;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=QiDuZbBfeUjlBZSn6iwXebNGT+2pvAIKLANtMu7DFI4=;
 b=Hvh78+ZlfWgwNL6nfBgc3zDKAYZxwcBtB7uPcTRkXfUWtM1czKeWo1Vw
 KwP3oJV4RbS7k7yrO4eEYJL8OV/75akda8LHY4hUYBNM6aw9gfL0L3lZt
 wfmleW0mh5hOifIlHLdjlMD/LVFY6a3Ag2LhXohcyAwqHNUL8LevSU8YL
 nd5apAUIn4Aq5W5slKzzVdPASAO1wYG7zR6QHxOdbk++EreJ6EKqWKMHh
 4WOn6uZsP+IFxg+lzEjYaL8GIO6Q2LVQpHsyXzsj6sloKr2eeYEHFtb1z
 iEra0Ru2qBPvX8RgS+NmQ78OwRtH1W8glQ5UzuQbCAK95l9ZGlD+aRTMJ Q==;
X-CSE-ConnectionGUID: P92uxI+1QgW15fL9Y5xm8g==
X-CSE-MsgGUID: mICWZlJITha9s9DNj0nnNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8118488"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8118488"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 08:25:26 -0700
X-CSE-ConnectionGUID: c952/jKqQZ6u5CyIMfgICg==
X-CSE-MsgGUID: zxD//qI+TtWitM4O1imVmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="52113217"
Received: from unknown (HELO localhost) ([10.245.246.155])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 08:25:25 -0700
Date: Thu, 11 Apr 2024 17:25:23 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for Add
 surface flat ccs check (rev3)
Message-ID: <20240411152523.f2gza4hqhpz2kwz4@zkempczy-mobl2>
References: <20240410100915.48541-1-zbigniew.kempczynski@intel.com>
 <171284837011.1340510.15090840572733890847@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171284837011.1340510.15090840572733890847@8e613ede5ea5>
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

On Thu, Apr 11, 2024 at 03:12:50PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add surface flat ccs check (rev3)                               
>    URL:     https://patchwork.freedesktop.org/series/131808/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11007/index.html 
> 
>         CI Bug Log - changes from CI_DRM_14562_full -> IGTPW_11007_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_11007_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_11007_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11007/index.html
> 
> Participating hosts (9 -> 9)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_11007_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
> 
>           * shard-rkl: PASS -> ABORT
>      * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: PASS -> FAIL +1 other test fail

Unrelated to the change, I touch xe_ccs and gem_ccs only.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_11007_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@blit-reloc-keep-cache:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8411)
>      * igt@api_intel_bb@crc32:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6230)
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8411)
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7701)
>      * igt@device_reset@unbind-cold-reset-rebind:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7701)
>      * igt@drm_fdinfo@busy-check-all@ccs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8414) +5 other tests skip
>      * igt@drm_fdinfo@idle@rcs0:
> 
>           * shard-rkl: PASS -> FAIL (i915#7742)
>      * igt@drm_fdinfo@isolation@vcs1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8414) +7 other tests skip
>      * igt@drm_fdinfo@most-busy-idle-check-all@bcs0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8414) +12 other tests skip
>      * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#7742) +1 other test fail
>      * igt@gem_basic@multigpu-create-close:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9323])
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9323]) +1 other test skip
>      * igt@gem_close_race@multigpu-basic-threads:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_ctx_persistence@hang:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8555) +2 other tests skip
>      * igt@gem_ctx_persistence@heartbeat-stop:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8555)
>           * shard-dg2: NOTRUN -> SKIP (i915#8555) +2 other tests skip
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#280) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#280) +1 other test skip
>      * igt@gem_eio@reset-stress:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#5784)
>      * igt@gem_exec_balancer@bonded-dual:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4771)
>      * igt@gem_exec_balancer@bonded-pair:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4771)
>      * igt@gem_exec_balancer@bonded-true-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_balancer@invalid-bonds:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4036)
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525) +2 other tests skip
>      * igt@gem_exec_capture@capture-invisible@smem0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6334)
>      * igt@gem_exec_capture@capture-recoverable:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6344)
>           * shard-tglu: NOTRUN -> SKIP (i915#6344)
>      * igt@gem_exec_capture@many-4k-incremental:
> 
>           * shard-mtlp: NOTRUN -> FAIL ([i915#9606])
>           * shard-rkl: NOTRUN -> FAIL ([i915#9606])
>      * igt@gem_exec_capture@many-4k-zero:
> 
>           * shard-dg1: NOTRUN -> FAIL ([i915#9606])
>           * shard-dg2: NOTRUN -> FAIL ([i915#9606])
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852) +3 other tests
>             skip
>           * shard-glk: NOTRUN -> FAIL (i915#2846)
>      * igt@gem_exec_fair@basic-flow:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852)
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2842) +1 other test fail
>      * igt@gem_exec_fair@basic-none@vcs0:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#2842) +4 other tests fail
>      * igt@gem_exec_fair@basic-throttle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539)
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-tglu: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_params@rsvd2-dirt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5107)
>      * igt@gem_exec_reloc@basic-concurrent0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +7 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-noreloc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +8 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-read-active:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +12 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +22 other tests skip
>      * igt@gem_exec_schedule@preempt-queue-contexts-chain:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4537 / i915#4812)
>      * igt@gem_exec_schedule@semaphore-power:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7276)
>           * shard-dg1: NOTRUN -> SKIP (i915#4812) +4 other tests skip
>      * igt@gem_exec_suspend@basic-s4-devices@smem:
> 
>           * shard-rkl: NOTRUN -> ABORT (i915#7975 / i915#8213)
>      * igt@gem_fence_thrash@bo-write-verify-none:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_fenced_exec_thrash@no-spare-fences:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2190)
>      * igt@gem_lmem_evict@dontneed-evict-race:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613 / i915#7582)
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_lmem_swapping@heavy-verify-multi@lmem0:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#10378)
>      * igt@gem_lmem_swapping@heavy-verify-random-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +7 other tests skip
>      * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4565) +1 other test skip
>      * igt@gem_lmem_swapping@parallel-random-verify:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_media_vme:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#284)
>      * igt@gem_mmap@bad-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +4 other tests skip
>      * igt@gem_mmap_gtt@basic-write-read:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +8 other tests skip
>      * igt@gem_mmap_gtt@fault-concurrent-x:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +15 other tests skip
>      * igt@gem_mmap_offset@clear@smem0:
> 
>           * shard-mtlp: PASS -> ABORT (i915#10029 / i915#10729)
>      * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +3 other tests skip
>      * igt@gem_mmap_wc@write-prefaulted:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      * igt@gem_partial_pwrite_pread@write-uncached:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +7 other tests skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-display:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282)
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +5 other tests skip
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +11 other tests skip
>      * igt@gem_pxp@regular-baseline-src-copy-readible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +3 other tests skip
>      * igt@gem_pxp@reject-modify-context-protection-off-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>      * igt@gem_pxp@reject-modify-context-protection-on:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4270) +7 other tests skip
>      * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4270) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>      * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +4 other tests skip
>      * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +7 other tests
>             skip
>      * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_softpin@evict-snoop-interruptible:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4885)
>      * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +13 other tests skip
>      * igt@gem_tiled_pread_pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079) +1 other test skip
>      * igt@gem_userptr_blits@coherency-sync:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297) +3 other tests skip
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#3323)
>      * igt@gem_userptr_blits@map-fixed-invalidate:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880) +1 other test
>             skip
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4880) +1 other test
>             skip
>      * igt@gem_userptr_blits@mmap-offset-banned@gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297) +3 other tests skip
>      * igt@gem_userptr_blits@unsync-unmap-after-close:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3297) +3 other tests skip
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-glk: PASS -> ABORT (i915#5566)
>      * igt@gen9_exec_parse@batch-invalid-length:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856)
>      * igt@gen9_exec_parse@bb-chained:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +9 other tests skip
>      * igt@gen9_exec_parse@bb-large:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856) +2 other tests skip
>      * igt@gen9_exec_parse@shadow-peek:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +4 other tests skip
>      * igt@gen9_exec_parse@valid-registers:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2527) +3 other tests skip
>      * igt@i915_fb_tiling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4881)
>      * igt@i915_module_load@load:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6227)
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-dg1: PASS -> INCOMPLETE ([i915#9849])
>      * igt@i915_pm_freq_api@freq-reset-multiple:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8399) +2 other tests skip
>      * igt@i915_pm_rps@basic-api:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6621) +1 other test skip
>      * igt@i915_pm_rps@min-max-config-idle:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6621)
>      * igt@i915_pm_rps@thresholds-idle@gt0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8925)
>      * igt@i915_pm_rps@thresholds-park@gt0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8925)
>      * igt@i915_pm_rps@thresholds-park@gt1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8925)
>      * igt@i915_pm_rps@thresholds@gt0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8925)
>      * igt@i915_pm_rps@waitboost:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#8346)
>      * igt@i915_power@sanity:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7984)
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6245)
>      * igt@i915_selftest@mock@memory_region:
> 
>           * shard-dg1: NOTRUN -> DMESG-WARN ([i915#9311])
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#10031)
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7707)
>           * shard-mtlp: NOTRUN -> SKIP (i915#7707)
>      * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +3 other tests skip
>      * igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4215 / i915#5190)
>      * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3826)
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8709) +3 other tests skip
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9531])
>      * igt@kms_atomic_transition@plane-all-modeset-transition:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#1769)
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +11 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#5138)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +4 other tests
>             skip
>      * igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638) +6 other tests skip
>      * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3638)
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>           * shard-tglu: PASS -> FAIL (i915#3743)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +14 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>           * shard-mtlp: NOTRUN -> SKIP +16 other tests skip
>      * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6187)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538) +5 other tests skip
>      * igt@kms_big_joiner@basic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#10656) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#10656)
>      * igt@kms_big_joiner@invalid-modeset:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10656)
>      * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>             +7 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +75 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10278) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#10278)
>      * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-glk: NOTRUN -> SKIP +269 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +147 other
>             tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +19 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#10278)
>           * shard-rkl: NOTRUN -> SKIP (i915#10278) +1 other test skip
>      * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +31 other tests skip
>      * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
> 
>           * shard-snb: NOTRUN -> SKIP +18 other tests skip
>      * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +91 other tests skip
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3742) +1 other test skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7213 / i915#9010)
>           * shard-dg2: NOTRUN -> SKIP (i915#7213)
>      * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4087) +3 other tests skip
>      * igt@kms_chamelium_color@degamma:
> 
>           * shard-dg2: NOTRUN -> SKIP +26 other tests skip
>      * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7828)
>      * igt@kms_chamelium_frames@dp-crc-single:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7828) +3 other tests skip
>      * igt@kms_chamelium_hpd@dp-hpd:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7828) +15 other tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7828) +11 other tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7828) +8 other tests skip
>      * igt@kms_content_protection@content-type-change:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9424])
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3299)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3299)
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3116) +1 other test skip
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9424])
>      * igt@kms_content_protection@srm:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7116)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7118 / [i915#9424]) +1 other test
>             skip
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3359)
>           * shard-dg2: NOTRUN -> SKIP (i915#3359) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3359) +3 other tests skip
>      * igt@kms_cursor_crc@cursor-random-32x32:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3359) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-random-max-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814) +2 other tests
>             skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3359)
>      * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +5 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4103) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4213)
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9809])
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP +78 other tests skip
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2346)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4103 / i915#4213) +1 other test
>             skip
>           * shard-tglu: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213)
>      * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9723])
>      * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9227])
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +13 other tests skip
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_draw_crc@draw-method-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8812)
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3840 / [i915#9688])
>           * shard-dg1: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-with-bpc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3840 / i915#9053)
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-dg1: PASS -> FAIL (i915#4767)
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3469)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4854)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1839)
>           * shard-dg1: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9337])
>      * igt@kms_feature_discovery@psr2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#658)
>      * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9934]) +5 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#3637) +2 other tests skip
>      * igt@kms_flip@2x-flip-vs-fences:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8381)
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637) +6 other tests skip
>      * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:
> 
>           * shard-snb: PASS -> FAIL (i915#2122) +2 other tests fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672) +9 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672) +5 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +49 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +77 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5439)
>           * shard-dg1: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +17 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +24 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +25 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +29 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +51 other tests skip
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9766])
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
> 
>           * shard-tglu: NOTRUN -> SKIP +26 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +23 other tests skip
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228) +3 other tests
>             skip
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#7862) +1 other test fail
>      * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3582) +3 other tests skip
>      * igt@kms_plane_lowres@tiling-yf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8821)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-dp-4:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9423]) +7 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9423]) +11 other tests skip
>      * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5176 / [i915#9423]) +1 other test
>             skip
>      * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9423]) +9 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9423]) +3 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235 / [i915#9423] / [i915#9728])
>             +3 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5235) +7 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5235) +13 other tests skip
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5235) +3 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235 / [i915#9423]) +15 other
>             tests skip
>      * igt@kms_pm_backlight@fade:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354)
>           * shard-dg1: NOTRUN -> SKIP (i915#5354)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#10139)
>           * shard-tglu: PASS -> FAIL ([i915#9295])
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9685]) +1 other test skip
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9340])
>      * igt@kms_pm_lpsp@screens-disabled:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8430)
>           * shard-dg2: NOTRUN -> SKIP (i915#8430)
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9519])
>      * igt@kms_pm_rpm@dpms-non-lpsp:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9519])
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9519]) +2 other tests skip
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9519])
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-dg2: PASS -> SKIP ([i915#9519]) +1 other test skip
>      * igt@kms_prime@basic-crc-vgem:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_prime@d3hot:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
> 
>           * shard-dg1: NOTRUN -> SKIP +48 other tests skip
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4348)
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9683]) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP ([i915#9683]) +1 other test skip
>      * igt@kms_psr@fbc-pr-basic:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9688]) +9 other tests skip
>      * igt@kms_psr@fbc-psr2-primary-mmap-gtt:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9732]) +7 other tests skip
>      * igt@kms_psr@fbc-psr2-sprite-render:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / [i915#9732]) +43 other
>             tests skip
>      * igt@kms_psr@psr-cursor-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / [i915#9673] / [i915#9732])
>      * igt@kms_psr@psr-cursor-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / [i915#9732]) +23 other
>             tests skip
>      * igt@kms_psr@psr2-sprite-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / [i915#9732]) +23 other
>             tests skip
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9685]) +3 other tests skip
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9685]) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP ([i915#9685])
>      * igt@kms_rotation_crc@exhaust-fences:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4884)
>      * igt@kms_rotation_crc@primary-rotation-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4235) +1 other test skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5289) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#5289)
>           * shard-tglu: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_setmode@clone-exclusive-crtc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +6 other tests skip
>      * igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8823)
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8623)
>           * shard-dg1: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#9196)
>      * igt@kms_vrr@seamless-rr-switch-vrr:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9906]) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP ([i915#9906]) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#9906])
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2437)
>           * shard-dg1: NOTRUN -> SKIP (i915#2437)
>      * igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2437 / [i915#9412])
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2437)
>           * shard-rkl: NOTRUN -> SKIP (i915#2437)
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2437 / [i915#9412])
>      * igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2436)
>      * igt@perf@global-sseu-config:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7387)
>      * igt@perf@unprivileged-single-ctx-counters:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2433)
>      * igt@perf_pmu@cpu-hotplug:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8850)
>      * igt@perf_pmu@faulting-read@gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8440)
>      * igt@perf_pmu@frequency@gt0:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#6806)
>      * igt@perf_pmu@rc6-all-gts:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8516)
>      * igt@perf_pmu@rc6@other-idle-gt0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8516)
>      * igt@prime_vgem@basic-fence-read:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3291 / i915#3708)
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3708) +2 other tests skip
>      * igt@prime_vgem@fence-flip-hang:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3708)
>      * igt@prime_vgem@fence-read-hang:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3708) +1 other test skip
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708) +1 other test skip
>      * igt@runner@aborted:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10291)
>      * igt@sriov_basic@enable-vfs-autoprobe-on:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9917])
>      * igt@syncobj_timeline@invalid-wait-zero-handles:
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#9781])
>      * igt@syncobj_wait@invalid-wait-zero-handles:
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#9779])
>      * igt@tools_test@sysfs_l3_parity:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4818)
>      * igt@v3d/v3d_submit_cl@multisync-out-syncs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2575) +12 other tests skip
>      * igt@v3d/v3d_submit_cl@single-out-sync:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2575) +6 other tests skip
>      * igt@v3d/v3d_submit_csd@bad-perfmon:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2575) +9 other tests skip
>      * igt@v3d/v3d_wait_bo@map-bo-0ns:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2575) +10 other tests skip
>      * igt@vc4/vc4_create_bo@create-bo-zeroed:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7711) +8 other tests skip
>      * igt@vc4/vc4_purgeable_bo@mark-purgeable:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7711) +15 other tests skip
>      * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7711) +4 other tests skip
>      * igt@vc4/vc4_tiling@get-bad-modifier:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7711) +9 other tests skip
> 
>     Possible fixes
> 
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-tglu: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_fair@basic-pace@vecs0:
> 
>           * shard-rkl: FAIL (i915#2842) -> PASS +2 other tests pass
>      * igt@gem_lmem_swapping@heavy-multi@lmem0:
> 
>           * shard-dg1: FAIL (i915#10378) -> PASS
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * shard-dg1: TIMEOUT (i915#5493) -> PASS
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
> 
>           * shard-dg1: FAIL (i915#3591) -> PASS
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-2:
> 
>           * shard-glk: INCOMPLETE -> PASS +1 other test pass
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-4:
> 
>           * shard-dg1: INCOMPLETE -> PASS
>      * igt@kms_big_fb@linear-16bpp-rotate-180:
> 
>           * shard-mtlp: FAIL (i915#5138) -> PASS
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-tglu: FAIL (i915#3743) -> PASS +3 other tests pass
>      * igt@kms_cursor_legacy@torture-move@pipe-a:
> 
>           * shard-snb: DMESG-WARN (i915#10166) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-snb: SKIP -> PASS +2 other tests pass
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-snb: INCOMPLETE (i915#10056) -> PASS
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-rkl: SKIP ([i915#9519]) -> PASS +1 other test pass
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-dg2: SKIP ([i915#9519]) -> PASS
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
> 
>           * shard-tglu: FAIL (i915#9196) -> PASS +1 other test pass
> 
>     Warnings
> 
>      * igt@device_reset@unbind-reset-rebind:
> 
>           * shard-dg1: ABORT ([i915#9618]) -> INCOMPLETE ([i915#9408] /
>             [i915#9618])
>      * igt@gem_eio@kms:
> 
>           * shard-dg2: FAIL (i915#5784) -> INCOMPLETE (i915#10513)
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-glk: INCOMPLETE ([i915#9849]) -> ABORT ([i915#9849])
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
> 
>           * shard-tglu: FAIL (i915#3591) -> WARN (i915#2681)
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-dg1: SKIP ([i915#9424]) -> SKIP ([i915#9433])
>      * igt@kms_content_protection@srm:
> 
>           * shard-snb: SKIP -> INCOMPLETE (i915#8816)
>      * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: ABORT -> SKIP (i915#3555 / i915#8810)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
> 
>           * shard-dg2: SKIP (i915#3458) -> SKIP (i915#10433 / i915#3458) +2
>             other tests skip
>      * igt@kms_psr@fbc-pr-suspend:
> 
>           * shard-dg2: SKIP (i915#1072 / [i915#9732]) -> SKIP (i915#1072 /
>             [i915#9673] / [i915#9732]) +4 other tests skip
>      * igt@kms_psr@fbc-psr2-sprite-mmap-cpu:
> 
>           * shard-dg2: SKIP (i915#1072 / [i915#9673] / [i915#9732]) -> SKIP
>             (i915#1072 / [i915#9732]) +9 other tests skip
>      * igt@perf@non-zero-reason@0-rcs0:
> 
>           * shard-dg2: FAIL (i915#7484) -> FAIL (i915#9100)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>    [i915#922
