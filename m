Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AAFC27C53
	for <igt-dev@archiver.kernel.org>; Wed, 19 Jun 2024 05:55:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5503110E833;
	Wed, 19 Jun 2024 05:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lFvgEjEW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E2A10E848
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jun 2024 05:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718776505; x=1750312505;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=MuyYbm1llpQJBm4OVAYK4CK3eGVED4rjjWkNAaGokbg=;
 b=lFvgEjEWCpGc0LunGVp655oqXdffYxJHhOff+hGU1A1wtFRIRqJLQRWv
 pmJmXEScV/XY9lExcTCaRiYLRIG12HaEZMqo7gToS6HQ2Lk8lscFcX9cG
 CatkLuyPk+I01ZBmi+i18AvKw+NLjewLlgSuU4o+1aEfjvZnCJVwcbbL1
 1QMuEjQ/otIsT7EKPQSo1pNOkVbmaFCbkGLPeBnILpzApFfp9sS+n7ckL
 j6dAsuC1NFhbBbC0/RSoec3nFmcqP1b8i9Yx5KrmwsrykAlxa2Xv9rmS1
 kqfscrDBtcnuGVxA+UMcSew5Qpez2sp1bycFWNCSBohNGcqpzawyhJpic g==;
X-CSE-ConnectionGUID: XxoNb6PYRbu1pZFFu6JF2g==
X-CSE-MsgGUID: vtpi2w6GSzKGD7l9Qdxvfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="26817029"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="26817029"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 22:55:04 -0700
X-CSE-ConnectionGUID: xehB+eKfQuWDowIg+42aDQ==
X-CSE-MsgGUID: ZHw3mOPzSlGCVDnFNPuzAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="42506014"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.231])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 22:55:02 -0700
Date: Wed, 19 Jun 2024 07:54:58 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 Introduce intel_tiling_detect tool (rev2)
Message-ID: <20240619055458.kpn7kivhs4uqkca5@zkempczy-mobl2>
References: <20240618052335.152588-1-zbigniew.kempczynski@intel.com>
 <171871120752.103379.604814114434155577@a6498e030952>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171871120752.103379.604814114434155577@a6498e030952>
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

On Tue, Jun 18, 2024 at 11:46:47AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Introduce intel_tiling_detect tool (rev2)                       
>    URL:     https://patchwork.freedesktop.org/series/134062/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11267/index.html 
> 
>         CI Bug Log - changes from CI_DRM_14959_full -> IGTPW_11267_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_11267_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_11267_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11267/index.html
> 
> Participating hosts (9 -> 9)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_11267_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_selftest@live@late_gt_pm:
> 
>           * shard-dg2: PASS -> INCOMPLETE +1 other test incomplete
>      * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@c-dp4:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE

Unrelated, this is not introduce by the series.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_11267_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@blit-reloc-purge-cache:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8411) +1 other test skip
>      * igt@api_intel_bb@crc32:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6230)
>      * igt@debugfs_test@basic-hwmon:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9318)
>      * igt@drm_fdinfo@all-busy-check-all:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8414) +2 other tests skip
>      * igt@drm_fdinfo@busy-check-all@bcs0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8414) +12 other tests skip
>      * igt@drm_fdinfo@busy-check-all@ccs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8414) +5 other tests skip
>      * igt@gem_basic@multigpu-create-close:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7697) +1 other test skip
>      * igt@gem_busy@semaphore:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3936)
>      * igt@gem_caching@writes:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4873)
>      * igt@gem_ccs@block-multicopy-inplace:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#9323)
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE (i915#7297)
>      * igt@gem_close_race@multigpu-basic-threads:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_ctx_persistence@heartbeat-stop:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8555) +2 other tests skip
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#280)
>           * shard-dg2: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@hibernate:
> 
>           * shard-rkl: NOTRUN -> ABORT (i915#7975 / i915#8213)
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#5784) +2 other tests fail
>      * igt@gem_exec_balancer@bonded-sync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4771)
>           * shard-dg1: NOTRUN -> SKIP (i915#4771)
>      * igt@gem_exec_balancer@invalid-bonds:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4036)
>      * igt@gem_exec_balancer@noheartbeat:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_exec_balancer@parallel:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_balancer@sliced:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_capture@capture-invisible@lmem0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6334) +1 other test skip
>      * igt@gem_exec_fair@basic-none-share:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +4 other tests
>             skip
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2842) +1 other test fail
>      * igt@gem_exec_fair@basic-none@bcs0:
> 
>           * shard-rkl: PASS -> FAIL (i915#2842) +1 other test fail
>      * igt@gem_exec_fair@basic-pace-solo:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539)
>           * shard-dg1: NOTRUN -> SKIP (i915#3539)
>           * shard-mtlp: NOTRUN -> SKIP (i915#4473)
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#2842)
>      * igt@gem_exec_flush@basic-wb-ro-default:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852)
>      * igt@gem_exec_reloc@basic-cpu-read-active:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281)
>      * igt@gem_exec_reloc@basic-write-gtt-noreloc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +6 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +9 other tests skip
>      * igt@gem_exec_reloc@basic-write-read-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +10 other tests skip
>      * igt@gem_exec_schedule@semaphore-power:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4812) +3 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4537 / i915#4812)
>      * igt@gem_fenced_exec_thrash@no-spare-fences:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4860) +2 other tests skip
>      * igt@gem_lmem_swapping@basic@lmem0:
> 
>           * shard-dg2: PASS -> FAIL (i915#10378)
>      * igt@gem_lmem_swapping@heavy-multi@lmem0:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#10378)
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4565)
>      * igt@gem_lmem_swapping@heavy-verify-random@lmem0:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#10378)
>      * igt@gem_lmem_swapping@massive-random:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_media_vme:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#284)
>      * igt@gem_mmap@big-bo:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      * igt@gem_mmap_gtt@basic-read-write:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077)
>      * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +14 other tests skip
>      * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +4 other tests skip
>      * igt@gem_mmap_wc@write-prefaulted:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +4 other tests skip
>      * igt@gem_partial_pwrite_pread@reads-uncached:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +1 other test skip
>      * igt@gem_pread@bench:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +7 other tests skip
>      * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>      * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4270) +3 other tests skip
>      * igt@gem_pxp@reject-modify-context-protection-off-2:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_pxp@reject-modify-context-protection-on:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +5 other tests skip
>      * igt@gem_readwrite@beyond-eob:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +6 other tests skip
>      * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +6 other tests
>             skip
>      * igt@gem_render_copy@yf-tiled-to-vebox-linear:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428)
>      * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079) +1 other test skip
>      * igt@gem_set_tiling_vs_pwrite:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4079)
>           * shard-mtlp: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_softpin@evict-snoop-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4885)
>           * shard-dg1: NOTRUN -> SKIP (i915#4885)
>      * igt@gem_tiled_partial_pwrite_pread@writes:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +10 other tests skip
>      * igt@gem_userptr_blits@dmabuf-unsync:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>      * igt@gem_userptr_blits@map-fixed-invalidate-busy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gen9_exec_parse@batch-without-end:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856)
>      * igt@gen9_exec_parse@bb-large:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2527) +5 other tests skip
>      * igt@gen9_exec_parse@cmd-crossing-page:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856)
>      * igt@gen9_exec_parse@unaligned-access:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +3 other tests skip
>      * igt@gen9_exec_parse@valid-registers:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +4 other tests skip
>      * igt@i915_fb_tiling:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4881)
>           * shard-dg1: NOTRUN -> SKIP (i915#4881)
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-tglu: PASS -> ABORT (i915#9820)
>           * shard-mtlp: PASS -> ABORT (i915#10131 / i915#10887 / i915#9820)
>      * igt@i915_module_load@resize-bar:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6412)
>      * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7091)
>      * igt@i915_pm_freq_api@freq-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8399)
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
> 
>           * shard-dg1: PASS -> FAIL (i915#3591)
>      * igt@i915_pm_rps@basic-api:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6621) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#6621)
>      * igt@i915_pm_rps@reset:
> 
>           * shard-snb: PASS -> INCOMPLETE (i915#7790)
>      * igt@i915_pm_rps@thresholds-idle@gt0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8925) +1 other test skip
>      * igt@i915_pm_rps@thresholds-park@gt0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8925)
>      * igt@i915_power@sanity:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7984)
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6245)
>      * igt@i915_selftest@mock@memory_region:
> 
>           * shard-rkl: NOTRUN -> DMESG-WARN (i915#9311)
>           * shard-glk: NOTRUN -> DMESG-WARN (i915#9311)
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7707) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP (i915#7707)
>      * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4212) +1 other test skip
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3826)
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8709) +3 other tests skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8709) +11 other tests skip
>      * igt@kms_async_flips@invalid-async-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6228)
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9531)
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +1 other test skip
>      * igt@kms_big_fb@4-tiled-addfb:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +7 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +5 other tests
>             skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-mtlp: PASS -> DMESG-FAIL (i915#2017)
>      * igt@kms_big_fb@linear-64bpp-rotate-90:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3638) +6 other tests skip
>      * igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638) +3 other tests skip
>      * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>           * shard-mtlp: NOTRUN -> SKIP +5 other tests skip
>      * igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +10 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-addfb:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6187)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538) +3 other tests skip
>      * igt@kms_big_joiner@invalid-modeset-force-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#10656)
>      * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +7 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +103 other tests skip
>      * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
> 
>           * shard-snb: NOTRUN -> SKIP +63 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +3 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +161 other
>             tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#10278) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#10278)
>      * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +59 other tests skip
>      * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>             +5 other tests skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3742)
>           * shard-rkl: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7213) +4 other tests skip
>      * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4087) +3 other tests skip
>      * igt@kms_chamelium_audio@hdmi-audio-edid:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7828) +10 other tests skip
>      * igt@kms_chamelium_color@ctm-0-50:
> 
>           * shard-dg1: NOTRUN -> SKIP +71 other tests skip
>      * igt@kms_chamelium_color@ctm-blue-to-red:
> 
>           * shard-glk: NOTRUN -> SKIP +191 other tests skip
>      * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7828)
>      * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7828) +7 other tests skip
>      * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7828) +9 other tests skip
>      * igt@kms_chamelium_hpd@dp-hpd:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7828) +1 other test skip
>      * igt@kms_content_protection@atomic:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7116 / i915#9424)
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3116)
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3299)
>      * igt@kms_content_protection@legacy@pipe-a-dp-4:
> 
>           * shard-dg2: NOTRUN -> TIMEOUT (i915#7173)
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9424) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#9424) +1 other test skip
>      * igt@kms_content_protection@lic-type-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9424)
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8063)
>           * shard-dg1: NOTRUN -> SKIP (i915#9433)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7118 / i915#9424) +1 other test
>             skip
>      * igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3359)
>      * igt@kms_cursor_crc@cursor-offscreen-max-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814) +1 other test
>             skip
>      * igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3359) +1 other test skip
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3359) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +3 other tests skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4103) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4103 / i915#4213) +2 other tests
>             skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213) +1 other test
>             skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4213)
>      * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9723)
>      * igt@kms_dp_aux_dev:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1257)
>           * shard-rkl: NOTRUN -> SKIP (i915#1257)
>           * shard-tglu: NOTRUN -> SKIP (i915#1257)
>      * igt@kms_draw_crc@draw-method-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8812)
>      * igt@kms_dsc@dsc-basic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3840)
>           * shard-dg1: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3469) +1 other test skip
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1839) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1839) +1 other test skip
>      * igt@kms_feature_discovery@psr2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#658)
>      * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637) +4 other tests skip
>      * igt@kms_flip@2x-flip-vs-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP +41 other tests skip
>      * igt@kms_flip@2x-flip-vs-fences:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8381)
>      * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +4 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637) +2 other tests skip
>      * igt@kms_flip@plain-flip-ts-check@b-hdmi-a4:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#2122) +1 other test fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672) +2 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +5 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672) +8 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-rte:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +32 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-snb: PASS -> SKIP +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +24 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10433 / i915#3458)
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-tglu: NOTRUN -> SKIP +17 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +49 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +8 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708)
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +32 other tests skip
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9766)
>           * shard-dg1: NOTRUN -> SKIP (i915#9766)
>           * shard-dg2: NOTRUN -> SKIP (i915#9766)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +19 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +20 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +15 other tests skip
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228) +2 other tests
>             skip
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4070 / i915#4816)
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
> 
>           * shard-dg2: NOTRUN -> SKIP +22 other tests skip
>      * igt@kms_plane_cursor@viewport@pipe-d-edp-1-size-128:
> 
>           * shard-mtlp: PASS -> DMESG-WARN (i915#1982)
>      * igt@kms_plane_lowres@tiling-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8821)
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8806)
>      * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#8292)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9423) +3 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9423) +3 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9423) +3 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9423) +3 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5235) +3 other tests skip
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5235) +5 other tests skip
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235 / i915#9423) +15 other tests
>             skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5235) +2 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#5235)
>      * igt@kms_pm_backlight@bad-brightness:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5354) +1 other test skip
>      * igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5978)
>           * shard-rkl: NOTRUN -> SKIP (i915#3361)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9340)
>      * igt@kms_pm_lpsp@screens-disabled:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8430)
>           * shard-tglu: NOTRUN -> SKIP (i915#8430)
>           * shard-dg2: NOTRUN -> SKIP (i915#8430)
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-dg2: PASS -> SKIP (i915#9519) +1 other test skip
>           * shard-rkl: PASS -> SKIP (i915#9519) +1 other test skip
>      * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9519) +1 other test skip
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9519) +3 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_prime@basic-crc-vgem:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6524 / i915#6805)
>           * shard-dg1: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_prime@basic-modeset-hybrid:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-pr-cursor-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9673 / i915#9732) +4
>             other tests skip
>      * igt@kms_psr@fbc-psr-cursor-plane-onoff@edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +2 other tests skip
>      * igt@kms_psr@fbc-psr-cursor-render:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +3 other tests skip
>      * igt@kms_psr@pr-suspend:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +29 other tests
>             skip
>      * igt@kms_psr@psr2-primary-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +21 other tests
>             skip
>      * igt@kms_psr@psr2-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +28 other tests
>             skip
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9685)
>           * shard-tglu: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_rotation_crc@exhaust-fences:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4884)
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4235 / i915#5190)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5289) +1 other test skip
>      * igt@kms_rotation_crc@sprite-rotation-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4235) +1 other test skip
>      * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
> 
>           * shard-snb: PASS -> FAIL (i915#5465) +1 other test fail
>      * igt@kms_setmode@clone-exclusive-crtc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +7 other tests skip
>      * igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555)
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#9196)
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#9906)
>      * igt@kms_vrr@seamless-rr-switch-drrs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9906) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#8808 / i915#9906)
>      * igt@kms_vrr@seamless-rr-switch-vrr:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9906) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#9906)
>           * shard-tglu: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2437)
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2437)
>      * igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2436)
>           * shard-rkl: NOTRUN -> SKIP (i915#2436)
>      * igt@perf@per-context-mode-unprivileged:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2435)
>           * shard-dg1: NOTRUN -> SKIP (i915#2433)
>      * igt@perf_pmu@frequency@gt0:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#6806)
>      * igt@perf_pmu@rc6@other-idle-gt0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8516)
>      * igt@prime_vgem@basic-fence-flip:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3708) +1 other test skip
>      * igt@prime_vgem@basic-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708 / i915#4077)
>      * igt@prime_vgem@basic-write:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3291 / i915#3708)
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3708) +2 other tests skip
>      * igt@prime_vgem@fence-read-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708) +1 other test skip
>      * igt@sriov_basic@enable-vfs-bind-unbind-each:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9917) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP (i915#9917)
>           * shard-rkl: NOTRUN -> SKIP (i915#9917)
>      * igt@syncobj_wait@invalid-wait-zero-handles:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#9781)
>           * shard-rkl: NOTRUN -> FAIL (i915#9781)
>           * shard-dg1: NOTRUN -> FAIL (i915#9781)
>           * shard-snb: NOTRUN -> FAIL (i915#9781)
> 
>     Possible fixes
> 
>      * igt@drm_fdinfo@virtual-idle:
> 
>           * shard-rkl: FAIL (i915#7742) -> PASS
>      * igt@gem_lmem_swapping@heavy-random@lmem0:
> 
>           * shard-dg2: FAIL (i915#10378) -> PASS
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-rkl: ABORT (i915#9697) -> PASS
>           * shard-snb: ABORT (i915#9820) -> PASS
>           * shard-dg1: ABORT (i915#9820) -> PASS
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
> 
>           * shard-dg1: FAIL (i915#3591) -> PASS
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-mtlp: FAIL (i915#5138) -> PASS
>      * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1:
> 
>           * shard-snb: FAIL (i915#2122) -> PASS +1 other test pass
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
> 
>           * shard-dg2: FAIL (i915#6880) -> PASS
>      * igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-128:
> 
>           * shard-mtlp: INCOMPLETE -> PASS
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
> 
>           * shard-tglu: FAIL (i915#9196) -> PASS
>      * igt@perf_pmu@busy-double-start@ccs0:
> 
>           * shard-mtlp: FAIL (i915#4349) -> PASS
>      * igt@perf_pmu@busy-double-start@vecs1:
> 
>           * shard-dg2: FAIL (i915#4349) -> PASS +3 other tests pass
> 
>     Warnings
> 
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
> 
>           * shard-tglu: FAIL (i915#3591) -> WARN (i915#2681)
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-tglu: SKIP (i915#6944 / i915#9424) -> SKIP (i915#8063)
>      * igt@kms_content_protection@srm:
> 
>           * shard-snb: INCOMPLETE (i915#8816) -> SKIP +1 other test skip
>      * igt@kms_content_protection@type1:
> 
>           * shard-dg2: SKIP (i915#7118 / i915#9424) -> SKIP (i915#7118 /
>             i915#7162 / i915#9424)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#3458) -> SKIP (i915#3458) +1
>             other test skip
>      * igt@kms_psr@psr-cursor-mmap-cpu:
> 
>           * shard-dg2: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 /
>             i915#9673 / i915#9732) +7 other tests skip
>      * igt@kms_psr@psr2-cursor-blt:
> 
>           * shard-dg2: SKIP (i915#1072 / i915#9673 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732) +12 other tests skip
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7890 -> IGTPW_11267
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_14959: 7f26b37f8cb73f5cf2251d7fff5b55240e04f153 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_11267: b022b20fc7e0f8e3b382977245cf7ca7cdde6611 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_7890: a137e386eba9f46f838315f5d93b87561691d45e @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
