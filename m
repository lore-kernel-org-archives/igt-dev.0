Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E92C54E90
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 14:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D5910E0D6;
	Thu, 22 May 2025 14:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+3a+ivz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA6410E07E;
 Thu, 22 May 2025 14:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747924203; x=1779460203;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r83zDHHb8QpPs1+wXp/9bNKmCW4K4hqQibgZtFWta94=;
 b=J+3a+ivzX3Cjpk1i/h6UK0JMi41vggnqn3sYmUed/RJPtVF9h4J6CgnH
 In8rbwKyxKcmkxkpESnAXATePqwVpMLuURWkSqH8UpVMJ0z0sQ/Df8F8S
 ZVT7fn0I4+YBFRJgoo3CQVXzCts9InOCGfHuO0c0fHe3qgwwauG5JoNQk
 M5z+Ill2Go45Zgy81u1byOM4TmcLjL+B4NEbS/g9e9mqvGPrna4RMNYGY
 7OqJ61gwP6unrAC0C5app2FhrgPN4f9C9hWApl2bb82wZzk8H4PVZGYC6
 Ii1mB2CKrx3acKKN4csMLUWgM/mT7ghncMsj5EfakxRW5f187cG0Yp1ax g==;
X-CSE-ConnectionGUID: ad6YJxiIT26VaS4xo2u+pQ==
X-CSE-MsgGUID: vuhwLqGmQGa/gJt9NitNZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50058413"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="50058413"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 07:30:02 -0700
X-CSE-ConnectionGUID: 9uS6Odh7RiC8j0jUi0URvg==
X-CSE-MsgGUID: A8zmKyRNQxCyd5amzY7y3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="163887682"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.61])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 07:30:00 -0700
Date: Thu, 22 May 2025 16:29:58 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Simplify compute preemption tests
Message-ID: <ql4lij6wy24upjj4hg7uyuklxhrnjztfu5jf5ky3gjuhjerrcl@ctnqmffyj7qq>
References: <20250522075515.168920-1-zbigniew.kempczynski@intel.com>
 <174791557518.13677.16175413216795375210@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174791557518.13677.16175413216795375210@1538d3639d33>
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

On Thu, May 22, 2025 at 12:06:15PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Simplify compute preemption tests                               
>    URL:     https://patchwork.freedesktop.org/series/149374/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13168/index.html 
> 
>           CI Bug Log - changes from IGT_8373_full -> IGTPW_13168_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_13168_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_13168_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13168/index.html
> 
> Participating hosts (11 -> 10)
> 
>    Missing (1): shard-dg2-set2
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_13168_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_ctx_create@basic-files:
> 
>           * shard-dg1: PASS -> ABORT
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
> 
>           * shard-tglu: PASS -> INCOMPLETE
>      * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP
>      * igt@perf_pmu@rc6@runtime-pm-long-gt0:
> 
>           * shard-rkl: PASS -> SKIP

Unrelated to the series.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between IGT_8373_full and IGTPW_13168_full:
> 
>   New IGT tests (13)
> 
>      * igt@gem_ctx_create@dr1-dirt:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@gem_ctx_create@invalid-multi-wait-all-unsubmitted-signaled:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@gem_ctx_create@load:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@gem_ctx_create@multi-wait-available-unsubmitted-submitted-signaled:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@gem_ctx_create@syncobj-import:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@gem_ctx_create@system-suspend-modeset:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@gem_ctx_create@transfer-timeline-point:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@gem_ctx_create@type1:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@gem_ctx_create@y-tiled-ccs-to-linear:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@gem_ctx_create@y-tiled-ccs-to-yf-tiled:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@perf@gen12-oa-tlb-invalidate@1-vcs1:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [10.04] s
>      * igt@perf@oa-formats@1-vcs0:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.04] s
>      * igt@perf@polling@1-vecs0:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [10.02] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_13168_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@crc32:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6230)
>           * shard-tglu: NOTRUN -> SKIP (i915#6230)
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8411)
>           * shard-dg1: NOTRUN -> SKIP (i915#8411)
>           * shard-dg2-9: NOTRUN -> SKIP (i915#8411)
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11078)
>      * igt@gem_basic@multigpu-create-close:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_busy@semaphore:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3936)
>      * igt@gem_ccs@block-multicopy-inplace:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE (i915#13356) +1 other test
>             incomplete
>      * igt@gem_close_race@multigpu-basic-process:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#7697)
>           * shard-rkl: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_compute@compute-square:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#13665)
>      * igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6335)
>           * shard-mtlp: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_create@create-ext-set-pat:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8562)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#8562)
>      * igt@gem_ctx_persistence@heartbeat-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8555) +1 other test skip
>      * igt@gem_ctx_persistence@heartbeat-stop:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5882) +7 other tests skip
>      * igt@gem_ctx_sseu@invalid-args:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#280)
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#280)
>           * shard-rkl: NOTRUN -> SKIP (i915#280) +1 other test skip
>      * igt@gem_ctx_sseu@mmap-args:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@kms:
> 
>           * shard-tglu: NOTRUN -> DMESG-WARN (i915#13363)
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-dg1: PASS -> FAIL (i915#5784)
>      * igt@gem_exec_balancer@bonded-semaphore:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_balancer@parallel-balancer:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525) +1 other test skip
>      * igt@gem_exec_capture@capture@vecs0-lmem0:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#11965) +4 other tests fail
>      * igt@gem_exec_fence@submit:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3711)
>      * igt@gem_exec_flush@basic-batch-kernel-default-wb:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852)
>      * igt@gem_exec_flush@basic-uc-prw-default:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539)
>      * igt@gem_exec_params@rsvd2-dirt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5107)
>      * igt@gem_exec_reloc@basic-cpu-wc-noreloc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281)
>      * igt@gem_exec_reloc@basic-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +5 other tests skip
>      * igt@gem_exec_reloc@basic-write-gtt-noreloc:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3281) +6 other tests skip
>      * igt@gem_exec_reloc@basic-write-read:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +20 other tests skip
>      * igt@gem_exec_reloc@basic-write-wc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +5 other tests skip
>      * igt@gem_exec_schedule@preempt-queue:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4537 / i915#4812)
>      * igt@gem_exec_schedule@preempt-queue-contexts:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_fence_thrash@bo-write-verify-y:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_fenced_exec_thrash@2-spare-fences:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860) +1 other test skip
>      * igt@gem_fenced_exec_thrash@too-many-fences:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4860)
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_lmem_evict@dontneed-evict-race:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613 / i915#7582)
>      * igt@gem_lmem_swapping@heavy-random:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_lmem_swapping@parallel-random-verify:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +4 other tests skip
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * shard-dg1: NOTRUN -> TIMEOUT (i915#14044 / i915#5493) +1 other
>             test timeout
>      * igt@gem_lmem_swapping@verify:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@verify-ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_media_fill@media-fill:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8289)
>      * igt@gem_mmap@bad-size:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4083) +1 other test skip
>      * igt@gem_mmap_gtt@basic-copy:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4077) +6 other tests skip
>      * igt@gem_mmap_gtt@basic-short:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +3 other tests skip
>      * igt@gem_mmap_gtt@cpuset-basic-small-copy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +7 other tests skip
>      * igt@gem_mmap_gtt@cpuset-big-copy-odd:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +8 other tests skip
>      * igt@gem_mmap_gtt@medium-copy-odd:
> 
>           * shard-rkl: PASS -> DMESG-WARN (i915#12917 / i915#12964)
>      * igt@gem_mmap_wc@fault-concurrent:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +1 other test skip
>      * igt@gem_mmap_wc@write-cpu-read-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +1 other test skip
>      * igt@gem_partial_pwrite_pread@reads-uncached:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3282)
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +1 other test skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +10 other tests skip
>      * igt@gem_pxp@create-protected-buffer:
> 
>           * shard-rkl: PASS -> TIMEOUT (i915#12964)
>      * igt@gem_pxp@create-valid-protected-context:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_pxp@display-protected-crc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +4 other tests skip
>      * igt@gem_pxp@hw-rejects-pxp-buffer:
> 
>           * shard-rkl: NOTRUN -> TIMEOUT (i915#12917 / i915#12964) +5 other
>             tests timeout
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13398)
>      * igt@gem_pxp@regular-baseline-src-copy-readible:
> 
>           * shard-rkl: NOTRUN -> TIMEOUT (i915#12964)
>      * igt@gem_pxp@reject-modify-context-protection-off-2:
> 
>           * shard-rkl: PASS -> TIMEOUT (i915#12917 / i915#12964)
>      * igt@gem_readwrite@beyond-eob:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +3 other tests skip
>      * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +4 other tests
>             skip
>      * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428)
>      * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#5190 / i915#8428) +2 other
>             tests skip
>      * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_softpin@evict-snoop-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4885)
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3297 / i915#3323)
>      * igt@gem_userptr_blits@forbidden-operations:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282 / i915#3297)
>      * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>      * igt@gem_userptr_blits@map-fixed-invalidate-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@readonly-pwrite-unsync:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@relocations:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281 / i915#3297)
>           * shard-rkl: NOTRUN -> SKIP (i915#3281 / i915#3297)
>      * igt@gem_userptr_blits@unsync-overlap:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>           * shard-dg2: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@unsync-unmap-after-close:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3297) +5 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>      * igt@gem_workarounds@suspend-resume:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13356)
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +4 other tests skip
>      * igt@gen9_exec_parse@basic-rejected:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +2 other tests
>             skip
>      * igt@gen9_exec_parse@bb-chained:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +5 other tests skip
>      * igt@gen9_exec_parse@bb-secure:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856)
>      * igt@gen9_exec_parse@bb-start-out:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2527)
>      * igt@gen9_exec_parse@unaligned-access:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2856) +1 other test skip
>      * igt@gen9_exec_parse@unaligned-jump:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2527 / i915#2856)
>      * igt@i915_drm_fdinfo@busy-idle-check-all@ccs0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11527) +7 other tests skip
>      * igt@i915_drm_fdinfo@busy@vecs1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14073) +7 other tests skip
>      * igt@i915_drm_fdinfo@isolation@bcs0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#14073) +5 other tests skip
>      * igt@i915_drm_fdinfo@virtual-busy-hang:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#14118)
>      * igt@i915_drm_fdinfo@virtual-busy-idle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14118)
>      * igt@i915_pm_freq_api@freq-basic-api:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#8399)
>      * igt@i915_pm_freq_api@freq-reset-multiple:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8399) +1 other test skip
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
> 
>           * shard-dg1: PASS -> FAIL (i915#3591) +1 other test fail
>      * igt@i915_pm_rpm@system-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12797)
>           * shard-rkl: PASS -> SKIP (i915#13328)
>      * igt@i915_pm_rpm@system-suspend-execbuf:
> 
>           * shard-glk: PASS -> INCOMPLETE (i915#12797)
>      * igt@i915_pm_rps@basic-api:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11681 / i915#6621)
>      * igt@i915_pm_rps@min-max-config-idle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11681 / i915#6621)
>      * igt@i915_pm_rps@waitboost:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#8346)
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4387)
>      * igt@i915_power@sanity:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7984)
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6245)
>      * igt@i915_query@query-topology-coherent-slice-mask:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6188)
>      * igt@i915_selftest@live:
> 
>           * shard-rkl: NOTRUN -> DMESG-FAIL (i915#12964 / i915#13550)
>      * igt@i915_selftest@live@gt_pm:
> 
>           * shard-rkl: NOTRUN -> DMESG-FAIL (i915#13550)
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#4391 / i915#4423)
>      * igt@i915_suspend@debugfs-reader:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#4817)
>      * igt@intel_hwmon@hwmon-read:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7707)
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7707) +1 other test skip
>      * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +2 other tests skip
>      * igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4215 / i915#5190)
>      * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-b-hdmi-a-2-4-mc-ccs:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#8709) +7 other tests skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-a-edp-1-4-mc-ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8709) +7 other tests skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-a-hdmi-a-2-y-rc-ccs-cc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8709) +3 other tests skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-hdmi-a-1-y-rc-ccs-cc:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#8709) +3 other tests skip
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1769 / i915#3555)
>           * shard-tglu: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +12 other tests skip
>      * igt@kms_big_fb@4-tiled-addfb-size-overflow:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5286) +1 other test skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +3 other tests
>             skip
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +3 other tests skip
>      * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3638)
>      * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
> 
>           * shard-mtlp: NOTRUN -> SKIP +6 other tests skip
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +11 other tests
>             skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3638) +3 other tests skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4538 / i915#5190) +4 other
>             tests skip
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-tglu: NOTRUN -> SKIP +91 other tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6095) +29 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12313) +2 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +144 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +99 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#12313) +1 other test skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#6095) +77 other
>             tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12313) +1 other test skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +169 other
>             tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12805)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-dp-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6095) +13 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
> 
>           * shard-tglu: PASS -> ABORT (i915#12817) +1 other test abort
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#6095) +4 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12313) +3 other tests skip
>      * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>             +1 other test skip
>      * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +29 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> 
>           * shard-snb: NOTRUN -> SKIP +21 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +62 other tests skip
>      * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#10307 / i915#6095) +24 other
>             tests skip
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3742) +1 other test skip
>      * igt@kms_chamelium_color@degamma:
> 
>           * shard-dg2: NOTRUN -> SKIP +5 other tests skip
>      * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#7828) +17 other
>             tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#11151 / i915#7828) +1 other test
>             skip
>      * igt@kms_chamelium_frames@dp-crc-fast:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11151 / i915#7828) +9 other tests
>             skip
>      * igt@kms_chamelium_frames@dp-frame-dump:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11151 / i915#7828) +3 other
>             tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#11151 / i915#7828) +2 other
>             tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11151 / i915#7828) +1 other
>             test skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11151 / i915#7828) +11 other
>             tests skip
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3299)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3116 / i915#3299)
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3116)
>      * igt@kms_content_protection@legacy:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#7118 / i915#9424)
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9424)
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9424) +1 other test skip
>      * igt@kms_content_protection@type1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7118 / i915#9424) +3 other tests
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#7116 / i915#9424)
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118 /
>             i915#9424)
>      * igt@kms_cursor_crc@cursor-offscreen-256x85:
> 
>           * shard-rkl: PASS -> DMESG-WARN (i915#12964) +16 other tests
>             dmesg-warn
>      * igt@kms_cursor_crc@cursor-offscreen-32x10:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3555) +1 other test skip
>      * igt@kms_cursor_crc@cursor-random-128x42:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814)
>      * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#13566) +2 other tests fail
>      * igt@kms_cursor_crc@cursor-random-32x32:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13049) +2 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#13049) +4 other tests skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +14 other tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13049) +1 other test skip
>      * igt@kms_cursor_crc@cursor-sliding-128x42:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#13566) +3 other tests fail
>      * igt@kms_cursor_crc@cursor-sliding-32x10:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +3 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-32x32:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814) +1 other test
>             skip
>      * igt@kms_cursor_crc@cursor-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12358 / i915#14152 /
>             i915#7882)
>      * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12358 / i915#14152)
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9809) +2 other tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13046 / i915#5354) +4 other tests
>             skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13046 / i915#5354) +2 other
>             tests skip
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> 
>           * shard-rkl: PASS -> FAIL (i915#2346)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213) +1 other test
>             skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4103) +1 other test skip
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#1769 / i915#3555 / i915#3804)
>           * shard-dg2: PASS -> SKIP (i915#3555)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_dp_aux_dev:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1257)
>      * igt@kms_dp_link_training@non-uhbr-sst:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13749)
>      * igt@kms_dp_link_training@uhbr-mst:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13748)
>           * shard-rkl: NOTRUN -> SKIP (i915#13748)
>      * igt@kms_dp_link_training@uhbr-sst:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13748)
>      * igt@kms_dp_linktrain_fallback@dsc-fallback:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13707)
>      * igt@kms_draw_crc@draw-method-mmap-wc:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#8812)
>      * igt@kms_dsc@dsc-basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#3840) +1 other test
>             skip
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#3840)
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3555 / i915#3840)
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840) +2 other tests
>             skip
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3469)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4854)
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-snb: PASS -> SKIP
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@psr2:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#658)
>           * shard-dg2-9: NOTRUN -> SKIP (i915#658)
>           * shard-rkl: NOTRUN -> SKIP (i915#658)
>      * igt@kms_flip@2x-blocking-wf_vblank:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9934) +7 other tests skip
>      * igt@kms_flip@2x-busy-flip:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637 / i915#9934)
>      * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#9934) +6 other tests
>             skip
>      * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:
> 
>           * shard-snb: PASS -> FAIL (i915#11832 / i915#13734) +1 other test
>             fail
>      * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9934)
>      * igt@kms_flip@2x-flip-vs-fences-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8381)
>      * igt@kms_flip@2x-flip-vs-panning:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9934) +1 other test skip
>      * igt@kms_flip@2x-flip-vs-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12745 / i915#4839)
>      * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#4839)
>      * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
> 
>           * shard-snb: PASS -> TIMEOUT (i915#14033) +1 other test timeout
>      * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3637 / i915#9934)
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9934) +19 other tests skip
>      * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +3 other tests skip
>      * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
> 
>           * shard-tglu: PASS -> FAIL (i915#13734) +1 other test fail
>      * igt@kms_flip@flip-vs-fences:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8381)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2587 / i915#2672) +2 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672 / i915#3555 / i915#5190) +4
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +6 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2672 / i915#3555) +2 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2672) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672 / i915#3555) +7 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672) +7 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2672 / i915#3555 / i915#5190)
>      * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
> 
>           * shard-rkl: NOTRUN -> DMESG-WARN (i915#12964) +10 other tests
>             dmesg-warn
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +32 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#5354) +10 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5439)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +12 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +48 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3458) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#8708) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +34 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +65 other tests skip
>           * shard-dg1: NOTRUN -> SKIP +11 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5439)
>           * shard-tglu: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +1 other test skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +1 other test skip
>      * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +23 other tests skip
>      * igt@kms_hdr@bpc-switch:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@bpc-switch-suspend:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12713)
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-dg2: PASS -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228) +2 other tests
>             skip
>      * igt@kms_joiner@basic-force-ultra-joiner:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10656)
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12339)
>      * igt@kms_joiner@invalid-modeset-big-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#10656)
>      * igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12388)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12388)
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6301)
>           * shard-rkl: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_plane_lowres@tiling-y:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8821)
>      * igt@kms_plane_multiple@2x-tiling-y:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#14259)
>           * shard-dg2: NOTRUN -> SKIP (i915#14259)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#12247) +4 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12247) +21 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12247 / i915#9423)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12247) +4 other tests skip
>      * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12247) +11 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12247 / i915#6953)
>           * shard-tglu: NOTRUN -> SKIP (i915#12247 / i915#6953) +1 other test
>             skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12247 / i915#3555)
>           * shard-dg2: NOTRUN -> SKIP (i915#12247 / i915#3555 / i915#9423)
>           * shard-rkl: NOTRUN -> SKIP (i915#12247 / i915#3555)
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12247) +7 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12247 / i915#6953)
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12247) +5 other tests skip
>      * igt@kms_pm_backlight@fade:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354)
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3828)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#9295)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9340)
>      * igt@kms_pm_lpsp@screens-disabled:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#8430)
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9519) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-dg2: PASS -> SKIP (i915#9519) +2 other tests skip
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_prime@basic-crc-hybrid:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#6524 / i915#6805)
>           * shard-tglu: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_prime@basic-modeset-hybrid:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11520) +2 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12316) +1 other test skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9808)
>      * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11520) +17 other tests skip
>      * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11520) +6 other tests skip
>      * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11520) +7 other tests skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9683)
>           * shard-tglu: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9683)
>           * shard-rkl: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-pr-primary-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +24 other tests
>             skip
>      * igt@kms_psr@fbc-psr-primary-mmap-cpu@edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +5 other tests skip
>      * igt@kms_psr@fbc-psr2-no-drrs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +21 other tests skip
>      * igt@kms_psr@pr-cursor-plane-onoff:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#1072 / i915#9732) +9 other
>             tests skip
>      * igt@kms_psr@pr-sprite-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +39 other tests
>             skip
>      * igt@kms_psr@psr-sprite-mmap-cpu:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +10 other tests
>             skip
>      * igt@kms_psr@psr-sprite-plane-onoff:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9732) +7 other tests skip
>      * igt@kms_psr@psr2-sprite-plane-onoff:
> 
>           * shard-glk: NOTRUN -> SKIP +167 other tests skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5289) +1 other test skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12755 / i915#5190)
>      * igt@kms_rotation_crc@sprite-rotation-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12755)
>      * igt@kms_scaling_modes@scaling-mode-full-aspect:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +8 other tests skip
>      * igt@kms_selftest@drm_framebuffer:
> 
>           * shard-rkl: NOTRUN -> ABORT (i915#13179) +1 other test abort
>      * igt@kms_setmode@clone-exclusive-crtc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_setmode@invalid-clone-single-crtc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8809)
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8623)
>           * shard-tglu: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_vrr@flip-basic-fastset:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9906)
>           * shard-dg1: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_vrr@flip-suspend:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8808)
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-dg2: PASS -> SKIP (i915#3555 / i915#9906)
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#9906)
>      * igt@kms_vrr@seamless-rr-switch-drrs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2437)
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2437 / i915#9412)
>      * igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2436)
>      * igt@perf@mi-rpc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2434)
>      * igt@perf@unprivileged-single-ctx-counters:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2433)
>      * igt@perf_pmu@busy-accuracy-98:
> 
>           * shard-rkl: PASS -> FAIL (i915#4349) +1 other test fail
>      * igt@perf_pmu@busy-double-start@vecs1:
> 
>           * shard-dg2-9: NOTRUN -> FAIL (i915#4349) +4 other tests fail
>      * igt@perf_pmu@busy-idle@vcs1:
> 
>           * shard-mtlp: PASS -> FAIL (i915#4349) +11 other tests fail
>      * igt@perf_pmu@event-wait@rcs0:
> 
>           * shard-dg2-9: NOTRUN -> SKIP +4 other tests skip
>      * igt@perf_pmu@frequency@gt0:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#12549 / i915#6806) +1 other test
>             fail
>           * shard-dg1: NOTRUN -> FAIL (i915#12549 / i915#6806) +1 other test
>             fail
>      * igt@perf_pmu@rc6-all-gts:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8516)
>           * shard-rkl: NOTRUN -> SKIP (i915#8516)
>      * igt@prime_vgem@basic-write:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3291 / i915#3708)
>      * igt@prime_vgem@fence-flip-hang:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3708)
>      * igt@prime_vgem@fence-read-hang:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3708) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3708)
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3708)
>      * igt@sriov_basic@bind-unbind-vf@vf-4:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#12910) +9 other tests fail
>      * igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9917)
>           * shard-rkl: NOTRUN -> SKIP (i915#9917) +1 other test skip
>      * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-5:
> 
>           * shard-tglu-1: NOTRUN -> FAIL (i915#12910) +9 other tests fail
>      * igt@sriov_basic@enable-vfs-bind-unbind-each:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9917)
>      * igt@tools_test@sysfs_l3_parity:
> 
>           * shard-rkl: NOTRUN -> SKIP +38 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4818)
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4818)
> 
>     Possible fixes
> 
>      * igt@gem_eio@in-flight-suspend:
> 
>           * shard-rkl: INCOMPLETE (i915#13390) -> PASS
>      * igt@gem_eio@kms:
> 
>           * shard-dg1: FAIL (i915#5784) -> PASS
>      * igt@gem_exec_schedule@wide@ccs0:
> 
>           * shard-mtlp: INCOMPLETE -> PASS +1 other test pass
>      * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>           * shard-rkl: TIMEOUT (i915#12964) -> PASS
>      * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
> 
>           * shard-rkl: TIMEOUT (i915#12917 / i915#12964) -> PASS
>      * igt@i915_suspend@fence-restore-tiled2untiled:
> 
>           * shard-glk: INCOMPLETE (i915#4817) -> PASS
>      * igt@i915_suspend@forcewake:
> 
>           * shard-snb: INCOMPLETE (i915#4817) -> PASS
>      * igt@kms_async_flips@alternate-sync-async-flip:
> 
>           * shard-tglu: FAIL (i915#10991) -> PASS +1 other test pass
>           * shard-mtlp: FAIL (i915#10991) -> PASS +1 other test pass
>      * igt@kms_atomic_interruptible@legacy-dpms:
> 
>           * shard-rkl: DMESG-WARN (i915#12964) -> PASS +8 other tests pass
>      * igt@kms_atomic_transition@plane-toggle-modeset-transition:
> 
>           * shard-dg2: FAIL (i915#5956) -> PASS
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-mtlp: FAIL (i915#5138) -> PASS +1 other test pass
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-dg2: ABORT (i915#8213) -> PASS
>      * igt@kms_cursor_crc@cursor-onscreen-64x21:
> 
>           * shard-rkl: FAIL (i915#13566) -> PASS
>      * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: FAIL (i915#13566) -> PASS +1 other test pass
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
> 
>           * shard-snb: SKIP -> PASS +1 other test pass
>      * igt@kms_dp_link_training@non-uhbr-sst:
> 
>           * shard-dg2: SKIP (i915#13749) -> PASS
>      * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
> 
>           * shard-snb: FAIL (i915#11832 / i915#13734) -> PASS +1 other test
>             pass
>      * igt@kms_hdr@static-swap:
> 
>           * shard-dg2: SKIP (i915#3555 / i915#8228) -> PASS
>      * igt@kms_joiner@basic-force-big-joiner:
> 
>           * shard-dg2: SKIP (i915#12388) -> PASS
>      * igt@kms_pm_rpm@i2c:
> 
>           * shard-dg1: DMESG-WARN (i915#4423) -> PASS +1 other test pass
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-dg2: SKIP (i915#9519) -> PASS +1 other test pass
>      * igt@perf@gen12-group-concurrent-oa-buffer-read:
> 
>           * shard-tglu: FAIL (i915#10538) -> PASS
> 
>     Warnings
> 
>      * igt@kms_async_flips@async-flip-suspend-resume:
> 
>           * shard-rkl: INCOMPLETE (i915#12761) -> DMESG-WARN (i915#12964)
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>           * shard-dg1: SKIP (i915#3638 / i915#4423) -> SKIP (i915#3638)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#6095) -> SKIP (i915#14098 / i915#6095) +3
>             other tests skip
>      * igt@kms_content_protection@legacy:
> 
>           * shard-dg1: SKIP (i915#7116 / i915#9424) -> SKIP (i915#4423 /
>             i915#7116 / i915#9424)
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-dg1: SKIP (i915#9433) -> SKIP (i915#9424)
>      * igt@kms_content_protection@type1:
> 
>           * shard-dg2: SKIP (i915#7118 / i915#9424) -> SKIP (i915#7118 /
>             i915#7162 / i915#9424)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#3458) -> SKIP (i915#3458)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
> 
>           * shard-dg2: SKIP (i915#3458) -> SKIP (i915#10433 / i915#3458) +3
>             other tests skip
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-rkl: SKIP (i915#3828) -> SKIP (i915#9340)
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8373 -> IGTPW_13168
> 
>    CI-20190529: 20190529
>    CI_DRM_16576: 3695d568b260d85e65f9331ca1180a9dd2b5560b @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_13168: 13168
>    IGT_8373: 8373
