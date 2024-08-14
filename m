Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3071DC3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 08:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E112710E434;
	Wed, 14 Aug 2024 08:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gzlm0Y9D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A3610E433;
 Wed, 14 Aug 2024 08:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723625460; x=1755161460;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NyWvCd/IOreqV/fKm2E/IQNmG2k+nSZMwv2MTyGGlCw=;
 b=Gzlm0Y9Dm0q2kSoWsLAkxX6a8yOTLi0qazU+DohC7Xy80tGYhQnxlkTV
 q+lsOAdFF+3bxuyYoNN3b5i1cYYiMiyXAmUD2a7gaqZqo24+4SZ22nI67
 IpuTtEhAy1uRBPnnLWIp5O7iqPd43fpfp6GWyel/qIujdehzqfWEaoftB
 GcwwMhwZGWwRM0aM4uUGmBixMmQwow+N88D3wb+NpwFGVaAWXARCESza6
 6mlLxBgsm+XdhN3gjglPKJ8bLZaexvKjfex46h5AdfxSL/SoujEOGCuzu
 lUZh1+CtoXZ22DGqNboMKQis3YYp7tE13LmR5uGlBcLdIRCjDNAET69+G Q==;
X-CSE-ConnectionGUID: 0L4Evhe4QWmA/8Fqqu8zwA==
X-CSE-MsgGUID: AUQxLA47RNWDEEo5V3R4mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32454543"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="32454543"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 01:51:00 -0700
X-CSE-ConnectionGUID: 9kK3hZfQTGeCkS7nTjMNHQ==
X-CSE-MsgGUID: 9OntJSOxRNyrwtaBax45mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="58899387"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.48])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 01:50:56 -0700
Date: Wed, 14 Aug 2024 10:50:51 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_lib|tests=3A?=
 =?utf-8?Q?_Don'?= =?utf-8?Q?t?= dereference engine outside
 for_each_ctx_engine macro (rev2)
Message-ID: <20240814085051.cynkx5nd4g37k26s@zkempczy-mobl2>
References: <20240813124536.66551-1-zbigniew.kempczynski@intel.com>
 <172358938279.615040.12484139361374330389@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172358938279.615040.12484139361374330389@2413ebb6fbb6>
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

On Tue, Aug 13, 2024 at 10:49:42PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib|tests: Don't dereference engine outside for_each_ctx_engine   
>             macro (rev2)                                                      
>    URL:     https://patchwork.freedesktop.org/series/137235/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/index.html   
> 
>         CI Bug Log - changes from CI_DRM_15224_full -> IGTPW_11567_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_11567_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_11567_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/index.html
> 
> Participating hosts (9 -> 9)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_11567_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE
>      * igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-4:
> 
>           * shard-dg1: PASS -> INCOMPLETE

Unrelated to the change.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_11567_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8411) +1 other test skip
>      * igt@debugfs_test@basic-hwmon:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9318)
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#11078)
>      * igt@drm_fdinfo@busy-hang@bcs0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8414) +4 other tests skip
>      * igt@drm_fdinfo@busy@bcs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8414) +6 other tests skip
>      * igt@drm_fdinfo@busy@rcs0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8414) +7 other tests skip
>      * igt@drm_fdinfo@idle@rcs0:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#7742)
>      * igt@gem_busy@semaphore:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3936)
>      * igt@gem_caching@reads:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4873)
>      * igt@gem_ccs@block-multicopy-compressed:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9323)
>           * shard-dg1: NOTRUN -> SKIP (i915#9323)
>           * shard-tglu: NOTRUN -> SKIP (i915#9323) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_ccs@block-multicopy-inplace:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#9323) +1 other test
>             skip
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_create@create-ext-set-pat:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8562)
>           * shard-dg1: NOTRUN -> SKIP (i915#8562)
>      * igt@gem_ctx_persistence@engines-cleanup:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#1099) +1 other test skip
>      * igt@gem_ctx_persistence@heartbeat-many:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8555)
>           * shard-dg2: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@heartbeat-stop:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8555) +1 other test skip
>      * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5882) +5 other tests skip
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#280)
>           * shard-tglu: NOTRUN -> SKIP (i915#280)
>           * shard-dg2: NOTRUN -> SKIP (i915#280)
>      * igt@gem_exec_balancer@bonded-semaphore:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4812) +3 other tests skip
>           * shard-dg2: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_balancer@invalid-bonds:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4036)
>           * shard-dg1: NOTRUN -> SKIP (i915#4036)
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525) +2 other tests skip
>      * igt@gem_exec_big@single:
> 
>           * shard-tglu: PASS -> ABORT (i915#11713)
>      * igt@gem_exec_capture@capture-invisible@smem0:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#6334)
>      * igt@gem_exec_capture@capture@vecs0-lmem0:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#11965) +1 other test fail
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-rkl: PASS -> FAIL (i915#2846)
>           * shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852) +1 other test
>             skip
>      * igt@gem_exec_fair@basic-none-rrul:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +2 other tests
>             skip
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#2842) +2 other tests fail
>           * shard-glk: NOTRUN -> FAIL (i915#2842) +1 other test fail
>      * igt@gem_exec_fair@basic-none-vip:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4473 / i915#4771) +2 other tests
>             skip
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-tglu: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-pace-solo:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4473)
>      * igt@gem_exec_fair@basic-throttle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539) +2 other tests skip
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#2842) +1 other test fail
>      * igt@gem_exec_flush@basic-uc-prw-default:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539) +3 other tests skip
>      * igt@gem_exec_reloc@basic-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +2 other tests skip
>      * igt@gem_exec_reloc@basic-wc-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +2 other tests skip
>      * igt@gem_exec_reloc@basic-wc-read:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +11 other tests skip
>      * igt@gem_exec_reloc@basic-write-read:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +5 other tests skip
>      * igt@gem_exec_schedule@semaphore-power:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4537 / i915#4812)
>      * igt@gem_exec_suspend@basic-s4-devices@smem:
> 
>           * shard-rkl: NOTRUN -> ABORT (i915#7975 / i915#8213)
>      * igt@gem_fence_thrash@bo-write-verify-x:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860)
>           * shard-dg1: NOTRUN -> SKIP (i915#4860) +2 other tests skip
>      * igt@gem_fenced_exec_thrash@no-spare-fences:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_lmem_swapping@basic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4565)
>      * igt@gem_lmem_swapping@parallel-random-engines:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_lmem_swapping@parallel-random-verify:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_lmem_swapping@verify-random-ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_media_vme:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#284)
>           * shard-dg2: NOTRUN -> SKIP (i915#284)
>           * shard-tglu: NOTRUN -> SKIP (i915#284)
>      * igt@gem_mmap@big-bo:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +5 other tests skip
>      * igt@gem_mmap_gtt@basic-read-write-distinct:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +8 other tests skip
>      * igt@gem_mmap_gtt@big-copy-odd:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +10 other tests skip
>      * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +13 other tests skip
>      * igt@gem_mmap_wc@fault-concurrent:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +4 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +4 other tests skip
>      * igt@gem_partial_pwrite_pread@reads:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +4 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +5 other tests skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +1 other test skip
>      * igt@gem_pread@exhaustion:
> 
>           * shard-glk: NOTRUN -> WARN (i915#2658)
>      * igt@gem_pwrite_snooped:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +3 other tests skip
>      * igt@gem_pxp@display-protected-crc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +4 other tests skip
>      * igt@gem_pxp@regular-baseline-src-copy-readible:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4270) +4 other tests skip
>      * igt@gem_pxp@reject-modify-context-protection-off-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>      * igt@gem_pxp@reject-modify-context-protection-off-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +3 other tests skip
>      * igt@gem_pxp@verify-pxp-stale-buf-execution:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4270) +3 other tests skip
>      * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +3 other tests skip
>      * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +3 other tests
>             skip
>      * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079)
>           * shard-rkl: NOTRUN -> SKIP (i915#8411) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_userptr_blits@access-control:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@mmap-offset-banned@gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>      * igt@gem_userptr_blits@relocations:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281 / i915#3297)
>      * igt@gen3_render_tiledy_blits:
> 
>           * shard-mtlp: NOTRUN -> SKIP +26 other tests skip
>      * igt@gen7_exec_parse@basic-allowed:
> 
>           * shard-snb: NOTRUN -> SKIP +61 other tests skip
>      * igt@gen7_exec_parse@chained-batch:
> 
>           * shard-rkl: NOTRUN -> SKIP +17 other tests skip
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856) +3 other tests skip
>      * igt@gen9_exec_parse@bb-chained:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +2 other tests skip
>      * igt@gen9_exec_parse@bb-start-cmd:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2527) +7 other tests skip
>      * igt@gen9_exec_parse@unaligned-access:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +2 other tests skip
>      * igt@gen9_exec_parse@unaligned-jump:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +2 other tests
>             skip
>      * igt@i915_fb_tiling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4881)
>      * igt@i915_module_load@resize-bar:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6412)
>      * igt@i915_pm_freq_api@freq-reset-multiple:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8399)
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#3591)
>      * igt@i915_pm_rps@min-max-config-loaded:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11681 / i915#6621)
>      * igt@i915_pm_rps@reset:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#8346)
>      * igt@i915_pm_rps@thresholds:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#11681) +1 other test skip
>      * igt@i915_pm_rps@thresholds-idle:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11681)
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6245)
>      * igt@i915_selftest@mock@memory_region:
> 
>           * shard-glk: NOTRUN -> DMESG-WARN (i915#9311)
>      * igt@intel_hwmon@hwmon-read:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7707)
>      * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_addfb_basic@clobberred-modifier:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4212) +1 other test skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8709) +11 other tests skip
>      * igt@kms_async_flips@invalid-async-flip:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6228)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#5956)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1769 / i915#3555)
>           * shard-rkl: NOTRUN -> SKIP (i915#1769 / i915#3555)
>           * shard-dg1: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
> 
>           * shard-snb: PASS -> FAIL (i915#5956) +1 other test fail
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +4 other tests
>             skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +4 other tests skip
>      * igt@kms_big_fb@linear-64bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638) +3 other tests skip
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3638) +2 other tests skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +6 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538) +4 other tests skip
>      * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6187) +1 other test skip
>      * igt@kms_big_joiner@basic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#10656)
>           * shard-dg1: NOTRUN -> SKIP (i915#10656)
>      * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +39 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +61 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +71 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +170 other
>             tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +43 other tests skip
>      * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>             +4 other tests skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7213) +3 other tests skip
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3742) +1 other test skip
>      * igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4087) +3 other tests skip
>      * igt@kms_chamelium_audio@hdmi-audio-edid:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7828) +13 other tests skip
>      * igt@kms_chamelium_edid@dp-edid-resolution-list:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7828) +4 other tests skip
>      * igt@kms_chamelium_edid@hdmi-mode-timings:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7828) +5 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7828) +6 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7828) +6 other tests skip
>      * igt@kms_color@deep-color:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#9979)
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3299)
>           * shard-dg1: NOTRUN -> SKIP (i915#3299)
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3116 / i915#3299)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3299)
>      * igt@kms_content_protection@lic-type-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9424) +1 other test skip
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9424) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#9424) +2 other tests skip
>      * igt@kms_content_protection@type1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#6944 / i915#9424)
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11453)
>           * shard-tglu: NOTRUN -> SKIP (i915#11453)
>      * igt@kms_cursor_crc@cursor-random-512x170:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11453) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#11453) +4 other tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +3 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3359) +3 other tests skip
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9809) +1 other test skip
>      * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9067)
>           * shard-rkl: NOTRUN -> SKIP (i915#9067)
>           * shard-dg1: NOTRUN -> SKIP (i915#9067)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4103 / i915#4213) +1 other test
>             skip
>      * igt@kms_cursor_legacy@torture-move@pipe-a:
> 
>           * shard-dg2: PASS -> DMESG-WARN (i915#10166)
>      * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9833)
>      * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9833)
>      * igt@kms_dsc@dsc-basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3840)
>           * shard-dg1: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3840)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#3840)
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3840 / i915#9053)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4854)
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1839)
>           * shard-dg2: NOTRUN -> SKIP (i915#1839)
>           * shard-rkl: NOTRUN -> SKIP (i915#1839)
>           * shard-dg1: NOTRUN -> SKIP (i915#1839)
>           * shard-tglu: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_flip@2x-flip-vs-expired-vblank:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637) +5 other tests skip
>      * igt@kms_flip@2x-nonexisting-fb-interruptible:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637) +2 other tests skip
>      * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +8 other tests skip
>      * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4:
> 
>           * shard-dg1: PASS -> FAIL (i915#2122)
>      * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-vga1:
> 
>           * shard-snb: PASS -> FAIL (i915#2122)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672) +2 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8810)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672) +2 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other test
>             skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
> 
>           * shard-dg2: PASS -> FAIL (i915#6880)
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +11 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +26 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +20 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#10055)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-dg1: NOTRUN -> SKIP +42 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +35 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +18 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +21 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10433 / i915#3458)
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +20 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +23 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-tglu: NOTRUN -> SKIP +48 other tests skip
>      * igt@kms_hdr@bpc-switch:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228) +2 other tests
>             skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@bpc-switch-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@bpc-switch-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
> 
>           * shard-dg2: NOTRUN -> SKIP +10 other tests skip
>      * igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#11614 / i915#3582) +4 other
>             tests skip
>      * igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#10226 / i915#11614 / i915#3582)
>             +2 other tests skip
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6953 / i915#9423)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9423) +32 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> SKIP +247 other tests skip
>      * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9423) +15 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9423) +9 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235 / i915#9423) +2 other tests
>             skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5235) +2 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9728) +16 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5235) +12 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#5235) +2 other tests
>             skip
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9728) +5 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#9728) +3 other tests skip
>      * igt@kms_pm_backlight@fade-with-dpms:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5354)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-tglu: PASS -> FAIL (i915#9295)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9340)
>      * igt@kms_pm_lpsp@screens-disabled:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8430)
>           * shard-dg2: NOTRUN -> SKIP (i915#8430)
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9519) +1 other test skip
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-dg2: PASS -> SKIP (i915#9519) +1 other test skip
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-rkl: PASS -> SKIP (i915#9519) +1 other test skip
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_prime@basic-crc-vgem:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6524 / i915#6805)
>           * shard-dg1: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_prime@d3hot:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6524) +1 other test skip
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11520) +1 other test skip
>      * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>      * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11520) +1 other test skip
>      * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9808) +1 other test skip
>      * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf@psr2-pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> ABORT (i915#11897)
>      * igt@kms_psr@fbc-psr-no-drrs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +14 other tests skip
>      * igt@kms_psr@pr-dpms:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +13 other tests skip
>      * igt@kms_psr@psr2-primary-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +13 other tests
>             skip
>      * igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077 / i915#9688) +1 other test
>             skip
>      * igt@kms_psr@psr2-sprite-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +28 other tests
>             skip
>      * igt@kms_psr@psr2-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +15 other tests
>             skip
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9673 / i915#9732) +1
>             other test skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11131 / i915#5190)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5289)
>           * shard-mtlp: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@sprite-rotation-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11131 / i915#4235)
>      * igt@kms_scaling_modes@scaling-mode-none:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_setmode@basic-clone-single-crtc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_setmode@invalid-clone-single-crtc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8809)
>      * igt@kms_sysfs_edid_timing:
> 
>           * shard-dg1: NOTRUN -> FAIL (IGT#2 / i915#6493)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#9196)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4:
> 
>           * shard-dg1: PASS -> FAIL (i915#9196)
>      * igt@kms_vrr@flip-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_vrr@lobf:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11920)
>           * shard-mtlp: NOTRUN -> SKIP (i915#11920)
>      * igt@kms_vrr@max-min:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#9906)
>      * igt@kms_vrr@seamless-rr-switch-vrr:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2437 / i915#9412)
>           * shard-rkl: NOTRUN -> SKIP (i915#2437 / i915#9412)
>           * shard-dg1: NOTRUN -> SKIP (i915#2437 / i915#9412)
>      * igt@perf@mi-rpc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2434)
>           * shard-rkl: NOTRUN -> SKIP (i915#2434)
>           * shard-dg1: NOTRUN -> SKIP (i915#2434)
>           * shard-mtlp: NOTRUN -> SKIP (i915#2434)
>      * igt@perf_pmu@cpu-hotplug:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8850)
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3708 / i915#4077) +1 other test
>             skip
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3708)
>           * shard-dg1: NOTRUN -> SKIP (i915#3708)
>      * igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9917)
>      * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9917)
>           * shard-mtlp: NOTRUN -> SKIP (i915#9917) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP (i915#9917)
>      * igt@syncobj_timeline@invalid-wait-zero-handles:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#9781)
>           * shard-dg1: NOTRUN -> FAIL (i915#9781)
>           * shard-glk: NOTRUN -> FAIL (i915#9781)
>      * igt@tools_test@sysfs_l3_parity:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4818)
> 
>     Possible fixes
> 
>      * igt@drm_fdinfo@most-busy-check-all@rcs0:
> 
>           * shard-rkl: FAIL (i915#7742) -> PASS
>      * igt@gem_eio@reset-stress:
> 
>           * shard-dg2: FAIL (i915#5784) -> PASS
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-snb: INCOMPLETE -> PASS
>           * shard-mtlp: ABORT (i915#10131 / i915#9820) -> PASS
>      * igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs:
> 
>           * shard-glk: FAIL (i915#11859) -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-glk: FAIL (i915#2346) -> PASS
>      * igt@kms_cursor_legacy@single-move@pipe-b:
> 
>           * shard-dg1: INCOMPLETE -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-snb: SKIP -> PASS +4 other tests pass
>      * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
> 
>           * shard-dg2: FAIL (i915#6880) -> PASS
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-rkl: SKIP (i915#9519) -> PASS
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-4:
> 
>           * shard-dg1: FAIL (i915#9196) -> PASS
>      * igt@perf_pmu@busy-double-start@vecs1:
> 
>           * shard-dg2: FAIL (i915#4349) -> PASS +3 other tests pass
>      * igt@perf_pmu@most-busy-idle-check-all@rcs0:
> 
>           * shard-mtlp: FAIL (i915#11822) -> PASS
>           * shard-dg2: FAIL (i915#11822) -> PASS
>      * igt@prime_busy@hang@rcs0:
> 
>           * shard-dg2: INCOMPLETE -> PASS
> 
>     Warnings
> 
>      * igt@device_reset@unbind-reset-rebind:
> 
>           * shard-dg1: ABORT (i915#11814) -> ABORT (i915#11814 / i915#11815)
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-tglu: FAIL (i915#2876) -> FAIL (i915#2842)
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * shard-dg1: DMESG-WARN (i915#1982 / i915#4936 / i915#5493) ->
>             TIMEOUT (i915#5493)
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-tglu: ABORT (i915#10887 / i915#9820) -> ABORT (i915#9820)
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-snb: SKIP -> INCOMPLETE (i915#8816)
>      * igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>           * shard-dg2: SKIP (i915#11453 / i915#3359) -> SKIP (i915#11453)
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-dg2: SKIP (i915#11453) -> SKIP (i915#11453 / i915#3359)
>      * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: SKIP (i915#3555 / i915#8810) -> ABORT (i915#10354)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2: SKIP (i915#3458) -> SKIP (i915#10433 / i915#3458) +2
>             other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#3458) -> SKIP (i915#3458) +2
>             other tests skip
>      * igt@kms_psr@fbc-psr-cursor-plane-move:
> 
>           * shard-dg2: SKIP (i915#1072 / i915#9673 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732) +10 other tests skip
>      * igt@kms_psr@psr2-cursor-blt:
> 
>           * shard-dg2: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 /
>             i915#9673 / i915#9732) +10 other tests skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>           * shard-dg2: SKIP (i915#11131 / i915#4235 / i915#5190) -> SKIP
>             (i915#11131 / i915#5190)
>      * igt@perf@non-zero-reason@0-rcs0:
> 
>           * shard-dg2: FAIL (i915#7484) -> FAIL (i915#9100)
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7967 -> IGTPW_11567
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_15224: 924db73e261b7bfd4b70b14db61197f48bf09426 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_11567: 11567
>    IGT_7967: 290bdef9033c8b185922f02cd05d62fcc0091c15 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
