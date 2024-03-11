Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2F1C5475B
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 09:07:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DCB11297F;
	Mon, 11 Mar 2024 09:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4K34YLB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBBE112984
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 09:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710148028; x=1741684028;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=nVoDUT/zudFE3AI5Fla79U60DVjiaDqJsobCdABsjuU=;
 b=j4K34YLBc9SP5f6z5Tidn3ililhkcqNEYLSTGv1fUCljotJzgMcBxGtu
 j9Os/MkOhkXRHD/JC+hkEPEk7qzR4JvPsUDW0p2kmq/lKc/TpWwoKZ8p1
 sdSSiAj9/C+Bw8Bsi0Br3Rs++ZW9qDNCkkg3rwUrDy2J9sImlb4Sk5Iep
 YWYrhpm6EwjS5sTx6FcGWZIjRCpCzcTrkNUHyMAofzbNpIpZ9dVEnDp+2
 nZuow8uVzwxR33kV1mi2bCUzjHjbbiEzCfxu89pw5MohNsIRuCuVYuyh/
 tQuGOCKkGzE95WJlZrmL4t/rL9TkiuN8nXXPgi42X6+TIst16vfCCL4LI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="8552026"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="8552026"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 02:07:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="48568729"
Received: from unknown (HELO localhost) ([10.245.244.192])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 02:07:00 -0700
Date: Mon, 11 Mar 2024 10:06:57 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for Add
 xe_render_copy tests (rev4)
Message-ID: <20240311090657.vlypiwmtjwtcafqr@zkempczy-mobl2>
References: <20240306150219.301977-1-zbigniew.kempczynski@intel.com>
 <170982594052.580595.9465926692404973107@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170982594052.580595.9465926692404973107@8e613ede5ea5>
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

On Thu, Mar 07, 2024 at 03:39:00PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add xe_render_copy tests (rev4)                                 
>    URL:     https://patchwork.freedesktop.org/series/130707/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10790/index.html 
> 
>         CI Bug Log - changes from CI_DRM_14398_full -> IGTPW_10790_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_10790_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_10790_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10790/index.html
> 
> Participating hosts (8 -> 9)
> 
>    Additional (1): shard-snb-0
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_10790_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_exec_schedule@thriceslice@rcs0:
> 
>           * shard-dg2: NOTRUN -> TIMEOUT
>      * igt@kms_flip@flip-vs-rmfb@d-dp4:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE
>      * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
> 
>           * shard-tglu: PASS -> INCOMPLETE

Failures above are not related to code introduced in the series.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_10790_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@crc32:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6230)
>      * igt@api_intel_bb@object-reloc-purge-cache:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8411) +1 other test skip
>      * igt@debugfs_test@basic-hwmon:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9318)
>           * shard-tglu: NOTRUN -> SKIP (i915#9318)
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7701)
>      * igt@drm_fdinfo@busy-idle-check-all@ccs3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8414) +32 other tests skip
>      * igt@drm_fdinfo@busy-idle@vecs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8414) +7 other tests skip
>      * igt@drm_fdinfo@most-busy-idle-check-all@bcs0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8414) +6 other tests skip
>      * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#7742)
>      * igt@gem_basic@multigpu-create-close:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7697) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@block-multicopy-compressed:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_ccs@block-multicopy-inplace:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@ctrl-surf-copy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE (i915#9364)
>      * igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_create@create-ext-set-pat:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#8562)
>      * igt@gem_ctx_exec@basic-nohangcheck:
> 
>           * shard-rkl: PASS -> FAIL (i915#6268)
>      * igt@gem_ctx_persistence@heartbeat-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@heartbeat-hostile:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@heartbeat-stop:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#280) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#280)
>           * shard-dg2: NOTRUN -> SKIP (i915#280)
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@reset-stress:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#5784)
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-dg1: PASS -> FAIL (i915#5784)
>      * igt@gem_exec_balancer@invalid-bonds:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4036)
>      * igt@gem_exec_capture@capture-invisible@lmem0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6334) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#6334) +1 other test skip
>      * igt@gem_exec_capture@capture-invisible@smem0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6334)
>      * igt@gem_exec_capture@many-4k-incremental:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#9606)
>      * igt@gem_exec_fair@basic-none-rrul:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852) +4 other tests
>             skip
>      * igt@gem_exec_fair@basic-none-share:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +7 other tests
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4473 / i915#4771) +1 other test
>             skip
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-tglu: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-none-solo:
> 
>           * shard-snb: NOTRUN -> SKIP +14 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4473)
>      * igt@gem_exec_fair@basic-none@vcs0:
> 
>           * shard-glk: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2842) +2 other tests fail
>      * igt@gem_exec_fence@submit:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4812) +2 other tests skip
>      * igt@gem_exec_fence@submit3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812) +3 other tests skip
>      * igt@gem_exec_flush@basic-uc-set-default:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539)
>      * igt@gem_exec_params@rsvd2-dirt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5107)
>      * igt@gem_exec_reloc@basic-cpu-read-noreloc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +14 other tests skip
>      * igt@gem_exec_reloc@basic-cpu-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +5 other tests skip
>      * igt@gem_exec_reloc@basic-scanout:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +7 other tests skip
>      * igt@gem_exec_reloc@basic-write-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +14 other tests skip
>      * igt@gem_exec_schedule@reorder-wide:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4537 / i915#4812) +1 other test
>             skip
>      * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4860) +1 other test skip
>      * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860) +2 other tests skip
>      * igt@gem_fenced_exec_thrash@too-many-fences:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4860) +2 other tests skip
>      * igt@gem_lmem_evict@dontneed-evict-race:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613 / i915#7582)
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_lmem_swapping@massive:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_lmem_swapping@random-engines:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#4936 / i915#5493)
>      * igt@gem_lmem_swapping@verify-ccs@lmem0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4565)
>      * igt@gem_lmem_swapping@verify-random-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_media_vme:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#284)
>      * igt@gem_mmap@big-bo:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +3 other tests skip
>      * igt@gem_mmap@pf-nonblock:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +3 other tests skip
>      * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +21 other tests skip
>      * igt@gem_mmap_gtt@hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +20 other tests skip
>      * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +6 other tests skip
>      * igt@gem_partial_pwrite_pread@write:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +4 other tests skip
>      * igt@gem_partial_pwrite_pread@write-snoop:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +4 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +1 other test skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +3 other tests skip
>      * igt@gem_pread@exhaustion:
> 
>           * shard-glk: NOTRUN -> WARN (i915#2658)
>      * igt@gem_pxp@create-valid-protected-context:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +6 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_pxp@reject-modify-context-protection-off-3:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>      * igt@gem_pxp@reject-modify-context-protection-on:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4270) +3 other tests skip
>      * igt@gem_pxp@verify-pxp-stale-buf-execution:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4270) +4 other tests skip
>      * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +6 other tests skip
>      * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079) +3 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#8411)
>      * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4079) +1 other test skip
>      * igt@gem_tiled_pread_pwrite:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4079) +1 other test skip
>      * igt@gem_unfence_active_buffers:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4879)
>      * igt@gem_userptr_blits@access-control:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297) +5 other tests skip
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3323)
>      * igt@gem_userptr_blits@forbidden-operations:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3282 / i915#3297)
>      * igt@gem_userptr_blits@map-fixed-invalidate-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880) +1 other test
>             skip
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@readonly-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297) +3 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3297)
>           * shard-dg1: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>      * igt@gem_userptr_blits@unsync-unmap-after-close:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3297)
>      * igt@gen7_exec_parse@bitmasks:
> 
>           * shard-dg2: NOTRUN -> SKIP +36 other tests skip
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856) +3 other tests skip
>      * igt@gen9_exec_parse@basic-rejected-ctx-param:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +2 other tests
>             skip
>      * igt@gen9_exec_parse@bb-start-out:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +2 other tests skip
>      * igt@gen9_exec_parse@bb-start-param:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2527)
>      * igt@gen9_exec_parse@unaligned-jump:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +3 other tests skip
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-dg1: PASS -> INCOMPLETE (i915#9820 / i915#9849)
>      * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8436)
>      * igt@i915_pm_freq_api@freq-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8399)
>      * igt@i915_pm_freq_mult@media-freq@gt0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6590)
>           * shard-tglu: NOTRUN -> SKIP (i915#6590)
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
> 
>           * shard-tglu: NOTRUN -> WARN (i915#2681) +3 other tests warn
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
> 
>           * shard-dg1: PASS -> FAIL (i915#3591)
>      * igt@i915_pm_rps@basic-api:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6621)
>      * igt@i915_pm_rps@min-max-config-loaded:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6621)
>      * igt@i915_pm_rps@thresholds-idle@gt0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8925)
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4387)
>           * shard-rkl: NOTRUN -> SKIP (i915#4387)
>      * igt@i915_query@query-topology-coherent-slice-mask:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6188)
>           * shard-dg2: NOTRUN -> SKIP (i915#6188)
>      * igt@i915_selftest@mock@memory_region:
> 
>           * shard-glk: NOTRUN -> DMESG-WARN (i915#9311)
>           * shard-mtlp: NOTRUN -> DMESG-WARN (i915#9311)
>      * igt@intel_hwmon@hwmon-read:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7707)
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5190)
>      * igt@kms_addfb_basic@clobberred-modifier:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4212)
>           * shard-mtlp: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8709) +3 other tests skip
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9531)
>           * shard-rkl: NOTRUN -> SKIP (i915#9531)
>           * shard-tglu: NOTRUN -> SKIP (i915#9531)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#1769)
>      * igt@kms_big_fb@4-tiled-addfb:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +3 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +3 other tests
>             skip
>      * igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638) +4 other tests skip
>      * igt@kms_big_fb@linear-8bpp-rotate-90:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3638)
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-tglu: PASS -> FAIL (i915#3743)
>      * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6187)
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538) +5 other tests skip
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +14 other tests
>             skip
>      * igt@kms_big_joiner@basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2705)
>      * igt@kms_big_joiner@invalid-modeset:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2705)
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7213 / i915#9010) +3 other tests
>             skip
>      * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7213) +3 other tests skip
>      * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7828) +5 other tests skip
>      * igt@kms_chamelium_frames@hdmi-crc-fast:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7828) +11 other tests skip
>      * igt@kms_chamelium_frames@hdmi-crc-single:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7828) +7 other tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7828) +7 other tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7828) +8 other tests skip
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3299) +1 other test skip
>      * igt@kms_content_protection@legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7118 / i915#9424)
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#9424)
>           * shard-mtlp: NOTRUN -> SKIP (i915#6944 / i915#9424) +2 other tests
>             skip
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9433)
>      * igt@kms_content_protection@srm:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7118)
>           * shard-rkl: NOTRUN -> SKIP (i915#7118)
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118)
>      * igt@kms_content_protection@type1:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7116 / i915#9424)
>      * igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3359) +3 other tests skip
>      * igt@kms_cursor_crc@cursor-offscreen-64x21:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-offscreen-max-size:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3359) +4 other tests skip
>      * igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3359) +1 other test skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +7 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +1 other test skip
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3359)
>      * igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814) +2 other tests
>             skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213) +2 other tests
>             skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4103)
>           * shard-dg1: NOTRUN -> SKIP (i915#4103 / i915#4213) +1 other test
>             skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9809) +2 other tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>           * shard-mtlp: NOTRUN -> SKIP +26 other tests skip
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2346)
>      * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9067)
>           * shard-rkl: NOTRUN -> SKIP (i915#9067)
>      * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9833)
>           * shard-tglu: NOTRUN -> SKIP (i915#9723)
>           * shard-mtlp: NOTRUN -> SKIP (i915#9833)
>      * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9723)
>      * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9227)
>      * igt@kms_dp_aux_dev:
> 
>           * shard-dg2: PASS -> SKIP (i915#1257)
>           * shard-tglu: NOTRUN -> SKIP (i915#1257)
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3840 / i915#9688)
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840) +2 other tests
>             skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3955)
>           * shard-dg1: NOTRUN -> SKIP (i915#3469)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4854)
>           * shard-rkl: NOTRUN -> SKIP (i915#4854)
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9337)
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637) +5 other tests skip
>      * igt@kms_flip@2x-flip-vs-fences:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637) +1 other test skip
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-rkl: NOTRUN -> SKIP +36 other tests skip
>      * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +3 other tests skip
>      * igt@kms_flip@flip-vs-fences:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8381) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672) +2 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +5 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672) +3 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672) +3 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8810) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_force_connector_basic@prune-stale-modes:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5274)
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +33 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +53 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#10055)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
> 
>           * shard-tglu: NOTRUN -> SKIP +54 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-glk: NOTRUN -> SKIP +259 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +18 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +26 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
> 
>           * shard-dg1: NOTRUN -> SKIP +32 other tests skip
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9766)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +32 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +21 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +17 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +15 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +12 other tests skip
>      * igt@kms_hdr@bpc-switch-dpms:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>      * igt@kms_hdr@static-swap:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>      * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#4573) +5 other tests fail
>      * igt@kms_plane_multiple@tiling-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8806)
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8806) +1 other test
>             skip
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6953 / i915#9423)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9423) +3 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9423) +1 other test skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9423) +7 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9423) +3 other tests skip
>      * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5176) +1 other test skip
>      * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5176 / i915#9423) +3 other tests
>             skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5235) +7 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5235) +3 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-dp-4:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235 / i915#9423) +19 other tests
>             skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5235) +11 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#5235) +3 other tests
>             skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5235) +3 other tests skip
>      * igt@kms_pm_backlight@fade-with-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354)
>           * shard-dg1: NOTRUN -> SKIP (i915#5354)
>      * igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9685) +2 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9685) +1 other test skip
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#10139)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9340)
>      * igt@kms_pm_rpm@fences:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +12 other tests skip
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_prime@basic-modeset-hybrid:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6524) +1 other test skip
>      * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9808) +7 other tests skip
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4348)
>           * shard-tglu: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-psr-cursor-mmap-cpu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9673 / i915#9732) +5 other tests
>             skip
>      * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +12 other tests skip
>      * igt@kms_psr@pr-dpms:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +12 other tests skip
>      * igt@kms_psr@pr-sprite-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9732) +16 other tests skip
>      * igt@kms_psr@pr-sprite-plane-onoff:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9732) +17 other tests skip
>      * igt@kms_psr@psr2-primary-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9732) +20 other tests skip
>      * igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077 / i915#9688)
>      * igt@kms_rotation_crc@bad-pixel-format:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4235) +2 other tests skip
>      * igt@kms_rotation_crc@exhaust-fences:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4235) +1 other test skip
>      * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +10 other tests skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4235 / i915#5190)
>      * igt@kms_setmode@basic-clone-single-crtc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8809)
>      * igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8823)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: PASS -> FAIL (i915#9196)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
> 
>           * shard-tglu: PASS -> FAIL (i915#9196) +1 other test fail
>      * igt@kms_vrr@seamless-rr-switch-vrr:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9906)
>           * shard-rkl: NOTRUN -> SKIP (i915#9906)
>           * shard-mtlp: NOTRUN -> SKIP (i915#8808 / i915#9906)
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2437)
>      * igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2437 / i915#9412)
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2437)
>           * shard-glk: NOTRUN -> SKIP (i915#2437) +1 other test skip
>      * igt@perf@global-sseu-config-invalid:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7387) +1 other test skip
>      * igt@perf@per-context-mode-unprivileged:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2435)
>      * igt@perf_pmu@busy-double-start@ccs0:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#4349) +3 other tests fail
>      * igt@perf_pmu@busy-double-start@vecs1:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#4349) +3 other tests fail
>      * igt@perf_pmu@cpu-hotplug:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8850)
>           * shard-rkl: NOTRUN -> SKIP (i915#8850)
>           * shard-tglu: NOTRUN -> SKIP (i915#8850)
>      * igt@perf_pmu@frequency@gt0:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#6806)
>      * igt@perf_pmu@rc6-all-gts:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8516)
>      * igt@perf_pmu@rc6@runtime-pm-gt0:
> 
>           * shard-dg1: PASS -> ABORT (i915#9853)
>      * igt@prime_vgem@basic-fence-mmap:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3708 / i915#4077)
>      * igt@prime_vgem@basic-fence-read:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3708) +1 other test skip
>      * igt@prime_vgem@basic-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708 / i915#4077) +1 other test
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3708 / i915#4077)
>      * igt@prime_vgem@basic-read:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3291 / i915#3708)
>      * igt@prime_vgem@fence-read-hang:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3708) +3 other tests skip
>           * shard-dg2: NOTRUN -> SKIP (i915#3708) +1 other test skip
>      * igt@sriov_basic@bind-unbind-vf:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9917)
>      * igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9917)
>      * igt@syncobj_timeline@invalid-wait-zero-handles:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#9781)
>      * igt@syncobj_wait@invalid-wait-zero-handles:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#9779)
>      * igt@v3d/v3d_submit_cl@valid-submission:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2575) +14 other tests skip
>      * igt@v3d/v3d_submit_csd@bad-multisync-pad:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2575) +7 other tests skip
>      * igt@v3d/v3d_submit_csd@single-out-sync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2575) +16 other tests skip
>      * igt@vc4/vc4_create_bo@create-bo-zeroed:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7711) +4 other tests skip
>      * igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7711) +8 other tests skip
>      * igt@vc4/vc4_purgeable_bo@free-purged-bo:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2575) +12 other tests skip
>      * igt@vc4/vc4_purgeable_bo@mark-purgeable:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7711) +4 other tests skip
>      * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7711) +14 other tests skip
> 
>     Possible fixes
> 
>      * igt@device_reset@unbind-reset-rebind:
> 
>           * shard-tglu: INCOMPLETE (i915#5507) -> PASS
>      * igt@drm_fdinfo@most-busy-check-all@rcs0:
> 
>           * shard-rkl: FAIL (i915#7742) -> PASS
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-rkl: FAIL (i915#2846) -> PASS
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-tglu: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_fair@basic-pace@vecs0:
> 
>           * shard-rkl: FAIL (i915#2842) -> PASS +2 other tests pass
>      * igt@gem_lmem_swapping@heavy-verify-multi@lmem0:
> 
>           * shard-dg2: FAIL (i915#10378) -> PASS +2 other tests pass
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-tglu: INCOMPLETE -> PASS
>      * igt@i915_selftest@live@gem:
> 
>           * shard-dg2: ABORT (i915#10366) -> PASS
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
> 
>           * shard-mtlp: FAIL (i915#5138) -> PASS
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>           * shard-tglu: FAIL (i915#3743) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
> 
>           * shard-dg2: FAIL (i915#6880) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
> 
>           * shard-mtlp: INCOMPLETE -> PASS
>      * igt@kms_plane_multiple@tiling-y@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: INCOMPLETE -> PASS
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-rkl: SKIP (i915#9519) -> PASS +2 other tests pass
>      * igt@kms_sysfs_edid_timing:
> 
>           * shard-dg2: FAIL (IGT#2) -> PASS
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
> 
>           * shard-snb: FAIL (i915#9196) -> PASS
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
> 
>           * shard-mtlp: FAIL (i915#9196) -> PASS
>      * igt@perf@non-zero-reason@0-rcs0:
> 
>           * shard-dg2: FAIL (i915#7484) -> PASS
>      * igt@perf_pmu@busy-idle-check-all@vcs0:
> 
>           * shard-dg2: FAIL (i915#4349) -> PASS +3 other tests pass
> 
>     Warnings
> 
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-glk: ABORT (i915#5566) -> INCOMPLETE (i915#5566)
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-mtlp: ABORT (i915#10131 / i915#9820) -> ABORT (i915#10131 /
>             i915#9697)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-rkl: SKIP (i915#3361) -> FAIL (i915#9295)
>      * igt@kms_psr@fbc-psr-cursor-plane-move:
> 
>           * shard-dg2: SKIP (i915#9673 / i915#9732) -> SKIP (i915#9732) +10
>             other tests skip
>      * igt@kms_psr@psr-cursor-render:
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
>      * IGT: IGT_7749 -> IGTPW_10790
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_14398: e96742a33719079709b8e180448b491622e6a427 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_10790: 10790
>    IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
