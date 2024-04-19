Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFFEC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 11:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321A410F7F4;
	Fri, 19 Apr 2024 11:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2Ji1Zbe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5F210F538;
 Fri, 19 Apr 2024 11:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713526155; x=1745062155;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6Vi/6c7MdhQkAEHnO/MfRI7c/+5VQ8rNfb9JSE0fKko=;
 b=c2Ji1ZbeCOSN1vG791BN33w4fVTBIXB7/uOGj1lmpgRAFj2IK6PapqgN
 Tefna3h9qeJ96MSD6YR00iyDmOaZNpGhXpLnBgXOhWfL4/HU8h2Zszcfg
 X79VNt5T7f6E3hDiinBOcaxy0neWQcOMv325CzHOt41Ps5GBAgSl/cOrS
 VdK7uCImW2Jnxht2Z2V2jzyO0tuaDo553PeoUr+0By0NAdi2Mqyskfrhg
 1iNd0GTx+SQ7BUBEj+x+VTOCn+DYtKwRH5uYGQ28d4n/UE2W6zGn9kIxK
 hEboabCaCT/1K43pvjTJ67JcTLZ71/7urdMcfrSaospMykKRwIGT8qM5s A==;
X-CSE-ConnectionGUID: DisD26dKS6arV9qBk6wvig==
X-CSE-MsgGUID: 6q17w5wjT3O9+r8eKdq+bA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20513090"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="20513090"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 04:29:14 -0700
X-CSE-ConnectionGUID: 5kSU8/MvRRObbnU64ukcMw==
X-CSE-MsgGUID: hq76AbHMT+mfMvJOppWC/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23389238"
Received: from unknown (HELO localhost) ([10.245.246.244])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 04:29:12 -0700
Date: Fri, 19 Apr 2024 13:29:08 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMveGVf?=
 =?utf-8?Q?evict|exec=5Fthreads?= =?utf-8?Q?=3A?= Use fd reopen to avoid
 corrupting global data (rev2)
Message-ID: <20240419112908.xi5vxt2kq6wlvmss@zkempczy-mobl2>
References: <20240417142607.193339-1-zbigniew.kempczynski@intel.com>
 <171352098826.1520059.13485478789150757698@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171352098826.1520059.13485478789150757698@8e613ede5ea5>
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

On Fri, Apr 19, 2024 at 10:03:08AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/xe_evict|exec_threads: Use fd reopen to avoid corrupting    
>             global data (rev2)                                                
>    URL:     https://patchwork.freedesktop.org/series/132562/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11037/index.html   
> 
>         CI Bug Log - changes from CI_DRM_14598_full -> IGTPW_11037_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_11037_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_11037_full, please notify your bug team
>    ("I915-ci-infra@lists.freedesktop.org") to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11037/index.html
> 
> Participating hosts (9 -> 9)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_11037_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_ctx_isolation@dirty-switch@vcs1:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE
>      * igt@gem_mmap_gtt@flink-race:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE

Also false-positives, I touch only xe tests, no i915 tests.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_11037_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@object-reloc-purge-cache:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8411)
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7701)
>      * igt@device_reset@unbind-cold-reset-rebind:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7701)
>      * igt@drm_fdinfo@busy@rcs0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8414) +20 other tests skip
>      * igt@drm_fdinfo@virtual-busy-all:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8414) +5 other tests skip
>      * igt@drm_fdinfo@virtual-busy-idle-all:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8414)
>      * igt@gem_basic@multigpu-create-close:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7697)
>           * shard-dg2: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#9323)
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@block-multicopy-compressed:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_close_race@multigpu-basic-process:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_ctx_persistence@heartbeat-hang:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@heartbeat-hostile:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8555) +2 other tests skip
>      * igt@gem_ctx_sseu@invalid-args:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#280) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP (i915#280)
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#280) +1 other test skip
>      * igt@gem_eio@hibernate:
> 
>           * shard-dg2: NOTRUN -> ABORT (i915#10030 / i915#7975 / i915#8213)
>      * igt@gem_eio@kms:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE (i915#10513 / i915#1982)
>      * igt@gem_exec_balancer@bonded-dual:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4771)
>      * igt@gem_exec_balancer@invalid-bonds:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4036)
>      * igt@gem_exec_balancer@parallel-out-fence:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525) +1 other test skip
>      * igt@gem_exec_balancer@sliced:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812) +2 other tests skip
>      * igt@gem_exec_capture@capture-invisible@smem0:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#6334)
>           * shard-rkl: NOTRUN -> SKIP (i915#6334)
>           * shard-tglu: NOTRUN -> SKIP (i915#6334)
>      * igt@gem_exec_capture@capture@vecs0-lmem0:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#10386) +1 other test fail
>      * igt@gem_exec_capture@many-4k-incremental:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#9606) +1 other test fail
>      * igt@gem_exec_capture@many-4k-zero:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#9606)
>      * igt@gem_exec_fair@basic-none@rcs0:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#2842) +4 other tests fail
>      * igt@gem_exec_fair@basic-pace-share:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4473 / i915#4771) +1 other test
>             skip
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-tglu: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-rkl: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-sync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539)
>      * igt@gem_exec_flush@basic-batch-kernel-default-wb:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852) +2 other tests
>             skip
>      * igt@gem_exec_flush@basic-wb-rw-default:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +1 other test
>             skip
>      * igt@gem_exec_reloc@basic-gtt-read:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +6 other tests skip
>      * igt@gem_exec_reloc@basic-write-cpu-active:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +11 other tests skip
>      * igt@gem_exec_reloc@basic-write-read-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +6 other tests skip
>      * igt@gem_exec_reloc@basic-write-wc-noreloc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +3 other tests skip
>      * igt@gem_exec_schedule@preempt-queue:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4812) +1 other test skip
>      * igt@gem_exec_schedule@preempt-queue-chain:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4537 / i915#4812)
>      * igt@gem_exec_schedule@preempt-queue-contexts-chain:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4537 / i915#4812)
>      * igt@gem_exec_suspend@basic-s4-devices@smem:
> 
>           * shard-rkl: NOTRUN -> ABORT (i915#7975 / i915#8213)
>      * igt@gem_fence_thrash@bo-copy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860) +2 other tests skip
>      * igt@gem_fence_thrash@bo-write-verify-y:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4860) +1 other test skip
>      * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
> 
>           * shard-dg2: PASS -> FAIL (i915#10378) +1 other test fail
>      * igt@gem_lmem_swapping@massive-random:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +4 other tests skip
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * shard-dg2: NOTRUN -> TIMEOUT (i915#5493)
>      * igt@gem_lmem_swapping@verify-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_media_vme:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#284)
>      * igt@gem_mmap@bad-offset:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +6 other tests skip
>      * igt@gem_mmap_gtt@big-copy-xy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +3 other tests skip
>      * igt@gem_mmap_gtt@cpuset-big-copy-xy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +6 other tests skip
>      * igt@gem_mmap_wc@bad-offset:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +3 other tests skip
>      * igt@gem_mmap_wc@copy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +6 other tests skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +4 other tests skip
>      * igt@gem_pread@bench:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +4 other tests skip
>      * igt@gem_pread@exhaustion:
> 
>           * shard-glk: NOTRUN -> WARN (i915#2658)
>      * igt@gem_pread@uncached:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +2 other tests skip
>      * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4270) +3 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_pxp@protected-raw-src-copy-not-readible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_pxp@reject-modify-context-protection-off-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +6 other tests skip
>      * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_readwrite@read-bad-handle:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +5 other tests skip
>      * igt@gem_render_copy@y-tiled-ccs-to-linear:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +6 other tests
>             skip
>      * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +1 other test skip
>      * igt@gem_set_tiling_vs_pwrite:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_spin_batch@spin-all-new:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#5889)
>      * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +7 other tests skip
>      * igt@gem_unfence_active_buffers:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4879)
>      * igt@gem_userptr_blits@dmabuf-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297) +4 other tests skip
>      * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4880) +1 other test
>             skip
>      * igt@gem_userptr_blits@readonly-pwrite-unsync:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_userptr_blits@sd-probe:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4958)
>      * igt@gem_userptr_blits@unsync-unmap-after-close:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297) +3 other tests skip
>      * igt@gen9_exec_parse@bb-oversize:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +2 other tests
>             skip
>      * igt@gen9_exec_parse@bb-start-out:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +2 other tests skip
>      * igt@gen9_exec_parse@bb-start-param:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856) +1 other test skip
>      * igt@gen9_exec_parse@shadow-peek:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +4 other tests skip
>      * igt@i915_module_load@load:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6227)
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-rkl: PASS -> ABORT (i915#9820)
>           * shard-tglu: PASS -> INCOMPLETE (i915#9820)
>      * igt@i915_pm_freq_api@freq-basic-api:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8399) +1 other test skip
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
> 
>           * shard-tglu: NOTRUN -> WARN (i915#2681) +3 other tests warn
>      * igt@i915_pm_rps@min-max-config-idle:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6621)
>      * igt@i915_pm_rps@thresholds-park@gt0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8925)
>      * igt@i915_pm_rps@thresholds-park@gt1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8925)
>      * igt@i915_pm_rps@thresholds@gt0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8925) +1 other test skip
>      * igt@i915_selftest@mock@memory_region:
> 
>           * shard-rkl: NOTRUN -> DMESG-WARN (i915#9311)
>           * shard-dg1: NOTRUN -> DMESG-WARN (i915#9311)
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-tglu: NOTRUN -> INCOMPLETE (i915#7443)
>      * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4212) +1 other test skip
>      * igt@kms_addfb_basic@tile-pitch-mismatch:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4212) +1 other test skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8709) +3 other tests skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#8709) +7 other tests skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8709) +7 other tests skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8709) +11 other tests skip
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9531)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#1769) +1 other test skip
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +3 other tests skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +4 other tests skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +2 other tests
>             skip
>      * igt@kms_big_fb@4-tiled-addfb-size-overflow:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5286)
>      * igt@kms_big_fb@linear-64bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638) +4 other tests skip
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3638) +2 other tests skip
>      * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>           * shard-mtlp: NOTRUN -> SKIP +12 other tests skip
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +10 other tests
>             skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-tglu: PASS -> FAIL (i915#3743)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538) +3 other tests skip
>      * igt@kms_big_joiner@invalid-modeset-force-joiner:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10656)
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +79 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#10278)
>      * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +35 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +196 other
>             tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10278)
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +53 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#10278) +1 other test skip
>      * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +23 other tests skip
>      * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>             +2 other tests skip
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3742)
>           * shard-rkl: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7213) +4 other tests skip
>      * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4087) +3 other tests skip
>      * igt@kms_chamelium_color@degamma:
> 
>           * shard-dg2: NOTRUN -> SKIP +30 other tests skip
>      * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7828) +7 other tests skip
>      * igt@kms_chamelium_edid@hdmi-mode-timings:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7828) +5 other tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-fast:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7828) +7 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7828) +3 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7828) +7 other tests skip
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7118 / i915#9424) +1 other test
>             skip
>           * shard-rkl: NOTRUN -> SKIP (i915#7118 / i915#9424)
>           * shard-dg1: NOTRUN -> SKIP (i915#7116 / i915#9424)
>      * igt@kms_content_protection@content-type-change:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9424)
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3299)
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3299)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118 /
>             i915#9424)
>      * igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3359)
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3359) +1 other test skip
>      * igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3359) +1 other test skip
>      * igt@kms_cursor_crc@cursor-random-64x21:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814)
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +5 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +3 other tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +6 other tests skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4213)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4103 / i915#4213) +2 other tests
>             skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9809) +1 other test skip
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-glk: PASS -> FAIL (i915#2346)
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2346)
>      * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9067)
>           * shard-dg1: NOTRUN -> SKIP (i915#9067)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213)
>           * shard-rkl: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_cursor_legacy@torture-move@pipe-a:
> 
>           * shard-snb: PASS -> DMESG-WARN (i915#10166)
>           * shard-tglu: PASS -> DMESG-WARN (i915#10166 / i915#1982)
>      * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9227)
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8827)
>      * igt@kms_display_modes@mst-extended-mode-negative:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#8588)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-with-bpc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#3840) +1 other test
>             skip
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840) +1 other test
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3840 / i915#9053)
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3469)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3469)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2065 / i915#4854)
>           * shard-rkl: NOTRUN -> SKIP (i915#4854)
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1839)
>           * shard-rkl: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@psr2:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#658) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP (i915#658)
>      * igt@kms_flip@2x-blocking-absolute-wf_vblank:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637) +3 other tests skip
>      * igt@kms_flip@2x-flip-vs-modeset:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#3966) +1 other test
>             skip
>      * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637) +3 other tests skip
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +3 other tests skip
>      * igt@kms_flip@2x-wf_vblank-ts-check@ab-vga1-hdmi-a1:
> 
>           * shard-snb: PASS -> FAIL (i915#2122)
>      * igt@kms_flip@flip-vs-fences:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8381) +1 other test skip
>      * igt@kms_flip@flip-vs-fences-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8381)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672) +2 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +3 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other test
>             skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
> 
>           * shard-dg2: PASS -> FAIL (i915#6880)
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
> 
>           * shard-tglu: NOTRUN -> SKIP +56 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +17 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +16 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP +39 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +22 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +41 other tests skip
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9766)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +17 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +22 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +14 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +32 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +7 other tests skip
>      * igt@kms_getfb@getfb-reject-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6118)
>      * igt@kms_hdmi_inject@inject-audio:
> 
>           * shard-tglu: PASS -> SKIP (i915#433)
>      * igt@kms_hdr@bpc-switch-dpms:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4816)
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6301)
>           * shard-rkl: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_plane_lowres@tiling-yf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8821)
>      * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354 / i915#9423)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9423) +3 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5176) +3 other tests skip
>      * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9423) +5 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9423) +7 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235 / i915#9423 / i915#9728) +3
>             other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5235) +3 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5235) +7 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5235) +11 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#5235) +1 other test
>             skip
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235 / i915#9423) +15 other tests
>             skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5235) +5 other tests skip
>      * igt@kms_pm_backlight@bad-brightness:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354)
>      * igt@kms_pm_backlight@basic-brightness:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5354) +1 other test skip
>      * igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9685) +2 other tests skip
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_pm_dc@dc9-dpms:
> 
>           * shard-tglu: PASS -> SKIP (i915#4281)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9340)
>           * shard-rkl: NOTRUN -> SKIP (i915#9340)
>      * igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#9301)
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-dg2: PASS -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-rkl: PASS -> SKIP (i915#9519) +1 other test skip
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_prime@basic-crc-hybrid:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_prime@basic-modeset-hybrid:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf@psr2-pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9808)
>      * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
> 
>           * shard-dg1: NOTRUN -> SKIP +48 other tests skip
>      * igt@kms_psr@fbc-psr-primary-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +23 other tests
>             skip
>      * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
> 
>           * shard-glk: NOTRUN -> SKIP +358 other tests skip
>      * igt@kms_psr@fbc-psr2-no-drrs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +13 other tests skip
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9673 / i915#9732) +2
>             other tests skip
>      * igt@kms_psr@fbc-psr2-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +22 other tests
>             skip
>      * igt@kms_psr@pr-cursor-blt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +8 other tests skip
>      * igt@kms_psr@psr-sprite-mmap-cpu:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +24 other tests
>             skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5289) +1 other test skip
>      * igt@kms_rotation_crc@sprite-rotation-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4235) +1 other test skip
>      * igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8823)
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8623)
>           * shard-dg2: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
> 
>           * shard-mtlp: PASS -> FAIL (i915#9196)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
> 
>           * shard-snb: PASS -> FAIL (i915#9196)
>           * shard-tglu: PASS -> FAIL (i915#9196)
>      * igt@kms_vrr@flip-basic-fastset:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9906) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2437) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#2437)
>      * igt@kms_writeback@writeback-check-output-xrgb2101010:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2437 / i915#9412)
>           * shard-tglu: NOTRUN -> SKIP (i915#2437 / i915#9412)
>           * shard-glk: NOTRUN -> SKIP (i915#2437) +2 other tests skip
>      * igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2437 / i915#9412)
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2437 / i915#9412)
>      * igt@perf@global-sseu-config-invalid:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7387)
>      * igt@perf_pmu@busy-double-start@ccs0:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#4349)
>      * igt@perf_pmu@frequency@gt0:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#6806)
>      * igt@perf_pmu@rc6-all-gts:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8516)
>      * igt@prime_vgem@basic-fence-read:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3291 / i915#3708) +1 other test
>             skip
>      * igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9917)
>      * igt@syncobj_wait@invalid-wait-zero-handles:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#9779)
>           * shard-glk: NOTRUN -> FAIL (i915#9779)
>      * igt@tools_test@sysfs_l3_parity:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4818)
>      * igt@v3d/v3d_perfmon@create-perfmon-exceed:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2575) +6 other tests skip
>      * igt@v3d/v3d_submit_cl@job-perfmon:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2575) +10 other tests skip
>      * igt@v3d/v3d_submit_csd@single-out-sync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2575) +14 other tests skip
>      * igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7711) +6 other tests skip
>      * igt@vc4/vc4_perfmon@create-two-perfmon:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7711) +2 other tests skip
>      * igt@vc4/vc4_tiling@set-bad-modifier:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7711) +6 other tests skip
>      * igt@vc4/vc4_tiling@set-get:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7711) +9 other tests skip
>      * igt@vc4/vc4_wait_seqno@bad-seqno-0ns:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2575) +13 other tests skip
> 
>     Possible fixes
> 
>      * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
> 
>           * shard-rkl: FAIL (i915#7742) -> PASS
>      * igt@gem_ctx_exec@basic-nohangcheck:
> 
>           * shard-rkl: FAIL (i915#6268) -> PASS
>           * shard-tglu: FAIL (i915#6268) -> PASS
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-rkl: FAIL (i915#2842) -> PASS
>      * igt@gem_lmem_swapping@heavy-multi@lmem0:
> 
>           * shard-dg2: FAIL (i915#10378) -> PASS
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-dg2: INCOMPLETE (i915#9820 / i915#9849) -> PASS
>      * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: FAIL (i915#2521) -> PASS
>      * igt@kms_cursor_legacy@torture-bo@pipe-a:
> 
>           * shard-dg1: DMESG-WARN (i915#10166) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
> 
>           * shard-snb: SKIP -> PASS +4 other tests pass
>      * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
> 
>           * shard-dg2: FAIL (i915#6880) -> PASS
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-rkl: SKIP (i915#9519) -> PASS +1 other test pass
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-dg2: SKIP (i915#9519) -> PASS +3 other tests pass
>      * igt@kms_vblank@wait-forked-hang@pipe-d-edp-1:
> 
>           * shard-mtlp: INCOMPLETE -> PASS
>      * igt@kms_vblank@wait-forked-hang@pipe-d-hdmi-a-4:
> 
>           * shard-dg1: INCOMPLETE (i915#9508) -> PASS
> 
>     Warnings
> 
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2: SKIP (i915#3458) -> SKIP (i915#10433 / i915#3458) +2
>             other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#3458) -> SKIP (i915#3458) +2
>             other tests skip
>      * igt@kms_pm_dc@dc9-dpms:
> 
>           * shard-rkl: SKIP (i915#3361) -> SKIP (i915#4281)
>      * igt@kms_psr@fbc-psr-basic:
> 
>           * shard-dg2: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 /
>             i915#9673 / i915#9732) +4 other tests skip
>      * igt@kms_psr@fbc-psr-primary-page-flip:
> 
>           * shard-dg2: SKIP (i915#1072 / i915#9673 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732) +13 other tests skip
>      * igt@perf@non-zero-reason@0-rcs0:
> 
>           * shard-dg2: FAIL (i915#9100) -> FAIL (i915#7484)
>      * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
> 
>           * shard-dg2: CRASH (i915#9351) -> INCOMPLETE (i915#5493)
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7811 -> IGTPW_11037
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_14598: a4f566444a645b1ade1b8d948f6e0286136b2cb3 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_11037: a6851ac09cdf73891c6ffabac4ac6c1a04324181 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_7811: 2d95df5757eb99a42ea9ac30fd74001dee804d03 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
