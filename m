Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC2AC02193
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 06:06:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C06810E2AD;
	Mon,  3 Feb 2025 06:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gnNuuWnZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5A910E2AD
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 06:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738562777; x=1770098777;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=AtyZYmG6sFDYeYCTW/J+LKmzCFiT/f735nS/JKYzKAY=;
 b=gnNuuWnZqcTE6FN3gskB+xxv44YwEgdSBoIxJUBdojVC7OCzymTi8woV
 vNzgChhwZH5gvooEK29tfzzrgA4j79q6h+0ge7lTMIriaXEJzNQ0HaUyz
 3ouWjmrJW2uRESpm1aS7aiOkqNXuA1HxEhr+kgRYKjDSME4P4C8NVwpHZ
 sATKe6mh3aydwoUgAT8owBFTSQ0o+EDzwZwQdWEljShQO3G9Vn1S33lTe
 FCMnfuF3kdGFQBBFF7XkySjvOj45PcfpwmwrIK6Hon0OH7BKld7JbrDpo
 KOpGqOoe3QU4IV/FN8xD2jyegr/Cz1m8smDjt2QMnfVvnwe5usyctqYnE Q==;
X-CSE-ConnectionGUID: WJe8airKRuWDEX4C+qIDeA==
X-CSE-MsgGUID: EGv8VafvQLaGHCKB6opftA==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="49645627"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="49645627"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 22:06:16 -0800
X-CSE-ConnectionGUID: 6zB4HynfT8i5WpF/jo3MvQ==
X-CSE-MsgGUID: JseWE9+hTaC/hLyypp29BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="147399562"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.27])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 22:06:14 -0800
Date: Mon, 3 Feb 2025 07:06:11 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib=2Figt?=
 =?utf-8?Q?=5Fdevice=5Fscan?= =?utf-8?Q?=3A?= limit fetched device attributes
 from udev (rev3)
Message-ID: <20250203060611.bojkmt6wb6m6g2yb@zkempczy-mobl2>
References: <20250130102741.38454-1-zbigniew.kempczynski@intel.com>
 <173831364597.3146289.16753171993901205982@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173831364597.3146289.16753171993901205982@b555e5b46a47>
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

On Fri, Jan 31, 2025 at 08:54:05AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/igt_device_scan: limit fetched device attributes from udev    
>             (rev3)                                                            
>    URL:     https://patchwork.freedesktop.org/series/144019/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12524/index.html   
> 
>         CI Bug Log - changes from CI_DRM_16047_full -> IGTPW_12524_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_12524_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_12524_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12524/index.html
> 
> Participating hosts (11 -> 11)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_12524_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
> 
>           * shard-mtlp: PASS -> ABORT +1 other test abort
>      * igt@i915_selftest@live@hangcheck:
> 
>           * shard-mtlp: NOTRUN -> DMESG-FAIL

Unrelated to the change.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_12524_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@crc32:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#6230])
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#8411]) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#8411])
>           * shard-dg2: NOTRUN -> SKIP ([i915#8411])
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#11078])
>      * igt@drm_fdinfo@all-busy-check-all:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8414]) +1 other test skip
>      * igt@drm_fdinfo@busy-check-all@bcs0:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8414]) +5 other tests skip
>      * igt@drm_fdinfo@virtual-busy-all:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8414]) +16 other tests skip
>      * igt@gem_busy@semaphore:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3936])
>      * igt@gem_caching@writes:
> 
>           * shard-rkl: PASS -> DMESG-WARN ([i915#12917] / [i915#12964])
>      * igt@gem_ccs@block-multicopy-compressed:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9323])
>      * igt@gem_ccs@block-multicopy-inplace:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3555] / [i915#9323])
>           * shard-tglu: NOTRUN -> SKIP ([i915#3555] / [i915#9323])
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9323])
>      * igt@gem_ccs@large-ctrl-surf-copy:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#13008])
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE ([i915#7297])
>           * shard-rkl: NOTRUN -> SKIP ([i915#9323])
>           * shard-dg1: NOTRUN -> SKIP ([i915#9323])
>      * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE ([i915#12392] / [i915#7297])
>      * igt@gem_close_race@multigpu-basic-threads:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#7697])
>      * igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#6335])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#6335])
>      * igt@gem_create@create-ext-set-pat:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#8562])
>      * igt@gem_ctx_freq@sysfs:
> 
>           * shard-dg2: PASS -> FAIL ([i915#9561]) +1 other test fail
>      * igt@gem_ctx_persistence@processes:
> 
>           * shard-snb: NOTRUN -> SKIP ([i915#1099]) +3 other tests skip
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#280]) +1 other test skip
>      * igt@gem_ctx_sseu@invalid-args:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#280])
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#280]) +1 other test skip
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#280])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#280])
>      * igt@gem_eio@in-flight-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#13197] / [i915#13390])
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-mtlp: PASS -> ABORT ([i915#13193])
>           * shard-snb: NOTRUN -> FAIL ([i915#8898]) +1 other test fail
>      * igt@gem_exec_balancer@bonded-dual:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4771])
>      * igt@gem_exec_balancer@bonded-true-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4812])
>           * shard-dg1: NOTRUN -> SKIP ([i915#4812])
>      * igt@gem_exec_balancer@invalid-bonds:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4036])
>           * shard-dg1: NOTRUN -> SKIP ([i915#4036])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4036])
>      * igt@gem_exec_balancer@parallel-contexts:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#4525]) +1 other test skip
>      * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#4525])
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#4525])
>      * igt@gem_exec_capture@capture-invisible:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#6334]) +2 other tests skip
>           * shard-rkl: NOTRUN -> SKIP ([i915#6334]) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP ([i915#6334]) +1 other test skip
>      * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3539] / [i915#4852]) +2 other
>             tests skip
>      * igt@gem_exec_flush@basic-uc-rw-default:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3539] / [i915#4852]) +3 other
>             tests skip
>      * igt@gem_exec_nop@basic-sequential:
> 
>           * shard-rkl: PASS -> DMESG-WARN ([i915#12964]) +21 other tests
>             dmesg-warn
>      * igt@gem_exec_reloc@basic-active:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3281]) +13 other tests skip
>      * igt@gem_exec_reloc@basic-cpu-read-noreloc:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3281]) +3 other tests skip
>      * igt@gem_exec_reloc@basic-wc-read-active:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3281]) +6 other tests skip
>      * igt@gem_exec_reloc@basic-wc-read-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3281]) +12 other tests skip
>      * igt@gem_exec_schedule@reorder-wide:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4537] / [i915#4812]) +1 other
>             test skip
>      * igt@gem_exec_suspend@basic-s4-devices:
> 
>           * shard-rkl: NOTRUN -> ABORT ([i915#7975] / [i915#8213]) +1 other
>             test abort
>      * igt@gem_fence_thrash@bo-write-verify-none:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4860]) +2 other tests skip
>      * igt@gem_fenced_exec_thrash@too-many-fences:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4860])
>      * igt@gem_lmem_swapping@basic:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#4613]) +1 other test skip
>      * igt@gem_lmem_swapping@massive-random:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4613]) +1 other test skip
>      * igt@gem_lmem_swapping@parallel-multi:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#4613]) +3 other tests skip
>      * igt@gem_lmem_swapping@parallel-random:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#4613]) +3 other tests skip
>      * igt@gem_lmem_swapping@parallel-random-verify:
> 
>           * shard-glk: NOTRUN -> SKIP ([i915#4613]) +2 other tests skip
>      * igt@gem_lmem_swapping@verify-ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#12193])
>      * igt@gem_lmem_swapping@verify-ccs@lmem0:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4565])
>      * igt@gem_madvise@dontneed-before-exec:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3282]) +3 other tests skip
>      * igt@gem_media_vme:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#284])
>           * shard-dg2: NOTRUN -> SKIP ([i915#284])
>           * shard-rkl: NOTRUN -> SKIP ([i915#284])
>           * shard-dg1: NOTRUN -> SKIP ([i915#284])
>           * shard-tglu: NOTRUN -> SKIP ([i915#284])
>      * igt@gem_mmap@pf-nonblock:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4083]) +4 other tests skip
>      * igt@gem_mmap_gtt@cpuset-big-copy:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4077]) +14 other tests skip
>      * igt@gem_mmap_gtt@fault-concurrent-y:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4077]) +1 other test skip
>      * igt@gem_mmap_wc@read:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4083]) +5 other tests skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-display:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3282]) +4 other tests skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#3282]) +3 other tests skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3282]) +6 other tests skip
>      * igt@gem_pxp@create-protected-buffer:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4270]) +2 other tests skip
>      * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4270]) +2 other tests skip
>      * igt@gem_pxp@fail-invalid-protected-context:
> 
>           * shard-rkl: NOTRUN -> TIMEOUT ([i915#12964])
>      * igt@gem_pxp@hw-rejects-pxp-context:
> 
>           * shard-rkl: NOTRUN -> TIMEOUT ([i915#12917] / [i915#12964]) +1
>             other test timeout
>      * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#4270])
>      * igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#5190] / [i915#8428]) +9 other
>             tests skip
>      * igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8428]) +1 other test skip
>      * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4079])
>      * igt@gem_set_tiling_vs_pwrite:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4079])
>           * shard-dg2: NOTRUN -> SKIP ([i915#4079]) +1 other test skip
>      * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4077]) +7 other tests skip
>      * igt@gem_userptr_blits@dmabuf-unsync:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3297]) +1 other test skip
>      * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3297]) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP ([i915#3297])
>      * igt@gem_userptr_blits@map-fixed-invalidate:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3297] / [i915#4880])
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3297] / [i915#4880]) +1 other
>             test skip
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3297]) +1 other test skip
>      * igt@gem_userptr_blits@readonly-unsync:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3297])
>      * igt@gem_userptr_blits@relocations:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3281] / [i915#3297])
>           * shard-rkl: NOTRUN -> SKIP ([i915#3281] / [i915#3297])
>      * igt@gem_userptr_blits@unsync-overlap:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3297]) +1 other test skip
>      * igt@gem_workarounds@suspend-resume-context:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#13356])
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#2527] / [i915#2856]) +1 other
>             test skip
>           * shard-glk: NOTRUN -> ABORT ([i915#5566])
>      * igt@gen9_exec_parse@basic-rejected:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#2856]) +1 other test skip
>      * igt@gen9_exec_parse@batch-without-end:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#2856]) +2 other tests skip
>      * igt@gen9_exec_parse@bb-chained:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#2527]) +5 other tests skip
>      * igt@gen9_exec_parse@cmd-crossing-page:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#2527] / [i915#2856]) +4 other
>             tests skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#2527])
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-mtlp: PASS -> ABORT ([i915#10131] / [i915#10887])
>      * igt@i915_module_load@resize-bar:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#6412])
>      * igt@i915_pm_freq_api@freq-basic-api:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#8399]) +2 other tests skip
>           * shard-rkl: NOTRUN -> SKIP ([i915#8399])
>      * igt@i915_pm_rc6_residency@rc6-fence:
> 
>           * shard-tglu-1: NOTRUN -> WARN ([i915#2681]) +1 other test warn
>      * igt@i915_pm_rps@thresholds:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#11681])
>      * igt@i915_pm_rps@thresholds-park:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#11681])
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#6245])
>      * igt@i915_selftest@live:
> 
>           * shard-rkl: NOTRUN -> DMESG-FAIL ([i915#12964] / [i915#13550])
>      * igt@i915_selftest@live@gt_pm:
> 
>           * shard-rkl: NOTRUN -> DMESG-FAIL ([i915#13550])
>      * igt@i915_selftest@live@workarounds:
> 
>           * shard-mtlp: NOTRUN -> DMESG-FAIL ([i915#12061]) +1 other test
>             dmesg-fail
>      * igt@i915_selftest@mock@memory_region:
> 
>           * shard-rkl: NOTRUN -> DMESG-WARN ([i915#9311]) +1 other test
>             dmesg-warn
>           * shard-dg1: NOTRUN -> DMESG-WARN ([i915#9311]) +1 other test
>             dmesg-warn
>      * igt@i915_suspend@fence-restore-untiled:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#4817])
>      * igt@i915_suspend@sysfs-reader:
> 
>           * shard-glk: PASS -> INCOMPLETE ([i915#4817]) +1 other test
>             incomplete
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#7707])
>      * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4212])
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#5190]) +2 other tests skip
>      * igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4215])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4212])
>      * igt@kms_addfb_basic@tile-pitch-mismatch:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4212]) +1 other test skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs-cc:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#8709]) +1 other test skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-4-rc-ccs-cc:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8709]) +7 other tests skip
>      * igt@kms_async_flips@invalid-async-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12967] / [i915#6228])
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9531])
>           * shard-rkl: NOTRUN -> SKIP ([i915#9531])
>           * shard-dg1: NOTRUN -> SKIP ([i915#9531])
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#1769] / [i915#3555])
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#1769] / [i915#3555])
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
> 
>           * shard-mtlp: PASS -> FAIL ([i915#11808] / [i915#5956]) +1 other
>             test fail
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4538] / [i915#5286]) +4 other
>             tests skip
>      * igt@kms_big_fb@4-tiled-addfb:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#5286]) +1 other test skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#5286]) +7 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#5286]) +5 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#5286]) +2 other tests skip
>      * igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3638]) +6 other tests skip
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>           * shard-dg2: NOTRUN -> SKIP +10 other tests skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#3638])
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4538] / [i915#5190]) +13 other
>             tests skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4538]) +4 other tests skip
>      * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#10307] / [i915#10434] /
>             [i915#6095]) +4 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#6095]) +39 other tests skip
>      * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#6095]) +79 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#10307] / [i915#6095]) +149 other
>             tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#12313])
>           * shard-dg1: NOTRUN -> SKIP ([i915#12313]) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12313])
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12313]) +3 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#12805])
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#6095]) +86 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#6095]) +29 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12805])
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#6095]) +104 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#6095]) +19 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#12796]) +1 other test
>             incomplete
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#12313]) +3 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#12313]) +3 other tests skip
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#7213] / [i915#9010]) +4 other
>             tests skip
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3742]) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#3742])
>      * igt@kms_chamelium_edid@dp-mode-timings:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +3 other
>             tests skip
>      * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +13 other
>             tests skip
>      * igt@kms_chamelium_edid@hdmi-mode-timings:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +8 other
>             tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +5 other
>             tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-fast:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#11151] / [i915#7828])
>      * igt@kms_chamelium_hpd@dp-hpd-storm:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +8 other
>             tests skip
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#7118] / [i915#9424])
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3116] / [i915#3299])
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3116])
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3116] / [i915#3299])
>      * igt@kms_content_protection@legacy:
> 
>           * shard-dg2: NOTRUN -> TIMEOUT ([i915#7173]) +1 other test timeout
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9424]) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP ([i915#9424]) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#9424])
>      * igt@kms_content_protection@type1:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#7116] / [i915#9424])
>      * igt@kms_cursor_crc@cursor-offscreen-256x85:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8814])
>      * igt@kms_cursor_crc@cursor-offscreen-32x10:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3555] / [i915#8814]) +2 other
>             tests skip
>      * igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#13049])
>           * shard-rkl: NOTRUN -> SKIP ([i915#13049]) +1 other test skip
>      * igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#13049]) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#13049])
>      * igt@kms_cursor_crc@cursor-random-32x10:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3555]) +7 other tests skip
>      * igt@kms_cursor_crc@cursor-random-512x170:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#13049]) +1 other test skip
>      * igt@kms_cursor_crc@cursor-random-64x21:
> 
>           * shard-tglu: NOTRUN -> FAIL ([i915#13566]) +1 other test fail
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3555]) +9 other tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3555]) +9 other tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#13049])
>      * igt@kms_cursor_crc@cursor-sliding-128x42:
> 
>           * shard-tglu: PASS -> FAIL ([i915#13566]) +3 other tests fail
>      * igt@kms_cursor_crc@cursor-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#12358] / [i915#7882])
>      * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#12358])
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4103] / [i915#4213])
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4213])
>      * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9809])
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#13046] / [i915#5354]) +3 other
>             tests skip
>      * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9067])
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#4103])
>      * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
> 
>           * shard-dg1: PASS -> DMESG-WARN ([i915#4423]) +2 other tests
>             dmesg-warn
>      * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9833])
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3555])
>      * igt@kms_display_modes@mst-extended-mode-negative:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#8588])
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#1769] / [i915#3555] /
>             [i915#3804])
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3804])
>      * igt@kms_dp_aux_dev:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#1257])
>           * shard-rkl: NOTRUN -> SKIP ([i915#1257])
>           * shard-dg1: NOTRUN -> SKIP ([i915#1257])
>           * shard-tglu: NOTRUN -> SKIP ([i915#1257])
>      * igt@kms_draw_crc@draw-method-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8812])
>      * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3840])
>      * igt@kms_dsc@dsc-with-bpc:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3555] / [i915#3840])
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3555] / [i915#3840])
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3555] / [i915#3840])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3555] / [i915#3840])
>           * shard-dg2: NOTRUN -> SKIP ([i915#3555] / [i915#3840])
>           * shard-dg1: NOTRUN -> SKIP ([i915#3555] / [i915#3840])
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3840] / [i915#9053])
>           * shard-dg1: NOTRUN -> SKIP ([i915#3840] / [i915#9053])
>           * shard-tglu: NOTRUN -> SKIP ([i915#3840] / [i915#9053])
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3469])
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3469])
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4854])
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#2065] / [i915#4854])
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#1839]) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#1839])
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#1839]) +1 other test skip
>      * igt@kms_feature_discovery@psr1:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#658]) +1 other test skip
>      * igt@kms_flip@2x-absolute-wf_vblank:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9934]) +6 other tests skip
>      * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9934]) +12 other tests skip
>      * igt@kms_flip@2x-flip-vs-expired-vblank:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3637]) +2 other tests skip
>      * igt@kms_flip@2x-flip-vs-fences-interruptible:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8381])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8381])
>           * shard-dg2: NOTRUN -> SKIP ([i915#8381])
>      * igt@kms_flip@2x-flip-vs-modeset:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3637]) +5 other tests skip
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#12314] / [i915#12745] /
>             [i915#1982] / [i915#4839])
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#1982] / [i915#4839])
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3637]) +4 other tests skip
>      * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
> 
>           * shard-snb: NOTRUN -> FAIL ([i915#11989]) +3 other tests fail
>      * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9934]) +5 other tests skip
>      * igt@kms_flip@basic-flip-vs-wf_vblank:
> 
>           * shard-tglu: PASS -> FAIL ([i915#11989]) +1 other test fail
>      * igt@kms_flip@flip-vs-absolute-wf_vblank:
> 
>           * shard-mtlp: PASS -> FAIL ([i915#11989]) +1 other test fail
>      * igt@kms_flip@flip-vs-fences@a-hdmi-a1:
> 
>           * shard-rkl: NOTRUN -> DMESG-WARN ([i915#12964]) +25 other tests
>             dmesg-warn
>      * igt@kms_flip@flip-vs-rmfb:
> 
>           * shard-dg1: PASS -> INCOMPLETE ([i915#6113]) +1 other test
>             incomplete
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#12745] / [i915#4839])
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#12745])
>      * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
> 
>           * shard-dg1: NOTRUN -> DMESG-WARN ([i915#4423]) +4 other tests
>             dmesg-warn
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#2672] / [i915#3555]) +2 other
>             tests skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#2672] / [i915#3555])
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#2587] / [i915#2672])
>           * shard-tglu: NOTRUN -> SKIP ([i915#2587] / [i915#2672]) +4 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#2672] / [i915#3555]) +4 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#2672] / [i915#3555])
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#2672] / [i915#8813]) +1 other
>             test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#2672])
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#2672] / [i915#3555]) +1 other
>             test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#2587] / [i915#2672]) +1 other
>             test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#2672] / [i915#3555] /
>             [i915#5190]) +3 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#2672] / [i915#3555] /
>             [i915#8813]) +3 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#2672]) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8708]) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8708]) +18 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#5354]) +31 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
> 
>           * shard-tglu: NOTRUN -> SKIP +95 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +57 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> 
>           * shard-dg1: NOTRUN -> SKIP +36 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3458]) +16 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP +25 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#1825]) +15 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#10433] / [i915#3458])
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#5439])
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9766])
>           * shard-tglu: NOTRUN -> SKIP ([i915#9766])
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8708]) +17 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3023]) +35 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-rte:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3458]) +19 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#1825]) +57 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
> 
>           * shard-snb: NOTRUN -> SKIP +469 other tests skip
>      * igt@kms_hdr@bpc-switch:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3555] / [i915#8228]) +1 other
>             test skip
>      * igt@kms_hdr@bpc-switch-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3555] / [i915#8228]) +4 other
>             tests skip
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3555] / [i915#8228])
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#1187] / [i915#12713])
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3555] / [i915#8228])
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-dg2: PASS -> SKIP ([i915#3555] / [i915#8228])
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3555] / [i915#8228]) +1 other
>             test skip
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3555] / [i915#8228])
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#12339])
>      * igt@kms_joiner@invalid-modeset-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#10656])
>      * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#12394])
>      * igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#12339]) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP ([i915#12339]) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP ([i915#12339])
>      * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#13522])
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#1839])
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#6301]) +1 other test skip
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#6301])
>      * igt@kms_plane_alpha_blend@alpha-transparent-fb:
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#10647] / [i915#12177])
>      * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#10647]) +1 other test fail
>      * igt@kms_plane_lowres@tiling-none:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#11614] / [i915#3582]) +1 other
>             test skip
>      * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#10226] / [i915#11614] /
>             [i915#3582]) +2 other tests skip
>      * igt@kms_plane_multiple@tiling-y:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3555] / [i915#8806])
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#6953])
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12247]) +13 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#12247]) +23 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#12247]) +14 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12247] / [i915#9423]) +3 other
>             tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#12247]) +7 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
> 
>           * shard-glk: NOTRUN -> SKIP +282 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12247]) +19 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12247] / [i915#6953] /
>             [i915#9423])
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12247] / [i915#6953])
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#12247] / [i915#6953])
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#12247] / [i915#6953])
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#12247]) +13 other tests skip
>      * igt@kms_pm_backlight@bad-brightness:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#5354]) +1 other test skip
>      * igt@kms_pm_backlight@basic-brightness:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#9812])
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#12343])
>      * igt@kms_pm_backlight@fade-with-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9812]) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP ([i915#5354])
>      * igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9685])
>           * shard-dg1: NOTRUN -> SKIP ([i915#9685])
>           * shard-tglu: NOTRUN -> SKIP ([i915#9685])
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#5978])
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9519])
>      * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-rkl: PASS -> SKIP ([i915#9519])
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-dg2: PASS -> SKIP ([i915#9519])
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9519])
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9519])
>      * igt@kms_prime@basic-crc-hybrid:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#6524] / [i915#6805])
>      * igt@kms_prime@basic-modeset-hybrid:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#6524])
>      * igt@kms_prime@d3hot:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#6524])
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
> 
>           * shard-snb: NOTRUN -> SKIP ([i915#11520]) +14 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#11520]) +6 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#11520]) +6 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9808]) +1 other test skip
>      * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12316]) +4 other tests skip
>      * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#11520]) +14 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
> 
>           * shard-glk: NOTRUN -> SKIP ([i915#11520]) +5 other tests skip
>      * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#11520]) +7 other tests skip
>      * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#11520]) +8 other tests skip
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9683])
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9683]) +1 other test skip
>      * igt@kms_psr@fbc-pr-sprite-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#1072] / [i915#9732]) +18 other
>             tests skip
>      * igt@kms_psr@fbc-psr2-cursor-mmap-cpu:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9688]) +8 other tests skip
>      * igt@kms_psr@fbc-psr2-no-drrs:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9732]) +23 other tests skip
>      * igt@kms_psr@pr-suspend:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#1072] / [i915#9732]) +14 other
>             tests skip
>      * igt@kms_psr@psr2-cursor-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#1072] / [i915#9732]) +25 other
>             tests skip
>      * igt@kms_psr@psr2-primary-mmap-cpu:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#9732]) +12 other tests skip
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9685]) +1 other test skip
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#9685])
>      * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#5289]) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP ([i915#5289])
>      * igt@kms_rotation_crc@primary-rotation-270:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12755])
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#5289])
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#5289])
>      * igt@kms_scaling_modes@scaling-mode-center:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3555]) +9 other tests skip
>      * igt@kms_selftest@drm_framebuffer:
> 
>           * shard-rkl: NOTRUN -> ABORT ([i915#13179]) +1 other test abort
>      * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#12276]) +1 other test
>             incomplete
>      * igt@kms_vrr@flip-basic-fastset:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9906]) +1 other test skip
>      * igt@kms_vrr@lobf:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#11920])
>           * shard-dg1: NOTRUN -> SKIP ([i915#11920])
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3555] / [i915#9906])
>      * igt@kms_vrr@seamless-rr-switch-drrs:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9906])
>      * igt@kms_vrr@seamless-rr-switch-vrr:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9906])
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#2437])
>           * shard-tglu: NOTRUN -> SKIP ([i915#2437])
>      * igt@kms_writeback@writeback-check-output-xrgb2101010:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#2437] / [i915#9412])
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-glk: NOTRUN -> SKIP ([i915#2437])
>      * igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>           * shard-mtlp: NOTRUN -> SKIP +6 other tests skip
>      * igt@perf@global-sseu-config:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#7387])
>      * igt@perf_pmu@all-busy-idle-check-all:
> 
>           * shard-mtlp: PASS -> FAIL ([i915#11943])
>      * igt@perf_pmu@cpu-hotplug:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#8850])
>      * igt@perf_pmu@rc6@other-idle-gt0:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#8516])
>      * igt@prime_vgem@basic-fence-flip:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3708])
>           * shard-dg2: NOTRUN -> SKIP ([i915#3708])
>      * igt@prime_vgem@basic-write:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3291] / [i915#3708])
>      * igt@sriov_basic@bind-unbind-vf@vf-1:
> 
>           * shard-tglu-1: NOTRUN -> FAIL ([i915#12910]) +9 other tests fail
>      * igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9917]) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP ([i915#9917]) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#9917]) +2 other tests skip
>      * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2:
> 
>           * shard-mtlp: NOTRUN -> FAIL ([i915#12910]) +9 other tests fail
> 
>     Possible fixes
> 
>      * igt@gem_eio@context-create:
> 
>           * shard-mtlp: ABORT -> PASS
>      * igt@gem_eio@reset-stress:
> 
>           * shard-dg1: FAIL ([i915#12543] / [i915#5784]) -> PASS
>      * igt@gem_exec_suspend@basic-s4-devices:
> 
>           * shard-tglu: ABORT ([i915#7975] / [i915#8213]) -> PASS +1 other
>             test pass
>      * igt@gem_mmap_offset@clear-via-pagefault:
> 
>           * shard-mtlp: ABORT ([i915#10729]) -> PASS +1 other test pass
>      * igt@i915_pm_rc6_residency@rc6-idle:
> 
>           * shard-dg1: FAIL ([i915#3591]) -> PASS
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
> 
>           * shard-dg1: FAIL ([i915#12739] / [i915#3591]) -> PASS
>      * igt@i915_pm_rpm@system-suspend-devices:
> 
>           * shard-mtlp: ABORT ([i915#13193]) -> PASS +2 other tests pass
>      * igt@i915_suspend@fence-restore-untiled:
> 
>           * shard-rkl: DMESG-FAIL ([i915#12964]) -> PASS
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-mtlp: FAIL ([i915#5138]) -> PASS +1 other test pass
>      * igt@kms_cursor_crc@cursor-sliding-64x21:
> 
>           * shard-rkl: FAIL ([i915#13566]) -> PASS
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
> 
>           * shard-snb: SKIP -> [PASS][424] +1 other test pass
