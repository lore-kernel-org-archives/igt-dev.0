Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C9CC5B543
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 19:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BE810E22C;
	Fri, 30 May 2025 19:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ag6YPOjc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC7B10E207;
 Fri, 30 May 2025 19:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748634247; x=1780170247;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iNgPrrerB1MT92NjoBmlaaDOa7o3PNJOPzHtILMLVgE=;
 b=Ag6YPOjc1YMi3hO4sI9yqPBvC3HLFJGTLmBpXJNunNcxmsrW5wZdpewl
 8q/FMz4bX4FSqs0lMhU7+K+Vqj1gKt9gwTyOTF3Lc/WyKEL6umgOnJAq9
 HfskYQkaVi9MvE7yDCf4fc3ymMC7GsBCzUfZkp8wkzZolGFWi1ZBJGHEA
 3HEK2yyOq8vpmnst+iSXX/VXkVCAM5yH2yNymW325ByUq3QF8Y7Eao0xG
 3f1hJmOkwUkbCYu3NmEe7mpQsTgJAlpG4JO0o4xTiaDynXdfIlkbVlwRt
 FVd3sqlZjdKS2/WWjzjQ0/Bxi5ZuIBxtVsnrynQZpdy+5rZ1zciS9X+fr Q==;
X-CSE-ConnectionGUID: 0CmpPa8DRiyGRT2FShw7rw==
X-CSE-MsgGUID: 5cvCMXh+T7uO0yLTFCG/2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50883511"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="50883511"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 12:44:06 -0700
X-CSE-ConnectionGUID: x/Gc5dciQ8uWBgnSn9acJA==
X-CSE-MsgGUID: NZ5FiczqQhC0NRu67Ppcig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="174962648"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.58])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 12:44:04 -0700
Date: Fri, 30 May 2025 21:44:00 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Improve mem-copy/mem-set lib and tests (rev3)
Message-ID: <wjsyprvtl7eow5leit6o7htdgwmyz35zyo5s7n46vw3i42fmsy@c2fs7pcunfl4>
References: <20250530064050.1560398-1-zbigniew.kempczynski@intel.com>
 <174859735105.34706.7334076081034728229@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174859735105.34706.7334076081034728229@1538d3639d33>
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

On Fri, May 30, 2025 at 09:29:11AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Improve mem-copy/mem-set lib and tests (rev3)                   
>    URL:     https://patchwork.freedesktop.org/series/148977/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13216/index.html 
> 
>           CI Bug Log - changes from IGT_8385_full -> IGTPW_13216_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_13216_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_13216_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13216/index.html
> 
> Participating hosts (10 -> 10)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_13216_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_workarounds@suspend-resume-fd:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
> 
>           * shard-rkl: PASS -> INCOMPLETE
>      * igt@kms_universal_plane@disable-primary-vs-flip:
> 
>           * shard-dg1: PASS -> INCOMPLETE +1 other test incomplete

Above issues are unrelated to the series.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between IGT_8385_full and IGTPW_13216_full:
> 
>   New IGT tests (9)
> 
>      * igt@kms_flip@2x-absolute-wf_vblank@ab-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [10.76] s
>      * igt@kms_flip@2x-absolute-wf_vblank@ac-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [10.69] s
>      * igt@kms_flip@2x-absolute-wf_vblank@bc-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [10.68] s
>      * igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [11.04] s
>      * igt@kms_flip@2x-flip-vs-fences-interruptible@ac-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [10.77] s
>      * igt@kms_flip@2x-flip-vs-fences-interruptible@bc-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [10.96] s
>      * igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [11.29] s
>      * igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [11.06] s
>      * igt@kms_flip@2x-plain-flip-ts-check@bc-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [11.03] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_13216_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8411)
>      * igt@api_intel_bb@object-reloc-purge-cache:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#8411) +1 other test skip
>      * igt@device_reset@unbind-cold-reset-rebind:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11078)
>      * igt@gem_basic@multigpu-create-close:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_busy@semaphore:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3936)
>           * shard-dg1: NOTRUN -> SKIP (i915#3936)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3936)
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@block-multicopy-compressed:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_ccs@ctrl-surf-copy:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_create@create-clear:
> 
>           * shard-rkl: NOTRUN -> DMESG-WARN (i915#12964) +9 other tests
>             dmesg-warn
>      * igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6335)
>           * shard-rkl: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_ctx_isolation@preservation-s3@rcs0:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12353) +1 other test
>             incomplete
>      * igt@gem_ctx_persistence@engines-hang:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#1099)
>      * igt@gem_ctx_persistence@heartbeat-many:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8555) +1 other test skip
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#280) +1 other test skip
>      * igt@gem_ctx_sseu@mmap-args:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#280)
>           * shard-tglu: NOTRUN -> SKIP (i915#280)
>           * shard-mtlp: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@reset-stress:
> 
>           * shard-dg1: PASS -> FAIL (i915#5784)
>      * igt@gem_exec_balancer@bonded-sync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4771)
>      * igt@gem_exec_balancer@parallel-out-fence:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525) +1 other test skip
>      * igt@gem_exec_balancer@sliced:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4812) +1 other test skip
>      * igt@gem_exec_fence@submit:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3539 / i915#4852)
>      * igt@gem_exec_flush@basic-wb-pro-default:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +1 other test
>             skip
>      * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +10 other tests skip
>      * igt@gem_exec_reloc@basic-cpu-noreloc:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3281) +2 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +8 other tests skip
>      * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281)
>      * igt@gem_exec_schedule@preempt-queue-contexts:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4537 / i915#4812)
>      * igt@gem_exec_schedule@reorder-wide:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4537 / i915#4812) +1 other test
>             skip
>      * igt@gem_exec_suspend@basic-s0@smem:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#13304) +1 other test
>             incomplete
>      * igt@gem_exec_suspend@basic-s4-devices:
> 
>           * shard-tglu: PASS -> ABORT (i915#7975 / i915#8213) +1 other test
>             abort
>      * igt@gem_fence_thrash@bo-write-verify-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860) +3 other tests skip
>      * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4860) +1 other test skip
>      * igt@gem_lmem_swapping@basic:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_lmem_swapping@heavy-verify-random:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_lmem_swapping@parallel-random:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * shard-dg2: PASS -> TIMEOUT (i915#5493) +1 other test timeout
>           * shard-dg1: PASS -> TIMEOUT (i915#5493) +1 other test timeout
>      * igt@gem_madvise@dontneed-before-exec:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +1 other test skip
>      * igt@gem_mmap@bad-object:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_mmap_gtt@cpuset-big-copy-odd:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4077) +7 other tests skip
>      * igt@gem_mmap_gtt@hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +7 other tests skip
>      * igt@gem_mmap_wc@bad-object:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +3 other tests skip
>      * igt@gem_mmap_wc@write:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +1 other test skip
>      * igt@gem_pread@display:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3282)
>      * igt@gem_pwrite@basic-random:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +1 other test skip
>      * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>      * igt@gem_pxp@hw-rejects-pxp-buffer:
> 
>           * shard-rkl: NOTRUN -> TIMEOUT (i915#12917 / i915#12964) +3 other
>             tests timeout
>           * shard-tglu: NOTRUN -> SKIP (i915#13398)
>      * igt@gem_pxp@regular-baseline-src-copy-readible:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_pxp@reject-modify-context-protection-off-2:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +4 other tests
>             skip
>      * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428)
>      * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#5190 / i915#8428) +1 other test
>             skip
>      * igt@gem_set_tiling_vs_pwrite:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +6 other tests skip
>      * igt@gem_tiled_pread_pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079) +1 other test skip
>      * igt@gem_userptr_blits@access-control:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#3323)
>      * igt@gem_userptr_blits@dmabuf-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297) +3 other tests skip
>      * igt@gem_userptr_blits@forbidden-operations:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3282 / i915#3297)
>      * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_userptr_blits@map-fixed-invalidate-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@readonly-pwrite-unsync:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>      * igt@gem_userptr_blits@relocations:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281 / i915#3297)
>      * igt@gem_userptr_blits@unsync-unmap-after-close:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>      * igt@gem_workarounds@suspend-resume-context:
> 
>           * shard-tglu: PASS -> ABORT (i915#12817)
>      * igt@gen3_mixed_blits:
> 
>           * shard-dg2-9: NOTRUN -> SKIP +6 other tests skip
>      * igt@gen7_exec_parse@chained-batch:
> 
>           * shard-rkl: NOTRUN -> SKIP +17 other tests skip
>      * igt@gen9_exec_parse@bb-chained:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2527)
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856)
>      * igt@gen9_exec_parse@bb-start-far:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2856) +2 other tests skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 other
>             test skip
>      * igt@gen9_exec_parse@bb-start-param:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +2 other tests skip
>      * igt@gen9_exec_parse@cmd-crossing-page:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +5 other tests
>             skip
>      * igt@gen9_exec_parse@unaligned-access:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +1 other test skip
>      * igt@i915_drm_fdinfo@busy-idle@rcs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#14073) +6 other tests skip
>      * igt@i915_drm_fdinfo@isolation@rcs0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14073) +7 other tests skip
>      * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#14073) +7 other tests skip
>      * igt@i915_drm_fdinfo@virtual-busy-idle-all:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14118) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#14118)
>           * shard-mtlp: NOTRUN -> SKIP (i915#14118)
>      * igt@i915_module_load@reload:
> 
>           * shard-snb: PASS -> ABORT (i915#11703)
>      * igt@i915_pm_freq_api@freq-reset:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#8399)
>           * shard-rkl: NOTRUN -> SKIP (i915#8399)
>      * igt@i915_pm_rc6_residency@rc6-fence:
> 
>           * shard-tglu: NOTRUN -> WARN (i915#13790 / i915#2681) +1 other test
>             warn
>      * igt@i915_pm_rps@basic-api:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11681 / i915#6621)
>      * igt@i915_pm_rps@min-max-config-idle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11681 / i915#6621) +1 other test
>             skip
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4387)
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6245)
>           * shard-rkl: NOTRUN -> SKIP (i915#6245)
>      * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4212) +2 other tests skip
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12454 / i915#12712)
>      * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-3-4-mc-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8709) +7 other tests skip
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555)
>           * shard-dg2: NOTRUN -> SKIP (i915#9531)
>           * shard-dg1: NOTRUN -> SKIP (i915#9531)
>           * shard-tglu: NOTRUN -> SKIP (i915#9531)
>      * igt@kms_atomic_transition@plane-all-modeset-transition:
> 
>           * shard-dg2-9: NOTRUN -> FAIL (i915#5956) +1 other test fail
>           * shard-mtlp: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_atomic_transition@plane-toggle-modeset-transition:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#5956) +1 other test fail
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +3 other tests skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +4 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>      * igt@kms_big_fb@linear-16bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3638)
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>           * shard-dg2: NOTRUN -> SKIP +13 other tests skip
>      * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#6187)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4538 / i915#5190) +5 other
>             tests skip
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +8 other tests
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4538) +1 other test skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12313) +1 other test skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +133 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +69 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#10307 / i915#6095) +19 other
>             tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +9 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-glk: NOTRUN -> SKIP +440 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>             +2 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +32 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12805)
>           * shard-rkl: NOTRUN -> SKIP (i915#12805)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12805)
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#6095) +4 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6095) +19 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6095) +17 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +158 other
>             tests skip
>      * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#6095) +48 other
>             tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12313) +1 other test skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12313) +1 other test skip
>      * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
> 
>           * shard-snb: NOTRUN -> SKIP +58 other tests skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3742)
>           * shard-mtlp: NOTRUN -> SKIP (i915#13784)
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13783) +4 other tests skip
>      * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#7828) +7 other tests
>             skip
>      * igt@kms_chamelium_frames@hdmi-crc-fast:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11151 / i915#7828) +9 other tests
>             skip
>      * igt@kms_chamelium_frames@hdmi-crc-multiple:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11151 / i915#7828) +3 other
>             tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11151 / i915#7828) +1 other test
>             skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-storm:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#11151 / i915#7828) +1 other test
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#11151 / i915#7828)
>      * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11151 / i915#7828) +6 other
>             tests skip
>      * igt@kms_content_protection@atomic:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118 /
>             i915#9424)
>      * igt@kms_content_protection@content-type-change:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#9424)
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3299)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3116 / i915#3299)
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3299) +1 other test skip
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9424)
>      * igt@kms_content_protection@srm:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7116)
>           * shard-mtlp: NOTRUN -> SKIP (i915#6944)
>      * igt@kms_content_protection@srm@pipe-a-dp-3:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#7173)
>      * igt@kms_content_protection@type1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7118 / i915#9424) +1 other test
>             skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +3 other tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +3 other tests skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13049) +1 other test skip
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13049) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13046 / i915#5354) +3 other tests
>             skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13046 / i915#5354)
>      * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9067)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4103) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213)
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13691)
>           * shard-tglu: NOTRUN -> SKIP (i915#13691)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3555)
>      * igt@kms_dp_aux_dev:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1257)
>           * shard-dg1: NOTRUN -> SKIP (i915#1257)
>           * shard-tglu: NOTRUN -> SKIP (i915#1257)
>      * igt@kms_dp_link_training@uhbr-mst:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13748)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13748)
>      * igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>           * shard-dg2: PASS -> SKIP (i915#13707)
>           * shard-rkl: NOTRUN -> SKIP (i915#13707)
>           * shard-tglu: NOTRUN -> SKIP (i915#13707)
>      * igt@kms_dsc@dsc-basic:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3555 / i915#3840)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-with-bpc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#3840)
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3840 / i915#9053)
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#9878)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4854)
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#1839) +1 other test skip
>      * igt@kms_flip@2x-modeset-vs-vblank-race:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9934) +8 other tests skip
>      * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#9934) +6 other tests
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637 / i915#9934) +1 other test
>             skip
>      * igt@kms_flip@2x-plain-flip-interruptible:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9934) +8 other tests skip
>      * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9934) +3 other tests skip
>      * igt@kms_flip@2x-wf_vblank-ts-check:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3637 / i915#9934) +2 other
>             tests skip
>      * igt@kms_flip@flip-vs-absolute-wf_vblank@b-vga1:
> 
>           * shard-snb: PASS -> FAIL (i915#13734) +2 other tests fail
>      * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
> 
>           * shard-mtlp: PASS -> FAIL (i915#13734) +2 other tests fail
>      * igt@kms_flip@flip-vs-suspend:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#4423) +3 other tests
>             dmesg-warn
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#6113)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672) +2 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2587 / i915#2672)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672) +3 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672 / i915#3555) +3 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2672 / i915#3555) +2 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2672 / i915#3555 / i915#5190)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2672)
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +22 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +19 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#10056 / i915#13353)
>      * igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5439)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10055)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#8708) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +44 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +23 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +1 other test skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3458) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +18 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#5354) +13 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +28 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
> 
>           * shard-tglu: NOTRUN -> SKIP +85 other tests skip
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-dg2: PASS -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228)
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228) +2 other tests
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#12713 / i915#3555 / i915#8228)
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12339)
>      * igt@kms_joiner@invalid-modeset-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#10656)
>      * igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12388)
>      * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#10656)
>      * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13522)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4816)
>           * shard-tglu: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#13705)
>      * igt@kms_plane_alpha_blend@constant-alpha-max:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10647 / i915#12169)
>      * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10647) +1 other test fail
>      * igt@kms_plane_multiple@2x-tiling-4:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@2x-tiling-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@2x-tiling-yf:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@tiling-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#14259)
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14259)
>           * shard-tglu: NOTRUN -> SKIP (i915#14259) +1 other test skip
>      * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9809)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12247) +8 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12247 / i915#6953) +1 other test
>             skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12247 / i915#6953)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12247) +13 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12247) +9 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12247 / i915#3555)
>           * shard-rkl: NOTRUN -> SKIP (i915#12247 / i915#3555)
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12247 / i915#6953 / i915#9423)
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12247) +3 other tests skip
>      * igt@kms_pm_backlight@fade:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9812) +1 other test skip
>      * igt@kms_pm_backlight@fade-with-dpms:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9812)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9340)
>           * shard-rkl: NOTRUN -> SKIP (i915#3828)
>           * shard-tglu: NOTRUN -> SKIP (i915#3828)
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-dg2: PASS -> SKIP (i915#9519)
>           * shard-rkl: PASS -> SKIP (i915#9519) +1 other test skip
>      * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@system-suspend-modeset:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#10553)
>      * igt@kms_prime@basic-modeset-hybrid:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6524 / i915#6805)
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>      * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11520) +8 other tests skip
>      * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#11520) +10 other tests skip
>           * shard-snb: NOTRUN -> SKIP (i915#11520)
>      * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11520)
>      * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9808)
>      * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12316) +1 other test skip
>      * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9683)
>           * shard-tglu: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-psr-no-drrs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +19 other tests skip
>      * igt@kms_psr@fbc-psr-primary-page-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +18 other tests
>             skip
>      * igt@kms_psr@fbc-psr-sprite-mmap-gtt@edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +3 other tests skip
>      * igt@kms_psr@fbc-psr2-sprite-render:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9732) +13 other tests skip
>      * igt@kms_psr@psr-primary-mmap-gtt:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#1072 / i915#9732) +9 other
>             tests skip
>      * igt@kms_psr@psr-suspend:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +3 other tests
>             skip
>      * igt@kms_psr@psr2-sprite-mmap-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +17 other tests
>             skip
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9685)
>           * shard-dg2: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#12755 / i915#5190)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5289) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP (i915#5289) +1 other test skip
>      * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#12755)
>      * igt@kms_scaling_modes@scaling-mode-center:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +1 other test skip
>      * igt@kms_universal_plane@cursor-fb-leak:
> 
>           * shard-dg2: PASS -> FAIL (i915#9196) +1 other test fail
>      * igt@kms_vblank@ts-continuation-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12276) +3 other tests
>             incomplete
>      * igt@kms_vblank@wait-forked:
> 
>           * shard-rkl: PASS -> DMESG-WARN (i915#12964) +18 other tests
>             dmesg-warn
>      * igt@kms_vrr@flip-basic-fastset:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9906)
>           * shard-dg2: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-mtlp: PASS -> FAIL (i915#10393) +1 other test fail
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#9906)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#9906)
>      * igt@kms_vrr@seamless-rr-switch-drrs:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2437)
>           * shard-rkl: NOTRUN -> SKIP (i915#2437)
>           * shard-tglu: NOTRUN -> SKIP (i915#2437)
>      * igt@kms_writeback@writeback-check-output-xrgb2101010:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2437 / i915#9412)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2437 / i915#9412)
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2437 / i915#9412)
>      * igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>           * shard-mtlp: NOTRUN -> SKIP +5 other tests skip
>           * shard-dg2: NOTRUN -> SKIP (i915#2436)
>      * igt@perf@mi-rpc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2434)
>           * shard-rkl: NOTRUN -> SKIP (i915#2434)
>      * igt@perf@non-zero-reason:
> 
>           * shard-dg2-9: NOTRUN -> FAIL (i915#9100) +1 other test fail
>      * igt@perf@per-context-mode-unprivileged:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2435)
>      * igt@perf_pmu@event-wait:
> 
>           * shard-dg1: NOTRUN -> SKIP +5 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#8807)
>      * igt@perf_pmu@event-wait@rcs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8807)
>      * igt@perf_pmu@module-unload:
> 
>           * shard-mtlp: PASS -> INCOMPLETE (i915#13520)
>      * igt@perf_pmu@rc6-all-gts:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#8516)
>      * igt@perf_pmu@rc6@other-idle-gt0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8516)
>      * igt@prime_mmap@test_aperture_limit:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14121) +1 other test skip
>      * igt@prime_vgem@basic-read:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3291 / i915#3708)
>      * igt@sriov_basic@enable-vfs-autoprobe-on:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9917)
>      * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#12910) +9 other tests fail
> 
>     Possible fixes
> 
>      * igt@gem_eio@in-flight-suspend:
> 
>           * shard-dg1: DMESG-WARN (i915#4391 / i915#4423) -> PASS +1 other
>             test pass
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-dg1: FAIL (i915#5784) -> PASS
>      * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
> 
>           * shard-rkl: SKIP (i915#4270) -> PASS
>      * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
> 
>           * shard-mtlp: ABORT (i915#13723) -> PASS
>      * igt@kms_cursor_crc@cursor-onscreen-128x42:
> 
>           * shard-rkl: FAIL (i915#13566) -> PASS +3 other tests pass
>      * igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>           * shard-tglu: FAIL (i915#13566) -> PASS +3 other tests pass
>      * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
> 
>           * shard-rkl: DMESG-WARN (i915#12964) -> PASS +13 other tests pass
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> 
>           * shard-rkl: FAIL (i915#2346) -> PASS
>      * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
> 
>           * shard-dg2: SKIP (i915#3555) -> PASS
>      * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
> 
>           * shard-snb: TIMEOUT (i915#14033) -> PASS +1 other test pass
>      * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
> 
>           * shard-snb: FAIL (i915#13734) -> PASS +1 other test pass
>      * igt@kms_flip@plain-flip-ts-check-interruptible:
> 
>           * shard-mtlp: FAIL (i915#13734) -> PASS +1 other test pass
>      * igt@kms_hdr@bpc-switch-suspend:
> 
>           * shard-dg2: SKIP (i915#3555 / i915#8228) -> PASS
>      * igt@kms_pm_dc@dc9-dpms:
> 
>           * shard-rkl: SKIP (i915#3361) -> PASS
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-dg2: SKIP (i915#9519) -> PASS +2 other tests pass
>      * igt@kms_pm_rpm@i2c:
> 
>           * shard-dg1: DMESG-WARN (i915#4423) -> PASS +3 other tests pass
>      * igt@perf_pmu@busy-idle@ccs0:
> 
>           * shard-mtlp: FAIL (i915#4349) -> PASS +9 other tests pass
>      * igt@perf_pmu@busy-idle@vcs0:
> 
>           * shard-dg2: FAIL (i915#4349) -> PASS +5 other tests pass
>           * shard-dg1: FAIL (i915#4349) -> PASS +3 other tests pass
>      * igt@perf_pmu@module-unload:
> 
>           * shard-snb: ABORT (i915#11703) -> PASS
>           * shard-dg2: INCOMPLETE (i915#13520) -> PASS
> 
>     Warnings
> 
>      * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> 
>           * shard-dg1: SKIP -> SKIP (i915#4423)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-dg1: SKIP (i915#4423 / i915#4538 / i915#5286) -> SKIP
>             (i915#4538 / i915#5286)
>      * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#6095) -> SKIP (i915#14098 / i915#6095)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-dg1: SKIP (i915#12805 / i915#4423) -> SKIP (i915#12805)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#6095) +2
>             other tests skip
>      * igt@kms_chamelium_edid@vga-edid-read:
> 
>           * shard-dg1: SKIP (i915#11151 / i915#4423 / i915#7828) -> SKIP
>             (i915#11151 / i915#7828)
>      * igt@kms_content_protection@srm:
> 
>           * shard-dg2: SKIP (i915#7118) -> FAIL (i915#7173)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-dg1: SKIP (i915#4103 / i915#4213 / i915#4423) -> SKIP
>             (i915#4103 / i915#4213)
>      * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
> 
>           * shard-dg1: SKIP (i915#3555 / i915#4423) -> SKIP (i915#3555)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
> 
>           * shard-dg2: SKIP (i915#3458) -> SKIP (i915#10433 / i915#3458) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#3458) -> SKIP (i915#3458) +1
>             other test skip
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-mtlp: SKIP (i915#1187 / i915#12713) -> SKIP (i915#12713)
>           * shard-tglu: SKIP (i915#12713) -> SKIP (i915#1187 / i915#12713)
>      * igt@kms_vrr@max-min:
> 
>           * shard-dg1: SKIP (i915#9906) -> SKIP (i915#4423 / i915#9906)
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8385 -> IGTPW_13216
> 
>    CI-20190529: 20190529
>    CI_DRM_16618: d94defa5c0a9e9fb29a60bd4ce78bac9018224bc @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_13216: 13216
>    IGT_8385: 8385
