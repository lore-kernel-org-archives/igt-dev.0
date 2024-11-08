Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B46D5E14E
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 10:23:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC54410E95F;
	Fri,  8 Nov 2024 10:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzA+qk32";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEC210E95E;
 Fri,  8 Nov 2024 10:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731061402; x=1762597402;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IKSIUA+PmSrxA+6/wYKsYahySxatWU8UIrxSBhtXQns=;
 b=YzA+qk32SOiwACHVrPVRnmIXwjJiAYz0uYCheamvizMG8pIyyu0icRzu
 7htAYH241FsTrmxkswMQVab9sRRRa8pvbOYN1q64vSxur075Okk4fhNIC
 8EpUQ8BAuzeKn+XeaVlTr3SZ+pQeWHATy1IUXylfOgPAiXPI+mMuJemtc
 dBhyzMrNPdr1SjWh0oWTCsSGxy9Xw8C3gnEKTlTZ8N/Y1alNClHcCM+SZ
 ixkPuLooyIvBtI/+nGdv1OpkuZ+tjgKSMwsFzCxBtUbg0jLHNuxBal9DM
 KfDYqZzb3eJcWW0a1EnGtXRm74lDhpv+GGfaoXsHZUSjPLx8Z1PbLBRVW w==;
X-CSE-ConnectionGUID: u5Jlp4mMRwWt6oUccjoIKw==
X-CSE-MsgGUID: SeGg8JVgRM2F+1hZciGtXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="33799642"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="33799642"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 02:23:22 -0800
X-CSE-ConnectionGUID: B8mz1xsIQO6JqGEf+7joJQ==
X-CSE-MsgGUID: uUP/LogcRjaap0hqMohtDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="90303144"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.18])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 02:23:20 -0800
Date: Fri, 8 Nov 2024 11:23:17 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 Extend intel_blt to support large ctrl-surf-copy blits
Message-ID: <20241108102317.spcsz3mprzxupdkk@zkempczy-mobl2>
References: <20241108064712.252927-1-zbigniew.kempczynski@intel.com>
 <173105511774.1426041.15885618058558755500@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173105511774.1426041.15885618058558755500@2413ebb6fbb6>
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

On Fri, Nov 08, 2024 at 08:38:37AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Extend intel_blt to support large ctrl-surf-copy blits          
>    URL:     https://patchwork.freedesktop.org/series/141084/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12068/index.html 
> 
>         CI Bug Log - changes from CI_DRM_15656_full -> IGTPW_12068_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_12068_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_12068_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12068/index.html
> 
> Participating hosts (9 -> 9)
> 
>    Additional (1): shard-glk-0
>    Missing (1): shard-glk
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_12068_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * {igt@gem_ccs@large-ctrl-surf-copy} (NEW):
> 
>           * shard-rkl: NOTRUN -> SKIP
>           * shard-dg1: NOTRUN -> SKIP
>           * shard-tglu: NOTRUN -> SKIP
>           * shard-mtlp: NOTRUN -> SKIP

Those skips are expected.

>      * igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-edp-1:
> 
>           * shard-mtlp: PASS -> INCOMPLETE +1 other test incomplete
>      * igt@kms_rotation_crc@sprite-rotation-90:
> 
>           * shard-dg2: NOTRUN -> SKIP +1 other test skip
> 
> New tests
> 
>    New tests have been introduced between CI_DRM_15656_full and
>    IGTPW_12068_full:
> 
>   New IGT tests (1)
> 
>      * igt@gem_ccs@large-ctrl-surf-copy:
>           * Statuses : 1 pass(s) 5 skip(s)
>           * Exec time: [0.0, 0.56] s

Pass is for DG2 and this is expected.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_12068_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@blit-reloc-purge-cache:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8411]) +1 other test skip
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11078)
>           * shard-dg2: NOTRUN -> SKIP (i915#11078)
>      * igt@device_reset@unbind-cold-reset-rebind:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11078)
>      * igt@drm_fdinfo@all-busy-check-all:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8414]) +1 other test skip
>      * igt@drm_fdinfo@isolation@rcs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8414]) +7 other tests skip
>      * igt@gem_basic@multigpu-create-close:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#7697])
>      * igt@gem_caching@read-writes:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4873])
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3555] / [i915#9323])
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE ([i915#7297])
>           * shard-rkl: NOTRUN -> SKIP ([i915#9323])
>           * shard-dg1: NOTRUN -> SKIP ([i915#9323])
>           * shard-tglu: NOTRUN -> SKIP ([i915#9323])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9323])
>      * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE (i915#12392 / [i915#7297])
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-dg2: PASS -> ABORT ([i915#9846])
>      * igt@gem_create@create-ext-set-pat:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8562])
>      * igt@gem_ctx_engines@invalid-engines:
> 
>           * shard-rkl: PASS -> FAIL (i915#12031)
>      * igt@gem_ctx_persistence@heartbeat-stop:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8555])
>           * shard-dg2: NOTRUN -> SKIP ([i915#8555])
>      * igt@gem_ctx_persistence@hostile:
> 
>           * shard-dg1: PASS -> FAIL (i915#11980 / [i915#12580])
>      * igt@gem_ctx_persistence@legacy-engines-persistence:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#1099)
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#280])
>           * shard-dg1: NOTRUN -> SKIP ([i915#280])
>      * igt@gem_exec_balancer@bonded-dual:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4771])
>      * igt@gem_exec_balancer@bonded-true-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4812]) +3 other tests skip
>      * igt@gem_exec_balancer@parallel-out-fence:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#4525])
>      * igt@gem_exec_capture@capture@vecs0-lmem0:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#11965 / [i915#12558]) +2 other
>             tests fail
>      * igt@gem_exec_capture@capture@vecs1-smem:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#11965) +1 other test fail
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-rkl: PASS -> FAIL ([i915#2846])
>      * igt@gem_exec_fair@basic-none-rrul:
> 
>           * shard-rkl: NOTRUN -> FAIL ([i915#2842]) +1 other test fail
>      * igt@gem_exec_fair@basic-pace-share:
> 
>           * shard-tglu: PASS -> FAIL ([i915#2842]) +1 other test fail
>      * igt@gem_exec_fair@basic-pace-solo:
> 
>           * shard-rkl: PASS -> FAIL ([i915#2842]) +1 other test fail
>      * igt@gem_exec_fair@basic-pace@bcs0:
> 
>           * shard-tglu: NOTRUN -> FAIL ([i915#2842]) +7 other tests fail
>      * igt@gem_exec_fence@submit:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4812]) +2 other tests skip
>      * igt@gem_exec_fence@submit67:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4812]) +2 other tests skip
>      * igt@gem_exec_flush@basic-uc-pro-default:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3539] / [i915#4852]) +2 other
>             tests skip
>      * igt@gem_exec_flush@basic-wb-prw-default:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3539] / [i915#4852]) +2 other
>             tests skip
>      * igt@gem_exec_params@rsvd2-dirt:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#5107])
>      * igt@gem_exec_reloc@basic-cpu-noreloc:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3281]) +6 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3281]) +6 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-cpu-active:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3281]) +13 other tests skip
>      * igt@gem_exec_reloc@basic-write-cpu-active:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3281]) +12 other tests skip
>      * igt@gem_exec_schedule@pi-common@vcs0:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#12296) +4 other tests fail
>      * igt@gem_exec_schedule@pi-common@vecs0:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#12296) +7 other tests fail
>      * igt@gem_exec_schedule@pi-ringfull@vecs0:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#12296) +7 other tests fail
>      * igt@gem_exec_schedule@preempt-queue-chain:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4537] / [i915#4812])
>           * shard-dg2: NOTRUN -> SKIP ([i915#4537] / [i915#4812])
>      * igt@gem_exec_suspend@basic-s3-devices:
> 
>           * shard-dg1: NOTRUN -> DMESG-WARN ([i915#4423]) +1 other test
>             dmesg-warn
>      * igt@gem_fence_thrash@bo-write-verify-none:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4860]) +1 other test skip
>      * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4860])
>           * shard-dg2: NOTRUN -> SKIP ([i915#4860]) +3 other tests skip
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#2190])
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4613]) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#12193)
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4565])
>      * igt@gem_lmem_swapping@parallel-random-engines:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#4613])
>      * igt@gem_lmem_swapping@parallel-random-verify:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#4613]) +1 other test skip
>      * igt@gem_lmem_swapping@verify-random-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#4613]) +4 other tests skip
>      * igt@gem_media_vme:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#284])
>      * igt@gem_mmap_gtt@basic-write:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4077]) +9 other tests skip
>      * igt@gem_mmap_gtt@flink-race:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4077]) +5 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4077]) +2 other tests skip
>      * igt@gem_mmap_wc@fault-concurrent:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4083]) +1 other test skip
>      * igt@gem_mmap_wc@write-prefaulted:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4083]) +4 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4083]) +2 other tests skip
>      * igt@gem_partial_pwrite_pread@write-uncached:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3282])
>      * igt@gem_partial_pwrite_pread@writes-after-reads:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3282]) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3282])
>      * igt@gem_pread@snoop:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3282]) +2 other tests skip
>      * igt@gem_pxp@create-protected-buffer:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#4270]) +1 other test skip
>      * igt@gem_pxp@create-regular-buffer:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4270])
>      * igt@gem_pxp@create-regular-context-1:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4270]) +4 other tests skip
>      * igt@gem_pxp@verify-pxp-stale-buf-execution:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4270])
>      * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8428]) +5 other tests skip
>      * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#5190] / [i915#8428]) +11 other
>             tests skip
>      * igt@gem_render_tiled_blits@basic:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4079])
>      * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4079])
>           * shard-rkl: NOTRUN -> SKIP ([i915#8411])
>      * igt@gem_set_tiling_vs_pwrite:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4079]) +1 other test skip
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3297] / [i915#3323])
>      * igt@gem_userptr_blits@dmabuf-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3297]) +4 other tests skip
>           * shard-rkl: NOTRUN -> SKIP ([i915#3297])
>      * igt@gem_userptr_blits@map-fixed-invalidate-busy:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3297])
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3297] / [i915#4880]) +1 other
>             test skip
>           * shard-dg2: NOTRUN -> SKIP ([i915#3297] / [i915#4880])
>      * igt@gem_userptr_blits@readonly-unsync:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3297]) +1 other test skip
>      * igt@gem_userptr_blits@sd-probe:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3297] / [i915#4958])
>      * igt@gem_userptr_blits@unsync-unmap:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3297])
>      * igt@gen3_render_tiledy_blits:
> 
>           * shard-mtlp: NOTRUN -> SKIP +12 other tests skip
>      * igt@gen7_exec_parse@bitmasks:
> 
>           * shard-dg2: NOTRUN -> SKIP +17 other tests skip
>      * igt@gen9_exec_parse@bb-chained:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#2527] / [i915#2856])
>      * igt@gen9_exec_parse@bb-start-cmd:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#2527]) +2 other tests skip
>      * igt@gen9_exec_parse@bb-start-out:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#2856]) +2 other tests skip
>      * igt@gen9_exec_parse@bb-start-param:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#2856]) +2 other tests skip
>           * shard-rkl: NOTRUN -> SKIP ([i915#2527])
>           * shard-tglu: NOTRUN -> SKIP ([i915#2527] / [i915#2856]) +2 other
>             tests skip
>      * igt@i915_module_load@resize-bar:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#6412])
>           * shard-dg1: NOTRUN -> SKIP ([i915#7178])
>      * igt@i915_pm_freq_api@freq-suspend@gt0:
> 
>           * shard-dg2: PASS -> INCOMPLETE ([i915#12455]) +1 other test
>             incomplete
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
> 
>           * shard-dg1: PASS -> FAIL ([i915#3591])
>      * igt@i915_pm_rps@thresholds-idle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11681)
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4387])
>           * shard-rkl: NOTRUN -> SKIP ([i915#4387])
>           * shard-dg1: NOTRUN -> SKIP ([i915#4387])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8437])
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#6245])
>      * igt@i915_query@query-topology-coherent-slice-mask:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#6188])
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-tglu-1: NOTRUN -> INCOMPLETE ([i915#7443])
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#12454] / [i915#12712])
>      * igt@kms_addfb_basic@tile-pitch-mismatch:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4212])
>      * igt@kms_async_flips@test-cursor:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#10333)
>      * igt@kms_atomic_transition@plane-all-modeset-transition:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#1769] / [i915#3555])
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#5286]) +3 other tests skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#5286]) +3 other tests skip
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#5286]) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#4538] / [i915#5286]) +4 other
>             tests skip
>      * igt@kms_big_fb@linear-64bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3638])
>           * shard-dg1: NOTRUN -> SKIP ([i915#3638]) +1 other test skip
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4538] / [i915#5190]) +13 other
>             tests skip
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
> 
>           * shard-rkl: NOTRUN -> SKIP +21 other tests skip
>      * igt@kms_big_fb@yf-tiled-addfb:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#6187])
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-snb: NOTRUN -> SKIP +81 other tests skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4538]) +7 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12313) +3 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#6095]) +104 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / [i915#6095]) +175 other
>             tests skip
>      * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#6095]) +24 other tests skip
>      * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / [i915#6095])
>             +2 other tests skip
>      * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#6095]) +44 other tests skip
>      * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#6095]) +14 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12313) +1 other test skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12313)
>           * shard-rkl: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#6095]) +75 other tests skip
>      * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#7828]) +11 other tests skip
>      * igt@kms_chamelium_frames@dp-crc-fast:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#7828]) +6 other tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-storm:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#7828]) +5 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#7828]) +4 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#7828])
>      * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#7828]) +5 other tests skip
>      * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
> 
>           * shard-dg2: NOTRUN -> TIMEOUT ([i915#7173])
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3116] / [i915#3299]) +1 other
>             test skip
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3116])
>      * igt@kms_content_protection@legacy:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#7116] / [i915#9424])
>      * igt@kms_content_protection@lic-type-1:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9424])
>      * igt@kms_content_protection@uevent@pipe-a-dp-4:
> 
>           * shard-dg2: NOTRUN -> FAIL ([i915#1339] / [i915#7173])
>      * igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#11453 / [i915#3359])
>           * shard-dg2: NOTRUN -> SKIP (i915#11453 / [i915#3359])
>           * shard-rkl: NOTRUN -> SKIP (i915#11453 / [i915#3359])
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11453 / [i915#3359]) +2 other
>             tests skip
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11453 / [i915#3359]) +2 other
>             tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3555]) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3555]) +3 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3555] / [i915#8814])
>      * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8814]) +3 other tests skip
>      * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9067])
>           * shard-dg2: NOTRUN -> SKIP ([i915#9067])
>           * shard-rkl: NOTRUN -> SKIP ([i915#9067])
>           * shard-dg1: NOTRUN -> SKIP ([i915#9067])
>           * shard-tglu: NOTRUN -> SKIP ([i915#9067])
>      * igt@kms_display_modes@mst-extended-mode-negative:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8588])
>           * shard-tglu: NOTRUN -> SKIP ([i915#8588])
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-dg2: PASS -> SKIP ([i915#3555])
>      * igt@kms_dp_aux_dev:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#1257])
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3840] / [i915#9688])
>      * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3840])
>      * igt@kms_dsc@dsc-with-bpc:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3555] / [i915#3840]) +1 other
>             test skip
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3469]) +1 other test skip
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4854])
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#1839])
>           * shard-dg2: NOTRUN -> SKIP ([i915#1839])
>           * shard-rkl: NOTRUN -> SKIP ([i915#1839])
>           * shard-dg1: NOTRUN -> SKIP ([i915#1839])
>           * shard-tglu: NOTRUN -> SKIP ([i915#1839])
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9337])
>           * shard-rkl: NOTRUN -> SKIP ([i915#9337])
>           * shard-dg1: NOTRUN -> SKIP ([i915#9337])
>      * igt@kms_feature_discovery@psr2:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#658]) +1 other test skip
>      * igt@kms_fence_pin_leak:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4881])
>      * igt@kms_flip@2x-flip-vs-fences:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3637]) +5 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8381]) +1 other test skip
>      * igt@kms_flip@2x-flip-vs-panning-vs-hang:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3637]) +2 other tests skip
>      * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3637]) +6 other tests skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#9934]) +1 other test skip
>      * igt@kms_flip@flip-vs-absolute-wf_vblank:
> 
>           * shard-mtlp: NOTRUN -> FAIL ([i915#2122]) +2 other tests fail
>           * shard-dg2: NOTRUN -> FAIL ([i915#2122]) +1 other test fail
>           * shard-dg1: PASS -> FAIL ([i915#12517] / [i915#2122])
>      * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
> 
>           * shard-tglu: NOTRUN -> FAIL ([i915#2122]) +1 other test fail
>      * igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#11989)
>      * igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a4:
> 
>           * shard-dg1: PASS -> FAIL ([i915#2122]) +2 other tests fail
>      * igt@kms_flip@flip-vs-fences-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8381]) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#8381])
>      * igt@kms_flip@flip-vs-suspend:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE ([i915#4839] / [i915#6113])
>      * igt@kms_flip@flip-vs-suspend@d-dp4:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE ([i915#6113])
>      * igt@kms_flip@modeset-vs-vblank-race:
> 
>           * shard-rkl: PASS -> FAIL (i915#10826) +1 other test fail
>      * igt@kms_flip@plain-flip-fb-recreate:
> 
>           * shard-rkl: PASS -> FAIL ([i915#2122])
>      * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1:
> 
>           * shard-rkl: NOTRUN -> FAIL ([i915#2122]) +1 other test fail
>      * igt@kms_flip@plain-flip-ts-check:
> 
>           * shard-mtlp: PASS -> FAIL ([i915#12457] / [i915#2122])
>      * igt@kms_flip@plain-flip-ts-check@a-edp1:
> 
>           * shard-mtlp: PASS -> FAIL ([i915#2122])
>      * igt@kms_flip@plain-flip-ts-check@b-edp1:
> 
>           * shard-mtlp: PASS -> FAIL (i915#11989)
>      * igt@kms_flip@plain-flip-ts-check@d-hdmi-a1:
> 
>           * shard-tglu: PASS -> FAIL ([i915#2122]) +4 other tests fail
>      * igt@kms_flip@wf_vblank-ts-check-interruptible@a-vga1:
> 
>           * shard-snb: PASS -> FAIL ([i915#2122]) +3 other tests fail
>      * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
> 
>           * shard-tglu-1: NOTRUN -> FAIL ([i915#2122]) +1 other test fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#2672] / [i915#3555]) +1 other
>             test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#2672]) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#2587] / [i915#2672]) +2 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#2587] / [i915#2672]) +1 other
>             test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#2672] / [i915#3555])
>           * shard-dg1: NOTRUN -> SKIP ([i915#2672] / [i915#3555])
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#2587] / [i915#2672]) +1 other
>             test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#2587] / [i915#2672] /
>             [i915#3555])
>           * shard-tglu: NOTRUN -> SKIP ([i915#2587] / [i915#2672] /
>             [i915#3555])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#2672] / [i915#3555] /
>             [i915#8813])
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#2672] / [i915#8813])
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#2672] / [i915#3555]) +1 other
>             test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#2672] / [i915#3555]) +1 other
>             test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#2672] / [i915#3555] /
>             [i915#5190]) +2 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#2672]) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
> 
>           * shard-dg2: NOTRUN -> FAIL ([i915#6880])
>      * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:
> 
>           * shard-snb: PASS -> SKIP
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#5354]) +54 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#1825]) +25 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#5439])
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8708]) +31 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
> 
>           * shard-dg1: NOTRUN -> SKIP +30 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8708]) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#1825]) +18 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +21 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10433 / [i915#3458])
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3458]) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3023]) +14 other tests skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#4423] / [i915#8708])
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
> 
>           * shard-tglu: NOTRUN -> SKIP +71 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3458]) +14 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8708]) +15 other tests skip
>      * igt@kms_hdmi_inject@inject-audio:
> 
>           * shard-tglu: PASS -> SKIP ([i915#433])
>      * igt@kms_hdr@bpc-switch-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3555] / [i915#8228])
>      * igt@kms_hdr@bpc-switch-suspend:
> 
>           * shard-dg2: PASS -> SKIP ([i915#3555] / [i915#8228])
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3555] / [i915#8228]) +1 other
>             test skip
>      * igt@kms_joiner@basic-force-ultra-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12394)
>           * shard-mtlp: NOTRUN -> SKIP (i915#10656)
>           * shard-rkl: NOTRUN -> SKIP (i915#12394)
>      * igt@kms_joiner@invalid-modeset-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#10656)
>           * shard-dg1: NOTRUN -> SKIP (i915#10656)
>           * shard-dg2: NOTRUN -> SKIP (i915#10656)
>      * igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12388)
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#6301])
>           * shard-rkl: NOTRUN -> SKIP ([i915#6301])
>           * shard-dg1: NOTRUN -> SKIP ([i915#6301])
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12247) +13 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12247) +4 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#12247) +1 other test skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12247 / [i915#6953] /
>             [i915#9423]) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#12247 / [i915#6953])
>           * shard-mtlp: NOTRUN -> SKIP (i915#12247 / [i915#6953])
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12247) +3 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#12247 / [i915#12504]) +6 other
>             tests skip
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12247 / [i915#6953])
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12247) +7 other tests skip
>      * igt@kms_pm_backlight@bad-brightness:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9812])
>      * igt@kms_pm_backlight@fade-with-dpms:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#5354])
>      * igt@kms_pm_backlight@fade-with-suspend:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#9812])
>      * igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9685]) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP ([i915#9685]) +1 other test skip
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3828])
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#10139)
>           * shard-dg2: NOTRUN -> SKIP ([i915#9685]) +1 other test skip
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9340])
>      * igt@kms_pm_lpsp@screens-disabled:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#8430])
>      * igt@kms_pm_rpm@basic-pci-d3-state:
> 
>           * shard-dg1: PASS -> DMESG-WARN ([i915#4423]) +2 other tests
>             dmesg-warn
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9519])
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9519]) +2 other tests skip
>           * shard-rkl: PASS -> SKIP ([i915#9519]) +2 other tests skip
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11520) +5 other tests skip
>      * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11520) +1 other test skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11520) +11 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9808])
>      * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11520) +7 other tests skip
>      * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12316) +8 other tests skip
>      * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>      * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11520) +8 other tests skip
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9683])
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9683])
>      * igt@kms_psr@fbc-pr-cursor-render:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9688]) +16 other tests skip
>      * igt@kms_psr@fbc-psr2-primary-mmap-gtt:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9732]) +17 other tests skip
>      * igt@kms_psr@pr-sprite-mmap-gtt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#9732]) +5 other tests skip
>      * igt@kms_psr@psr-cursor-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / [i915#9732]) +28 other
>             tests skip
>      * igt@kms_psr@psr-sprite-mmap-cpu:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / [i915#9732]) +20 other
>             tests skip
>      * igt@kms_psr@psr2-cursor-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / [i915#9732]) +13 other
>             tests skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#5190]) +1 other test skip
>      * igt@kms_scaling_modes@scaling-mode-center:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3555]) +5 other tests skip
>      * igt@kms_setmode@basic:
> 
>           * shard-snb: PASS -> FAIL ([i915#5465]) +2 other tests fail
>      * igt@kms_setmode@basic-clone-single-crtc:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3555]) +4 other tests skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#3555]) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3555] / [i915#8809])
>      * igt@kms_sysfs_edid_timing:
> 
>           * shard-dg1: NOTRUN -> FAIL (IGT#2 / [i915#6493])
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8623])
>      * igt@kms_vrr@flip-basic-fastset:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9906])
>      * igt@kms_vrr@lobf:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11920)
>           * shard-dg1: NOTRUN -> SKIP (i915#11920)
>      * igt@kms_vrr@max-min:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#9906])
>           * shard-dg2: NOTRUN -> SKIP ([i915#9906])
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3555] / [i915#9906])
>      * igt@kms_vrr@seamless-rr-switch-virtual:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9906]) +1 other test skip
>      * igt@kms_vrr@seamless-rr-switch-vrr:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9906])
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#2437])
>           * shard-rkl: NOTRUN -> SKIP ([i915#2437])
>           * shard-dg1: NOTRUN -> SKIP ([i915#2437])
>           * shard-tglu: NOTRUN -> SKIP ([i915#2437])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#2437])
>      * igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#2436])
>      * igt@perf@non-zero-reason:
> 
>           * shard-dg2: NOTRUN -> FAIL ([i915#9100]) +1 other test fail
>      * igt@perf_pmu@cpu-hotplug:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8850])
>      * igt@perf_pmu@module-unload:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#11823 / [i915#12555])
>      * igt@perf_pmu@semaphore-busy@vcs1:
> 
>           * shard-dg1: PASS -> FAIL ([i915#4349]) +3 other tests fail
>      * igt@perf_pmu@semaphore-busy@vecs0:
> 
>           * shard-mtlp: PASS -> FAIL ([i915#4349]) +4 other tests fail
>      * igt@prime_vgem@basic-fence-flip:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3708]) +1 other test skip
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3708] / [i915#4077])
>           * shard-rkl: NOTRUN -> SKIP ([i915#3708]) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#3708] / [i915#4077])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3708] / [i915#4077])
>      * igt@prime_vgem@fence-read-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3708]) +2 other tests skip
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3708])
>      * igt@sriov_basic@bind-unbind-vf:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9917]) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP ([i915#9917])
> 
>     Possible fixes
> 
>      * igt@gem_exec_fair@basic-pace@vecs0:
> 
>           * shard-rkl: FAIL ([i915#2842]) -> PASS +1 other test pass
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-rkl: ABORT ([i915#9820]) -> PASS
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
> 
>           * shard-dg1: FAIL ([i915#12548] / [i915#3591]) -> PASS
>      * igt@i915_power@sanity:
> 
>           * shard-mtlp: SKIP ([i915#7984]) -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
> 
>           * shard-mtlp: FAIL ([i915#2346]) -> PASS
>      * igt@kms_flip@flip-vs-blocking-wf-vblank:
> 
>           * shard-mtlp: FAIL (i915#11989 / [i915#2122]) -> PASS +1 other test
>             pass
>      * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
> 
>           * shard-tglu: FAIL ([i915#2122]) -> PASS +3 other tests pass
>      * igt@kms_flip@flip-vs-blocking-wf-vblank@d-edp1:
> 
>           * shard-mtlp: FAIL (i915#11989) -> PASS +2 other tests pass
>      * igt@kms_flip@flip-vs-suspend@b-edp1:
> 
>           * shard-mtlp: INCOMPLETE ([i915#6113]) -> PASS +1 other test pass
>      * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
> 
>           * shard-snb: INCOMPLETE ([i915#4839]) -> PASS +1 other test pass
>      * igt@kms_flip@plain-flip-fb-recreate:
> 
>           * shard-dg2: FAIL ([i915#2122]) -> PASS +4 other tests pass
>      * igt@kms_flip@plain-flip-fb-recreate@a-vga1:
> 
>           * shard-snb: FAIL ([i915#2122]) -> PASS +7 other tests pass
>      * igt@kms_flip@wf_vblank-ts-check:
> 
>           * shard-rkl: FAIL (i915#11989 / [i915#2122]) -> PASS
>           * shard-dg1: FAIL (i915#11989 / [i915#12517] / [i915#2122]) -> PASS
>      * igt@kms_flip@wf_vblank-ts-check@a-edp1:
> 
>           * shard-mtlp: FAIL -> PASS
>      * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a4:
> 
>           * shard-dg1: FAIL ([i915#2122]) -> PASS +2 other tests pass
>      * igt@kms_flip@wf_vblank-ts-check@b-edp1:
> 
>           * shard-mtlp: FAIL ([i915#2122]) -> PASS +1 other test pass
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
> 
>           * shard-dg2: FAIL ([i915#6880]) -> PASS
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-rkl: SKIP ([i915#9519]) -> PASS
>      * igt@kms_psr@psr2-sprite-plane-move:
> 
>           * shard-mtlp: FAIL (i915#12432) -> PASS
>      * igt@kms_psr@psr2-sprite-plane-move@edp-1:
> 
>           * shard-mtlp: FAIL (i915#10105) -> PASS
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
> 
>           * shard-mtlp: FAIL ([i915#9196]) -> PASS +1 other test pass
> 
>     Warnings
> 
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-mtlp: ABORT (i915#10131 / i915#10887 / [i915#9820]) ->
>             ABORT (i915#10131 / [i915#9820])
>      * igt@kms_chamelium_edid@dp-edid-resolution-list:
> 
>           * shard-dg1: SKIP ([i915#7828]) -> SKIP ([i915#4423] / [i915#7828])
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-dg2: SKIP ([i915#7118] / [i915#9424]) -> TIMEOUT
>             ([i915#7173])
>      * igt@kms_content_protection@srm:
> 
>           * shard-dg2: TIMEOUT ([i915#7173]) -> SKIP ([i915#7118])
>      * igt@kms_content_protection@uevent:
> 
>           * shard-dg2: SKIP ([i915#7118] / [i915#9424]) -> FAIL ([i915#1339]
>             / [i915#7173])
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
> 
>           * shard-dg1: SKIP ([i915#3458] / [i915#4423]) -> SKIP ([i915#3458])
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-dg1: SKIP ([i915#8708]) -> SKIP ([i915#4423] / [i915#8708])
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-dg1: SKIP ([i915#4423] / [i915#8708]) -> SKIP ([i915#8708])
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
> 
>           * shard-dg2: SKIP ([i915#3458]) -> SKIP (i915#10433 / [i915#3458])
>             +1 other test skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-dg1: SKIP -> SKIP ([i915#4423])
>      * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
> 
>           * shard-dg1: SKIP ([i915#3458]) -> SKIP ([i915#3458] / [i915#4423])
>             +1 other test skip
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-dg2: FAIL ([i915#12701]) -> SKIP ([i915#12713])
>      * igt@kms_plane_lowres@tiling-4:
> 
>           * shard-dg1: SKIP ([i915#3555]) -> SKIP ([i915#3555] / [i915#4423])
>      * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
> 
>           * shard-dg1: SKIP (i915#12247 / [i915#4423]) -> SKIP (i915#12247)
>             +1 other test skip
>      * igt@kms_pm_dc@dc9-dpms:
> 
>           * shard-rkl: SKIP ([i915#4281]) -> SKIP ([i915#3361])
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
