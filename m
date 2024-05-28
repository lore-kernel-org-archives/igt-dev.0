Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27510C25B78
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 07:46:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB7910E5F9;
	Tue, 28 May 2024 07:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OsSNrGku";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE5410E5F9;
 Tue, 28 May 2024 07:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716882410; x=1748418410;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=syIlMHKLBSCH/2TXI7XCHjnTyiutUKaSlnlr/tMfUaE=;
 b=OsSNrGku1Scqlp9gXWFfdE4eHBeUI7ULVs+7Y5QSW1r/71LNU/PSPtQB
 0ilJAjrMOEL/IKL0BkOLeSDCTak6mD3izCsE4VmO/c5SjIn8ORoQbHeps
 RfQVbwqoQM2Ms2dswoNsLHTkB+jmAnShfUh9CQIWLwNmfmdQa5fyccz9b
 pRNsxzC19k4RC+fWMeU+IrLuv8vQ3h3cZKKQrbpqbb8D5G30ByTq7fi+c
 UIRAc5uDDedrGWODJ4TiKbciqhVEfSyxSwjzLDq05Z8VnC9yGLLIdv5U5
 DaEhT4AFVrQ3qpcbILuOeKgBuloedDQpsDy9flWEIAhT3Kpo6ychKO1xN g==;
X-CSE-ConnectionGUID: g4jiZxNUTZOmvFWreJD1Cg==
X-CSE-MsgGUID: yiRNvUzWTYObMnVoP5yw/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23766578"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="23766578"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 00:46:50 -0700
X-CSE-ConnectionGUID: DAlIhyPESbi8Zo6meiPUog==
X-CSE-MsgGUID: CT9gesRRT+mvToAYzqLyEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="39807704"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.10])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 00:46:49 -0700
Date: Tue, 28 May 2024 09:46:45 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 Introduce intel_tiling_detect tool
Message-ID: <20240528074645.gohdviwjmgbzc5nu@zkempczy-mobl2>
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
 <171688134405.2215514.4609122133833575504@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171688134405.2215514.4609122133833575504@8e613ede5ea5>
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

On Tue, May 28, 2024 at 07:29:04AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Introduce intel_tiling_detect tool                              
>    URL:     https://patchwork.freedesktop.org/series/134062/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11196/index.html 
> 
>         CI Bug Log - changes from CI_DRM_14826_full -> IGTPW_11196_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_11196_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_11196_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11196/index.html
> 
> Participating hosts (9 -> 9)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_11196_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_flip@wf_vblank-ts-check@c-hdmi-a3:
>           * shard-dg2: NOTRUN -> INCOMPLETE

Unrelated to the change.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between CI_DRM_14826_full and
>    IGTPW_11196_full:
> 
>   New IGT tests (9)
> 
>      * igt@kms_flip@2x-absolute-wf_vblank@ab-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [10.64] s
>      * igt@kms_flip@2x-absolute-wf_vblank@ac-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [10.59] s
>      * igt@kms_flip@2x-absolute-wf_vblank@bc-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [10.57] s
>      * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.91] s
>      * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ac-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.57] s
>      * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@bc-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.51] s
>      * igt@kms_flip@2x-nonexisting-fb@ab-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.63] s
>      * igt@kms_flip@2x-nonexisting-fb@ac-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.57] s
>      * igt@kms_flip@2x-nonexisting-fb@bc-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.54] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_11196_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@blit-reloc-keep-cache:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8411)
>      * igt@api_intel_bb@crc32:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6230)
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8411)
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#11078)
>      * igt@device_reset@unbind-cold-reset-rebind:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11078)
>      * igt@drm_fdinfo@busy-idle-check-all@ccs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8414) +11 other tests skip
>      * igt@drm_fdinfo@busy-idle-check-all@vcs0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8414) +7 other tests skip
>      * igt@drm_fdinfo@busy-idle-check-all@vcs1:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8414) +15 other tests skip
>      * igt@drm_fdinfo@most-busy-check-all@rcs0:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#7742)
>      * igt@gem_busy@semaphore:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3936)
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@block-multicopy-compressed:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_ccs@ctrl-surf-copy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_create@create-ext-set-pat:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8562)
>      * igt@gem_ctx_persistence@engines-hostile:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#1099)
>      * igt@gem_ctx_persistence@hang:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5882) +6 other tests skip
>      * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5882) +5 other tests skip
>      * igt@gem_ctx_sseu@invalid-args:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@hibernate:
> 
>           * shard-rkl: NOTRUN -> ABORT (i915#7975 / i915#8213)
>      * igt@gem_eio@kms:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE (i915#10513)
>           * shard-dg1: NOTRUN -> INCOMPLETE (i915#10513 / i915#1982)
>      * igt@gem_exec_balancer@parallel-contexts:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_capture@capture-invisible@lmem0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6334) +1 other test skip
>      * igt@gem_exec_capture@capture@vecs0-lmem0:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#10386) +1 other test fail
>      * igt@gem_exec_capture@many-4k-zero:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#9606)
>      * igt@gem_exec_fair@basic-none-share:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +3 other tests
>             skip
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-pace-share:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4473 / i915#4771)
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-sync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539) +1 other test skip
>      * igt@gem_exec_fence@submit:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4812) +1 other test skip
>      * igt@gem_exec_fence@submit3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_flush@basic-uc-rw-default:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852) +3 other tests
>             skip
>      * igt@gem_exec_reloc@basic-cpu-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +5 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-read:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +11 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-wc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +4 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +12 other tests skip
>      * igt@gem_exec_schedule@preempt-queue-chain:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4537 / i915#4812) +1 other test
>             skip
>      * igt@gem_exec_schedule@preempt-queue-contexts:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4812) +1 other test skip
>      * igt@gem_fence_thrash@bo-write-verify-threaded-none:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4860) +1 other test skip
>      * igt@gem_fence_thrash@bo-write-verify-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860) +1 other test skip
>      * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_lmem_swapping@heavy-verify-multi:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4565)
>      * igt@gem_lmem_swapping@random-engines:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +5 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@verify-ccs@lmem0:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#10378)
>      * igt@gem_media_fill@media-fill:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8289)
>      * igt@gem_mmap_gtt@basic-small-bo:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +7 other tests skip
>      * igt@gem_mmap_gtt@basic-small-bo-tiledx:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +8 other tests skip
>      * igt@gem_mmap_wc@copy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      * igt@gem_mmap_wc@write-read:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +10 other tests skip
>      * igt@gem_mmap_wc@write-wc-read-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +1 other test skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +3 other tests skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-display:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +5 other tests skip
>      * igt@gem_pread@exhaustion:
> 
>           * shard-glk: NOTRUN -> WARN (i915#2658)
>      * igt@gem_pread@snoop:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282)
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +1 other test skip
>      * igt@gem_pxp@display-protected-crc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_pxp@protected-raw-src-copy-not-readible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>      * igt@gem_pxp@verify-pxp-stale-buf-execution:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_pxp@verify-pxp-stale-ctx-execution:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +5 other tests skip
>      * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +4 other tests
>             skip
>      * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +2 other tests skip
>      * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_set_tiling_vs_pwrite:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4079) +1 other test skip
>      * igt@gem_softpin@evict-snoop:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4885)
>      * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +17 other tests skip
>      * igt@gem_unfence_active_buffers:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4879)
>      * igt@gem_userptr_blits@access-control:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@relocations:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281 / i915#3297)
>      * igt@gem_userptr_blits@sd-probe:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4958)
>      * igt@gem_userptr_blits@unsync-overlap:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@unsync-unmap-cycles:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856) +3 other tests skip
>      * igt@gen9_exec_parse@batch-invalid-length:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2527) +3 other tests skip
>      * igt@gen9_exec_parse@shadow-peek:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +3 other tests skip
>      * igt@gen9_exec_parse@unaligned-access:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +2 other tests skip
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-dg2: PASS -> ABORT (i915#9820)
>      * igt@i915_pm_freq_mult@media-freq@gt0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6590)
>      * igt@i915_pm_rps@min-max-config-loaded:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6621)
>      * igt@i915_pm_rps@thresholds-idle@gt0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8925) +1 other test skip
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4387)
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6245)
>      * igt@i915_selftest@mock@memory_region:
> 
>           * shard-mtlp: NOTRUN -> DMESG-WARN (i915#9311)
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6645)
>      * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4212) +2 other tests skip
>      * igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4215)
>      * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4212) +1 other test skip
>      * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8709) +11 other tests skip
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9531)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#1769) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +6 other tests
>             skip
>      * igt@kms_big_fb@4-tiled-addfb:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>      * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5286)
>      * igt@kms_big_fb@linear-64bpp-rotate-90:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3638) +4 other tests skip
>      * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +12 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>           * shard-mtlp: NOTRUN -> SKIP +12 other tests skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538) +5 other tests skip
>      * igt@kms_big_joiner@basic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#10656)
>      * igt@kms_big_joiner@invalid-modeset:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#10656) +2 other tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:
> 
>           * shard-glk: NOTRUN -> SKIP +267 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +83 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +13 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#10278)
>           * shard-dg1: NOTRUN -> SKIP (i915#10278) +1 other test skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +152 other
>             tests skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +27 other tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
> 
>           * shard-snb: NOTRUN -> SKIP +51 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10278)
>      * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>             +6 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#10278)
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3742) +1 other test skip
>      * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7213) +4 other tests skip
>      * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4087) +3 other tests skip
>      * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7828) +6 other tests skip
>      * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7828) +9 other tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7828) +5 other tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-fast:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7828) +7 other tests skip
>      * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
> 
>           * shard-dg2: NOTRUN -> TIMEOUT (i915#7173)
>      * igt@kms_content_protection@content-type-change:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9424)
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3299)
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3116)
>           * shard-dg1: NOTRUN -> SKIP (i915#3299) +1 other test skip
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3299)
>      * igt@kms_content_protection@legacy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7116 / i915#9424)
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9424)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7118 / i915#9424) +1 other test
>             skip
>      * igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3359)
>      * igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3359) +1 other test skip
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3359)
>           * shard-dg1: NOTRUN -> SKIP (i915#3359) +4 other tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814) +1 other test skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814) +1 other test
>             skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +3 other tests skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213) +1 other test
>             skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9809) +2 other tests skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4103 / i915#4213)
>      * igt@kms_cursor_legacy@torture-bo@pipe-a:
> 
>           * shard-dg2: PASS -> DMESG-WARN (i915#10166)
>      * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9227)
>      * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9723)
>      * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9723)
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8827)
>      * igt@kms_display_modes@mst-extended-mode-negative:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8588)
>      * igt@kms_dp_aux_dev:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1257)
>           * shard-dg1: NOTRUN -> SKIP (i915#1257)
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3840 / i915#9688)
>      * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840)
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#3840) +1 other test
>             skip
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3840 / i915#9053)
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3469) +1 other test skip
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3469)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4854)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1839)
>           * shard-dg1: NOTRUN -> SKIP (i915#1839) +1 other test skip
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9337)
>           * shard-mtlp: NOTRUN -> SKIP (i915#9337)
>      * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP +12 other tests skip
>      * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637) +6 other tests skip
>      * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +4 other tests skip
>      * igt@kms_flip@flip-vs-fences:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8381)
>      * igt@kms_flip@flip-vs-fences-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8381)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8810)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672) +6 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +24 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-snb: PASS -> SKIP +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +14 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +12 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +35 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
> 
>           * shard-dg1: NOTRUN -> SKIP +51 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +23 other tests skip
>      * igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#10070)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +30 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +20 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +16 other tests skip
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228) +2 other tests
>             skip
>      * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9457) +3 other tests skip
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_plane_lowres@tiling-y:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8821)
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6953 / i915#9423)
>      * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#8292)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9423) +3 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9423) +3 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9423) +1 other test skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-dp-4:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235 / i915#9423) +7 other tests
>             skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5235) +7 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5235) +5 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5235) +6 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#5235)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235 / i915#9423 / i915#9728) +3
>             other tests skip
>      * igt@kms_pm_backlight@basic-brightness:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5354)
>      * igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9340)
>      * igt@kms_pm_lpsp@screens-disabled:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8430)
>           * shard-mtlp: NOTRUN -> SKIP (i915#8430)
>      * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-dg2: PASS -> SKIP (i915#9519) +1 other test skip
>      * igt@kms_prime@basic-crc-hybrid:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_psr2_sf@fbc-cursor-plane-update-sf@psr2-pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9808)
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4348)
>           * shard-dg1: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-pr-primary-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +19 other tests
>             skip
>      * igt@kms_psr@fbc-psr2-sprite-render:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +14 other tests
>             skip
>      * igt@kms_psr@pr-cursor-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9673 / i915#9732) +2
>             other tests skip
>      * igt@kms_psr@pr-sprite-blt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +8 other tests skip
>      * igt@kms_psr@psr2-sprite-blt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +30 other tests
>             skip
>      * igt@kms_psr@psr2-sprite-mmap-gtt@edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077 / i915#9688)
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9685) +1 other test skip
>      * igt@kms_rotation_crc@bad-pixel-format:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4235)
>      * igt@kms_rotation_crc@exhaust-fences:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4235)
>      * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4235 / i915#5190)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5289) +2 other tests skip
>      * igt@kms_scaling_modes@scaling-mode-full:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555)
>      * igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +7 other tests skip
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
> 
>           * shard-mtlp: PASS -> FAIL (i915#9196)
>      * igt@kms_vrr@flip-basic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8808)
>      * igt@kms_vrr@flip-basic-fastset:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8808 / i915#9906)
>           * shard-dg2: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_vrr@max-min:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9906) +1 other test skip
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#2437)
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2437)
>      * igt@perf@mi-rpc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2434)
>      * igt@perf@per-context-mode-unprivileged:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2435)
>           * shard-dg1: NOTRUN -> SKIP (i915#2433)
>      * igt@perf_pmu@frequency@gt0:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#6806)
>      * igt@perf_pmu@rc6-all-gts:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8516)
>           * shard-dg2: NOTRUN -> SKIP (i915#8516)
>      * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
> 
>           * shard-dg2: NOTRUN -> CRASH (i915#9351)
>      * igt@prime_vgem@basic-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3708 / i915#4077)
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3708)
>      * igt@prime_vgem@fence-flip-hang:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3708) +1 other test skip
>      * igt@prime_vgem@fence-read-hang:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3708)
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708)
>      * igt@syncobj_timeline@invalid-wait-zero-handles:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#9781)
>      * igt@syncobj_wait@invalid-wait-zero-handles:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#9779)
>      * igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2575) +7 other tests skip
>      * igt@v3d/v3d_perfmon@get-values-invalid-pointer:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2575) +19 other tests skip
>      * igt@v3d/v3d_submit_csd@valid-multisync-submission:
> 
>           * shard-rkl: NOTRUN -> SKIP +28 other tests skip
>      * igt@v3d/v3d_wait_bo@used-bo-1ns:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2575) +13 other tests skip
>      * igt@vc4/vc4_mmap@mmap-bad-handle:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7711) +13 other tests skip
>      * igt@vc4/vc4_perfmon@create-perfmon-exceed:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7711) +6 other tests skip
>      * igt@vc4/vc4_perfmon@get-values-invalid-perfmon:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7711) +4 other tests skip
>      * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7711) +3 other tests skip
> 
>     Possible fixes
> 
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-dg2: ABORT (i915#9846) -> PASS
>      * igt@gem_exec_endless@dispatch@bcs0:
> 
>           * shard-dg2: TIMEOUT (i915#3778 / i915#7016) -> PASS
>      * igt@gem_lmem_swapping@heavy-multi@lmem0:
> 
>           * shard-dg2: FAIL (i915#10378) -> PASS
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
> 
>           * shard-dg1: FAIL (i915#3591) -> PASS
>      * igt@i915_selftest@live@gem_contexts:
> 
>           * shard-dg1: INCOMPLETE -> PASS
>      * igt@kms_cursor_legacy@torture-move@pipe-a:
> 
>           * shard-dg2: DMESG-WARN (i915#10166) -> PASS
>      * igt@kms_flip@2x-wf_vblank-ts-check@ab-vga1-hdmi-a1:
> 
>           * shard-snb: FAIL (i915#2122) -> PASS
>      * igt@kms_flip@wf_vblank-ts-check@b-hdmi-a3:
> 
>           * shard-dg2: INCOMPLETE -> PASS
>      * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * shard-dg2: SKIP (i915#9519) -> PASS
> 
>     Warnings
> 
>      * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
> 
>           * shard-dg2: FAIL (i915#10446) -> FAIL (i915#10378)
>      * igt@gem_userptr_blits@relocations:
> 
>           * shard-mtlp: SKIP (i915#3281) -> SKIP (i915#3281 / i915#3297)
>           * shard-dg2: SKIP (i915#3281) -> SKIP (i915#3281 / i915#3297)
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-dg1: INCOMPLETE (i915#1982 / i915#9820 / i915#9849) ->
>             INCOMPLETE (i915#9820 / i915#9849)
>           * shard-mtlp: ABORT (i915#10131 / i915#9820) -> ABORT (i915#10131 /
>             i915#9697)
>      * igt@kms_content_protection@lic-type-1:
> 
>           * shard-snb: INCOMPLETE (i915#8816) -> SKIP
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#3458) -> SKIP (i915#3458) +5
>             other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
> 
>           * shard-dg2: SKIP (i915#3458) -> SKIP (i915#10433 / i915#3458) +2
>             other tests skip
>      * igt@kms_psr@fbc-pr-suspend:
> 
>           * shard-dg2: SKIP (i915#1072 / i915#9673 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732) +13 other tests skip
>      * igt@kms_psr@psr-dpms:
> 
>           * shard-dg2: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 /
>             i915#9673 / i915#9732) +2 other tests skip
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7871 -> IGTPW_11196
> 
>    CI-20190529: 20190529
>    CI_DRM_14826: 0f0c00c367c8a8621a07443664d5f9a266889e84 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_11196: 7485dd32b91812871816c7e7332ec0ff2b931097 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
