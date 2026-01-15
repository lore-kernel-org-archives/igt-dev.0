Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF91D44C5D
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 14:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C05410E195;
	Thu, 15 Jan 2026 14:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTYqRTeV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B642310E195
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 14:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768488846; x=1800024846;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=RG/yG/DzRhg+ECGxODcSv8Tz4vpRD/El5FlJl+fHCTQ=;
 b=lTYqRTeVjOHtyvKCoBblQ1d+EYOsd0L6JUi1ziI0fhO75F9buXtkNScY
 R7Nn/AZAEarjyZOfqluWuwAn243QFwMzt0gNSE7h7hggm1h64H7NHodgT
 CIC8+8IT3b2JFv6HRz+shCB+ia0FXsbP1lLnVy6wI+kybenh2c1aLnQVl
 tUhQw5MPfUIz749QkU2zmO/WP34r1MGxU4CPWd15EUbzQmkWsmSDIpkze
 McybaCGedpXrhkiZLf5jip+YH+ihxSx1qc63rji+HZhiYWG8dCteOB70c
 u+FPKGMS905ue6eHXDy+oeMXDg95yvMiKr07AkX7c1zRzTF+sHx6JoEPH Q==;
X-CSE-ConnectionGUID: U4g/ZUMBQSClmNkV16MC6A==
X-CSE-MsgGUID: vj95L64XQkiK/IN5LYLJmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69774398"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="69774398"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 06:54:06 -0800
X-CSE-ConnectionGUID: Jktqb8KXQ7WLF4uxAboNYQ==
X-CSE-MsgGUID: /z0FMbxSR4uU4Ujo4utTbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="209478285"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.208])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 06:54:05 -0800
Date: Thu, 15 Jan 2026 15:54:02 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Add missing flatccs flag for NVL-S
Message-ID: <7os4mpk4l5co7scbrfmhhlwrntisfsvpgvzqfobyujrppwh7oc@fij2yimxqgrh>
References: <20260115092155.114781-4-zbigniew.kempczynski@intel.com>
 <176848015726.156800.15762871938885009980@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176848015726.156800.15762871938885009980@a3b018990fe9>
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

On Thu, Jan 15, 2026 at 12:29:17PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add missing flatccs flag for NVL-S                              
>    URL:     https://patchwork.freedesktop.org/series/160130/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14347/index.html 
> 
>         CI Bug Log - changes from CI_DRM_17821_full -> IGTPW_14347_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_14347_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_14347_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14347/index.html
> 
> Participating hosts (9 -> 9)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_14347_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_exec_big@single:
> 
>           * shard-tglu: PASS -> DMESG-FAIL +1 other test dmesg-fail
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
> 
>           * shard-rkl: PASS -> INCOMPLETE
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> INCOMPLETE
>      * igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:
> 
>           * shard-tglu: PASS -> ABORT +1 other test abort

Series is unrelated to failures above.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between CI_DRM_17821_full and
>    IGTPW_14347_full:
> 
>   New IGT tests (10)
> 
>      * igt@gem_ppgtt@load:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@gem_ppgtt@system-suspend-modeset:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_flip@basic-wc-read-active:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_flip@cachelines:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_flip@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_flip@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_flip@gen12-oa-tlb-invalidate:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_flip@invalid-multi-wait-all-unsubmitted-submitted-signaled:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_flip@multi-wait-for-submit-signaled:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_flip@tiled-to-tiled:
> 
>           * Statuses :
>           * Exec time: [None] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_14347_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@crc32:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6230)
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8411) +3 other tests skip
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@block-multicopy-inplace:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_ctx_persistence@heartbeat-close:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@heartbeat-many:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@smoketest:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#1099) +1 other test skip
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#280) +1 other test skip
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#280) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#280) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#280)
>           * shard-mtlp: NOTRUN -> SKIP (i915#280)
>      * igt@gem_ctx_sseu@mmap-args:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#280)
>      * igt@gem_exec_balancer@noheartbeat:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525) +2 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_capture@capture-invisible:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6334) +1 other test skip
>      * igt@gem_exec_capture@capture-recoverable:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6344)
>      * igt@gem_exec_fence@concurrent:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_reloc@basic-active:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +8 other tests skip
>      * igt@gem_exec_reloc@basic-cpu-noreloc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +4 other tests skip
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +4 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-read-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +13 other tests skip
>      * igt@gem_exec_reloc@basic-wc-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3281) +2 other tests
>             skip
>      * igt@gem_exec_schedule@preempt-queue:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4812) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4537 / i915#4812)
>           * shard-dg2: NOTRUN -> SKIP (i915#4537 / i915#4812)
>      * igt@gem_fenced_exec_thrash@too-many-fences:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4860)
>           * shard-dg2: NOTRUN -> SKIP (i915#4860)
>           * shard-dg1: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#2190)
>      * igt@gem_lmem_evict@dontneed-evict-race:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613 / i915#7582)
>      * igt@gem_lmem_swapping@basic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613)
>           * shard-tglu: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@parallel-random-verify:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_lmem_swapping@smem-oom:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +6 other tests skip
>      * igt@gem_lmem_swapping@verify-random-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_mmap@bad-object:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      * igt@gem_mmap_gtt@coherency:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +6 other tests skip
>      * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +1 other test skip
>      * igt@gem_mmap_wc@bad-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +1 other test skip
>      * igt@gem_mmap_wc@invalid-flags:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +1 other test skip
>      * igt@gem_partial_pwrite_pread@reads-uncached:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +2 other tests skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +5 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +2 other tests skip
>      * igt@gem_ppgtt@blt-vs-render-ctx0:
> 
>           * shard-dg2: PASS -> ABORT (i915#13562)
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +7 other tests skip
>           * shard-glk: NOTRUN -> WARN (i915#14702 / i915#2658)
>      * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>      * igt@gem_pxp@regular-baseline-src-copy-readible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +3 other tests skip
>      * igt@gem_pxp@verify-pxp-stale-ctx-execution:
> 
>           * shard-rkl: PASS -> SKIP (i915#4270)
>      * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +2 other tests skip
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +2 other tests
>             skip
>      * igt@gem_softpin@evict-snoop-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4885)
>           * shard-dg1: NOTRUN -> SKIP (i915#4885)
>           * shard-mtlp: NOTRUN -> SKIP (i915#4885)
>      * igt@gem_tiled_pread_basic:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_userptr_blits@coherency-sync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@coherency-unsync:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3297)
>      * igt@gem_userptr_blits@map-fixed-invalidate:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@map-fixed-invalidate-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@unsync-unmap-after-close:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3297) +4 other tests skip
>      * igt@gem_userptr_blits@unsync-unmap-cycles:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#3297) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_workarounds@suspend-resume-fd:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#13356) +1 other test
>             incomplete
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +1 other test skip
>      * igt@gen9_exec_parse@basic-rejected:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +2 other tests
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856)
>      * igt@gen9_exec_parse@bb-start-param:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2527) +1 other test skip
>      * igt@gen9_exec_parse@unaligned-access:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 other
>             test skip
>      * igt@gen9_exec_parse@valid-registers:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527)
>      * igt@i915_drm_fdinfo@all-busy-idle-check-all:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#14123)
>      * igt@i915_drm_fdinfo@busy-idle-check-all@ccs0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11527) +7 other tests skip
>      * igt@i915_drm_fdinfo@virtual-busy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#14118) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#14118) +1 other test skip
>      * igt@i915_drm_fdinfo@virtual-busy-hang-all:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14118) +1 other test skip
>      * igt@i915_module_load@fault-injection:
> 
>           * shard-tglu: NOTRUN -> ABORT (i915#15342 / i915#15481)
>           * shard-glk: NOTRUN -> ABORT (i915#15342 / i915#15481)
>      * igt@i915_module_load@fault-injection@i915_driver_hw_probe:
> 
>           * shard-tglu: NOTRUN -> ABORT (i915#15481)
>           * shard-glk: NOTRUN -> ABORT (i915#15481)
>      * igt@i915_module_load@fault-injection@intel_connector_register:
> 
>           * shard-tglu: NOTRUN -> DMESG-WARN (i915#15342)
>           * shard-glk: NOTRUN -> DMESG-WARN (i915#15342)
>      * igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15479) +4 other tests skip
>      * igt@i915_pm_freq_api@freq-suspend@gt0:
> 
>           * shard-dg2: PASS -> INCOMPLETE (i915#13356 / i915#13820) +1 other
>             test incomplete
>      * igt@i915_pm_rpm@system-suspend:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#4391 / i915#4423)
>      * igt@i915_pm_rps@thresholds-idle-park:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11681)
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4387)
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6245)
>      * igt@i915_selftest@live@workarounds:
> 
>           * shard-dg2: PASS -> DMESG-FAIL (i915#12061) +1 other test
>             dmesg-fail
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-rkl: PASS -> ABORT (i915#15131)
>      * igt@i915_suspend@debugfs-reader:
> 
>           * shard-rkl: NOTRUN -> INCOMPLETE (i915#4817)
>      * igt@kms_addfb_basic@basic-x-tiled-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4212) +1 other test skip
>      * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12454 / i915#12712)
>      * igt@kms_async_flips@async-flip-suspend-resume:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12761) +1 other test
>             incomplete
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#1769)
>           * shard-rkl: NOTRUN -> SKIP (i915#1769 / i915#3555)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-glk10: NOTRUN -> SKIP (i915#1769)
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +2 other tests
>             skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +5 other tests skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#5286)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +3 other tests skip
>      * igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3638)
>      * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3828) +1 other test skip
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3638) +1 other test
>             skip
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638) +4 other tests skip
>      * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-mtlp: NOTRUN -> SKIP +4 other tests skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +5 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538) +2 other tests skip
>      * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#6095) +9 other tests
>             skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12313) +2 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#6095) +52 other
>             tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +73 other tests skip
>      * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +207 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +14 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#14544 / i915#6095)
>             +5 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12805)
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> ABORT (i915#15132)
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6095) +49 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#14694)
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +34 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +150 other
>             tests skip
>      * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6095) +19 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12313)
>           * shard-dg1: NOTRUN -> SKIP (i915#12313)
>           * shard-mtlp: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12313) +1 other test skip
>      * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11151 / i915#7828) +3 other
>             tests skip
>      * igt@kms_chamelium_frames@hdmi-crc-multiple:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11151 / i915#7828) +3 other tests
>             skip
>      * igt@kms_chamelium_frames@hdmi-crc-single:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#7828) +8 other tests
>             skip
>      * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11151 / i915#7828) +2 other
>             tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#11151 / i915#7828) +2 other
>             tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11151 / i915#7828) +4 other tests
>             skip
>      * igt@kms_color@deep-color:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#9979)
>      * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-dp-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15523) +3 other tests skip
>      * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15523) +3 other tests skip
>      * igt@kms_content_protection@atomic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6944 / i915#7118 / i915#9424)
>      * igt@kms_content_protection@atomic-dpms-hdcp14:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6944)
>      * igt@kms_content_protection@content-type-change:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6944 / i915#9424)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6944 / i915#9424)
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15330 / i915#3116)
>           * shard-tglu: NOTRUN -> SKIP (i915#15330 / i915#3116 / i915#3299)
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15330 / i915#3116)
>      * igt@kms_content_protection@legacy-hdcp14:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6944)
>           * shard-dg1: NOTRUN -> SKIP (i915#6944)
>      * igt@kms_content_protection@legacy@pipe-a-dp-3:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#7173) +4 other tests fail
>      * igt@kms_content_protection@lic-type-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6944 / i915#9424)
>      * igt@kms_content_protection@srm:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6944 / i915#7118)
>      * igt@kms_content_protection@suspend-resume:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6944)
>      * igt@kms_cursor_crc@cursor-offscreen-128x42:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814)
>      * igt@kms_cursor_crc@cursor-onscreen-32x10:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +1 other test skip
>      * igt@kms_cursor_crc@cursor-onscreen-64x21:
> 
>           * shard-rkl: PASS -> FAIL (i915#13566) +1 other test fail
>      * igt@kms_cursor_crc@cursor-random-128x42:
> 
>           * shard-tglu: PASS -> FAIL (i915#13566) +5 other tests fail
>      * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#13566) +1 other test fail
>      * igt@kms_cursor_crc@cursor-random-512x170:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13049) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#13049) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP (i915#13049)
>           * shard-mtlp: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13049) +1 other test skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555) +1 other test skip
>      * igt@kms_cursor_crc@cursor-sliding-32x10:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3555) +1 other test
>             skip
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13049) +3 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814)
>           * shard-dg2: NOTRUN -> SKIP (i915#3555)
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-suspend:
> 
>           * shard-glk10: NOTRUN -> INCOMPLETE (i915#12358 / i915#14152 /
>             i915#7882)
>      * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
> 
>           * shard-glk10: NOTRUN -> INCOMPLETE (i915#12358 / i915#14152)
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP +18 other tests skip
>      * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9809) +2 other tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13046 / i915#5354) +2 other tests
>             skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>           * shard-dg1: NOTRUN -> SKIP +27 other tests skip
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2346)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4103)
>           * shard-rkl: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9833)
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13691 / i915#14544)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_dp_link_training@uhbr-sst:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#13748)
>      * igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13707)
>      * igt@kms_dp_linktrain_fallback@dsc-fallback:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13707)
>      * igt@kms_draw_crc@draw-method-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8812)
>      * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840) +1 other test
>             skip
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-snb: PASS -> DMESG-WARN (i915#13899)
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#9878)
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9337)
>      * igt@kms_feature_discovery@psr1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#658)
>      * igt@kms_feature_discovery@psr2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#658)
>      * igt@kms_fence_pin_leak:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4881)
>      * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#9934)
>      * igt@kms_flip@2x-flip-vs-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9934) +8 other tests skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3637 / i915#9934) +1 other
>             test skip
>      * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9934)
>      * igt@kms_flip@2x-flip-vs-expired-vblank:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9934) +1 other test skip
>      * igt@kms_flip@2x-flip-vs-panning-interruptible:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#9934) +2 other tests
>             skip
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>           * shard-glk10: NOTRUN -> INCOMPLETE (i915#12745 / i915#4839)
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>           * shard-glk10: NOTRUN -> INCOMPLETE (i915#4839)
>      * igt@kms_flip@2x-plain-flip-interruptible:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +4 other tests skip
>      * igt@kms_flip@flip-vs-expired-vblank:
> 
>           * shard-dg1: PASS -> FAIL (i915#13027)
>      * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#13027)
>      * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15573) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672) +2 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2672 / i915#3555) +2 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8810 / i915#8813) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672 / i915#3555) +3 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672) +3 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672) +2 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672 / i915#3555 / i915#5190)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672)
>      * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15573) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-pwrite:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#15389)
>      * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#15389 / i915#6880)
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
> 
>           * shard-dg2: PASS -> FAIL (i915#15389 / i915#6880) +1 other test
>             fail
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite:
> 
>           * shard-snb: PASS -> SKIP
>      * igt@kms_frontbuffer_tracking@fbc-2p-rte:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +8 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15574) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#10056)
>      * igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15102) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15102 / i915#3023)
>             +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15102 / i915#3023) +23 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15102) +10 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +38 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +10 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +26 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
> 
>           * shard-tglu: NOTRUN -> SKIP +44 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#1825) +4 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-cpu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15574) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-gtt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15574) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15574) +5 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#15574) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-pwrite:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15574) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#9766)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15102) +1 other test skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15104) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
> 
>           * shard-snb: NOTRUN -> SKIP +119 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15102 / i915#3458) +9 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15102 / i915#3458) +11 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15102) +11 other tests skip
>      * igt@kms_hdr@bpc-switch-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228) +3 other tests
>             skip
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#12713)
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228)
>           * shard-mtlp: NOTRUN -> SKIP (i915#12713 / i915#3555 / i915#8228)
>      * igt@kms_joiner@basic-max-non-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13688)
>      * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15458)
>      * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
> 
>           * shard-dg2: NOTRUN -> SKIP +2 other tests skip
>      * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
> 
>           * shard-glk: PASS -> INCOMPLETE (i915#12756 / i915#13409 /
>             i915#13476)
>      * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#14712)
>      * igt@kms_plane_alpha_blend@alpha-basic:
> 
>           * shard-glk10: NOTRUN -> FAIL (i915#12178)
>      * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
> 
>           * shard-glk10: NOTRUN -> FAIL (i915#7862) +1 other test fail
>      * igt@kms_plane_multiple@2x-tiling-4:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@2x-tiling-x:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13958)
>           * shard-rkl: NOTRUN -> SKIP (i915#13958 / i915#14544)
>           * shard-dg1: NOTRUN -> SKIP (i915#13958)
>           * shard-tglu: NOTRUN -> SKIP (i915#13958)
>           * shard-mtlp: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@2x-tiling-y:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15329) +3 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
> 
>           * shard-glk: NOTRUN -> SKIP +533 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15329) +4 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15329 / i915#3555 / i915#6953)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15329) +3 other tests skip
>      * igt@kms_pm_backlight@bad-brightness:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9812)
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#12343)
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3828)
>           * shard-dg1: NOTRUN -> SKIP (i915#3828)
>           * shard-tglu: NOTRUN -> SKIP (i915#3828)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14104)
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-dg1: PASS -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@fences-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +7 other tests skip
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15073)
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-rkl: PASS -> SKIP (i915#15073)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15073)
>           * shard-tglu: NOTRUN -> SKIP (i915#15073)
>           * shard-mtlp: NOTRUN -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@package-g7:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15403)
>           * shard-mtlp: NOTRUN -> SKIP (i915#15403)
>           * shard-dg2: NOTRUN -> SKIP (i915#15403)
>           * shard-rkl: NOTRUN -> SKIP (i915#15403)
>           * shard-dg1: NOTRUN -> SKIP (i915#15403)
>      * igt@kms_prime@d3hot:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11520) +2 other tests skip
>           * shard-snb: NOTRUN -> SKIP (i915#11520)
>           * shard-dg1: NOTRUN -> SKIP (i915#11520) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#12316)
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11520) +2 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-glk10: NOTRUN -> SKIP (i915#11520) +2 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11520) +6 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#11520) +14 other tests skip
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9683)
>           * shard-tglu: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-pr-sprite-plane-onoff:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9732) +8 other tests skip
>      * igt@kms_psr@fbc-pr-suspend:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +8 other tests
>             skip
>      * igt@kms_psr@fbc-psr-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#14544 / i915#9732) +2
>             other tests skip
>      * igt@kms_psr@fbc-psr2-primary-mmap-cpu:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +6 other tests skip
>      * igt@kms_psr@fbc-psr2-primary-mmap-gtt:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +14 other tests skip
>      * igt@kms_psr@fbc-psr2-sprite-render:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +24 other tests
>             skip
>      * igt@kms_psr@pr-cursor-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +14 other tests
>             skip
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_rotation_crc@exhaust-fences:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4884)
>      * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#15492)
>      * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5289)
>           * shard-dg1: NOTRUN -> SKIP (i915#5289)
>           * shard-tglu: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12755 / i915#5190)
>      * igt@kms_rotation_crc@sprite-rotation-270:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12755)
>      * igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12276) +1 other test
>             incomplete
>      * igt@kms_vrr@flipline:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15243 / i915#3555)
>      * igt@kms_vrr@lobf:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11920)
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#9906)
>      * igt@perf@per-context-mode-unprivileged:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#2435)
>      * igt@perf@unprivileged-single-ctx-counters:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2433)
>      * igt@perf_pmu@rc6-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13356)
>      * igt@sriov_basic@bind-unbind-vf:
> 
>           * shard-glk10: NOTRUN -> SKIP +94 other tests skip
>      * igt@sriov_basic@enable-vfs-bind-unbind-each:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9917)
>      * igt@tools_test@sysfs_l3_parity:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544) +3 other tests skip
> 
>     Possible fixes
> 
>      * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0:
> 
>           * shard-dg2: INCOMPLETE (i915#12392 / i915#13356) -> PASS
>      * igt@gem_ctx_isolation@preservation-s3:
> 
>           * shard-rkl: INCOMPLETE (i915#13356) -> PASS +2 other tests pass
>      * igt@gem_eio@in-flight-suspend:
> 
>           * shard-rkl: INCOMPLETE (i915#13390) -> PASS
>      * igt@gem_exec_suspend@basic-s0@smem:
> 
>           * shard-dg2: INCOMPLETE (i915#13356) -> PASS +2 other tests pass
>      * igt@gem_mmap_offset@clear-via-pagefault:
> 
>           * shard-mtlp: ABORT (i915#14809) -> PASS +1 other test pass
>      * igt@i915_pm_rps@reset:
> 
>           * shard-snb: INCOMPLETE (i915#13729 / i915#13821) -> PASS
>      * igt@i915_selftest@live:
> 
>           * shard-mtlp: DMESG-FAIL (i915#12061 / i915#15560) -> PASS
>      * igt@i915_selftest@live@workarounds:
> 
>           * shard-mtlp: DMESG-FAIL (i915#12061) -> PASS
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-glk: INCOMPLETE (i915#4817) -> PASS
>      * igt@i915_suspend@fence-restore-untiled:
> 
>           * shard-rkl: INCOMPLETE (i915#4817) -> PASS
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-mtlp: FAIL (i915#5138) -> PASS
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: INCOMPLETE -> PASS
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-glk: INCOMPLETE -> PASS
>      * igt@kms_color@deep-color:
> 
>           * shard-rkl: SKIP (i915#12655 / i915#3555) -> PASS
>      * igt@kms_cursor_crc@cursor-sliding-64x21:
> 
>           * shard-rkl: FAIL (i915#13566) -> PASS +3 other tests pass
>           * shard-tglu: FAIL (i915#13566) -> PASS +3 other tests pass
>      * igt@kms_hdr@bpc-switch-suspend:
> 
>           * shard-dg2: SKIP (i915#3555 / i915#8228) -> PASS +2 other tests
>             pass
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-rkl: SKIP (i915#3555 / i915#8228) -> PASS
>      * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-rkl: SKIP (i915#15073) -> PASS
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-dg2: SKIP (i915#15073) -> PASS
>      * igt@kms_pm_rpm@i2c:
> 
>           * shard-dg1: DMESG-WARN (i915#4423) -> PASS +1 other test pass
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-dg1: SKIP (i915#15073) -> PASS +2 other tests pass
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-mtlp: FAIL (i915#15420) -> PASS +1 other test pass
> 
>     Warnings
> 
>      * igt@api_intel_bb@crc32:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6230) -> SKIP (i915#6230)
>      * igt@gem_basic@multigpu-create-close:
> 
>           * shard-rkl: SKIP (i915#7697) -> SKIP (i915#14544 / i915#7697)
>      * igt@gem_ccs@block-multicopy-compressed:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9323) -> SKIP (i915#9323)
>      * igt@gem_ccs@block-multicopy-inplace:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555 / i915#9323) -> SKIP
>             (i915#3555 / i915#9323)
>      * igt@gem_ccs@large-ctrl-surf-copy:
> 
>           * shard-rkl: SKIP (i915#13008) -> SKIP (i915#13008 / i915#14544)
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-rkl: SKIP (i915#9323) -> SKIP (i915#14544 / i915#9323)
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#280) -> SKIP (i915#280)
>      * igt@gem_exec_balancer@parallel-contexts:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4525) -> SKIP (i915#4525)
>      * igt@gem_exec_reloc@basic-active:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3281) -> SKIP (i915#3281) +4
>             other tests skip
>      * igt@gem_exec_reloc@basic-gtt-cpu:
> 
>           * shard-rkl: SKIP (i915#3281) -> SKIP (i915#14544 / i915#3281) +3
>             other tests skip
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-rkl: SKIP (i915#2190) -> SKIP (i915#14544 / i915#2190)
>      * igt@gem_lmem_swapping@random:
> 
>           * shard-rkl: SKIP (i915#4613) -> SKIP (i915#14544 / i915#4613)
>      * igt@gem_lmem_swapping@smem-oom:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4613) -> SKIP (i915#4613)
>      * igt@gem_pread@self:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3282) -> SKIP (i915#3282)
>      * igt@gem_userptr_blits@access-control:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3297) -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3297 / i915#3323) -> SKIP
>             (i915#3297 / i915#3323)
>      * igt@gem_userptr_blits@unsync-overlap:
> 
>           * shard-rkl: SKIP (i915#3297) -> SKIP (i915#14544 / i915#3297)
>      * igt@gen9_exec_parse@batch-without-end:
> 
>           * shard-rkl: SKIP (i915#2527) -> SKIP (i915#14544 / i915#2527)
>      * igt@gen9_exec_parse@bb-start-far:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2527) -> SKIP (i915#2527)
>      * igt@i915_pm_freq_api@freq-reset-multiple:
> 
>           * shard-rkl: SKIP (i915#8399) -> SKIP (i915#14544 / i915#8399)
>      * igt@i915_pm_freq_api@freq-suspend:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8399) -> SKIP (i915#8399)
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#5286) -> SKIP (i915#5286)
>      * igt@kms_big_fb@4-tiled-addfb-size-overflow:
> 
>           * shard-rkl: SKIP (i915#5286) -> SKIP (i915#14544 / i915#5286) +2
>             other tests skip
>      * igt@kms_big_fb@linear-16bpp-rotate-90:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3638) -> SKIP (i915#3638)
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>           * shard-rkl: SKIP (i915#3638) -> SKIP (i915#14544 / i915#3638)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP +6 other tests skip
>      * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#6095) -> SKIP (i915#14544 / i915#6095) +1
>             other test skip
>      * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#14098 /
>             i915#14544 / i915#6095) +5 other tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6095) -> SKIP (i915#6095) +5
>             other tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
> 
>           * shard-rkl: INCOMPLETE -> ABORT (i915#15132)
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
> 
>           * shard-glk: INCOMPLETE -> INCOMPLETE (i915#14694)
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>           * shard-rkl: SKIP (i915#12313) -> SKIP (i915#12313 / i915#14544)
>      * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#14544 / i915#6095) -> SKIP
>             (i915#14098 / i915#6095) +8 other tests skip
>      * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#7828) -> SKIP (i915#11151 /
>             i915#14544 / i915#7828) +4 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#14544 / i915#7828) -> SKIP
>             (i915#11151 / i915#7828) +1 other test skip
>      * igt@kms_content_protection@atomic-hdcp14:
> 
>           * shard-dg2: SKIP (i915#6944) -> FAIL (i915#7173) +1 other test
>             fail
>      * igt@kms_content_protection@legacy-hdcp14:
> 
>           * shard-dg2: FAIL (i915#7173) -> SKIP (i915#6944)
>      * igt@kms_content_protection@srm:
> 
>           * shard-dg2: SKIP (i915#6944 / i915#7118) -> FAIL (i915#7173)
>      * igt@kms_content_protection@suspend-resume:
> 
>           * shard-rkl: SKIP (i915#6944) -> SKIP (i915#14544 / i915#6944) +1
>             other test skip
>      * igt@kms_content_protection@uevent:
> 
>           * shard-rkl: SKIP (i915#6944 / i915#7118 / i915#9424) -> SKIP
>             (i915#14544 / i915#6944 / i915#7118 / i915#9424)
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>           * shard-rkl: SKIP -> SKIP (i915#14544) +8 other tests skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-rkl: SKIP (i915#4103) -> SKIP (i915#14544 / i915#4103)
>      * igt@kms_dp_link_training@uhbr-sst:
> 
>           * shard-rkl: SKIP (i915#13748) -> SKIP (i915#13748 / i915#14544)
>      * igt@kms_dsc@dsc-with-bpc:
> 
>           * shard-rkl: SKIP (i915#3555 / i915#3840) -> SKIP (i915#14544 /
>             i915#3555 / i915#3840)
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-rkl: SKIP (i915#9934) -> SKIP (i915#14544 / i915#9934) +2
>             other tests skip
>      * igt@kms_flip@2x-plain-flip-interruptible:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9934) -> SKIP (i915#9934) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2672) -> SKIP (i915#2672) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: SKIP (i915#2672) -> SKIP (i915#14544 / i915#2672) +3
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
> 
>           * shard-rkl: SKIP (i915#2672 / i915#3555) -> SKIP (i915#14544 /
>             i915#2672 / i915#3555) +3 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2672 / i915#3555) -> SKIP
>             (i915#2672 / i915#3555) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite:
> 
>           * shard-rkl: SKIP (i915#1825) -> SKIP (i915#14544 / i915#1825) +11
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15574) -> SKIP (i915#15574)
>      * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
> 
>           * shard-rkl: SKIP (i915#15574) -> SKIP (i915#14544 / i915#15574) +2
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#15102) -> SKIP (i915#14544 / i915#15102) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15102 / i915#3023) -> SKIP
>             (i915#15102 / i915#3023) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
> 
>           * shard-dg2: SKIP (i915#15102 / i915#3458) -> SKIP (i915#10433 /
>             i915#15102 / i915#3458)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15102) -> SKIP (i915#15102) +3
>             other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-rte:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1825) -> SKIP (i915#1825) +10
>             other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite:
> 
>           * shard-rkl: SKIP (i915#15102 / i915#3023) -> SKIP (i915#14544 /
>             i915#15102 / i915#3023) +7 other tests skip
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-dg2: SKIP (i915#13331) -> SKIP (i915#12713)
>           * shard-rkl: SKIP (i915#13331 / i915#14544) -> SKIP (i915#12713)
>      * igt@kms_hdr@static-swap:
> 
>           * shard-dg2: FAIL -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_joiner@basic-force-ultra-joiner:
> 
>           * shard-rkl: SKIP (i915#15458) -> SKIP (i915#14544 / i915#15458)
>      * igt@kms_plane_lowres@tiling-4:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555) -> SKIP (i915#3555)
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
> 
>           * shard-rkl: SKIP (i915#15329) -> SKIP (i915#14544 / i915#15329) +3
>             other tests skip
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-rkl: SKIP (i915#12343 / i915#14544) -> SKIP (i915#12343)
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-rkl: SKIP (i915#9685) -> SKIP (i915#14544 / i915#9685)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-rkl: SKIP (i915#9340) -> SKIP (i915#3828)
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-rkl: SKIP (i915#15073) -> SKIP (i915#14544 / i915#15073)
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
> 
>           * shard-rkl: SKIP (i915#11520 / i915#14544) -> SKIP (i915#11520) +3
>             other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
> 
>           * shard-rkl: SKIP (i915#11520) -> SKIP (i915#11520 / i915#14544) +3
>             other tests skip
>      * igt@kms_psr@pr-sprite-blt:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#14544 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732) +2 other tests skip
>      * igt@kms_psr@pr-sprite-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 /
>             i915#14544 / i915#9732) +7 other tests skip
>      * igt@kms_vrr@flip-basic:
> 
>           * shard-rkl: SKIP (i915#15243 / i915#3555) -> SKIP (i915#14544 /
>             i915#15243 / i915#3555)
>      * igt@prime_vgem@basic-write:
> 
>           * shard-rkl: SKIP (i915#3291 / i915#3708) -> SKIP (i915#14544 /
>             i915#3291 / i915#3708)
>      * igt@prime_vgem@fence-flip-hang:
> 
>           * shard-rkl: SKIP (i915#3708) -> SKIP (i915#14544 / i915#3708)
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8701 -> IGTPW_14347
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_17821: 733664f1edf3c01cc68e6dd0bbdb135158a98a1d @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_14347: 14347
>    IGT_8701: 8701
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
