Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AF1E8FDB1
	for <igt-dev@archiver.kernel.org>; Mon, 29 Dec 2025 08:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FC510F298;
	Mon, 29 Dec 2025 08:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="REfUHQfC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D83A10F298
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Dec 2025 08:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766995315; x=1798531315;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=TsshmL0MaQRPzlQ+OqXAukvlIHcjEOBXd4izUtM8CFY=;
 b=REfUHQfC1eRjJ1oO40+HJjhoVxAEQlbjhP1VNc8m3p4f3COoZGeHAGeh
 LC+YbP1FLcGWodR7RjX06KZNNZSp4r023g3bufD/4GJNEHHRvlkL8EjY6
 sl/dtDO9RYK2CNFbMef0heuUOpsfApWwMvyPxXmmC1mZWcbN7lFQKIqiM
 TRq5smIaQSUo+US+qj8bVK7Tat9HyJER6s88gGikuKbMvRYLwjJBDv9HC
 rre/A7vyX8r9PdU8hZ1BHq76u7Cr0yNZXBmdLWVJAVklkI9/pdRV7VtTd
 SqitWpwrGC7QRW/BQI50lNLtSGWcDDecj3RTNugPg1sKt0Iu4Ns4TJy6X w==;
X-CSE-ConnectionGUID: 1K8tGSanQ++bYEjivPe73Q==
X-CSE-MsgGUID: jk2GqiWlQY6oLfbalAJblA==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68362296"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; d="scan'208";a="68362296"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 00:01:55 -0800
X-CSE-ConnectionGUID: NGATgaeSRCGV/5u+sr0wRw==
X-CSE-MsgGUID: rfoCus9VTTiyHnem0jMIFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; d="scan'208";a="205343950"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.9])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 00:01:53 -0800
Date: Mon, 29 Dec 2025 09:01:51 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib=2Fint?=
 =?utf-8?Q?el=5Fcompute=3A?= Select engine class by engine accessibility
Message-ID: <n7vit2qtlmcn7hbysouqxd2trpvcgn2vjjbvoispa7s4kzbscl@nybzh2ljuokx>
References: <20251223102243.113720-2-zbigniew.kempczynski@intel.com>
 <176659969589.116263.4225017232947837931@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176659969589.116263.4225017232947837931@a3b018990fe9>
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

On Wed, Dec 24, 2025 at 06:08:15PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/intel_compute: Select engine class by engine accessibility  
>    URL:     https://patchwork.freedesktop.org/series/159416/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14268/index.html 
> 
>         CI Bug Log - changes from CI_DRM_17733_full -> IGTPW_14268_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_14268_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_14268_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14268/index.html
> 
> Participating hosts (9 -> 9)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_14268_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_selftest@live@late_gt_pm:
> 
>           * shard-rkl: PASS -> INCOMPLETE +1 other test incomplete
>      * igt@kms_atomic@test-only@pipe-a-edp-1:
> 
>           * shard-mtlp: PASS -> ABORT

Patch doesn't introduce above regressions.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between CI_DRM_17733_full and
>    IGTPW_14268_full:
> 
>   New IGT tests (20)
> 
>      * igt@gem_ccs@block-multicopy-compressed@linear-compressed-compfmt0-lmem0-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.10] s
>      * igt@gem_ccs@block-multicopy-compressed@linear-compressed-compfmt0-smem-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.04] s
>      * igt@gem_ccs@block-multicopy-compressed@tile4-compressed-compfmt0-lmem0-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.10] s
>      * igt@gem_ccs@block-multicopy-compressed@tile4-compressed-compfmt0-smem-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.01] s
>      * igt@gem_ccs@block-multicopy-compressed@tile64-compressed-compfmt0-lmem0-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.10] s
>      * igt@gem_ccs@block-multicopy-compressed@tile64-compressed-compfmt0-smem-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.01] s
>      * igt@gem_ccs@block-multicopy-compressed@xmajor-compressed-compfmt0-lmem0-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.10] s
>      * igt@gem_ccs@block-multicopy-compressed@xmajor-compressed-compfmt0-smem-lmem0-multicopy:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.01] s
>      * igt@kms_atomic@draw-method-mmap-gtt:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_atomic@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_atomic@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_atomic@fbc-pr-primary-render:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_atomic@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_atomic@invalid-remove-userspace-config:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_atomic@load:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_atomic@load@pipe-a-edp-1:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_atomic@psr-1p-primscrn-spr-indfb-draw-render:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_atomic@system-suspend:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_atomic@test_reprime:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@kms_atomic@ts-continuation-modeset:
> 
>           * Statuses :
>           * Exec time: [None] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_14268_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@blit-reloc-keep-cache:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8411)
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8411)
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11078)
>      * igt@gem_basic@multigpu-create-close:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#7697) +1 other test skip
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#9323)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_ccs@large-ctrl-surf-copy:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13008)
>      * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
> 
>           * shard-dg2: PASS -> INCOMPLETE (i915#12392 / i915#13356)
>      * igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6335)
>           * shard-mtlp: NOTRUN -> SKIP (i915#6335)
>           * shard-rkl: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_ctx_persistence@heartbeat-hostile:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8555) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#8555)
>           * shard-mtlp: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@smoketest:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#1099)
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#280) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#280)
>           * shard-tglu: NOTRUN -> SKIP (i915#280)
>           * shard-mtlp: NOTRUN -> SKIP (i915#280)
>      * igt@gem_exec_balancer@parallel-keep-in-fence:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_balancer@parallel-out-fence:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_capture@capture-invisible:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6334) +1 other test skip
>      * igt@gem_exec_capture@capture-recoverable:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6344)
>      * igt@gem_exec_flush@basic-wb-ro-before-default:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +1 other test
>             skip
>      * igt@gem_exec_flush@basic-wb-ro-default:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852)
>      * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +3 other tests skip
>      * igt@gem_exec_reloc@basic-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +5 other tests skip
>      * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +1 other test skip
>      * igt@gem_exec_suspend@basic-s3-devices:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#4423) +2 other tests
>             dmesg-warn
>      * igt@gem_lmem_evict@dontneed-evict-race:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613 / i915#7582)
>           * shard-tglu: NOTRUN -> SKIP (i915#4613 / i915#7582)
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#4613)
>      * igt@gem_lmem_swapping@random:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@random-engines:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +5 other tests skip
>      * igt@gem_lmem_swapping@verify-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_media_vme:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#284)
>      * igt@gem_mmap@pf-nonblock:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      * igt@gem_mmap_offset@clear-via-pagefault:
> 
>           * shard-mtlp: PASS -> ABORT (i915#14809) +1 other test abort
>      * igt@gem_mmap_wc@pf-nonblock:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_partial_pwrite_pread@reads-uncached:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3282)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282)
>      * igt@gem_pxp@create-valid-protected-context:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_pxp@hw-rejects-pxp-buffer:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13398)
>      * igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +3 other tests
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428)
>      * igt@gem_softpin@evict-snoop:
> 
>           * shard-rkl: NOTRUN -> SKIP +8 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4885)
>           * shard-dg2: NOTRUN -> SKIP (i915#4885)
>      * igt@gem_softpin@evict-snoop-interruptible:
> 
>           * shard-glk10: NOTRUN -> SKIP +138 other tests skip
>      * igt@gem_tiled_partial_pwrite_pread@writes:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +6 other tests skip
>      * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3282)
>      * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880)
>           * shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4880)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297)
>      * igt@gen3_render_tiledx_blits:
> 
>           * shard-dg2: NOTRUN -> SKIP +8 other tests skip
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-glk: NOTRUN -> ABORT (i915#5566)
>      * igt@gen9_exec_parse@batch-invalid-length:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2527)
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856)
>      * igt@gen9_exec_parse@bb-secure:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +3 other tests
>             skip
>      * igt@gen9_exec_parse@unaligned-access:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 other
>             test skip
>      * igt@gen9_exec_parse@valid-registers:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +1 other test skip
>      * igt@i915_drm_fdinfo@busy-hang@ccs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#14073) +6 other tests skip
>      * igt@i915_drm_fdinfo@busy-hang@rcs0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14073) +15 other tests skip
>      * igt@i915_drm_fdinfo@busy-hang@vcs0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#14073) +5 other tests skip
>      * igt@i915_drm_fdinfo@virtual-busy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#14118) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#14118)
>      * igt@i915_drm_fdinfo@virtual-busy-hang-all:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14118) +1 other test skip
>      * igt@i915_module_load@resize-bar:
> 
>           * shard-dg2: NOTRUN -> DMESG-WARN (i915#14545)
>           * shard-rkl: NOTRUN -> SKIP (i915#6412)
>           * shard-dg1: NOTRUN -> SKIP (i915#7178)
>           * shard-tglu: NOTRUN -> SKIP (i915#6412)
>      * igt@i915_pm_rpm@system-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13356)
>      * igt@i915_pm_rps@min-max-config-loaded:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11681 / i915#6621)
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6245)
>           * shard-tglu: NOTRUN -> SKIP (i915#6245)
>           * shard-rkl: NOTRUN -> SKIP (i915#6245)
>      * igt@i915_selftest@live@workarounds:
> 
>           * shard-mtlp: PASS -> DMESG-FAIL (i915#12061) +1 other test
>             dmesg-fail
>      * igt@i915_suspend@forcewake:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#4817)
>      * igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4215 / i915#5190)
>      * igt@kms_async_flips@async-flip-suspend-resume:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12761)
>      * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12761 / i915#14995)
>      * igt@kms_atomic@test-only:
> 
>           * shard-mtlp: PASS -> ABORT (i915#13562)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +1 other test
>             skip
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +6 other tests skip
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5286) +3 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-mtlp: PASS -> FAIL (i915#5138) +1 other test fail
>      * igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638) +1 other test skip
>      * igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190)
>           * shard-mtlp: NOTRUN -> SKIP (i915#6187)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-mtlp: NOTRUN -> SKIP +5 other tests skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +6 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538)
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +195 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +69 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +129 other
>             tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6095) +45 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +72 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +14 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#14544 / i915#6095)
>             +5 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#6095) +40 other
>             tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#6095) +8 other tests
>             skip
>      * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6095) +34 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12313)
>           * shard-dg1: NOTRUN -> SKIP (i915#12313)
>           * shard-mtlp: NOTRUN -> SKIP (i915#12313)
>           * shard-dg2: NOTRUN -> SKIP (i915#12313)
>           * shard-rkl: NOTRUN -> SKIP (i915#12313 / i915#14544)
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_chamelium_audio@dp-audio-edid:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11151 / i915#7828) +7 other tests
>             skip
>      * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11151 / i915#7828) +8 other
>             tests skip
>      * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11151 / i915#7828) +2 other
>             tests skip
>      * igt@kms_chamelium_frames@hdmi-crc-multiple:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#7828) +3 other tests
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#11151 / i915#7828) +1 other test
>             skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-storm:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#11151 / i915#7828) +1 other test
>             skip
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#14544 / i915#7828)
>      * igt@kms_content_protection@atomic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6944 / i915#7118 / i915#9424)
>      * igt@kms_content_protection@content-type-change:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#9424)
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3299)
>           * shard-rkl: NOTRUN -> SKIP (i915#3116)
>           * shard-dg1: NOTRUN -> SKIP (i915#3299)
>           * shard-tglu: NOTRUN -> SKIP (i915#3116 / i915#3299)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3299)
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3116 / i915#3299)
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6944 / i915#9424)
>      * igt@kms_content_protection@suspend-resume:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#6944)
>           * shard-dg1: NOTRUN -> SKIP (i915#6944)
>           * shard-tglu: NOTRUN -> SKIP (i915#6944)
>           * shard-mtlp: NOTRUN -> SKIP (i915#6944)
>           * shard-dg2: NOTRUN -> SKIP (i915#6944)
>      * igt@kms_content_protection@type1:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#9424)
>      * igt@kms_content_protection@uevent@pipe-a-dp-3:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#1339 / i915#7173)
>      * igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13049) +1 other test skip
>      * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: PASS -> FAIL (i915#13566) +6 other tests fail
>      * igt@kms_cursor_crc@cursor-random-32x10:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814)
>      * igt@kms_cursor_crc@cursor-random-64x21:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#13566) +1 other test fail
>      * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#13566) +1 other test fail
>      * igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>           * shard-tglu: PASS -> FAIL (i915#13566) +5 other tests fail
>      * igt@kms_cursor_crc@cursor-sliding-32x10:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +1 other test skip
>      * igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13046 / i915#5354) +1 other test
>             skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4213)
>           * shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213)
>           * shard-rkl: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9809)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4103) +1 other test skip
>      * igt@kms_dp_aux_dev:
> 
>           * shard-dg2: PASS -> SKIP (i915#1257)
>           * shard-rkl: NOTRUN -> SKIP (i915#1257 / i915#14544)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#1257)
>      * igt@kms_dp_linktrain_fallback@dsc-fallback:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13707)
>           * shard-dg1: NOTRUN -> SKIP (i915#13707)
>           * shard-tglu: NOTRUN -> SKIP (i915#13707)
>           * shard-mtlp: NOTRUN -> SKIP (i915#13707)
>      * igt@kms_draw_crc@draw-method-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8812)
>           * shard-dg1: NOTRUN -> SKIP (i915#8812)
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_fb_coherency@memset-crc:
> 
>           * shard-dg2: NOTRUN -> CRASH (i915#15351) +1 other test crash
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3955)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3469)
>           * shard-dg1: NOTRUN -> SKIP (i915#3469)
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9337)
>      * igt@kms_flip@2x-blocking-absolute-wf_vblank:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#9934) +8 other tests
>             skip
>      * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3637 / i915#9934) +2 other
>             tests skip
>      * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9934) +3 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#9934) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +3 other tests skip
>      * igt@kms_flip@2x-flip-vs-rmfb:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637 / i915#9934) +2 other tests
>             skip
>      * igt@kms_flip@2x-flip-vs-suspend:
> 
>           * shard-glk10: NOTRUN -> INCOMPLETE (i915#12745 / i915#4839)
>      * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
> 
>           * shard-glk10: NOTRUN -> INCOMPLETE (i915#4839)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +3 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2672 / i915#3555) +3 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672) +3 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672 / i915#3555) +3 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672) +3 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672 / i915#3555 / i915#5190) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8810 / i915#8813)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2672 / i915#3555)
>           * shard-dg1: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8810 / i915#8813)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2587 / i915#2672)
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672)
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +13 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-rte:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +20 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10055)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15104)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15102) +2 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#15102)
>           * shard-dg1: NOTRUN -> SKIP (i915#15102)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15102 / i915#3458) +1 other test
>             skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +30 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +11 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15102) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5439)
>           * shard-dg1: NOTRUN -> SKIP (i915#5439)
>           * shard-tglu: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15102 / i915#3023) +2 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
> 
>           * shard-dg1: NOTRUN -> SKIP +14 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#1825) +1 other test
>             skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-tglu: NOTRUN -> SKIP +52 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15102 / i915#3458) +7 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15102) +22 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +2 other tests skip
>      * igt@kms_hdr@bpc-switch-dpms:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#8228) +2 other
>             tests skip
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#12713)
>      * igt@kms_hdr@static-swap:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228)
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228) +2 other tests
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#12713 / i915#3555 / i915#8228)
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228) +2 other tests
>             skip
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-dg2: PASS -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_joiner@basic-force-ultra-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15458)
>      * igt@kms_joiner@basic-max-non-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13688)
>      * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15458)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_pipe_crc_basic@suspend-read-crc:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#12756 / i915#13476)
>      * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12756 / i915#13409 /
>             i915#13476) +1 other test incomplete
>      * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#13476)
>      * igt@kms_plane_alpha_blend@alpha-transparent-fb:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10647 / i915#12177)
>      * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10647) +1 other test fail
>      * igt@kms_plane_lowres@tiling-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +1 other test skip
>      * igt@kms_plane_multiple@2x-tiling-4:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@2x-tiling-none:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@2x-tiling-y:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@2x-tiling-yf:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15329) +4 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15329) +3 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#15329) +4 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15329) +4 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15329 / i915#3555 / i915#6953)
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15329) +3 other tests skip
>      * igt@kms_pm_backlight@basic-brightness:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9812)
>      * igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9685) +1 other test skip
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#9295)
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9685)
>           * shard-dg1: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_pm_lpsp@screens-disabled:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#8430)
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-dg2: PASS -> SKIP (i915#15073) +1 other test skip
>      * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-rkl: PASS -> SKIP (i915#15073)
>           * shard-dg1: PASS -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@package-g7:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15403)
>           * shard-mtlp: NOTRUN -> SKIP (i915#15403)
>           * shard-dg2: NOTRUN -> SKIP (i915#15403)
>           * shard-dg1: NOTRUN -> SKIP (i915#15403)
>      * igt@kms_pm_rpm@system-suspend-idle:
> 
>           * shard-dg2: PASS -> INCOMPLETE (i915#14419)
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
> 
>           * shard-glk10: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>      * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11520) +6 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#11520) +11 other tests skip
>      * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11520) +2 other tests skip
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9683) +1 other test skip
>      * igt@kms_psr@fbc-pr-cursor-mmap-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +6 other tests
>             skip
>      * igt@kms_psr@fbc-psr-primary-mmap-cpu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +12 other tests
>             skip
>      * igt@kms_psr@fbc-psr-primary-mmap-cpu@edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +5 other tests skip
>      * igt@kms_psr@fbc-psr2-cursor-mmap-cpu:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +21 other tests skip
>      * igt@kms_psr@fbc-psr2-sprite-plane-move:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#14544 / i915#9732)
>      * igt@kms_psr@psr2-sprite-blt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9732) +9 other tests skip
>      * igt@kms_psr@psr2-sprite-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +6 other tests
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077 / i915#9688) +1 other test
>             skip
>      * igt@kms_psr@psr2-sprite-plane-onoff:
> 
>           * shard-glk: NOTRUN -> SKIP +408 other tests skip
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9685) +2 other tests skip
>      * igt@kms_rotation_crc@bad-tiling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12755)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5289) +2 other tests skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_scaling_modes@scaling-mode-none:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +3 other tests skip
>      * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
> 
>           * shard-glk10: NOTRUN -> ABORT (i915#13179) +1 other test abort
>      * igt@kms_setmode@basic:
> 
>           * shard-dg1: PASS -> FAIL (i915#15106)
>      * igt@kms_setmode@basic-clone-single-crtc:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>      * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#15106) +1 other test fail
>      * igt@kms_setmode@basic@pipe-b-hdmi-a-1:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#15106)
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10959)
>      * igt@kms_vblank@ts-continuation-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12276) +1 other test
>             incomplete
>      * igt@kms_vrr@flip-basic-fastset:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9906) +1 other test skip
>      * igt@perf_pmu@busy-accuracy-98:
> 
>           * shard-snb: NOTRUN -> SKIP +88 other tests skip
>      * igt@perf_pmu@busy-double-start@vecs1:
> 
>           * shard-dg2: PASS -> FAIL (i915#4349) +3 other tests fail
>      * igt@perf_pmu@busy-idle@vcs1:
> 
>           * shard-mtlp: PASS -> FAIL (i915#4349) +4 other tests fail
>      * igt@perf_pmu@event-wait:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544) +1 other test skip
>      * igt@perf_pmu@module-unload:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#14433)
>      * igt@prime_vgem@basic-fence-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708)
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3708)
>      * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#12910) +18 other tests fail
> 
>     Possible fixes
> 
>      * igt@gem_exec_big@single:
> 
>           * shard-tglu: ABORT (i915#11713) -> PASS
>      * igt@gem_exec_schedule@semaphore-noskip:
> 
>           * shard-dg2: SKIP (i915#2575) -> PASS +2 other tests pass
>      * igt@gem_lmem_swapping@verify:
> 
>           * shard-dg2: WARN (i915#15490) -> PASS
>      * igt@gem_lmem_swapping@verify@lmem0:
> 
>           * shard-dg2: CRASH (i915#15490) -> PASS
>      * igt@gem_pxp@create-protected-buffer:
> 
>           * shard-rkl: SKIP (i915#4270) -> PASS
>      * igt@i915_selftest@live:
> 
>           * shard-dg1: DMESG-FAIL -> PASS
>      * igt@i915_selftest@live@gem_contexts:
> 
>           * shard-dg1: DMESG-FAIL (i915#15433) -> PASS
>      * igt@kms_addfb_basic@no-handle:
> 
>           * shard-dg1: DMESG-WARN (i915#4391 / i915#4423) -> PASS
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-mtlp: FAIL (i915#5138) -> PASS
>      * igt@kms_cursor_crc@cursor-random-128x42:
> 
>           * shard-tglu: FAIL (i915#13566) -> PASS +1 other test pass
>      * igt@kms_cursor_crc@cursor-random-256x85:
> 
>           * shard-rkl: FAIL (i915#13566) -> PASS +3 other tests pass
>      * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
> 
>           * shard-dg2: SKIP (i915#3555) -> PASS
>      * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-vga1:
> 
>           * shard-snb: FAIL (i915#10826) -> PASS +1 other test pass
>      * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
> 
>           * shard-dg2: SKIP -> PASS +7 other tests pass
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-rkl: SKIP (i915#3555 / i915#8228) -> PASS +1 other test
>             pass
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-dg2: SKIP (i915#3555 / i915#8228) -> PASS
>      * igt@kms_pm_dc@dc5-dpms-negative:
> 
>           * shard-glk: DMESG-WARN (i915#118) -> PASS
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15073) -> PASS
>           * shard-dg1: SKIP (i915#15073) -> PASS +1 other test pass
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-dg2: SKIP (i915#15073) -> PASS
>           * shard-rkl: SKIP (i915#15073) -> PASS
>      * igt@kms_vblank@query-forked-hang:
> 
>           * shard-dg1: DMESG-WARN (i915#4423) -> PASS +3 other tests pass
>      * igt@perf_pmu@busy-double-start@ccs0:
> 
>           * shard-dg2: FAIL (i915#4349) -> PASS
>      * igt@perf_pmu@busy-double-start@vcs1:
> 
>           * shard-mtlp: FAIL (i915#4349) -> PASS
>      * igt@perf_pmu@busy-double-start@vecs0:
> 
>           * shard-dg1: FAIL (i915#4349) -> PASS +1 other test pass
> 
>     Warnings
> 
>      * igt@api_intel_bb@blit-reloc-purge-cache:
> 
>           * shard-rkl: SKIP (i915#8411) -> SKIP (i915#14544 / i915#8411)
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8411) -> SKIP (i915#8411)
>      * igt@gem_basic@multigpu-create-close:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#7697) -> SKIP (i915#7697)
>      * igt@gem_exec_capture@capture-invisible:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6334) -> SKIP (i915#6334) +1
>             other test skip
>      * igt@gem_exec_capture@capture-recoverable:
> 
>           * shard-rkl: SKIP (i915#6344) -> SKIP (i915#14544 / i915#6344)
>      * igt@gem_exec_reloc@basic-cpu-read-active:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#3281)
>      * igt@gem_exec_reloc@basic-write-read:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3281) -> SKIP (i915#3281) +6
>             other tests skip
>      * igt@gem_exec_reloc@basic-write-read-active:
> 
>           * shard-rkl: SKIP (i915#3281) -> SKIP (i915#14544 / i915#3281) +2
>             other tests skip
>      * igt@gem_exec_schedule@semaphore-power:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#7276) -> SKIP (i915#7276)
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2190) -> SKIP (i915#2190)
>      * igt@gem_pwrite@basic-self:
> 
>           * shard-rkl: SKIP (i915#3282) -> SKIP (i915#14544 / i915#3282) +1
>             other test skip
>      * igt@gem_pxp@hw-rejects-pxp-buffer:
> 
>           * shard-rkl: SKIP (i915#13717) -> SKIP (i915#13717 / i915#14544)
>      * igt@gem_pxp@reject-modify-context-protection-off-1:
> 
>           * shard-dg2: SKIP (i915#2575) -> SKIP (i915#4270)
>      * igt@gem_tiled_partial_pwrite_pread@reads:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3282) -> SKIP (i915#3282)
>      * igt@gem_userptr_blits@coherency-sync:
> 
>           * shard-rkl: SKIP (i915#3297) -> SKIP (i915#14544 / i915#3297)
>      * igt@gem_userptr_blits@unsync-unmap-cycles:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3297) -> SKIP (i915#3297) +1
>             other test skip
>      * igt@gen3_mixed_blits:
> 
>           * shard-rkl: SKIP -> SKIP (i915#14544) +5 other tests skip
>      * igt@gen9_exec_parse@basic-rejected:
> 
>           * shard-rkl: SKIP (i915#2527) -> SKIP (i915#14544 / i915#2527) +1
>             other test skip
>      * igt@gen9_exec_parse@unaligned-jump:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2527) -> SKIP (i915#2527) +1
>             other test skip
>      * igt@i915_pm_freq_api@freq-suspend:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8399) -> SKIP (i915#8399) +1
>             other test skip
>      * igt@i915_pm_freq_mult@media-freq@gt0:
> 
>           * shard-rkl: SKIP (i915#6590) -> SKIP (i915#14544 / i915#6590) +1
>             other test skip
>      * igt@i915_power@sanity:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#7984) -> SKIP (i915#7984)
>      * igt@intel_hwmon@hwmon-read:
> 
>           * shard-rkl: SKIP (i915#7707) -> SKIP (i915#14544 / i915#7707)
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-rkl: SKIP (i915#12454 / i915#12712) -> SKIP (i915#12454 /
>             i915#12712 / i915#14544)
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#5286) -> SKIP (i915#5286) +1
>             other test skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>           * shard-rkl: SKIP (i915#5286) -> SKIP (i915#14544 / i915#5286) +4
>             other tests skip
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>           * shard-rkl: SKIP (i915#3638) -> SKIP (i915#14544 / i915#3638) +1
>             other test skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-dg1: SKIP (i915#4423 / i915#4538) -> SKIP (i915#4538)
>      * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#6095) -> SKIP (i915#14544 / i915#6095) +1
>             other test skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#14098 /
>             i915#14544 / i915#6095) +5 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
> 
>           * shard-dg1: SKIP (i915#4423 / i915#6095) -> SKIP (i915#6095)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6095) -> SKIP (i915#6095) +3
>             other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#14544 / i915#6095) -> SKIP
>             (i915#14098 / i915#6095) +6 other tests skip
>      * igt@kms_chamelium_frames@hdmi-crc-single:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#7828) -> SKIP (i915#11151 /
>             i915#14544 / i915#7828) +2 other tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-fast:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#14544 / i915#7828) -> SKIP
>             (i915#11151 / i915#7828) +3 other tests skip
>      * igt@kms_content_protection@legacy:
> 
>           * shard-rkl: SKIP (i915#6944 / i915#7118 / i915#9424) -> SKIP
>             (i915#14544 / i915#6944 / i915#7118 / i915#9424)
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-dg2: FAIL (i915#7173) -> SKIP (i915#6944 / i915#9424)
>           * shard-rkl: SKIP (i915#6944 / i915#9424) -> SKIP (i915#14544 /
>             i915#6944 / i915#9424)
>      * igt@kms_content_protection@srm:
> 
>           * shard-dg2: FAIL (i915#7173) -> SKIP (i915#6944 / i915#7118)
>           * shard-rkl: SKIP (i915#6944 / i915#7118) -> SKIP (i915#14544 /
>             i915#6944 / i915#7118)
>      * igt@kms_content_protection@type1:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6944 / i915#7118 / i915#9424)
>             -> SKIP (i915#6944 / i915#7118 / i915#9424)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-dg2: SKIP (i915#6944 / i915#7118 / i915#9424) -> FAIL
>             (i915#1339 / i915#7173)
>      * igt@kms_cursor_crc@cursor-onscreen-32x10:
> 
>           * shard-rkl: SKIP (i915#3555) -> SKIP (i915#14544 / i915#3555) +1
>             other test skip
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP +10 other tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>           * shard-dg2: SKIP -> SKIP (i915#13046 / i915#5354)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-dg2: SKIP -> SKIP (i915#4103 / i915#4213)
>      * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>           * shard-rkl: SKIP (i915#9723) -> SKIP (i915#14544 / i915#9723)
>      * igt@kms_dp_link_training@uhbr-mst:
> 
>           * shard-rkl: SKIP (i915#13748) -> SKIP (i915#13748 / i915#14544)
>      * igt@kms_dp_link_training@uhbr-sst:
> 
>           * shard-rkl: SKIP (i915#13748 / i915#14544) -> SKIP (i915#13748)
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3840) -> SKIP (i915#3840)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-rkl: SKIP (i915#1839) -> SKIP (i915#14544 / i915#1839)
>      * igt@kms_feature_discovery@psr1:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#658) -> SKIP (i915#658)
>      * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
> 
>           * shard-rkl: SKIP (i915#9934) -> SKIP (i915#14544 / i915#9934) +1
>             other test skip
>      * igt@kms_flip@2x-flip-vs-panning:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9934) -> SKIP (i915#9934) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2672) -> SKIP (i915#2672) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2672 / i915#3555) -> SKIP
>             (i915#2672 / i915#3555) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-dg1: SKIP (i915#4423) -> SKIP +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15102 / i915#3023) -> SKIP
>             (i915#15102 / i915#3023) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-rkl: SKIP (i915#1825) -> SKIP (i915#14544 / i915#1825) +16
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
> 
>           * shard-dg1: SKIP (i915#15102 / i915#3458 / i915#4423) -> SKIP
>             (i915#15102 / i915#3458)
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
> 
>           * shard-dg2: SKIP (i915#15102 / i915#3458) -> SKIP (i915#10433 /
>             i915#15102 / i915#3458) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> 
>           * shard-dg2: SKIP -> SKIP (i915#10055)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite:
> 
>           * shard-rkl: SKIP (i915#15102) -> SKIP (i915#14544 / i915#15102) +2
>             other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15102) -> SKIP (i915#15102) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#15102 / i915#3458) -> SKIP
>             (i915#15102 / i915#3458) +1 other test skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
> 
>           * shard-rkl: SKIP (i915#15102 / i915#3023) -> SKIP (i915#14544 /
>             i915#15102 / i915#3023) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1825) -> SKIP (i915#1825) +20
>             other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
> 
>           * shard-dg2: SKIP -> SKIP (i915#15102 / i915#3458)
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-rkl: SKIP (i915#13331 / i915#14544) -> SKIP (i915#12713)
>           * shard-tglu: SKIP (i915#1187 / i915#12713) -> SKIP (i915#12713)
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15458) -> SKIP (i915#15458) +1
>             other test skip
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6301) -> SKIP (i915#6301) +1
>             other test skip
>      * igt@kms_plane_lowres@tiling-4:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555) -> SKIP (i915#3555)
>      * igt@kms_pm_backlight@basic-brightness:
> 
>           * shard-rkl: SKIP (i915#5354) -> SKIP (i915#14544 / i915#5354)
>      * igt@kms_pm_backlight@fade-with-suspend:
> 
>           * shard-dg2: SKIP -> SKIP (i915#5354) +1 other test skip
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-tglu: FAIL (i915#9295) -> SKIP (i915#15128)
>      * igt@kms_pm_lpsp@screens-disabled:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8430) -> SKIP (i915#8430)
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
> 
>           * shard-dg1: SKIP (i915#11520 / i915#4423) -> SKIP (i915#11520)
>      * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
> 
>           * shard-rkl: SKIP (i915#11520 / i915#14544) -> SKIP (i915#11520) +3
>             other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
> 
>           * shard-rkl: SKIP (i915#11520) -> SKIP (i915#11520 / i915#14544) +4
>             other tests skip
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9683) -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-pr-cursor-blt:
> 
>           * shard-dg2: SKIP -> SKIP (i915#1072 / i915#9732)
>      * igt@kms_psr@pr-cursor-plane-onoff:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 /
>             i915#14544 / i915#9732) +7 other tests skip
>      * igt@kms_psr@pr-sprite-render:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#14544 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732) +8 other tests skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#5289) -> SKIP (i915#5289) +1
>             other test skip
>      * igt@kms_vrr@flip-dpms:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15243 / i915#3555) -> SKIP
>             (i915#15243 / i915#3555)
>      * igt@kms_vrr@seamless-rr-switch-virtual:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9906) -> SKIP (i915#9906)
>      * igt@perf@per-context-mode-unprivileged:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2435) -> SKIP (i915#2435)
>      * igt@perf_pmu@rc6-all-gts:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8516) -> SKIP (i915#8516)
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3708) -> SKIP (i915#3708)
>      * igt@sriov_basic@enable-vfs-autoprobe-on:
> 
>           * shard-rkl: SKIP (i915#9917) -> SKIP (i915#14544 / i915#9917)
>      * igt@sriov_basic@enable-vfs-bind-unbind-each:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9917) -> SKIP (i915#9917)
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8674 -> IGTPW_14268
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_17733: cab246648fd89efbe8d20ed4c86e7fcebd7606da @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_14268: 14268
>    IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
