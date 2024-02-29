Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7941FC54798
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 12:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F18F10E1BF;
	Thu, 29 Feb 2024 12:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kBL/Vbpz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E47C10E195
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 12:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709209525; x=1740745525;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=KQlg7Vyv88uDNdWY0lELSlqCDfsOgENQpGD4C9XkAe8=;
 b=kBL/VbpzXS6p1zRvb0oP5mmZ9/WtGzbDfJKn8av/3B14DmSn2b8WTtLn
 MoyigEMlcq7HezY1C8w7AjZAX80xZ+yyURjdU0zwMLyI11ZZlgudlLK9y
 wbD3UenO5okljK2kPvjYNq+DKb4uf+fs5YcfgkUgR/hnmp7v7zghPIYXm
 +D927sbfOD54Yxj8Qmu4gH4UXDaQ0KhdZ8QyDl16Bm1AfnxhZVyr+r19y
 G57rCTCTGyZF2/3Z5x8pI3m3zn4YrD7V35olhTGYx1h9bnm16azRVogq3
 uf/7FR1vA+DtLZhIOdNpROa2SJAXpy1hYx0+QFOx9qvV3s1DUVKP3l046 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3520928"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3520928"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 04:25:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7683352"
Received: from gbretter-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.96.15])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 04:25:22 -0800
Date: Thu, 29 Feb 2024 13:25:19 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 intel-buf changes for xe render-copy tests
Message-ID: <20240229122519.p5ccsicavh7m4j4x@zkempczy-mobl2>
References: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
 <170920842552.396140.16541282971215242859@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170920842552.396140.16541282971215242859@8e613ede5ea5>
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

On Thu, Feb 29, 2024 at 12:07:05PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  intel-buf changes for xe render-copy tests                      
>    URL:     https://patchwork.freedesktop.org/series/130508/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10748/index.html 
> 
>           CI Bug Log - changes from IGT_7733_full -> IGTPW_10748_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_10748_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_10748_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10748/index.html
> 
> Participating hosts (8 -> 8)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_10748_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
> 
>           * shard-dg1: PASS -> INCOMPLETE

I've tested manually on dg1:

Subtest y-tiled-16bpp-rotate-180: SUCCESS (1,331s)

I assume then that above incomplete isn't related to the change.

--
Zbigniew

>      * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a2:
> 
>           * shard-rkl: NOTRUN -> INCOMPLETE
> 
>     Warnings
> 
>      * igt@api_intel_bb@render-ccs:
>           * shard-dg2: FAIL (i915#10288) -> FAIL
> 
> New tests
> 
>    New tests have been introduced between IGT_7733_full and IGTPW_10748_full:
> 
>   New IGT tests (16)
> 
>      * igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-dp-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [3.45] s
>      * igt@kms_cursor_edge_walk@128x128-left-edge@pipe-d-dp-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [3.33] s
>      * igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-dp-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [3.45] s
>      * igt@kms_cursor_edge_walk@64x64-top-edge@pipe-d-dp-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [3.33] s
>      * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-d-dp-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.75] s
>      * igt@kms_plane_cursor@primary@pipe-c-dp-4-size-128:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [3.50] s
>      * igt@kms_plane_cursor@primary@pipe-c-dp-4-size-256:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [3.42] s
>      * igt@kms_plane_cursor@primary@pipe-c-dp-4-size-64:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [3.57] s
>      * igt@kms_plane_cursor@primary@pipe-d-dp-4-size-128:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [3.43] s
>      * igt@kms_plane_cursor@primary@pipe-d-dp-4-size-256:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [3.50] s
>      * igt@kms_plane_cursor@primary@pipe-d-dp-4-size-64:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [3.54] s
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a-dp-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.09] s
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-dp-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.19] s
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c-dp-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.20] s
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d-dp-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.21] s
>      * igt@kms_rmfb@close-fd@pipe-c-dp-4:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.28] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_10748_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@blit-reloc-purge-cache:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8411) +1 other test skip
>      * igt@debugfs_test@basic-hwmon:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9318)
>           * shard-tglu: NOTRUN -> SKIP (i915#9318)
>      * igt@drm_fdinfo@busy-idle@vecs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8414) +5 other tests skip
>      * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8414) +20 other tests skip
>      * igt@gem_ctx_param@set-priority-not-supported:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109314)
>           * shard-rkl: NOTRUN -> SKIP (fdo#109314)
>      * igt@gem_ctx_persistence@engines-cleanup:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099)
>      * igt@gem_ctx_persistence@heartbeat-close:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@heartbeat-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8555) +1 other test skip
>      * igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5882) +9 other tests skip
>      * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5882) +5 other tests skip
>      * igt@gem_ctx_sseu@invalid-args:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#280)
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#280)
>           * shard-tglu: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-dg1: PASS -> FAIL (i915#5784) +1 other test fail
>      * igt@gem_exec_balancer@bonded-false-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812) +1 other test skip
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525) +1 other test skip
>      * igt@gem_exec_capture@capture-invisible@lmem0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6334) +1 other test skip
>      * igt@gem_exec_endless@dispatch@bcs0:
> 
>           * shard-dg2: NOTRUN -> TIMEOUT (i915#3778 / i915#7016)
>      * igt@gem_exec_fair@basic-flow:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +1 other test
>             skip
>      * igt@gem_exec_fair@basic-none@rcs0:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2842) +2 other tests fail
>      * igt@gem_exec_fair@basic-sync:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4473 / i915#4771)
>      * igt@gem_exec_fair@basic-throttle:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539)
>      * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +11 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-active:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281)
>      * igt@gem_exec_reloc@basic-wc-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +2 other tests skip
>      * igt@gem_exec_reloc@basic-write-wc-active:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281)
>      * igt@gem_exec_schedule@preempt-queue-chain:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_schedule@reorder-wide:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4537 / i915#4812) +1 other test
>             skip
>      * igt@gem_exec_suspend@basic-s0@lmem0:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE (i915#9275)
>      * igt@gem_exec_suspend@basic-s4-devices@lmem0:
> 
>           * shard-dg2: NOTRUN -> ABORT (i915#7975 / i915#8213)
>      * igt@gem_exec_suspend@basic-s4-devices@smem:
> 
>           * shard-rkl: NOTRUN -> ABORT (i915#7975 / i915#8213)
>      * igt@gem_fence_thrash@bo-copy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_fenced_exec_thrash@no-spare-fences:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_gtt_cpu_tlb:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +3 other tests skip
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2190)
>      * igt@gem_lmem_evict@dontneed-evict-race:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613 / i915#7582)
>      * igt@gem_lmem_swapping@basic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#4613) +1 other test
>             skip
>      * igt@gem_lmem_swapping@heavy-verify-random-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * shard-dg2: NOTRUN -> TIMEOUT (i915#5493)
>      * igt@gem_lmem_swapping@verify-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@verify-ccs@lmem0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4565)
>      * igt@gem_media_vme:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#284)
>           * shard-dg2: NOTRUN -> SKIP (i915#284)
>           * shard-tglu: NOTRUN -> SKIP (i915#284)
>      * igt@gem_mmap_gtt@zero-extend:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +19 other tests skip
>      * igt@gem_mmap_wc@write-gtt-read-wc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +1 other test skip
>      * igt@gem_mmap_wc@write-prefaulted:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +6 other tests skip
>      * igt@gem_mmap_wc@write-wc-read-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_partial_pwrite_pread@reads-uncached:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +8 other tests skip
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +3 other tests skip
>      * igt@gem_pxp@create-regular-buffer:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +5 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4270) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_readwrite@beyond-eob:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +2 other tests skip
>      * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +14 other tests skip
>      * igt@gem_render_copy@yf-tiled-to-vebox-linear:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +1 other test skip
>      * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_softpin@evict-snoop-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4885) +1 other test skip
>      * igt@gem_spin_batch@spin-all-new:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#5889)
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297) +3 other tests skip
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3323)
>      * igt@gem_userptr_blits@dmabuf-unsync:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_userptr_blits@forbidden-operations:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3282 / i915#3297)
>      * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@unsync-overlap:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gen3_render_tiledx_blits:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109289) +3 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (fdo#109289) +1 other test skip
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +1 other test skip
>      * igt@gen9_exec_parse@basic-rejected:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 other test
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856)
>      * igt@gen9_exec_parse@bb-oversize:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2527) +1 other test skip
>      * igt@gen9_exec_parse@valid-registers:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +7 other tests skip
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-tglu: NOTRUN -> INCOMPLETE (i915#10137)
>           * shard-glk: PASS -> INCOMPLETE (i915#10137 / i915#9849)
>           * shard-dg2: NOTRUN -> INCOMPLETE (i915#10137 / i915#9820 /
>             i915#9849)
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
> 
>           * shard-tglu: NOTRUN -> WARN (i915#2681) +3 other tests warn
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#3591) +1 other test fail
>      * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109293 / fdo#109506)
>      * igt@i915_pm_rps@basic-api:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6621)
>      * igt@i915_pm_rps@min-max-config-idle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6621) +1 other test skip
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6245)
>      * igt@i915_query@query-topology-unsupported:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109302)
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-rkl: PASS -> FAIL (i915#10031) +1 other test fail
>           * shard-tglu: NOTRUN -> INCOMPLETE (i915#7443)
>      * igt@i915_suspend@fence-restore-tiled2untiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +6 other tests skip
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7707)
>      * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4212) +1 other test skip
>      * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3826)
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8709) +11 other tests skip
>      * igt@kms_async_flips@invalid-async-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6228)
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +4 other tests
>             skip
>      * igt@kms_big_fb@4-tiled-addfb:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615 / i915#5286) +1 other test
>             skip
>      * igt@kms_big_fb@linear-16bpp-rotate-270:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111614) +3 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111614) +1 other test skip
>      * igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#111614) +1 other test skip
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111614 / i915#3638) +1 other test
>             skip
>      * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3638) +2 other tests skip
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111615) +3 other tests skip
>      * igt@kms_big_fb@y-tiled-addfb:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6187)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-tglu: PASS -> FAIL (i915#3743)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +15 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#110723)
>      * igt@kms_big_joiner@invalid-modeset:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2705) +1 other test skip
>      * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7213) +3 other tests skip
>      * igt@kms_cdclk@plane-scaling@pipe-d-dp-4:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4087) +3 other tests skip
>      * igt@kms_chamelium_audio@dp-audio-edid:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7828) +16 other tests skip
>      * igt@kms_chamelium_color@degamma:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#111827) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP (fdo#111827)
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111827)
>      * igt@kms_chamelium_edid@vga-edid-read:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7828) +3 other tests skip
>      * igt@kms_chamelium_frames@vga-frame-dump:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7828) +4 other tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-storm:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7828) +3 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7828) +2 other tests skip
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3116)
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3299)
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9424)
>      * igt@kms_content_protection@lic-type-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9424)
>      * igt@kms_content_protection@srm@pipe-a-dp-4:
> 
>           * shard-dg2: NOTRUN -> TIMEOUT (i915#7173)
>      * igt@kms_content_protection@type1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7118 / i915#9424) +1 other test
>             skip
>           * shard-rkl: NOTRUN -> SKIP (i915#7118 / i915#9424)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7116 / i915#9424)
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118 /
>             i915#9424)
>      * igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3359)
>           * shard-dg2: NOTRUN -> SKIP (i915#3359)
>      * igt@kms_cursor_crc@cursor-onscreen-32x32:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>      * igt@kms_cursor_crc@cursor-random-128x42:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814)
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3359)
>           * shard-tglu: NOTRUN -> SKIP (i915#3359) +1 other test skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +10 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-32x32:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814)
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274 / fdo#111767 / i915#5354)
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111825) +5 other tests skip
>      * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109274)
>           * shard-mtlp: NOTRUN -> SKIP (i915#9809) +1 other test skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213) +1 other test
>             skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274 / i915#5354) +10 other
>             tests skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_cursor_legacy@single-move@pipe-a:
> 
>           * shard-rkl: PASS -> DMESG-WARN (i915#10166)
>      * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9833)
>      * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#110189 / i915#9227)
>           * shard-rkl: NOTRUN -> SKIP (fdo#110189 / i915#9723)
>      * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#110189 / i915#9723)
>      * igt@kms_display_modes@mst-extended-mode-negative:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8588)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3840 / i915#9688)
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840)
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1839) +1 other test skip
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9337)
>           * shard-rkl: NOTRUN -> SKIP (i915#9337)
>      * igt@kms_fence_pin_leak:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4881)
>      * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109274 / i915#3637 / i915#3966)
>      * igt@kms_flip@2x-flip-vs-expired-vblank:
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#111825 / i915#9934)
>           * shard-tglu: NOTRUN -> SKIP (fdo#109274 / i915#3637)
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274 / fdo#111767)
>      * igt@kms_flip@2x-flip-vs-panning-vs-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109274) +5 other tests skip
>      * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:
> 
>           * shard-glk: PASS -> FAIL (i915#79)
>      * igt@kms_flip@flip-vs-fences-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8381) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#8381)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672)
>      * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8810)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +5 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
> 
>           * shard-snb: PASS -> SKIP (fdo#109271 / fdo#111767)
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +15 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#111825) +17 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-rte:
> 
>           * shard-snb: PASS -> SKIP (fdo#109271) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#111767 / i915#1825) +1 other test
>             skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#10055)
>           * shard-dg2: NOTRUN -> SKIP (i915#10055)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#110189) +10 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#111767 / i915#5354) +1 other test
>             skip
>           * shard-rkl: NOTRUN -> SKIP (fdo#111767 / fdo#111825 / i915#1825)
>             +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +39 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109280 / fdo#111767)
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +114 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109280) +18 other tests skip
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9766)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +23 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +8 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111825 / i915#1825) +14 other
>             tests skip
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228) +2 other tests
>             skip
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +22 other tests skip
>           * shard-dg2: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
> 
>           * shard-mtlp: NOTRUN -> SKIP (fdo#109289) +1 other test skip
>      * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#109289) +2 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-dp-4:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9423) +11 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9423) +27 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9423) +7 other tests skip
>      * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9423) +1 other test skip
>      * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5176 / i915#9423) +3 other tests
>             skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5235) +7 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5235) +3 other tests skip
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235 / i915#9423) +19 other tests
>             skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5235) +11 other tests skip
>      * igt@kms_pm_backlight@fade:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9812)
>           * shard-dg1: NOTRUN -> SKIP (i915#5354)
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5978)
>           * shard-rkl: NOTRUN -> SKIP (i915#3361)
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-dg2: PASS -> SKIP (i915#9519)
>           * shard-rkl: PASS -> SKIP (i915#9519) +3 other tests skip
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9519) +1 other test skip
>      * igt@kms_pm_rpm@modeset-pc8-residency-stress:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109293 / fdo#109506)
>      * igt@kms_prime@basic-modeset-hybrid:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6524 / i915#6805)
>      * igt@kms_prime@d3hot:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#110189) +4 other tests skip
>      * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#110189) +4 other
>             tests skip
>      * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#110189) +1 other test skip
>      * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#110189) +1 other test skip
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#111068 / i915#9683)
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9683) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (fdo#111068 / i915#9683)
>      * igt@kms_psr@fbc-pr-cursor-plane-move:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +5 other tests skip
>      * igt@kms_psr@fbc-psr2-cursor-blt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9732) +8 other tests skip
>      * igt@kms_psr@pr-sprite-plane-onoff:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +11 other tests skip
>      * igt@kms_psr@psr-cursor-mmap-cpu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9732) +18 other tests skip
>      * igt@kms_psr@psr-primary-mmap-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9732) +7 other tests skip
>      * igt@kms_psr@psr2-cursor-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9673 / i915#9732) +5 other tests
>             skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#8875 / i915#9569)
>      * igt@kms_rotation_crc@sprite-rotation-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4235) +1 other test skip
>      * igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +1 other test skip
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8623) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
> 
>           * shard-snb: PASS -> FAIL (i915#9196)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#9196) +3 other tests fail
>      * igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2437 / i915#9412)
>      * igt@perf@unprivileged-single-ctx-counters:
> 
>           * shard-dg1: NOTRUN -> SKIP (fdo#109289 / i915#2433)
>      * igt@perf_pmu@busy-double-start@ccs0:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#4349)
>      * igt@perf_pmu@cpu-hotplug:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8850)
>      * igt@perf_pmu@module-unload:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#5793)
>      * igt@perf_pmu@rc6-all-gts:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8516)
>           * shard-rkl: NOTRUN -> SKIP (i915#8516)
>      * igt@prime_udl:
> 
>           * shard-dg2: NOTRUN -> SKIP (fdo#109291)
>           * shard-rkl: NOTRUN -> SKIP (fdo#109291)
>      * igt@prime_vgem@basic-fence-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708)
>      * igt@prime_vgem@basic-write:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3291 / i915#3708) +1 other test
>             skip
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708 / i915#4077)
>      * igt@prime_vgem@fence-flip-hang:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3708)
>           * shard-tglu: NOTRUN -> SKIP (fdo#109295)
>      * igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9917)
>           * shard-tglu: NOTRUN -> SKIP (i915#9917)
>      * igt@syncobj_timeline@invalid-wait-zero-handles:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#9781)
>           * shard-dg1: NOTRUN -> FAIL (i915#9781)
>           * shard-glk: NOTRUN -> FAIL (i915#9781)
>      * igt@v3d/v3d_perfmon@get-values-invalid-pointer:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2575) +3 other tests skip
>      * igt@v3d/v3d_submit_cl@multisync-out-syncs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2575) +19 other tests skip
>      * igt@v3d/v3d_submit_cl@single-out-sync:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109315 / i915#2575) +4 other
>             tests skip
>      * igt@v3d/v3d_submit_csd@bad-extension:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2575) +4 other tests skip
>      * igt@v3d/v3d_submit_csd@bad-multisync-extension:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109315) +7 other tests skip
>      * igt@vc4/vc4_label_bo@set-bad-name:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7711) +3 other tests skip
>      * igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7711) +1 other test skip
>      * igt@vc4/vc4_tiling@get-bad-modifier:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7711) +9 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#7711) +2 other tests skip
>      * igt@vc4/vc4_tiling@set-bad-flags:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2575) +3 other tests skip
> 
>     Possible fixes
> 
>      * igt@drm_fdinfo@most-busy-check-all@rcs0:
> 
>           * shard-rkl: FAIL (i915#7742) -> PASS
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-tglu: FAIL (i915#2842) -> PASS +1 other test pass
>      * igt@gem_exec_fair@basic-pace@vecs0:
> 
>           * shard-rkl: FAIL (i915#2842) -> PASS +3 other tests pass
>      * igt@gem_exec_suspend@basic-s0@smem:
> 
>           * shard-dg2: INCOMPLETE (i915#9275) -> PASS
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-glk: INCOMPLETE (i915#10137 / i915#5566) -> PASS
>      * igt@i915_selftest@live@execlists:
> 
>           * shard-dg1: INCOMPLETE (i915#10137) -> PASS
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-snb: INCOMPLETE (i915#10044) -> PASS
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-tglu: FAIL (i915#3743) -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-glk: FAIL (i915#2346) -> PASS
>      * igt@kms_flip@2x-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
> 
>           * shard-snb: INCOMPLETE -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
> 
>           * shard-snb: SKIP (fdo#109271) -> PASS +11 other tests pass
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-snb: SKIP (fdo#109271 / fdo#111767) -> PASS
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-dg2: SKIP (i915#9519) -> PASS
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-rkl: SKIP (i915#9519) -> PASS +2 other tests pass
>      * igt@perf@enable-disable@0-rcs0:
> 
>           * shard-dg2: FAIL (i915#8724) -> PASS
> 
>     Warnings
> 
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-snb: INCOMPLETE (i915#9878) -> SKIP (fdo#109271)
>      * igt@kms_content_protection@srm:
> 
>           * shard-snb: SKIP (fdo#109271) -> INCOMPLETE (i915#8816)
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-snb: SKIP (fdo#109271 / fdo#111767) -> SKIP (fdo#109271) +2
>             other tests skip
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-rkl: SKIP (i915#4070 / i915#4816) -> SKIP (i915#4816)
>      * igt@kms_psr@fbc-psr-cursor-blt:
> 
>           * shard-dg2: SKIP (i915#9673 / i915#9732) -> SKIP (i915#9732) +8
>             other tests skip
>      * igt@kms_psr@psr2-primary-mmap-gtt:
> 
>           * shard-dg2: SKIP (i915#9732) -> SKIP (i915#9673 / i915#9732) +10
>             other tests skip
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7733 -> IGTPW_10748
> 
>    CI-20190529: 20190529
>    CI_DRM_14360: 3bdccc6629ee909a167daedd6a8b75f6967ab726 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_10748:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10748/index.html
>    IGT_7733: aef5f474230d00901e4e80da00ce696eb99f71e5 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
