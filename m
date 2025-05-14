Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FAAC3ABCB
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 05:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6AB10E24B;
	Wed, 14 May 2025 05:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k9mWMb1i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7382F10E24A;
 Wed, 14 May 2025 05:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747199111; x=1778735111;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Tpt+qtg52lsciHG465yOa3ACchGQ5BkTfUbUpXG/d9E=;
 b=k9mWMb1it8B7Kz7LFZC5XY+DfzB77h6yAE9vTGTw8HO057F6Re6GQOCd
 /iAZlgnbT/EjB908O2w+V9KFNocPSyZetgZvUL7ZBjrUo0D0WPte8Jqc+
 VPK0gTIVOLND/I9ykTC41UqBW8gDG4N4pvVIrE9Nv/lIzmbmg+IBtvZsx
 Da4wy9J3/RpNOg72tURbldKDh1pgE4C7HLEJXS6CxRs0Nmg93jxbnahLB
 H52cZr6GhVSUvtH6ffJCEQ/YwUvBqQ239pWuNFyuqIszET4k1xKiwpsuq
 Y+TEJeUSNdsPHlr048oZ1X9wZFN5xn3ijZcjhqd5YAq3G6ZlqQAUryfh8 w==;
X-CSE-ConnectionGUID: +fH6EG/jT9ylLQjP1sBiAA==
X-CSE-MsgGUID: xvFTmG0oSsagHy+TSh0MKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="60085671"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="60085671"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 22:05:10 -0700
X-CSE-ConnectionGUID: TtEgSx4uQhWW5eOuTy84Kw==
X-CSE-MsgGUID: TxFrX14IS+28UjovyYmfdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="169024709"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 22:05:08 -0700
Date: Wed, 14 May 2025 07:05:06 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Improve mem-copy/mem-set lib and tests
Message-ID: <xmh7gqfabuzazfmheftjqwfshb754hs4py3jomwlrqzrl72vgl@bgiljjdkijt6>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
 <174717797452.76810.15348053108286782872@c664b1dc75d1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174717797452.76810.15348053108286782872@c664b1dc75d1>
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

On Tue, May 13, 2025 at 11:12:54PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Improve mem-copy/mem-set lib and tests                          
>    URL:     https://patchwork.freedesktop.org/series/148977/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13120/index.html 
> 
>         CI Bug Log - changes from CI_DRM_16540_full -> IGTPW_13120_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_13120_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_13120_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13120/index.html
> 
> Participating hosts (10 -> 10)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_13120_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_partial_pwrite_pread@write-uncached:
> 
>           * shard-snb: PASS -> INCOMPLETE
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:
> 
>           * shard-tglu: PASS -> INCOMPLETE

Above regressions are not related to the series.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_13120_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11078)
>           * shard-rkl: NOTRUN -> SKIP (i915#11078)
>      * igt@device_reset@unbind-cold-reset-rebind:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11078)
>      * igt@gem_basic@multigpu-create-close:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7697) +1 other test skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#7697) +1 other test skip
>      * igt@gem_caching@writes:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4873)
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@large-ctrl-surf-copy:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13008)
>      * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
> 
>           * shard-dg2: PASS -> INCOMPLETE (i915#12392)
>      * igt@gem_close_race@multigpu-basic-threads:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6335)
>           * shard-dg2: PASS -> ABORT (i915#13427)
>      * igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_create@create-ext-set-pat:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#8562)
>      * igt@gem_ctx_persistence@engines-mixed-process:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#1099)
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#280) +1 other test skip
>      * igt@gem_ctx_sseu@invalid-args:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#280)
>      * igt@gem_ctx_sseu@mmap-args:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#280) +1 other test skip
>      * igt@gem_eio@kms:
> 
>           * shard-tglu: NOTRUN -> DMESG-WARN (i915#13363)
>      * igt@gem_eio@throttle:
> 
>           * shard-mtlp: PASS -> ABORT (i915#13193 / i915#13723) +1 other test
>             abort
>      * igt@gem_exec_balancer@parallel-balancer:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525) +4 other tests skip
>      * igt@gem_exec_create@madvise@smem:
> 
>           * shard-rkl: NOTRUN -> DMESG-WARN (i915#12964) +7 other tests
>             dmesg-warn
>      * igt@gem_exec_endless@dispatch@bcs0:
> 
>           * shard-dg1: PASS -> TIMEOUT (i915#3778) +1 other test timeout
>      * igt@gem_exec_fence@submit67:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_reloc@basic-cpu-read:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +10 other tests skip
>      * igt@gem_exec_reloc@basic-cpu-wc-noreloc:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3281) +3 other tests skip
>      * igt@gem_exec_reloc@basic-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +7 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-wc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +2 other tests skip
>      * igt@gem_exec_reloc@basic-wc-read:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +1 other test skip
>      * igt@gem_exec_schedule@preempt-queue:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4537 / i915#4812)
>      * igt@gem_exec_schedule@semaphore-power:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_suspend@basic-s0@smem:
> 
>           * shard-dg2: PASS -> INCOMPLETE (i915#11441 / i915#13304) +1 other
>             test incomplete
>      * igt@gem_fence_thrash@bo-write-verify-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860) +1 other test skip
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2190)
>      * igt@gem_lmem_swapping@basic:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@heavy-random:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@massive-random:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_lmem_swapping@verify-random-ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#12193)
>      * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4565)
>      * igt@gem_madvise@dontneed-before-exec:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282)
>      * igt@gem_media_vme:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#284)
>      * igt@gem_mmap@bad-object:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_mmap_gtt@basic-small-bo-tiledx:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +4 other tests skip
>      * igt@gem_mmap_gtt@cpuset-big-copy-odd:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +13 other tests skip
>      * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4077) +4 other tests skip
>      * igt@gem_mmap_wc@write-prefaulted:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +4 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +1 other test skip
>      * igt@gem_partial_pwrite_pread@write-uncached:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3282) +1 other test skip
>      * igt@gem_pread@self:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +1 other test skip
>      * igt@gem_pxp@create-regular-context-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_pxp@display-protected-crc:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_pxp@fail-invalid-protected-context:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_pxp@hw-rejects-pxp-context:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13717)
>      * igt@gem_pxp@reject-modify-context-protection-off-1:
> 
>           * shard-rkl: PASS -> TIMEOUT (i915#12917 / i915#12964)
>      * igt@gem_pxp@reject-modify-context-protection-off-2:
> 
>           * shard-rkl: NOTRUN -> TIMEOUT (i915#12917 / i915#12964)
>      * igt@gem_readwrite@new-obj:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +2 other tests skip
>      * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#5190 / i915#8428)
>      * igt@gem_render_copy@yf-tiled-ccs-to-linear:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428)
>      * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +3 other tests
>             skip
>      * igt@gem_render_tiled_blits@basic:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4079)
>           * shard-mtlp: NOTRUN -> SKIP (i915#4079)
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_set_tiling_vs_pwrite:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +8 other tests skip
>      * igt@gem_softpin@evict-snoop-interruptible:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4885)
>      * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +6 other tests skip
>      * igt@gem_unfence_active_buffers:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4879)
>           * shard-dg2: NOTRUN -> SKIP (i915#4879)
>      * igt@gem_userptr_blits@coherency-unsync:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#3323)
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3297)
>           * shard-rkl: NOTRUN -> SKIP (i915#3297 / i915#3323)
>      * igt@gem_userptr_blits@forbidden-operations:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282 / i915#3297)
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880)
>           * shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@relocations:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281 / i915#3297)
>      * igt@gem_userptr_blits@unsync-unmap-after-close:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_userptr_blits@unsync-unmap-cycles:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_vm_create@invalid-create:
> 
>           * shard-snb: NOTRUN -> SKIP +56 other tests skip
>      * igt@gem_workarounds@suspend-resume-context:
> 
>           * shard-tglu: PASS -> ABORT (i915#12817)
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +2 other tests skip
>      * igt@gen9_exec_parse@bb-chained:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +3 other tests skip
>      * igt@gen9_exec_parse@bb-oversize:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2527 / i915#2856) +2 other
>             tests skip
>      * igt@gen9_exec_parse@bb-start-cmd:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2527) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856)
>      * igt@gen9_exec_parse@unaligned-jump:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +4 other tests
>             skip
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2856) +1 other test skip
>      * igt@i915_drm_fdinfo@busy@vecs1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14073) +7 other tests skip
>      * igt@i915_fb_tiling@basic-x-tiling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13786)
>      * igt@i915_module_load@resize-bar:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6412)
>           * shard-dg1: NOTRUN -> SKIP (i915#7178)
>           * shard-tglu: NOTRUN -> SKIP (i915#6412)
>           * shard-mtlp: NOTRUN -> SKIP (i915#6412)
>      * igt@i915_pm_freq_api@freq-reset:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8399)
>      * igt@i915_pm_rc6_residency@rc6-accuracy:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#12942) +1 other test fail
>      * igt@i915_pm_rps@basic-api:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11681 / i915#6621)
>      * igt@i915_power@sanity:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7984)
>      * igt@i915_query@query-topology-coherent-slice-mask:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6188)
>           * shard-dg2: NOTRUN -> SKIP (i915#6188)
>      * igt@i915_query@test-query-geometry-subslices:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5723)
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-tglu: NOTRUN -> INCOMPLETE (i915#4817 / i915#7443)
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#4817)
>      * igt@i915_suspend@debugfs-reader:
> 
>           * shard-glk: PASS -> INCOMPLETE (i915#4817)
>      * igt@i915_suspend@sysfs-reader:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#4817)
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7707)
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12454 / i915#12712)
>      * igt@kms_async_flips@alternate-sync-async-flip:
> 
>           * shard-dg1: PASS -> FAIL (i915#10991 / i915#12518 / i915#12766)
>      * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-4:
> 
>           * shard-dg1: PASS -> FAIL (i915#12766)
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9531)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9531)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1769 / i915#3555)
>           * shard-rkl: NOTRUN -> SKIP (i915#1769 / i915#3555) +1 other test
>             skip
>      * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: PASS -> DMESG-WARN (i915#12964) +10 other tests
>             dmesg-warn
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +6 other tests skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +3 other tests
>             skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-mtlp: PASS -> FAIL (i915#5138)
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>           * shard-dg2: NOTRUN -> SKIP +7 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3638)
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638) +3 other tests skip
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4538 / i915#5190) +3 other
>             tests skip
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +10 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538)
>           * shard-mtlp: NOTRUN -> SKIP +4 other tests skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-tglu: NOTRUN -> SKIP +50 other tests skip
>      * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>             +2 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +14 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12313) +1 other test skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +42 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +54 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#10307 / i915#6095) +29 other
>             tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12805)
>           * shard-rkl: NOTRUN -> SKIP (i915#12805)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12805)
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12796) +1 other test
>             incomplete
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
> 
>           * shard-tglu: PASS -> INCOMPLETE (i915#12796)
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6095) +16 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6095) +54 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +117 other
>             tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +149 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#6095) +54 other
>             tests skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13783) +3 other tests skip
>      * igt@kms_chamelium_audio@dp-audio-edid:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11151 / i915#7828) +4 other
>             tests skip
>      * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11151 / i915#7828) +6 other
>             tests skip
>      * igt@kms_chamelium_frames@dp-crc-fast:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11151 / i915#7828) +5 other tests
>             skip
>      * igt@kms_chamelium_frames@vga-frame-dump:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#11151 / i915#7828)
>      * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11151 / i915#7828) +4 other
>             tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11151 / i915#7828) +2 other tests
>             skip
>      * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#7828) +7 other tests
>             skip
>      * igt@kms_color@deep-color:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#9979)
>      * igt@kms_content_protection@atomic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7118 / i915#9424)
>      * igt@kms_content_protection@content-type-change:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9424)
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3116 / i915#3299)
>      * igt@kms_content_protection@legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7118 / i915#9424)
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9424)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6944 / i915#9424)
>      * igt@kms_content_protection@srm:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118)
>      * igt@kms_content_protection@srm@pipe-a-dp-3:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#7173)
>      * igt@kms_cursor_crc@cursor-offscreen-32x32:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-onscreen-32x32:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +6 other tests skip
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-random-128x42:
> 
>           * shard-tglu: PASS -> FAIL (i915#13566) +3 other tests fail
>           * shard-rkl: PASS -> DMESG-FAIL (i915#12964)
>      * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> DMESG-FAIL (i915#12964)
>      * igt@kms_cursor_crc@cursor-random-512x170:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13049)
>           * shard-rkl: NOTRUN -> SKIP (i915#13049) +3 other tests skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13049)
>           * shard-dg1: NOTRUN -> SKIP (i915#13049)
>           * shard-mtlp: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-sliding-32x32:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +3 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814)
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP +16 other tests skip
>      * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13046 / i915#5354) +1 other test
>             skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213) +1 other test
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4103 / i915#4213)
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13046 / i915#5354) +1 other
>             test skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13691)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3804)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_dp_link_training@non-uhbr-sst:
> 
>           * shard-dg2: PASS -> SKIP (i915#13749)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13749)
>      * igt@kms_dp_link_training@uhbr-sst:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13748)
>      * igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13707)
>      * igt@kms_dsc@dsc-basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840) +1 other test
>             skip
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3840) +1 other test skip
>      * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-with-bpc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3840 / i915#9053)
>      * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2575)
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3469) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3469)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3955)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#1839) +1 other test skip
>      * igt@kms_feature_discovery@psr1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#658)
>      * igt@kms_feature_discovery@psr2:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#658)
>      * igt@kms_flip@2x-blocking-absolute-wf_vblank:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#9934) +4 other tests
>             skip
>      * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9934) +3 other tests skip
>      * igt@kms_flip@2x-flip-vs-fences:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3637 / i915#9934) +6 other
>             tests skip
>           * shard-dg2: NOTRUN -> SKIP (i915#8381)
>      * igt@kms_flip@2x-flip-vs-panning-vs-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9934) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +1 other test skip
>      * igt@kms_flip@2x-flip-vs-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12745 / i915#4839)
>      * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#4839)
>      * igt@kms_flip@2x-modeset-vs-vblank-race:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637 / i915#9934)
>      * igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>           * shard-snb: PASS -> FAIL (i915#13734) +3 other tests fail
>      * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9934) +7 other tests skip
>      * igt@kms_flip@blocking-wf_vblank@b-hdmi-a1:
> 
>           * shard-tglu-1: NOTRUN -> FAIL (i915#13734) +2 other tests fail
>      * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
> 
>           * shard-dg1: PASS -> FAIL (i915#13734) +1 other test fail
>      * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@d-hdmi-a1:
> 
>           * shard-tglu: PASS -> FAIL (i915#13734) +4 other tests fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2587 / i915#2672) +3 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672) +4 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672 / i915#3555 / i915#5190)
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672 / i915#3555)
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672 / i915#3555) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672 / i915#3555) +4 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2672 / i915#3555) +3 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other test
>             skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
> 
>           * shard-snb: PASS -> SKIP +12 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +18 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#8708) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +11 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10055)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +22 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
> 
>           * shard-dg1: NOTRUN -> SKIP +8 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#5354) +15 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +37 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-glk: NOTRUN -> SKIP +377 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9766)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3458) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +55 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-rte:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +13 other tests skip
>      * igt@kms_hdr@bpc-switch:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>      * igt@kms_hdr@bpc-switch-suspend:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#12339)
>      * igt@kms_joiner@invalid-modeset-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#10656)
>           * shard-dg2: NOTRUN -> SKIP (i915#10656)
>      * igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12388)
>      * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#10656)
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
> 
>           * shard-dg2-9: NOTRUN -> SKIP +3 other tests skip
>      * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13705)
>      * igt@kms_plane_alpha_blend@constant-alpha-max:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10647 / i915#12169)
>      * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10647) +1 other test fail
>      * igt@kms_plane_multiple@2x-tiling-4:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13958)
>           * shard-rkl: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@2x-tiling-none:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13958)
>           * shard-dg1: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@2x-tiling-yf:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@tiling-4:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#14259)
>      * igt@kms_plane_multiple@tiling-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14259)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12247) +10 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12247) +9 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12247) +4 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12247) +4 other tests skip
>      * igt@kms_pm_backlight@bad-brightness:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9812)
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12343)
>      * igt@kms_pm_backlight@fade-with-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354)
>      * igt@kms_pm_backlight@fade-with-suspend:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5354)
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3828)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14104)
>      * igt@kms_pm_dc@dc9-dpms:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4281)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3828)
>      * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-dg2: PASS -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@i2c:
> 
>           * shard-dg1: NOTRUN -> DMESG-WARN (i915#4423) +1 other test
>             dmesg-warn
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-rkl: PASS -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@system-suspend-modeset:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#4423) +1 other test
>             dmesg-warn
>      * igt@kms_prime@basic-crc-hybrid:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_properties@get_properties-sanity-atomic:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#14036)
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11520) +1 other test skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11520) +10 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#11520) +11 other tests skip
>      * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>      * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11520) +5 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#11520)
>           * shard-snb: NOTRUN -> SKIP (i915#11520)
>      * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11520) +5 other tests skip
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-pr-primary-mmap-cpu:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +18 other tests skip
>      * igt@kms_psr@fbc-psr-primary-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +11 other tests
>             skip
>      * igt@kms_psr@fbc-psr-sprite-mmap-gtt:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#1072 / i915#9732) +7 other
>             tests skip
>      * igt@kms_psr@pr-sprite-mmap-cpu:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +2 other tests skip
>      * igt@kms_psr@psr-cursor-plane-onoff:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +8 other tests
>             skip
>      * igt@kms_psr@psr2-sprite-mmap-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +26 other tests
>             skip
>      * igt@kms_psr@psr2-sprite-mmap-gtt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9732) +13 other tests skip
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9685) +2 other tests skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#5190) +1 other test skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#12755 / i915#5190)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5289) +3 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#5289)
>           * shard-tglu: NOTRUN -> SKIP (i915#5289) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12755) +1 other test skip
>      * igt@kms_selftest@drm_framebuffer:
> 
>           * shard-rkl: NOTRUN -> ABORT (i915#13179) +1 other test abort
>      * igt@kms_setmode@basic:
> 
>           * shard-snb: PASS -> FAIL (i915#5465) +2 other tests fail
>      * igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +5 other tests skip
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_vrr@flip-basic-fastset:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_vrr@flip-dpms:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +1 other test skip
>      * igt@kms_vrr@max-min:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_vrr@seamless-rr-switch-virtual:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2437) +1 other test skip
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2437)
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2437)
>           * shard-dg2: NOTRUN -> SKIP (i915#2437)
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#2437) +2 other tests skip
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2437 / i915#9412)
>      * igt@perf@global-sseu-config:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#7387)
>      * igt@perf@global-sseu-config-invalid:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7387)
>           * shard-dg2: NOTRUN -> SKIP (i915#7387)
>      * igt@perf_pmu@frequency@gt0:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#12549 / i915#6806) +1 other test
>             fail
>      * igt@perf_pmu@rc6-all-gts:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#8516)
>      * igt@prime_vgem@fence-read-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3708)
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3708)
>      * igt@sriov_basic@bind-unbind-vf:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9917) +1 other test skip
>      * igt@sriov_basic@enable-vfs-bind-unbind-each:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9917)
>      * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9917)
> 
>     Possible fixes
> 
>      * igt@gem_eio@hibernate:
> 
>           * shard-tglu: ABORT (i915#10030 / i915#7975 / i915#8213) -> PASS
>      * igt@gem_eio@reset-stress:
> 
>           * shard-dg1: FAIL (i915#12543 / i915#5784) -> PASS
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * shard-dg1: TIMEOUT (i915#14044 / i915#5493) -> PASS +1 other test
>             pass
>      * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
> 
>           * shard-rkl: DMESG-WARN (i915#12964) -> PASS +13 other tests pass
>      * igt@gem_pxp@display-protected-crc:
> 
>           * shard-rkl: TIMEOUT (i915#12917 / i915#12964) -> PASS
>      * igt@gem_workarounds@suspend-resume:
> 
>           * shard-glk: INCOMPLETE (i915#13356) -> PASS
>      * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
> 
>           * shard-dg1: FAIL (i915#3591) -> PASS
>      * igt@i915_selftest@live@sanitycheck:
> 
>           * shard-snb: ABORT (i915#11703) -> PASS +1 other test pass
>      * igt@kms_atomic_transition@plane-all-modeset-transition:
> 
>           * shard-dg2: FAIL (i915#5956) -> PASS
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:
> 
>           * shard-dg1: DMESG-WARN (i915#4423) -> PASS +5 other tests pass
>      * igt@kms_cursor_crc@cursor-onscreen-128x42:
> 
>           * shard-rkl: FAIL (i915#13566) -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-rkl: FAIL (i915#2346) -> PASS
>      * igt@kms_dp_aux_dev:
> 
>           * shard-dg2: SKIP (i915#1257) -> PASS
>      * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
> 
>           * shard-snb: FAIL (i915#11832 / i915#13734) -> PASS +7 other tests
>             pass
>      * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1:
> 
>           * shard-tglu: FAIL (i915#13734) -> PASS +1 other test pass
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * shard-rkl: INCOMPLETE (i915#6113) -> PASS
>      * igt@kms_flip@plain-flip-ts-check:
> 
>           * shard-rkl: FAIL (i915#13734) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
> 
>           * shard-snb: SKIP -> PASS +2 other tests pass
>      * igt@kms_joiner@basic-force-big-joiner:
> 
>           * shard-dg2: SKIP (i915#12388) -> PASS
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-tglu: FAIL (i915#9295) -> PASS
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-dg2: SKIP (i915#9519) -> PASS +1 other test pass
>      * igt@perf_pmu@all-busy-idle-check-all:
> 
>           * shard-dg2: FAIL (i915#11943) -> PASS
>           * shard-dg1: FAIL (i915#11943) -> PASS
>           * shard-mtlp: FAIL (i915#11943) -> PASS
>      * igt@perf_pmu@busy-double-start@vecs1:
> 
>           * shard-dg2: FAIL (i915#4349) -> PASS +4 other tests pass
>      * igt@perf_pmu@module-unload:
> 
>           * shard-tglu: INCOMPLETE (i915#13520) -> PASS
>           * shard-mtlp: INCOMPLETE (i915#13520) -> PASS
> 
>     Warnings
> 
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
> 
>           * shard-dg1: SKIP (i915#4423 / i915#4538 / i915#5286) -> SKIP
>             (i915#4538 / i915#5286)
>      * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4:
> 
>           * shard-dg1: SKIP (i915#4423 / i915#6095) -> SKIP (i915#6095) +3
>             other tests skip
>      * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#6095) -> SKIP (i915#14098 / i915#6095) +2
>             other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#6095) +2
>             other tests skip
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-snb: INCOMPLETE (i915#9878) -> SKIP
>      * igt@kms_content_protection@srm:
> 
>           * shard-dg2: SKIP (i915#7118) -> FAIL (i915#7173)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-dg2: FAIL (i915#1339 / i915#7173) -> SKIP (i915#7118 /
>             i915#9424)
>           * shard-snb: INCOMPLETE (i915#8816) -> SKIP
>      * igt@kms_cursor_crc@cursor-random-max-size:
> 
>           * shard-dg1: SKIP (i915#3555 / i915#4423) -> SKIP (i915#3555)
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
> 
>           * shard-dg1: SKIP (i915#4423) -> SKIP +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
> 
>           * shard-dg2: SKIP (i915#3458) -> SKIP (i915#10433 / i915#3458) +4
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#3458) -> SKIP (i915#3458)
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-tglu: SKIP (i915#12713) -> SKIP (i915#1187 / i915#12713)
>      * igt@kms_pm_dc@dc9-dpms:
> 
>           * shard-rkl: SKIP (i915#4281) -> SKIP (i915#3361)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-rkl: SKIP (i915#9340) -> SKIP (i915#3828)
>      * igt@kms_psr@pr-sprite-plane-move:
> 
>           * shard-dg1: SKIP (i915#1072 / i915#4423 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732)
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8362 -> IGTPW_13120
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_16540: d0d3c136f60cbee6ede33f207b4e6d6b2f04779d @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_13120: 13120
>    IGT_8362: 8362
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
