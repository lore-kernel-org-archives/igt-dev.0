Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CD5C0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 06:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA1310E03A;
	Wed, 29 Jan 2025 06:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="leN+khd1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC06410E03A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 06:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738131165; x=1769667165;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=Cu7Ijo3ycnAiuIrdfrL7ThkpBNd8/JlE4tj98JYuwIg=;
 b=leN+khd1m69n20S6i/aVub7nqzFHVzRhc7YRQIlU4gfcS8Nld34j0CvK
 dTyXptikUSFjvjKx2vcd3ADzCqMqPRpSvOiyEHJRSE2B0KW71eBYJIP1h
 J3Nj/1dK3dr5Zb9k9JUCdPJGrdA87f6v1iBEU6jDiXxl+3Oyg3QQvEh1m
 jB7BuysB7CpDtLlqJBQgRgfjTzd0SkbujnD5ROTyTnmiPPL9g6eY3UpsM
 eCdfODhFPtBlQybIeqBreXLpcAyw35C84iw6YQc8SCWI+kWa59o45fzyu
 nG5+R1lpO/mOIDUpsfKaAWfhtemakOWa2UfqatmKTowkVAu0uHfMIvhpw Q==;
X-CSE-ConnectionGUID: Qe00BIbPSdyiJ84O52wgvA==
X-CSE-MsgGUID: Y9Hmok2sRJmjJ0E8iRPkPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38739748"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="38739748"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 22:12:45 -0800
X-CSE-ConnectionGUID: XozxM/QITAu8HzLU6B/asA==
X-CSE-MsgGUID: 1niNbrDAT8yFMnid6Ee7Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="139810134"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 22:12:43 -0800
Date: Wed, 29 Jan 2025 07:12:39 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib=2Figt?=
 =?utf-8?Q?=5Fdevice=5Fscan=3A?= limit fetched device attributes from udev
Message-ID: <20250129061239.bgrdfrukcdv2zysw@zkempczy-mobl2>
References: <20250128083014.27713-1-zbigniew.kempczynski@intel.com>
 <173808614468.2027975.8106566767316227747@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173808614468.2027975.8106566767316227747@b555e5b46a47>
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

On Tue, Jan 28, 2025 at 05:42:24PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/igt_device_scan: limit fetched device attributes from udev  
>    URL:     https://patchwork.freedesktop.org/series/144019/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12504/index.html 
> 
>           CI Bug Log - changes from IGT_8212_full -> IGTPW_12504_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_12504_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_12504_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12504/index.html
> 
> Participating hosts (12 -> 11)
> 
>    Missing (1): shard-dg2-set2
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_12504_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@dumb_buffer@create-clear:
> 
>           * shard-dg2: PASS -> INCOMPLETE
>      * igt@gem_eio@in-flight-internal-10ms:
> 
>           * shard-mtlp: PASS -> ABORT
>      * igt@i915_pm_rps@reset:
> 
>           * shard-snb: NOTRUN -> DMESG-FAIL
>      * igt@i915_selftest@live@gem:
> 
>           * shard-mtlp: NOTRUN -> ABORT +1 other test abort
>      * igt@kms_pm_rpm@fences-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP

Patch didn't introduce above issues.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_12504_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@crc32:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#6230])
>           * shard-dg1: NOTRUN -> SKIP ([i915#6230])
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8411])
>      * igt@api_intel_bb@object-reloc-purge-cache:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8411]) +1 other test skip
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#11078])
>      * igt@device_reset@unbind-cold-reset-rebind:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#11078])
>           * shard-tglu: NOTRUN -> SKIP ([i915#11078])
>      * igt@drm_fdinfo@all-busy-check-all:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8414]) +2 other tests skip
>      * igt@drm_fdinfo@isolation:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8414]) +8 other tests skip
>      * igt@drm_fdinfo@isolation@rcs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8414]) +20 other tests skip
>      * igt@gem_basic@multigpu-create-close:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#7697]) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#7697])
>           * shard-tglu: NOTRUN -> SKIP ([i915#7697])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#7697])
>           * shard-dg2: NOTRUN -> SKIP ([i915#7697])
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3555] / [i915#9323])
>      * igt@gem_ccs@large-ctrl-surf-copy:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#13008])
>      * igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#6335])
>      * igt@gem_create@create-ext-set-pat:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#8562])
>      * igt@gem_ctx_persistence@hang:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8555])
>      * igt@gem_ctx_persistence@heartbeat-stop:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8555])
>      * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
> 
>           * shard-snb: NOTRUN -> SKIP ([i915#1099]) +5 other tests skip
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#280])
>           * shard-tglu: NOTRUN -> SKIP ([i915#280])
>      * igt@gem_ctx_sseu@mmap-args:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#280])
>      * igt@gem_eio@kms:
> 
>           * shard-tglu: PASS -> DMESG-WARN ([i915#13363])
>           * shard-dg1: NOTRUN -> FAIL ([i915#5784])
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-mtlp: PASS -> ABORT ([i915#13193])
>           * shard-snb: NOTRUN -> FAIL ([i915#8898]) +1 other test fail
>      * igt@gem_exec_balancer@bonded-dual:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4771]) +1 other test skip
>      * igt@gem_exec_balancer@bonded-false-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4812])
>      * igt@gem_exec_balancer@bonded-sync:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4771])
>      * igt@gem_exec_balancer@hog:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4812]) +3 other tests skip
>      * igt@gem_exec_balancer@noheartbeat:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8555])
>      * igt@gem_exec_balancer@parallel:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#4525]) +2 other tests skip
>      * igt@gem_exec_balancer@parallel-bb-first:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#4525])
>      * igt@gem_exec_balancer@parallel-contexts:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#4525])
>      * igt@gem_exec_capture@capture-invisible:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#6334]) +1 other test skip
>      * igt@gem_exec_capture@capture-recoverable:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#6344])
>      * igt@gem_exec_flush@basic-uc-pro-default:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3539] / [i915#4852]) +3 other
>             tests skip
>      * igt@gem_exec_flush@basic-wb-ro-before-default:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3539] / [i915#4852]) +3 other
>             tests skip
>      * igt@gem_exec_reloc@basic-gtt-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3281]) +18 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-read:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3281]) +9 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-read-noreloc:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3281]) +10 other tests skip
>      * igt@gem_exec_reloc@basic-wc-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3281]) +3 other tests skip
>      * igt@gem_exec_schedule@deep@rcs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4537])
>      * igt@gem_exec_schedule@preempt-queue:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4537] / [i915#4812])
>      * igt@gem_exec_schedule@preempt-queue-contexts-chain:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4537] / [i915#4812])
>      * igt@gem_exec_suspend@basic-s4-devices:
> 
>           * shard-tglu: PASS -> ABORT ([i915#7975] / [i915#8213]) +1 other
>             test abort
>           * shard-rkl: NOTRUN -> ABORT ([i915#7975] / [i915#8213]) +2 other
>             tests abort
>      * igt@gem_exec_suspend@basic-s4-devices@lmem0:
> 
>           * shard-dg1: PASS -> ABORT ([i915#7975] / [i915#8213]) +1 other
>             test abort
>      * igt@gem_fence_thrash@bo-write-verify-y:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4860]) +1 other test skip
>      * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4860])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4860])
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#2190])
>      * igt@gem_lmem_swapping@parallel-random-verify:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#4613]) +1 other test skip
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#4613]) +3 other tests skip
>      * igt@gem_lmem_swapping@random-engines:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4613]) +3 other tests skip
>      * igt@gem_lmem_swapping@verify-ccs:
> 
>           * shard-glk: NOTRUN -> SKIP ([i915#4613]) +4 other tests skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#12193])
>      * igt@gem_lmem_swapping@verify-ccs@lmem0:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4565])
>      * igt@gem_lmem_swapping@verify-random-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#4613]) +2 other tests skip
>      * igt@gem_mmap_gtt@coherency:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4077]) +14 other tests skip
>      * igt@gem_mmap_gtt@fault-concurrent-y:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4077]) +7 other tests skip
>      * igt@gem_mmap_offset@clear-via-pagefault:
> 
>           * shard-mtlp: PASS -> ABORT ([i915#10729]) +1 other test abort
>      * igt@gem_mmap_wc@copy:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4083]) +7 other tests skip
>      * igt@gem_mmap_wc@fault-concurrent:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4083]) +5 other tests skip
>      * igt@gem_mmap_wc@invalid-flags:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4083]) +4 other tests skip
>      * igt@gem_partial_pwrite_pread@reads:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3282]) +10 other tests skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3282])
>      * igt@gem_pread@bench:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3282]) +5 other tests skip
>      * igt@gem_pread@exhaustion:
> 
>           * shard-tglu: NOTRUN -> WARN ([i915#2658])
>      * igt@gem_pread@self:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3282])
>      * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4270]) +2 other tests skip
>      * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
> 
>           * shard-rkl: NOTRUN -> TIMEOUT ([i915#12917] / [i915#12964]) +2
>             other tests timeout
>      * igt@gem_pxp@verify-pxp-stale-ctx-execution:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4270]) +2 other tests skip
>      * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8428]) +4 other tests skip
>      * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#5190] / [i915#8428]) +4 other
>             tests skip
>      * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4079]) +2 other tests skip
>      * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#8411]) +1 other test skip
>      * igt@gem_set_tiling_vs_gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4079])
>      * igt@gem_tiled_partial_pwrite_pread@writes:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4077]) +11 other tests skip
>      * igt@gem_tiled_swapping@non-threaded:
> 
>           * shard-glk: NOTRUN -> ABORT ([i915#13263] / [i915#13449])
>      * igt@gem_unfence_active_buffers:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4879])
>      * igt@gem_userptr_blits@coherency-unsync:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3297]) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP ([i915#3297]) +1 other test skip
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3297]) +3 other tests skip
>      * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3297])
>      * igt@gem_userptr_blits@map-fixed-invalidate:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3297]) +1 other test skip
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3297] / [i915#4880]) +1 other
>             test skip
>      * igt@gem_userptr_blits@unsync-unmap-after-close:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3297]) +2 other tests skip
>      * igt@gen9_exec_parse@batch-without-end:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#2856]) +1 other test skip
>      * igt@gen9_exec_parse@bb-chained:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#2527]) +4 other tests skip
>      * igt@gen9_exec_parse@bb-large:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#2527] / [i915#2856])
>      * igt@gen9_exec_parse@bb-start-cmd:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#2527]) +5 other tests skip
>           * shard-tglu: NOTRUN -> SKIP ([i915#2527] / [i915#2856]) +2 other
>             tests skip
>      * igt@gen9_exec_parse@bb-start-far:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#2856]) +5 other tests skip
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-rkl: PASS -> ABORT ([i915#9820])
>           * shard-tglu: PASS -> ABORT ([i915#12817] / [i915#9820])
>           * shard-dg2: NOTRUN -> DMESG-WARN ([i915#13475])
>      * igt@i915_module_load@resize-bar:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#7178])
>           * shard-tglu: NOTRUN -> SKIP ([i915#6412])
>      * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#7091])
>      * igt@i915_pm_freq_api@freq-reset:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#8399])
>      * igt@i915_pm_freq_api@freq-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#8399])
>      * igt@i915_pm_freq_api@freq-suspend@gt0:
> 
>           * shard-dg2: PASS -> INCOMPLETE ([i915#12455]) +1 other test
>             incomplete
>      * igt@i915_pm_freq_mult@media-freq@gt0:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#6590]) +1 other test skip
>      * igt@i915_pm_rpm@gem-pread:
> 
>           * shard-rkl: PASS -> SKIP ([i915#13328])
>      * igt@i915_pm_rps@min-max-config-loaded:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#11681] / [i915#6621])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#11681] / [i915#6621])
>      * igt@i915_pm_rps@reset:
> 
>           * shard-mtlp: NOTRUN -> FAIL ([i915#8346])
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4387])
>      * igt@i915_power@sanity:
> 
>           * shard-mtlp: PASS -> SKIP ([i915#7984])
>      * igt@i915_query@query-topology-coherent-slice-mask:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#6188])
>      * igt@i915_query@test-query-geometry-subslices:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#5723])
>      * igt@i915_selftest@mock:
> 
>           * shard-snb: NOTRUN -> DMESG-WARN ([i915#9311]) +1 other test
>             dmesg-warn
>           * shard-mtlp: NOTRUN -> DMESG-WARN ([i915#9311]) +1 other test
>             dmesg-warn
>      * igt@i915_selftest@mock@memory_region:
> 
>           * shard-dg2: NOTRUN -> DMESG-WARN ([i915#9311]) +1 other test
>             dmesg-warn
>      * igt@i915_suspend@basic-s2idle-without-i915:
> 
>           * shard-rkl: NOTRUN -> DMESG-WARN ([i915#12917] / [i915#12964])
>      * igt@i915_suspend@fence-restore-tiled2untiled:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#4817])
>      * igt@intel_hwmon@hwmon-read:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#7707])
>      * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4212]) +1 other test skip
>      * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4212]) +2 other tests skip
>      * igt@kms_addfb_basic@basic-x-tiled-legacy:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4212])
>      * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-rc-ccs-cc:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#8709]) +1 other test skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-4-rc-ccs-cc:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8709]) +15 other tests skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc-ccs-cc:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8709]) +3 other tests skip
>      * igt@kms_async_flips@invalid-async-flip-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12967])
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9531])
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#1769] / [i915#3555])
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#1769] / [i915#3555])
>      * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: PASS -> FAIL ([i915#11808]) +1 other test fail
>      * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> FAIL ([i915#5956]) +1 other test fail
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4538] / [i915#5286]) +4 other
>             tests skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#5286]) +6 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#5286]) +1 other test skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-mtlp: PASS -> FAIL ([i915#5138])
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#5286]) +6 other tests skip
>      * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
> 
>           * shard-mtlp: NOTRUN -> SKIP +11 other tests skip
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4538] / [i915#5190]) +17 other
>             tests skip
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3638]) +7 other tests skip
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3638]) +4 other tests skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4538]) +7 other tests skip
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#6095]) +29 other tests skip
>      * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#6095]) +74 other tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#6095]) +159 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#10307] / [i915#6095]) +162 other
>             tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#12313]) +1 other test skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#12313])
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#6095]) +49 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#12805])
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#12796]) +1 other test
>             incomplete
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#6095]) +25 other tests skip
>      * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#6095]) +110 other tests skip
>      * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#10307] / [i915#10434] /
>             [i915#6095]) +1 other test skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12313])
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3742])
>      * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#11616] / [i915#7213]) +3 other
>             tests skip
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3742])
>      * igt@kms_cdclk@plane-scaling@pipe-d-dp-4:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4087]) +3 other tests skip
>      * igt@kms_chamelium_audio@hdmi-audio:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +6 other
>             tests skip
>      * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +8 other
>             tests skip
>      * igt@kms_chamelium_edid@dp-mode-timings:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +7 other
>             tests skip
>      * igt@kms_chamelium_frames@dp-crc-single:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +7 other
>             tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +3
>             other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +7 other
>             tests skip
>      * igt@kms_content_protection@atomic:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#7116] / [i915#9424]) +2 other
>             tests skip
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#6944] / [i915#7116] /
>             [i915#7118] / [i915#9424]) +2 other tests skip
>      * igt@kms_content_protection@content-type-change:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9424])
>           * shard-rkl: NOTRUN -> SKIP ([i915#9424])
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3116])
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3299]) +1 other test skip
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#6944] / [i915#9424])
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9424])
>      * igt@kms_content_protection@type1:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#7118] / [i915#9424])
>           * shard-rkl: NOTRUN -> SKIP ([i915#7118] / [i915#9424]) +1 other
>             test skip
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3555] / [i915#6944] /
>             [i915#9424])
>      * igt@kms_cursor_crc@cursor-alpha-transparent:
> 
>           * shard-dg1: PASS -> DMESG-WARN ([i915#4423]) +1 other test
>             dmesg-warn
>      * igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#13049])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#13049]) +2 other tests skip
>           * shard-dg2: NOTRUN -> SKIP ([i915#13049]) +1 other test skip
>      * igt@kms_cursor_crc@cursor-onscreen-256x85:
> 
>           * shard-tglu: NOTRUN -> FAIL ([i915#13566]) +1 other test fail
>      * igt@kms_cursor_crc@cursor-onscreen-32x32:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3555]) +4 other tests skip
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#13049]) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#13049]) +1 other test skip
>      * igt@kms_cursor_crc@cursor-random-max-size:
> 
>           * shard-glk: NOTRUN -> SKIP +276 other tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3555]) +4 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-128x42:
> 
>           * shard-tglu: PASS -> FAIL ([i915#13566]) +3 other tests fail
>      * igt@kms_cursor_crc@cursor-sliding-32x10:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3555]) +5 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#13049]) +4 other tests skip
>      * igt@kms_cursor_crc@cursor-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#12358] / [i915#7882])
>      * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#12358])
>      * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#13046] / [i915#5354]) +4 other
>             tests skip
>      * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP +25 other tests skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4103] / [i915#4213])
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#4103]) +1 other test skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9809]) +2 other tests skip
>      * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9067])
>           * shard-dg2: NOTRUN -> SKIP ([i915#9067])
>           * shard-rkl: NOTRUN -> SKIP ([i915#9067])
>           * shard-dg1: NOTRUN -> SKIP ([i915#9067])
>           * shard-tglu: NOTRUN -> SKIP ([i915#9067])
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#4103])
>           * shard-dg1: NOTRUN -> SKIP ([i915#4103] / [i915#4213])
>      * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9833])
>      * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
> 
>           * shard-snb: NOTRUN -> FAIL ([i915#12170])
>      * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
> 
>           * shard-snb: NOTRUN -> FAIL ([i915#11968])
>      * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9723])
>      * igt@kms_display_modes@mst-extended-mode-negative:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8588])
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#1769] / [i915#3555] /
>             [i915#3804])
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3804])
>      * igt@kms_dp_aux_dev:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#1257])
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#1257])
>      * igt@kms_draw_crc@draw-method-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8812])
>           * shard-dg1: NOTRUN -> SKIP ([i915#8812])
>      * igt@kms_dsc@dsc-basic:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3555] / [i915#3840])
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3840])
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3555] / [i915#3840])
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3840] / [i915#9053])
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3955])
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4854])
>           * shard-rkl: NOTRUN -> SKIP ([i915#4854])
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#2065] / [i915#4854])
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#1839])
>           * shard-rkl: NOTRUN -> SKIP ([i915#1839]) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#1839])
>           * shard-tglu: NOTRUN -> SKIP ([i915#1839])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#1839])
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9337])
>      * igt@kms_feature_discovery@psr1:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#658])
>      * igt@kms_feature_discovery@psr2:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#658])
>      * igt@kms_fence_pin_leak:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4881])
>      * igt@kms_flip@2x-absolute-wf_vblank:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9934]) +6 other tests skip
>      * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9934]) +8 other tests skip
>      * igt@kms_flip@2x-flip-vs-dpms:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9934]) +9 other tests skip
>      * igt@kms_flip@2x-flip-vs-fences-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8381])
>      * igt@kms_flip@2x-flip-vs-rmfb:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3637]) +4 other tests skip
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#4839])
>      * igt@kms_flip@2x-modeset-vs-vblank-race:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3637]) +2 other tests skip
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3637]) +4 other tests skip
>      * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
> 
>           * shard-dg1: NOTRUN -> DMESG-WARN ([i915#4423])
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#12745] / [i915#4839]) +1
>             other test incomplete
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#12745])
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#2587] / [i915#2672] /
>             [i915#3555])
>           * shard-tglu: NOTRUN -> SKIP ([i915#2587] / [i915#2672] /
>             [i915#3555])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#2672] / [i915#3555] /
>             [i915#8813]) +2 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#2672] / [i915#8813]) +2 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#2672]) +5 other tests skip
>           * shard-rkl: NOTRUN -> SKIP ([i915#2672]) +6 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#2587] / [i915#2672] /
>             [i915#3555])
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#2587] / [i915#2672]) +1 other
>             test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#2587] / [i915#2672]) +5 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#2587] / [i915#2672]) +3 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#2672] / [i915#3555]) +6 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#2672] / [i915#3555])
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#2672] / [i915#3555]) +2 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#2672] / [i915#3555]) +4 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#2672] / [i915#3555] /
>             [i915#5190]) +3 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#2672] / [i915#3555]) +3 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
> 
>           * shard-dg2: NOTRUN -> FAIL ([i915#6880])
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8708]) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
> 
>           * shard-dg2: PASS -> FAIL ([i915#6880]) +2 other tests fail
>      * igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#5439]) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#10055])
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3458]) +18 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3458]) +20 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8708]) +24 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
> 
>           * shard-dg1: NOTRUN -> SKIP +50 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#5354]) +27 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#1825]) +18 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3023]) +35 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8708]) +14 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#1825]) +47 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
> 
>           * shard-snb: NOTRUN -> SKIP +504 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
> 
>           * shard-tglu: NOTRUN -> SKIP +75 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +34 other tests skip
>      * igt@kms_hdr@bpc-switch-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3555] / [i915#8228]) +3 other
>             tests skip
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-dg2: PASS -> SKIP ([i915#3555] / [i915#8228])
>           * shard-dg1: NOTRUN -> SKIP ([i915#3555] / [i915#8228])
>      * igt@kms_joiner@basic-big-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#10656])
>      * igt@kms_joiner@basic-force-ultra-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#12394] / [i915#13522])
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#12339])
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#12339])
>      * igt@kms_joiner@invalid-modeset-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#10656])
>      * igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#12388])
>      * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#10656] / [i915#13522])
>      * igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#12339])
>      * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#13522])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#13522])
>           * shard-dg2: NOTRUN -> SKIP ([i915#13522])
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4816])
>      * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
> 
>           * shard-dg2: NOTRUN -> SKIP +6 other tests skip
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#6953])
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#12247]) +9 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#12247]) +9 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#12247]) +12 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12247] / [i915#6953] /
>             [i915#9423]) +1 other test skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12247] / [i915#6953]) +1 other
>             test skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12247]) +17 other tests skip
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#12247] / [i915#6953])
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12247]) +7 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#12247] / [i915#3555])
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#12343])
>      * igt@kms_pm_backlight@fade:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#5354])
>      * igt@kms_pm_backlight@fade-with-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#5354])
>      * igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9685]) +1 other test skip
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9685]) +1 other test skip
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3828])
>      * igt@kms_pm_lpsp@screens-disabled:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#8430])
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9519])
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9519]) +1 other test skip
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-dg2: PASS -> SKIP ([i915#9519])
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9519])
>      * igt@kms_pm_rpm@system-suspend-modeset:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#10553])
>      * igt@kms_prime@basic-crc-vgem:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#6524])
>      * igt@kms_prime@basic-modeset-hybrid:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#6524])
>           * shard-tglu: NOTRUN -> SKIP ([i915#6524])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#6524])
>           * shard-dg2: NOTRUN -> SKIP ([i915#6524] / [i915#6805]) +1 other
>             test skip
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#11520]) +6 other tests skip
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
> 
>           * shard-snb: NOTRUN -> SKIP ([i915#11520]) +15 other tests skip
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12316]) +5 other tests skip
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#11520]) +8 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#11520]) +3 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9808]) +1 other test skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#11520]) +9 other tests skip
>      * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
> 
>           * shard-glk: NOTRUN -> SKIP ([i915#11520]) +5 other tests skip
>      * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#11520]) +8 other tests skip
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9683])
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4348]) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP ([i915#9683])
>      * igt@kms_psr@fbc-pr-primary-render:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#1072] / [i915#9732]) +19 other
>             tests skip
>      * igt@kms_psr@fbc-psr2-sprite-plane-move:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9688]) +11 other tests skip
>      * igt@kms_psr@pr-basic:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9732]) +20 other tests skip
>      * igt@kms_psr@pr-suspend:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#1072] / [i915#9732]) +21 other
>             tests skip
>      * igt@kms_psr@psr2-sprite-mmap-gtt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#9732]) +8 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4077] / [i915#9688]) +1 other
>             test skip
>      * igt@kms_psr@psr2-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#1072] / [i915#9732]) +33 other
>             tests skip
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#9685])
>      * igt@kms_rotation_crc@exhaust-fences:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4235])
>      * igt@kms_rotation_crc@primary-rotation-270:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12755]) +1 other test skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#5190]) +2 other tests skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12755] / [i915#5190])
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#5289]) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#5289])
>           * shard-tglu: NOTRUN -> SKIP ([i915#5289])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#5289]) +1 other test skip
>      * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12755]) +2 other tests skip
>      * igt@kms_selftest@drm_framebuffer:
> 
>           * shard-tglu: NOTRUN -> ABORT ([i915#13179]) +1 other test abort
>      * igt@kms_sequence@queue-busy@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> DMESG-WARN ([i915#12964]) +32 other tests
>             dmesg-warn
>      * igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3555]) +2 other tests skip
>      * igt@kms_setmode@invalid-clone-single-crtc:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3555] / [i915#8809]) +2 other
>             tests skip
>      * igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3555]) +2 other tests skip
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8623])
>      * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
> 
>           * shard-glk: PASS -> INCOMPLETE ([i915#12276])
>      * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: PASS -> SKIP ([i915#1311])
>      * igt@kms_vrr@lobf:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#11920])
>      * igt@kms_vrr@max-min:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9906]) +2 other tests skip
>           * shard-tglu: NOTRUN -> SKIP ([i915#9906]) +1 other test skip
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3555] / [i915#9906])
>      * igt@kms_vrr@seamless-rr-switch-vrr:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9906]) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP ([i915#9906])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8808] / [i915#9906])
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-glk: NOTRUN -> SKIP ([i915#2437]) +2 other tests skip
>           * shard-dg2: NOTRUN -> SKIP ([i915#2437])
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#2437])
>      * igt@perf@global-sseu-config-invalid:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#7387])
>      * igt@perf@unprivileged-single-ctx-counters:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#2433])
>      * igt@perf_pmu@busy-double-start@vecs0:
> 
>           * shard-mtlp: PASS -> FAIL ([i915#4349])
>      * igt@perf_pmu@cpu-hotplug:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8850])
>           * shard-rkl: NOTRUN -> SKIP ([i915#8850])
>           * shard-dg1: NOTRUN -> SKIP ([i915#8850])
>      * igt@perf_pmu@rc6:
> 
>           * shard-rkl: PASS -> DMESG-WARN ([i915#12964]) +27 other tests
>             dmesg-warn
>      * igt@prime_vgem@fence-flip-hang:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3708]) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP ([i915#3708])
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3708]) +1 other test skip
>      * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>           * shard-tglu: NOTRUN -> FAIL ([i915#12910])
> 
>     Possible fixes
> 
>      * igt@gem_eio@in-flight-external:
> 
>           * shard-mtlp: ABORT -> PASS +1 other test pass
>      * igt@gem_exec_suspend@basic-s0@smem:
> 
>           * shard-dg2: INCOMPLETE ([i915#11441] / [i915#13304]) -> PASS +1
>             other test pass
>      * igt@gem_fenced_exec_thrash@no-spare-fences:
> 
>           * shard-rkl: DMESG-WARN ([i915#12964]) -> PASS +37 other tests pass
>      * igt@gem_lmem_swapping@verify-ccs:
> 
>           * shard-dg2: ABORT ([i915#13465]) -> PASS +1 other test pass
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-snb: ABORT ([i915#9820]) -> PASS
>      * igt@i915_pm_rc6_residency@rc6-accuracy:
> 
>           * shard-rkl: FAIL ([i915#12942]) -> PASS +1 other test pass
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
> 
>           * shard-dg1: FAIL ([i915#3591]) -> PASS +1 other test pass
>      * igt@i915_pm_rpm@system-suspend-devices:
> 
>           * shard-dg1: ABORT ([i915#8213]) -> PASS
>      * igt@i915_selftest@live:
> 
>           * shard-rkl: DMESG-FAIL ([i915#13550]) -> PASS +1 other test pass
>      * igt@i915_suspend@sysfs-reader:
> 
>           * shard-rkl: INCOMPLETE ([i915#4817]) -> PASS
