Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B435BEC1EA6
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 11:53:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DEA10E87B;
	Thu,  5 Feb 2026 11:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N45LDAnW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425DB10E87B
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 11:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770292390; x=1801828390;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=aDwyPF+o34bpxdmNF2sGIQWG84ZN1Bnw/o3DwKlHPKs=;
 b=N45LDAnWtxSS4FiYMseqHoxGzIoruMIHyRz3elB/QiRdDIuvMkyeh5y9
 wIXNTHA/mJVM7NJtvCfNz+WulUsj7g9ZX5k+ovKTUjBx+uFXthA4OBthN
 f5V8t458/WJCm7j7fG3FWQ6JTH9T9SLWNIYAtv5spZTkvaHrWxQgQi7v+
 zh0S1dBIQ4iACBEqYcjOrFDr4SaHXXsJb3VWEUM+0hhZ8Q066Jz3SZIKJ
 CppDYVsWbNVN/sTstlC7ejOWrt3Vt7QN4s2+l0f65aue0ckYDmMsTZRsZ
 x4EsXd3R0L0GXwrTuBP/sNls6woAztM8e7pKpR5uCRh3OuauJ7bG/SXQk Q==;
X-CSE-ConnectionGUID: 8+6gkGkBSDmjdWyAFywJ5Q==
X-CSE-MsgGUID: wiga9ixsThmKgsOE7eqByQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71387030"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="71387030"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 03:53:10 -0800
X-CSE-ConnectionGUID: ByAIfzvPSi6WeRrRcyy93A==
X-CSE-MsgGUID: Jm/p0Az7TIGxJzHkvSok3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="209587761"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.81])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 03:53:09 -0800
Date: Thu, 5 Feb 2026 12:53:06 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib=2Figt?=
 =?utf-8?Q?=5Faux?= =?utf-8?Q?=3A?= Protect expressions from premature
 casting in aux macros
Message-ID: <xksww2qfcpgtn3qi5mhcswsbjwttncjnqfems4vaho5rm3jnql@givsmvtkduro>
References: <20260204135500.311469-2-zbigniew.kempczynski@intel.com>
 <177025982206.225549.3468850949122421327@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177025982206.225549.3468850949122421327@a3b018990fe9>
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

On Thu, Feb 05, 2026 at 02:50:22AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/igt_aux: Protect expressions from premature casting in aux    
>             macros                                                            
>    URL:     https://patchwork.freedesktop.org/series/161144/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/index.html   
> 
>           CI Bug Log - changes from IGT_8735_full -> IGTPW_14489_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_14489_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_14489_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14489/index.html
> 
> Participating hosts (10 -> 10)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_14489_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_mmap_offset@clear-via-pagefault:
> 
>           * shard-mtlp: PASS -> DMESG-WARN +1 other test dmesg-warn
>      * igt@gem_softpin@noreloc-s3:
> 
>           * shard-snb: PASS -> ABORT
>           * shard-tglu: PASS -> ABORT
>      * igt@kms_hdmi_inject@inject-audio:
> 
>           * shard-mtlp: NOTRUN -> SKIP
>      * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-256:
> 
>           * shard-rkl: PASS -> FAIL +1 other test fail

Unrelated to the change.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between IGT_8735_full and IGTPW_14489_full:
> 
>   New IGT tests (3)
> 
>      * igt@kms_cursor_crc@cursor-offscreen-128x42@pipe-a-dp-3:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [2.56] s
>      * igt@kms_sequence@get-forked@pipe-a-vga-1:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [2.39] s
>      * igt@kms_sequence@get-forked@pipe-b-vga-1:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [2.25] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_14489_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@crc32:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6230)
>      * igt@api_intel_bb@object-reloc-purge-cache:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8411)
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11078)
>      * igt@device_reset@unbind-cold-reset-rebind:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11078 / i915#14544)
>      * igt@drm_buddy@drm_buddy:
> 
>           * shard-glk: NOTRUN -> DMESG-WARN (i915#15095) +1 other test
>             dmesg-warn
>      * igt@gem_bad_reloc@negative-reloc-lut:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +2 other tests skip
>      * igt@gem_ccs@ctrl-surf-copy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#9323) +1 other test
>             skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-dg2: PASS -> INCOMPLETE (i915#13356) +1 other test
>             incomplete
>           * shard-tglu: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_close_race@multigpu-basic-threads:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#7697)
>      * igt@gem_create@create-ext-set-pat:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8562)
>           * shard-dg1: NOTRUN -> SKIP (i915#8562)
>      * igt@gem_ctx_isolation@preservation-s3@bcs0:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13356) +1 other test
>             incomplete
>      * igt@gem_ctx_persistence@heartbeat-close:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8555)
>           * shard-dg1: NOTRUN -> SKIP (i915#8555)
>           * shard-mtlp: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@in-flight-suspend:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#13390)
>      * igt@gem_exec_balancer@parallel-balancer:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#4525)
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525) +1 other test skip
>      * igt@gem_exec_big@single:
> 
>           * shard-tglu-1: NOTRUN -> ABORT (i915#11713)
>      * igt@gem_exec_capture@capture-invisible@smem0:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#6334) +1 other test skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6334) +1 other test skip
>      * igt@gem_exec_reloc@basic-cpu-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +2 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3281) +1 other test
>             skip
>      * igt@gem_exec_reloc@basic-write-read-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +18 other tests skip
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2190)
>           * shard-glk: NOTRUN -> SKIP (i915#2190)
>      * igt@gem_lmem_evict@dontneed-evict-race:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613 / i915#7582)
>      * igt@gem_lmem_swapping@massive:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@massive-random:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +5 other tests skip
>      * igt@gem_media_vme:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#284)
>      * igt@gem_mmap_gtt@medium-copy-xy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +1 other test skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +7 other tests skip
>      * igt@gem_pread@exhaustion:
> 
>           * shard-glk: NOTRUN -> WARN (i915#2658)
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3282)
>           * shard-glk10: NOTRUN -> WARN (i915#14702 / i915#2658)
>      * igt@gem_pwrite_snooped:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3282) +1 other test
>             skip
>      * igt@gem_pxp@create-regular-context-2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_pxp@hw-rejects-pxp-context:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13717)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13398)
>      * igt@gem_pxp@protected-raw-src-copy-not-readible:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
> 
>           * shard-snb: NOTRUN -> SKIP +67 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428)
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428)
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@readonly-pwrite-unsync:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3297) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3297) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP (i915#3297) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_userptr_blits@unsync-unmap:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3297)
>      * igt@gen3_render_linear_blits:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544) +1 other test skip
>      * igt@gen7_exec_parse@basic-allowed:
> 
>           * shard-tglu: NOTRUN -> SKIP +29 other tests skip
>      * igt@gen7_exec_parse@basic-offset:
> 
>           * shard-dg2: NOTRUN -> SKIP +2 other tests skip
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-glk: PASS -> ABORT (i915#5566) +1 other test abort
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 other
>             test skip
>      * igt@gen9_exec_parse@bb-large:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 other test
>             skip
>      * igt@gen9_exec_parse@bb-start-param:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +4 other tests skip
>      * igt@i915_module_load@fault-injection:
> 
>           * shard-dg2: NOTRUN -> ABORT (i915#15342 / i915#15481)
>           * shard-dg1: NOTRUN -> ABORT (i915#11815 / i915#15481) +1 other
>             test abort
>           * shard-mtlp: NOTRUN -> ABORT (i915#15342 / i915#15481)
>      * igt@i915_module_load@fault-injection@__uc_init:
> 
>           * shard-dg2: NOTRUN -> ABORT (i915#15481)
>           * shard-rkl: NOTRUN -> SKIP (i915#15479) +4 other tests skip
>           * shard-mtlp: NOTRUN -> ABORT (i915#15481)
>      * igt@i915_module_load@fault-injection@i915_driver_mmio_probe:
> 
>           * shard-dg1: NOTRUN -> INCOMPLETE (i915#15481)
>      * igt@i915_module_load@fault-injection@intel_connector_register:
> 
>           * shard-rkl: NOTRUN -> ABORT (i915#15342) +1 other test abort
>           * shard-mtlp: NOTRUN -> DMESG-WARN (i915#15342)
>           * shard-glk: NOTRUN -> ABORT (i915#15342) +1 other test abort
>           * shard-dg2: NOTRUN -> DMESG-WARN (i915#15342)
>      * igt@i915_module_load@resize-bar:
> 
>           * shard-dg2: PASS -> DMESG-WARN (i915#14545)
>      * igt@i915_pm_freq_mult@media-freq@gt0:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6590) +1 other test skip
>      * igt@i915_pm_rc6_residency@rc6-accuracy:
> 
>           * shard-dg2: PASS -> FAIL (i915#12964) +1 other test fail
>      * igt@i915_pm_rc6_residency@rc6-fence:
> 
>           * shard-tglu: NOTRUN -> WARN (i915#13790 / i915#2681) +1 other test
>             warn
>      * igt@i915_pm_rpm@system-suspend-execbuf:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13356 / i915#15172)
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-tglu: NOTRUN -> INCOMPLETE (i915#4817 / i915#7443)
>           * shard-mtlp: NOTRUN -> SKIP (i915#6645)
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9531)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#1769)
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286)
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#5286) +1 other test
>             skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5286) +3 other tests skip
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +4 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-mtlp: PASS -> FAIL (i915#5138) +1 other test fail
>      * igt@kms_big_fb@linear-64bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638) +4 other tests skip
>      * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3828) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3828)
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +1 other test
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4538)
>           * shard-mtlp: NOTRUN -> SKIP +4 other tests skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-rkl: NOTRUN -> SKIP +31 other tests skip
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#14544 / i915#6095)
>             +7 other tests skip
>      * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +14 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +87 other tests skip
>      * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#4423) +3 other tests
>             dmesg-warn
>      * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +113 other
>             tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>             +2 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#6095) +13 other
>             tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +44 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-3:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +207 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12805)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6095) +49 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6095) +43 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#6095) +66 other
>             tests skip
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#15582) +1 other test
>             incomplete
>      * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-glk10: NOTRUN -> SKIP +209 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12313) +1 other test skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_chamelium_frames@hdmi-aspect-ratio:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11151 / i915#7828) +4 other
>             tests skip
>      * igt@kms_chamelium_frames@hdmi-crc-multiple:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#14544 / i915#7828)
>      * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#7828) +9 other tests
>             skip
>      * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11151 / i915#7828) +4 other
>             tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#11151 / i915#7828)
>           * shard-mtlp: NOTRUN -> SKIP (i915#11151 / i915#7828)
>           * shard-dg2: NOTRUN -> SKIP (i915#11151 / i915#7828)
>      * igt@kms_content_protection@content-type-change:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6944 / i915#9424) +1 other test
>             skip
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15330 / i915#3116)
>      * igt@kms_content_protection@dp-mst-type-0-hdcp14:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15330)
>      * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15330)
>      * igt@kms_content_protection@legacy-hdcp14:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6944) +1 other test skip
>      * igt@kms_content_protection@lic-type-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#6944 / i915#9424)
>      * igt@kms_content_protection@srm:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118)
>      * igt@kms_content_protection@suspend-resume:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6944)
>      * igt@kms_content_protection@suspend-resume@pipe-a-dp-3:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#7173) +1 other test fail
>      * igt@kms_content_protection@uevent:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6944 / i915#9424)
>           * shard-dg2: NOTRUN -> SKIP (i915#6944 / i915#7118 / i915#9424)
>           * shard-rkl: NOTRUN -> SKIP (i915#6944 / i915#7118 / i915#9424)
>           * shard-dg1: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#9424)
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118 /
>             i915#9424)
>      * igt@kms_cursor_crc@cursor-offscreen-32x10:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555)
>           * shard-dg1: NOTRUN -> SKIP (i915#3555)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814)
>      * igt@kms_cursor_crc@cursor-onscreen-32x10:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: PASS -> FAIL (i915#13566) +1 other test fail
>      * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#13566) +4 other tests fail
>      * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814)
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +3 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>           * shard-tglu-1: NOTRUN -> FAIL (i915#13566) +1 other test fail
>      * igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213)
>           * shard-rkl: NOTRUN -> SKIP (i915#4103)
>           * shard-dg1: NOTRUN -> SKIP (i915#4103 / i915#4213)
>           * shard-tglu: NOTRUN -> SKIP (i915#4103)
>           * shard-mtlp: NOTRUN -> SKIP (i915#4213)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3555 / i915#3804)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#1769 / i915#3555 / i915#3804)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3804)
>      * igt@kms_dp_aux_dev:
> 
>           * shard-dg2: PASS -> SKIP (i915#1257)
>      * igt@kms_dp_link_training@non-uhbr-mst:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13749)
>      * igt@kms_dp_link_training@non-uhbr-sst:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13749)
>      * igt@kms_dp_link_training@uhbr-mst:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13748)
>      * igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13707)
>      * igt@kms_draw_crc@draw-method-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8812)
>      * igt@kms_dsc@dsc-basic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840) +1 other test
>             skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3840 / i915#9053)
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#9878)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3955)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4854)
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@psr1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#658)
>           * shard-dg2: NOTRUN -> SKIP (i915#658)
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#658)
>           * shard-dg1: NOTRUN -> SKIP (i915#658)
>      * igt@kms_flip@2x-blocking-absolute-wf_vblank:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#9934)
>      * igt@kms_flip@2x-flip-vs-fences:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3637 / i915#9934) +2 other
>             tests skip
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12745 / i915#4839)
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#4839)
>      * igt@kms_flip@2x-modeset-vs-vblank-race:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9934)
>           * shard-rkl: NOTRUN -> SKIP (i915#9934) +8 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637 / i915#9934)
>      * igt@kms_flip@2x-nonexisting-fb:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#9934) +4 other tests
>             skip
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#6113)
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
> 
>           * shard-rkl: NOTRUN -> INCOMPLETE (i915#6113)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15643) +3 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15643) +4 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15643)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8813)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8810 / i915#8813)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15643) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15645) +2 other tests skip
>      * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15645)
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708)
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708)
>           * shard-dg2: NOTRUN -> SKIP (i915#8708)
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +34 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15574)
>      * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-pwrite:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15574)
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-rkl: NOTRUN -> ABORT (i915#15132)
>           * shard-glk10: NOTRUN -> INCOMPLETE (i915#10056)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15102 / i915#3023)
>             +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +42 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#1825) +7 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +3 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9766)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15102) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#15102) +1 other test skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15102) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15102) +13 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15102 / i915#3023) +21 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15102 / i915#3458) +4 other tests
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#15102 / i915#3458) +3 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
> 
>           * shard-dg1: NOTRUN -> SKIP +8 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15574) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15102) +16 other tests skip
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-dg2: PASS -> SKIP (i915#3555 / i915#8228)
>           * shard-rkl: PASS -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@static-swap:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228)
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228) +2 other tests
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228)
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228)
>           * shard-mtlp: NOTRUN -> SKIP (i915#12713 / i915#3555 / i915#8228)
>      * igt@kms_joiner@basic-force-ultra-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15458) +2 other tests skip
>      * igt@kms_joiner@basic-max-non-joiner:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13688)
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15458)
>      * igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15459)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15459)
>      * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15638)
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#14712)
>      * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15608 / i915#15609 / i915#8825)
>           * shard-rkl: NOTRUN -> SKIP (i915#15608 / i915#15609 / i915#8825)
>             +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#15608 / i915#15609 / i915#8825)
>           * shard-tglu: NOTRUN -> SKIP (i915#15608 / i915#15609 / i915#8825)
>           * shard-mtlp: NOTRUN -> SKIP (i915#15608 / i915#15609 / i915#8825)
>      * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-4:
> 
>           * shard-glk: NOTRUN -> SKIP +581 other tests skip
>      * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-5:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15609)
>           * shard-dg2: NOTRUN -> SKIP (i915#15609)
>      * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-7:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15609)
>           * shard-tglu: NOTRUN -> SKIP (i915#15609)
>      * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15608) +8 other tests skip
>      * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15608) +12 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#15608) +12 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#15609 / i915#8825)
>           * shard-dg2: NOTRUN -> SKIP (i915#15609 / i915#8825)
>      * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-7:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15609 / i915#8825)
>           * shard-tglu: NOTRUN -> SKIP (i915#15609 / i915#8825)
>      * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15608 / i915#15609 /
>             i915#8825)
>      * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15608) +1 other test
>             skip
>      * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15609) +2 other tests skip
>      * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-5:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15609 / i915#8825)
>      * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-5:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15609 / i915#8825) +1 other test
>             skip
>      * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15608 / i915#8825) +9 other tests
>             skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15608 / i915#8825) +3 other
>             tests skip
>      * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-0:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15608) +15 other tests skip
>      * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-3:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15608) +43 other tests skip
>      * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-5:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15608 / i915#8825)
>             +1 other test skip
>      * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15608 / i915#8825) +1 other test
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#15608 / i915#8825) +1 other test
>             skip
>           * shard-tglu: NOTRUN -> SKIP (i915#15608 / i915#8825) +1 other test
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#15608 / i915#8825) +1 other test
>             skip
>      * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-3:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15608) +8 other tests skip
>      * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13026) +1 other test
>             incomplete
>      * igt@kms_plane_alpha_blend@alpha-opaque-fb:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10647 / i915#12169)
>      * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10647) +3 other tests fail
>      * igt@kms_plane_alpha_blend@alpha-transparent-fb:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10647 / i915#12177)
>      * igt@kms_plane_cursor@overlay:
> 
>           * shard-rkl: PASS -> FAIL (i915#15530) +1 other test fail
>      * igt@kms_plane_multiple@2x-tiling-x:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13958 / i915#14544)
>      * igt@kms_plane_multiple@tiling-4:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#14259)
>      * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15329 / i915#3555)
>      * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15329) +2 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15329) +3 other
>             tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15329) +8 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15329 / i915#6953)
>      * igt@kms_pm_backlight@fade:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354)
>      * igt@kms_pm_backlight@fade-with-suspend:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9812) +1 other test skip
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9685) +1 other test skip
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#9340)
>      * igt@kms_pm_rpm@cursor:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +1 other test skip
>      * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-dg2: PASS -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@dpms-non-lpsp:
> 
>           * shard-rkl: PASS -> SKIP (i915#15073)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * shard-dg1: PASS -> SKIP (i915#15073) +1 other test skip
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15073)
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#11520) +9 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11520) +7 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
> 
>           * shard-glk10: NOTRUN -> SKIP (i915#11520) +6 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11520 / i915#14544) +1 other test
>             skip
>      * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11520)
>           * shard-snb: NOTRUN -> SKIP (i915#11520)
>      * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11520) +5 other tests skip
>      * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-pr-sprite-plane-onoff:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#14544 / i915#9732) +5
>             other tests skip
>      * igt@kms_psr@fbc-psr-cursor-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +3 other tests
>             skip
>      * igt@kms_psr@fbc-psr-cursor-blt@edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +4 other tests skip
>      * igt@kms_psr@psr-cursor-plane-move:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +7 other tests
>             skip
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +13 other tests skip
>      * igt@kms_psr@psr2-cursor-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +25 other tests
>             skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9732) +10 other tests skip
>      * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#15500)
>      * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#15492)
>      * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5289) +1 other test skip
>      * igt@kms_scaling_modes@scaling-mode-full-aspect:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +5 other tests skip
>      * igt@kms_selftest@drm_framebuffer:
> 
>           * shard-tglu: NOTRUN -> ABORT (i915#13179) +1 other test abort
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10959)
>      * igt@kms_vrr@flip-basic-fastset:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9906) +1 other test skip
>      * igt@kms_vrr@flipline:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15243 / i915#3555)
>      * igt@kms_vrr@lobf:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11920)
>      * igt@kms_vrr@seamless-rr-switch-drrs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9906)
>      * igt@perf@blocking@0-rcs0:
> 
>           * shard-tglu: PASS -> FAIL (i915#10538) +1 other test fail
>      * igt@perf@mi-rpc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2434)
>      * igt@perf@per-context-mode-unprivileged:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2435)
>           * shard-dg1: NOTRUN -> SKIP (i915#2433)
>      * igt@perf_pmu@module-unload:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#14433)
>      * igt@perf_pmu@rc6@other-idle-gt0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8516)
>      * igt@prime_vgem@fence-flip-hang:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3708)
>      * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#12910) +9 other tests fail
>      * igt@sriov_basic@enable-vfs-autoprobe-on:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9917)
>      * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>           * shard-tglu-1: NOTRUN -> FAIL (i915#12910)
> 
>     Possible fixes
> 
>      * igt@gem_eio@kms:
> 
>           * shard-rkl: DMESG-WARN (i915#13363) -> PASS
>           * shard-tglu: ABORT (i915#13363) -> PASS
>      * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
> 
>           * shard-rkl: SKIP (i915#4270) -> PASS
>      * igt@gem_workarounds@suspend-resume-fd:
> 
>           * shard-rkl: INCOMPLETE (i915#13356) -> PASS
>           * shard-glk: INCOMPLETE (i915#13356 / i915#14586) -> PASS
>      * igt@i915_selftest@live:
> 
>           * shard-mtlp: DMESG-FAIL (i915#12061 / i915#15560) -> PASS
>      * igt@i915_selftest@live@workarounds:
> 
>           * shard-mtlp: DMESG-FAIL (i915#12061) -> PASS
>      * igt@i915_suspend@sysfs-reader:
> 
>           * shard-rkl: INCOMPLETE (i915#4817) -> PASS
>      * igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-a-edp-1:
> 
>           * shard-mtlp: FAIL (i915#13566) -> PASS +1 other test pass
>      * igt@kms_cursor_crc@cursor-onscreen-128x42:
> 
>           * shard-rkl: FAIL (i915#13566) -> PASS +4 other tests pass
>      * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: FAIL (i915#13566) -> PASS +1 other test pass
>      * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
> 
>           * shard-dg1: DMESG-WARN (i915#4423) -> PASS +1 other test pass
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>           * shard-snb: SKIP -> PASS +1 other test pass
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
> 
>           * shard-dg2: FAIL (i915#15389 / i915#6880) -> PASS
>      * igt@kms_hdr@bpc-switch:
> 
>           * shard-dg2: SKIP (i915#3555 / i915#8228) -> PASS +1 other test
>             pass
>      * igt@kms_hdr@static-swap:
> 
>           * shard-rkl: SKIP (i915#3555 / i915#8228) -> PASS +1 other test
>             pass
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-rkl: SKIP (i915#15073) -> PASS +2 other tests pass
> 
>     Warnings
> 
>      * igt@gem_exec_balancer@parallel-keep-in-fence:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4525) -> SKIP (i915#4525)
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-rkl: SKIP (i915#4525) -> SKIP (i915#14544 / i915#4525) +1
>             other test skip
>      * igt@gem_exec_reloc@basic-write-wc-active:
> 
>           * shard-rkl: SKIP (i915#3281) -> SKIP (i915#14544 / i915#3281) +1
>             other test skip
>      * igt@gem_exec_schedule@semaphore-power:
> 
>           * shard-rkl: SKIP (i915#7276) -> SKIP (i915#14544 / i915#7276)
>      * igt@gem_partial_pwrite_pread@write-snoop:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3282) -> SKIP (i915#3282)
>      * igt@gem_pread@bench:
> 
>           * shard-rkl: SKIP (i915#3282) -> SKIP (i915#14544 / i915#3282)
>      * igt@gen9_exec_parse@batch-invalid-length:
> 
>           * shard-rkl: SKIP (i915#2527) -> SKIP (i915#14544 / i915#2527) +1
>             other test skip
>      * igt@i915_power@sanity:
> 
>           * shard-rkl: SKIP (i915#7984) -> SKIP (i915#14544 / i915#7984)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
> 
>           * shard-rkl: SKIP (i915#5286) -> SKIP (i915#14544 / i915#5286) +1
>             other test skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#5286) -> SKIP (i915#5286) +2
>             other tests skip
>      * igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>           * shard-rkl: SKIP (i915#3638) -> SKIP (i915#14544 / i915#3638) +2
>             other tests skip
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
> 
>           * shard-rkl: SKIP -> SKIP (i915#14544) +8 other tests skip
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP +5 other tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#6095) -> SKIP (i915#14544 / i915#6095) +5
>             other tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
> 
>           * shard-rkl: SKIP (i915#12313 / i915#14544) -> SKIP (i915#12313)
>      * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#14544 / i915#6095) -> SKIP
>             (i915#14098 / i915#6095) +3 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6095) -> SKIP (i915#6095) +3
>             other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#14098 /
>             i915#14544 / i915#6095) +13 other tests skip
>      * igt@kms_chamelium_frames@dp-crc-single:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#14544 / i915#7828) -> SKIP
>             (i915#11151 / i915#7828)
>      * igt@kms_chamelium_hpd@dp-hpd-storm:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#7828) -> SKIP (i915#11151 /
>             i915#14544 / i915#7828) +4 other tests skip
>      * igt@kms_content_protection@atomic:
> 
>           * shard-dg2: SKIP (i915#6944 / i915#7118 / i915#9424) -> FAIL
>             (i915#7173)
>      * igt@kms_content_protection@atomic-hdcp14:
> 
>           * shard-dg2: DMESG-FAIL -> SKIP (i915#6944)
>      * igt@kms_content_protection@suspend-resume:
> 
>           * shard-dg2: SKIP (i915#6944) -> FAIL (i915#7173)
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-rkl: SKIP (i915#13049 / i915#14544) -> SKIP (i915#13049) +1
>             other test skip
>      * igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>           * shard-rkl: SKIP (i915#3555) -> SKIP (i915#14544 / i915#3555) +1
>             other test skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-rkl: SKIP (i915#4103) -> SKIP (i915#14544 / i915#4103)
>      * igt@kms_dp_aux_dev:
> 
>           * shard-rkl: SKIP (i915#1257 / i915#14544) -> SKIP (i915#1257)
>      * igt@kms_dp_link_training@uhbr-sst:
> 
>           * shard-rkl: SKIP (i915#13748 / i915#14544) -> SKIP (i915#13748)
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-rkl: INCOMPLETE (i915#9878) -> ABORT (i915#15132)
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-rkl: SKIP (i915#9337) -> SKIP (i915#14544 / i915#9337)
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9934) -> SKIP (i915#9934)
>      * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
> 
>           * shard-rkl: SKIP (i915#9934) -> SKIP (i915#14544 / i915#9934) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
> 
>           * shard-rkl: SKIP (i915#15643) -> SKIP (i915#14544 / i915#15643)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15643) -> SKIP (i915#15643)
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-rkl: SKIP (i915#1825) -> SKIP (i915#14544 / i915#1825) +16
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-pwrite:
> 
>           * shard-rkl: SKIP (i915#15574) -> SKIP (i915#14544 / i915#15574) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15102 / i915#3023) -> SKIP
>             (i915#15102 / i915#3023) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
> 
>           * shard-dg2: SKIP (i915#15102 / i915#3458) -> SKIP (i915#10433 /
>             i915#15102 / i915#3458)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
> 
>           * shard-rkl: SKIP (i915#15102 / i915#3023) -> SKIP (i915#14544 /
>             i915#15102 / i915#3023) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1825) -> SKIP (i915#1825) +5
>             other tests skip
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>           * shard-rkl: SKIP (i915#9766) -> SKIP (i915#14544 / i915#9766)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15102) -> SKIP (i915#15102)
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#15102 / i915#3458) -> SKIP
>             (i915#15102 / i915#3458) +1 other test skip
>      * igt@kms_joiner@basic-max-non-joiner:
> 
>           * shard-rkl: SKIP (i915#13688) -> SKIP (i915#13688 / i915#14544)
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6301) -> SKIP (i915#6301)
>      * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
> 
>           * shard-rkl: SKIP (i915#15608 / i915#15609 / i915#8825) -> SKIP
>             (i915#14544 / i915#15608 / i915#15609 / i915#8825)
>      * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-0:
> 
>           * shard-rkl: SKIP (i915#15608) -> SKIP (i915#14544 / i915#15608)
>      * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-5:
> 
>           * shard-rkl: SKIP (i915#15609 / i915#8825) -> SKIP (i915#14544 /
>             i915#15609 / i915#8825)
>      * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-0:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15608) -> SKIP (i915#15608)
>      * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-5:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15608 / i915#8825) -> SKIP
>             (i915#15608 / i915#8825) +1 other test skip
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-rkl: SKIP (i915#9685) -> SKIP (i915#14544 / i915#9685)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-dg1: SKIP (i915#9340) -> SKIP (i915#3828)
>      * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * shard-rkl: SKIP (i915#15073) -> SKIP (i915#14544 / i915#15073)
>      * igt@kms_pm_rpm@package-g7:
> 
>           * shard-rkl: SKIP (i915#15403) -> SKIP (i915#14544 / i915#15403)
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
> 
>           * shard-rkl: SKIP (i915#11520 / i915#14544) -> SKIP (i915#11520) +1
>             other test skip
>      * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
> 
>           * shard-rkl: SKIP (i915#11520) -> SKIP (i915#11520 / i915#14544) +2
>             other tests skip
>      * igt@kms_psr@fbc-pr-no-drrs:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 /
>             i915#14544 / i915#9732) +4 other tests skip
>      * igt@kms_psr@pr-cursor-mmap-cpu:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#14544 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732) +4 other tests skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-rkl: SKIP (i915#5289) -> SKIP (i915#14544 / i915#5289)
>      * igt@kms_scaling_modes@scaling-mode-none:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555) -> SKIP (i915#3555) +1
>             other test skip
>      * igt@kms_vrr@flip-basic:
> 
>           * shard-rkl: SKIP (i915#15243 / i915#3555) -> SKIP (i915#14544 /
>             i915#15243 / i915#3555)
>      * igt@kms_vrr@max-min:
> 
>           * shard-rkl: SKIP (i915#9906) -> SKIP (i915#14544 / i915#9906)
>      * igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>           * shard-rkl: SKIP (i915#2436) -> SKIP (i915#14544 / i915#2436)
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3708) -> SKIP (i915#3708)
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8735 -> IGTPW_14489
> 
>    CI-20190529: 20190529
>    CI_DRM_17930: 241994730989320c926da9f2d0a5ec80b48f993d @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_14489: 14489
>    IGT_8735: 8735
