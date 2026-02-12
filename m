Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B77EB491F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 12:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51D110E262;
	Thu, 12 Feb 2026 12:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jOwtnSNc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E913310E262
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 12:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770900906; x=1802436906;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=AcxOKj5zWkkKhwzHuk8zzxcPIPpRUzO8jlO/P5wp3JA=;
 b=jOwtnSNc99Y3DfsoKTWVz7oTP/4DQRNujXSmp5GfAMOW48ylUNAn+LCl
 DRjh4PWBheJhXyoIBw9sStKkyzFK3kTZDnQ1ab8FjjADbdMrY4GlXKN1o
 kVVdrWkEFnV1cEBESPheAdd9SXPoZuhJS8qaC94wh70RZsleSpltN+EIe
 3O8En7Tkdk4DjIun/oPmK2vGxF8RslIHFk2NXut8I3zLDxpsVC5ITByHj
 MTyDsJ3TZogk+mv2MPvIYsOs+N81F3lkL6IZ9IgX3lHimYPBg/h0yncHV
 Q5+y+SQptL4Axmpf7k3osk/gpMpYPFkBuQtRt6K35homw0TtEuNce61GK A==;
X-CSE-ConnectionGUID: i9Z69yQPRuCAYSJSQ+MRug==
X-CSE-MsgGUID: iCP6nB1jS8CMjrxS8dEpEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="83167654"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="83167654"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 04:55:06 -0800
X-CSE-ConnectionGUID: MG3RXvK1RHW4rTjSHQNwmA==
X-CSE-MsgGUID: SGtqxPh6R7W/c8xQj0WtxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="217068803"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.107])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 04:55:04 -0800
Date: Thu, 12 Feb 2026 13:55:02 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib=2Fint?=
 =?utf-8?Q?el=5Fcompute=3A?= Add compute and preemption support for NVL-P
Message-ID: <f7lfdshoy3wzvj6zsm3naahisar5mvmugta3txnx454m5remjd@kuidvunwcryd>
References: <20260209120622.235501-2-zbigniew.kempczynski@intel.com>
 <177072331003.241779.11378962523992449405@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177072331003.241779.11378962523992449405@a3b018990fe9>
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

On Tue, Feb 10, 2026 at 11:35:10AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/intel_compute: Add compute and preemption support for NVL-P 
>    URL:     https://patchwork.freedesktop.org/series/161353/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14518/index.html 
> 
>         CI Bug Log - changes from CI_DRM_17964_full -> IGTPW_14518_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_14518_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_14518_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14518/index.html
> 
> Participating hosts (10 -> 10)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_14518_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_eio@in-flight-contexts-immediate:
> 
>           * shard-dg2: PASS -> DMESG-WARN
>      * igt@kms_cursor_crc@cursor-sliding-64x64:
> 
>           * shard-mtlp: PASS -> DMESG-WARN +1 other test dmesg-warn

Unrelated to the change.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between CI_DRM_17964_full and
>    IGTPW_14518_full:
> 
>   New IGT tests (5)
> 
>      * igt@gem_ctx_isolation@preservation@vecs1:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.42] s
>      * igt@gem_ctx_shared@q-in-order@vecs1:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.19] s
>      * igt@gem_exec_schedule@lateslice@vecs1:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.02] s
>      * igt@gem_wait@write-wait@vecs1:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.06] s
>      * igt@perf_pmu@busy@vecs1:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.56] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_14518_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@crc32:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6230)
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8411) +1 other test skip
>      * igt@api_intel_bb@object-reloc-purge-cache:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8411)
>           * shard-dg2: NOTRUN -> SKIP (i915#8411)
>           * shard-rkl: NOTRUN -> SKIP (i915#8411)
>      * igt@device_reset@unbind-cold-reset-rebind:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11078)
>      * igt@gem_ccs@ctrl-surf-copy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3555 / i915#9323)
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_ccs@large-ctrl-surf-copy:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13008)
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-dg2: PASS -> INCOMPLETE (i915#13356)
>      * igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-lmem0-lmem0:
> 
>           * shard-dg2: PASS -> INCOMPLETE (i915#12392 / i915#13356)
>      * igt@gem_close_race@multigpu-basic-process:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6335)
>           * shard-rkl: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_ctx_isolation@preservation-s3:
> 
>           * shard-rkl: PASS -> ABORT (i915#15131) +1 other test abort
>      * igt@gem_ctx_persistence@idempotent:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#1099)
>      * igt@gem_ctx_sseu@invalid-args:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#280)
>      * igt@gem_ctx_sseu@mmap-args:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@kms:
> 
>           * shard-rkl: PASS -> DMESG-WARN (i915#13363)
>           * shard-tglu: PASS -> DMESG-WARN (i915#13363)
>      * igt@gem_eio@reset-stress@blt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15314)
>      * igt@gem_exec_balancer@bonded-true-hang:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4812) +1 other test skip
>      * igt@gem_exec_balancer@noheartbeat:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8555)
>           * shard-dg1: NOTRUN -> SKIP (i915#8555)
>           * shard-mtlp: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_exec_balancer@parallel:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525) +2 other tests skip
>      * igt@gem_exec_balancer@parallel-balancer:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_capture@capture-invisible@lmem0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6334) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#6334) +2 other tests skip
>      * igt@gem_exec_capture@capture-invisible@smem0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6334) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP (i915#6334) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#6334) +1 other test skip
>      * igt@gem_exec_flush@basic-batch-kernel-default-wb:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852) +1 other test
>             skip
>      * igt@gem_exec_params@secure-non-root:
> 
>           * shard-dg2: NOTRUN -> SKIP +2 other tests skip
>      * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +3 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +6 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-noreloc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +4 other tests skip
>      * igt@gem_exec_reloc@basic-write-read-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +16 other tests skip
>      * igt@gem_exec_schedule@semaphore-power:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7276)
>      * igt@gem_fence_thrash@bo-write-verify-none:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4860) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_fenced_exec_thrash@no-spare-fences:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4860) +2 other tests skip
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2190)
>           * shard-glk: NOTRUN -> SKIP (i915#2190)
>      * igt@gem_lmem_swapping@heavy-verify-multi:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@parallel-multi:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_lmem_swapping@parallel-random:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +5 other tests skip
>      * igt@gem_lmem_swapping@parallel-random-engines:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#4613)
>      * igt@gem_lmem_swapping@parallel-random-verify:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@verify-ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#12193)
>      * igt@gem_lmem_swapping@verify-ccs@lmem0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4565)
>      * igt@gem_madvise@dontneed-before-pwrite:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3282)
>      * igt@gem_mmap@bad-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +1 other test skip
>      * igt@gem_mmap_gtt@basic-read-write-distinct:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +4 other tests skip
>      * igt@gem_mmap_wc@pf-nonblock:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +1 other test skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +4 other tests skip
>      * igt@gem_pxp@hw-rejects-pxp-buffer:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13398)
>           * shard-mtlp: NOTRUN -> SKIP (i915#13398)
>      * igt@gem_pxp@reject-modify-context-protection-off-1:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_tiled_pread_basic@basic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15656)
>      * igt@gem_tiled_pread_pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079)
>           * shard-dg1: NOTRUN -> SKIP (i915#4079)
>           * shard-mtlp: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_userptr_blits@access-control:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297)
>           * shard-dg2: NOTRUN -> SKIP (i915#3297)
>           * shard-dg1: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#3323)
>      * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@sd-probe:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4958)
>      * igt@gem_userptr_blits@unsync-overlap:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_workarounds@suspend-resume:
> 
>           * shard-glk: PASS -> INCOMPLETE (i915#13356 / i915#14586)
>      * igt@gem_workarounds@suspend-resume-fd:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#13356) +1 other test
>             incomplete
>      * igt@gen9_exec_parse@basic-rejected:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +2 other tests
>             skip
>      * igt@gen9_exec_parse@bb-oversize:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP (i915#2856)
>      * igt@gen9_exec_parse@bb-start-cmd:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2527) +1 other test skip
>      * igt@gen9_exec_parse@shadow-peek:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 other
>             test skip
>      * igt@i915_drm_fdinfo@busy-idle@bcs0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#14073) +11 other tests skip
>      * igt@i915_drm_fdinfo@virtual-busy-all:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#14118)
>      * igt@i915_drm_fdinfo@virtual-busy-idle-all:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#14118)
>      * igt@i915_pm_freq_api@freq-basic-api:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#8399)
>      * igt@i915_pm_freq_api@freq-reset:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#8399)
>      * igt@i915_pm_freq_api@freq-reset-multiple:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#8399) +1 other test skip
>      * igt@i915_pm_freq_mult@media-freq@gt0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6590) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP (i915#6590) +1 other test skip
>      * igt@i915_pm_rc6_residency@media-rc6-accuracy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544) +5 other tests skip
>      * igt@i915_pm_rc6_residency@rc6-idle:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14498)
>      * igt@i915_pm_rpm@system-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13356)
>      * igt@i915_pm_rps@reset:
> 
>           * shard-mtlp: PASS -> FAIL (i915#15365)
>      * igt@i915_pm_rps@thresholds-park:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11681)
>           * shard-dg1: NOTRUN -> SKIP (i915#11681)
>           * shard-mtlp: NOTRUN -> SKIP (i915#11681)
>      * igt@i915_suspend@fence-restore-tiled2untiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +5 other tests skip
>      * igt@intel_hwmon@hwmon-read:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7707)
>           * shard-mtlp: NOTRUN -> SKIP (i915#7707)
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#7707)
>      * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12454 / i915#12712)
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555)
>           * shard-dg2: NOTRUN -> SKIP (i915#9531)
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#9531)
>           * shard-dg1: NOTRUN -> SKIP (i915#9531)
>           * shard-tglu: NOTRUN -> SKIP (i915#9531)
>      * igt@kms_atomic_transition@plane-all-modeset-transition:
> 
>           * shard-dg2: PASS -> FAIL (i915#5956)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#5956)
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>      * igt@kms_big_fb@4-tiled-addfb:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5286)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5286) +1 other test skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +3 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-mtlp: PASS -> FAIL (i915#5138)
>      * igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638) +2 other tests skip
>      * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3828)
>      * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3828) +1 other test skip
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#4423)
>      * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +1 other test
>             skip
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538) +3 other tests skip
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6095) +44 other tests skip
>      * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +133 other
>             tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12313)
>           * shard-dg2: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6095) +31 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12313) +1 other test skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +212 other tests skip
>      * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +54 other tests skip
>      * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#6095) +45 other
>             tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#14544 / i915#6095)
>             +3 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12313) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#12313) +1 other test skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-glk10: NOTRUN -> SKIP +43 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#6095) +4 other tests
>             skip
>      * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>             +2 other tests skip
>      * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +72 other tests skip
>      * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +19 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12313 / i915#14544)
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3742)
>           * shard-tglu: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13783) +3 other tests skip
>      * igt@kms_chamelium_edid@hdmi-edid-read:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11151 / i915#7828) +5 other
>             tests skip
>      * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11151 / i915#7828) +5 other
>             tests skip
>      * igt@kms_chamelium_frames@dp-crc-single:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11151 / i915#7828) +7 other tests
>             skip
>      * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#7828) +3 other tests
>             skip
>      * igt@kms_chamelium_hpd@dp-hpd-fast:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#14544 / i915#7828)
>      * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11151 / i915#7828) +1 other test
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#11151 / i915#7828) +1 other test
>             skip
>      * igt@kms_color@deep-color:
> 
>           * shard-dg2: PASS -> SKIP (i915#12655 / i915#3555)
>      * igt@kms_content_protection@atomic:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#9424) +1
>             other test skip
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15330 / i915#3116 / i915#3299)
>             +1 other test skip
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15330 / i915#3299)
>           * shard-rkl: NOTRUN -> SKIP (i915#15330 / i915#3116)
>           * shard-dg1: NOTRUN -> SKIP (i915#15330 / i915#3299)
>           * shard-mtlp: NOTRUN -> SKIP (i915#15330 / i915#3299)
>      * igt@kms_content_protection@dp-mst-type-0-hdcp14:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15330)
>      * igt@kms_content_protection@legacy-hdcp14:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6944)
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6944 / i915#9424)
>      * igt@kms_content_protection@suspend-resume:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6944)
>           * shard-mtlp: NOTRUN -> SKIP (i915#6944)
>      * igt@kms_content_protection@type1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118 /
>             i915#9424) +1 other test skip
>      * igt@kms_content_protection@uevent:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6944 / i915#9424)
>           * shard-dg2: NOTRUN -> SKIP (i915#6944 / i915#7118 / i915#9424)
>           * shard-rkl: NOTRUN -> SKIP (i915#6944 / i915#7118 / i915#9424)
>      * igt@kms_cursor_crc@cursor-offscreen-32x10:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13049) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#13049 / i915#14544)
>      * igt@kms_cursor_crc@cursor-offscreen-max-size:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814)
>      * igt@kms_cursor_crc@cursor-onscreen-128x42:
> 
>           * shard-tglu: PASS -> FAIL (i915#13566) +3 other tests fail
>      * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#13566) +3 other tests fail
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +3 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-128x42:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814)
>      * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#13566) +1 other test fail
>      * igt@kms_cursor_crc@cursor-sliding-64x21:
> 
>           * shard-rkl: PASS -> FAIL (i915#13566)
>      * igt@kms_cursor_crc@cursor-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12358 / i915#14152 /
>             i915#7882)
>      * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12358 / i915#14152)
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP +16 other tests skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4103) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4103 / i915#4213)
>           * shard-tglu: NOTRUN -> SKIP (i915#4103) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4213)
>           * shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213)
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13046 / i915#5354) +1 other test
>             skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9809) +2 other tests skip
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2346)
>      * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9723)
>      * igt@kms_dp_aux_dev:
> 
>           * shard-dg2: PASS -> SKIP (i915#1257)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#1257)
>      * igt@kms_dp_link_training@non-uhbr-mst:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13749)
>      * igt@kms_dp_link_training@non-uhbr-sst:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13749)
>      * igt@kms_dp_link_training@uhbr-mst:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13748)
>      * igt@kms_draw_crc@draw-method-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8812)
>      * igt@kms_dsc@dsc-basic:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#3840)
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3955)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3469)
>           * shard-dg1: NOTRUN -> SKIP (i915#3469)
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9337)
>      * igt@kms_feature_discovery@psr1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#658)
>      * igt@kms_flip@2x-absolute-wf_vblank:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#9934) +2 other tests
>             skip
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>           * shard-glk10: NOTRUN -> INCOMPLETE (i915#12745 / i915#4839)
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>           * shard-glk10: NOTRUN -> INCOMPLETE (i915#4839)
>      * igt@kms_flip@2x-modeset-vs-vblank-race:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9934) +2 other tests skip
>      * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#9934) +4 other tests
>             skip
>      * igt@kms_flip@2x-plain-flip-ts-check:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3637 / i915#9934)
>      * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +1 other test skip
>      * igt@kms_flip@flip-vs-suspend:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#6113)
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12745 / i915#4839 /
>             i915#6113)
>      * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12745 / i915#6113)
>      * igt@kms_flip@flip-vs-suspend@a-hdmi-a2:
> 
>           * shard-rkl: NOTRUN -> INCOMPLETE (i915#6113)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15643) +6 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8810 / i915#8813)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8810 / i915#8813)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15643) +2 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15643) +4 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15643) +4 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15643) +2 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15643)
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
> 
>           * shard-dg2: PASS -> FAIL (i915#15389 / i915#6880)
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#15389 / i915#6880)
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +13 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-rkl: PASS -> ABORT (i915#15132)
>           * shard-glk10: NOTRUN -> INCOMPLETE (i915#10056)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15104)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15102) +15 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15102 / i915#3023)
>             +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15102 / i915#3023) +16 other
>             tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#15102 / i915#3458) +10 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +31 other tests skip
>           * shard-dg1: NOTRUN -> SKIP +23 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#1825) +3 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +33 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5439)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10055)
>           * shard-mtlp: NOTRUN -> SKIP (i915#10055)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15102) +1 other test skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15102)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15102) +14 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +12 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15102 / i915#3458) +2 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10433 / i915#15102 / i915#3458)
>             +1 other test skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +8 other tests skip
>      * igt@kms_hdmi_inject@inject-audio:
> 
>           * shard-tglu: PASS -> SKIP (i915#13030)
>      * igt@kms_hdr@bpc-switch-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228) +3 other tests
>             skip
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228)
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12713)
>      * igt@kms_hdr@static-swap:
> 
>           * shard-dg2: PASS -> SKIP (i915#3555 / i915#8228)
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>      * igt@kms_invalid_mode@clock-too-high:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#6403 / i915#8826)
>      * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9457) +2 other tests skip
>      * igt@kms_invalid_mode@clock-too-high@pipe-d-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8826 / i915#9457)
>      * igt@kms_joiner@basic-force-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15459)
>      * igt@kms_joiner@basic-max-non-joiner:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#13688)
>      * igt@kms_joiner@invalid-modeset-big-joiner:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15460)
>      * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15458)
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
> 
>           * shard-mtlp: NOTRUN -> SKIP +5 other tests skip
>      * igt@kms_pipe_crc_basic@suspend-read-crc:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#12756 / i915#13476)
>      * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> INCOMPLETE (i915#13476)
>      * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14712)
>      * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15608 / i915#15609 /
>             i915#8825)
>      * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-7:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15609)
>      * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-7:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15609 / i915#8825)
>      * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15608 / i915#8825) +7 other tests
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#15608 / i915#8825) +1 other test
>             skip
>      * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15608) +8 other tests skip
>      * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-3:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15608) +23 other tests skip
>      * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-5:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15608) +4 other tests skip
>      * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15608) +5 other tests skip
>           * shard-dg2: NOTRUN -> SKIP (i915#15608 / i915#8825) +1 other test
>             skip
>      * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-7:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15608 / i915#8825) +3 other
>             tests skip
>      * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15608 / i915#8825) +1 other
>             test skip
>      * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15608 / i915#15609 / i915#8825)
>      * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15609)
>      * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15609 / i915#8825)
>      * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-5:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15608) +12 other tests skip
>      * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15608 / i915#15609 / i915#8825)
>      * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-7:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15609 / i915#8825)
>      * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-7:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15609) +2 other tests skip
>      * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-7:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15609) +1 other test skip
>      * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15608 / i915#8825)
>             +1 other test skip
>      * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15608)
>      * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-3:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15608) +19 other tests skip
>      * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#10226 / i915#11614 / i915#3582)
>             +2 other tests skip
>      * igt@kms_plane_lowres@tiling-none@pipe-d-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#11614 / i915#3582) +1 other test
>             skip
>      * igt@kms_plane_multiple@tiling-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#14259)
>      * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15329) +3 other tests skip
>      * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15329) +9 other tests skip
>      * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15329 / i915#3555)
>      * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15329) +2 other
>             tests skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
> 
>           * shard-snb: NOTRUN -> SKIP +77 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#15329) +7 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15329 / i915#3555 / i915#6953)
>             +1 other test skip
>      * igt@kms_pm_backlight@basic-brightness:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9812)
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12343)
>      * igt@kms_pm_backlight@fade-with-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP (i915#9812)
>      * igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_pm_dc@dc9-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4281)
>      * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-dg1: PASS -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@dpms-non-lpsp:
> 
>           * shard-dg2: PASS -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@fences:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +12 other tests skip
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-rkl: PASS -> SKIP (i915#15073) +3 other tests skip
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@system-suspend-modeset:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#10553)
>      * igt@kms_prime@basic-modeset-hybrid:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6524 / i915#6805)
>           * shard-rkl: NOTRUN -> SKIP (i915#6524)
>           * shard-dg1: NOTRUN -> SKIP (i915#6524)
>           * shard-tglu: NOTRUN -> SKIP (i915#6524)
>           * shard-mtlp: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#11520) +13 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11520) +1 other test skip
>           * shard-snb: NOTRUN -> SKIP (i915#11520) +1 other test skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9808)
>      * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11520) +7 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#12316) +2 other tests skip
>      * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11520) +8 other tests skip
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9683)
>           * shard-dg1: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-psr-no-drrs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +18 other tests skip
>      * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
> 
>           * shard-glk: NOTRUN -> SKIP +523 other tests skip
>      * igt@kms_psr@pr-dpms:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +3 other tests skip
>      * igt@kms_psr@psr-cursor-plane-onoff:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +9 other tests
>             skip
>      * igt@kms_psr@psr-sprite-plane-onoff:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +14 other tests
>             skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9732) +13 other tests skip
>      * igt@kms_psr@psr2-sprite-plane-onoff:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732)
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9685)
>           * shard-dg2: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_rotation_crc@multiplane-rotation:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#15492)
>      * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#15500)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_scaling_modes@scaling-mode-full-aspect:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>           * shard-dg2: NOTRUN -> SKIP (i915#3555)
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#4423)
>      * igt@kms_selftest@drm_framebuffer:
> 
>           * shard-glk: NOTRUN -> ABORT (i915#13179) +1 other test abort
>      * igt@kms_setmode@basic:
> 
>           * shard-snb: PASS -> FAIL (i915#15106) +2 other tests fail
>      * igt@kms_vrr@seamless-rr-switch-drrs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_vrr@seamless-rr-switch-vrr:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9906)
>      * igt@perf@non-zero-reason@0-rcs0:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#9100) +1 other test fail
>      * igt@perf_pmu@semaphore-busy@vcs1:
> 
>           * shard-mtlp: PASS -> FAIL (i915#4349) +4 other tests fail
>      * igt@prime_vgem@basic-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3708 / i915#4077)
>      * igt@prime_vgem@basic-write:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3291 / i915#3708) +1 other test
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#10216 / i915#3708)
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-tglu: NOTRUN -> SKIP +59 other tests skip
>      * igt@sriov_basic@bind-unbind-vf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9917)
>           * shard-rkl: NOTRUN -> SKIP (i915#9917)
>           * shard-dg1: NOTRUN -> SKIP (i915#9917)
>      * igt@sriov_basic@bind-unbind-vf@vf-4:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#12910) +9 other tests fail
>      * igt@sriov_basic@bind-unbind-vf@vf-5:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#12910) +9 other tests fail
>      * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>           * shard-tglu-1: NOTRUN -> FAIL (i915#12910)
>      * igt@tools_test@sysfs_l3_parity:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4818)
> 
>     Possible fixes
> 
>      * igt@gem_exec_big@single:
> 
>           * shard-tglu-1: ABORT (i915#11713) -> PASS
>      * igt@gem_exec_suspend@basic-s3-devices:
> 
>           * shard-rkl: ABORT (i915#15131) -> PASS +1 other test pass
>      * igt@gem_exec_suspend@basic-s3-devices@smem:
> 
>           * shard-rkl: ABORT (i915#15542) -> PASS
>      * igt@gem_mmap_offset@clear-via-pagefault:
> 
>           * shard-mtlp: ABORT (i915#14809) -> PASS +1 other test pass
>      * igt@gem_pxp@protected-raw-src-copy-not-readible:
> 
>           * shard-rkl: SKIP (i915#4270) -> PASS
>      * igt@i915_module_load@resize-bar:
> 
>           * shard-dg2: DMESG-WARN (i915#14545) -> PASS
>      * igt@i915_suspend@fence-restore-untiled:
> 
>           * shard-rkl: INCOMPLETE (i915#4817) -> PASS +1 other test pass
>      * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: FAIL (i915#13566) -> PASS +1 other test pass
>      * igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>           * shard-tglu-1: FAIL (i915#13566) -> PASS +1 other test pass
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-glk: FAIL (i915#15588 / i915#2346) -> PASS
>      * igt@kms_hdmi_inject@inject-4k:
> 
>           * shard-mtlp: SKIP -> PASS
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-dg1: SKIP (i915#15073) -> PASS +2 other tests pass
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-dg2: SKIP (i915#15073) -> PASS +1 other test pass
>      * igt@kms_setmode@basic@pipe-b-edp-1:
> 
>           * shard-mtlp: FAIL (i915#15106) -> PASS +2 other tests pass
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-mtlp: FAIL (i915#15420) -> PASS +1 other test pass
>      * igt@perf_pmu@all-busy-idle-check-all:
> 
>           * shard-mtlp: FAIL (i915#15453) -> PASS
>      * igt@perf_pmu@most-busy-check-all:
> 
>           * shard-rkl: FAIL (i915#4349) -> PASS +1 other test pass
> 
>     Warnings
> 
>      * igt@api_intel_bb@blit-reloc-keep-cache:
> 
>           * shard-rkl: SKIP (i915#8411) -> SKIP (i915#14544 / i915#8411)
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-rkl: SKIP (i915#11078) -> SKIP (i915#11078 / i915#14544)
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-rkl: SKIP (i915#6335) -> SKIP (i915#14544 / i915#6335)
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4525) -> SKIP (i915#4525)
>      * igt@gem_exec_capture@capture-recoverable:
> 
>           * shard-rkl: SKIP (i915#6344) -> SKIP (i915#14544 / i915#6344)
>      * igt@gem_exec_reloc@basic-softpin:
> 
>           * shard-rkl: SKIP (i915#3281) -> SKIP (i915#14544 / i915#3281) +5
>             other tests skip
>      * igt@gem_lmem_swapping@heavy-verify-random:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4613) -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@random:
> 
>           * shard-rkl: SKIP (i915#4613) -> SKIP (i915#14544 / i915#4613) +1
>             other test skip
>      * igt@gem_partial_pwrite_pread@reads:
> 
>           * shard-rkl: SKIP (i915#3282) -> SKIP (i915#14544 / i915#3282) +2
>             other tests skip
>      * igt@gem_pread@display:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3282) -> SKIP (i915#3282) +1
>             other test skip
>      * igt@gem_pxp@hw-rejects-pxp-context:
> 
>           * shard-rkl: SKIP (i915#13717) -> SKIP (i915#13717 / i915#14544)
>      * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8411) -> SKIP (i915#8411)
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-rkl: SKIP (i915#3297) -> SKIP (i915#14544 / i915#3297)
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3297 / i915#3323) -> SKIP
>             (i915#3297 / i915#3323)
>      * igt@gen7_exec_parse@basic-rejected:
> 
>           * shard-rkl: SKIP -> SKIP (i915#14544) +10 other tests skip
>      * igt@gen9_exec_parse@bb-start-param:
> 
>           * shard-rkl: SKIP (i915#2527) -> SKIP (i915#14544 / i915#2527) +1
>             other test skip
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
> 
>           * shard-rkl: SKIP (i915#5286) -> SKIP (i915#14544 / i915#5286) +2
>             other tests skip
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#5286) -> SKIP (i915#5286)
>      * igt@kms_big_fb@linear-16bpp-rotate-270:
> 
>           * shard-rkl: SKIP (i915#3638) -> SKIP (i915#14544 / i915#3638)
>      * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3638) -> SKIP (i915#3638)
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP +3 other tests skip
>      * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#14544 / i915#6095) -> SKIP
>             (i915#14098 / i915#6095) +9 other tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6095) -> SKIP (i915#6095) +5
>             other tests skip
>      * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#6095) -> SKIP (i915#14544 / i915#6095) +5
>             other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
> 
>           * shard-rkl: SKIP (i915#12313) -> SKIP (i915#12313 / i915#14544)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#14098 /
>             i915#14544 / i915#6095) +7 other tests skip
>      * igt@kms_chamelium_frames@dp-crc-fast:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#7828) -> SKIP (i915#11151 /
>             i915#14544 / i915#7828) +2 other tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-storm:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#14544 / i915#7828) -> SKIP
>             (i915#11151 / i915#7828) +2 other tests skip
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-dg2: FAIL (i915#7173) -> SKIP (i915#6944 / i915#7118 /
>             i915#9424) +1 other test skip
>      * igt@kms_content_protection@legacy:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6944 / i915#7118 / i915#9424)
>             -> SKIP (i915#6944 / i915#7118 / i915#9424)
>      * igt@kms_content_protection@legacy-hdcp14:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6944) -> SKIP (i915#6944)
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-rkl: SKIP (i915#6944 / i915#9424) -> SKIP (i915#14544 /
>             i915#6944 / i915#9424) +1 other test skip
>           * shard-dg1: SKIP (i915#9433) -> SKIP (i915#6944 / i915#9424)
>      * igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>           * shard-rkl: SKIP (i915#13049 / i915#14544) -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-random-512x170:
> 
>           * shard-rkl: SKIP (i915#13049) -> SKIP (i915#13049 / i915#14544) +1
>             other test skip
>      * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>           * shard-rkl: SKIP (i915#9723) -> SKIP (i915#14544 / i915#9723) +1
>             other test skip
>      * igt@kms_dsc@dsc-basic:
> 
>           * shard-rkl: SKIP (i915#3555 / i915#3840) -> SKIP (i915#14544 /
>             i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>           * shard-rkl: SKIP (i915#3840) -> SKIP (i915#14544 / i915#3840)
>      * igt@kms_dsc@dsc-with-bpc:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555 / i915#3840) -> SKIP
>             (i915#3555 / i915#3840)
>      * igt@kms_flip@2x-flip-vs-dpms:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9934) -> SKIP (i915#9934) +2
>             other tests skip
>      * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>           * shard-rkl: SKIP (i915#9934) -> SKIP (i915#14544 / i915#9934) +3
>             other tests skip
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * shard-glk: INCOMPLETE (i915#12745 / i915#4839) -> INCOMPLETE
>             (i915#12314 / i915#12745 / i915#4839 / i915#6113)
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
> 
>           * shard-glk: INCOMPLETE (i915#12745) -> INCOMPLETE (i915#12314 /
>             i915#12745)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15643) -> SKIP (i915#15643)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
> 
>           * shard-rkl: SKIP (i915#15643) -> SKIP (i915#14544 / i915#15643) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-cpu:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15102) -> SKIP (i915#15102)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
> 
>           * shard-rkl: SKIP (i915#15102) -> SKIP (i915#14544 / i915#15102) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15102 / i915#3023) -> SKIP
>             (i915#15102 / i915#3023) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#1825) -> SKIP (i915#14544 / i915#1825) +16
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
> 
>           * shard-dg1: SKIP (i915#4423) -> SKIP +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1825) -> SKIP (i915#1825) +9
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#15102 / i915#3023) -> SKIP (i915#14544 /
>             i915#15102 / i915#3023) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
> 
>           * shard-dg2: SKIP (i915#15102 / i915#3458) -> SKIP (i915#10433 /
>             i915#15102 / i915#3458) +1 other test skip
>      * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#15102 / i915#3458) -> SKIP
>             (i915#15102 / i915#3458) +2 other tests skip
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-dg2: SKIP (i915#12713) -> SKIP (i915#13331)
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15458) -> SKIP (i915#15458)
>      * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
> 
>           * shard-rkl: SKIP (i915#15608 / i915#15609 / i915#8825) -> SKIP
>             (i915#14544 / i915#15608 / i915#15609 / i915#8825) +2 other tests
>             skip
>      * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-0:
> 
>           * shard-rkl: SKIP (i915#15608) -> SKIP (i915#14544 / i915#15608) +2
>             other tests skip
>      * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-5:
> 
>           * shard-rkl: SKIP (i915#15609 / i915#8825) -> SKIP (i915#14544 /
>             i915#15609 / i915#8825) +2 other tests skip
>      * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15608 / i915#15609 /
>             i915#8825) -> SKIP (i915#15608 / i915#15609 / i915#8825)
>      * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-0:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15608) -> SKIP (i915#15608) +1
>             other test skip
>      * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-5:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15609 / i915#8825) -> SKIP
>             (i915#15609 / i915#8825)
>      * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15608 / i915#8825) -> SKIP
>             (i915#15608 / i915#8825) +1 other test skip
>      * igt@kms_plane_lowres@tiling-4:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555) -> SKIP (i915#3555)
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-rkl: SKIP (i915#14259 / i915#14544) -> SKIP (i915#14259)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
> 
>           * shard-rkl: SKIP (i915#15329) -> SKIP (i915#14544 / i915#15329) +3
>             other tests skip
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3828) -> SKIP (i915#3828)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-tglu: FAIL (i915#9295) -> SKIP (i915#15128)
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-rkl: SKIP (i915#15073) -> SKIP (i915#14544 / i915#15073)
>      * igt@kms_prime@basic-crc-hybrid:
> 
>           * shard-rkl: SKIP (i915#6524) -> SKIP (i915#14544 / i915#6524)
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-rkl: SKIP (i915#11520 / i915#14544) -> SKIP (i915#11520)
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-rkl: SKIP (i915#11520) -> SKIP (i915#11520 / i915#14544) +3
>             other tests skip
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-rkl: SKIP (i915#9683) -> SKIP (i915#14544 / i915#9683)
>      * igt@kms_psr@fbc-pr-dpms:
> 
>           * shard-dg1: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 /
>             i915#4423 / i915#9732)
>      * igt@kms_psr@fbc-psr-primary-page-flip:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#14544 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732) +10 other tests skip
>      * igt@kms_psr@psr-sprite-plane-move:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 /
>             i915#14544 / i915#9732) +10 other tests skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#5289) -> SKIP (i915#5289)
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-rkl: SKIP (i915#8623) -> SKIP (i915#14544 / i915#8623)
>      * igt@kms_vrr@flipline:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15243 / i915#3555) -> SKIP
>             (i915#15243 / i915#3555)
>      * igt@prime_vgem@basic-fence-read:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3291 / i915#3708) -> SKIP
>             (i915#3291 / i915#3708)
>      * igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>           * shard-rkl: SKIP (i915#9917) -> SKIP (i915#14544 / i915#9917)
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8746 -> IGTPW_14518
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_17964: d2a98b98376b6a16c835a131b12f295848c656db @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_14518: a3cf2db28f4ef9388182b6046c14a99b919fc7f1 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8746: 8746
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
