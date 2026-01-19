Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB27CCF2E5
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 11:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D2F10E244;
	Mon, 19 Jan 2026 11:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aNwNekjS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC92F10E244
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 11:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768821329; x=1800357329;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=NgB3Bs1G501QrPwqTgvYFF6GJX7XmOUHROKx0axYM8A=;
 b=aNwNekjS64RpubstpiBURz0eBdnzC2JoYN1El1YnSAm36DBGFJlqa9lW
 FlYDoz5iVZQA5pbn7RrMgOvQy+kV7NQHnGGIr1+aZIdV9OsZokbFrJNaR
 RtLwhTROh8j5POCjQ9wIpzw2wtCZV+J+jMKjmiD039uhCvMRQ+EFuOb4k
 /EHPS0yrYaWdDvOhX5/H6ezn4jG44s/MSxBIwMpdo6pQwYzGHQPr4sT4P
 LI1O6cgjdDmd7Vdmei46cc+D+XJap1e27EvuEUqVI9apYy5JEZ7XIFPNG
 OhB+URga5sIJ99bYJj4WbEGAeiTDskG388MxYITBi0MYQ54SL4DtCAsEI Q==;
X-CSE-ConnectionGUID: kaq/NDrYTZKCrItyDHGqjA==
X-CSE-MsgGUID: QxTs+LMFQsqrRQ4tNhJm1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80752487"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="80752487"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 03:15:29 -0800
X-CSE-ConnectionGUID: l00AizVaSly7tTFgc7iteQ==
X-CSE-MsgGUID: 3uNeuypfQXWmC0tUOBUpkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="205871893"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.56])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 03:15:28 -0800
Date: Mon, 19 Jan 2026 12:15:25 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 Add xe3p compute kernels and preemption support (rev4)
Message-ID: <bf4stgszxqjwfggrvw3ye5s62ogesr5tshu7vdlajvq6czlzmf@omaz66sb6ur6>
References: <20260116154636.204553-7-zbigniew.kempczynski@intel.com>
 <176859785212.162646.12751244172939330807@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176859785212.162646.12751244172939330807@a3b018990fe9>
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

On Fri, Jan 16, 2026 at 09:10:52PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add xe3p compute kernels and preemption support (rev4)          
>    URL:     https://patchwork.freedesktop.org/series/159522/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14358/index.html 
> 
>         CI Bug Log - changes from CI_DRM_17833_full -> IGTPW_14358_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_14358_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_14358_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14358/index.html
> 
> Participating hosts (9 -> 9)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_14358_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_mmap_offset@clear-via-pagefault:
>           * shard-mtlp: PASS -> DMESG-WARN +1 other test dmesg-warn

Changes in the series are not related to above dmesg warning.

--
Zbigniew


> 
> Known issues
> 
>    Here are the changes found in IGTPW_14358_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@crc32:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6230)
>      * igt@gem_ccs@ctrl-surf-copy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-dg2: PASS -> INCOMPLETE (i915#13356) +1 other test
>             incomplete
>      * igt@gem_close_race@multigpu-basic-threads:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_create@create-ext-set-pat:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8562)
>      * igt@gem_ctx_sseu@invalid-args:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#280)
>      * igt@gem_ctx_sseu@mmap-args:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#280)
>           * shard-rkl: NOTRUN -> SKIP (i915#280)
>           * shard-dg1: NOTRUN -> SKIP (i915#280)
>           * shard-tglu: NOTRUN -> SKIP (i915#280)
>           * shard-mtlp: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@in-flight-suspend:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#13390)
>      * igt@gem_exec_balancer@parallel:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4525) +1 other test skip
>      * igt@gem_exec_balancer@parallel-balancer:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4525) +2 other tests skip
>      * igt@gem_exec_balancer@parallel-bb-first:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_reloc@basic-cpu-read-active:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +2 other tests skip
>      * igt@gem_exec_reloc@basic-wc-gtt-active:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +2 other tests skip
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +2 other tests skip
>      * igt@gem_exec_reloc@basic-write-read:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +3 other tests skip
>      * igt@gem_exec_suspend@basic-s3@smem:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13196 / i915#13356) +1
>             other test incomplete
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#2190)
>      * igt@gem_lmem_swapping@heavy-verify-multi:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_lmem_swapping@parallel-multi:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@parallel-random-verify:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_media_vme:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#284)
>           * shard-dg2: NOTRUN -> SKIP (i915#284)
>           * shard-dg1: NOTRUN -> SKIP (i915#284)
>           * shard-tglu: NOTRUN -> SKIP (i915#284)
>      * igt@gem_mmap_gtt@basic-small-bo-tiledy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +5 other tests skip
>      * igt@gem_pread@exhaustion:
> 
>           * shard-tglu: NOTRUN -> WARN (i915#2658)
>      * igt@gem_pread@snoop:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +3 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +2 other tests skip
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-glk: NOTRUN -> WARN (i915#14702 / i915#2658)
>      * igt@gem_pwrite@basic-self:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +8 other tests skip
>      * igt@gem_pxp@create-protected-buffer:
> 
>           * shard-rkl: PASS -> SKIP (i915#4270)
>      * igt@gem_pxp@hw-rejects-pxp-context:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13398)
>      * igt@gem_pxp@protected-raw-src-copy-not-readible:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +1 other test skip
>      * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +1 other test
>             skip
>      * igt@gem_softpin@noreloc-s3:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13809)
>           * shard-rkl: PASS -> INCOMPLETE (i915#13809)
>      * igt@gem_tiled_partial_pwrite_pread@writes:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +1 other test skip
>      * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3282)
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880)
>           * shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4880)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_userptr_blits@readonly-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297)
>           * shard-rkl: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@relocations:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281 / i915#3297)
>           * shard-dg2: NOTRUN -> SKIP (i915#3281 / i915#3297)
>           * shard-dg1: NOTRUN -> SKIP (i915#3281 / i915#3297)
>      * igt@gem_userptr_blits@unsync-unmap-after-close:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>      * igt@gem_workarounds@suspend-resume:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13356 / i915#14586) +1
>             other test incomplete
>           * shard-rkl: PASS -> INCOMPLETE (i915#13356)
>      * igt@gem_workarounds@suspend-resume-context:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13356) +2 other tests
>             incomplete
>      * igt@gen7_exec_parse@chained-batch:
> 
>           * shard-rkl: NOTRUN -> SKIP +10 other tests skip
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-glk10: NOTRUN -> ABORT (i915#5566)
>      * igt@gen9_exec_parse@batch-zero-length:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#2527)
>      * igt@gen9_exec_parse@bb-secure:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +2 other tests
>             skip
>      * igt@gen9_exec_parse@secure-batches:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527)
>      * igt@i915_drm_fdinfo@busy-idle-check-all@vcs1:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11527) +5 other tests skip
>      * igt@i915_module_load@reload-no-display:
> 
>           * shard-dg2: PASS -> DMESG-WARN (i915#13029 / i915#14545)
>           * shard-dg1: PASS -> DMESG-WARN (i915#13029 / i915#14545)
>      * igt@i915_pm_freq_api@freq-reset:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#8399)
>           * shard-rkl: NOTRUN -> SKIP (i915#8399)
>      * igt@i915_pm_rc6_residency@rc6-idle:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14498)
>      * igt@i915_pm_rpm@system-suspend-execbuf:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#4423) +1 other test
>             dmesg-warn
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6245)
>           * shard-dg1: NOTRUN -> SKIP (i915#6245)
>      * igt@intel_hwmon@hwmon-read:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7707)
>           * shard-tglu: NOTRUN -> SKIP (i915#7707)
>      * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-glk10: NOTRUN -> SKIP (i915#1769)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1769 / i915#3555)
>           * shard-tglu: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +7 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#5286)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-mtlp: PASS -> FAIL (i915#5138)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5286) +1 other test skip
>      * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3828)
>      * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3828) +1 other test skip
>      * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3828)
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638)
>      * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
> 
>           * shard-dg2: NOTRUN -> SKIP +3 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3638)
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538) +1 other test skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-mtlp: NOTRUN -> SKIP +5 other tests skip
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +1 other test
>             skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12313) +3 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#14544 / i915#6095)
>             +1 other test skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#6095) +1 other test
>             skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-c-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +14 other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +107 other
>             tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12313)
>           * shard-mtlp: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +55 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12805)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +171 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6095) +24 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6095) +29 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +79 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#6095) +31 other
>             tests skip
>      * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-glk10: NOTRUN -> SKIP +297 other tests skip
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11151 / i915#7828) +2 other
>             tests skip
>      * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#7828) +4 other tests
>             skip
>      * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11151 / i915#7828) +3 other tests
>             skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-storm:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#14544 / i915#7828)
>      * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11151 / i915#7828) +4 other tests
>             skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#11151 / i915#7828) +3 other
>             tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11151 / i915#7828) +9 other
>             tests skip
>      * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15523) +3 other tests skip
>      * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15330)
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15330 / i915#3299)
>           * shard-rkl: NOTRUN -> SKIP (i915#15330 / i915#3116)
>           * shard-dg1: NOTRUN -> SKIP (i915#15330 / i915#3299)
>           * shard-tglu: NOTRUN -> SKIP (i915#15330 / i915#3116 / i915#3299)
>           * shard-mtlp: NOTRUN -> SKIP (i915#15330 / i915#3299)
>      * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15330) +1 other test skip
>      * igt@kms_content_protection@legacy:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118 /
>             i915#9424)
>           * shard-mtlp: NOTRUN -> SKIP (i915#6944 / i915#9424)
>           * shard-dg2: NOTRUN -> SKIP (i915#6944 / i915#7118 / i915#9424)
>           * shard-rkl: NOTRUN -> SKIP (i915#6944 / i915#7118 / i915#9424)
>           * shard-dg1: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#9424)
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#9424) +1 other test
>             skip
>      * igt@kms_content_protection@srm:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6944 / i915#7118)
>      * igt@kms_content_protection@suspend-resume@pipe-a-dp-3:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#7173) +1 other test fail
>      * igt@kms_cursor_crc@cursor-offscreen-32x10:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814) +1 other test
>             skip
>      * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#13566) +1 other test fail
>      * igt@kms_cursor_crc@cursor-onscreen-64x21:
> 
>           * shard-rkl: PASS -> FAIL (i915#13566) +2 other tests fail
>      * igt@kms_cursor_crc@cursor-random-32x10:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3555)
>      * igt@kms_cursor_crc@cursor-random-32x32:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-random-64x21:
> 
>           * shard-tglu: PASS -> FAIL (i915#13566) +1 other test fail
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#13566) +1 other test fail
>      * igt@kms_cursor_crc@cursor-sliding-64x21:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13046 / i915#5354)
>           * shard-mtlp: NOTRUN -> SKIP (i915#9809)
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#15588 / i915#2346)
>      * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9723)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-dg2: PASS -> SKIP (i915#3555)
>      * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_dp_link_training@non-uhbr-mst:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13749) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#13749)
>      * igt@kms_dp_link_training@uhbr-mst:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13748)
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_flip@2x-blocking-absolute-wf_vblank:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#9934) +10 other
>             tests skip
>      * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9934)
>      * igt@kms_flip@2x-flip-vs-dpms:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +1 other test skip
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3637 / i915#9934) +1 other
>             test skip
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12745 / i915#4839)
>           * shard-rkl: PASS -> INCOMPLETE (i915#6113)
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12745)
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
> 
>           * shard-rkl: NOTRUN -> INCOMPLETE (i915#6113)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672 / i915#3555)
>           * shard-dg1: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672)
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672)
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672) +5 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15573) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2587 / i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2672 / i915#3555) +5 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2587 / i915#2672) +1 other
>             test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672 / i915#3555 / i915#8813) +1
>             other test skip
>           * shard-dg2: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other test
>             skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +8 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +3 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-dg1: NOTRUN -> SKIP +23 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +25 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-cpu:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15574) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15574) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-tglu-1: NOTRUN -> INCOMPLETE (i915#10056)
>      * igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +21 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-pwrite:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15574) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15102 / i915#3023) +8 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15102) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9766)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15102) +29 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15102) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#15102) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#15102) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15102 / i915#3458) +3 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15102 / i915#3458) +6 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#1825) +2 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +10 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-tglu: NOTRUN -> SKIP +78 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15574) +1 other test skip
>      * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-pwrite:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15574) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#15574) +1 other test skip
>      * igt@kms_frontbuffer_tracking@psr-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15102 / i915#3023)
>      * igt@kms_hdr@bpc-switch:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>      * igt@kms_joiner@basic-big-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15460)
>      * igt@kms_joiner@basic-force-big-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15459)
>      * igt@kms_joiner@basic-max-non-joiner:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13688)
>      * igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15458)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4816)
>           * shard-dg2: NOTRUN -> SKIP (i915#4816)
>           * shard-rkl: NOTRUN -> SKIP (i915#1839 / i915#4816)
>           * shard-dg1: NOTRUN -> SKIP (i915#1839)
>           * shard-tglu: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#12756 / i915#13409 /
>             i915#13476) +1 other test incomplete
>      * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13026)
>      * igt@kms_plane_alpha_blend@alpha-basic:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#12178)
>      * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#7862) +1 other test fail
>      * igt@kms_plane_alpha_blend@alpha-opaque-fb:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10647 / i915#12169)
>      * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10647) +1 other test fail
>      * igt@kms_plane_multiple@2x-tiling-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@2x-tiling-y:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12343)
>      * igt@kms_pm_backlight@fade-with-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9812)
>           * shard-rkl: NOTRUN -> SKIP (i915#5354)
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_pm_rpm@dpms-non-lpsp:
> 
>           * shard-dg1: PASS -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-dg2: PASS -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-rkl: PASS -> SKIP (i915#15073) +3 other tests skip
>      * igt@kms_pm_rpm@package-g7:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15403)
>      * igt@kms_pm_rpm@system-suspend-idle:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE (i915#14419)
>      * igt@kms_pm_rpm@system-suspend-modeset:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#14419)
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11520) +8 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#11520) +7 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12316) +1 other test skip
>      * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>           * shard-snb: NOTRUN -> SKIP (i915#11520) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>      * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11520) +2 other tests skip
>      * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11520) +2 other tests skip
>      * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
> 
>           * shard-glk10: NOTRUN -> SKIP (i915#11520) +9 other tests skip
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4348)
>           * shard-dg2: NOTRUN -> SKIP (i915#9683)
>           * shard-rkl: NOTRUN -> SKIP (i915#9683)
>           * shard-dg1: NOTRUN -> SKIP (i915#9683)
>           * shard-tglu: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-pr-primary-mmap-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#14544 / i915#9732)
>      * igt@kms_psr@fbc-psr-primary-render:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +5 other tests
>             skip
>      * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
> 
>           * shard-glk: NOTRUN -> SKIP +246 other tests skip
>      * igt@kms_psr@fbc-psr2-no-drrs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +22 other tests skip
>      * igt@kms_psr@psr-cursor-render:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +9 other tests
>             skip
>      * igt@kms_psr@psr2-cursor-plane-onoff:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +1 other test
>             skip
>      * igt@kms_psr@psr2-sprite-mmap-cpu:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9732) +5 other tests skip
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#15500)
>      * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5289)
>           * shard-tglu: NOTRUN -> SKIP (i915#5289)
>           * shard-mtlp: NOTRUN -> SKIP (i915#5289)
>           * shard-dg2: NOTRUN -> SKIP (i915#5190)
>      * igt@kms_rotation_crc@sprite-rotation-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12755)
>           * shard-mtlp: NOTRUN -> SKIP (i915#12755)
>      * igt@kms_scaling_modes@scaling-mode-full:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>      * igt@kms_setmode@basic:
> 
>           * shard-snb: PASS -> FAIL (i915#15106) +2 other tests fail
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10959)
>      * igt@kms_tv_load_detect@load-detect:
> 
>           * shard-snb: NOTRUN -> SKIP +64 other tests skip
>      * igt@kms_vrr@flip-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15243 / i915#3555)
>      * igt@perf_pmu@module-unload:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#14433)
>           * shard-glk10: NOTRUN -> FAIL (i915#14433)
>      * igt@perf_pmu@render-node-busy-idle@vcs1:
> 
>           * shard-mtlp: PASS -> FAIL (i915#4349) +5 other tests fail
>      * igt@prime_vgem@basic-fence-flip:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3708)
>           * shard-dg2: NOTRUN -> SKIP (i915#3708)
>      * igt@sriov_basic@enable-vfs-autoprobe-on:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9917)
> 
>     Possible fixes
> 
>      * igt@gem_exec_big@single:
> 
>           * shard-mtlp: DMESG-FAIL (i915#15478) -> PASS
>      * igt@i915_module_load@load:
> 
>           * shard-snb: (PASS, PASS, PASS, PASS, PASS, SKIP, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS) -> (PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS)
>           * shard-dg2: (PASS, PASS, SKIP, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS) (i915#14785) -> (PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS)
>      * igt@i915_pm_rpm@system-suspend-execbuf:
> 
>           * shard-rkl: INCOMPLETE (i915#13356) -> PASS
>      * igt@i915_suspend@basic-s2idle-without-i915:
> 
>           * shard-tglu: INCOMPLETE (i915#4817) -> PASS
>      * igt@i915_suspend@fence-restore-tiled2untiled:
> 
>           * shard-rkl: ABORT (i915#15140) -> PASS
>      * igt@kms_color@deep-color:
> 
>           * shard-dg2: SKIP (i915#12655 / i915#3555) -> PASS
>      * igt@kms_cursor_crc@cursor-random-256x85:
> 
>           * shard-rkl: FAIL (i915#13566) -> PASS +2 other tests pass
>           * shard-tglu: FAIL (i915#13566) -> PASS +1 other test pass
>      * igt@kms_dp_link_training@non-uhbr-sst:
> 
>           * shard-dg2: SKIP (i915#13749) -> PASS
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-rkl: SKIP (i915#3555 / i915#8228) -> PASS
>      * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
> 
>           * shard-rkl: INCOMPLETE (i915#14412) -> PASS +1 other test pass
>           * shard-glk: INCOMPLETE (i915#13026) -> PASS
>      * igt@kms_pm_rpm@dpms-non-lpsp:
> 
>           * shard-dg2: SKIP (i915#15073) -> PASS
>      * igt@kms_pm_rpm@i2c:
> 
>           * shard-dg1: DMESG-WARN (i915#4423) -> PASS +1 other test pass
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-rkl: SKIP (i915#15073) -> PASS
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-dg1: SKIP (i915#15073) -> PASS +1 other test pass
>      * igt@kms_setmode@basic:
> 
>           * shard-dg2: FAIL (i915#15106) -> PASS
>      * igt@perf@gen12-group-concurrent-oa-buffer-read:
> 
>           * shard-dg1: FAIL (i915#10538) -> PASS
> 
>     Warnings
> 
>      * igt@api_intel_bb@blit-reloc-keep-cache:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8411) -> SKIP (i915#8411) +1
>             other test skip
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * shard-rkl: SKIP (i915#8411) -> SKIP (i915#14544 / i915#8411)
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9323) -> SKIP (i915#9323)
>      * igt@gem_ccs@large-ctrl-surf-copy:
> 
>           * shard-rkl: SKIP (i915#13008) -> SKIP (i915#13008 / i915#14544)
>      * igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>           * shard-rkl: SKIP (i915#6335) -> SKIP (i915#14544 / i915#6335)
>      * igt@gem_exec_reloc@basic-gtt-cpu:
> 
>           * shard-rkl: SKIP (i915#3281) -> SKIP (i915#14544 / i915#3281) +2
>             other tests skip
>      * igt@gem_exec_reloc@basic-wc-read-noreloc:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3281) -> SKIP (i915#3281) +4
>             other tests skip
>      * igt@gem_lmem_swapping@verify:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4613) -> SKIP (i915#4613) +2
>             other tests skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3282) -> SKIP (i915#3282) +1
>             other test skip
>      * igt@gem_pread@display:
> 
>           * shard-rkl: SKIP (i915#3282) -> SKIP (i915#14544 / i915#3282) +1
>             other test skip
>      * igt@gem_userptr_blits@forbidden-operations:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3282 / i915#3297) -> SKIP
>             (i915#3282 / i915#3297)
>      * igt@gen9_exec_parse@bb-chained:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2527) -> SKIP (i915#2527) +2
>             other tests skip
>      * igt@gen9_exec_parse@bb-start-out:
> 
>           * shard-rkl: SKIP (i915#2527) -> SKIP (i915#14544 / i915#2527) +1
>             other test skip
>      * igt@i915_module_load@resize-bar:
> 
>           * shard-rkl: SKIP (i915#6412) -> SKIP (i915#14544 / i915#6412)
>      * igt@i915_query@test-query-geometry-subslices:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#5723) -> SKIP (i915#5723)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1769 / i915#3555) -> SKIP
>             (i915#1769 / i915#3555)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#5286) -> SKIP (i915#5286) +4
>             other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
> 
>           * shard-rkl: SKIP (i915#5286) -> SKIP (i915#14544 / i915#5286)
>      * igt@kms_big_fb@linear-16bpp-rotate-90:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3638) -> SKIP (i915#3638) +1
>             other test skip
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
> 
>           * shard-rkl: SKIP -> SKIP (i915#14544) +6 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
> 
>           * shard-rkl: SKIP (i915#12313 / i915#14544) -> SKIP (i915#12313)
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6095) -> SKIP (i915#6095) +5
>             other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>           * shard-rkl: SKIP (i915#12805 / i915#14544) -> SKIP (i915#12805)
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#14544 / i915#6095) -> SKIP
>             (i915#14098 / i915#6095) +7 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#14098 /
>             i915#14544 / i915#6095) +5 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#6095) -> SKIP (i915#14544 / i915#6095) +5
>             other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> 
>           * shard-rkl: SKIP (i915#12313) -> SKIP (i915#12313 / i915#14544)
>      * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#14544 / i915#7828) -> SKIP
>             (i915#11151 / i915#7828) +5 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#7828) -> SKIP (i915#11151 /
>             i915#14544 / i915#7828) +2 other tests skip
>      * igt@kms_content_protection@atomic:
> 
>           * shard-dg2: FAIL (i915#7173) -> SKIP (i915#6944 / i915#7118 /
>             i915#9424)
>      * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
> 
>           * shard-rkl: SKIP (i915#15330) -> SKIP (i915#14544 / i915#15330)
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-dg2: SKIP (i915#6944 / i915#9424) -> FAIL (i915#7173)
>           * shard-rkl: SKIP (i915#14544 / i915#6944 / i915#9424) -> SKIP
>             (i915#6944 / i915#9424)
>      * igt@kms_content_protection@lic-type-0-hdcp14:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6944) -> SKIP (i915#6944)
>      * igt@kms_content_protection@suspend-resume:
> 
>           * shard-dg2: SKIP (i915#6944) -> FAIL (i915#7173)
>      * igt@kms_content_protection@type1:
> 
>           * shard-dg2: SKIP (i915#6944 / i915#7118 / i915#9424) -> SKIP
>             (i915#6944 / i915#7118 / i915#7162 / i915#9424)
>      * igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>           * shard-rkl: SKIP (i915#13049 / i915#14544) -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>           * shard-dg1: SKIP (i915#13049) -> SKIP (i915#13049 / i915#4423)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4103) -> SKIP (i915#4103) +1
>             other test skip
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP +6 other tests skip
>      * igt@kms_dp_link_training@uhbr-sst:
> 
>           * shard-rkl: SKIP (i915#13748 / i915#14544) -> SKIP (i915#13748)
>      * igt@kms_flip@2x-blocking-wf_vblank:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9934) -> SKIP (i915#9934) +4
>             other tests skip
>      * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>           * shard-rkl: SKIP (i915#9934) -> SKIP (i915#14544 / i915#9934) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x@pipe-a-valid-mode:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15573) -> SKIP (i915#15573) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2672 / i915#3555) -> SKIP
>             (i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2672) -> SKIP (i915#2672)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>           * shard-dg1: SKIP (i915#2587 / i915#2672 / i915#3555 / i915#4423)
>             -> SKIP (i915#2587 / i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: SKIP (i915#2587 / i915#2672 / i915#4423) -> SKIP
>             (i915#2587 / i915#2672)
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
> 
>           * shard-rkl: SKIP (i915#2672 / i915#3555) -> SKIP (i915#14544 /
>             i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: SKIP (i915#2672) -> SKIP (i915#14544 / i915#2672)
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-rkl: SKIP (i915#1825) -> SKIP (i915#14544 / i915#1825) +6
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#15102 / i915#3458) -> SKIP
>             (i915#15102 / i915#3458) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite:
> 
>           * shard-rkl: SKIP (i915#15102 / i915#3023) -> SKIP (i915#14544 /
>             i915#15102 / i915#3023) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc:
> 
>           * shard-rkl: SKIP (i915#15574) -> SKIP (i915#14544 / i915#15574) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-dg1: SKIP (i915#4423 / i915#5439) -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
> 
>           * shard-rkl: SKIP (i915#15102) -> SKIP (i915#14544 / i915#15102)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
> 
>           * shard-dg2: SKIP (i915#15102 / i915#3458) -> SKIP (i915#10433 /
>             i915#15102 / i915#3458)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15102 / i915#3023) -> SKIP
>             (i915#15102 / i915#3023) +11 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1825) -> SKIP (i915#1825) +12
>             other tests skip
>      * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-pwrite:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15574) -> SKIP (i915#15574) +3
>             other tests skip
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-rkl: SKIP (i915#1187 / i915#12713) -> SKIP (i915#12713)
>      * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>           * shard-rkl: SKIP (i915#13522) -> SKIP (i915#13522 / i915#14544)
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-rkl: SKIP (i915#14259) -> SKIP (i915#14259 / i915#14544)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
> 
>           * shard-rkl: SKIP (i915#15329) -> SKIP (i915#14544 / i915#15329) +3
>             other tests skip
>      * igt@kms_pm_dc@dc9-dpms:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4281) -> SKIP (i915#4281)
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
> 
>           * shard-rkl: SKIP (i915#11520) -> SKIP (i915#11520 / i915#14544)
>      * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
> 
>           * shard-rkl: SKIP (i915#11520 / i915#14544) -> SKIP (i915#11520) +4
>             other tests skip
>      * igt@kms_psr@psr-cursor-plane-move:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 /
>             i915#14544 / i915#9732) +4 other tests skip
>      * igt@kms_psr@psr2-suspend:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#14544 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732) +9 other tests skip
>      * igt@kms_scaling_modes@scaling-mode-full:
> 
>           * shard-rkl: SKIP (i915#3555) -> SKIP (i915#14544 / i915#3555) +1
>             other test skip
>      * igt@kms_scaling_modes@scaling-mode-full-aspect:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555) -> SKIP (i915#3555) +1
>             other test skip
>      * igt@kms_vrr@flip-basic:
> 
>           * shard-rkl: SKIP (i915#15243 / i915#3555) -> SKIP (i915#14544 /
>             i915#15243 / i915#3555)
>      * igt@kms_vrr@flipline:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15243 / i915#3555) -> SKIP
>             (i915#15243 / i915#3555)
>      * igt@kms_vrr@lobf:
> 
>           * shard-rkl: SKIP (i915#11920 / i915#14544) -> SKIP (i915#11920)
>      * igt@sriov_basic@enable-vfs-bind-unbind-each:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9917) -> SKIP (i915#9917)
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8704 -> IGTPW_14358
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_17833: eaf341ec50e661b2c81347e4bb9f3348b7fea5b9 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_14358: 14358
>    IGT_8704: 8704
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
