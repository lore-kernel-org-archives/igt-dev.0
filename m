Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EFCC531C9
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jul 2026 06:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AFD10E64E;
	Fri, 24 Jul 2026 06:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPDoflDW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C954610E197
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2026 06:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784872827; x=1816408827;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=y5upFCYQoIzZpeeZUVL4ktEy4VQ8m4qvMRG5fItNEJA=;
 b=TPDoflDWqEapcamYy7pNUTNbX55jZsNbHBUrWDFGIOBokhYbj3Kgb0Aq
 QZC/K9Iu0qbLsnM16OUxUTc0D8VL5jMYotRc2fLxjMYVnMCdqTFjQucaw
 hcbMtAEolJqD3jmdvW6DcaSVGPLApkmmZMHdRJxzApTHcmIRQIe9Vk0Nb
 EzhWo48cDW90VGGPPcewEqms+Imv/CoamJddJqxjrwr7i2au5+Cy+WK1z
 EUOUk2+pMugo4mXHOdmRuPQ4+fJvZWN8DppksB6pMyq76sw+Nk1jad7TM
 TZWdwM6dsfo3XZnUExbleBQTkbhhxVJH/XjkYfo1rpJQcVWJQW+3UCdsm g==;
X-CSE-ConnectionGUID: FkdVCkgPQ4muv8jcHzPCXg==
X-CSE-MsgGUID: NWAYTsITRi+5Nv474PiogQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102944324"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="102944324"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 23:00:27 -0700
X-CSE-ConnectionGUID: XAuoCfJ9T+WxumrAWppWRQ==
X-CSE-MsgGUID: aNer0kDnSUW9WQANMn3MzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="262155852"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.206])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 23:00:25 -0700
Date: Fri, 24 Jul 2026 08:00:22 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 lib/rendercopy_gen9: Bump up URB size
Message-ID: <4t4agrt65l7pqzkjeq2sgiyvlaiybbmuytptaaij3suhdiencf@bwzdb2mcnqn6>
References: <20260722062458.1250817-2-zbigniew.kempczynski@intel.com>
 <178481530255.221139.3552569084272244229@6beec6c84f66>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178481530255.221139.3552569084272244229@6beec6c84f66>
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

On Thu, Jul 23, 2026 at 02:01:42PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/rendercopy_gen9: Bump up URB size                           
>    URL:     https://patchwork.freedesktop.org/series/170885/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15580/index.html 
> 
>         CI Bug Log - changes from CI_DRM_18876_full -> IGTPW_15580_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_15580_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_15580_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15580/index.html
> 
> Participating hosts (11 -> 10)
> 
>    Missing (1): pig-kbl-iris
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_15580_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_create@create-clear@smem0:
>           * shard-tglu-1: NOTRUN -> INCOMPLETE +1 other test incomplete

Unrelated to the change.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_15580_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@object-reloc-purge-cache:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8411)
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11078)
>           * shard-dg1: NOTRUN -> SKIP (i915#11078)
>           * shard-mtlp: NOTRUN -> SKIP (i915#11078)
>           * shard-dg2: NOTRUN -> SKIP (i915#11078)
>      * igt@device_reset@unbind-cold-reset-rebind:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11078) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP (i915#11078)
>      * igt@gem_bad_reloc@negative-reloc-lut:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +6 other tests skip
>      * igt@gem_ccs@block-multicopy-compressed:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9323)
>           * shard-mtlp: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_ccs@ctrl-surf-copy:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9323) +1 other test skip
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9323) +1 other test skip
>      * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
> 
>           * shard-dg2: PASS -> INCOMPLETE (i915#13356 / i915#16348)
>      * igt@gem_close_race@multigpu-basic-process:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-dg2: PASS -> FAIL (i915#15454)
>      * igt@gem_ctx_freq@sysfs@gt0:
> 
>           * shard-dg2: PASS -> FAIL (i915#9561) +1 other test fail
>      * igt@gem_ctx_persistence@legacy-engines-queued:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#1099) +1 other test skip
>      * igt@gem_ctx_sseu@mmap-args:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@in-flight-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13390)
>      * igt@gem_eio@reset-stress@blt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15314)
>      * igt@gem_eio@reset-stress@bsd:
> 
>           * shard-snb: NOTRUN -> FAIL (i915#8898) +1 other test fail
>      * igt@gem_eio@unwedge-stress@render:
> 
>           * shard-mtlp: PASS -> ABORT (i915#15511) +1 other test abort
>      * igt@gem_exec_balancer@bonded-false-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_balancer@parallel:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525) +2 other tests skip
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_big@single:
> 
>           * shard-tglu-1: NOTRUN -> FAIL (i915#15944)
>      * igt@gem_exec_endless@dispatch@bcs0:
> 
>           * shard-dg1: NOTRUN -> TIMEOUT (i915#3778) +1 other test timeout
>      * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +2 other tests
>             skip
>      * igt@gem_exec_flush@basic-wb-ro-before-default:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852)
>      * igt@gem_exec_reloc@basic-cpu-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +5 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +4 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +2 other tests skip
>      * igt@gem_exec_schedule@preempt-queue-contexts-chain:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4537 / i915#4812) +1 other test
>             skip
>      * igt@gem_exec_schedule@semaphore-power:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7276)
>           * shard-dg1: NOTRUN -> SKIP (i915#4812) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4537 / i915#4812)
>      * igt@gem_lmem_evict@dontneed-evict-race:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4613 / i915#7582)
>      * igt@gem_lmem_swapping@basic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@heavy-verify-random-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#4613)
>      * igt@gem_lmem_swapping@parallel-multi:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@random:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_media_vme:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#284)
>      * igt@gem_mmap_gtt@cpuset-medium-copy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +2 other tests skip
>      * igt@gem_mmap_wc@coherency:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083)
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_mmap_wc@copy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +9 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +5 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +4 other tests skip
>      * igt@gem_pwrite@basic-random:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +4 other tests skip
>      * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>      * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +1 other test skip
>      * igt@gem_render_copy@y-tiled-to-vebox-linear:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +2 other tests
>             skip
>      * igt@gem_tiled_pread_basic@basic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15656)
>      * igt@gem_tiled_pread_pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_tiled_swapping@non-threaded:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +8 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +4 other tests skip
>      * igt@gem_userptr_blits@coherency-sync:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>      * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880)
>           * shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4880)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@sd-probe:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4958)
>           * shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4958)
>      * igt@gem_userptr_blits@unsync-overlap:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3297) +3 other tests skip
>      * igt@gem_workarounds@suspend-resume-context:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13356)
>      * igt@gem_workarounds@suspend-resume-fd:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#13356)
>           * shard-glk11: NOTRUN -> INCOMPLETE (i915#13356 / i915#14586)
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-glk10: NOTRUN -> ABORT (i915#5566)
>      * igt@gen9_exec_parse@basic-rejected-ctx-param:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +3 other tests
>             skip
>      * igt@gen9_exec_parse@bb-oversize:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#2527)
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856)
>           * shard-dg2: NOTRUN -> SKIP (i915#2856)
>      * igt@gen9_exec_parse@bb-start-param:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2527 / i915#2856)
>      * igt@i915_module_load@fault-injection@__uc_init:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15479) +4 other tests skip
>      * igt@i915_module_load@fault-injection@intel_connector_register:
> 
>           * shard-rkl: NOTRUN -> ABORT (i915#15342) +1 other test abort
>           * shard-glk: NOTRUN -> ABORT (i915#15342) +1 other test abort
>      * igt@i915_module_load@reload-no-display:
> 
>           * shard-tglu: PASS -> DMESG-WARN (i915#13029 / i915#14545)
>      * igt@i915_pm_freq_api@freq-reset-multiple:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#8399) +1 other test skip
>      * igt@i915_pm_freq_api@freq-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8399)
>      * igt@i915_pm_rps@min-max-config-idle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11681 / i915#6621)
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6245)
>      * igt@i915_suspend@debugfs-reader:
> 
>           * shard-glk: PASS -> INCOMPLETE (i915#16182 / i915#4817)
>           * shard-rkl: PASS -> ABORT (i915#15131 / i915#15140)
>      * igt@i915_suspend@sysfs-reader:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#16182 / i915#4817)
>           * shard-rkl: NOTRUN -> INCOMPLETE (i915#4817)
>      * igt@intel_hwmon@hwmon-read:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#7707)
>      * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4212)
>           * shard-dg2: NOTRUN -> SKIP (i915#4212)
>           * shard-dg1: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#1769)
>           * shard-rkl: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +7 other tests skip
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5286) +3 other tests skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +2 other tests
>             skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +6 other tests skip
>      * igt@kms_big_fb@linear-64bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638) +1 other test skip
>      * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3828) +2 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3828)
>      * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3828) +1 other test skip
>      * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>           * shard-mtlp: NOTRUN -> SKIP +5 other tests skip
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +5 other tests
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3638) +1 other test skip
>      * igt@kms_big_fb@yf-tiled-addfb:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190)
>           * shard-mtlp: NOTRUN -> SKIP (i915#6187)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538)
>      * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>             +3 other tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#6095) +2 other tests
>             skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#14544 / i915#6095)
>             +1 other test skip
>      * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +104 other
>             tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +24 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +66 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12313) +1 other test skip
>      * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +205 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12805)
>           * shard-tglu: NOTRUN -> SKIP (i915#12805)
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#15582) +1 other test
>             incomplete
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#6095) +46 other
>             tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12313) +1 other test skip
>      * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6095) +24 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +69 other tests skip
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-glk: NOTRUN -> SKIP +436 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_chamelium_audio@hdmi-audio-edid:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11151 / i915#7828) +3 other
>             tests skip
>      * igt@kms_chamelium_color_pipeline@plane-lut1d:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#16471)
>      * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#16471)
>      * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#16471) +2 other tests skip
>      * igt@kms_chamelium_frames@dp-crc-single:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11151 / i915#7828) +7 other
>             tests skip
>      * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11151 / i915#7828) +5 other tests
>             skip
>      * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#7828) +8 other tests
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#11151 / i915#7828) +5 other tests
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#11151 / i915#7828) +3 other
>             tests skip
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15330 / i915#3116 / i915#3299)
>           * shard-mtlp: NOTRUN -> SKIP (i915#15330 / i915#3299)
>           * shard-dg2: NOTRUN -> SKIP (i915#15330 / i915#3299)
>           * shard-dg1: NOTRUN -> SKIP (i915#15330 / i915#3299)
>      * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15330) +1 other test skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15330) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#15330)
>           * shard-mtlp: NOTRUN -> SKIP (i915#15330)
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15330 / i915#3116) +1 other test
>             skip
>      * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15330) +1 other test skip
>      * igt@kms_content_protection@legacy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15865) +2 other tests skip
>      * igt@kms_content_protection@legacy-hdcp14:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15865)
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15865) +3 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#15865)
>           * shard-dg2: NOTRUN -> SKIP (i915#15865)
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15865) +3 other tests skip
>      * igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13049) +1 other test skip
>      * igt@kms_cursor_crc@cursor-onscreen-max-size:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +3 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814) +1 other test
>             skip
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555)
>      * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#13566) +1 other test fail
>      * igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>           * shard-tglu: PASS -> FAIL (i915#13566) +1 other test fail
>      * igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#13566) +4 other tests fail
>      * igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3555) +1 other test
>             skip
>      * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9809) +1 other test skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4103) +1 other test skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4103) +3 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4103)
>           * shard-tglu: NOTRUN -> SKIP (i915#4103) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#16119 / i915#4213)
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13046 / i915#5354) +2 other tests
>             skip
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13691)
>           * shard-rkl: NOTRUN -> SKIP (i915#13691)
>           * shard-dg1: NOTRUN -> SKIP (i915#13691)
>           * shard-tglu: NOTRUN -> SKIP (i915#13691)
>           * shard-mtlp: NOTRUN -> SKIP (i915#13691)
>      * igt@kms_dp_aux_dev@basic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1257)
>      * igt@kms_dp_link_training@non-uhbr-mst:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13749)
>           * shard-tglu: NOTRUN -> SKIP (i915#13749)
>      * igt@kms_dp_link_training@uhbr-mst:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13748)
>           * shard-tglu: NOTRUN -> SKIP (i915#13748)
>      * igt@kms_dsc@dsc-basic-ultrajoiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#16361) +4 other tests skip
>      * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#16361) +5 other tests skip
>      * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#16361) +1 other test
>             skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#16361) +1 other test skip
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#16361) +4 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#16361) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#16361) +2 other tests skip
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3469)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2065)
>           * shard-rkl: NOTRUN -> SKIP (i915#16084)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#16081)
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#16599)
>      * igt@kms_feature_discovery@dsc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#16600)
>      * igt@kms_feature_discovery@hdr:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#16600)
>      * igt@kms_flip@2x-dpms-vs-vblank-race:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9934) +3 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +5 other tests skip
>      * igt@kms_flip@2x-flip-vs-dpms-on-nop:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#9934) +1 other test
>             skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9934)
>      * igt@kms_flip@2x-flip-vs-fences:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3637 / i915#9934) +2 other
>             tests skip
>      * igt@kms_flip@2x-flip-vs-suspend:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637 / i915#9934) +3 other tests
>             skip
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12745 / i915#4839 /
>             i915#6113)
>      * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12745)
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9934) +6 other tests skip
>      * igt@kms_flip@2x-plain-flip-interruptible:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#9934) +7 other tests
>             skip
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>           * shard-tglu: PASS -> FAIL (i915#13027) +1 other test fail
>      * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
> 
>           * shard-dg2: PASS -> FAIL (i915#13027) +1 other test fail
>      * igt@kms_flip@wf_vblank-ts-check-interruptible:
> 
>           * shard-dg1: PASS -> FAIL (i915#14600)
>      * igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3:
> 
>           * shard-dg1: NOTRUN -> FAIL (i915#14600)
>      * igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#10826) +1 other test fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15643) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15643) +2 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15643)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15643 / i915#5190) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15643) +3 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15643) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15643) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15104 / i915#15990) +1 other test
>             skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15991 / i915#1825) +11 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15991 / i915#5354) +12 other
>             tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#14544) +11 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15990 / i915#8708)
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#10056 / i915#16593)
>      * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-pwrite:
> 
>           * shard-dg1: NOTRUN -> SKIP +42 other tests skip
>      * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-render:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +46 other tests skip
>      * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15104 / i915#15990) +1 other test
>             skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15104 / i915#15990)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
> 
>           * shard-glk10: NOTRUN -> SKIP +150 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15990 / i915#8708) +2 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#1825)
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15102 / i915#3023) +21 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15102 / i915#3023)
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15989) +13 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff:
> 
>           * shard-rkl: NOTRUN -> SKIP +93 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15990) +12 other tests skip
>      * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15990) +12 other tests skip
>      * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15989) +26 other tests skip
>      * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15989) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15989) +12 other tests skip
>      * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15990) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-pwrite:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15991) +17 other tests skip
>      * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15991) +23 other tests skip
>      * igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15989) +25 other tests skip
>      * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15989) +8 other tests skip
>      * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-cpu:
> 
>           * shard-rkl: PASS -> SKIP (i915#15989) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9766)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15102) +35 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15990 / i915#8708) +9 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15102) +38 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15102) +18 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-suspend:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15102) +19 other tests skip
>      * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:
> 
>           * shard-tglu: NOTRUN -> SKIP +122 other tests skip
>      * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15102) +18 other tests skip
>      * igt@kms_hdmi_inject@inject-4k:
> 
>           * shard-mtlp: PASS -> SKIP (i915#15725) +1 other test skip
>      * igt@kms_hdr@bpc-switch-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228) +3 other tests
>             skip
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#16518 / i915#3555 / i915#8228) +1
>             other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#16644 / i915#3555 / i915#8228) +3
>             other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#12713 / i915#16490 / i915#3555 /
>             i915#8228)
>      * igt@kms_joiner@basic-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15460)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15460)
>      * igt@kms_joiner@invalid-modeset-big-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15460)
>      * igt@kms_mst@mst-suspend-read-crc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#16451)
>           * shard-rkl: NOTRUN -> SKIP (i915#16451)
>           * shard-dg1: NOTRUN -> SKIP (i915#16451)
>           * shard-tglu: NOTRUN -> SKIP (i915#16451)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15815)
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6301)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
> 
>           * shard-dg2: NOTRUN -> SKIP +4 other tests skip
>      * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * shard-glk: NOTRUN -> DMESG-WARN (i915#118)
>      * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15709) +6 other tests skip
>      * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15709) +2 other tests skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15709) +2 other tests skip
>      * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15709) +1 other test skip
>      * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#16386) +1 other test skip
>      * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#16386) +1 other test skip
>      * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15709)
>           * shard-mtlp: NOTRUN -> SKIP (i915#15709)
>      * igt@kms_plane_alpha_blend@alpha-opaque-fb:
> 
>           * shard-glk10: NOTRUN -> FAIL (i915#10647 / i915#12169)
>      * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:
> 
>           * shard-glk10: NOTRUN -> FAIL (i915#10647) +1 other test fail
>      * igt@kms_plane_alpha_blend@alpha-transparent-fb:
> 
>           * shard-glk11: NOTRUN -> FAIL (i915#10647 / i915#12177)
>      * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
> 
>           * shard-glk11: NOTRUN -> FAIL (i915#10647) +1 other test fail
>      * igt@kms_plane_cursor@overlay:
> 
>           * shard-rkl: PASS -> FAIL (i915#15912)
>      * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#15913) +1 other test fail
>      * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#15912)
>      * igt@kms_plane_multiple@2x-tiling-none:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@tiling-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#14259)
>      * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
> 
>           * shard-glk11: NOTRUN -> SKIP +30 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15329) +7 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15329) +4 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#15329) +4 other tests skip
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12343)
>      * igt@kms_pm_backlight@fade:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12343 / i915#9812)
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15948) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#15948) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#15948) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP (i915#15948) +1 other test skip
>      * igt@kms_pm_dc@dc9-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15739)
>      * igt@kms_pm_lpsp@screens-disabled:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#8430)
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@dpms-non-lpsp:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15073)
>           * shard-dg2: NOTRUN -> SKIP (i915#15073)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15073)
>           * shard-dg1: NOTRUN -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@i2c:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#4423)
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-rkl: PASS -> SKIP (i915#15073) +1 other test skip
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15073) +1 other test skip
>           * shard-dg1: PASS -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@package-g7:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15403)
>      * igt@kms_pm_rpm@system-suspend-idle:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#14419)
>      * igt@kms_prime@basic-modeset-hybrid:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9808)
>      * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
> 
>           * shard-glk10: NOTRUN -> SKIP (i915#11520)
>      * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11520) +8 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#12316) +3 other tests skip
>           * shard-glk: NOTRUN -> SKIP (i915#11520) +2 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#11520 / i915#14544)
>      * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-pr-sprite-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#14544 / i915#9732) +2
>             other tests skip
>      * igt@kms_psr@fbc-psr2-cursor-blt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9732) +9 other tests skip
>      * igt@kms_psr@fbc-psr2-primary-mmap-cpu:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +5 other tests skip
>      * igt@kms_psr@psr-sprite-plane-onoff:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +18 other tests
>             skip
>      * igt@kms_psr@psr2-primary-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +11 other tests
>             skip
>      * igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077 / i915#9688) +1 other test
>             skip
>      * igt@kms_psr@psr2-sprite-mmap-cpu:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +8 other tests
>             skip
>      * igt@kms_psr@psr2-sprite-mmap-gtt:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +22 other tests skip
>      * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
> 
>           * shard-glk10: NOTRUN -> INCOMPLETE (i915#15492 / i915#16184)
>      * igt@kms_rotation_crc@primary-rotation-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12755 / i915#15867)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5289) +2 other tests skip
>      * igt@kms_scaling_modes@scaling-mode-full:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +8 other tests skip
>      * igt@kms_selftest@drm_framebuffer:
> 
>           * shard-glk10: NOTRUN -> ABORT (i915#13179) +1 other test abort
>      * igt@kms_setmode@basic:
> 
>           * shard-snb: NOTRUN -> FAIL (i915#15106) +6 other tests fail
>      * igt@kms_setmode@invalid-clone-single-crtc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8809) +1 other test
>             skip
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10959)
>      * igt@kms_vblank@ts-continuation-dpms-suspend:
> 
>           * shard-glk11: NOTRUN -> INCOMPLETE (i915#12276) +1 other test
>             incomplete
>      * igt@kms_vrr@flip-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15243 / i915#3555)
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#9906)
>      * igt@kms_vrr@seamless-rr-switch-vrr:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9906)
>      * igt@perf@per-context-mode-unprivileged:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2435)
>      * igt@perf_pmu@busy-accuracy-98:
> 
>           * shard-snb: NOTRUN -> SKIP +148 other tests skip
>      * igt@perf_pmu@module-unload:
> 
>           * shard-glk10: NOTRUN -> ABORT (i915#15778)
>      * igt@perf_pmu@most-busy-idle-check-all:
> 
>           * shard-dg2: PASS -> FAIL (i915#15997) +1 other test fail
>           * shard-dg1: NOTRUN -> FAIL (i915#15997) +1 other test fail
>           * shard-mtlp: PASS -> FAIL (i915#15997) +1 other test fail
>      * igt@perf_pmu@rc6-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13356 / i915#16236)
>      * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#14121) +1 other test skip
>      * igt@prime_udl@share-import-addfb:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#16420)
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708 / i915#4077)
>           * shard-rkl: NOTRUN -> SKIP (i915#3708) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3708 / i915#4077)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3708 / i915#4077)
>      * igt@prime_vgem@fence-read-hang:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3708)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3708)
>      * igt@sriov_basic@bind-unbind-vf:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9917)
>      * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#16066)
> 
>     Possible fixes
> 
>      * igt@gem_barrier_race@remote-request:
> 
>           * shard-glk: DMESG-WARN -> PASS +1 other test pass
>      * igt@gem_eio@in-flight-suspend:
> 
>           * shard-dg1: DMESG-WARN (i915#13390 / i915#4391 / i915#4423) ->
>             PASS
>      * igt@gem_mmap_offset@clear-via-pagefault:
> 
>           * shard-mtlp: TIMEOUT (i915#16021 / i915#16168 / i915#16349) ->
>             PASS +1 other test pass
>      * igt@i915_module_load@reload-no-display:
> 
>           * shard-dg1: DMESG-WARN (i915#13029 / i915#14545) -> PASS
>      * igt@i915_pm_rc6_residency@rc6-accuracy:
> 
>           * shard-dg2: FAIL (i915#12964) -> PASS +1 other test pass
>      * igt@i915_pm_rps@waitboost:
> 
>           * shard-mtlp: FAIL (i915#15365 / i915#16503) -> PASS
>      * igt@i915_selftest@live:
> 
>           * shard-dg1: ABORT (i915#16436) -> PASS
>      * igt@i915_selftest@live@gem_contexts:
> 
>           * shard-dg1: ABORT (i915#15433) -> PASS
>      * igt@i915_suspend@forcewake:
> 
>           * shard-rkl: INCOMPLETE (i915#4817) -> PASS
>      * igt@kms_async_flips@async-flip-suspend-resume:
> 
>           * shard-rkl: INCOMPLETE (i915#12761) -> PASS
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
> 
>           * shard-rkl: INCOMPLETE (i915#15582) -> PASS +1 other test pass
>      * igt@kms_cursor_crc@cursor-onscreen-128x42:
> 
>           * shard-rkl: FAIL (i915#13566) -> PASS
>           * shard-tglu: FAIL (i915#13566) -> PASS +1 other test pass
>      * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
> 
>           * shard-rkl: SKIP (i915#15989) -> PASS +3 other tests pass
>      * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
> 
>           * shard-glk: SKIP -> PASS +6 other tests pass
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-rkl: SKIP (i915#16644 / i915#3555 / i915#8228) -> PASS
>      * igt@kms_lease@setcrtc-implicit-plane:
> 
>           * shard-dg1: DMESG-WARN (i915#4423) -> PASS
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-dg2: SKIP (i915#9340) -> PASS
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-dg1: SKIP (i915#15073) -> PASS +2 other tests pass
>      * igt@perf_pmu@frequency:
> 
>           * shard-dg1: FAIL (i915#6806) -> PASS +1 other test pass
> 
>     Warnings
> 
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#280) -> SKIP (i915#280)
>      * igt@gem_exec_reloc@basic-scanout:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3281) -> SKIP (i915#3281)
>      * igt@gem_exec_reloc@basic-softpin:
> 
>           * shard-rkl: SKIP (i915#3281) -> SKIP (i915#14544 / i915#3281) +4
>             other tests skip
>      * igt@gem_lmem_swapping@heavy-multi:
> 
>           * shard-rkl: SKIP (i915#4613) -> SKIP (i915#14544 / i915#4613)
>      * igt@gem_partial_pwrite_pread@writes-after-reads-display:
> 
>           * shard-rkl: SKIP (i915#3282) -> SKIP (i915#14544 / i915#3282)
>      * igt@gem_userptr_blits@access-control:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3297) -> SKIP (i915#3297)
>      * igt@i915_query@query-topology-known-pci-ids:
> 
>           * shard-rkl: SKIP (i915#16109) -> SKIP (i915#14544 / i915#16109)
>      * igt@i915_suspend@fence-restore-untiled:
> 
>           * shard-rkl: ABORT (i915#15131) -> INCOMPLETE (i915#4817)
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
> 
>           * shard-rkl: SKIP (i915#5286) -> SKIP (i915#14544 / i915#5286) +1
>             other test skip
>      * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-rkl: SKIP (i915#3828) -> SKIP (i915#14544 / i915#3828)
>      * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#6095) -> SKIP (i915#14544 / i915#6095) +3
>             other tests skip
>      * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6095) -> SKIP (i915#6095) +3
>             other tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#14098 /
>             i915#14544 / i915#6095) +5 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#14544 / i915#6095) -> SKIP
>             (i915#14098 / i915#6095) +5 other tests skip
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-rkl: SKIP (i915#3742) -> SKIP (i915#14544 / i915#3742)
>      * igt@kms_chamelium_color_pipeline@plane-lut1d:
> 
>           * shard-rkl: SKIP (i915#16471) -> SKIP (i915#14544 / i915#16471) +1
>             other test skip
>      * igt@kms_chamelium_frames@hdmi-crc-single:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#14544 / i915#7828) -> SKIP
>             (i915#11151 / i915#7828)
>      * igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#7828) -> SKIP (i915#11151 /
>             i915#14544 / i915#7828) +2 other tests skip
>      * igt@kms_content_protection@content-type-change:
> 
>           * shard-rkl: SKIP (i915#15865) -> SKIP (i915#14544 / i915#15865)
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-rkl: SKIP (i915#15330 / i915#3116) -> SKIP (i915#14544 /
>             i915#15330 / i915#3116)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15865) -> SKIP (i915#15865)
>      * igt@kms_cursor_crc@cursor-offscreen-max-size:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555) -> SKIP (i915#3555)
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-rkl: SKIP (i915#13049 / i915#14544) -> SKIP (i915#13049) +1
>             other test skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-rkl: SKIP (i915#4103) -> SKIP (i915#14544 / i915#4103)
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-rkl: SKIP (i915#16361) -> SKIP (i915#14544 / i915#16361)
>      * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
> 
>           * shard-rkl: SKIP (i915#9934) -> SKIP (i915#14544 / i915#9934) +1
>             other test skip
>      * igt@kms_flip@2x-flip-vs-panning-vs-hang:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9934) -> SKIP (i915#9934) +2
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
> 
>           * shard-rkl: SKIP (i915#15643) -> SKIP (i915#14544 / i915#15643) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
> 
>           * shard-dg1: SKIP (i915#4423) -> SKIP
>      * igt@kms_frontbuffer_tracking@fbchdr-suspend:
> 
>           * shard-glk: INCOMPLETE (i915#16056 / i915#16593) -> SKIP
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#15102) -> SKIP (i915#15102) +2
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
> 
>           * shard-dg2: SKIP (i915#15102) -> SKIP (i915#10433 / i915#15102) +4
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15102) -> SKIP (i915#15102) +4
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP +19 other tests skip
>      * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-dg1: SKIP (i915#15990 / i915#4423) -> SKIP (i915#15990)
>      * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-rkl: SKIP -> SKIP (i915#14544) +22 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15102 / i915#3023) -> SKIP
>             (i915#15102 / i915#3023) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1825) -> SKIP (i915#1825)
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#1825) -> SKIP (i915#14544 / i915#1825)
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
> 
>           * shard-rkl: SKIP (i915#15102 / i915#3023) -> SKIP (i915#14544 /
>             i915#15102 / i915#3023) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:
> 
>           * shard-rkl: SKIP (i915#15102) -> SKIP (i915#14544 / i915#15102) +7
>             other tests skip
>      * igt@kms_frontbuffer_tracking@psrhdr-shrfb-scaledprimary:
> 
>           * shard-dg1: SKIP (i915#15102 / i915#4423) -> SKIP (i915#15102)
>      * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15709) -> SKIP (i915#15709)
>      * igt@kms_pm_backlight@bad-brightness:
> 
>           * shard-rkl: SKIP (i915#12343 / i915#14544 / i915#5354) -> SKIP
>             (i915#12343 / i915#5354)
>      * igt@kms_pm_rpm@package-g7:
> 
>           * shard-rkl: SKIP (i915#15403) -> SKIP (i915#14544 / i915#15403)
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
> 
>           * shard-rkl: SKIP (i915#11520 / i915#14544) -> SKIP (i915#11520)
>      * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
> 
>           * shard-rkl: SKIP (i915#11520) -> SKIP (i915#11520 / i915#14544) +2
>             other tests skip
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9683) -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-pr-cursor-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#14544 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732) +3 other tests skip
>      * igt@kms_psr@psr-cursor-plane-move:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 /
>             i915#14544 / i915#9732) +4 other tests skip
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_9018 -> IGTPW_15580
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_18876: cfee1b098ebceda0381298e945031733a5aec8dd @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_15580: 0e82db417179243aa8e009324a81edde0802ec7c @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_9018: f4345861cbd5d97fd50b73bf7af5fe3286fca056 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
