Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C8DC54E66
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 07:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7A810FE41;
	Fri, 15 Mar 2024 07:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZdYE1x+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E5B10FE41
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 07:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710487320; x=1742023320;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=ZDi66Fxt9A4OwqtMen35RwrPC3vyiERrANWrkijFxCY=;
 b=DZdYE1x+FLv/sGjrjj1cCdcKHEKQXDTvSJoqEyID63BkvcdTEiqKAGEp
 MWzjlHNx9Pi3CMe0naI2ZaIYy9Yn+SyRjOit2cv2R0HhSk2uIL9trq1Xt
 GbfvBFYyxlELfuBpgp8NaWNF6GrldL04F9+n+c7V4Ik+c+NFXbQOfU6Up
 ACKAmfce9VMGskHtqbTwCRqFhdkfgaaK26JUunv2Zz0jD1cbRZDm3stVJ
 h/VO7Afb3jnOsQ/nkfwzk0ovmMhVycdgW9j2Mf//aJxJRtkiJgH8BXyYm
 2PQoqpjueZstrmAwSj7kekFL215HxsWCX9JMxnMKrJMOiIDknqLouBpWh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5529225"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5529225"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 00:21:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="17268970"
Received: from unknown (HELO localhost) ([10.245.244.247])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 00:21:56 -0700
Date: Fri, 15 Mar 2024 08:21:53 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for Add
 common functions for i915 and xe
Message-ID: <20240315072153.av7kbxnpndo66n4g@zkempczy-mobl2>
References: <20240313104520.148338-1-zbigniew.kempczynski@intel.com>
 <171035526341.732671.12285413130485332250@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171035526341.732671.12285413130485332250@8e613ede5ea5>
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

On Wed, Mar 13, 2024 at 06:41:03PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add common functions for i915 and xe                            
>    URL:     https://patchwork.freedesktop.org/series/131069/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10823/index.html 
> 
>         CI Bug Log - changes from CI_DRM_14425_full -> IGTPW_10823_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_10823_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_10823_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10823/index.html
> 
> Participating hosts (9 -> 9)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_10823_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_eio@wait-immediate:
> 
>           * shard-dg2: NOTRUN -> ABORT
>           * shard-dg1: PASS -> ABORT
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
> 
>           * shard-dg2: PASS -> INCOMPLETE
>      * igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a4:
> 
>           * shard-dg1: PASS -> FAIL +1 other test fail
>      * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-vga1:
> 
>           * shard-snb: PASS -> FAIL
>      * igt@kms_scaling_modes@scaling-mode-full@pipe-d-edp-1:
> 
>           * shard-mtlp: PASS -> INCOMPLETE

Unrelated to the change.

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
> 
>           * {shard-dg2-4}: NOTRUN -> SKIP +50 other tests skip
>      * igt@kms_pm_rpm@basic-rte:
> 
>           * {shard-dg2-4}: NOTRUN -> ABORT
> 
> Known issues
> 
>    Here are the changes found in IGTPW_10823_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@blit-reloc-purge-cache:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8411)
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8411) +1 other test skip
>      * igt@api_intel_bb@object-reloc-purge-cache:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8411) +1 other test skip
>      * igt@debugfs_test@basic-hwmon:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9318)
>      * igt@device_reset@unbind-cold-reset-rebind:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7701)
>      * igt@drm_fdinfo@busy-check-all@bcs0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8414) +4 other tests skip
>      * igt@drm_fdinfo@busy-hang@rcs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8414) +19 other tests skip
>      * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
> 
>           * shard-rkl: PASS -> FAIL (i915#7742) +1 other test fail
>      * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8414) +49 other tests skip
>      * igt@gem_basic@multigpu-create-close:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7697) +1 other test skip
>      * igt@gem_caching@writes:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4873) +1 other test skip
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@block-multicopy-compressed:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9323)
>           * shard-dg1: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_close_race@multigpu-basic-threads:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_ctx_freq@sysfs@gt0:
> 
>           * shard-dg2: PASS -> FAIL (i915#9561)
>      * igt@gem_ctx_persistence@heartbeat-hang:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8555) +1 other test skip
>      * igt@gem_ctx_persistence@heartbeat-hostile:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8555) +2 other tests skip
>      * igt@gem_ctx_persistence@heartbeat-stop:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8555) +1 other test skip
>      * igt@gem_ctx_sseu@invalid-args:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#280)
>           * shard-rkl: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@reset-stress:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#5784)
>      * igt@gem_exec_balancer@bonded-sync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4771) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4771)
>      * igt@gem_exec_balancer@bonded-true-hang:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_balancer@parallel-balancer:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_balancer@sliced:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812) +3 other tests skip
>      * igt@gem_exec_capture@many-4k-zero:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#9606)
>           * shard-rkl: NOTRUN -> FAIL (i915#9606)
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#2846)
>           * shard-glk: NOTRUN -> FAIL (i915#2846)
>      * igt@gem_exec_fair@basic-none-rrul:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +5 other tests
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4473 / i915#4771) +1 other test
>             skip
>      * igt@gem_exec_fair@basic-none-solo:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4473)
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-glk: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-tglu: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-pace@vecs0:
> 
>           * shard-rkl: PASS -> FAIL (i915#2842) +1 other test fail
>      * igt@gem_exec_fair@basic-sync:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539)
>      * igt@gem_exec_flush@basic-uc-prw-default:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539)
>      * igt@gem_exec_flush@basic-wb-rw-before-default:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852) +3 other tests
>             skip
>      * igt@gem_exec_gttfill@multigpu-basic:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7697) +1 other test skip
>      * igt@gem_exec_params@rsvd2-dirt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5107)
>      * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +14 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-noreloc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +5 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +12 other tests skip
>      * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +8 other tests skip
>      * igt@gem_exec_schedule@preempt-queue-contexts:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4537 / i915#4812)
>      * igt@gem_fence_thrash@bo-write-verify-threaded-none:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4860) +1 other test skip
>      * igt@gem_fenced_exec_thrash@too-many-fences:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860) +2 other tests skip
>      * igt@gem_lmem_swapping@heavy-verify-multi:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#10378)
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4565)
>      * igt@gem_lmem_swapping@random:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_lmem_swapping@verify-random:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_media_vme:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#284)
>      * igt@gem_mmap@pf-nonblock:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      * igt@gem_mmap_gtt@coherency:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +9 other tests skip
>      * igt@gem_mmap_gtt@cpuset-big-copy-odd:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +21 other tests skip
>      * igt@gem_mmap_gtt@ptrace:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +8 other tests skip
>      * igt@gem_mmap_wc@bad-offset:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      * igt@gem_mmap_wc@invalid-flags:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +6 other tests skip
>      * igt@gem_partial_pwrite_pread@write:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +6 other tests skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +5 other tests skip
>      * igt@gem_pread@self:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +3 other tests skip
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +1 other test skip
>      * igt@gem_pxp@create-valid-protected-context:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>      * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>      * igt@gem_pxp@reject-modify-context-protection-off-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4270) +3 other tests skip
>      * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +3 other tests skip
>      * igt@gem_pxp@verify-pxp-stale-ctx-execution:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +4 other tests skip
>      * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_softpin@evict-snoop:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4885)
>           * shard-dg2: NOTRUN -> SKIP (i915#4885)
>      * igt@gem_spin_batch@spin-all-new:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#5889)
>      * igt@gem_tiled_pread_pwrite:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4079) +1 other test skip
>      * igt@gem_unfence_active_buffers:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4879)
>      * igt@gem_userptr_blits@coherency-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297) +3 other tests skip
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297) +4 other tests skip
>      * igt@gem_userptr_blits@dmabuf-unsync:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_userptr_blits@map-fixed-invalidate-busy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@readonly-unsync:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>      * igt@gen7_exec_parse@chained-batch:
> 
>           * shard-rkl: NOTRUN -> SKIP +47 other tests skip
>      * igt@gen9_exec_parse@batch-without-end:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856)
>      * igt@gen9_exec_parse@bb-secure:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2527) +2 other tests skip
>      * igt@gen9_exec_parse@secure-batches:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +2 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856)
>      * igt@gen9_exec_parse@shadow-peek:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +3 other tests skip
>      * igt@i915_module_load@load:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6227)
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-dg1: PASS -> INCOMPLETE (i915#9820 / i915#9849)
>      * igt@i915_pm_rps@min-max-config-loaded:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6621)
>      * igt@i915_pm_rps@thresholds-idle@gt0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8925)
>      * igt@i915_pm_rps@waitboost:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#8346)
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4387)
>      * igt@i915_selftest@mock@memory_region:
> 
>           * shard-dg2: NOTRUN -> DMESG-WARN (i915#9311)
>           * shard-rkl: NOTRUN -> DMESG-WARN (i915#9311)
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7707)
>      * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4212) +1 other test skip
>      * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1769 / i915#3555) +1 other test
>             skip
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1769 / i915#3555) +1 other test
>             skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +3 other tests
>             skip
>      * igt@kms_big_fb@4-tiled-addfb:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5286)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +3 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +5 other tests skip
>      * igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>           * shard-mtlp: NOTRUN -> SKIP +27 other tests skip
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638)
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3638) +1 other test skip
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:
> 
>           * shard-mtlp: PASS -> FAIL (i915#5138) +1 other test fail
>      * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +12 other tests skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +13 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538) +3 other tests skip
>      * igt@kms_big_joiner@2x-modeset:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2705)
>      * igt@kms_big_joiner@basic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2705) +1 other test skip
>      * igt@kms_big_joiner@invalid-modeset:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2705) +1 other test skip
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +71 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10278)
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307) +171 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +39 other tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +31 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +57 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#10278)
>      * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#10278)
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7213) +4 other tests skip
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7828) +4 other tests skip
>      * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7828) +11 other tests skip
>      * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7828) +10 other tests skip
>      * igt@kms_chamelium_frames@hdmi-frame-dump:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7828) +7 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7828) +9 other tests skip
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3299)
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3116)
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9424)
>      * igt@kms_content_protection@lic-type-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6944 / i915#9424) +1 other test
>             skip
>      * igt@kms_content_protection@srm:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7118)
>      * igt@kms_content_protection@type1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7118 / i915#9424) +1 other test
>             skip
>      * igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3359)
>           * shard-rkl: NOTRUN -> SKIP (i915#3359)
>      * igt@kms_cursor_crc@cursor-offscreen-64x21:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814) +4 other tests skip
>      * igt@kms_cursor_crc@cursor-onscreen-32x10:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814) +1 other test
>             skip
>      * igt@kms_cursor_crc@cursor-random-32x32:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3359) +1 other test skip
>      * igt@kms_cursor_crc@cursor-sliding-32x32:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3359)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213) +1 other test
>             skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9809) +2 other tests skip
>      * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9723)
>      * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9227)
>      * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9833)
>      * igt@kms_display_modes@mst-extended-mode-negative:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8588)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3804)
>           * shard-tglu: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_dp_aux_dev:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1257)
>      * igt@kms_draw_crc@draw-method-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8812)
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3840 / i915#9688)
>      * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840) +1 other test
>             skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840) +1 other test
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3840 / i915#9053)
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3469)
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1839)
>           * shard-tglu: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@psr1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#658)
>      * igt@kms_flip@2x-blocking-absolute-wf_vblank:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637) +3 other tests skip
>      * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637) +5 other tests skip
>      * igt@kms_flip@2x-flip-vs-dpms:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +5 other tests skip
>      * igt@kms_flip@flip-vs-fences-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8381)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8810)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672) +3 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672) +2 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +4 other tests skip
>      * igt@kms_force_connector_basic@prune-stale-modes:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5274)
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#6880)
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +27 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
> 
>           * shard-tglu: NOTRUN -> SKIP +49 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +23 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10055)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +19 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +25 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +18 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +32 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +37 other tests skip
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9766)
>      * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +15 other tests skip
>      * igt@kms_hdr@bpc-switch-dpms:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228) +4 other tests
>             skip
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4816)
>           * shard-rkl: NOTRUN -> SKIP (i915#4070 / i915#4816)
>      * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
> 
>           * shard-dg2: NOTRUN -> SKIP +35 other tests skip
>      * igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3582) +7 other tests skip
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +7 other tests skip
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6953 / i915#9423)
>           * shard-dg1: NOTRUN -> SKIP (i915#6953)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> SKIP +240 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9423) +11 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5176) +7 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9423) +9 other tests skip
>      * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9423) +15 other tests skip
>      * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5176 / i915#9423) +1 other test
>             skip
>      * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9423) +7 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5235) +9 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5235) +7 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5235) +15 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235 / i915#9423) +15 other tests
>             skip
>      * igt@kms_pm_backlight@basic-brightness:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#5354)
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9685) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-tglu: PASS -> FAIL (i915#9295)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9340)
>      * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-dg2: PASS -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-rkl: PASS -> SKIP (i915#9519) +2 other tests skip
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_prime@basic-crc-hybrid:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_prime@basic-crc-vgem:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6524 / i915#6805) +1 other test
>             skip
>      * igt@kms_prime@d3hot:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
> 
>           * shard-dg1: NOTRUN -> SKIP +44 other tests skip
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9683) +1 other test skip
>      * igt@kms_psr@fbc-psr-primary-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9673 / i915#9732) +3 other tests
>             skip
>      * igt@kms_psr@fbc-psr-primary-page-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9732) +27 other tests skip
>      * igt@kms_psr@fbc-psr2-cursor-blt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9732) +20 other tests skip
>      * igt@kms_psr@pr-primary-mmap-cpu:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +13 other tests skip
>      * igt@kms_psr@pr-sprite-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9732) +23 other tests skip
>      * igt@kms_psr@psr-basic:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +12 other tests skip
>      * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077 / i915#9688)
>      * igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#10105)
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_rotation_crc@bad-pixel-format:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4235) +2 other tests skip
>      * igt@kms_rotation_crc@exhaust-fences:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4884)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5289) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4235 / i915#5190)
>           * shard-tglu: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4235)
>      * igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +5 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8823)
>      * igt@kms_setmode@invalid-clone-single-crtc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8809)
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8623) +1 other test skip
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
> 
>           * shard-tglu: PASS -> FAIL (i915#9196)
>      * igt@kms_vrr@flip-basic-fastset:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_vrr@flip-dpms:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8808)
>      * igt@kms_vrr@max-min:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_vrr@seamless-rr-switch-drrs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9906) +2 other tests skip
>      * igt@kms_vrr@seamless-rr-switch-vrr:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9906) +1 other test skip
>      * igt@kms_writeback@writeback-check-output-xrgb2101010:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2437 / i915#9412)
>           * shard-mtlp: NOTRUN -> SKIP (i915#2437 / i915#9412)
>      * igt@perf_pmu@busy-double-start@vecs1:
> 
>           * shard-dg2: PASS -> FAIL (i915#4349) +3 other tests fail
>      * igt@perf_pmu@cpu-hotplug:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8850)
>      * igt@perf_pmu@rc6@runtime-pm-long-gt0:
> 
>           * shard-dg1: PASS -> ABORT (i915#9853)
>      * igt@prime_vgem@basic-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3708 / i915#4077)
>      * igt@prime_vgem@basic-write:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3708) +2 other tests skip
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708)
>      * igt@sriov_basic@bind-unbind-vf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9917) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#9917)
>      * igt@sriov_basic@enable-vfs-autoprobe-on:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9917)
>      * igt@syncobj_wait@invalid-wait-zero-handles:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#9779)
>      * igt@tools_test@sysfs_l3_parity:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4818)
>           * shard-mtlp: NOTRUN -> SKIP (i915#4818)
>      * igt@v3d/v3d_get_bo_offset@create-get-offsets:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2575) +12 other tests skip
>      * igt@v3d/v3d_perfmon@create-perfmon-exceed:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2575) +11 other tests skip
>      * igt@v3d/v3d_submit_cl@valid-submission:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2575) +10 other tests skip
>      * igt@v3d/v3d_submit_csd@single-out-sync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2575) +24 other tests skip
>      * igt@vc4/vc4_label_bo@set-label:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7711) +6 other tests skip
>      * igt@vc4/vc4_lookup_fail@bad-color-write:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7711) +6 other tests skip
>      * igt@vc4/vc4_perfmon@destroy-invalid-perfmon:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7711) +6 other tests skip
>      * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7711) +10 other tests skip
> 
>     Possible fixes
> 
>      * igt@gem_create@hog-create@smem0:
> 
>           * shard-dg1: INCOMPLETE -> PASS
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-rkl: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-tglu: FAIL (i915#2842) -> PASS +1 other test pass
>      * igt@gem_lmem_swapping@heavy-random@lmem0:
> 
>           * shard-dg1: FAIL (i915#10378) -> PASS
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-tglu: INCOMPLETE -> PASS
>           * shard-glk: INCOMPLETE (i915#9849) -> PASS
>           * shard-mtlp: ABORT (i915#10131 / i915#9820) -> PASS
>      * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0:
> 
>           * shard-dg2: ABORT (i915#10367) -> PASS
>           * shard-dg1: ABORT (i915#10367) -> PASS
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-tglu: FAIL (i915#3743) -> PASS +1 other test pass
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-glk: FAIL (i915#2346) -> PASS
>      * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:
> 
>           * shard-rkl: FAIL -> PASS +1 other test pass
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-snb: SKIP -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
> 
>           * shard-dg2: FAIL (i915#6880) -> PASS
>      * igt@kms_pm_dc@dc9-dpms:
> 
>           * shard-tglu: SKIP (i915#4281) -> PASS
>      * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * shard-rkl: SKIP (i915#9519) -> PASS
>      * igt@kms_rotation_crc@primary-rotation-90:
> 
>           * shard-rkl: ABORT (i915#8875) -> PASS +1 other test pass
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
> 
>           * shard-tglu: FAIL (i915#9196) -> PASS +1 other test pass
>      * igt@perf_pmu@busy-double-start@rcs0:
> 
>           * shard-mtlp: FAIL (i915#4349) -> PASS
> 
>     Warnings
> 
>      * igt@device_reset@unbind-reset-rebind:
> 
>           * shard-dg1: INCOMPLETE (i915#9618) -> INCOMPLETE (i915#9408 /
>             i915#9618)
>      * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
> 
>           * shard-dg2: FAIL -> FAIL (i915#10378)
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-dg2: DMESG-WARN (i915#9559) -> INCOMPLETE (i915#9820 /
>             i915#9849)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-rkl: SKIP (i915#3361) -> FAIL (i915#9295)
>      * igt@kms_pm_dc@dc9-dpms:
> 
>           * shard-rkl: SKIP (i915#3361) -> SKIP (i915#4281)
>      * igt@kms_psr@fbc-psr2-sprite-blt:
> 
>           * shard-dg2: SKIP (i915#9673 / i915#9732) -> SKIP (i915#9732) +5
>             other tests skip
>      * igt@kms_psr@fbc-psr2-sprite-mmap-cpu:
> 
>           * shard-dg2: SKIP (i915#9732) -> SKIP (i915#9673 / i915#9732) +4
>             other tests skip
>      * igt@perf@non-zero-reason@0-rcs0:
> 
>           * shard-dg2: FAIL (i915#7484) -> FAIL (i915#9100)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7759 -> IGTPW_10823
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_14425: 050dddfc65dd66c35a848204141eb9ee289cc6c9 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_10823: 10823
>    IGT_7759: 7759
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
