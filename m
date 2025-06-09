Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58783C5B552
	for <igt-dev@archiver.kernel.org>; Mon,  9 Jun 2025 06:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0F410E6DC;
	Mon,  9 Jun 2025 06:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kfRGlmmp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A2F10E5BB
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jun 2025 06:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749450467; x=1780986467;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=H8nOIEAnlyz84D4h7MCkqz3FTzB+lbut1NrZOhwbJ4w=;
 b=kfRGlmmpXegFeM6nUzCVJL0Dnj3gqSPSeSxDMHHc99B9O8rfkmiUbeSX
 Fv28S5pjKxjuylmATE6l7grwGm/GEepJvo5xbEcNfKhKvac0eO9YGHBpz
 isych1xRHIpBkMbAPQg6Ma5xFvUmOBpnPcwtvqg9+V7erIoDdZk03BEHd
 bZ251b+QMP6yvdg1DPQ5Na3uNn40x3fmnrIYxVD/tPNYz6xN/UNmJ9StO
 qh+0GdtH05Y3fa6W+keAHZsN+sKdKsUgjrlYarcGGDx1/j9UacsiRJ23B
 SphMHMrz7ibPftYWmanAAkGI/dWDHNaGMZzT+lCzDuZNW1P0U26V39CXk w==;
X-CSE-ConnectionGUID: 9qQ0vCRrSEmhw5dWIgwmDA==
X-CSE-MsgGUID: r8nL0x07RSOQz6yaFxSVEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51656048"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="51656048"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2025 23:27:46 -0700
X-CSE-ConnectionGUID: f5fS1DjMTeaHoR+UenScFA==
X-CSE-MsgGUID: /zDkuoNFT4Ci33h6PFhtNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="146943134"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.244])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2025 23:27:41 -0700
Date: Mon, 9 Jun 2025 08:27:33 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib=2Fint?=
 =?utf-8?Q?el=5Fcompute?= =?utf-8?Q?=3A?= change shader and logic for
 threadgroup preemption
Message-ID: <zrcrgfavacrmmpua7hy6h4uipahnrjn3zh65upa2jd5i4fxbsg@c3bta4zvbgcf>
References: <20250606103937.576276-2-zbigniew.kempczynski@intel.com>
 <174927651675.57761.1338663238830517855@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174927651675.57761.1338663238830517855@1538d3639d33>
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

On Sat, Jun 07, 2025 at 06:08:36AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/intel_compute: change shader and logic for threadgroup        
>             preemption                                                        
>    URL:     https://patchwork.freedesktop.org/series/149934/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13254/index.html   
> 
>         CI Bug Log - changes from CI_DRM_16664_full -> IGTPW_13254_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_13254_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_13254_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13254/index.html
> 
> Participating hosts (10 -> 10)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_13254_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_softpin@noreloc:
> 
>           * shard-dg2-9: NOTRUN -> ABORT
>      * igt@i915_pm_rpm@gem-pread:
> 
>           * shard-dg2-9: NOTRUN -> DMESG-WARN
>      * igt@kms_pipe_crc_basic@suspend-read-crc:
> 
>           * shard-snb: PASS -> DMESG-WARN +1 other test dmesg-warn
>      * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-256:
> 
>           * shard-rkl: PASS -> FAIL +3 other tests fail

Unreleated to the patch, it touches xe_compute_preempt only.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_13254_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8411)
>      * igt@device_reset@unbind-cold-reset-rebind:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11078)
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@block-multicopy-compressed:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_ccs@large-ctrl-surf-copy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13008)
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_close_race@multigpu-basic-threads:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_create@create-ext-set-pat:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#8562)
>      * igt@gem_ctx_isolation@preservation-s3@rcs0:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12353) +1 other test
>             incomplete
>      * igt@gem_ctx_persistence@hang:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@heartbeat-stop:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@process:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#1099)
>      * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5882) +6 other tests skip
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#280)
>           * shard-rkl: NOTRUN -> SKIP (i915#280)
>           * shard-dg1: NOTRUN -> SKIP (i915#280)
>      * igt@gem_ctx_sseu@invalid-args:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@in-flight-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13390)
>      * igt@gem_eio@reset-stress:
> 
>           * shard-dg1: PASS -> FAIL (i915#5784)
>      * igt@gem_exec_balancer@bonded-pair:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4771)
>      * igt@gem_exec_balancer@parallel:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525) +3 other tests skip
>      * igt@gem_exec_balancer@parallel-bb-first:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_capture@capture:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#11965) +1 other test fail
>      * igt@gem_exec_capture@pi:
> 
>           * shard-rkl: PASS -> DMESG-WARN (i915#12964) +16 other tests
>             dmesg-warn
>      * igt@gem_exec_fence@concurrent:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_flush@basic-batch-kernel-default-uc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852)
>      * igt@gem_exec_params@rsvd2-dirt:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#5107)
>      * igt@gem_exec_reloc@basic-range:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +4 other tests skip
>      * igt@gem_exec_reloc@basic-softpin:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +7 other tests skip
>      * igt@gem_exec_reloc@basic-write-gtt:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3281) +7 other tests skip
>      * igt@gem_exec_reloc@basic-write-read-active:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +17 other tests skip
>      * igt@gem_exec_reloc@basic-write-wc-noreloc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +2 other tests skip
>      * igt@gem_exec_schedule@preempt-queue-chain:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4537 / i915#4812) +1 other test
>             skip
>      * igt@gem_exec_schedule@preempt-queue-contexts-chain:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4537 / i915#4812)
>           * shard-dg1: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_schedule@smoketest-all:
> 
>           * shard-snb: NOTRUN -> SKIP +40 other tests skip
>      * igt@gem_fence_thrash@bo-write-verify-threaded-none:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_fenced_exec_thrash@2-spare-fences:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860) +2 other tests skip
>      * igt@gem_fenced_exec_thrash@no-spare-fences:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4860) +2 other tests skip
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2190)
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#12193)
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4565)
>      * igt@gem_lmem_swapping@massive-random:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@smem-oom:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * shard-dg1: PASS -> TIMEOUT (i915#5493) +1 other test timeout
>      * igt@gem_lmem_swapping@verify-ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +7 other tests skip
>      * igt@gem_media_vme:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#284)
>      * igt@gem_mmap_gtt@basic-small-bo-tiledy:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4077) +6 other tests skip
>      * igt@gem_mmap_gtt@basic-write-read-distinct:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +1 other test skip
>      * igt@gem_mmap_gtt@flink-race:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077)
>      * igt@gem_mmap_gtt@medium-copy-xy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +9 other tests skip
>      * igt@gem_mmap_wc@copy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +8 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +1 other test skip
>      * igt@gem_mmap_wc@write-read:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +1 other test skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +11 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282)
>      * igt@gem_pread@self:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +1 other test skip
>      * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>           * shard-rkl: NOTRUN -> TIMEOUT (i915#12964)
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_pxp@hw-rejects-pxp-buffer:
> 
>           * shard-rkl: NOTRUN -> TIMEOUT (i915#12917 / i915#12964) +6 other
>             tests timeout
>      * igt@gem_pxp@hw-rejects-pxp-context:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13717)
>      * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_pxp@verify-pxp-stale-ctx-execution:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_readwrite@new-obj:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3282) +2 other tests skip
>      * igt@gem_render_copy@x-tiled-to-vebox-y-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +1 other test skip
>      * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#5190 / i915#8428) +1 other test
>             skip
>      * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +4 other tests
>             skip
>      * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8411) +2 other tests skip
>      * igt@gem_softpin@evict-snoop-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4885)
>      * igt@gem_tiled_pread_pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079) +1 other test skip
>      * igt@gem_userptr_blits@access-control:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@coherency-sync:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3297) +5 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297) +3 other tests skip
>      * igt@gen3_render_tiledy_blits:
> 
>           * shard-dg2-9: NOTRUN -> SKIP +2 other tests skip
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +3 other tests skip
>      * igt@gen9_exec_parse@bb-chained:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2856)
>      * igt@gen9_exec_parse@bb-large:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2527) +1 other test skip
>      * igt@gen9_exec_parse@bb-oversize:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +7 other tests skip
>      * igt@gen9_exec_parse@bb-start-param:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +3 other tests
>             skip
>      * igt@gen9_exec_parse@unaligned-jump:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856) +1 other test skip
>      * igt@i915_drm_fdinfo@busy-check-all@bcs0:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11527) +7 other tests skip
>      * igt@i915_drm_fdinfo@most-busy-check-all@vecs0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14073) +7 other tests skip
>      * igt@i915_module_load@reload:
> 
>           * shard-snb: PASS -> ABORT (i915#11703)
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#4391 / i915#4423)
>      * igt@i915_module_load@resize-bar:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6412)
>      * igt@i915_pm_freq_mult@media-freq@gt0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6590) +1 other test skip
>      * igt@i915_pm_rc6_residency@rc6-fence:
> 
>           * shard-tglu: NOTRUN -> WARN (i915#13790 / i915#2681) +1 other test
>             warn
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
> 
>           * shard-dg1: PASS -> FAIL (i915#3591)
>      * igt@i915_query@query-topology-coherent-slice-mask:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6188)
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-rkl: NOTRUN -> INCOMPLETE (i915#12964 / i915#4817)
>           * shard-tglu-1: NOTRUN -> INCOMPLETE (i915#4817 / i915#7443)
>      * igt@i915_suspend@sysfs-reader:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#4817)
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7707)
>      * igt@kms_addfb_basic@basic-x-tiled-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4212)
>           * shard-dg1: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12454 / i915#12712)
>      * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-1-4-mc-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8709) +7 other tests skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y-rc-ccs-cc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8709) +3 other tests skip
>      * igt@kms_atomic_transition@plane-all-modeset-transition:
> 
>           * shard-dg2-9: NOTRUN -> FAIL (i915#5956) +1 other test fail
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +3 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5286)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +12 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +1 other test
>             skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-mtlp: PASS -> FAIL (i915#5138)
>      * igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638) +8 other tests skip
>      * igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>           * shard-mtlp: NOTRUN -> SKIP +8 other tests skip
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>           * shard-dg2: NOTRUN -> SKIP +11 other tests skip
>      * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4538 / i915#5190) +5 other
>             tests skip
>      * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +5 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>           * shard-dg1: NOTRUN -> SKIP +10 other tests skip
>      * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +3 other tests skip
>      * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>             +6 other tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +24 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +180 other
>             tests skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +128 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#6095) +76 other
>             tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12805)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12805)
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6095) +4 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-dp-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6095) +25 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12313) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12313) +4 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#12313)
>           * shard-dg2: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#10307 / i915#6095) +19 other
>             tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +54 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +55 other tests skip
>      * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4423 / i915#6095)
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3742)
>           * shard-tglu: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-2:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13781) +4 other tests skip
>      * igt@kms_chamelium_edid@dp-edid-read:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11151 / i915#7828) +2 other
>             tests skip
>      * igt@kms_chamelium_frames@dp-crc-single:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11151 / i915#7828) +1 other
>             test skip
>      * igt@kms_chamelium_hpd@dp-hpd-fast:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11151 / i915#7828) +2 other tests
>             skip
>      * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#11151 / i915#7828) +2 other
>             tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-storm:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11151 / i915#7828) +10 other
>             tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#7828) +19 other
>             tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11151 / i915#7828) +6 other
>             tests skip
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7118 / i915#9424) +1 other test
>             skip
>      * igt@kms_content_protection@atomic-dpms@pipe-a-dp-3:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#7173) +1 other test fail
>      * igt@kms_content_protection@content-type-change:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9424) +2 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#9424) +1 other test
>             skip
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3116)
>      * igt@kms_content_protection@legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7118 / i915#9424)
>      * igt@kms_content_protection@lic-type-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#14386)
>      * igt@kms_content_protection@type1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118 /
>             i915#9424)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#7118 / i915#9424)
>      * igt@kms_cursor_crc@cursor-offscreen-128x42:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814)
>      * igt@kms_cursor_crc@cursor-offscreen-32x32:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +1 other test skip
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#13566) +5 other tests fail
>           * shard-tglu: PASS -> FAIL (i915#13566) +3 other tests fail
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13049) +2 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#13566) +1 other test fail
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>           * shard-snb: PASS -> SKIP +2 other tests skip
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP +47 other tests skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4103 / i915#4213)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4103) +1 other test skip
>      * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#4423) +2 other tests
>             dmesg-warn
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13046 / i915#5354) +1 other
>             test skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13046 / i915#5354) +4 other tests
>             skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9723)
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13691)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3804)
>           * shard-tglu: NOTRUN -> SKIP (i915#1769 / i915#3555 / i915#3804)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_dp_link_training@non-uhbr-mst:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13749)
>      * igt@kms_dp_link_training@uhbr-mst:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13748)
>      * igt@kms_dp_linktrain_fallback@dsc-fallback:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13707)
>      * igt@kms_dsc@dsc-basic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840) +3 other tests
>             skip
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840)
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3955)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4854)
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1839)
>           * shard-mtlp: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#1839)
>           * shard-dg2-9: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@psr1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#658)
>           * shard-rkl: NOTRUN -> SKIP (i915#658)
>           * shard-dg1: NOTRUN -> SKIP (i915#658)
>      * igt@kms_flip@2x-flip-vs-dpms:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#9934) +5 other tests
>             skip
>      * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9934) +2 other tests skip
>      * igt@kms_flip@2x-flip-vs-panning-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9934) +2 other tests skip
>      * igt@kms_flip@2x-flip-vs-panning-vs-hang:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637 / i915#9934) +2 other tests
>             skip
>      * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
> 
>           * shard-snb: PASS -> TIMEOUT (i915#14033) +1 other test timeout
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9934) +20 other tests skip
>      * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3637 / i915#9934)
>      * igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1:
> 
>           * shard-snb: PASS -> FAIL (i915#13734) +1 other test fail
>      * igt@kms_flip@blocking-wf_vblank:
> 
>           * shard-mtlp: PASS -> FAIL (i915#13734) +3 other tests fail
>      * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a2:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#13734) +1 other test fail
>      * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1:
> 
>           * shard-tglu: PASS -> FAIL (i915#13734) +3 other tests fail
>      * igt@kms_flip@flip-vs-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12745 / i915#4839 /
>             i915#6113)
>      * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12745 / i915#6113)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8810 / i915#8813)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8810 / i915#8813)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2587 / i915#2672) +1 other
>             test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2672 / i915#3555) +2 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672 / i915#8813) +2 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2587 / i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +3 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672 / i915#3555 / i915#5190) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672 / i915#3555 / i915#8813) +4
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672 / i915#3555) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672) +4 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2672) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672 / i915#3555) +10 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672) +10 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
> 
>           * shard-dg2: PASS -> FAIL (i915#6880)
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +22 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +17 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#5354) +13 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +73 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10433 / i915#3458)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3458) +8 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +46 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +8 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#8708) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +16 other tests skip
>      * igt@kms_hdr@bpc-switch:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228)
>           * shard-mtlp: NOTRUN -> SKIP (i915#12713 / i915#3555 / i915#8228)
>      * igt@kms_hdr@static-swap:
> 
>           * shard-dg2: PASS -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228) +2 other tests
>             skip
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_joiner@basic-force-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12388)
>      * igt@kms_joiner@basic-force-ultra-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12394)
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12339)
>           * shard-rkl: NOTRUN -> SKIP (i915#12339)
>           * shard-dg1: NOTRUN -> SKIP (i915#12339)
>      * igt@kms_joiner@invalid-modeset-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#10656)
>      * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10656)
>      * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13522)
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_plane_alpha_blend@constant-alpha-max:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10647 / i915#12169)
>      * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10647) +1 other test fail
>      * igt@kms_plane_lowres@tiling-yf:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +12 other tests skip
>      * igt@kms_plane_multiple@2x-tiling-x:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@tiling-4:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14259)
>           * shard-dg1: NOTRUN -> SKIP (i915#14259)
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14259)
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6953)
>           * shard-mtlp: NOTRUN -> SKIP (i915#6953)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#12247 / i915#9423) +1 other
>             test skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12247) +20 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#12247) +7 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12247) +4 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12247 / i915#6953 / i915#9423)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12247 / i915#9423)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12247 / i915#6953) +3 other tests
>             skip
>           * shard-tglu: NOTRUN -> SKIP (i915#12247 / i915#6953)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12247) +8 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12247) +11 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12247 / i915#3555 / i915#9423)
>           * shard-rkl: NOTRUN -> SKIP (i915#12247 / i915#3555)
>           * shard-dg1: NOTRUN -> SKIP (i915#12247 / i915#3555)
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#12247) +3 other tests skip
>      * igt@kms_pm_backlight@fade-with-dpms:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9812)
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3828)
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_pm_dc@dc9-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3361)
>           * shard-tglu: NOTRUN -> SKIP (i915#4281)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9340)
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-dg2: PASS -> SKIP (i915#9519) +1 other test skip
>      * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9519) +1 other test skip
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-rkl: PASS -> SKIP (i915#12916)
>      * igt@kms_prime@basic-modeset-hybrid:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6524 / i915#6805) +1 other test
>             skip
>      * igt@kms_prime@d3hot:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11520) +9 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12316) +1 other test skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9808)
>      * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#11520) +14 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11520) +6 other tests skip
>      * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11520) +19 other tests skip
>      * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#11520) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-psr-cursor-plane-move:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +18 other tests
>             skip
>      * igt@kms_psr@fbc-psr-cursor-plane-onoff:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#1072 / i915#9732) +10 other
>             tests skip
>      * igt@kms_psr@fbc-psr-primary-page-flip:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +4 other tests
>             skip
>      * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +11 other tests skip
>      * igt@kms_psr@fbc-psr2-primary-mmap-gtt:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +18 other tests skip
>      * igt@kms_psr@fbc-psr2-sprite-render:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +45 other tests
>             skip
>      * igt@kms_psr@pr-no-drrs:
> 
>           * shard-glk: NOTRUN -> SKIP +424 other tests skip
>      * igt@kms_psr@psr-cursor-render:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9732)
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9685) +3 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_rmfb@close-fd@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> DMESG-WARN (i915#12964) +26 other tests
>             dmesg-warn
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12755 / i915#5190)
>           * shard-rkl: NOTRUN -> SKIP (i915#5289) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#5289)
>           * shard-tglu: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@sprite-rotation-90:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12755) +2 other tests skip
>      * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#12755)
>      * igt@kms_sequence@queue-idle@pipe-c-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> DMESG-WARN (i915#118) +1 other test
>             dmesg-warn
>      * igt@kms_setmode@basic-clone-single-crtc:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3555)
>      * igt@kms_setmode@invalid-clone-single-crtc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8809)
>      * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12276) +1 other test
>             incomplete
>      * igt@kms_vrr@flip-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>      * igt@kms_vrr@lobf:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11920)
>      * igt@kms_vrr@max-min:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9906) +2 other tests skip
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-dg2: PASS -> SKIP (i915#3555 / i915#9906)
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#9906)
>      * igt@kms_vrr@seamless-rr-switch-vrr:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9906)
>           * shard-mtlp: NOTRUN -> SKIP (i915#8808 / i915#9906)
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2437)
>      * igt@kms_writeback@writeback-check-output-xrgb2101010:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2437 / i915#9412)
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2437)
>           * shard-rkl: NOTRUN -> SKIP (i915#2437)
>           * shard-dg1: NOTRUN -> SKIP (i915#2437)
>      * igt@perf@mi-rpc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2434)
>      * igt@perf@non-zero-reason:
> 
>           * shard-dg2-9: NOTRUN -> FAIL (i915#9100) +1 other test fail
>      * igt@perf_pmu@busy-double-start@vcs1:
> 
>           * shard-mtlp: PASS -> FAIL (i915#4349) +2 other tests fail
>      * igt@perf_pmu@interrupts:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#14415)
>      * igt@perf_pmu@module-unload:
> 
>           * shard-rkl: NOTRUN -> INCOMPLETE (i915#13520)
>           * shard-tglu: NOTRUN -> INCOMPLETE (i915#13520)
>      * igt@perf_pmu@most-busy-idle-check-all:
> 
>           * shard-rkl: PASS -> FAIL (i915#4349) +1 other test fail
>      * igt@perf_pmu@rc6-all-gts:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8516)
>           * shard-tglu: NOTRUN -> SKIP (i915#8516)
>           * shard-dg2-9: NOTRUN -> SKIP (i915#8516)
>      * igt@prime_vgem@basic-fence-read:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3291 / i915#3708)
>      * igt@prime_vgem@basic-read:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3291 / i915#3708)
>      * igt@prime_vgem@fence-read-hang:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3708)
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-tglu: NOTRUN -> SKIP +68 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3708)
>      * igt@sriov_basic@bind-unbind-vf:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9917) +2 other tests skip
>      * igt@sriov_basic@enable-vfs-bind-unbind-each:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9917) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#9917)
>      * igt@tools_test@sysfs_l3_parity:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4818)
> 
>     Possible fixes
> 
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-dg2: ABORT (i915#13427) -> PASS
>      * igt@gem_eio@in-flight-internal-immediate:
> 
>           * shard-mtlp: ABORT (i915#13723) -> PASS
>      * igt@gem_eio@kms:
> 
>           * shard-dg2: FAIL (i915#5784) -> PASS
>           * shard-dg1: FAIL (i915#5784) -> PASS
>      * igt@gem_exec_suspend@basic-s0:
> 
>           * shard-dg2: INCOMPLETE (i915#11441 / i915#13304) -> PASS
>      * igt@gem_exec_suspend@basic-s0@lmem0:
> 
>           * shard-dg2: INCOMPLETE (i915#11441) -> PASS
>      * igt@gem_pxp@create-regular-context-1:
> 
>           * shard-rkl: TIMEOUT (i915#12917 / i915#12964) -> PASS
>      * igt@i915_module_load@reload-no-display:
> 
>           * shard-tglu: DMESG-WARN (i915#13029) -> PASS
>      * igt@i915_pm_freq_api@freq-suspend@gt0:
> 
>           * shard-dg2: INCOMPLETE (i915#12455 / i915#13820) -> PASS +1 other
>             test pass
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
> 
>           * shard-dg1: FAIL (i915#3591) -> PASS
>      * igt@i915_pm_rpm@gem-evict-pwrite:
> 
>           * shard-rkl: SKIP (i915#13328) -> PASS +1 other test pass
>      * igt@i915_selftest@live@gt_pm:
> 
>           * shard-rkl: DMESG-FAIL (i915#13550) -> PASS +1 other test pass
>      * igt@i915_suspend@fence-restore-untiled:
> 
>           * shard-rkl: INCOMPLETE (i915#4817) -> PASS
>      * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:
> 
>           * shard-dg1: DMESG-WARN (i915#4423) -> PASS +12 other tests pass
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-mtlp: FAIL (i915#5138) -> PASS
>      * igt@kms_cursor_crc@cursor-offscreen-256x256:
> 
>           * shard-rkl: DMESG-WARN (i915#12917 / i915#12964) -> PASS +1 other
>             test pass
>      * igt@kms_cursor_crc@cursor-onscreen-128x42:
> 
>           * shard-tglu: FAIL (i915#13566) -> PASS +1 other test pass
>      * igt@kms_cursor_crc@cursor-sliding-64x21:
> 
>           * shard-rkl: FAIL (i915#13566) -> PASS
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>           * shard-snb: SKIP -> PASS +3 other tests pass
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-rkl: FAIL (i915#2346) -> PASS
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-dg2: SKIP (i915#3555) -> PASS
>      * igt@kms_dp_aux_dev:
> 
>           * shard-dg2: SKIP (i915#1257) -> PASS
>      * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1:
> 
>           * shard-snb: FAIL (i915#11832 / i915#13734) -> PASS +1 other test
>             pass
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>           * shard-snb: TIMEOUT (i915#14033 / i915#14350) -> PASS
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
> 
>           * shard-snb: TIMEOUT (i915#14033) -> PASS
>      * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@a-hdmi-a1:
> 
>           * shard-tglu: FAIL (i915#13734) -> PASS +1 other test pass
>      * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@c-hdmi-a1:
> 
>           * shard-tglu: FAIL -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
> 
>           * shard-dg2: FAIL (i915#6880) -> PASS +1 other test pass
>      * igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>           * shard-dg2: SKIP (i915#12388) -> PASS
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-dg2: SKIP (i915#6953 / i915#9423) -> PASS
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-dg2: SKIP (i915#9519) -> PASS
>      * igt@perf_pmu@semaphore-busy@vcs1:
> 
>           * shard-dg1: FAIL (i915#4349) -> PASS +3 other tests pass
>           * shard-mtlp: FAIL (i915#4349) -> PASS +4 other tests pass
>      * igt@perf_pmu@semaphore-busy@vecs0:
> 
>           * shard-dg2: FAIL (i915#4349) -> PASS +5 other tests pass
>      * igt@vgem_basic@unload:
> 
>           * shard-rkl: DMESG-WARN (i915#12964) -> PASS +14 other tests pass
> 
>     Warnings
> 
>      * igt@gem_pxp@fail-invalid-protected-context:
> 
>           * shard-rkl: SKIP (i915#4270) -> TIMEOUT (i915#12964)
>      * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
> 
>           * shard-rkl: SKIP (i915#4270) -> TIMEOUT (i915#12917 / i915#12964)
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#6095) -> SKIP (i915#14098 / i915#6095) +4
>             other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
> 
>           * shard-dg1: SKIP (i915#6095) -> SKIP (i915#4423 / i915#6095) +2
>             other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#6095) +2
>             other tests skip
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-dg2: SKIP (i915#7118 / i915#9424) -> FAIL (i915#7173)
>      * igt@kms_content_protection@lic-type-1:
> 
>           * shard-snb: SKIP -> INCOMPLETE (i915#8816)
>      * igt@kms_content_protection@srm:
> 
>           * shard-dg2: SKIP (i915#7118) -> FAIL (i915#7173)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-snb: INCOMPLETE (i915#8816) -> SKIP +1 other test skip
>      * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
> 
>           * shard-dg1: SKIP (i915#4423 / i915#9934) -> SKIP (i915#9934) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
> 
>           * shard-dg1: SKIP (i915#4423 / i915#8708) -> SKIP (i915#8708) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
> 
>           * shard-dg1: SKIP (i915#3458 / i915#4423) -> SKIP (i915#3458)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#3458) -> SKIP (i915#3458) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
> 
>           * shard-dg2: SKIP (i915#3458) -> SKIP (i915#10433 / i915#3458) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-dg1: SKIP -> SKIP (i915#4423)
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-dg2: SKIP (i915#12713) -> SKIP (i915#13331)
>      * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>           * shard-dg1: SKIP (i915#4423) -> SKIP
>      * igt@kms_psr@fbc-pr-cursor-render:
> 
>           * shard-dg1: SKIP (i915#1072 / i915#4423 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732)
>      * igt@kms_scaling_modes@scaling-mode-center:
> 
>           * shard-dg1: SKIP (i915#3555 / i915#4423) -> SKIP (i915#3555)
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8401 -> IGTPW_13254
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_16664: 16851de7bfa7920ffdc16679920dc1af73e835ec @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_13254: 13254
>    IGT_8401: 8401
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
