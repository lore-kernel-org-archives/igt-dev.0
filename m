Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0FBC4345F
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 07:27:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B49C10E1F1;
	Mon,  6 May 2024 07:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MuTM74Hc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0596110E1F1
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 07:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714980461; x=1746516461;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=TwpaweR+MpKVCbgpkfWJd1E74yr5WruiRK8eurNuI4s=;
 b=MuTM74HcqzN0gzwVmf6TM8Ozq6SsJnqjRaOnCZC+cRb85LkU28t0wohF
 7INi6lTqHPQMHJ2fqqnKdheeAnjDiCYQG/KzJkk+Dzq23dVO4aMwfLbhG
 KUxRMb4DepF6JDXOT3BKJ0U8bBvk335qCXl3KAqHk4sOucj91aqrJdgHF
 HICHYe4e9d0DTzMh2ztc68epqBqXv85JN0P/cernJLlmpasIm+npuoqvw
 mM8BmnSzX3I81OPCdT0RFvo/nW+0aUCY96DFqad0Y/YSn/gz/2Wv+0ff5
 qp1r9mkVvIy/fokFBDVsNWlfXvVQM6sD/wo3tNMtxXrU55kw3e13RLdCU A==;
X-CSE-ConnectionGUID: MvH0UCCSRy2xRRtc+EDFcQ==
X-CSE-MsgGUID: o1jS/Jm8Rs610gVs/OiHog==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10594239"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="10594239"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 00:27:26 -0700
X-CSE-ConnectionGUID: TfUfKzn6Rg2ypp8LoiatIA==
X-CSE-MsgGUID: 9nGBIyKBSZCjLl7MXuuIZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="32752282"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.246.219])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 00:27:26 -0700
Date: Mon, 6 May 2024 09:27:22 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for Add
 render-copy compression on Xe+
Message-ID: <20240506072722.l53csdextckozoq4@zkempczy-mobl2>
References: <20240425104721.52376-1-zbigniew.kempczynski@intel.com>
 <171412596991.1668691.12900825142900715798@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171412596991.1668691.12900825142900715798@8e613ede5ea5>
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

On Fri, Apr 26, 2024 at 10:06:09AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add render-copy compression on Xe+                              
>    URL:     https://patchwork.freedesktop.org/series/132902/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11069/index.html 
> 
>           CI Bug Log - changes from IGT_7824_full -> IGTPW_11069_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_11069_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_11069_full, please notify your bug team
>    ('I915-ci-infra@lists.freedesktop.org') to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11069/index.html
> 
> Participating hosts (9 -> 9)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_11069_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-edp-1:
>           * shard-mtlp: PASS -> FAIL +19 other tests fail

Unrelated to the change.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_11069_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@crc32:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6230)
>      * igt@api_intel_bb@object-reloc-purge-cache:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8411)
>           * shard-dg1: NOTRUN -> SKIP (i915#8411)
>      * igt@api_intel_bb@render-ccs:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#10380)
>      * igt@drm_fdinfo@idle@rcs0:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#7742) +1 other test fail
>      * igt@drm_fdinfo@most-busy-check-all@bcs0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8414) +21 other tests skip
>      * igt@drm_fdinfo@most-busy-check-all@rcs0:
> 
>           * shard-rkl: PASS -> FAIL (i915#7742)
>      * igt@drm_fdinfo@virtual-busy-hang:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8414)
>      * igt@gem_basic@multigpu-create-close:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_busy@semaphore:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3936)
>           * shard-dg1: NOTRUN -> SKIP (i915#3936)
>      * igt@gem_ccs@ctrl-surf-copy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_create@create-ext-set-pat:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8562)
>      * igt@gem_ctx_exec@basic-nohangcheck:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#6268)
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#280) +1 other test skip
>      * igt@gem_ctx_sseu@invalid-args:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@kms:
> 
>           * shard-tglu: PASS -> INCOMPLETE (i915#10513)
>           * shard-dg2: NOTRUN -> INCOMPLETE (i915#10513 / i915#1982)
>      * igt@gem_exec_balancer@bonded-dual:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4771)
>      * igt@gem_exec_balancer@invalid-bonds:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4036)
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525) +2 other tests skip
>      * igt@gem_exec_capture@capture@vecs0-lmem0:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#10386) +1 other test fail
>      * igt@gem_exec_capture@many-4k-incremental:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#9606) +1 other test fail
>           * shard-dg2: NOTRUN -> FAIL (i915#9606)
>           * shard-rkl: NOTRUN -> FAIL (i915#9606) +1 other test fail
>      * igt@gem_exec_endless@dispatch@bcs0:
> 
>           * shard-dg1: PASS -> TIMEOUT (i915#3778)
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2846)
>      * igt@gem_exec_fair@basic-none-rrul:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +5 other tests
>             skip
>      * igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2842) +1 other test fail
>      * igt@gem_exec_fair@basic-throttle:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539)
>      * igt@gem_exec_flush@basic-uc-prw-default:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539)
>      * igt@gem_exec_flush@basic-uc-rw-default:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852) +3 other tests
>             skip
>      * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +6 other tests skip
>      * igt@gem_exec_reloc@basic-wc-read-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +15 other tests skip
>      * igt@gem_exec_reloc@basic-write-read-active:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +17 other tests skip
>      * igt@gem_exec_schedule@preempt-queue:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4537 / i915#4812)
>      * igt@gem_exec_schedule@reorder-wide:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_fence_thrash@bo-write-verify-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860) +2 other tests skip
>      * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4860) +2 other tests skip
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2190)
>      * igt@gem_lmem_swapping@heavy-verify-multi:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4565) +1 other test skip
>      * igt@gem_lmem_swapping@heavy-verify-random@lmem0:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#10378)
>      * igt@gem_lmem_swapping@verify:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +4 other tests skip
>      * igt@gem_lmem_swapping@verify-ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_media_fill@media-fill:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8289)
>      * igt@gem_media_vme:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#284)
>      * igt@gem_mmap@pf-nonblock:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +4 other tests skip
>      * igt@gem_mmap_wc@pf-nonblock:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      * igt@gem_partial_pwrite_pread@write:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +2 other tests skip
>      * igt@gem_pread@self:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +4 other tests skip
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-glk: NOTRUN -> WARN (i915#2658)
>      * igt@gem_pwrite@basic-self:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +13 other tests skip
>      * igt@gem_pxp@fail-invalid-protected-context:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_pxp@reject-modify-context-protection-off-2:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>      * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +5 other tests skip
>      * igt@gem_pxp@verify-pxp-stale-buf-execution:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>      * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
> 
>           * shard-snb: NOTRUN -> SKIP +49 other tests skip
>      * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +8 other tests
>             skip
>      * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428)
>      * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8411)
>      * igt@gem_set_tiling_vs_gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_tiled_partial_pwrite_pread@writes:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +10 other tests skip
>      * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +7 other tests skip
>      * igt@gem_tiled_pread_basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079) +2 other tests skip
>      * igt@gem_unfence_active_buffers:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4879)
>      * igt@gem_userptr_blits@dmabuf-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297) +3 other tests skip
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880) +1 other test
>             skip
>      * igt@gem_userptr_blits@readonly-unsync:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@sd-probe:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4958)
>      * igt@gem_userptr_blits@unsync-unmap:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>      * igt@gen7_exec_parse@bitmasks:
> 
>           * shard-dg2: NOTRUN -> SKIP +32 other tests skip
>      * igt@gen9_exec_parse@bb-oversize:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +4 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856)
>      * igt@gen9_exec_parse@shadow-peek:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +3 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#2527)
>      * igt@i915_fb_tiling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4881)
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#9820 / i915#9849)
>           * shard-dg1: PASS -> ABORT (i915#9820)
>           * shard-tglu: PASS -> INCOMPLETE (i915#10047 / i915#9820)
>      * igt@i915_module_load@resize-bar:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6412)
>           * shard-dg1: NOTRUN -> SKIP (i915#7178)
>      * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7091)
>      * igt@i915_pm_freq_mult@media-freq@gt0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6590)
>      * igt@i915_pm_rps@min-max-config-loaded:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6621)
>      * igt@i915_pm_rps@reset:
> 
>           * shard-dg2: PASS -> FAIL (i915#10186)
>           * shard-dg1: PASS -> FAIL (i915#8346)
>      * igt@i915_pm_rps@thresholds-idle@gt0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8925) +1 other test skip
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4387)
>      * igt@i915_selftest@mock@memory_region:
> 
>           * shard-rkl: NOTRUN -> DMESG-WARN (i915#9311)
>      * igt@intel_hwmon@hwmon-read:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7707)
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7707)
>      * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4212) +1 other test skip
>      * igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4215 / i915#5190)
>      * igt@kms_addfb_basic@clobberred-modifier:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_async_flips@invalid-async-flip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6228)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#1769) +1 other test skip
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1769 / i915#3555) +1 other test
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#1769 / i915#3555) +1 other test
>             skip
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +6 other tests
>             skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +6 other tests skip
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3638) +6 other tests skip
>      * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638) +3 other tests skip
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-tglu: PASS -> FAIL (i915#3743)
>      * igt@kms_big_fb@y-tiled-addfb:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190) +1 other test skip
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +16 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538) +3 other tests skip
>      * igt@kms_big_joiner@basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10656)
>           * shard-dg1: NOTRUN -> SKIP (i915#10656)
>      * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +65 other tests skip
>      * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>             +4 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +79 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-glk: NOTRUN -> SKIP +451 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +11 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +178 other
>             tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#10278)
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#10278)
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#10278)
>           * shard-dg2: NOTRUN -> SKIP (i915#10278) +1 other test skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7213) +4 other tests skip
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_chamelium_audio@hdmi-audio-edid:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7828) +9 other tests skip
>      * igt@kms_chamelium_edid@dp-edid-resolution-list:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7828) +1 other test skip
>      * igt@kms_chamelium_frames@hdmi-crc-multiple:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7828) +13 other tests skip
>      * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#7828)
>      * igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7828) +8 other tests skip
>      * igt@kms_content_protection@atomic:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118 /
>             i915#9424)
>      * igt@kms_content_protection@content-type-change:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9424)
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3299)
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9424) +1 other test skip
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9424) +1 other test skip
>      * igt@kms_content_protection@uevent:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7116 / i915#9424)
>      * igt@kms_content_protection@uevent@pipe-a-dp-4:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#1339 / i915#7173)
>      * igt@kms_cursor_crc@cursor-onscreen-max-size:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814)
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +3 other tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3359)
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3359)
>      * igt@kms_cursor_crc@cursor-sliding-32x10:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +8 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3359)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213)
>      * igt@kms_cursor_legacy@torture-move@pipe-a:
> 
>           * shard-dg2: PASS -> DMESG-WARN (i915#10166)
>      * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9227)
>      * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9723)
>      * igt@kms_display_modes@mst-extended-mode-negative:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8588)
>      * igt@kms_dp_aux_dev:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1257)
>      * igt@kms_dsc@dsc-basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3840 / i915#9053)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4854)
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9337)
>      * igt@kms_flip@2x-flip-vs-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP +43 other tests skip
>      * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#79)
>      * igt@kms_flip@2x-flip-vs-fences:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8381)
>      * igt@kms_flip@2x-flip-vs-modeset:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#3966)
>      * igt@kms_flip@2x-flip-vs-panning-interruptible:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637) +1 other test skip
>      * igt@kms_flip@2x-flip-vs-suspend:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637)
>      * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +5 other tests skip
>      * igt@kms_flip@blocking-wf_vblank@b-vga1:
> 
>           * shard-snb: PASS -> FAIL (i915#2122) +2 other tests fail
>      * igt@kms_flip@flip-vs-fences-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8381)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +9 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672) +4 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672) +2 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_force_connector_basic@prune-stale-modes:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5274)
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> 
>           * shard-snb: PASS -> SKIP +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +40 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-tglu: NOTRUN -> SKIP +18 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +24 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +31 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
> 
>           * shard-dg1: NOTRUN -> SKIP +37 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +39 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +17 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10055)
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9766)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +21 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +15 other tests skip
>      * igt@kms_hdr@bpc-switch-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228) +3 other tests
>             skip
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228) +2 other tests
>             skip
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4816)
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6301) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#6301)
>           * shard-dg1: NOTRUN -> SKIP (i915#6301) +1 other test skip
>      * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10647) +1 other test fail
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6953)
>      * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#8292)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-dp-4:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9423) +7 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9423) +15 other tests skip
>      * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9423) +3 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5235) +11 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235 / i915#9423) +7 other tests
>             skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5235 / i915#9423 / i915#9728) +3
>             other tests skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5235) +7 other tests skip
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-tglu: PASS -> FAIL (i915#9295)
>      * igt@kms_pm_dc@dc9-dpms:
> 
>           * shard-tglu: PASS -> SKIP (i915#4281)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9340)
>      * igt@kms_pm_lpsp@screens-disabled:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8430)
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9519) +1 other test skip
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-dg2: PASS -> SKIP (i915#9519) +1 other test skip
>      * igt@kms_prime@basic-crc-hybrid:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_prime@d3hot:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6524)
>           * shard-dg2: NOTRUN -> SKIP (i915#6524 / i915#6805)
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9683)
>           * shard-rkl: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-pr-primary-mmap-cpu:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +4 other tests skip
>      * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +18 other tests
>             skip
>      * igt@kms_psr@pr-sprite-mmap-cpu:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +1 other test skip
>      * igt@kms_psr@pr-sprite-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +22 other tests
>             skip
>      * igt@kms_psr@psr-cursor-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +29 other tests
>             skip
>      * igt@kms_psr@psr2-primary-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9673 / i915#9732) +3
>             other tests skip
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_rotation_crc@exhaust-fences:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4884)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5289) +1 other test skip
>      * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4235) +2 other tests skip
>      * igt@kms_sysfs_edid_timing:
> 
>           * shard-dg2: PASS -> FAIL (IGT#2)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
> 
>           * shard-tglu: PASS -> FAIL (i915#9196)
>      * igt@kms_vrr@flip-basic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555)
>      * igt@kms_vrr@flip-basic-fastset:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_writeback@writeback-check-output-xrgb2101010:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2437 / i915#9412)
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2437)
>      * igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#2437)
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2437)
>      * igt@perf@global-sseu-config:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7387)
>      * igt@perf@per-context-mode-unprivileged:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2435)
>      * igt@perf@unprivileged-single-ctx-counters:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2433)
>      * igt@perf_pmu@module-unload:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#10537 / i915#5793)
>      * igt@prime_vgem@basic-fence-read:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3708)
>      * igt@prime_vgem@fence-flip-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708)
>      * igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9917)
>           * shard-rkl: NOTRUN -> SKIP (i915#9917) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#9917)
>      * igt@tools_test@sysfs_l3_parity:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4818)
>      * igt@v3d/v3d_get_param@get-bad-param:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2575) +7 other tests skip
>      * igt@v3d/v3d_submit_csd@single-out-sync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2575) +15 other tests skip
>      * igt@v3d/v3d_wait_bo@used-bo-0ns:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2575) +3 other tests skip
>      * igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#7711) +7 other tests skip
>      * igt@vc4/vc4_wait_bo@bad-bo:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7711) +12 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#7711) +6 other tests skip
> 
>     Possible fixes
> 
>      * igt@drm_fdinfo@virtual-idle:
> 
>           * shard-rkl: FAIL (i915#7742) -> PASS
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-dg2: INCOMPLETE (i915#9364) -> PASS
>      * igt@gem_eio@reset-stress:
> 
>           * shard-dg2: FAIL (i915#5784) -> PASS
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-tglu: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_fair@basic-pace@vecs0:
> 
>           * shard-glk: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_schedule@fairslice@vcs1:
> 
>           * shard-dg2: INCOMPLETE -> PASS
>      * igt@gem_lmem_swapping@basic@lmem0:
> 
>           * shard-dg2: FAIL (i915#10378) -> PASS
>      * igt@gem_lmem_swapping@parallel-random-verify@lmem0:
> 
>           * shard-dg2: INCOMPLETE (i915#10317) -> PASS
>           * shard-dg1: INCOMPLETE (i915#10317) -> PASS
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-dg2: ABORT (i915#9820) -> PASS
>      * igt@i915_suspend@basic-s2idle-without-i915:
> 
>           * shard-snb: INCOMPLETE (i915#4817) -> PASS
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
> 
>           * shard-mtlp: FAIL (i915#5138) -> PASS
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-tglu: FAIL (i915#3743) -> PASS
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
> 
>           * shard-snb: SKIP -> PASS +3 other tests pass
>      * igt@kms_cursor_legacy@torture-bo@pipe-a:
> 
>           * shard-glk: DMESG-WARN (i915#10166) -> PASS
>      * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:
> 
>           * shard-snb: FAIL (i915#2122) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
> 
>           * shard-dg1: INCOMPLETE -> PASS
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-dg2: SKIP (i915#9519) -> PASS
>           * shard-rkl: SKIP (i915#9519) -> PASS +2 other tests pass
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
> 
>           * shard-mtlp: FAIL (i915#9196) -> PASS
>      * igt@perf@blocking-parameterized:
> 
>           * shard-mtlp: INCOMPLETE -> PASS
> 
>     Warnings
> 
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-mtlp: ABORT (i915#10131 / i915#9820) -> ABORT (i915#10131 /
>             i915#10887 / i915#9820)
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-mtlp: SKIP (i915#6645) -> ABORT (i915#10770)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
> 
>           * shard-dg2: SKIP (i915#3458) -> SKIP (i915#10433 / i915#3458)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#3458) -> SKIP (i915#3458) +1
>             other test skip
>      * igt@kms_psr@fbc-psr-suspend:
> 
>           * shard-dg2: SKIP (i915#1072 / i915#9673 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732)
>      * igt@kms_psr@psr-primary-mmap-cpu:
> 
>           * shard-dg2: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 /
>             i915#9673 / i915#9732) +10 other tests skip
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7824 -> IGTPW_11069
> 
>    CI-20190529: 20190529
>    CI_DRM_14649: 67988afd596f307b6b7e849e6a246bca9a20e93d @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_11069: 11069
>    IGT_7824: 7824
