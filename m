Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DAFE8FDB1
	for <igt-dev@archiver.kernel.org>; Mon, 29 Dec 2025 07:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33E610F2A3;
	Mon, 29 Dec 2025 07:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+6x8ocr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF1010F2A3
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Dec 2025 07:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766995003; x=1798531003;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=Xjp7eCk0Ed9APocJ7QARkE6FMlabcRfochwwRsfhNLk=;
 b=T+6x8ocriAnn2bcNlxyRSq2FD4irdFufErVJDHN/2I+A/oN+HzCtYwJl
 LbNE5tnXs9YTRdKUKwj9IU9Bo3dgkPWz1HYhYr6ZUnjO4i/tU0igSCE8A
 yzxccpGaJfANncvoItdsMCq5hUTdFjvh09mg5vFutHKOxtdmbsnmG9XuJ
 t9DrJFNJ83U31cuAyWbdcLAa4LZR43Jd1ov5I3uBvierFzbN/6zpNPRVx
 HgeAfn1CWjgEsb3/A+BTb+kJMSjbI2jefiOHYhr3zM88BDTR9i4MfsXNi
 qMPBINkAL5dZTFaDx/8CxOJ/t+lPdRmIl0IP7x52g1U7LWWX1dVN1YuxK w==;
X-CSE-ConnectionGUID: ibevrFnJTxqFf9M3tGsrkg==
X-CSE-MsgGUID: NR8qOCa9Ss6oBci2NRpsXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="80057548"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; d="scan'208";a="80057548"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2025 23:56:42 -0800
X-CSE-ConnectionGUID: ZKOfxQIvQeCEJum3rdaBRA==
X-CSE-MsgGUID: GJdwSq4HTGOYuRUfaZ8oCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; d="scan'208";a="231526971"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.9])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2025 23:56:40 -0800
Date: Mon, 29 Dec 2025 08:56:37 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_fo?=
 =?utf-8?Q?r?= lib/intel_compute: Unblock NVL-S compute and preemption tests
Message-ID: <begnzp7eyiytbd4godf7hgb7jfksiths7d5uex3x7qw5axc5t4@wqg5qf7orzbr>
References: <20251222133724.221995-2-zbigniew.kempczynski@intel.com>
 <176657882241.116263.16834000204645934827@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176657882241.116263.16834000204645934827@a3b018990fe9>
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

On Wed, Dec 24, 2025 at 12:20:22PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/intel_compute: Unblock NVL-S compute and preemption tests   
>    URL:     https://patchwork.freedesktop.org/series/159384/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14266/index.html 
> 
>         CI Bug Log - changes from CI_DRM_17732_full -> IGTPW_14266_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_14266_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_14266_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14266/index.html
> 
> Participating hosts (9 -> 9)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_14266_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_create@create-clear:
> 
>           * shard-rkl: PASS -> DMESG-FAIL +1 other test dmesg-fail
>      * igt@kms_plane_lowres@tiling-x:
> 
>           * shard-dg2: PASS -> FAIL
>      * igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> FAIL

Patch is unrelated to above regressions.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between CI_DRM_17732_full and
>    IGTPW_14266_full:
> 
>   New IGT tests (16)
> 
>      * igt@gem_ccs@block-multicopy-compressed@linear-compressed-compfmt0-lmem0-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.10] s
>      * igt@gem_ccs@block-multicopy-compressed@linear-compressed-compfmt0-smem-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.04] s
>      * igt@gem_ccs@block-multicopy-compressed@tile4-compressed-compfmt0-lmem0-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.10] s
>      * igt@gem_ccs@block-multicopy-compressed@tile4-compressed-compfmt0-smem-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.02] s
>      * igt@gem_ccs@block-multicopy-compressed@tile64-compressed-compfmt0-lmem0-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.10] s
>      * igt@gem_ccs@block-multicopy-compressed@tile64-compressed-compfmt0-smem-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.02] s
>      * igt@gem_ccs@block-multicopy-compressed@xmajor-compressed-compfmt0-lmem0-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.09] s
>      * igt@gem_ccs@block-multicopy-compressed@xmajor-compressed-compfmt0-smem-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.02] s
>      * igt@gem_ccs@block-multicopy-inplace@linear-compressed-compfmt0-lmem0-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.11] s
>      * igt@gem_ccs@block-multicopy-inplace@linear-compressed-compfmt0-smem-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.04] s
>      * igt@gem_ccs@block-multicopy-inplace@tile4-compressed-compfmt0-lmem0-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.12] s
>      * igt@gem_ccs@block-multicopy-inplace@tile4-compressed-compfmt0-smem-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.02] s
>      * igt@gem_ccs@block-multicopy-inplace@tile64-compressed-compfmt0-lmem0-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.11] s
>      * igt@gem_ccs@block-multicopy-inplace@tile64-compressed-compfmt0-smem-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.02] s
>      * igt@gem_ccs@block-multicopy-inplace@xmajor-compressed-compfmt0-lmem0-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.11] s
>      * igt@gem_ccs@block-multicopy-inplace@xmajor-compressed-compfmt0-smem-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.01] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_14266_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@blit-reloc-keep-cache:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8411)
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8411)
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11078)
>           * shard-rkl: NOTRUN -> SKIP (i915#11078)
>      * igt@gem_busy@semaphore:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3936)
>      * igt@gem_ccs@block-multicopy-compressed:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9323) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-lmem0-lmem0:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE (i915#12392 / i915#13356)
>      * igt@gem_close_race@multigpu-basic-threads:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6335)
>           * shard-mtlp: NOTRUN -> SKIP (i915#6335)
>           * shard-rkl: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_ctx_isolation@preservation-s3:
> 
>           * shard-rkl: NOTRUN -> INCOMPLETE (i915#13356) +1 other test
>             incomplete
>      * igt@gem_ctx_persistence@heartbeat-close:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8555) +1 other test skip
>      * igt@gem_ctx_persistence@heartbeat-hostile:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8555)
>           * shard-mtlp: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@smoketest:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#1099)
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#280)
>           * shard-dg1: NOTRUN -> SKIP (i915#280) +1 other test skip
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#280)
>           * shard-rkl: NOTRUN -> SKIP (i915#280)
>           * shard-tglu: NOTRUN -> SKIP (i915#280)
>           * shard-mtlp: NOTRUN -> SKIP (i915#280)
>      * igt@gem_exec_balancer@invalid-bonds:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4036)
>      * igt@gem_exec_balancer@parallel-balancer:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_balancer@parallel-bb-first:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4525) +1 other test skip
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_capture@capture-invisible:
> 
>           * shard-glk10: NOTRUN -> SKIP (i915#6334) +1 other test skip
>      * igt@gem_exec_capture@capture-invisible@smem0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6334) +1 other test skip
>      * igt@gem_exec_flush@basic-wb-ro-before-default:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852) +1 other test
>             skip
>      * igt@gem_exec_flush@basic-wb-ro-default:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852)
>      * igt@gem_exec_params@secure-non-root:
> 
>           * shard-dg2: NOTRUN -> SKIP +2 other tests skip
>      * igt@gem_exec_reloc@basic-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +3 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3281)
>      * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +2 other tests skip
>      * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +5 other tests skip
>      * igt@gem_exec_reloc@basic-write-cpu-noreloc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +4 other tests skip
>      * igt@gem_exec_schedule@deep@rcs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4537)
>      * igt@gem_exec_suspend@basic-s3@smem:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13196 / i915#13356) +1
>             other test incomplete
>      * igt@gem_fence_thrash@bo-write-verify-y:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#2190)
>      * igt@gem_lmem_evict@dontneed-evict-race:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613 / i915#7582)
>      * igt@gem_lmem_swapping@heavy-verify-random:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_lmem_swapping@massive-random:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_lmem_swapping@random-engines:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +4 other tests skip
>      * igt@gem_media_vme:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#284)
>           * shard-tglu: NOTRUN -> SKIP (i915#284)
>      * igt@gem_mmap@short-mmap:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_mmap_wc@read:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      * igt@gem_mmap_wc@write-read-distinct:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      * igt@gem_partial_pwrite_pread@reads-uncached:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3282)
>           * shard-dg1: NOTRUN -> SKIP (i915#3282)
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +1 other test skip
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-glk10: NOTRUN -> WARN (i915#14702 / i915#2658)
>      * igt@gem_pxp@create-valid-protected-context:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +2 other tests
>             skip
>      * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +5 other tests skip
>      * igt@gem_set_tiling_vs_pwrite:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3282) +1 other test
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_softpin@evict-snoop:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4885)
>           * shard-mtlp: NOTRUN -> SKIP (i915#4885)
>           * shard-dg2: NOTRUN -> SKIP (i915#4885)
>      * igt@gem_tiled_partial_pwrite_pread@writes:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +4 other tests skip
>      * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +5 other tests skip
>      * igt@gem_tiling_max_stride:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +4 other tests skip
>      * igt@gem_userptr_blits@access-control:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3297 / i915#3323)
>      * igt@gem_userptr_blits@dmabuf-unsync:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3297) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880)
>           * shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@unsync-unmap-after-close:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_workarounds@suspend-resume-context:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13356)
>      * igt@gen7_exec_parse@chained-batch:
> 
>           * shard-rkl: NOTRUN -> SKIP +15 other tests skip
>      * igt@gen9_exec_parse@batch-invalid-length:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#2527) +1 other test skip
>      * igt@gen9_exec_parse@batch-without-end:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856) +2 other tests skip
>      * igt@gen9_exec_parse@bb-secure:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +2 other tests
>             skip
>      * igt@gen9_exec_parse@valid-registers:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +1 other test skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2527 / i915#2856) +2 other
>             tests skip
>      * igt@i915_drm_fdinfo@busy-hang@ccs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#14073) +6 other tests skip
>      * igt@i915_drm_fdinfo@busy-hang@rcs0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14073) +7 other tests skip
>      * igt@i915_drm_fdinfo@busy-hang@vcs0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#14073) +11 other tests skip
>      * igt@i915_drm_fdinfo@virtual-busy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#14118) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#14118)
>      * igt@i915_drm_fdinfo@virtual-busy-hang-all:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14118) +1 other test skip
>      * igt@i915_module_load@load:
> 
>           * shard-snb: (PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS) -> (SKIP, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS)
>      * igt@i915_module_load@resize-bar:
> 
>           * shard-dg2: NOTRUN -> DMESG-WARN (i915#14545)
>           * shard-rkl: NOTRUN -> SKIP (i915#6412)
>           * shard-dg1: NOTRUN -> SKIP (i915#7178)
>           * shard-tglu: NOTRUN -> SKIP (i915#6412)
>           * shard-mtlp: NOTRUN -> SKIP (i915#6412)
>      * igt@i915_pm_freq_mult@media-freq@gt0:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6590) +1 other test skip
>      * igt@i915_pm_rc6_residency@rc6-accuracy:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#12964) +1 other test fail
>      * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> 
>           * shard-mtlp: NOTRUN -> SKIP +12 other tests skip
>      * igt@i915_pm_rpm@system-suspend:
> 
>           * shard-glk10: PASS -> INCOMPLETE (i915#13356)
>      * igt@i915_pm_rps@min-max-config-loaded:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11681 / i915#6621)
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6245)
>           * shard-tglu: NOTRUN -> SKIP (i915#6245)
>           * shard-rkl: NOTRUN -> SKIP (i915#6245)
>      * igt@i915_selftest@live@workarounds:
> 
>           * shard-mtlp: NOTRUN -> DMESG-FAIL (i915#12061) +1 other test
>             dmesg-fail
>      * igt@i915_suspend@fence-restore-untiled:
> 
>           * shard-glk: PASS -> INCOMPLETE (i915#4817)
>      * igt@i915_suspend@forcewake:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#4817) +1 other test
>             incomplete
>      * igt@i915_suspend@sysfs-reader:
> 
>           * shard-rkl: PASS -> ABORT (i915#15140)
>      * igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4215)
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +3 other tests
>             skip
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +5 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-mtlp: PASS -> FAIL (i915#5138)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5286) +5 other tests skip
>      * igt@kms_big_fb@linear-16bpp-rotate-270:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3638) +1 other test skip
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
> 
>           * shard-dg1: NOTRUN -> DMESG-WARN (i915#4423)
>      * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638)
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +2 other tests
>             skip
>      * igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190)
>           * shard-mtlp: NOTRUN -> SKIP (i915#6187)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544) +5 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4538) +2 other tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#14544 / i915#6095)
>             +6 other tests skip
>      * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-dp-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +118 other
>             tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6095) +49 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +34 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12313) +1 other test skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#6095) +36 other
>             tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +192 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +57 other tests skip
>      * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>             +3 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +74 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6095) +45 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
> 
>           * shard-glk10: NOTRUN -> INCOMPLETE (i915#12796) +1 other test
>             incomplete
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#12796)
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> INCOMPLETE (i915#12796)
>      * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#6095) +9 other tests
>             skip
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3742) +1 other test skip
>      * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13783) +3 other tests skip
>      * igt@kms_chamelium_audio@dp-audio-edid:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11151 / i915#7828) +5 other tests
>             skip
>      * igt@kms_chamelium_color@ctm-0-50:
> 
>           * shard-dg1: NOTRUN -> SKIP +25 other tests skip
>      * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11151 / i915#7828) +6 other
>             tests skip
>      * igt@kms_chamelium_edid@hdmi-mode-timings:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#11151 / i915#7828) +5 other
>             tests skip
>      * igt@kms_chamelium_frames@hdmi-crc-multiple:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#14544 / i915#7828)
>      * igt@kms_chamelium_hpd@dp-hpd:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11151 / i915#7828) +5 other
>             tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#7828) +4 other tests
>             skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-fast:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11151 / i915#7828) +5 other tests
>             skip
>      * igt@kms_color@deep-color:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12655 / i915#3555)
>           * shard-rkl: NOTRUN -> SKIP (i915#12655 / i915#3555)
>           * shard-dg1: NOTRUN -> SKIP (i915#12655 / i915#3555)
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#9979)
>      * igt@kms_content_protection@atomic:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118 /
>             i915#9424)
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#6944 / i915#7118 /
>             i915#9424)
>      * igt@kms_content_protection@content-type-change:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6944 / i915#9424)
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3299)
>           * shard-rkl: NOTRUN -> SKIP (i915#3116)
>           * shard-dg1: NOTRUN -> SKIP (i915#3299)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3299)
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3116 / i915#3299) +1 other
>             test skip
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#9424) +1 other test
>             skip
>      * igt@kms_content_protection@suspend-resume:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6944)
>           * shard-dg1: NOTRUN -> SKIP (i915#6944)
>           * shard-tglu: NOTRUN -> SKIP (i915#6944)
>           * shard-mtlp: NOTRUN -> SKIP (i915#6944)
>      * igt@kms_content_protection@suspend-resume@pipe-a-dp-3:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#7173) +2 other tests fail
>      * igt@kms_content_protection@type1:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#9424)
>      * igt@kms_cursor_crc@cursor-onscreen-256x85:
> 
>           * shard-tglu: PASS -> FAIL (i915#13566) +1 other test fail
>           * shard-rkl: PASS -> FAIL (i915#13566)
>      * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#13566)
>      * igt@kms_cursor_crc@cursor-onscreen-64x21:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814)
>      * igt@kms_cursor_crc@cursor-random-32x10:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814)
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3555)
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#13049)
>           * shard-dg2: NOTRUN -> SKIP (i915#13049)
>           * shard-dg1: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13049) +1 other test skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4213) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213)
>           * shard-rkl: NOTRUN -> SKIP (i915#4103) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4103 / i915#4213)
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13046 / i915#5354) +1 other test
>             skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9809) +2 other tests skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4103) +1 other test skip
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#1769 / i915#3555 / i915#3804)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_dp_aux_dev:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#1257)
>      * igt@kms_dp_link_training@non-uhbr-sst:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13749)
>      * igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13707)
>      * igt@kms_dp_linktrain_fallback@dsc-fallback:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13707)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13707)
>           * shard-dg1: NOTRUN -> SKIP (i915#13707)
>           * shard-mtlp: NOTRUN -> SKIP (i915#13707)
>      * igt@kms_draw_crc@draw-method-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8812)
>           * shard-dg1: NOTRUN -> SKIP (i915#8812)
>      * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3469)
>           * shard-rkl: NOTRUN -> SKIP (i915#3955)
>           * shard-dg1: NOTRUN -> SKIP (i915#3469)
>           * shard-tglu: NOTRUN -> SKIP (i915#3469)
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9337)
>      * igt@kms_flip@2x-flip-vs-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9934) +8 other tests skip
>      * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9934) +3 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +4 other tests skip
>      * igt@kms_flip@2x-flip-vs-rmfb:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637 / i915#9934) +5 other tests
>             skip
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#9934)
>      * igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#9934) +5 other tests
>             skip
>      * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3637 / i915#9934) +4 other
>             tests skip
>      * igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a1:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#10826) +1 other test fail
>      * igt@kms_flip@flip-vs-suspend:
> 
>           * shard-snb: PASS -> INCOMPLETE (i915#12314 / i915#12745 /
>             i915#4839)
>      * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
> 
>           * shard-snb: PASS -> INCOMPLETE (i915#12314 / i915#4839)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672) +2 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672) +3 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672 / i915#3555 / i915#8813) +2
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672 / i915#8813) +2 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672) +3 other tests skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2587 / i915#2672) +2 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672 / i915#3555 / i915#5190)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2672 / i915#3555) +3 other tests
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8810 / i915#8813) +4
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8810 / i915#8813)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2672 / i915#3555) +2 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672 / i915#3555) +3 other tests
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#2672 / i915#3555) +2 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#4423) +1 other test
>             dmesg-warn
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +10 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +8 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-rte:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +15 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:
> 
>           * shard-snb: PASS -> SKIP
>      * igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10055)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15104)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15102)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15102) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#15102)
>           * shard-dg1: NOTRUN -> SKIP (i915#15102) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15102 / i915#3458) +6 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15102) +21 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15102 / i915#3023)
>             +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +28 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5439)
>           * shard-dg1: NOTRUN -> SKIP (i915#5439)
>           * shard-tglu: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9766)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15102 / i915#3458) +5 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15102) +19 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#1825) +3 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +16 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +24 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-tglu: NOTRUN -> SKIP +50 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15102 / i915#3023) +13 other
>             tests skip
>      * igt@kms_hdr@bpc-switch-suspend:
> 
>           * shard-dg2: PASS -> SKIP (i915#3555 / i915#8228)
>           * shard-rkl: PASS -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1187 / i915#12713)
>      * igt@kms_hdr@static-swap:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228) +2 other tests
>             skip
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12713 / i915#3555 / i915#8228)
>             +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>      * igt@kms_joiner@basic-force-ultra-joiner:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15458)
>      * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15458)
>      * igt@kms_plane_alpha_blend@alpha-transparent-fb:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10647 / i915#12177)
>      * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10647) +1 other test fail
>      * igt@kms_plane_lowres@tiling-yf:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555)
>      * igt@kms_plane_multiple@2x-tiling-none:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13958)
>           * shard-dg1: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@2x-tiling-y:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13958)
>           * shard-tglu: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-dg2: PASS -> SKIP (i915#6953 / i915#9423)
>           * shard-rkl: PASS -> SKIP (i915#6953)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6953)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15329) +4 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15329) +7 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15329) +9 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15329 / i915#3555 / i915#6953)
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15329) +3 other tests skip
>      * igt@kms_pm_backlight@bad-brightness:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9812)
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#12343)
>      * igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#9685)
>           * shard-dg1: NOTRUN -> SKIP (i915#9685) +1 other test skip
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9685) +1 other test skip
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-rkl: PASS -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-dg1: PASS -> SKIP (i915#15073) +1 other test skip
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@package-g7:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15403)
>           * shard-mtlp: NOTRUN -> SKIP (i915#15403)
>           * shard-dg2: NOTRUN -> SKIP (i915#15403)
>           * shard-rkl: NOTRUN -> SKIP (i915#15403)
>           * shard-dg1: NOTRUN -> SKIP (i915#15403)
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11520)
>      * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11520) +2 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
> 
>           * shard-glk10: NOTRUN -> SKIP (i915#11520) +6 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11520) +5 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12316) +1 other test skip
>      * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#11520) +11 other tests skip
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4348)
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-pr-cursor-mmap-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#14544 / i915#9732) +3
>             other tests skip
>      * igt@kms_psr@fbc-pr-no-drrs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +16 other tests
>             skip
>      * igt@kms_psr@fbc-pr-sprite-blt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9732) +14 other tests skip
>      * igt@kms_psr@fbc-psr-primary-mmap-cpu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +7 other tests
>             skip
>      * igt@kms_psr@pr-no-drrs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +14 other tests skip
>      * igt@kms_psr@psr2-primary-mmap-cpu:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +9 other tests
>             skip
>      * igt@kms_psr@psr2-primary-render:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +18 other tests skip
>      * igt@kms_psr@psr2-sprite-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077 / i915#9688) +1 other test
>             skip
>      * igt@kms_psr@psr2-sprite-plane-onoff:
> 
>           * shard-glk: NOTRUN -> SKIP +258 other tests skip
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9685) +2 other tests skip
>      * igt@kms_rotation_crc@bad-tiling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12755)
>      * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5289)
>           * shard-tglu: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12755)
>      * igt@kms_scaling_modes@scaling-mode-full-aspect:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +5 other tests skip
>      * igt@kms_scaling_modes@scaling-mode-none:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>      * igt@kms_selftest@drm_framebuffer:
> 
>           * shard-glk: NOTRUN -> ABORT (i915#13179) +1 other test abort
>      * igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +1 other test skip
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10959)
>      * igt@kms_vrr@flip-basic-fastset:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_vrr@flipline:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15243 / i915#3555)
>      * igt@kms_vrr@seamless-rr-switch-drrs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9906)
>      * igt@perf_pmu@busy-accuracy-98:
> 
>           * shard-snb: NOTRUN -> SKIP +94 other tests skip
>      * igt@prime_vgem@basic-fence-flip:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3708) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP (i915#3708)
>      * igt@sriov_basic@bind-unbind-vf:
> 
>           * shard-glk10: NOTRUN -> SKIP +199 other tests skip
>      * igt@sriov_basic@enable-vfs-autoprobe-on:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9917)
>      * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#12910) +9 other tests fail
>      * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#12910) +8 other tests fail
> 
>     Possible fixes
> 
>      * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
> 
>           * shard-dg2: INCOMPLETE (i915#12392 / i915#13356) -> PASS
>      * igt@gem_lmem_swapping@verify:
> 
>           * shard-dg2: FAIL (i915#15452) -> PASS +1 other test pass
>      * igt@gem_pxp@create-protected-buffer:
> 
>           * shard-rkl: SKIP (i915#4270) -> PASS
>      * igt@i915_power@sanity:
> 
>           * shard-mtlp: SKIP (i915#7984) -> PASS
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-rkl: ABORT (i915#15131) -> PASS
>      * igt@i915_suspend@forcewake:
> 
>           * shard-rkl: INCOMPLETE (i915#4817) -> PASS
>      * igt@kms_cursor_crc@cursor-random-128x42:
> 
>           * shard-tglu: FAIL (i915#13566) -> PASS +1 other test pass
>      * igt@kms_cursor_crc@cursor-random-256x85:
> 
>           * shard-rkl: FAIL (i915#13566) -> PASS +2 other tests pass
>      * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
> 
>           * shard-snb: TIMEOUT (i915#14033) -> PASS +1 other test pass
>      * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:
> 
>           * shard-dg2: FAIL (i915#15389) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
> 
>           * shard-dg2: FAIL (i915#15389 / i915#6880) -> PASS
>      * igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1:
> 
>           * shard-mtlp: ABORT (i915#13562) -> PASS +1 other test pass
>      * igt@kms_pm_rpm@i2c:
> 
>           * shard-dg1: DMESG-WARN (i915#4423) -> PASS +2 other tests pass
>      * igt@kms_vblank@ts-continuation-dpms-suspend:
> 
>           * shard-rkl: INCOMPLETE (i915#12276) -> PASS
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-dg2: SKIP (i915#3555 / i915#9906) -> PASS
>      * igt@perf_pmu@busy-double-start@vecs0:
> 
>           * shard-dg1: FAIL (i915#4349) -> PASS +1 other test pass
> 
>     Warnings
> 
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8411) -> SKIP (i915#8411)
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555 / i915#9323) -> SKIP
>             (i915#3555 / i915#9323)
>      * igt@gem_ccs@ctrl-surf-copy:
> 
>           * shard-rkl: SKIP (i915#3555 / i915#9323) -> SKIP (i915#14544 /
>             i915#3555 / i915#9323)
>      * igt@gem_exec_balancer@parallel-keep-in-fence:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4525) -> SKIP (i915#4525)
>      * igt@gem_exec_capture@capture-invisible:
> 
>           * shard-rkl: SKIP (i915#6334) -> SKIP (i915#14544 / i915#6334) +1
>             other test skip
>      * igt@gem_exec_reloc@basic-gtt-read-noreloc:
> 
>           * shard-rkl: SKIP (i915#3281) -> SKIP (i915#14544 / i915#3281) +6
>             other tests skip
>      * igt@gem_exec_reloc@basic-wc-read-noreloc:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3281) -> SKIP (i915#3281) +9
>             other tests skip
>      * igt@gem_lmem_swapping@parallel-random:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4613) -> SKIP (i915#4613) +1
>             other test skip
>      * igt@gem_lmem_swapping@random-engines:
> 
>           * shard-rkl: SKIP (i915#4613) -> SKIP (i915#14544 / i915#4613) +1
>             other test skip
>      * igt@gem_partial_pwrite_pread@write-uncached:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3282) -> SKIP (i915#3282) +1
>             other test skip
>      * igt@gem_pwrite@basic-self:
> 
>           * shard-rkl: SKIP (i915#3282) -> SKIP (i915#14544 / i915#3282) +2
>             other tests skip
>      * igt@gem_pxp@hw-rejects-pxp-buffer:
> 
>           * shard-rkl: SKIP (i915#13717) -> SKIP (i915#13717 / i915#14544)
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3297 / i915#3323) -> SKIP
>             (i915#3297 / i915#3323)
>      * igt@gem_userptr_blits@forbidden-operations:
> 
>           * shard-rkl: SKIP (i915#3282 / i915#3297) -> SKIP (i915#14544 /
>             i915#3282 / i915#3297)
>      * igt@gem_userptr_blits@unsync-overlap:
> 
>           * shard-rkl: SKIP (i915#3297) -> SKIP (i915#14544 / i915#3297) +1
>             other test skip
>      * igt@gem_userptr_blits@unsync-unmap-cycles:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3297) -> SKIP (i915#3297) +1
>             other test skip
>      * igt@gen9_exec_parse@basic-rejected-ctx-param:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2527) -> SKIP (i915#2527)
>      * igt@gen9_exec_parse@bb-oversize:
> 
>           * shard-rkl: SKIP (i915#2527) -> SKIP (i915#14544 / i915#2527) +2
>             other tests skip
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-rkl: SKIP (i915#7707) -> SKIP (i915#14544 / i915#7707)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-rkl: SKIP (i915#1769 / i915#3555) -> SKIP (i915#14544 /
>             i915#1769 / i915#3555)
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
> 
>           * shard-dg1: SKIP (i915#4538 / i915#5286) -> SKIP (i915#4423 /
>             i915#4538 / i915#5286)
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#5286) -> SKIP (i915#5286) +2
>             other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-rkl: SKIP (i915#5286) -> SKIP (i915#14544 / i915#5286) +2
>             other tests skip
>      * igt@kms_big_fb@linear-64bpp-rotate-90:
> 
>           * shard-rkl: SKIP (i915#3638) -> SKIP (i915#14544 / i915#3638) +1
>             other test skip
>      * igt@kms_big_fb@linear-8bpp-rotate-90:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3638) -> SKIP (i915#3638)
>      * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4:
> 
>           * shard-dg1: SKIP (i915#4423 / i915#6095) -> SKIP (i915#6095) +2
>             other tests skip
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#14098 /
>             i915#14544 / i915#6095) +10 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>           * shard-rkl: SKIP (i915#12313 / i915#14544) -> SKIP (i915#12313)
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#6095) -> SKIP (i915#14544 / i915#6095) +6
>             other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6095) -> SKIP (i915#6095) +3
>             other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#14544 / i915#6095) -> SKIP
>             (i915#14098 / i915#6095) +6 other tests skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-rkl: SKIP (i915#3742) -> SKIP (i915#14544 / i915#3742)
>      * igt@kms_chamelium_frames@hdmi-crc-fast:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#14544 / i915#7828) -> SKIP
>             (i915#11151 / i915#7828) +2 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#7828) -> SKIP (i915#11151 /
>             i915#14544 / i915#7828) +5 other tests skip
>      * igt@kms_content_protection@legacy:
> 
>           * shard-dg2: FAIL (i915#7173) -> SKIP (i915#6944 / i915#7118 /
>             i915#9424)
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-dg2: SKIP (i915#6944 / i915#9424) -> FAIL (i915#7173)
>      * igt@kms_content_protection@lic-type-1:
> 
>           * shard-rkl: SKIP (i915#6944 / i915#9424) -> SKIP (i915#14544 /
>             i915#6944 / i915#9424)
>      * igt@kms_content_protection@type1:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6944 / i915#7118 / i915#9424)
>             -> SKIP (i915#6944 / i915#7118 / i915#9424) +1 other test skip
>      * igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>           * shard-rkl: SKIP (i915#13049) -> SKIP (i915#13049 / i915#14544)
>      * igt@kms_cursor_crc@cursor-onscreen-max-size:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555) -> SKIP (i915#3555) +3
>             other tests skip
>      * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
> 
>           * shard-rkl: SKIP -> SKIP (i915#14544) +8 other tests skip
>      * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP +8 other tests skip
>           * shard-dg1: SKIP -> SKIP (i915#4423) +1 other test skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-rkl: SKIP (i915#4103) -> SKIP (i915#14544 / i915#4103)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-rkl: SKIP (i915#3555 / i915#3804) -> SKIP (i915#14544 /
>             i915#3555 / i915#3804)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#3804) -> SKIP (i915#14544 / i915#3804)
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-dg1: SKIP (i915#1839) -> SKIP (i915#1839 / i915#4423)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-rkl: SKIP (i915#1839) -> SKIP (i915#14544 / i915#1839) +1
>             other test skip
>      * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9934) -> SKIP (i915#9934) +1
>             other test skip
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-rkl: SKIP (i915#9934) -> SKIP (i915#14544 / i915#9934) +5
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2672) -> SKIP (i915#2672) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2672 / i915#3555) -> SKIP
>             (i915#2672 / i915#3555) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
> 
>           * shard-rkl: SKIP (i915#2672 / i915#3555) -> SKIP (i915#14544 /
>             i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: SKIP (i915#2672) -> SKIP (i915#14544 / i915#2672)
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
> 
>           * shard-rkl: SKIP (i915#1825) -> SKIP (i915#14544 / i915#1825) +21
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:
> 
>           * shard-rkl: SKIP (i915#15102) -> SKIP (i915#14544 / i915#15102) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15102 / i915#3023) -> SKIP
>             (i915#15102 / i915#3023) +11 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
> 
>           * shard-rkl: SKIP (i915#15102 / i915#3023) -> SKIP (i915#14544 /
>             i915#15102 / i915#3023) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1825) -> SKIP (i915#1825) +20
>             other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15102) -> SKIP (i915#15102) +2
>             other tests skip
>      * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
> 
>           * shard-dg2: SKIP (i915#15102 / i915#3458) -> SKIP (i915#10433 /
>             i915#15102 / i915#3458) +1 other test skip
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
> 
>           * shard-dg1: SKIP (i915#15102 / i915#3458 / i915#4423) -> SKIP
>             (i915#15102 / i915#3458)
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-rkl: SKIP (i915#13331 / i915#14544) -> SKIP (i915#1187 /
>             i915#12713)
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15458) -> SKIP (i915#15458)
>      * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>           * shard-rkl: SKIP (i915#15458) -> SKIP (i915#14544 / i915#15458)
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-rkl: SKIP (i915#6301) -> SKIP (i915#14544 / i915#6301)
>      * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
> 
>           * shard-rkl: SKIP (i915#14712) -> SKIP (i915#14544 / i915#14712) +1
>             other test skip
>      * igt@kms_plane_multiple@2x-tiling-yf:
> 
>           * shard-rkl: SKIP (i915#13958) -> SKIP (i915#13958 / i915#14544)
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-rkl: SKIP (i915#14259) -> SKIP (i915#14259 / i915#14544)
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-rkl: SKIP (i915#12343 / i915#14544) -> SKIP (i915#12343)
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-rkl: SKIP (i915#3828) -> SKIP (i915#14544 / i915#3828)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-tglu: FAIL (i915#9295) -> SKIP (i915#15128)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-rkl: SKIP (i915#9340) -> SKIP (i915#3828)
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
> 
>           * shard-rkl: SKIP (i915#11520) -> SKIP (i915#11520 / i915#14544) +5
>             other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
> 
>           * shard-rkl: SKIP (i915#11520 / i915#14544) -> SKIP (i915#11520) +5
>             other tests skip
>      * igt@kms_psr@fbc-psr2-suspend:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 /
>             i915#14544 / i915#9732) +10 other tests skip
>      * igt@kms_psr@psr-cursor-blt:
> 
>           * shard-dg1: SKIP (i915#1072 / i915#4423 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732)
>      * igt@kms_psr@psr-cursor-mmap-cpu:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#14544 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732) +8 other tests skip
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-rkl: SKIP (i915#9685) -> SKIP (i915#14544 / i915#9685)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-rkl: SKIP (i915#5289) -> SKIP (i915#14544 / i915#5289)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#5289) -> SKIP (i915#5289)
>      * igt@kms_scaling_modes@scaling-mode-full:
> 
>           * shard-rkl: SKIP (i915#3555) -> SKIP (i915#14544 / i915#3555) +1
>             other test skip
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-rkl: SKIP (i915#8623) -> SKIP (i915#14544 / i915#8623)
>      * igt@kms_vrr@flip-basic-fastset:
> 
>           * shard-rkl: SKIP (i915#9906) -> SKIP (i915#14544 / i915#9906)
>      * igt@kms_vrr@seamless-rr-switch-drrs:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9906) -> SKIP (i915#9906)
>      * igt@perf@unprivileged-single-ctx-counters:
> 
>           * shard-rkl: SKIP (i915#2433) -> SKIP (i915#14544 / i915#2433)
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3708) -> SKIP (i915#3708) +1
>             other test skip
>      * igt@sriov_basic@bind-unbind-vf:
> 
>           * shard-rkl: SKIP (i915#9917) -> SKIP (i915#14544 / i915#9917)
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8674 -> IGTPW_14266
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_17732: f101d56dc32350daa45c130ff7a6d46512f614a9 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_14266: 14266
>    IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
