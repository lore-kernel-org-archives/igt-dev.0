Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3AACA0EDC
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 05:29:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7ABF10E103;
	Thu, 14 Aug 2025 05:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="js046cmh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F221E10E103
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 05:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755149370; x=1786685370;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=U5OpxvwNQ+P4roFZbqJtrS/1dwmyV00VZBMRlltlCHg=;
 b=js046cmhFYLtSnogBZy5cX6spca4veR8GJp66NLa16mRAZvVi4T1ZEWK
 agNIEK+YhwGDHbvyXr6imNYnZaPpHzRn7Fr+WXXpnyxxmVUfHiDg4DC+j
 XeQJ3gZq5WPvLzk7Dh7a6NQ4WCbZHUbWrFTP5ca8WcftgIoQoK7bkCMsl
 Z5NatfWBL2pUImj/zeCKkQGPSRBi6ECO9DbVDTmkfWQVMTV/CqHbgqEBh
 u2BZuJcpVPVzfBuo9UTqNxVirBCHpcxrFeUy9E55VWcFF30xqcVkp2ze+
 Ey9Roa7jrF5iozhGBNcbAi0Okm9FcgbmVM0vLfO92jK3LxyrfA7J2t+bK w==;
X-CSE-ConnectionGUID: Nu910rRlRgOAglMf5joOpQ==
X-CSE-MsgGUID: s9LrQamTTXiAw4P5pVclvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="74908965"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="74908965"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 22:29:29 -0700
X-CSE-ConnectionGUID: 9T0VAPBAQ1eTo0MPFTvFmQ==
X-CSE-MsgGUID: DkBk2kM8SqOZDOlt944XZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="190375536"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.95])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 22:29:26 -0700
Date: Thu, 14 Aug 2025 07:29:23 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Shaders migration to separate headers
Message-ID: <whnn27jg3wwvuo5eocv5ahumi2t4w4wr22dhny3nm2vp4zn3ud@62qrgeohqobc>
References: <20250813082502.371493-6-zbigniew.kempczynski@intel.com>
 <175510671368.234050.7780026293663773847@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175510671368.234050.7780026293663773847@1538d3639d33>
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

On Wed, Aug 13, 2025 at 05:38:33PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Shaders migration to separate headers                           
>    URL:     https://patchwork.freedesktop.org/series/152864/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13577/index.html 
> 
>         CI Bug Log - changes from CI_DRM_16995_full -> IGTPW_13577_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_13577_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_13577_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13577/index.html
> 
> Participating hosts (13 -> 12)
> 
>    Missing (1): shard-dg2-set2
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_13577_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_atomic_transition@plane-toggle-modeset-transition:
> 
>           * shard-tglu: PASS -> ABORT
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-snb: PASS -> FAIL
>      * igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-2-pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> ABORT
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
> 
>           * shard-snb: PASS -> TIMEOUT
>      * igt@runner@aborted:
> 
>           * shard-snb: NOTRUN -> FAIL

Series is unrelated to above failures, it touches compute shaders only.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_13577_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@blit-reloc-purge-cache:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8411)
>      * igt@fbdev@nullptr:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#2582) +1 other test
>             skip
>      * igt@gem_bad_reloc@negative-reloc-bltcopy:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3281) +6 other tests skip
>      * igt@gem_ccs@block-multicopy-inplace:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@large-ctrl-surf-copy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13008)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13008)
>           * shard-dg1: NOTRUN -> SKIP (i915#13008)
>           * shard-mtlp: NOTRUN -> SKIP (i915#13008)
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-dg2: PASS -> INCOMPLETE (i915#13356)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9323)
>           * shard-mtlp: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:
> 
>           * shard-dg2: PASS -> INCOMPLETE (i915#12392)
>      * igt@gem_close_race@multigpu-basic-threads:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_create@create-ext-set-pat:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8562)
>      * igt@gem_ctx_persistence@heartbeat-stop:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#1099) +2 other tests skip
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#280)
>      * igt@gem_ctx_sseu@invalid-args:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#280)
>      * igt@gem_ctx_sseu@mmap-args:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#280)
>           * shard-tglu: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@suspend:
> 
>           * shard-dg2: NOTRUN -> ABORT (i915#10030 / i915#8213)
>      * igt@gem_exec_balancer@bonded-dual:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4771)
>           * shard-dg2: NOTRUN -> SKIP (i915#4771) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4771)
>      * igt@gem_exec_balancer@bonded-false-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812) +3 other tests skip
>      * igt@gem_exec_balancer@bonded-semaphore:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4812) +3 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4812) +2 other tests skip
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_balancer@invalid-bonds:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4036)
>           * shard-mtlp: NOTRUN -> SKIP (i915#4036)
>      * igt@gem_exec_balancer@parallel:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP (i915#4525) +1 other test skip
>      * igt@gem_exec_capture@capture-invisible:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6334) +1 other test skip
>      * igt@gem_exec_capture@capture-invisible@smem0:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#6334) +1 other test skip
>      * igt@gem_exec_capture@capture@vecs0-lmem0:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#11965) +4 other tests fail
>      * igt@gem_exec_flush@basic-uc-set-default:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3539)
>      * igt@gem_exec_flush@basic-wb-pro-default:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +1 other test
>             skip
>      * igt@gem_exec_flush@basic-wb-rw-default:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852)
>      * igt@gem_exec_reloc@basic-gtt-read:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +16 other tests skip
>      * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +8 other tests skip
>      * igt@gem_exec_reloc@basic-wc-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +12 other tests skip
>      * igt@gem_exec_reloc@basic-wc-read-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +10 other tests skip
>      * igt@gem_exec_reloc@basic-write-cpu-active:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3281)
>      * igt@gem_exec_schedule@preempt-queue-contexts-chain:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4537 / i915#4812) +1 other test
>             skip
>      * igt@gem_fence_thrash@bo-write-verify-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860) +1 other test skip
>      * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4860) +1 other test skip
>      * igt@gem_fenced_exec_thrash@too-many-fences:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_lmem_evict@dontneed-evict-race:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613 / i915#7582)
>           * shard-tglu: NOTRUN -> SKIP (i915#4613 / i915#7582)
>      * igt@gem_lmem_swapping@basic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613) +5 other tests skip
>      * igt@gem_lmem_swapping@heavy-multi:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#4613)
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +4 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#12193)
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4565)
>      * igt@gem_lmem_swapping@heavy-verify-random-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@parallel-random-verify:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_lmem_swapping@random-engines:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +5 other tests skip
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * shard-dg1: PASS -> ABORT (i915#14804) +1 other test abort
>      * igt@gem_media_fill@media-fill:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8289)
>           * shard-dg2-9: NOTRUN -> SKIP (i915#8289)
>      * igt@gem_mmap@short-mmap:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      * igt@gem_mmap_gtt@big-bo-tiledx:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4077) +4 other tests skip
>      * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +9 other tests skip
>      * igt@gem_mmap_gtt@cpuset-big-copy-xy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +15 other tests skip
>      * igt@gem_mmap_wc@bad-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +8 other tests skip
>      * igt@gem_mmap_wc@close:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      * igt@gem_mmap_wc@read-write-distinct:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_partial_pwrite_pread@write-display:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +3 other tests skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-display:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +6 other tests skip
>      * igt@gem_pread@exhaustion:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3282)
>      * igt@gem_pwrite_snooped:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +2 other tests skip
>      * igt@gem_pxp@create-regular-buffer:
> 
>           * shard-rkl: NOTRUN -> TIMEOUT (i915#12917 / i915#12964)
>      * igt@gem_pxp@display-protected-crc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +3 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_pxp@hw-rejects-pxp-buffer:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#13398)
>      * igt@gem_pxp@protected-raw-src-copy-not-readible:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_pxp@verify-pxp-stale-buf-execution:
> 
>           * shard-rkl: PASS -> TIMEOUT (i915#12917 / i915#12964) +1 other
>             test timeout
>      * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#4270)
>      * igt@gem_render_copy@y-tiled-ccs-to-linear:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +7 other tests
>             skip
>      * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +5 other tests skip
>           * shard-dg2-9: NOTRUN -> SKIP (i915#5190 / i915#8428) +1 other test
>             skip
>      * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_set_tiling_vs_gtt:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4079) +1 other test skip
>      * igt@gem_tiled_partial_pwrite_pread@writes:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +18 other tests skip
>      * igt@gem_tiled_pread_pwrite:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4079) +2 other tests skip
>      * igt@gem_userptr_blits@access-control:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@coherency-sync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297) +3 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3297 / i915#3323)
>      * igt@gem_userptr_blits@dmabuf-unsync:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3297)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3297) +3 other tests skip
>      * igt@gem_userptr_blits@map-fixed-invalidate:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@unsync-overlap:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_vm_create@invalid-create:
> 
>           * shard-snb: NOTRUN -> SKIP +197 other tests skip
>      * igt@gem_workarounds@suspend-resume:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#13356)
>      * igt@gen7_exec_parse@bitmasks:
> 
>           * shard-dg2: NOTRUN -> SKIP +17 other tests skip
>      * igt@gen9_exec_parse@bb-chained:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +6 other tests skip
>      * igt@gen9_exec_parse@bb-large:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 other
>             test skip
>      * igt@gen9_exec_parse@bb-oversize:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2527) +6 other tests skip
>      * igt@gen9_exec_parse@cmd-crossing-page:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +7 other tests
>             skip
>      * igt@gen9_exec_parse@shadow-peek:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +11 other tests skip
>      * igt@gen9_exec_parse@unaligned-access:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2856)
>      * igt@gen9_exec_parse@unaligned-jump:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856) +6 other tests skip
>      * igt@i915_drm_fdinfo@all-busy-check-all:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#14123)
>      * igt@i915_drm_fdinfo@busy@vecs1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14073) +23 other tests skip
>      * igt@i915_drm_fdinfo@most-busy-check-all@bcs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#14073) +20 other tests skip
>      * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#14073) +17 other tests skip
>      * igt@i915_drm_fdinfo@virtual-busy-all:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#14118) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#14118)
>      * igt@i915_drm_fdinfo@virtual-busy-idle-all:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14118) +1 other test skip
>      * igt@i915_fb_tiling@basic-x-tiling:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#13786)
>      * igt@i915_module_load@load:
> 
>           * shard-snb: (PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS) -> (PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, DMESG-WARN, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS)
>             (i915#14804)
>      * igt@i915_module_load@reload:
> 
>           * shard-dg2: NOTRUN -> ABORT (i915#14804)
>      * igt@i915_pm_freq_api@freq-reset-multiple:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8399)
>           * shard-tglu: NOTRUN -> SKIP (i915#8399)
>      * igt@i915_pm_rpm@debugfs-read:
> 
>           * shard-rkl: PASS -> SKIP (i915#13328)
>      * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> 
>           * shard-dg2-9: NOTRUN -> SKIP +2 other tests skip
>      * igt@i915_pm_rps@min-max-config-idle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11681 / i915#6621) +1 other test
>             skip
>      * igt@i915_pm_rps@thresholds:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11681)
>      * igt@i915_pm_rps@thresholds-idle:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#11681)
>           * shard-dg1: NOTRUN -> SKIP (i915#11681)
>      * igt@i915_pm_rps@thresholds-idle-park:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11681) +1 other test skip
>      * igt@i915_query@query-topology-coherent-slice-mask:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6188)
>           * shard-dg2: NOTRUN -> SKIP (i915#6188)
>      * igt@i915_query@test-query-geometry-subslices:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5723)
>      * igt@i915_suspend@fence-restore-tiled2untiled:
> 
>           * shard-glk11: NOTRUN -> INCOMPLETE (i915#4817)
>      * igt@i915_suspend@forcewake:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#4817) +1 other test
>             incomplete
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#5190) +1 other test skip
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12454 / i915#12712)
>      * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1:
> 
>           * shard-glk: PASS -> FAIL (i915#10991)
>      * igt@kms_async_flips@invalid-async-flip-atomic:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#12967)
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9531)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>           * shard-glk: NOTRUN -> ABORT (i915#14804 / i915#14814)
>           * shard-mtlp: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#1769)
>           * shard-dg2: NOTRUN -> SKIP (i915#1769 / i915#3555)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_atomic_transition@plane-toggle-modeset-transition:
> 
>           * shard-glk: NOTRUN -> ABORT (i915#14814)
>      * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-1:
> 
>           * shard-tglu: PASS -> ABORT (i915#14804)
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +3 other tests skip
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +3 other tests
>             skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +7 other tests skip
>      * igt@kms_big_fb@linear-64bpp-rotate-90:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3638) +2 other tests skip
>      * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
> 
>           * shard-mtlp: NOTRUN -> SKIP +20 other tests skip
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638) +3 other tests skip
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +13 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538)
>      * igt@kms_big_fb@yf-tiled-addfb:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6187) +1 other test skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>           * shard-rkl: NOTRUN -> SKIP +12 other tests skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4538 / i915#5190) +2 other
>             tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12313) +3 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +64 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12313)
>           * shard-rkl: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +139 other tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +151 other
>             tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12805) +1 other test skip
>           * shard-dg2: NOTRUN -> SKIP (i915#12805)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6095) +24 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +54 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#6095) +4 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6095) +27 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> INCOMPLETE (i915#12796) +1 other test
>             incomplete
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +43 other tests skip
>      * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#10307 / i915#6095) +29 other
>             tests skip
>      * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>             +1 other test skip
>      * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#6095) +45 other
>             tests skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#13784)
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13784)
>      * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13783) +4 other tests skip
>      * igt@kms_chamelium_edid@hdmi-mode-timings:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11151 / i915#7828) +12 other
>             tests skip
>      * igt@kms_chamelium_frames@dp-crc-fast:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11151 / i915#7828) +12 other
>             tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#14544 / i915#7828)
>             +1 other test skip
>      * igt@kms_chamelium_frames@hdmi-crc-single:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#7828) +5 other tests
>             skip
>      * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11151 / i915#7828) +7 other tests
>             skip
>      * igt@kms_chamelium_hpd@dp-hpd-storm:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11151 / i915#7828) +3 other
>             tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11151 / i915#7828) +2 other
>             tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#11151 / i915#7828) +10 other
>             tests skip
>      * igt@kms_color@ctm-green-to-red:
> 
>           * shard-rkl: PASS -> SKIP (i915#12655 / i915#14544) +1 other test
>             skip
>      * igt@kms_concurrent@multi-plane-atomic-lowres:
> 
>           * shard-snb: PASS -> ABORT (i915#14804) +1 other test abort
>      * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-edp-1:
> 
>           * shard-mtlp: PASS -> ABORT (i915#14804) +1 other test abort
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#7118 / i915#9424)
>      * igt@kms_content_protection@content-type-change:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#9424) +1 other test
>             skip
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3116)
>           * shard-dg1: NOTRUN -> SKIP (i915#3299)
>           * shard-tglu: NOTRUN -> SKIP (i915#3116 / i915#3299)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3299)
>           * shard-dg2: NOTRUN -> SKIP (i915#3299)
>      * igt@kms_content_protection@legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7118 / i915#9424)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118 /
>             i915#9424)
>      * igt@kms_content_protection@lic-type-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9424)
>           * shard-rkl: NOTRUN -> SKIP (i915#9424)
>           * shard-dg1: NOTRUN -> SKIP (i915#9424)
>      * igt@kms_content_protection@srm:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#7173) +1 other test fail
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6944 / i915#9424) +1 other test
>             skip
>      * igt@kms_cursor_crc@cursor-offscreen-max-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814) +1 other test
>             skip
>      * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#13566) +3 other tests fail
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-random-128x42:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814)
>      * igt@kms_cursor_crc@cursor-random-512x170:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13049) +4 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#13049) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-sliding-128x42:
> 
>           * shard-tglu: PASS -> FAIL (i915#13566) +5 other tests fail
>      * igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#13566) +3 other tests fail
>      * igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#13049) +2 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#13049) +1 other test skip
>      * igt@kms_cursor_crc@cursor-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12358 / i915#14152 /
>             i915#7882)
>      * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12358 / i915#14152)
>      * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13046 / i915#5354) +8 other tests
>             skip
>      * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9809) +6 other tests skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4213) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#4103)
>           * shard-dg1: NOTRUN -> SKIP (i915#4103 / i915#4213)
>           * shard-tglu: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>           * shard-glk10: NOTRUN -> SKIP (i915#11190)
>      * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
> 
>           * shard-glk11: NOTRUN -> SKIP (i915#11190)
>      * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11190 / i915#14544)
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13046 / i915#5354) +1 other
>             test skip
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-rkl: PASS -> FAIL (i915#2346)
>           * shard-glk: NOTRUN -> FAIL (i915#2346)
>      * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#2346)
>      * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9067)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_cursor_legacy@torture-bo@pipe-a:
> 
>           * shard-dg1: NOTRUN -> ABORT (i915#14804) +1 other test abort
>      * igt@kms_cursor_legacy@torture-move@pipe-a:
> 
>           * shard-glk: NOTRUN -> ABORT (i915#14804) +12 other tests abort
>      * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9833)
>           * shard-mtlp: NOTRUN -> SKIP (i915#9833)
>      * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9723)
>           * shard-dg1: NOTRUN -> SKIP (i915#9723) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP (i915#9723) +1 other test skip
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13691)
>      * igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-2-pipe-c-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> DMESG-WARN (i915#14804)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#1769 / i915#3555 / i915#3804)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3804)
>           * shard-tglu: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
> 
>           * shard-dg2: PASS -> SKIP (i915#3555)
>      * igt@kms_dp_aux_dev:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1257)
>           * shard-rkl: NOTRUN -> SKIP (i915#1257 / i915#14544)
>           * shard-dg1: NOTRUN -> SKIP (i915#1257)
>           * shard-tglu: NOTRUN -> SKIP (i915#1257)
>      * igt@kms_dp_link_training@non-uhbr-sst:
> 
>           * shard-dg2: PASS -> SKIP (i915#13749)
>      * igt@kms_dp_linktrain_fallback@dsc-fallback:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13707)
>      * igt@kms_draw_crc@draw-method-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544) +28 other tests skip
>           * shard-dg2: NOTRUN -> SKIP (i915#8812)
>      * igt@kms_dsc@dsc-basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840) +1 other test
>             skip
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3840 / i915#9688)
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#3840 / i915#9053)
>      * igt@kms_fbcon_fbt@fbc:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#14561)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3955)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4854)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2065 / i915#4854)
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@psr2:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#658)
>           * shard-dg2: NOTRUN -> SKIP (i915#658)
>      * igt@kms_fence_pin_leak:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4881)
>           * shard-mtlp: NOTRUN -> SKIP (i915#4881)
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4881)
>      * igt@kms_flip@2x-dpms-vs-vblank-race:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3637 / i915#9934)
>      * igt@kms_flip@2x-flip-vs-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9934) +5 other tests skip
>      * igt@kms_flip@2x-flip-vs-fences:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8381)
>           * shard-mtlp: NOTRUN -> SKIP (i915#8381)
>           * shard-dg2: NOTRUN -> SKIP (i915#8381)
>      * igt@kms_flip@2x-flip-vs-suspend:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637 / i915#9934) +6 other tests
>             skip
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>           * shard-snb: PASS -> TIMEOUT (i915#14350)
>      * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
> 
>           * shard-snb: NOTRUN -> TIMEOUT (i915#14033) +1 other test timeout
>      * igt@kms_flip@2x-flip-vs-wf_vblank:
> 
>           * shard-glk: PASS -> SKIP
>      * igt@kms_flip@2x-modeset-vs-vblank-race:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9934) +8 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +4 other tests skip
>      * igt@kms_flip@2x-nonexisting-fb:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#9934) +8 other tests
>             skip
>      * igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#9934)
>      * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9934) +4 other tests skip
>      * igt@kms_flip@flip-vs-blocking-wf-vblank:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#3637) +5 other tests
>             skip
>      * igt@kms_flip@flip-vs-fences@a-hdmi-a1:
> 
>           * shard-rkl: NOTRUN -> DMESG-WARN (i915#12964) +16 other tests
>             dmesg-warn
>      * igt@kms_flip@flip-vs-wf_vblank-interruptible:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3637)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8810 / i915#8813) +2
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8810 / i915#8813)
>      * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#3555) +4 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672) +5 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672 / i915#3555) +2 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2672 / i915#3555) +4 other tests
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672 / i915#3555 / i915#8813) +2
>             other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672 / i915#8813)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other
>             test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#2672 / i915#3555) +4 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2587 / i915#2672) +1 other
>             test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672) +5 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672 / i915#3555) +3 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672) +8 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2672 / i915#3555 / i915#5190)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2672) +2 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672 / i915#3555 / i915#5190) +2
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-dg2: PASS -> FAIL (i915#6880)
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#1849 / i915#5354) +7
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +28 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +15 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-rte:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +39 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3458) +11 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
> 
>           * shard-dg1: NOTRUN -> SKIP +27 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#8708) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +30 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
> 
>           * shard-tglu: NOTRUN -> SKIP +90 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#1849 / i915#5354) +8
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10055)
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9766)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
> 
>           * shard-glk11: NOTRUN -> SKIP +187 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +21 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +21 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +13 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#5354) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +30 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +13 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +29 other tests skip
>      * igt@kms_hdr@bpc-switch:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@bpc-switch-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228)
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#12713 / i915#3555 / i915#8228)
>      * igt@kms_invalid_mode@bad-htotal:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#3555 / i915#8826) +1
>             other test skip
>      * igt@kms_invalid_mode@zero-vdisplay:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3555 / i915#8826)
>      * igt@kms_joiner@basic-big-joiner:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#10656)
>      * igt@kms_joiner@basic-force-big-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12388)
>      * igt@kms_joiner@basic-force-ultra-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12394)
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12339)
>      * igt@kms_joiner@invalid-modeset-big-joiner:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#10656)
>      * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13522)
>      * igt@kms_pipe_crc_basic@read-crc:
> 
>           * shard-rkl: PASS -> SKIP (i915#11190 / i915#14544) +2 other tests
>             skip
>      * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13705)
>           * shard-mtlp: NOTRUN -> SKIP (i915#13705)
>      * igt@kms_plane_alpha_blend@constant-alpha-max:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10647 / i915#12169)
>      * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10647) +1 other test fail
>      * igt@kms_plane_alpha_blend@constant-alpha-mid:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#7294) +1 other test
>             skip
>      * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-128:
> 
>           * shard-rkl: NOTRUN -> DMESG-WARN (i915#12917 / i915#12964) +2
>             other tests dmesg-warn
>      * igt@kms_plane_lowres@tiling-y:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8821)
>           * shard-dg2: NOTRUN -> SKIP (i915#8821)
>      * igt@kms_plane_lowres@tiling-yf:
> 
>           * shard-glk10: NOTRUN -> SKIP +187 other tests skip
>      * igt@kms_plane_multiple@2x-tiling-none:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13958) +1 other test skip
>      * igt@kms_plane_multiple@2x-tiling-yf:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#13958)
>           * shard-tglu: NOTRUN -> SKIP (i915#13958)
>           * shard-mtlp: NOTRUN -> SKIP (i915#13958) +1 other test skip
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13958)
>           * shard-rkl: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#14259)
>      * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13046 / i915#5354 / i915#9423)
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6953)
>           * shard-rkl: NOTRUN -> SKIP (i915#6953)
>           * shard-dg1: NOTRUN -> SKIP (i915#6953)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12247) +13 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#12247) +4 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12247) +9 other tests skip
>      * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3555 / i915#8152)
>      * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12247 / i915#14544) +1 other test
>             skip
>      * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12247 / i915#14544 / i915#8152)
>             +1 other test skip
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
> 
>           * shard-glk: NOTRUN -> SKIP +350 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12247) +4 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12247) +4 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#6953 / i915#8152)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a:
> 
>           * shard-rkl: PASS -> SKIP (i915#12247 / i915#14544) +2 other tests
>             skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12247 / i915#14544 / i915#3555 /
>             i915#6953 / i915#8152)
>           * shard-mtlp: NOTRUN -> SKIP (i915#12247 / i915#3555 / i915#6953)
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#3555 / i915#6953 /
>             i915#8152)
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b:
> 
>           * shard-rkl: PASS -> SKIP (i915#12247 / i915#14544 / i915#8152) +3
>             other tests skip
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#12343)
>      * igt@kms_pm_backlight@fade:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5354)
>      * igt@kms_pm_backlight@fade-with-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9812)
>      * igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9685) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#9685)
>           * shard-dg1: NOTRUN -> SKIP (i915#9685)
>           * shard-mtlp: NOTRUN -> SKIP (i915#9292)
>      * igt@kms_pm_dc@dc5-dpms-negative:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#13441)
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9685) +1 other test skip
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3828)
>      * igt@kms_pm_lpsp@screens-disabled:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8430)
>           * shard-dg2: NOTRUN -> SKIP (i915#8430)
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-dg2: PASS -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-rkl: PASS -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@i2c:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#4423) +2 other tests
>             dmesg-warn
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#9519)
>           * shard-dg1: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9519) +1 other test skip
>      * igt@kms_prime@basic-crc-vgem:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6524 / i915#6805) +1 other test
>             skip
>           * shard-rkl: PASS -> DMESG-WARN (i915#12917 / i915#12964) +1 other
>             test dmesg-warn
>      * igt@kms_prime@d3hot:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11520 / i915#14544)
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9808) +1 other test skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12316) +6 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
> 
>           * shard-glk10: NOTRUN -> SKIP (i915#11520) +5 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#11520) +10 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11520) +6 other tests skip
>      * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11520) +2 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
> 
>           * shard-glk11: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11520) +11 other tests skip
>      * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#11520) +2 other tests skip
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9683) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#9683)
>           * shard-dg1: NOTRUN -> SKIP (i915#9683)
>           * shard-tglu: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4348) +1 other test skip
>      * igt@kms_psr@fbc-psr-dpms:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +25 other tests skip
>      * igt@kms_psr@fbc-psr2-no-drrs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +28 other tests skip
>      * igt@kms_psr@fbc-psr2-primary-blt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9732) +7 other tests skip
>      * igt@kms_psr@fbc-psr2-suspend:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#1072 / i915#9732) +9 other
>             tests skip
>      * igt@kms_psr@psr-cursor-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +37 other tests
>             skip
>      * igt@kms_psr@psr-sprite-mmap-gtt@edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077 / i915#9688) +5 other tests
>             skip
>      * igt@kms_psr@psr2-cursor-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +17 other tests
>             skip
>      * igt@kms_psr@psr2-cursor-plane-move:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#14544 / i915#9732) +3
>             other tests skip
>      * igt@kms_psr@psr2-sprite-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +15 other tests
>             skip
>      * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5289)
>           * shard-dg1: NOTRUN -> SKIP (i915#5289)
>           * shard-tglu: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-rotation-270:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#12755) +1 other test skip
>      * igt@kms_rotation_crc@primary-rotation-90:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544) +30 other tests skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +3 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12755 / i915#5190) +1 other test
>             skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12755) +1 other test skip
>      * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12755) +2 other tests skip
>      * igt@kms_scaling_modes@scaling-mode-full:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_scaling_modes@scaling-mode-none:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#5030 / i915#9041)
>      * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5030) +2 other tests skip
>      * igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#5030 / i915#9041)
>      * igt@kms_selftest@drm_framebuffer:
> 
>           * shard-tglu-1: NOTRUN -> ABORT (i915#13179) +1 other test abort
>      * igt@kms_setmode@basic-clone-single-crtc:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +5 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3555)
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8809 / i915#8823)
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_vblank@ts-continuation-suspend:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#12276)
>      * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> INCOMPLETE (i915#12276)
>      * igt@kms_vrr@flip-basic-fastset:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8808 / i915#9906)
>           * shard-dg1: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_vrr@lobf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11920)
>           * shard-rkl: NOTRUN -> SKIP (i915#11920)
>           * shard-dg1: NOTRUN -> SKIP (i915#11920)
>           * shard-tglu: NOTRUN -> SKIP (i915#11920)
>           * shard-mtlp: NOTRUN -> SKIP (i915#11920)
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#9906)
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#9906)
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2437)
>           * shard-rkl: NOTRUN -> SKIP (i915#2437)
>           * shard-dg1: NOTRUN -> SKIP (i915#2437)
>           * shard-tglu: NOTRUN -> SKIP (i915#2437)
>           * shard-mtlp: NOTRUN -> SKIP (i915#2437)
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2437)
>      * igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2437 / i915#9412)
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#2437)
>      * igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2436)
>      * igt@perf@global-sseu-config:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7387)
>           * shard-dg2: NOTRUN -> SKIP (i915#7387)
>      * igt@perf@global-sseu-config-invalid:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#7387)
>      * igt@perf@mi-rpc:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2434)
>      * igt@perf_pmu@busy-idle-check-all@ccs0:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#4349) +4 other tests fail
>      * igt@perf_pmu@module-unload:
> 
>           * shard-tglu-1: NOTRUN -> FAIL (i915#14433)
>           * shard-glk: NOTRUN -> FAIL (i915#14433)
>      * igt@perf_pmu@rc6-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13356 / i915#14242)
>      * igt@perf_pmu@rc6@other-idle-gt0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8516)
>      * igt@prime_vgem@basic-read:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3291 / i915#3708)
>           * shard-rkl: NOTRUN -> SKIP (i915#3291 / i915#3708)
>      * igt@prime_vgem@fence-flip-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708)
>      * igt@prime_vgem@fence-read-hang:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3708)
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3708)
>      * igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9917)
>      * igt@sriov_basic@enable-vfs-bind-unbind-each:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9917)
>           * shard-rkl: NOTRUN -> SKIP (i915#9917)
>      * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4:
> 
>           * shard-mtlp: NOTRUN -> FAIL (i915#12910) +8 other tests fail
>      * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#12910) +18 other tests fail
>      * igt@testdisplay:
> 
>           * shard-rkl: PASS -> DMESG-WARN (i915#12964) +20 other tests
>             dmesg-warn
> 
>     Possible fixes
> 
>      * igt@fbdev@pan:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2582) -> PASS
>      * igt@gem_eio@in-flight-suspend:
> 
>           * shard-dg1: DMESG-WARN (i915#4391 / i915#4423) -> PASS
>      * igt@gem_exec_endless@dispatch@rcs0:
> 
>           * shard-dg1: TIMEOUT (i915#3778) -> PASS +1 other test pass
>      * igt@gem_exec_suspend@basic-s0@smem:
> 
>           * shard-dg2: INCOMPLETE (i915#11441 / i915#13304) -> PASS +1 other
>             test pass
>      * igt@gem_lmem_swapping@parallel-random-engines:
> 
>           * shard-dg1: ABORT (i915#14804) -> PASS +1 other test pass
>      * igt@gem_mmap_offset@clear-via-pagefault:
> 
>           * shard-mtlp: ABORT (i915#14809) -> PASS +1 other test pass
>      * igt@gem_pxp@create-protected-buffer:
> 
>           * shard-rkl: TIMEOUT (i915#12964) -> PASS
>      * igt@gem_pxp@protected-raw-src-copy-not-readible:
> 
>           * shard-rkl: TIMEOUT (i915#12917 / i915#12964) -> PASS +1 other
>             test pass
>      * igt@i915_selftest@live@workarounds:
> 
>           * shard-mtlp: DMESG-FAIL (i915#12061) -> PASS +1 other test pass
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-rkl: INCOMPLETE (i915#4817) -> PASS
>      * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
> 
>           * shard-glk: ABORT (i915#14819) -> PASS
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
> 
>           * shard-mtlp: FAIL (i915#5138) -> PASS +1 other test pass
>      * igt@kms_busy@basic:
> 
>           * shard-rkl: SKIP (i915#11190 / i915#14544) -> PASS
>      * igt@kms_color@deep-color:
> 
>           * shard-dg2: SKIP (i915#12655 / i915#3555) -> PASS
>      * igt@kms_color@degamma:
> 
>           * shard-rkl: SKIP (i915#12655 / i915#14544) -> PASS
>      * igt@kms_cursor_crc@cursor-offscreen-256x85:
> 
>           * shard-rkl: DMESG-WARN (i915#12964) -> PASS +28 other tests pass
>      * igt@kms_cursor_crc@cursor-random-256x85:
> 
>           * shard-tglu: FAIL (i915#13566) -> PASS +1 other test pass
>      * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-4:
> 
>           * shard-dg1: DMESG-WARN (i915#4423) -> PASS +2 other tests pass
>      * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
> 
>           * shard-rkl: FAIL (i915#2346) -> PASS
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-dg2: ABORT (i915#8213) -> PASS
>           * shard-rkl: SKIP (i915#14544 / i915#14561) -> PASS
>      * igt@kms_flip@basic-flip-vs-dpms:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3637) -> PASS +4 other tests
>             pass
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555) -> PASS +2 other tests
>             pass
>      * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
> 
>           * shard-dg2: FAIL (i915#6880) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
> 
>           * shard-glk: SKIP -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1849 / i915#5354) -> PASS +8
>             other tests pass
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-dg2: SKIP (i915#3555 / i915#8228) -> PASS
>      * igt@kms_invalid_mode@overflow-vrefresh:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8826) -> PASS
>      * igt@kms_plane_alpha_blend@constant-alpha-min:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#7294) -> PASS +1 other test
>             pass
>      * igt@kms_plane_scaling@invalid-num-scalers:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555 / i915#6953 / i915#8152)
>             -> PASS
>      * igt@kms_plane_scaling@invalid-parameters:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8152) -> PASS
>      * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
> 
>           * shard-mtlp: ABORT -> PASS +1 other test pass
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5:
> 
>           * shard-rkl: SKIP (i915#12247 / i915#14544 / i915#6953 / i915#8152)
>             -> PASS
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
> 
>           * shard-rkl: SKIP (i915#12247 / i915#14544 / i915#8152) -> PASS +3
>             other tests pass
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
> 
>           * shard-rkl: SKIP (i915#12247 / i915#14544) -> PASS +2 other tests
>             pass
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6953 / i915#8152) -> PASS
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9519) -> PASS
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-rkl: SKIP (i915#9519) -> PASS +1 other test pass
>      * igt@kms_properties@plane-properties-atomic:
> 
>           * shard-rkl: SKIP (i915#11521 / i915#14544) -> PASS
>      * igt@kms_rotation_crc@exhaust-fences:
> 
>           * shard-rkl: SKIP (i915#14544) -> PASS +38 other tests pass
>      * igt@perf_pmu@semaphore-busy@vcs1:
> 
>           * shard-dg1: FAIL (i915#4349) -> PASS +7 other tests pass
>      * igt@perf_pmu@semaphore-busy@vecs0:
> 
>           * shard-mtlp: FAIL (i915#4349) -> PASS +5 other tests pass
> 
>     Warnings
> 
>      * igt@device_reset@unbind-cold-reset-rebind:
> 
>           * shard-rkl: SKIP (i915#11078) -> SKIP (i915#11078 / i915#14544)
>      * igt@gem_ccs@block-multicopy-inplace:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555 / i915#9323) -> SKIP
>             (i915#3555 / i915#9323) +1 other test skip
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-rkl: SKIP (i915#9323) -> SKIP (i915#14544 / i915#9323)
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-rkl: SKIP (i915#6335) -> SKIP (i915#14544 / i915#6335)
>      * igt@gem_create@create-ext-set-pat:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8562) -> SKIP (i915#8562)
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#280) -> SKIP (i915#280)
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-rkl: SKIP (i915#4525) -> SKIP (i915#14544 / i915#4525) +2
>             other tests skip
>      * igt@gem_exec_reloc@basic-gtt:
> 
>           * shard-rkl: SKIP (i915#3281) -> SKIP (i915#14544 / i915#3281) +3
>             other tests skip
>      * igt@gem_exec_reloc@basic-scanout:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3281) -> SKIP (i915#3281) +8
>             other tests skip
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4613) -> SKIP (i915#4613) +2
>             other tests skip
>      * igt@gem_lmem_swapping@smem-oom:
> 
>           * shard-rkl: SKIP (i915#4613) -> SKIP (i915#14544 / i915#4613)
>      * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3282) -> SKIP (i915#3282) +1
>             other test skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>           * shard-rkl: SKIP (i915#3282) -> SKIP (i915#14544 / i915#3282) +5
>             other tests skip
>      * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>           * shard-rkl: SKIP (i915#4270) -> TIMEOUT (i915#12964)
>      * igt@gem_pxp@reject-modify-context-protection-off-3:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4270) -> TIMEOUT (i915#12917 /
>             i915#12964)
>      * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8411) -> SKIP (i915#8411)
>      * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
> 
>           * shard-rkl: SKIP (i915#8411) -> SKIP (i915#14544 / i915#8411)
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-rkl: SKIP (i915#3297 / i915#3323) -> SKIP (i915#14544 /
>             i915#3297 / i915#3323)
>      * igt@gem_userptr_blits@forbidden-operations:
> 
>           * shard-rkl: SKIP (i915#3282 / i915#3297) -> SKIP (i915#14544 /
>             i915#3282 / i915#3297)
>      * igt@gem_userptr_blits@unsync-overlap:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3297) -> SKIP (i915#3297)
>      * igt@gen9_exec_parse@batch-without-end:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2527) -> SKIP (i915#2527) +1
>             other test skip
>      * igt@gen9_exec_parse@bb-start-far:
> 
>           * shard-rkl: SKIP (i915#2527) -> SKIP (i915#14544 / i915#2527) +2
>             other tests skip
>      * igt@i915_pm_rc6_residency@media-rc6-accuracy:
> 
>           * shard-rkl: SKIP -> SKIP (i915#14544) +14 other tests skip
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4387) -> SKIP (i915#4387)
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#7707) -> SKIP (i915#7707)
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-rkl: SKIP (i915#12454 / i915#12712) -> SKIP (i915#12454 /
>             i915#12712 / i915#14544)
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-rkl: SKIP (i915#9531) -> SKIP (i915#14544)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-dg1: SKIP (i915#1769 / i915#3555 / i915#4423) -> SKIP
>             (i915#1769 / i915#3555)
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
> 
>           * shard-rkl: SKIP (i915#5286) -> SKIP (i915#14544) +2 other tests
>             skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
> 
>           * shard-dg1: SKIP (i915#4538 / i915#5286) -> SKIP (i915#4423 /
>             i915#4538 / i915#5286) +1 other test skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#5286) +4 other tests
>             skip
>      * igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>           * shard-rkl: SKIP (i915#3638) -> SKIP (i915#14544) +1 other test
>             skip
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
> 
>           * shard-dg1: SKIP (i915#3638 / i915#4423) -> SKIP (i915#3638)
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#3638) +2 other tests
>             skip
>      * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#6095) +1
>             other test skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#14544) +6
>             other tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#12313) +1 other test
>             skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#12805)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#14098 / i915#6095) +7
>             other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#6095) -> SKIP (i915#14098 / i915#6095) +4
>             other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>           * shard-rkl: SKIP (i915#12313) -> SKIP (i915#14544)
>      * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
> 
>           * shard-mtlp: ABORT (i915#14804) -> SKIP (i915#12313)
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-rkl: SKIP (i915#3742) -> SKIP (i915#14544 / i915#3742)
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3742) -> SKIP (i915#3742)
>      * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#7828) -> SKIP (i915#11151 /
>             i915#14544 / i915#7828) +4 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#14544 / i915#7828) -> SKIP
>             (i915#11151 / i915#7828) +4 other tests skip
>      * igt@kms_content_protection@content-type-change:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#9424)
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#3116)
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-dg1: SKIP (i915#9433) -> SKIP (i915#9424)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-dg2: FAIL (i915#1339 / i915#7173) -> SKIP (i915#7118 /
>             i915#9424)
>      * igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>           * shard-rkl: SKIP (i915#13049) -> SKIP (i915#14544) +1 other test
>             skip
>      * igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-onscreen-32x10:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#3555) +3 other tests
>             skip
>      * igt@kms_cursor_crc@cursor-onscreen-32x32:
> 
>           * shard-rkl: SKIP (i915#3555) -> SKIP (i915#14544) +3 other tests
>             skip
>      * igt@kms_cursor_crc@cursor-random-256x85:
> 
>           * shard-rkl: FAIL (i915#13566) -> SKIP (i915#14544)
>      * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
> 
>           * shard-glk: SKIP -> ABORT (i915#14804)
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP +15 other tests skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#4103)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#3555 / i915#3804)
>      * igt@kms_dp_link_training@non-uhbr-mst:
> 
>           * shard-rkl: SKIP (i915#13749) -> SKIP (i915#14544)
>      * igt@kms_dp_link_training@non-uhbr-sst:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#13749)
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-rkl: SKIP (i915#3840 / i915#9053) -> SKIP (i915#14544)
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-rkl: SKIP (i915#9337) -> SKIP (i915#14544 / i915#9337)
>      * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
> 
>           * shard-rkl: SKIP (i915#9934) -> SKIP (i915#14544 / i915#9934) +2
>             other tests skip
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9934) -> SKIP (i915#9934) +3
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
> 
>           * shard-rkl: SKIP (i915#2672 / i915#3555) -> SKIP (i915#14544 /
>             i915#3555)
>      * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
> 
>           * shard-rkl: DMESG-WARN (i915#12964) -> SKIP (i915#14544 /
>             i915#3555)
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555) -> SKIP (i915#2672 /
>             i915#3555) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1849 / i915#5354) ->
>             DMESG-WARN (i915#12964)
>      * igt@kms_frontbuffer_tracking@fbc-2p-rte:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1849 / i915#5354) -> SKIP
>             (i915#1825) +22 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#1825) -> SKIP (i915#14544 / i915#1849 /
>             i915#5354) +23 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>           * shard-rkl: SKIP (i915#5439) -> SKIP (i915#14544 / i915#1849 /
>             i915#5354)
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1849 / i915#5354) -> SKIP
>             (i915#3023) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-dg2: SKIP (i915#3458) -> SKIP (i915#10433 / i915#3458) +3
>             other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-dg1: SKIP (i915#8708) -> SKIP (i915#4423 / i915#8708)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#3023) -> SKIP (i915#14544 / i915#1849 /
>             i915#5354) +16 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-dg1: SKIP (i915#4423) -> SKIP
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:
> 
>           * shard-dg1: SKIP -> SKIP (i915#4423)
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#3458) -> SKIP (i915#3458)
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-rkl: SKIP (i915#12713) -> SKIP (i915#14544)
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#3555 / i915#8228) +2
>             other tests skip
>      * igt@kms_joiner@basic-force-big-joiner:
> 
>           * shard-rkl: SKIP (i915#12388 / i915#14544) -> SKIP (i915#12388)
>      * igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>           * shard-rkl: SKIP (i915#12339 / i915#14544) -> SKIP (i915#12339)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4070 / i915#4816) -> SKIP
>             (i915#4070 / i915#4816)
>      * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
> 
>           * shard-rkl: SKIP (i915#11190 / i915#14544) -> DMESG-WARN
>             (i915#12964)
>      * igt@kms_plane_alpha_blend@alpha-basic:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#7294) -> DMESG-WARN
>             (i915#12964)
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#14259) +1 other test
>             skip
>      * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>           * shard-rkl: SKIP -> SKIP (i915#14544 / i915#8152)
>      * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a:
> 
>           * shard-rkl: SKIP (i915#12247 / i915#14544) -> SKIP (i915#12247)
>      * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:
> 
>           * shard-rkl: SKIP (i915#12247 / i915#14544 / i915#8152) -> SKIP
>             (i915#12247) +1 other test skip
>      * igt@kms_pm_backlight@fade-with-dpms:
> 
>           * shard-rkl: SKIP (i915#5354) -> SKIP (i915#14544 / i915#5354) +1
>             other test skip
>      * igt@kms_pm_backlight@fade-with-suspend:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#5354) -> SKIP (i915#5354)
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-rkl: SKIP (i915#3828) -> SKIP (i915#14544 / i915#3828)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-rkl: SKIP (i915#9340) -> SKIP (i915#14544 / i915#9340)
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-rkl: SKIP (i915#12916) -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-mtlp: ABORT (i915#10553 / i915#14804) -> SKIP (i915#9519)
>      * igt@kms_prime@d3hot:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6524) -> SKIP (i915#6524)
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
> 
>           * shard-rkl: SKIP (i915#11520 / i915#14544) -> SKIP (i915#11520) +3
>             other tests skip
>      * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
> 
>           * shard-rkl: SKIP (i915#11520) -> SKIP (i915#11520 / i915#14544) +3
>             other tests skip
>      * igt@kms_psr@fbc-psr-cursor-mmap-cpu:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 /
>             i915#14544 / i915#9732) +10 other tests skip
>      * igt@kms_psr@psr2-suspend:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#14544 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732) +13 other tests skip
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-rkl: SKIP (i915#9685) -> SKIP (i915#14544 / i915#9685)
>      * igt@kms_setmode@invalid-clone-single-crtc:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555) -> SKIP (i915#3555) +1
>             other test skip
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#3555 / i915#9906)
>      * igt@kms_vrr@seamless-rr-switch-vrr:
> 
>           * shard-rkl: SKIP (i915#9906) -> SKIP (i915#14544) +2 other tests
>             skip
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-rkl: SKIP (i915#2437 / i915#9412) -> SKIP (i915#14544 /
>             i915#2437 / i915#9412)
>      * igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2436) -> SKIP (i915#2436)
>      * igt@perf@mi-rpc:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2434) -> SKIP (i915#2434)
>      * igt@perf_pmu@rc6-all-gts:
> 
>           * shard-rkl: SKIP (i915#8516) -> SKIP (i915#14544 / i915#8516)
>      * igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9917) -> SKIP (i915#9917)
>      * igt@sriov_basic@enable-vfs-autoprobe-on:
> 
>           * shard-rkl: SKIP (i915#9917) -> SKIP (i915#14544 / i915#9917)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8493 -> IGTPW_13577
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_16995: ec8aa890d544a1acecf63c1a23e659bb7fc7abe6 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_13577: e577044e535443101fb15f0a70478ea16d209262 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8493: 8493
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
