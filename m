Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5E6C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 10:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EB710EC34;
	Fri, 14 Feb 2025 10:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsmDGzyJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DD910E2BF
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 10:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739528233; x=1771064233;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oEcMZ+meGMUCB/BI1Mx2Zb2gvFjxZgKnU/nib2kLsy4=;
 b=BsmDGzyJdtQ6GnT2MHEZDDpxnfUTGUf2u7/IXHgvrxuoDlIGTHNo3EqW
 2ugGaCYK0a55tarSF/FYtwLb3Jq9+/mFpfIsdxqW9aUng7T/PcP3x3c7d
 rKbArIziG5IIgkBkHLDre5zeojQhkUvmXDc5paZThbnuBpLiE04U5NWse
 1gZ0d7SgcjKFWHNgrG0yT01E6eS2ktVggHC8abSC6wXFtnfF1bHvtJLp5
 mV2vl9MsXj4bWKAa8nzHQSYD60y1RDcIulOUiaKFaF4jaIUQDMsISUV96
 HAL5lyyKUjl++ZKZBrm49V6338+CPngljeDOvtc30uMhYV0idFH5mwEKR w==;
X-CSE-ConnectionGUID: skU0S7vYTK6UIPnMHv1u8g==
X-CSE-MsgGUID: /TqcBWIrR7e3tF1LCkyAVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40305023"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="40305023"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 02:17:12 -0800
X-CSE-ConnectionGUID: JO1FV2N+RPeiLVsiCZ6wdw==
X-CSE-MsgGUID: Sp8zlQsYTE6LhdnEQCoFww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144353121"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.52])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 02:17:11 -0800
Date: Fri, 14 Feb 2025 11:17:08 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Add XE support for i915_pipe_stress
Message-ID: <20250214101708.5i5cplkjdhyy2zj4@zkempczy-mobl2>
References: <20250211122743.329838-1-swati2.sharma@intel.com>
 <173929452658.974576.12677995070148431563@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173929452658.974576.12677995070148431563@b555e5b46a47>
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

On Tue, Feb 11, 2025 at 05:22:06PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add XE support for i915_pipe_stress                             
>    URL:     https://patchwork.freedesktop.org/series/144665/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/index.html 
> 
>         CI Bug Log - changes from CI_DRM_16107_full -> IGTPW_12574_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_12574_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_12574_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/index.html
> 
> Participating hosts (10 -> 10)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_12574_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_exec_params@larger-than-life-batch:
> 
>           * shard-dg1: PASS -> INCOMPLETE
>      * igt@gem_exec_suspend@basic-s4-devices:
> 
>           * shard-glk: NOTRUN -> ABORT +1 other test abort
>      * igt@gem_mmap_offset@open-flood:
> 
>           * shard-rkl: PASS -> DMESG-WARN
>      * {igt@kms_pipe_stress@stress-xrgb8888-ytiled} (NEW):
> 
>           * shard-dg2: NOTRUN -> SKIP
>           * shard-mtlp: NOTRUN -> SKIP

This is skip on previous not run, so no harm done.

> 
> New tests
> 
>    New tests have been introduced between CI_DRM_16107_full and
>    IGTPW_12574_full:
> 
>   New IGT tests (4)
> 
>      * igt@gem_exec_schedule@fifo@vecs1:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.18] s
>      * igt@kms_atomic@plane-cursor-legacy@pipe-a-dp-3:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.50] s
>      * igt@kms_pipe_stress@stress-xrgb8888-untiled:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [6.08, 13.68] s
>      * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * Statuses : 4 pass(s) 3 skip(s)
>           * Exec time: [0.0, 14.36] s

This is related to the change and it is ok (passes/skips).

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_12574_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@device_reset@unbind-cold-reset-rebind:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#11078])
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#11078])
>      * igt@device_reset@unbind-reset-rebind:
> 
>           * shard-dg1: NOTRUN -> ABORT ([i915#11814] / [i915#11815] /
>             [i915#9413])
>      * igt@drm_fdinfo@all-busy-check-all:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8414]) +15 other tests skip
>      * igt@drm_fdinfo@busy-check-all@bcs0:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8414]) +12 other tests skip
>      * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8414]) +17 other tests skip
>      * igt@drm_fdinfo@virtual-busy-idle-all:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#8414])
>      * igt@gem_caching@writes:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4873]) +1 other test skip
>      * igt@gem_ccs@block-multicopy-compressed:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9323])
>      * igt@gem_ccs@ctrl-surf-copy:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3555] / [i915#9323])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3555] / [i915#9323])
>           * shard-rkl: NOTRUN -> SKIP ([i915#3555] / [i915#9323])
>           * shard-dg1: NOTRUN -> SKIP ([i915#3555] / [i915#9323])
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#9323])
>      * igt@gem_ccs@large-ctrl-surf-copy:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#13008])
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9323])
>      * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
> 
>           * shard-dg2: PASS -> INCOMPLETE ([i915#13356])
>      * igt@gem_close_race@multigpu-basic-process:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#7697]) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP ([i915#7697]) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP ([i915#7697])
>           * shard-dg1: NOTRUN -> SKIP ([i915#7697])
>      * igt@gem_close_race@multigpu-basic-threads:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#7697])
>      * igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#6335])
>      * igt@gem_ctx_persistence@heartbeat-stop:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8555])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8555]) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP ([i915#8555])
>      * igt@gem_ctx_persistence@legacy-engines-hang:
> 
>           * shard-snb: NOTRUN -> SKIP ([i915#1099])
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#280])
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#280])
>      * igt@gem_eio@in-flight-internal-immediate:
> 
>           * shard-mtlp: NOTRUN -> ABORT ([i915#13193]) +1 other test abort
>      * igt@gem_eio@kms:
> 
>           * shard-dg2: NOTRUN -> FAIL ([i915#5784])
>           * shard-dg1: NOTRUN -> FAIL ([i915#5784])
>      * igt@gem_eio@reset-stress:
> 
>           * shard-dg1: PASS -> FAIL ([i915#12543] / [i915#5784])
>      * igt@gem_eio@wait-immediate:
> 
>           * shard-mtlp: PASS -> ABORT ([i915#13193])
>      * igt@gem_exec_balancer@bonded-dual:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4771]) +1 other test skip
>      * igt@gem_exec_balancer@bonded-semaphore:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4812]) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4812]) +2 other tests skip
>      * igt@gem_exec_balancer@bonded-true-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4812]) +2 other tests skip
>      * igt@gem_exec_balancer@invalid-bonds:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4036])
>           * shard-dg1: NOTRUN -> SKIP ([i915#4036])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4036])
>      * igt@gem_exec_balancer@parallel-bb-first:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#4525])
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#4525]) +2 other tests skip
>      * igt@gem_exec_capture@capture-invisible:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#6334]) +1 other test skip
>      * igt@gem_exec_capture@capture-invisible@smem0:
> 
>           * shard-glk: NOTRUN -> SKIP ([i915#6334]) +1 other test skip
>      * igt@gem_exec_capture@capture-recoverable:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#6344])
>      * igt@gem_exec_fence@concurrent:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#4812])
>      * igt@gem_exec_flush@basic-uc-prw-default:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3539])
>           * shard-dg2: NOTRUN -> SKIP ([i915#3539])
>      * igt@gem_exec_flush@basic-uc-ro-default:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3539] / [i915#4852])
>      * igt@gem_exec_reloc@basic-concurrent0:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3281]) +6 other tests skip
>      * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3281]) +8 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3281]) +10 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3281]) +10 other tests skip
>      * igt@gem_exec_reloc@basic-write-cpu-active:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#3281])
>      * igt@gem_exec_schedule@preempt-queue-chain:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#4537] / [i915#4812])
>      * igt@gem_exec_schedule@preempt-queue-contexts-chain:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4537] / [i915#4812]) +1 other
>             test skip
>      * igt@gem_exec_suspend@basic-s0@smem:
> 
>           * shard-dg2: PASS -> INCOMPLETE ([i915#11441] / [i915#13304]) +1
>             other test incomplete
>      * igt@gem_fence_thrash@bo-copy:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4860]) +2 other tests skip
>      * igt@gem_fence_thrash@bo-write-verify-threaded-none:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#4860])
>      * igt@gem_fenced_exec_thrash@2-spare-fences:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4860])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4860]) +1 other test skip
>      * igt@gem_lmem_swapping@heavy-verify-multi:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#4613]) +1 other test skip
>      * igt@gem_lmem_swapping@parallel-multi:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4613]) +2 other tests skip
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#4613]) +3 other tests skip
>      * igt@gem_lmem_swapping@random-engines:
> 
>           * shard-glk: NOTRUN -> SKIP ([i915#4613]) +6 other tests skip
>      * igt@gem_lmem_swapping@verify-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#4613]) +4 other tests skip
>      * igt@gem_mmap_gtt@cpuset-medium-copy:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4077]) +18 other tests skip
>      * igt@gem_mmap_gtt@fault-concurrent-x:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4077]) +12 other tests skip
>      * igt@gem_mmap_wc@bad-size:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4083]) +4 other tests skip
>      * igt@gem_mmap_wc@write:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4083]) +2 other tests skip
>           * shard-dg2: NOTRUN -> SKIP ([i915#4083])
>      * igt@gem_mmap_wc@write-cpu-read-wc:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#4083]) +5 other tests skip
>      * igt@gem_partial_pwrite_pread@reads:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3282]) +5 other tests skip
>      * igt@gem_partial_pwrite_pread@reads-display:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3282]) +6 other tests skip
>      * igt@gem_partial_pwrite_pread@write:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3282]) +5 other tests skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#3282]) +2 other tests skip
>      * igt@gem_pread@snoop:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3282]) +6 other tests skip
>      * igt@gem_pxp@create-protected-buffer:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4270]) +2 other tests skip
>      * igt@gem_pxp@display-protected-crc:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4270])
>      * igt@gem_pxp@hw-rejects-pxp-buffer:
> 
>           * shard-rkl: NOTRUN -> TIMEOUT ([i915#12917] / [i915#12964]) +2
>             other tests timeout
>           * shard-tglu: NOTRUN -> SKIP ([i915#13398])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#13398]) +1 other test skip
>      * igt@gem_pxp@reject-modify-context-protection-off-2:
> 
>           * shard-rkl: PASS -> TIMEOUT ([i915#12917] / [i915#12964])
>      * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#4270])
>      * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8428]) +2 other tests skip
>      * igt@gem_render_copy@yf-tiled-ccs-to-linear:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#5190] / [i915#8428])
>      * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#5190] / [i915#8428]) +5 other
>             tests skip
>      * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4079]) +1 other test skip
>      * igt@gem_softpin@evict-snoop:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#4885])
>      * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4077]) +16 other tests skip
>      * igt@gem_tiled_pread_basic:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4079])
>      * igt@gem_tiled_pread_pwrite:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#4079]) +1 other test skip
>      * igt@gem_unfence_active_buffers:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4879])
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#4879])
>      * igt@gem_userptr_blits@coherency-sync:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3297])
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-glk: NOTRUN -> SKIP ([i915#3323])
>           * shard-dg2: NOTRUN -> SKIP ([i915#3297])
>      * igt@gem_userptr_blits@dmabuf-unsync:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#3297]) +2 other tests skip
>      * igt@gem_userptr_blits@forbidden-operations:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3282] / [i915#3297])
>      * igt@gem_userptr_blits@map-fixed-invalidate-busy:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3297]) +2 other tests skip
>           * shard-dg2: NOTRUN -> SKIP ([i915#3297] / [i915#4880])
>           * shard-dg1: NOTRUN -> SKIP ([i915#3297] / [i915#4880])
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#3297] / [i915#4880])
>      * igt@gem_userptr_blits@readonly-pwrite-unsync:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3297])
>      * igt@gem_userptr_blits@unsync-overlap:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3297])
>      * igt@gen3_render_tiledx_blits:
> 
>           * shard-dg2-9: NOTRUN -> SKIP +8 other tests skip
>      * igt@gen7_exec_parse@bitmasks:
> 
>           * shard-dg2: NOTRUN -> SKIP +12 other tests skip
>      * igt@gen7_exec_parse@chained-batch:
> 
>           * shard-rkl: NOTRUN -> SKIP +21 other tests skip
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#2856]) +3 other tests skip
>           * shard-dg2: NOTRUN -> SKIP ([i915#2856]) +3 other tests skip
>      * igt@gen9_exec_parse@batch-invalid-length:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#2527] / [i915#2856]) +1 other
>             test skip
>      * igt@gen9_exec_parse@batch-zero-length:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#2856]) +1 other test skip
>      * igt@gen9_exec_parse@bb-start-cmd:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#2527]) +2 other tests skip
>      * igt@gen9_exec_parse@cmd-crossing-page:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#2527] / [i915#2856]) +3 other
>             tests skip
>           * shard-rkl: NOTRUN -> SKIP ([i915#2527]) +1 other test skip
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-snb: PASS -> ABORT ([i915#9820])
>           * shard-tglu: PASS -> ABORT ([i915#10887] / [i915#12817] /
>             [i915#9820])
>      * igt@i915_module_load@resize-bar:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#7178])
>      * igt@i915_pm_freq_api@freq-basic-api:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#8399]) +1 other test skip
>      * igt@i915_pm_freq_api@freq-reset:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#8399])
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
> 
>           * shard-tglu-1: NOTRUN -> WARN ([i915#2681]) +4 other tests warn
>      * igt@i915_pm_rps@basic-api:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#11681] / [i915#6621]) +1 other
>             test skip
>      * igt@i915_pm_rps@thresholds-idle:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#11681])
>      * igt@i915_pm_rps@thresholds-idle-park:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#11681])
>      * igt@i915_power@sanity:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#7984])
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#6245])
>           * shard-rkl: NOTRUN -> SKIP ([i915#6245])
>      * igt@i915_query@test-query-geometry-subslices:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#5723])
>      * igt@i915_selftest@live:
> 
>           * shard-rkl: PASS -> DMESG-FAIL ([i915#12964] / [i915#13550])
>      * igt@i915_selftest@live@gt_pm:
> 
>           * shard-rkl: PASS -> DMESG-FAIL ([i915#13550])
>      * igt@i915_selftest@mock@memory_region:
> 
>           * shard-dg2-9: NOTRUN -> DMESG-WARN ([i915#9311]) +1 other test
>             dmesg-warn
>      * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4212])
>      * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4212]) +3 other tests skip
>      * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#4212]) +1 other test skip
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12454] / [i915#12712])
>      * igt@kms_addfb_basic@tile-pitch-mismatch:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4212])
>      * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-4-rc-ccs-cc:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8709]) +7 other tests skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#8709]) +2 other tests skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#8709]) +7 other tests skip
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4538] / [i915#5286]) +5 other
>             tests skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#5286]) +4 other tests skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#5286]) +3 other tests skip
>      * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#5286]) +5 other tests skip
>      * igt@kms_big_fb@4-tiled-addfb-size-overflow:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#5286])
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-mtlp: PASS -> FAIL ([i915#5138])
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-mtlp: NOTRUN -> FAIL ([i915#5138])
>      * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
> 
>           * shard-mtlp: NOTRUN -> SKIP +23 other tests skip
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3638]) +2 other tests skip
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3638]) +2 other tests skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#4538] / [i915#5190]) +4 other
>             tests skip
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4538] / [i915#5190]) +5 other
>             tests skip
>      * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#6187]) +1 other test skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4538]) +4 other tests skip
>      * igt@kms_busy@extended-modeset-hang-newfb-with-reset:
> 
>           * shard-rkl: PASS -> DMESG-WARN ([i915#12964]) +34 other tests
>             dmesg-warn
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#6095]) +167 other tests skip
>      * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#10307] / [i915#10434] /
>             [i915#6095]) +4 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#12313])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12313]) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP ([i915#12313]) +1 other test skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#12313])
>           * shard-dg1: NOTRUN -> SKIP ([i915#12313]) +1 other test skip
>      * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
> 
>           * shard-snb: NOTRUN -> SKIP +63 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#10307] / [i915#6095]) +34
>             other tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#12313])
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#6095]) +49 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#6095]) +39 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12805])
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#6095]) +12 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#6095]) +4 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#6095]) +54 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#6095]) +85 other tests skip
>      * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#10307] / [i915#6095]) +153 other
>             tests skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3742])
>      * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +10 other
>             tests skip
>      * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +6 other
>             tests skip
>      * igt@kms_chamelium_frames@dp-crc-single:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +12 other
>             tests skip
>      * igt@kms_chamelium_hpd@dp-hpd:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +4
>             other tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +13 other
>             tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +2 other
>             tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +7 other
>             tests skip
>      * igt@kms_color@deep-color:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#3555]) +2 other tests skip
>      * igt@kms_content_protection@atomic:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#6944] / [i915#7116] /
>             [i915#7118] / [i915#9424])
>           * shard-dg2: NOTRUN -> SKIP ([i915#7118] / [i915#9424])
>      * igt@kms_content_protection@content-type-change:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#6944] / [i915#9424])
>           * shard-dg2: NOTRUN -> SKIP ([i915#9424])
>           * shard-dg1: NOTRUN -> SKIP ([i915#9424])
>      * igt@kms_content_protection@legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#7118] / [i915#9424])
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#9424])
>           * shard-rkl: NOTRUN -> SKIP ([i915#9424]) +1 other test skip
>      * igt@kms_content_protection@type1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#6944] / [i915#7116] /
>             [i915#7118] / [i915#9424])
>           * shard-dg1: NOTRUN -> SKIP ([i915#7116] / [i915#9424])
>      * igt@kms_content_protection@uevent:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#6944] / [i915#9424]) +3 other
>             tests skip
>      * igt@kms_content_protection@uevent@pipe-a-dp-3:
> 
>           * shard-dg2: NOTRUN -> FAIL ([i915#1339] / [i915#7173])
>      * igt@kms_cursor_crc@cursor-offscreen-128x42:
> 
>           * shard-glk: NOTRUN -> DMESG-FAIL ([i915#118]) +1 other test
>             dmesg-fail
>      * igt@kms_cursor_crc@cursor-offscreen-32x32:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3555]) +7 other tests skip
>      * igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#13049]) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP ([i915#13049]) +1 other test skip
>      * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> FAIL ([i915#13566]) +1 other test fail
>      * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> FAIL ([i915#13566]) +1 other test fail
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#13049]) +2 other tests skip
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#13049]) +1 other test skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8814]) +4 other tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3555]) +7 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-128x42:
> 
>           * shard-tglu: PASS -> FAIL ([i915#13566]) +3 other tests fail
>      * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: PASS -> FAIL ([i915#13566]) +3 other tests fail
>      * igt@kms_cursor_crc@cursor-sliding-32x10:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3555]) +3 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-32x32:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3555] / [i915#8814]) +3 other
>             tests skip
>      * igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#13049]) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP ([i915#13049])
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#13049]) +3 other tests skip
>      * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#13046] / [i915#5354]) +2 other
>             tests skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#4103])
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4103] / [i915#4213])
>      * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#13046] / [i915#5354]) +2 other
>             tests skip
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9809]) +1 other test skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#4103]) +1 other test skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#4103])
>      * igt@kms_cursor_legacy@torture-move@pipe-a:
> 
>           * shard-glk: NOTRUN -> DMESG-WARN ([i915#1982]) +1 other test
>             dmesg-warn
>      * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#9723])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9833])
>      * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9833])
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3804])
>      * igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12402])
>           * shard-rkl: NOTRUN -> SKIP ([i915#12402])
>           * shard-dg1: NOTRUN -> SKIP ([i915#12402])
>           * shard-tglu: NOTRUN -> SKIP ([i915#12402])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12402])
>      * igt@kms_draw_crc@draw-method-mmap-wc:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#8812])
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3840])
>      * igt@kms_dsc@dsc-with-bpc:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3555] / [i915#3840])
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3555] / [i915#3840])
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#3555] / [i915#3840])
>           * shard-dg1: NOTRUN -> SKIP ([i915#3555] / [i915#3840]) +1 other
>             test skip
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#9878])
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#1839])
>      * igt@kms_feature_discovery@psr2:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#658])
>      * igt@kms_fence_pin_leak:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4881])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4881])
>           * shard-dg2: NOTRUN -> SKIP ([i915#4881])
>      * igt@kms_flip@2x-dpms-vs-vblank-race:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3637]) +6 other tests skip
>      * igt@kms_flip@2x-flip-vs-fences:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3637]) +3 other tests skip
>           * shard-dg2: NOTRUN -> SKIP ([i915#8381])
>      * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9934]) +5 other tests skip
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#9934]) +2 other tests skip
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#4839])
>      * igt@kms_flip@2x-nonexisting-fb-interruptible:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3637]) +5 other tests skip
>      * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9934]) +5 other tests skip
>      * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9934]) +1 other test skip
>      * igt@kms_flip@flip-vs-absolute-wf_vblank:
> 
>           * shard-glk: NOTRUN -> DMESG-WARN ([i915#118]) +1 other test
>             dmesg-warn
>      * igt@kms_flip@flip-vs-fences-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8381])
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#12745] / [i915#4839]) +2
>             other tests incomplete
>      * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#12745]) +1 other test
>             incomplete
>      * igt@kms_flip@plain-flip-fb-recreate:
> 
>           * shard-dg2: PASS -> FAIL ([i915#11989]) +2 other tests fail
>      * igt@kms_flip@plain-flip-fb-recreate-interruptible:
> 
>           * shard-tglu: PASS -> FAIL ([i915#11989]) +3 other tests fail
>      * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:
> 
>           * shard-rkl: NOTRUN -> FAIL ([i915#11989]) +1 other test fail
>      * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a4:
> 
>           * shard-dg1: PASS -> FAIL ([i915#11989]) +3 other tests fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#2672] / [i915#3555]) +3 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#2672] / [i915#3555])
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#2587] / [i915#2672])
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#2672] / [i915#3555]) +2 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#2672] / [i915#8813]) +3 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#2672]) +4 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#2672]) +4 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#2587] / [i915#2672] /
>             [i915#3555])
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#2587] / [i915#2672]) +4 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#2672]) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#2672] / [i915#3555]) +4 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3555] / [i915#8810] /
>             [i915#8813])
>      * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3555] / [i915#8810])
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#2672] / [i915#3555]) +4 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#2587] / [i915#2672]) +4 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#2672] / [i915#3555] /
>             [i915#5190]) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#2672] / [i915#3555] /
>             [i915#5190]) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#2672] / [i915#3555] /
>             [i915#8813]) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-dg2: PASS -> FAIL ([i915#6880])
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#8708]) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#5354]) +24 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#5354]) +11 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#1825]) +29 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +57 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#10055])
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
> 
>           * shard-dg1: NOTRUN -> SKIP +52 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8708]) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#3458]) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3023]) +23 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8708]) +12 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#1825]) +31 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3458]) +17 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8708]) +14 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3458]) +21 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
> 
>           * shard-tglu: NOTRUN -> SKIP +62 other tests skip
>      * igt@kms_hdr@bpc-switch:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#3555] / [i915#8228])
>      * igt@kms_hdr@bpc-switch-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3555] / [i915#8228]) +1 other
>             test skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#3555] / [i915#8228]) +1 other
>             test skip
>           * shard-tglu: NOTRUN -> SKIP ([i915#3555] / [i915#8228]) +1 other
>             test skip
>      * igt@kms_hdr@bpc-switch-suspend:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3555] / [i915#8228]) +1 other
>             test skip
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#12713])
>           * shard-rkl: NOTRUN -> SKIP ([i915#12713])
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-dg2: PASS -> SKIP ([i915#3555] / [i915#8228])
>      * igt@kms_joiner@invalid-modeset-big-joiner:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#10656])
>           * shard-dg2: NOTRUN -> SKIP ([i915#10656])
>      * igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#12388])
>      * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#10656])
>           * shard-rkl: NOTRUN -> SKIP ([i915#12394])
>      * igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12339])
>      * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#13522])
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#6301])
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#6301])
>      * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
> 
>           * shard-glk: PASS -> INCOMPLETE ([i915#12756])
>      * igt@kms_plane_alpha_blend@constant-alpha-max:
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#10647] / [i915#12169])
>      * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#10647]) +1 other test fail
>      * igt@kms_plane_lowres@tiling-4:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#10226] / [i915#11614] /
>             [i915#3555] / [i915#8821])
>      * igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#11614] / [i915#3582]) +3 other
>             tests skip
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3555] / [i915#8806])
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12247]) +22 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#12247]) +4 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#12247]) +4 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#12247]) +14 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12247] / [i915#6953] /
>             [i915#9423])
>           * shard-dg1: NOTRUN -> SKIP ([i915#12247] / [i915#6953])
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#12247] / [i915#6953])
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#12247]) +3 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12247]) +3 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12247] / [i915#6953]) +1 other
>             test skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12247] / [i915#3555] /
>             [i915#6953])
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12247] / [i915#3555])
>      * igt@kms_pm_backlight@basic-brightness:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#5354]) +1 other test skip
>      * igt@kms_pm_backlight@fade-with-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9812])
>           * shard-dg1: NOTRUN -> SKIP ([i915#5354])
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3828])
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-mtlp: NOTRUN -> FAIL ([i915#12912])
>           * shard-dg2: NOTRUN -> SKIP ([i915#9685]) +1 other test skip
>      * igt@kms_pm_dc@dc9-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3361])
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#4281])
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-dg2: PASS -> SKIP ([i915#9519])
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-rkl: PASS -> SKIP ([i915#12916])
>      * igt@kms_pm_rpm@dpms-non-lpsp:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#9519])
>      * igt@kms_pm_rpm@fences-dpms:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#4077]) +4 other tests skip
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9519])
>           * shard-dg1: NOTRUN -> SKIP ([i915#9519])
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#9519])
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-rkl: PASS -> SKIP ([i915#9519]) +2 other tests skip
>           * shard-tglu: NOTRUN -> SKIP ([i915#9519])
>      * igt@kms_prime@basic-crc-hybrid:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#6524])
>      * igt@kms_prime@basic-modeset-hybrid:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#6524]) +1 other test skip
>      * igt@kms_prime@d3hot:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#6524]) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP ([i915#6524] / [i915#6805])
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#11520]) +8 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9808]) +1 other test skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#11520]) +4 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
> 
>           * shard-glk: NOTRUN -> SKIP ([i915#11520]) +9 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#11520]) +2 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#11520]) +7 other tests skip
>      * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12316]) +7 other tests skip
>      * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
> 
>           * shard-snb: NOTRUN -> SKIP ([i915#11520])
>      * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#11520]) +6 other tests skip
>      * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#11520]) +2 other tests skip
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9683])
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4348]) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP ([i915#9683]) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP ([i915#9683])
>           * shard-dg1: NOTRUN -> SKIP ([i915#9683]) +1 other test skip
>      * igt@kms_psr@fbc-psr-cursor-render:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9732]) +12 other tests skip
>      * igt@kms_psr@fbc-psr-primary-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#1072] / [i915#9732]) +20 other
>             tests skip
>      * igt@kms_psr@fbc-psr-primary-mmap-gtt:
> 
>           * shard-dg2-9: NOTRUN -> SKIP ([i915#1072] / [i915#9732]) +10 other
>             tests skip
>      * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
> 
>           * shard-glk: NOTRUN -> SKIP +448 other tests skip
>      * igt@kms_psr@pr-primary-mmap-cpu:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9688]) +18 other tests skip
>      * igt@kms_psr@psr2-sprite-blt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#9732]) +14 other tests skip
>      * igt@kms_psr@psr2-sprite-mmap-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#1072] / [i915#9732]) +21 other
>             tests skip
>      * igt@kms_psr@psr2-sprite-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#1072] / [i915#9732]) +22 other
>             tests skip
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9685]) +1 other test skip
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#9685])
>           * shard-dg1: NOTRUN -> SKIP ([i915#9685])
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9685]) +1 other test skip
>      * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#5289])
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#5190]) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP ([i915#5289])
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#5289]) +1 other test skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#5289])
>      * igt@kms_scaling_modes@scaling-mode-full-aspect:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3555]) +7 other tests skip
>      * igt@kms_scaling_modes@scaling-mode-none:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3555] / [i915#5030] /
>             [i915#9041])
>      * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#5030]) +2 other tests skip
>      * igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#5030] / [i915#9041])
>      * igt@kms_selftest@drm_framebuffer:
> 
>           * shard-tglu: NOTRUN -> ABORT ([i915#13179]) +1 other test abort
>           * shard-mtlp: NOTRUN -> [ABOR
