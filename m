Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D263C87FDB
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 10:43:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC7F10E437;
	Mon, 11 Aug 2025 10:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z0EWGlid";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C7610E437
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 10:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754909007; x=1786445007;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=EgsKrsZTU62eDNwQYKeE6h9Oghg09lI7NNKvZeq7l/A=;
 b=Z0EWGlidQ35zSH6mwaQfSm1jWAPkcy/Z9C/j3Jfyw7WYopONepghjB7q
 i1+UbCkhDOXAAX5Pa4Gxb0/sPM2giv9l2ncuLMMmGNO3csYjIbr5kqq3M
 +NK4/WWnbdBzXaMqqsKYbSiPXwhur94L3PCX2v1jRCs8QF2UkcgajW8VJ
 7y30AlUvt4XIUqDQIK4+uDb7UqyKTICvZ4P+SCA3LfWqSE24vH6aRl9wt
 668tlNXFsX9z8BgcUpeolBKVD2ednYKDrwOJep4Xbx5HvtOtWeCcukKQG
 xtLDxQdJaj3Ak1o8ytLMjBzSdmJRGGHgOReCQuWT/5dz9ZmuzGChnNdgc g==;
X-CSE-ConnectionGUID: lul8Fi82TDOo4kEQ9NwAEw==
X-CSE-MsgGUID: X0uBU68xQlO9c1TXg4Qyfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67865540"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="67865540"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 03:43:26 -0700
X-CSE-ConnectionGUID: 4DURncsYTBC4NFkAFg4jUw==
X-CSE-MsgGUID: TDf1gBwRTEG0VDlorxz13w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="171236186"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.84])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 03:43:24 -0700
Date: Mon, 11 Aug 2025 12:43:21 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests=2Fx?=
 =?utf-8?Q?e=5Fcompute=5Fpreempt?= =?utf-8?Q?=3A?= remove WMTP check in
 multiprocess tests
Message-ID: <u4dc3lzhkhte7ziwstpkj2joymdtsl7qqaaxoboza457o4gnim@erooe7e6soig>
References: <20250811054650.37114-2-zbigniew.kempczynski@intel.com>
 <175489947695.225352.7011372124175070308@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175489947695.225352.7011372124175070308@1538d3639d33>
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

On Mon, Aug 11, 2025 at 08:04:36AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/xe_compute_preempt: remove WMTP check in multiprocess tests 
>    URL:     https://patchwork.freedesktop.org/series/152738/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13566/index.html   
> 
>         CI Bug Log - changes from CI_DRM_16974_full -> IGTPW_13566_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_13566_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_13566_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13566/index.html
> 
> Participating hosts (13 -> 13)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_13566_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
> 
>           * shard-dg2-9: NOTRUN -> ABORT
>      * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: NOTRUN -> FAIL +1 other test fail
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-dg2-9: PASS -> DMESG-WARN

Unrelated, patch touches xe_compute_preempt only.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between CI_DRM_16974_full and
>    IGTPW_13566_full:
> 
>   New IGT tests (15)
> 
>      * igt@gem_userptr_blits@mmap-offset-banned@fixed:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [0.0, 0.00] s
>      * igt@kms_busy@basic-hang@flip-pipe-b:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.43] s
>      * igt@kms_busy@basic-hang@modeset-pipe-b:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.77] s
>      * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-b:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [2.81, 11.74] s
>      * igt@kms_busy@extended-modeset-hang-newfb@pipe-b:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [11.96, 24.03] s
>      * igt@kms_busy@extended-modeset-hang-newfb@pipe-c:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [7.97] s
>      * igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-c:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.51] s
>      * igt@kms_busy@extended-pageflip-hang-newfb@pipe-b:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [5.96] s
>      * igt@kms_busy@extended-pageflip-hang-oldfb@pipe-b:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [0.14, 0.26] s
>      * igt@kms_busy@extended-pageflip-modeset-hang-oldfb@pipe-b:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [6.02, 19.94] s
>      * igt@kms_busy@extended-pageflip-modeset-hang-oldfb@pipe-c:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [3.99] s
>      * igt@kms_cursor_crc@cursor-tearing-position-change@pipe-a-dp-3:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.50] s
>      * igt@kms_cursor_crc@cursor-tearing-position-change@pipe-d-dp-3:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.44] s
>      * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [3.55] s
>      * igt@perf_pmu@faulting-read@fixed:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [0.00] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_13566_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@crc32:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6230)
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8411)
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11078)
>      * igt@device_reset@unbind-cold-reset-rebind:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11078)
>      * igt@fbdev@unaligned-read:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#2582)
>      * igt@gem_basic@multigpu-create-close:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_busy@semaphore:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3936)
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-dg2: PASS -> INCOMPLETE (i915#13356) +1 other test
>             incomplete
>      * igt@gem_close_race@multigpu-basic-process:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_ctx_persistence@heartbeat-hostile:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@processes:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#1099) +1 other test skip
>      * igt@gem_ctx_persistence@saturated-hostile-nopreempt@rcs0:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#5882) +7 other tests skip
>      * igt@gem_ctx_sseu@invalid-args:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#280) +1 other test skip
>      * igt@gem_exec_balancer@bonded-pair:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4771)
>      * igt@gem_exec_big@single:
> 
>           * shard-tglu: NOTRUN -> ABORT (i915#11713 / i915#14756)
>      * igt@gem_exec_capture@capture-recoverable:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6344)
>      * igt@gem_exec_fence@submit3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812) +1 other test skip
>      * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3539 / i915#4852) +1 other test
>             skip
>      * igt@gem_exec_flush@basic-wb-rw-default:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +1 other test
>             skip
>      * igt@gem_exec_params@rsvd2-dirt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5107)
>      * igt@gem_exec_reloc@basic-cpu-read:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3281) +6 other tests skip
>      * igt@gem_exec_reloc@basic-cpu-read-active:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3281) +2 other tests
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +1 other test skip
>      * igt@gem_exec_reloc@basic-gtt-read:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +8 other tests skip
>      * igt@gem_exec_reloc@basic-write-read-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281)
>      * igt@gem_exec_schedule@preempt-queue-contexts-chain:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4537 / i915#4812) +1 other test
>             skip
>      * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860) +2 other tests skip
>      * igt@gem_lmem_evict@dontneed-evict-race:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613 / i915#7582)
>      * igt@gem_lmem_swapping@heavy-multi:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@parallel-random-verify:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@random-engines:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@verify-ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +7 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_mmap_gtt@big-bo-tiledx:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4077) +4 other tests skip
>      * igt@gem_mmap_gtt@medium-copy-xy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +12 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +3 other tests skip
>      * igt@gem_mmap_wc@close:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +7 other tests skip
>      * igt@gem_mmap_wc@pf-nonblock:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_mmap_wc@read-write:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +1 other test skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +2 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3282)
>           * shard-dg1: NOTRUN -> SKIP (i915#3282)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +1 other test skip
>      * igt@gem_pread@exhaustion:
> 
>           * shard-glk10: NOTRUN -> WARN (i915#2658)
>      * igt@gem_pread@uncached:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3282) +1 other test skip
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-glk: NOTRUN -> WARN (i915#14702 / i915#2658)
>      * igt@gem_pxp@create-regular-buffer:
> 
>           * shard-rkl: PASS -> TIMEOUT (i915#12917 / i915#12964)
>      * igt@gem_pxp@create-regular-context-2:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_pxp@regular-baseline-src-copy-readible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +3 other tests skip
>      * igt@gem_pxp@reject-modify-context-protection-on:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#4270)
>      * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#5190 / i915#8428) +3 other
>             tests skip
>      * igt@gem_render_copy@y-tiled-to-vebox-linear:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +7 other tests
>             skip
>      * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428)
>      * igt@gem_set_tiling_vs_gtt:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_unfence_active_buffers:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4879)
>      * igt@gem_userptr_blits@coherency-unsync:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@dmabuf-unsync:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@forbidden-operations:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282 / i915#3297)
>      * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_workarounds@suspend-resume-context:
> 
>           * shard-glk11: NOTRUN -> INCOMPLETE (i915#13356)
>      * igt@gem_workarounds@suspend-resume-fd:
> 
>           * shard-glk11: NOTRUN -> INCOMPLETE (i915#13356 / i915#14586)
>      * igt@gen3_render_tiledy_blits:
> 
>           * shard-mtlp: NOTRUN -> SKIP +6 other tests skip
>      * igt@gen7_exec_parse@basic-allocation:
> 
>           * shard-dg2-9: NOTRUN -> SKIP +5 other tests skip
>      * igt@gen7_exec_parse@basic-rejected:
> 
>           * shard-dg2: NOTRUN -> SKIP +11 other tests skip
>      * igt@gen9_exec_parse@batch-zero-length:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 other test
>             skip
>      * igt@gen9_exec_parse@bb-secure:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +1 other test skip
>      * igt@gen9_exec_parse@bb-start-cmd:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2856) +3 other tests skip
>      * igt@i915_drm_fdinfo@all-busy-check-all:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#14123)
>           * shard-dg2: NOTRUN -> SKIP (i915#14123)
>           * shard-dg1: NOTRUN -> SKIP (i915#14123)
>      * igt@i915_drm_fdinfo@busy@vecs1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14073) +15 other tests skip
>      * igt@i915_drm_fdinfo@most-busy-idle-check-all:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#14073) +7 other tests skip
>      * igt@i915_drm_fdinfo@virtual-busy-idle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14118)
>      * igt@i915_fb_tiling@basic-x-tiling:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13786)
>      * igt@i915_module_load@resize-bar:
> 
>           * shard-dg2: NOTRUN -> DMESG-WARN (i915#14545)
>      * igt@i915_pm_rc6_residency@rc6-accuracy:
> 
>           * shard-rkl: PASS -> FAIL (i915#12942) +1 other test fail
>      * igt@i915_pm_rc6_residency@rc6-idle:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#14498)
>      * igt@i915_pm_rpm@system-suspend:
> 
>           * shard-glk10: NOTRUN -> INCOMPLETE (i915#12797)
>      * igt@i915_pm_rps@basic-api:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11681 / i915#6621)
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-tglu-1: NOTRUN -> INCOMPLETE (i915#4817 / i915#7443)
>      * igt@i915_suspend@sysfs-reader:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#4817)
>      * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12454 / i915#12712)
>      * igt@kms_async_flips@invalid-async-flip-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12967)
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9531)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#1769)
>      * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: PASS -> DMESG-WARN (i915#12964) +41 other tests
>             dmesg-warn
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +3 other tests skip
>      * igt@kms_big_fb@4-tiled-addfb-size-overflow:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5286) +1 other test skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286)
>      * igt@kms_big_fb@linear-64bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638)
>           * shard-dg1: NOTRUN -> SKIP (i915#3638)
>      * igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +1 other test skip
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +7 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4538 / i915#5190) +3 other
>             tests skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544) +6 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4538)
>      * igt@kms_ccs@bad-aux-stride-y-tiled-ccs:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#10307 / i915#6095) +39 other
>             tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +130 other tests skip
>      * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +54 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-glk: NOTRUN -> SKIP +441 other tests skip
>      * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +29 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12805)
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#6095) +38 other
>             tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#4423) +1 other test
>             dmesg-warn
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> DMESG-WARN (i915#4423)
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6095) +25 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6095) +14 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +40 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>      * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12313) +2 other tests skip
>      * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +141 other
>             tests skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13784)
>      * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13781) +3 other tests skip
>      * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13783) +4 other tests skip
>      * igt@kms_chamelium_edid@dp-edid-resolution-list:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11151 / i915#7828)
>           * shard-tglu: NOTRUN -> SKIP (i915#11151 / i915#7828) +2 other
>             tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#11151 / i915#7828)
>      * igt@kms_chamelium_frames@dp-crc-multiple:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11151 / i915#7828) +4 other
>             tests skip
>      * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11151 / i915#7828) +6 other tests
>             skip
>      * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#7828) +3 other tests
>             skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11151 / i915#7828) +1 other
>             test skip
>      * igt@kms_color@ctm-max:
> 
>           * shard-rkl: PASS -> SKIP (i915#12655 / i915#14544) +3 other tests
>             skip
>      * igt@kms_color@deep-color:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#9979)
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3299)
>           * shard-rkl: NOTRUN -> SKIP (i915#3116)
>           * shard-dg1: NOTRUN -> SKIP (i915#3299)
>           * shard-tglu: NOTRUN -> SKIP (i915#3116 / i915#3299)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3299)
>      * igt@kms_content_protection@legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7118 / i915#9424) +1 other test
>             skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118 /
>             i915#9424)
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9424)
>      * igt@kms_content_protection@type1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118 /
>             i915#9424)
>      * igt@kms_cursor_crc@cursor-offscreen-256x256:
> 
>           * shard-rkl: PASS -> DMESG-WARN (i915#12917 / i915#12964)
>      * igt@kms_cursor_crc@cursor-offscreen-64x21:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814)
>      * igt@kms_cursor_crc@cursor-onscreen-128x42:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#13566) +2 other tests fail
>           * shard-tglu: PASS -> FAIL (i915#13566) +3 other tests fail
>      * igt@kms_cursor_crc@cursor-random-64x21:
> 
>           * shard-tglu-1: NOTRUN -> FAIL (i915#13566) +1 other test fail
>      * igt@kms_cursor_crc@cursor-random-max-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814) +1 other test
>             skip
>      * igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13049) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12358 / i915#14152 /
>             i915#7882)
>      * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#14152)
>      * igt@kms_cursor_edge_walk@64x64-left-edge:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544) +44 other tests skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213) +3 other tests
>             skip
>      * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
> 
>           * shard-glk10: NOTRUN -> SKIP (i915#11190) +1 other test skip
>      * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +22 other tests skip
>           * shard-dg2: NOTRUN -> SKIP (i915#13046 / i915#5354)
>      * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13046 / i915#5354)
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
> 
>           * shard-rkl: NOTRUN -> SKIP +6 other tests skip
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2346)
>      * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
> 
>           * shard-rkl: PASS -> FAIL (i915#2346)
>      * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9833)
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13691)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
> 
>           * shard-dg2: PASS -> SKIP (i915#3555)
>      * igt@kms_dp_link_training@uhbr-mst:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13748)
>      * igt@kms_dp_link_training@uhbr-sst:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13748)
>      * igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13707)
>           * shard-rkl: NOTRUN -> SKIP (i915#13707)
>           * shard-dg1: NOTRUN -> SKIP (i915#13707)
>           * shard-mtlp: NOTRUN -> SKIP (i915#13707)
>      * igt@kms_dp_linktrain_fallback@dsc-fallback:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13707)
>      * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3840)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3840 / i915#9053)
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#14561)
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3469)
>      * igt@kms_feature_discovery@display-1x:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#9738)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9337)
>           * shard-dg1: NOTRUN -> SKIP (i915#9337)
>           * shard-tglu: NOTRUN -> SKIP (i915#9337)
>           * shard-mtlp: NOTRUN -> SKIP (i915#9337)
>      * igt@kms_feature_discovery@psr2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#658)
>      * igt@kms_flip@2x-blocking-wf_vblank:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9934) +7 other tests skip
>      * igt@kms_flip@2x-flip-vs-dpms-on-nop:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9934)
>      * igt@kms_flip@2x-flip-vs-panning-interruptible:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9934) +5 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#9934)
>      * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#4839)
>      * igt@kms_flip@2x-nonexisting-fb:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#9934) +3 other tests
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637 / i915#9934) +2 other tests
>             skip
>      * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3637 / i915#9934) +1 other
>             test skip
>      * igt@kms_flip@blocking-absolute-wf_vblank-interruptible:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3637)
>      * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#3637) +4 other tests
>             skip
>      * igt@kms_flip@flip-vs-fences:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8381)
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12745 / i915#4839) +1 other
>             test incomplete
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12745)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672 / i915#3555)
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672 / i915#3555) +1
>             other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672 / i915#3555 / i915#8813)
>           * shard-dg2: NOTRUN -> SKIP (i915#2672 / i915#3555 / i915#5190)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672 / i915#8813)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672)
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672) +3 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#3555) +2 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2672 / i915#3555 / i915#5190)
>             +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672) +4 other tests skip
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2672) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other
>             test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2587 / i915#2672) +1 other
>             test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672 / i915#3555) +2 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +24 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#1849 / i915#5354) +3
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
> 
>           * shard-dg1: NOTRUN -> SKIP +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +12 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#1849 / i915#5354) +12
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#10056)
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#10056)
>      * igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#10055)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
> 
>           * shard-glk10: NOTRUN -> SKIP +262 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3458) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
> 
>           * shard-glk11: NOTRUN -> SKIP +76 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +14 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10433 / i915#3458) +1 other test
>             skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +6 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#8708) +8 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#5354) +14 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
> 
>           * shard-tglu: NOTRUN -> SKIP +59 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +4 other tests skip
>      * igt@kms_hdr@bpc-switch-dpms:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#12713)
>      * igt@kms_hdr@static-swap:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_invalid_mode@bad-hsync-end:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3555 / i915#8826)
>      * igt@kms_invalid_mode@int-max-clock:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#3555 / i915#8826) +1
>             other test skip
>      * igt@kms_joiner@basic-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#10656)
>      * igt@kms_joiner@basic-force-ultra-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12394)
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12339)
>      * igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>           * shard-dg2: PASS -> SKIP (i915#12388) +1 other test skip
>      * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13522)
>           * shard-mtlp: NOTRUN -> SKIP (i915#13522)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4816)
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
> 
>           * shard-rkl: PASS -> SKIP (i915#11190 / i915#14544) +2 other tests
>             skip
>      * igt@kms_pipe_crc_basic@nonblocking-crc:
> 
>           * shard-glk11: NOTRUN -> SKIP (i915#11190)
>      * igt@kms_plane_alpha_blend@alpha-basic:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#7294) +1 other test
>             skip
>      * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128:
> 
>           * shard-rkl: NOTRUN -> DMESG-WARN (i915#12964) +11 other tests
>             dmesg-warn
>      * igt@kms_plane_multiple@2x-tiling-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13958)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>           * shard-glk: PASS -> SKIP +1 other test skip
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6953 / i915#9423)
>      * igt@kms_plane_scaling@invalid-parameters:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#8152) +1 other test
>             skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12247) +4 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b:
> 
>           * shard-snb: NOTRUN -> SKIP +58 other tests skip
>      * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a:
> 
>           * shard-rkl: PASS -> SKIP (i915#12247 / i915#14544) +3 other tests
>             skip
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12247)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-a:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12247 / i915#14544)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12247 / i915#14544 / i915#8152)
>             +1 other test skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#6953 / i915#8152)
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#3555 / i915#6953 /
>             i915#8152)
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b:
> 
>           * shard-rkl: PASS -> SKIP (i915#12247 / i915#14544 / i915#8152) +4
>             other tests skip
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12343 / i915#14544)
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3828)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#9295)
>           * shard-dg2-9: NOTRUN -> SKIP (i915#14104)
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9685) +1 other test skip
>      * igt@kms_pm_lpsp@screens-disabled:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#8430)
>      * igt@kms_pm_rpm@dpms-non-lpsp:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9519) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#9519)
>           * shard-dg2: NOTRUN -> SKIP (i915#9519)
>           * shard-rkl: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@fences-dpms:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#1849)
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-rkl: PASS -> SKIP (i915#9519) +2 other tests skip
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9519) +1 other test skip
>      * igt@kms_prime@basic-crc-hybrid:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#6524 / i915#6805)
>      * igt@kms_properties@plane-properties-legacy:
> 
>           * shard-rkl: PASS -> SKIP (i915#11521 / i915#14544) +1 other test
>             skip
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9808) +3 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11520) +7 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11520) +1 other test skip
>           * shard-snb: NOTRUN -> SKIP (i915#11520) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#11520) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP (i915#11520) +6 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#12316) +2 other tests skip
>      * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-glk11: NOTRUN -> SKIP (i915#11520)
>      * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
> 
>           * shard-glk10: NOTRUN -> SKIP (i915#11520) +6 other tests skip
>      * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#11520) +11 other tests skip
>      * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11520) +1 other test skip
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9683) +1 other test skip
>      * igt@kms_psr@fbc-psr-cursor-mmap-cpu:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#1072 / i915#9732) +9 other
>             tests skip
>      * igt@kms_psr@fbc-psr-primary-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +19 other tests
>             skip
>      * igt@kms_psr@fbc-psr-primary-page-flip:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +6 other tests
>             skip
>      * igt@kms_psr@fbc-psr-primary-page-flip@edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +3 other tests skip
>      * igt@kms_psr@psr-cursor-plane-onoff:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +3 other tests
>             skip
>      * igt@kms_psr@psr-sprite-blt:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +15 other tests skip
>      * igt@kms_psr@psr2-sprite-mmap-cpu:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9732) +4 other tests skip
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_rotation_crc@bad-tiling:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#12755) +1 other test skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12755 / i915#5190)
>      * igt@kms_rotation_crc@sprite-rotation-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12755) +1 other test skip
>      * igt@kms_scaling_modes@scaling-mode-none:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>      * igt@kms_setmode@basic-clone-single-crtc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3555) +1 other test
>             skip
>      * igt@kms_setmode@clone-exclusive-crtc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555)
>      * igt@kms_vrr@flip-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +3 other tests skip
>      * igt@kms_vrr@seamless-rr-switch-virtual:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_vrr@seamless-rr-switch-vrr:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#2437) +2 other tests skip
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2437 / i915#9412)
>      * igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2436)
>      * igt@perf@global-sseu-config:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7387)
>      * igt@perf@mi-rpc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2434)
>      * igt@perf@per-context-mode-unprivileged:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2435)
>           * shard-dg1: NOTRUN -> SKIP (i915#2433)
>      * igt@perf_pmu@busy-double-start:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#4349) +2 other tests fail
>      * igt@perf_pmu@busy-double-start@vecs1:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#4349) +4 other tests fail
>      * igt@perf_pmu@most-busy-idle-check-all:
> 
>           * shard-rkl: PASS -> FAIL (i915#4349) +1 other test fail
>      * igt@perf_pmu@rc6-all-gts:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8516)
>      * igt@prime_vgem@basic-fence-mmap:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3708 / i915#4077)
>      * igt@prime_vgem@basic-fence-read:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3291 / i915#3708)
>      * igt@prime_vgem@basic-write:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3291 / i915#3708) +1 other test
>             skip
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708)
>      * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#12910)
>      * igt@tools_test@sysfs_l3_parity:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4818)
> 
>     Possible fixes
> 
>      * igt@fbdev@nullptr:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2582) -> PASS +1 other test
>             pass
>      * igt@gem_caching@writes:
> 
>           * shard-rkl: DMESG-WARN (i915#12917 / i915#12964) -> PASS
>      * igt@gem_eio@reset-stress:
> 
>           * shard-dg1: FAIL (i915#5784) -> PASS +1 other test pass
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * shard-dg2: TIMEOUT (i915#5493) -> PASS +1 other test pass
>      * igt@gem_pxp@create-protected-buffer:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4270) -> PASS
>      * igt@gem_pxp@verify-pxp-stale-ctx-execution:
> 
>           * shard-rkl: TIMEOUT (i915#12917 / i915#12964) -> PASS +1 other
>             test pass
>      * igt@gem_workarounds@suspend-resume:
> 
>           * shard-dg2: ABORT (i915#8213) -> PASS +2 other tests pass
>      * igt@i915_hangman@gt-error-state-capture@rcs0:
> 
>           * shard-rkl: DMESG-WARN (i915#12964) -> PASS +24 other tests pass
>      * igt@i915_module_load@reload-no-display:
> 
>           * shard-dg2: DMESG-WARN (i915#13029 / i915#14545) -> PASS
>           * shard-tglu: DMESG-WARN (i915#13029 / i915#14545) -> PASS
>      * igt@i915_pm_rpm@system-suspend-execbuf:
> 
>           * shard-glk: INCOMPLETE (i915#12797) -> PASS
>      * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:
> 
>           * shard-rkl: SKIP (i915#14544) -> PASS +54 other tests pass
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-mtlp: FAIL (i915#5138) -> PASS +1 other test pass
>      * igt@kms_color@gamma:
> 
>           * shard-rkl: SKIP (i915#12655 / i915#14544) -> PASS +2 other tests
>             pass
>      * igt@kms_cursor_crc@cursor-onscreen-256x85:
> 
>           * shard-tglu: FAIL (i915#13566) -> PASS +3 other tests pass
>      * igt@kms_cursor_crc@cursor-random-256x85:
> 
>           * shard-rkl: FAIL (i915#13566) -> PASS +1 other test pass
>      * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
> 
>           * shard-rkl: SKIP (i915#11190 / i915#14544) -> PASS +3 other tests
>             pass
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-dg2: SKIP (i915#3555) -> PASS
>      * igt@kms_flip@2x-flip-vs-fences:
> 
>           * shard-glk: SKIP -> PASS +1 other test pass
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>           * shard-snb: TIMEOUT (i915#14033 / i915#14350) -> PASS
>      * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
> 
>           * shard-snb: TIMEOUT (i915#14033) -> PASS +2 other tests pass
>      * igt@kms_flip@blocking-wf_vblank:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3637) -> PASS +2 other tests
>             pass
>      * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555) -> PASS +4 other tests
>             pass
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1849 / i915#5354) -> PASS +9
>             other tests pass
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
> 
>           * shard-dg2: FAIL (i915#6880) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-snb: SKIP -> PASS
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-dg2: SKIP (i915#3555 / i915#8228) -> PASS +1 other test
>             pass
>      * igt@kms_invalid_mode@clock-too-high:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555 / i915#8826) -> PASS
>      * igt@kms_plane@pixel-format-source-clamping:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8825) -> PASS +1 other test
>             pass
>      * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#7294) -> PASS +1 other test
>             pass
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8152) -> PASS +1 other test
>             pass
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-b:
> 
>           * shard-rkl: SKIP (i915#12247 / i915#14544 / i915#8152) -> PASS +6
>             other tests pass
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
> 
>           * shard-rkl: SKIP (i915#12247 / i915#14544 / i915#3555 / i915#6953
>             / i915#8152) -> PASS +1 other test pass
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
> 
>           * shard-rkl: SKIP (i915#12247 / i915#14544 / i915#6953 / i915#8152)
>             -> PASS
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:
> 
>           * shard-rkl: SKIP (i915#12247 / i915#14544) -> PASS +5 other tests
>             pass
>      * igt@kms_pm_rpm@cursor-dpms:
> 
>           * shard-rkl: SKIP (i915#12916) -> PASS
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-dg2: SKIP (i915#9519) -> PASS
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-rkl: SKIP (i915#9519) -> PASS
>      * igt@kms_properties@crtc-properties-legacy:
> 
>           * shard-rkl: SKIP (i915#11521 / i915#14544) -> PASS +1 other test
>             pass
>      * igt@kms_vblank@ts-continuation-modeset-rpm:
> 
>           * shard-dg1: DMESG-WARN (i915#4423) -> PASS +1 other test pass
>      * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: INCOMPLETE (i915#12276) -> PASS +1 other test pass
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-mtlp: FAIL (i915#10393) -> PASS +1 other test pass
> 
>     Warnings
> 
>      * igt@device_reset@unbind-cold-reset-rebind:
> 
>           * shard-rkl: SKIP (i915#11078) -> SKIP (i915#11078 / i915#14544)
>      * igt@gem_bad_reloc@negative-reloc-lut:
> 
>           * shard-rkl: SKIP (i915#3281) -> SKIP (i915#14544 / i915#3281) +6
>             other tests skip
>      * igt@gem_ccs@ctrl-surf-copy:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555 / i915#9323) -> SKIP
>             (i915#3555 / i915#9323)
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6335) -> SKIP (i915#6335)
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-rkl: SKIP (i915#280) -> SKIP (i915#14544 / i915#280) +1
>             other test skip
>      * igt@gem_exec_balancer@parallel-balancer:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4525) -> SKIP (i915#4525) +3
>             other tests skip
>      * igt@gem_exec_capture@capture-invisible@smem0:
> 
>           * shard-rkl: SKIP (i915#6334) -> SKIP (i915#14544 / i915#6334) +1
>             other test skip
>      * igt@gem_exec_reloc@basic-wc-gtt-active:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3281) -> SKIP (i915#3281) +4
>             other tests skip
>      * igt@gem_exec_schedule@semaphore-power:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#7276) -> SKIP (i915#7276)
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2190) -> SKIP (i915#2190)
>      * igt@gem_lmem_swapping@heavy-verify-random-ccs:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4613) -> SKIP (i915#4613) +2
>             other tests skip
>      * igt@gem_lmem_swapping@verify-random:
> 
>           * shard-rkl: SKIP (i915#4613) -> SKIP (i915#14544 / i915#4613) +2
>             other tests skip
>      * igt@gem_partial_pwrite_pread@reads-uncached:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3282) -> SKIP (i915#3282) +3
>             other tests skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>           * shard-rkl: SKIP (i915#3282) -> SKIP (i915#14544 / i915#3282) +4
>             other tests skip
>      * igt@gem_pxp@reject-modify-context-protection-off-1:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4270) -> TIMEOUT (i915#12917 /
>             i915#12964)
>      * igt@gem_pxp@reject-modify-context-protection-off-3:
> 
>           * shard-rkl: SKIP (i915#4270) -> TIMEOUT (i915#12917 / i915#12964)
>      * igt@gem_pxp@verify-pxp-stale-buf-execution:
> 
>           * shard-rkl: TIMEOUT (i915#12917 / i915#12964) -> SKIP (i915#14544
>             / i915#4270)
>      * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
> 
>           * shard-rkl: SKIP (i915#8411) -> SKIP (i915#14544 / i915#8411)
>      * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8411) -> SKIP (i915#8411)
>      * igt@gem_userptr_blits@coherency-sync:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3297) -> SKIP (i915#3297) +1
>             other test skip
>      * igt@gem_userptr_blits@dmabuf-unsync:
> 
>           * shard-rkl: SKIP (i915#3297) -> SKIP (i915#14544 / i915#3297) +1
>             other test skip
>      * igt@gen9_exec_parse@bb-oversize:
> 
>           * shard-rkl: SKIP (i915#2527) -> SKIP (i915#14544 / i915#2527) +3
>             other tests skip
>      * igt@gen9_exec_parse@secure-batches:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2527) -> SKIP (i915#2527) +2
>             other tests skip
>      * igt@i915_pm_freq_api@freq-reset:
> 
>           * shard-rkl: SKIP (i915#8399) -> SKIP (i915#14544 / i915#8399)
>      * igt@i915_pm_freq_api@freq-suspend:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8399) -> SKIP (i915#8399)
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6245) -> SKIP (i915#6245)
>      * igt@i915_query@test-query-geometry-subslices:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#5723) -> SKIP (i915#5723)
>      * igt@intel_hwmon@hwmon-read:
> 
>           * shard-rkl: SKIP (i915#7707) -> SKIP (i915#14544 / i915#7707)
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-rkl: SKIP (i915#12454 / i915#12712) -> SKIP (i915#12454 /
>             i915#12712 / i915#14544)
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
> 
>           * shard-rkl: SKIP (i915#5286) -> SKIP (i915#14544) +3 other tests
>             skip
>      * igt@kms_big_fb@4-tiled-addfb:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#5286) +2 other tests
>             skip
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#3638) +5 other tests
>             skip
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
> 
>           * shard-rkl: SKIP (i915#3638) -> SKIP (i915#14544) +5 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP +12 other tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#14544) +9
>             other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> 
>           * shard-rkl: SKIP (i915#12313) -> SKIP (i915#14544)
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#14098 / i915#6095) +12
>             other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#6095) -> SKIP (i915#14098 / i915#6095) +4
>             other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-rkl: SKIP (i915#12805) -> SKIP (i915#14544)
>      * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#6095)
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3742) -> SKIP (i915#3742)
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-rkl: SKIP (i915#3742) -> SKIP (i915#14544 / i915#3742) +1
>             other test skip
>      * igt@kms_chamelium_color@degamma:
> 
>           * shard-rkl: SKIP -> SKIP (i915#14544) +14 other tests skip
>      * igt@kms_chamelium_edid@hdmi-edid-read:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#7828) -> SKIP (i915#11151 /
>             i915#14544 / i915#7828) +5 other tests skip
>      * igt@kms_chamelium_frames@dp-frame-dump:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#14544 / i915#7828) -> SKIP
>             (i915#11151 / i915#7828) +6 other tests skip
>      * igt@kms_chamelium_frames@hdmi-crc-fast:
> 
>           * shard-dg1: SKIP (i915#11151 / i915#7828) -> SKIP (i915#11151 /
>             i915#4423 / i915#7828)
>      * igt@kms_content_protection@lic-type-1:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#9424)
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-dg1: SKIP (i915#9424) -> SKIP (i915#9433)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-rkl: SKIP (i915#7118 / i915#9424) -> SKIP (i915#14544)
>      * igt@kms_cursor_crc@cursor-random-512x170:
> 
>           * shard-rkl: SKIP (i915#13049) -> SKIP (i915#14544)
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#13049) +1 other test
>             skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>           * shard-rkl: SKIP (i915#3555) -> SKIP (i915#14544) +5 other tests
>             skip
>      * igt@kms_cursor_crc@cursor-sliding-128x42:
> 
>           * shard-rkl: SKIP (i915#14544) -> DMESG-FAIL (i915#12964)
>      * igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>           * shard-rkl: SKIP (i915#14544) -> DMESG-WARN (i915#12917 /
>             i915#12964)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-rkl: SKIP (i915#4103) -> SKIP (i915#14544) +1 other test
>             skip
>      * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#9067)
>      * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>           * shard-rkl: SKIP (i915#9723) -> SKIP (i915#14544) +1 other test
>             skip
>      * igt@kms_dp_link_training@uhbr-sst:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#13748) +1 other test
>             skip
>      * igt@kms_draw_crc@draw-method-mmap-cpu:
> 
>           * shard-rkl: SKIP (i915#14544) -> DMESG-WARN (i915#12964) +3 other
>             tests dmesg-warn
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-rkl: SKIP (i915#3555 / i915#3840) -> SKIP (i915#14544)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3955) -> SKIP (i915#3955)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4854) -> SKIP (i915#4854)
>      * igt@kms_flip@2x-absolute-wf_vblank:
> 
>           * shard-rkl: SKIP (i915#9934) -> SKIP (i915#14544 / i915#9934) +9
>             other tests skip
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9934) -> SKIP (i915#9934) +9
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555) -> SKIP (i915#2672 /
>             i915#3555) +4 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
> 
>           * shard-rkl: SKIP (i915#2672 / i915#3555) -> SKIP (i915#14544 /
>             i915#3555) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#1825) -> SKIP (i915#14544 / i915#1849 /
>             i915#5354) +30 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1849 / i915#5354) ->
>             DMESG-WARN (i915#12964)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
> 
>           * shard-dg2: SKIP (i915#3458) -> SKIP (i915#10433 / i915#3458) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#3458) -> SKIP (i915#3458)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
> 
>           * shard-rkl: SKIP (i915#3023) -> SKIP (i915#14544 / i915#1849 /
>             i915#5354) +22 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1849 / i915#5354) -> SKIP
>             (i915#1825) +33 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
> 
>           * shard-rkl: SKIP -> SKIP (i915#14544 / i915#1849 / i915#5354)
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1849 / i915#5354) -> SKIP
>             (i915#5439)
>      * igt@kms_frontbuffer_tracking@psr-suspend:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1849 / i915#5354) -> SKIP
>             (i915#3023) +23 other tests skip
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#3555 / i915#8228) +1
>             other test skip
>      * igt@kms_joiner@basic-force-big-joiner:
> 
>           * shard-rkl: SKIP (i915#12388) -> SKIP (i915#12388 / i915#14544)
>      * igt@kms_joiner@basic-max-non-joiner:
> 
>           * shard-rkl: SKIP (i915#13688 / i915#14544) -> SKIP (i915#13688)
>      * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>           * shard-rkl: SKIP (i915#12394 / i915#14544) -> SKIP (i915#12394)
>      * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>           * shard-rkl: SKIP (i915#13522) -> SKIP (i915#13522 / i915#14544)
>      * igt@kms_plane_multiple@2x-tiling-4:
> 
>           * shard-rkl: SKIP (i915#13958) -> SKIP (i915#14544)
>      * igt@kms_plane_multiple@2x-tiling-y:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-rkl: SKIP (i915#14259) -> SKIP (i915#14544)
>      * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8152) -> SKIP
>      * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
> 
>           * shard-rkl: SKIP (i915#12247) -> SKIP (i915#12247 / i915#14544)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b:
> 
>           * shard-rkl: SKIP (i915#12247) -> SKIP (i915#12247 / i915#14544 /
>             i915#8152) +1 other test skip
>      * igt@kms_pm_dc@dc5-dpms-negative:
> 
>           * shard-rkl: SKIP (i915#13441 / i915#14544) -> DMESG-WARN
>             (i915#12964)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-rkl: SKIP (i915#3361) -> FAIL (i915#9295)
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-rkl: SKIP (i915#9685) -> SKIP (i915#14544 / i915#9685) +2
>             other tests skip
>      * igt@kms_pm_dc@dc9-dpms:
> 
>           * shard-rkl: SKIP (i915#4281) -> SKIP (i915#14544 / i915#4281)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9340) -> SKIP (i915#3828)
>      * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
> 
>           * shard-rkl: SKIP (i915#11520 / i915#14544) -> SKIP (i915#11520) +6
>             other tests skip
>      * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
> 
>           * shard-rkl: SKIP (i915#11520) -> SKIP (i915#11520 / i915#14544) +6
>             other tests skip
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-rkl: SKIP (i915#9683) -> SKIP (i915#14544 / i915#9683) +1
>             other test skip
>      * igt@kms_psr@psr-cursor-plane-move:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#14544 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732) +18 other tests skip
>      * igt@kms_psr@psr-sprite-plane-move:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 /
>             i915#14544 / i915#9732) +19 other tests skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#5289)
>      * igt@kms_scaling_modes@scaling-mode-none:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#3555) +4 other tests
>             skip
>      * igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>           * shard-rkl: SKIP (i915#3555) -> SKIP (i915#14544 / i915#3555)
>      * igt@kms_setmode@invalid-clone-single-crtc:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555) -> SKIP (i915#3555)
>      * igt@kms_vrr@flip-basic-fastset:
> 
>           * shard-rkl: SKIP (i915#9906) -> SKIP (i915#14544)
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-rkl: SKIP (i915#2437) -> SKIP (i915#14544 / i915#2437)
>      * igt@kms_writeback@writeback-check-output-xrgb2101010:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2437 / i915#9412) -> SKIP
>             (i915#2437 / i915#9412)
>      * igt@perf@unprivileged-single-ctx-counters:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2433) -> SKIP (i915#2433)
>      * igt@prime_vgem@basic-write:
> 
>           * shard-rkl: SKIP (i915#3291 / i915#3708) -> SKIP (i915#14544 /
>             i915#3291 / i915#3708)
>      * igt@prime_vgem@fence-read-hang:
> 
>           * shard-rkl: SKIP (i915#3708) -> SKIP (i915#14544 / i915#3708)
>      * igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9917) -> SKIP (i915#9917)
>      * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>           * shard-rkl: SKIP (i915#9917) -> SKIP (i915#14544 / i915#9917)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8489 -> IGTPW_13566
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_16974: 0a2be3731268a69a6452047c2fb6699ee19afe5b @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_13566: 2e59493a2456abd9cf7f4c251a60085a2d5204db @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8489: 4972020ea0f3d0ac8a0d7dd4f5419119b1b30995 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
