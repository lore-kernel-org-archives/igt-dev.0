Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1469E7E358
	for <igt-dev@archiver.kernel.org>; Fri,  3 Apr 2026 09:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F6D10F47A;
	Fri,  3 Apr 2026 09:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IbCRV94P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BAB10F47A;
 Fri,  3 Apr 2026 09:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775207854; x=1806743854;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=xz8itWrPFPnw2jf7PuOZScidJ4XUaWbIYCJlPSFKN3w=;
 b=IbCRV94PdjnrtxHTs+/xGSk+sudp/oriB9Wb8Z8lgIWCgiljFPk331W3
 +R9Yq11IKD4ZZGHlXBnDXOZEvDJbbEPrwcwsgCyJaK+/bg1vG3v4HPiW/
 sRYStQ2kFTBZd4vxtAWVS4HQGwpAWsLQw1P/kLWSCr4aN9OxGqnuMQa4N
 keYuKKOyaAdcYSZ90N1Qc33zLTHyOv0TipTN+SzSi1w2Iw1v+uWDSkGMe
 Si8yj3ztla7xQmDlYnnQt5K2W992UJPA6nAdyJx6eOb5l6eV3ZTcSxybw
 8rh2r1q6lDVjr84xKMAfG2YV4Uc7NjUDqNILVkfYLM/yebBr/fpO6MuWz w==;
X-CSE-ConnectionGUID: AXFSrZHmSMKy4iH5wiOBcw==
X-CSE-MsgGUID: c8RvwXNhSZ2xRfw2er9cxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76163848"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="76163848"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 02:17:34 -0700
X-CSE-ConnectionGUID: I7Ckt0B9SheVJvsJwl/g5w==
X-CSE-MsgGUID: dMbLWpI1SNSJqBBpTIQwdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="227460121"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 02:17:32 -0700
Date: Fri, 3 Apr 2026 11:17:30 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
cc: I915-ci-infra@lists.freedesktop.org, 
 =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_kms?=
 =?UTF-8?Q?=5Fflip=3A_limit_number_of_subtests_run_=28rev13=29?=
In-Reply-To: <177520442434.430638.12134408073323973040@a3b018990fe9>
Message-ID: <0a0d2cc4-13e3-1d2a-bd1f-df0d12dca4af@intel.com>
References: <20260330075508.1003899-1-michal.grzelak@intel.com>
 <177520442434.430638.12134408073323973040@a3b018990fe9>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-217032168-1775207852=:1818500"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-217032168-1775207852=:1818500
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 3 Apr 2026, Patchwork wrote:
> Patch Details
> Series:
> kms_flip: limit number of subtests run (rev13)
> URL:
> https://patchwork.freedesktop.org/series/161389/
> State:
> failure
> Details:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14918/index.html
>                                             CI Bug Log - changes from CI_DRM_18270_full -> IGTPW_14918_full
> 
> SUMMARY
> 
> FAILURE
> 
> Serious unknown changes coming with IGTPW_14918_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_14918_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14918/index.html
> 
> PARTICIPATING HOSTS (10 -> 10)
> 
> No changes in participating hosts
> 
> POSSIBLE NEW ISSUES
> 
> Here are the unknown changes that may have been introduced in IGTPW_14918_full:
>
>   IGT changes
>
>     Possible regressions
>
>  *  igt@i915_selftest@live:
>      +  shard-dg1: PASS -> ABORT

unrelated to the change.

BR,
Michał

> 
> NEW TESTS
> 
> New tests have been introduced between CI_DRM_18270_full and IGTPW_14918_full:
>
>   New IGT tests (1)
>
>  *  igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
>      +  Statuses : 1 incomplete(s)
>      +  Exec time: [0.0] s
> 
> KNOWN ISSUES
> 
> Here are the changes found in IGTPW_14918_full that come from known issues:
>
>   IGT changes
>
>     Issues hit
>
>  * 
>
>     igt@api_intel_bb@object-reloc-keep-cache:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#8411)
>  * 
>
>     igt@api_intel_bb@object-reloc-purge-cache:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#8411)
>  * 
>
>     igt@device_reset@cold-reset-bound:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#11078)
>  * 
>
>     igt@gem_bad_reloc@negative-reloc-lut:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#3281) +4 other tests skip
>  * 
>
>     igt@gem_basic@multigpu-create-close:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#7697)
>  * 
>
>     igt@gem_ccs@block-copy-compressed:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#9323)
>  * 
>
>     igt@gem_ccs@block-multicopy-inplace:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#9323)
>  * 
>
>     igt@gem_ccs@large-ctrl-surf-copy:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#13008)
>  * 
>
>     igt@gem_ccs@suspend-resume:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#9323)
>  * 
>
>     igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
>
>      +  shard-dg2: PASS -> INCOMPLETE (i915#12392 / i915#13356)
>  * 
>
>     igt@gem_close_race@multigpu-basic-threads:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#7697)
>  * 
>
>     igt@gem_ctx_isolation@preservation-s3@bcs0:
>
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#13356) +1 other test incomplete
>  * 
>
>     igt@gem_ctx_param@set-priority-not-supported:
>
>      +  shard-dg1: NOTRUN -> SKIP +20 other tests skip
>  * 
>
>     igt@gem_ctx_persistence@engines-mixed:
>
>      +  shard-snb: NOTRUN -> SKIP (i915#1099) +1 other test skip
>  * 
>
>     igt@gem_ctx_sseu@mmap-args:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#280)
>  * 
>
>     igt@gem_eio@in-flight-suspend:
>
>      +  shard-rkl: PASS -> INCOMPLETE (i915#13390)
>  * 
>
>     igt@gem_eio@kms:
>
>      +  shard-rkl: PASS -> DMESG-WARN (i915#13363)
>      +  shard-tglu: PASS -> DMESG-WARN (i915#13363)
>  * 
>
>     igt@gem_exec_balancer@parallel-bb-first:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#4525)
>  * 
>
>     igt@gem_exec_balancer@parallel-ordering:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#4525) +1 other test skip
>  * 
>
>     igt@gem_exec_capture@capture-invisible:
>
>      +  shard-glk10: NOTRUN -> SKIP (i915#6334) +1 other test skip
>  * 
>
>     igt@gem_exec_flush@basic-wb-rw-before-default:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +1 other test skip
>  * 
>
>     igt@gem_exec_params@secure-non-master:
>
>      +  shard-dg2: NOTRUN -> SKIP +7 other tests skip
>  * 
>
>     igt@gem_exec_reloc@basic-gtt-cpu:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3281) +6 other tests skip
>  * 
>
>     igt@gem_exec_reloc@basic-gtt-wc:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3281) +3 other tests skip
>  * 
>
>     igt@gem_exec_reloc@basic-wc:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3281) +6 other tests skip
>  * 
>
>     igt@gem_exec_reloc@basic-wc-gtt-active:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3281)
>  * 
>
>     igt@gem_exec_schedule@preempt-queue:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#4812)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#4537 / i915#4812)
>  * 
>
>     igt@gem_exec_schedule@reorder-wide:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4537 / i915#4812) +1 other test skip
>  * 
>
>     igt@gem_exec_suspend@basic-s0:
>
>      +  shard-dg2: PASS -> INCOMPLETE (i915#13356) +1 other test incomplete
>  * 
>
>     igt@gem_exec_suspend@basic-s3:
>
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#13196 / i915#13356) +1 other test incomplete
>  * 
>
>     igt@gem_fenced_exec_thrash@no-spare-fences-busy:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4860)
>  * 
>
>     igt@gem_huc_copy@huc-copy:
>
>      +  shard-glk: NOTRUN -> SKIP (i915#2190)
>  * 
>
>     igt@gem_lmem_swapping@heavy-multi:
>
>      +  shard-glk: NOTRUN -> SKIP (i915#4613)
>  * 
>
>     igt@gem_lmem_swapping@parallel-random-verify:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#4613) +1 other test skip
>  * 
>
>     igt@gem_lmem_swapping@parallel-random-verify-ccs:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#4613) +1 other test skip
>  * 
>
>     igt@gem_lmem_swapping@smem-oom:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>  * 
>
>     igt@gem_lmem_swapping@verify-random-ccs:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#4613) +1 other test skip
>  * 
>
>     igt@gem_media_vme:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#284)
>  * 
>
>     igt@gem_mmap@short-mmap:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4083) +3 other tests skip
>  * 
>
>     igt@gem_mmap_gtt@basic-small-bo-tiledx:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#4077) +2 other tests skip
>  * 
>
>     igt@gem_mmap_wc@bad-offset:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>  * 
>
>     igt@gem_mmap_wc@read:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#4083) +3 other tests skip
>  * 
>
>     igt@gem_partial_pwrite_pread@reads:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3282) +3 other tests skip
>  * 
>
>     igt@gem_partial_pwrite_pread@writes-after-reads:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3282) +4 other tests skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#3282) +2 other tests skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3282) +2 other tests skip
>  * 
>
>     igt@gem_pread@exhaustion:
>
>      +  shard-glk: NOTRUN -> WARN (i915#2658)
>  * 
>
>     igt@gem_pwrite@basic-exhaustion:
>
>      +  shard-glk: NOTRUN -> WARN (i915#14702 / i915#2658)
>  * 
>
>     igt@gem_pxp@hw-rejects-pxp-buffer:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#13398) +1 other test skip
>  * 
>
>     igt@gem_pxp@regular-baseline-src-copy-readible:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4270) +5 other tests skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#4270) +1 other test skip
>  * 
>
>     igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
>
>      +  shard-glk: NOTRUN -> SKIP +306 other tests skip
>  * 
>
>     igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +3 other tests skip
>  * 
>
>     igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#8428) +1 other test skip
>  * 
>
>     igt@gem_set_tiling_vs_pwrite:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4079)
>  * 
>
>     igt@gem_tiled_blits@basic:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#4077) +5 other tests skip
>  * 
>
>     igt@gem_tiled_pread_basic@basic:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15657)
>  * 
>
>     igt@gem_unfence_active_buffers:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4879)
>  * 
>
>     igt@gem_userptr_blits@dmabuf-sync:
>
>      +  shard-glk: NOTRUN -> SKIP (i915#3323)
>  * 
>
>     igt@gem_userptr_blits@forbidden-operations:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3282 / i915#3297)
>  * 
>
>     igt@gem_userptr_blits@map-fixed-invalidate-overlap:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880) +1 other test skip
>  * 
>
>     igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3297)
>  * 
>
>     igt@gem_userptr_blits@readonly-pwrite-unsync:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3297)
>  * 
>
>     igt@gem_userptr_blits@sd-probe:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4958)
>      +  shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4958)
>  * 
>
>     igt@gen7_exec_parse@bitmasks:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544)
>  * 
>
>     igt@gen9_exec_parse@allowed-all:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 other test skip
>  * 
>
>     igt@gen9_exec_parse@basic-rejected-ctx-param:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 other test skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#2856) +1 other test skip
>  * 
>
>     igt@gen9_exec_parse@bb-secure:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#2856) +3 other tests skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#2527) +2 other tests skip
>  * 
>
>     igt@gen9_exec_parse@bb-start-far:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#2527) +2 other tests skip
>  * 
>
>     igt@i915_drm_fdinfo@busy@rcs0:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#14073) +11 other tests skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#14073) +13 other tests skip
>  * 
>
>     igt@i915_drm_fdinfo@busy@vecs1:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#14073) +23 other tests skip
>  * 
>
>     igt@i915_fb_tiling@basic-x-tiling:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#13786)
>  * 
>
>     igt@i915_module_load@fault-injection@__uc_init:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15479) +4 other tests skip
>  * 
>
>     igt@i915_module_load@fault-injection@intel_connector_register:
>
>      +  shard-rkl: NOTRUN -> ABORT (i915#15342) +1 other test abort
>      +  shard-glk: NOTRUN -> ABORT (i915#15342) +1 other test abort
>  * 
>
>     igt@i915_pm_freq_api@freq-reset:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#8399)
>      +  shard-tglu: NOTRUN -> SKIP (i915#8399)
>  * 
>
>     igt@i915_pm_freq_mult@media-freq@gt0:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#6590) +1 other test skip
>  * 
>
>     igt@i915_pm_rps@min-max-config-loaded:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#11681 / i915#6621)
>  * 
>
>     igt@i915_pm_rps@waitboost:
>
>      +  shard-mtlp: PASS -> FAIL (i915#15365)
>  * 
>
>     igt@i915_query@hwconfig_table:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#6245)
>  * 
>
>     igt@i915_selftest@live@gem_contexts:
>
>      +  shard-dg1: PASS -> ABORT (i915#15433)
>  * 
>
>     igt@i915_suspend@basic-s2idle-without-i915:
>
>      +  shard-dg2: NOTRUN -> ABORT (i915#15131)
>  * 
>
>     igt@i915_suspend@basic-s3-without-i915:
>
>      +  shard-tglu: NOTRUN -> INCOMPLETE (i915#4817 / i915#7443)
>  * 
>
>     igt@i915_suspend@fence-restore-untiled:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4077) +9 other tests skip
>  * 
>
>     igt@i915_suspend@forcewake:
>
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#4817) +2 other tests incomplete
>  * 
>
>     igt@i915_suspend@sysfs-reader:
>
>      +  shard-glk: PASS -> INCOMPLETE (i915#4817)
>  * 
>
>     igt@kms_addfb_basic@addfb25-modifier-no-flag:
>
>      +  shard-dg1: PASS -> DMESG-WARN (i915#4423)
>  * 
>
>     igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#4212)
>      +  shard-dg2: NOTRUN -> SKIP (i915#4212)
>      +  shard-dg1: NOTRUN -> SKIP (i915#4212)
>  * 
>
>     igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#12454 / i915#12712)
>  * 
>
>     igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:
>
>      +  shard-glk: PASS -> FAIL (i915#14888) +1 other test fail
>  * 
>
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#9531)
>  * 
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>
>      +  shard-dg2: NOTRUN -> FAIL (i915#5956) +1 other test fail
>  * 
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      +  shard-dg1: NOTRUN -> SKIP (i915#1769 / i915#3555)
>  * 
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>
>      +  shard-mtlp: PASS -> FAIL (i915#15733 / i915#5138)
>  * 
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-0:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286)
>  * 
>
>     igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>  * 
>
>     igt@kms_big_fb@4-tiled-addfb-size-overflow:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#5286)
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>  * 
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>  * 
>
>     igt@kms_big_fb@linear-16bpp-rotate-270:
>
>      +  shard-tglu: NOTRUN -> SKIP +49 other tests skip
>  * 
>
>     igt@kms_big_fb@linear-64bpp-rotate-90:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3638) +5 other tests skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#3638) +1 other test skip
>  * 
>
>     igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#3828)
>  * 
>
>     igt@kms_big_fb@y-tiled-8bpp-rotate-180:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +10 other tests skip
>  * 
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#4538) +6 other tests skip
>  * 
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>      +  shard-mtlp: NOTRUN -> SKIP +14 other tests skip
>  * 
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#6095) +238 other tests skip
>  * 
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#6095) +44 other tests skip
>  * 
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095) +1 other test skip
>  * 
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#6095) +47 other tests skip
>  * 
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#6095) +12 other tests skip
>  * 
>
>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#14544 / i915#6095) +8 other tests skip
>  * 
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#6095) +69 other tests skip
>  * 
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-edp-1:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#6095) +24 other tests skip
>  * 
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#12313)
>  * 
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +121 other tests skip
>  * 
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#6095) +78 other tests skip
>  * 
>
>     igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1:
>
>      +  shard-glk11: NOTRUN -> SKIP +119 other tests skip
>  * 
>
>     igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2:
>
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#15582)
>  * 
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#12313)
>  * 
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#6095) +56 other tests skip
>  * 
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#3742)
>  * 
>
>     igt@kms_chamelium_audio@dp-audio:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#11151 / i915#7828) +5 other tests skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#11151 / i915#7828) +3 other tests skip
>  * 
>
>     igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#11151 / i915#7828) +3 other tests skip
>  * 
>
>     igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#11151 / i915#7828) +7 other tests skip
>  * 
>
>     igt@kms_chamelium_hpd@vga-hpd-fast:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#7828) +9 other tests skip
>  * 
>
>     igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#11151 / i915#7828) +4 other tests skip
>  * 
>
>     igt@kms_content_protection@atomic:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#15865)
>  * 
>
>     igt@kms_content_protection@atomic-dpms-hdcp14:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#15865)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#15865)
>  * 
>
>     igt@kms_content_protection@dp-mst-type-0:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#15330 / i915#3116 / i915#3299)
>  * 
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15330 / i915#3299)
>  * 
>
>     igt@kms_content_protection@mei-interface:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15865) +2 other tests skip
>  * 
>
>     igt@kms_content_protection@suspend-resume:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15865) +1 other test skip
>  * 
>
>     igt@kms_content_protection@uevent:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#15865)
>  * 
>
>     igt@kms_cursor_crc@cursor-offscreen-32x10:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814)
>  * 
>
>     igt@kms_cursor_crc@cursor-onscreen-256x85:
>
>      +  shard-tglu-1: NOTRUN -> FAIL (i915#13566) +1 other test fail
>  * 
>
>     igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
>
>      +  shard-rkl: PASS -> FAIL (i915#13566) +1 other test fail
>  * 
>
>     igt@kms_cursor_crc@cursor-onscreen-32x32:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>  * 
>
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#13049)
>  * 
>
>     igt@kms_cursor_crc@cursor-random-512x512:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#13049) +1 other test skip
>  * 
>
>     igt@kms_cursor_crc@cursor-rapid-movement-128x42:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#8814)
>  * 
>
>     igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>  * 
>
>     igt@kms_cursor_crc@cursor-sliding-32x10:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#3555) +5 other tests skip
>  * 
>
>     igt@kms_cursor_crc@cursor-suspend:
>
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#12358 / i915#14152 / i915#7882)
>  * 
>
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#12358 / i915#14152)
>  * 
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#4103) +1 other test skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#4103 / i915#4213)
>      +  shard-tglu: NOTRUN -> SKIP (i915#4103) +1 other test skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#4213)
>  * 
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>
>      +  shard-rkl: NOTRUN -> SKIP +18 other tests skip
>  * 
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#13046 / i915#5354) +2 other tests skip
>  * 
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#9809)
>  * 
>
>     igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#9067)
>  * 
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213) +1 other test skip
>  * 
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#9723)
>  * 
>
>     igt@kms_dp_aux_dev@basic:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#1257)
>  * 
>
>     igt@kms_dp_link_training@uhbr-sst:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#13748)
>      +  shard-dg1: NOTRUN -> SKIP (i915#13748)
>      +  shard-tglu: NOTRUN -> SKIP (i915#13748)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#13749)
>      +  shard-dg2: NOTRUN -> SKIP (i915#13748)
>  * 
>
>     igt@kms_dp_linktrain_fallback@dsc-fallback:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#13707)
>      +  shard-rkl: NOTRUN -> SKIP (i915#13707)
>      +  shard-dg1: NOTRUN -> SKIP (i915#13707)
>      +  shard-tglu: NOTRUN -> SKIP (i915#13707) +1 other test skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#13707)
>  * 
>
>     igt@kms_dsc@dsc-basic:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#3840)
>  * 
>
>     igt@kms_dsc@dsc-fractional-bpp:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3840 / i915#9688)
>      +  shard-dg1: NOTRUN -> SKIP (i915#3840)
>  * 
>
>     igt@kms_dsc@dsc-with-bpc:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840)
>  * 
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#3840)
>  * 
>
>     igt@kms_dsc@dsc-with-output-formats:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840)
>  * 
>
>     igt@kms_fbcon_fbt@fbc-suspend:
>
>      +  shard-glk10: NOTRUN -> INCOMPLETE (i915#9878)
>  * 
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#3469)
>  * 
>
>     igt@kms_feature_discovery@chamelium:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#4854)
>  * 
>
>     igt@kms_feature_discovery@display-3x:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#1839)
>  * 
>
>     igt@kms_feature_discovery@dp-mst:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#9337)
>  * 
>
>     igt@kms_flip@2x-absolute-wf_vblank:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#9934) +2 other tests skip
>  * 
>
>     igt@kms_flip@2x-blocking-absolute-wf_vblank:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#9934) +3 other tests skip
>  * 
>
>     igt@kms_flip@2x-blocking-wf_vblank:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#3637 / i915#9934) +4 other tests skip
>  * 
>
>     igt@kms_flip@2x-flip-vs-dpms-on-nop:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#9934)
>  * 
>
>     igt@kms_flip@2x-flip-vs-suspend:
>
>      +  shard-glk11: NOTRUN -> INCOMPLETE (i915#12745 / i915#4839)
>  * 
>
>     igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2 (NEW):
>
>      +  shard-glk11: NOTRUN -> INCOMPLETE (i915#12745)
>  * 
>
>     igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#9934) +4 other tests skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#9934)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3637 / i915#9934)
>  * 
>
>     igt@kms_flip@2x-plain-flip-interruptible:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#9934)
>  * 
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#15643) +3 other tests skip
>  * 
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#15643) +2 other tests skip
>  * 
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#15643) +3 other tests skip
>  * 
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15643 / i915#5190) +2 other tests skip
>  * 
>
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8810 / i915#8813) +1 other test skip
>  * 
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15643) +2 other tests skip
>      +  shard-rkl: NOTRUN -> SKIP (i915#15643) +3 other tests skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#15643) +2 other tests skip
>  * 
>
>     igt@kms_force_connector_basic@prune-stale-modes:
>
>      +  shard-mtlp: PASS -> SKIP (i915#15672)
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#8708) +3 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#5354) +23 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#1825) +15 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#1825) +37 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#8708) +9 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-suspend:
>
>      +  shard-rkl: PASS -> ABORT (i915#15132)
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#10056)
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#10055)
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15102) +2 other tests skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#15102)
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#10433 / i915#15102 / i915#3458)
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15102 / i915#3458) +8 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
>
>      +  shard-glk10: NOTRUN -> SKIP +106 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>
>      +  shard-tglu-1: NOTRUN -> SKIP +25 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#15102) +11 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15102 / i915#3023) +14 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15102) +5 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15104)
>      +  shard-dg1: NOTRUN -> SKIP (i915#15104)
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#1825) +2 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#15102 / i915#3458) +3 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#8708) +12 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15102 / i915#3023) +1 other test skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#15102) +19 other tests skip
>  * 
>
>     igt@kms_hdmi_inject@inject-audio:
>
>      +  shard-tglu: PASS -> FAIL (i915#14867)
>  * 
>
>     igt@kms_hdr@static-toggle:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test skip
>  * 
>
>     igt@kms_joiner@basic-big-joiner:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15460)
>  * 
>
>     igt@kms_joiner@invalid-modeset-force-big-joiner:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15459)
>  * 
>
>     igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#15638 / i915#15722)
>  * 
>
>     igt@kms_panel_fitting@legacy:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#6301)
>      +  shard-dg2: NOTRUN -> SKIP (i915#6301)
>      +  shard-rkl: NOTRUN -> SKIP (i915#6301)
>      +  shard-dg1: NOTRUN -> SKIP (i915#6301)
>  * 
>
>     igt@kms_pipe_crc_basic@suspend-read-crc:
>
>      +  shard-rkl: PASS -> INCOMPLETE (i915#12756 / i915#13476)
>  * 
>
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
>
>      +  shard-rkl: NOTRUN -> INCOMPLETE (i915#13476)
>  * 
>
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
>
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#13409 / i915#13476)
>  * 
>
>     igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#14712)
>  * 
>
>     igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#15709) +2 other tests skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#15709)
>  * 
>
>     igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15709) +4 other tests skip
>  * 
>
>     igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-7:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#15608) +1 other test skip
>  * 
>
>     igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15608) +1 other test skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#15608) +1 other test skip
>  * 
>
>     igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-7:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#15608) +1 other test skip
>  * 
>
>     igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15709) +3 other tests skip
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#15709) +3 other tests skip
>  * 
>
>     igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15608) +3 other tests skip
>  * 
>
>     igt@kms_plane@pixel-format-yf-tiled-modifier:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#15709) +3 other tests skip
>  * 
>
>     igt@kms_plane@plane-panning-bottom-right-suspend:
>
>      +  shard-glk10: NOTRUN -> INCOMPLETE (i915#13026) +1 other test incomplete
>  * 
>
>     igt@kms_plane_alpha_blend@alpha-opaque-fb:
>
>      +  shard-glk: NOTRUN -> FAIL (i915#10647 / i915#12169)
>  * 
>
>     igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
>
>      +  shard-glk: NOTRUN -> FAIL (i915#10647) +1 other test fail
>  * 
>
>     igt@kms_plane_alpha_blend@alpha-transparent-fb:
>
>      +  shard-glk11: NOTRUN -> FAIL (i915#10647 / i915#12177)
>  * 
>
>     igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
>
>      +  shard-glk11: NOTRUN -> FAIL (i915#10647) +1 other test fail
>  * 
>
>     igt@kms_plane_lowres@tiling-y:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8821)
>  * 
>
>     igt@kms_plane_multiple@2x-tiling-4:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#13958)
>  * 
>
>     igt@kms_plane_multiple@2x-tiling-y:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#13958)
>  * 
>
>     igt@kms_plane_multiple@tiling-yf:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14259)
>  * 
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#15329) +4 other tests skip
>  * 
>
>     igt@kms_pm_backlight@bad-brightness:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#9812)
>  * 
>
>     igt@kms_pm_backlight@brightness-with-dpms:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#12343)
>  * 
>
>     igt@kms_pm_backlight@fade-with-suspend:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#5354)
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#9812)
>  * 
>
>     igt@kms_pm_dc@dc5-retention-flops:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3828)
>      +  shard-rkl: NOTRUN -> SKIP (i915#3828)
>      +  shard-dg1: NOTRUN -> SKIP (i915#3828)
>      +  shard-tglu: NOTRUN -> SKIP (i915#3828)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3828)
>  * 
>
>     igt@kms_pm_lpsp@kms-lpsp:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#9340)
>  * 
>
>     igt@kms_pm_lpsp@screens-disabled:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#8430)
>  * 
>
>     igt@kms_pm_rpm@dpms-lpsp:
>
>      +  shard-dg1: PASS -> SKIP (i915#15073) +2 other tests skip
>  * 
>
>     igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15073)
>  * 
>
>     igt@kms_pm_rpm@modeset-lpsp-stress:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15073)
>      +  shard-dg1: NOTRUN -> SKIP (i915#15073)
>  * 
>
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>
>      +  shard-rkl: PASS -> SKIP (i915#15073)
>  * 
>
>     igt@kms_pm_rpm@system-suspend-modeset:
>
>      +  shard-rkl: PASS -> INCOMPLETE (i915#14419)
>  * 
>
>     igt@kms_prime@basic-crc-hybrid:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#6524)
>  * 
>
>     igt@kms_prime@basic-modeset-hybrid:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#6524)
>  * 
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#11520) +5 other tests skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#12316) +3 other tests skip
>  * 
>
>     igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>
>      +  shard-glk: NOTRUN -> SKIP (i915#11520) +10 other tests skip
>  * 
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
>
>      +  shard-glk11: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>  * 
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#11520 / i915#14544)
>  * 
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#9808)
>  * 
>
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#11520) +5 other tests skip
>  * 
>
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
>
>      +  shard-glk10: NOTRUN -> SKIP (i915#11520) +1 other test skip
>  * 
>
>     igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>  * 
>
>     igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#11520) +7 other tests skip
>      +  shard-snb: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>  * 
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#9683) +1 other test skip
>  * 
>
>     igt@kms_psr2_su@page_flip-p010:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#9683)
>  * 
>
>     igt@kms_psr@fbc-psr-sprite-render:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#9688) +8 other tests skip
>  * 
>
>     igt@kms_psr@fbc-psr2-primary-mmap-gtt:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#9732) +15 other tests skip
>  * 
>
>     igt@kms_psr@fbc-psr2-sprite-render:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#14544 / i915#9732) +4 other tests skip
>  * 
>
>     igt@kms_psr@pr-cursor-mmap-cpu:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +16 other tests skip
>  * 
>
>     igt@kms_psr@psr-cursor-plane-onoff:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#9732) +9 other tests skip
>  * 
>
>     igt@kms_psr@psr-sprite-blt:
>
>      +  shard-snb: NOTRUN -> SKIP +137 other tests skip
>  * 
>
>     igt@kms_psr@psr-sprite-mmap-cpu:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +12 other tests skip
>  * 
>
>     igt@kms_psr@psr2-cursor-mmap-gtt:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +15 other tests skip
>  * 
>
>     igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#4077 / i915#9688) +1 other test skip
>  * 
>
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#5289)
>  * 
>
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#5289)
>  * 
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#5190)
>  * 
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#5289) +1 other test skip
>  * 
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#5289)
>  * 
>
>     igt@kms_scaling_modes@scaling-mode-full:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#3555) +3 other tests skip
>  * 
>
>     igt@kms_selftest@drm_framebuffer:
>
>      +  shard-glk10: NOTRUN -> ABORT (i915#13179) +1 other test abort
>  * 
>
>     igt@kms_setmode@clone-exclusive-crtc:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8809)
>  * 
>
>     igt@kms_vrr@flip-basic-fastset:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#9906) +1 other test skip
>      +  shard-rkl: NOTRUN -> SKIP (i915#9906) +1 other test skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#9906) +1 other test skip
>      +  shard-tglu: NOTRUN -> SKIP (i915#9906) +1 other test skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#8808 / i915#9906) +1 other test skip
>  * 
>
>     igt@kms_vrr@flip-dpms:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15243 / i915#3555) +1 other test skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8808)
>  * 
>
>     igt@kms_vrr@negative-basic:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#9906)
>  * 
>
>     igt@perf@gen8-unprivileged-single-ctx-counters:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#2436)
>  * 
>
>     igt@perf@global-sseu-config:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#7387)
>  * 
>
>     igt@perf@global-sseu-config-invalid:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#7387) +1 other test skip
>  * 
>
>     igt@perf_pmu@all-busy-idle-check-all:
>
>      +  shard-dg2: PASS -> FAIL (i915#15453)
>      +  shard-dg1: PASS -> FAIL (i915#15453)
>      +  shard-mtlp: PASS -> FAIL (i915#15453)
>  * 
>
>     igt@perf_pmu@module-unload:
>
>      +  shard-tglu-1: NOTRUN -> ABORT (i915#13029 / i915#15778)
>  * 
>
>     igt@perf_pmu@rc6-all-gts:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#8516)
>  * 
>
>     igt@perf_pmu@rc6@other-idle-gt0:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#8516)
>  * 
>
>     igt@prime_mmap@test_aperture_limit:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#14121) +1 other test skip
>  * 
>
>     igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#14121) +1 other test skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#14121) +1 other test skip
>  * 
>
>     igt@prime_vgem@basic-fence-flip:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3708)
>  * 
>
>     igt@prime_vgem@basic-fence-mmap:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3708 / i915#4077)
>      +  shard-dg2: NOTRUN -> SKIP (i915#3708 / i915#4077)
>      +  shard-dg1: NOTRUN -> SKIP (i915#3708 / i915#4077)
>  * 
>
>     igt@prime_vgem@basic-fence-read:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3291 / i915#3708)
>  * 
>
>     igt@prime_vgem@basic-read:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3708)
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3291 / i915#3708)
>      +  shard-dg1: NOTRUN -> SKIP (i915#3708)
>  * 
>
>     igt@sriov_basic@enable-vfs-autoprobe-off:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#9917)
>  * 
>
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#9917)
>
>     Possible fixes
>
>  * 
>
>     igt@gem_ctx_isolation@preservation-s3:
>
>      +  shard-rkl: INCOMPLETE (i915#13356) -> PASS +2 other tests pass
>  * 
>
>     igt@gem_eio@in-flight-suspend:
>
>      +  shard-dg1: DMESG-WARN (i915#4391 / i915#4423) -> PASS
>  * 
>
>     igt@gem_exec_big@single:
>
>      +  shard-rkl: DMESG-FAIL (i915#15478) -> PASS
>  * 
>
>     igt@gem_mmap_offset@clear-via-pagefault:
>
>      +  shard-mtlp: DMESG-WARN (i915#15478) -> PASS +1 other test pass
>  * 
>
>     igt@gem_workarounds@suspend-resume-context:
>
>      +  shard-rkl: ABORT (i915#15131) -> PASS +1 other test pass
>  * 
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>      +  shard-mtlp: FAIL (i915#15733 / i915#5138) -> PASS
>  * 
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>
>      +  shard-dg1: DMESG-WARN (i915#4423) -> PASS
>  * 
>
>     igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
>
>      +  shard-glk: INCOMPLETE (i915#15582) -> PASS
>  * 
>
>     igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
>
>      +  shard-tglu: FAIL (i915#13566) -> PASS +3 other tests pass
>  * 
>
>     igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
>
>      +  shard-snb: TIMEOUT (i915#14033) -> PASS +1 other test pass
>  * 
>
>     igt@kms_flip@dpms-vs-vblank-race-interruptible:
>
>      +  shard-dg1: FAIL (i915#10826) -> PASS
>  * 
>
>     igt@kms_flip@flip-vs-suspend-interruptible:
>
>      +  shard-snb: INCOMPLETE (i915#12314 / i915#12745 / i915#4839) -> PASS
>  * 
>
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
>
>      +  shard-glk: INCOMPLETE (i915#12756 / i915#13409 / i915#13476) -> PASS
>  * 
>
>     igt@kms_pm_rpm@dpms-lpsp:
>
>      +  shard-dg2: SKIP (i915#15073) -> PASS +1 other test pass
>  * 
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>      +  shard-dg1: SKIP (i915#15073) -> PASS
>  * 
>
>     igt@kms_vrr@negative-basic:
>
>      +  shard-dg2: SKIP (i915#3555 / i915#9906) -> PASS
>  * 
>
>     igt@perf_pmu@busy-double-start@bcs0:
>
>      +  shard-mtlp: FAIL (i915#4349) -> PASS +5 other tests pass
>  * 
>
>     igt@perf_pmu@semaphore-busy@vcs1:
>
>      +  shard-dg1: FAIL (i915#4349) -> PASS +3 other tests pass
>
>     Warnings
>
>  * 
>
>     igt@gem_ccs@suspend-resume:
>
>      +  shard-rkl: SKIP (i915#9323) -> SKIP (i915#14544 / i915#9323)
>  * 
>
>     igt@gem_ctx_sseu@engines:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#280) -> SKIP (i915#280)
>  * 
>
>     igt@gem_exec_balancer@parallel-contexts:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#4525) -> SKIP (i915#4525)
>  * 
>
>     igt@gem_exec_big@single:
>
>      +  shard-tglu: DMESG-FAIL (i915#15478) -> FAIL (i915#15816)
>  * 
>
>     igt@gem_exec_reloc@basic-cpu-wc:
>
>      +  shard-rkl: SKIP (i915#3281) -> SKIP (i915#14544 / i915#3281) +1 other test skip
>  * 
>
>     igt@gem_exec_reloc@basic-wc-gtt:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#3281) -> SKIP (i915#3281) +1 other test skip
>  * 
>
>     igt@gem_madvise@dontneed-before-pwrite:
>
>      +  shard-rkl: SKIP (i915#3282) -> SKIP (i915#14544 / i915#3282) +1 other test skip
>  * 
>
>     igt@gem_partial_pwrite_pread@write-snoop:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#3282) -> SKIP (i915#3282) +1 other test skip
>  * 
>
>     igt@gem_pxp@hw-rejects-pxp-context:
>
>      +  shard-rkl: SKIP (i915#13717) -> SKIP (i915#13717 / i915#14544)
>  * 
>
>     igt@gem_userptr_blits@coherency-sync:
>
>      +  shard-rkl: SKIP (i915#3297) -> SKIP (i915#14544 / i915#3297)
>  * 
>
>     igt@gem_userptr_blits@unsync-unmap-cycles:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#3297) -> SKIP (i915#3297)
>  * 
>
>     igt@gen9_exec_parse@allowed-all:
>
>      +  shard-rkl: SKIP (i915#2527) -> SKIP (i915#14544 / i915#2527) +1 other test skip
>  * 
>
>     igt@i915_pm_freq_api@freq-reset-multiple:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#8399) -> SKIP (i915#8399)
>  * 
>
>     igt@i915_pm_freq_mult@media-freq@gt0:
>
>      +  shard-rkl: SKIP (i915#6590) -> SKIP (i915#14544 / i915#6590) +1 other test skip
>  * 
>
>     igt@i915_pm_sseu@full-enable:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#4387) -> SKIP (i915#4387)
>  * 
>
>     igt@kms_big_fb@4-tiled-addfb:
>
>      +  shard-rkl: SKIP (i915#5286) -> SKIP (i915#14544 / i915#5286) +1 other test skip
>  * 
>
>     igt@kms_big_fb@linear-32bpp-rotate-90:
>
>      +  shard-rkl: SKIP (i915#3638) -> SKIP (i915#14544 / i915#3638)
>  * 
>
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>
>      +  shard-rkl: SKIP (i915#14544) -> SKIP +2 other tests skip
>  * 
>
>     igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
>
>      +  shard-rkl: SKIP (i915#14098 / i915#14544 / i915#6095) -> SKIP (i915#14098 / i915#6095) +4 other tests skip
>  * 
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
>
>      +  shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#14098 / i915#14544 / i915#6095) +6 other tests skip
>  * 
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>
>      +  shard-rkl: SKIP (i915#12313 / i915#14544) -> SKIP (i915#12313) +1 other test skip
>  * 
>
>     igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-2:
>
>      +  shard-rkl: SKIP (i915#6095) -> SKIP (i915#14544 / i915#6095) +1 other test skip
>  * 
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#6095) -> SKIP (i915#6095) +2 other tests skip
>  * 
>
>     igt@kms_cdclk@mode-transition:
>
>      +  shard-rkl: SKIP (i915#3742) -> SKIP (i915#14544 / i915#3742) +1 other test skip
>  * 
>
>     igt@kms_chamelium_frames@hdmi-crc-multiple:
>
>      +  shard-rkl: SKIP (i915#11151 / i915#14544 / i915#7828) -> SKIP (i915#11151 / i915#7828)
>  * 
>
>     igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>
>      +  shard-rkl: SKIP (i915#11151 / i915#7828) -> SKIP (i915#11151 / i915#14544 / i915#7828) +1 other test skip
>  * 
>
>     igt@kms_content_protection@atomic:
>
>      +  shard-rkl: SKIP (i915#15865) -> SKIP (i915#14544 / i915#15865) +1 other test skip
>  * 
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#15330 / i915#3116) -> SKIP (i915#15330 / i915#3116)
>  * 
>
>     igt@kms_cursor_crc@cursor-random-max-size:
>
>      +  shard-rkl: SKIP (i915#3555) -> SKIP (i915#14544 / i915#3555)
>  * 
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>
>      +  shard-dg2: SKIP (i915#13049) -> SKIP (i915#13049 / i915#3359)
>  * 
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>
>      +  shard-rkl: SKIP -> SKIP (i915#14544) +5 other tests skip
>  * 
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>      +  shard-rkl: SKIP (i915#9723) -> SKIP (i915#14544 / i915#9723)
>  * 
>
>     igt@kms_dp_aux_dev@basic:
>
>      +  shard-rkl: SKIP (i915#1257) -> SKIP (i915#1257 / i915#14544)
>  * 
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>      +  shard-rkl: SKIP (i915#3555 / i915#3840) -> SKIP (i915#14544 / i915#3555 / i915#3840)
>  * 
>
>     igt@kms_flip@2x-flip-vs-panning:
>
>      +  shard-rkl: SKIP (i915#9934) -> SKIP (i915#14544 / i915#9934) +1 other test skip
>  * 
>
>     igt@kms_flip@2x-nonexisting-fb:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#9934) -> SKIP (i915#9934)
>  * 
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
>
>      +  shard-rkl: SKIP (i915#15643) -> SKIP (i915#14544 / i915#15643) +1 other test skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:
>
>      +  shard-rkl: SKIP (i915#15102) -> SKIP (i915#14544 / i915#15102)
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
>
>      +  shard-rkl: SKIP (i915#15102 / i915#3023) -> SKIP (i915#14544 / i915#15102 / i915#3023) +5 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>
>      +  shard-dg2: SKIP (i915#10433 / i915#15102 / i915#3458) -> SKIP (i915#15102 / i915#3458) +2 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
>
>      +  shard-dg2: SKIP (i915#15102 / i915#3458) -> SKIP (i915#10433 / i915#15102 / i915#3458)
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#15102) -> SKIP (i915#15102) +2 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#15102 / i915#3023) -> SKIP (i915#15102 / i915#3023) +3 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>
>      +  shard-rkl: SKIP (i915#1825) -> SKIP (i915#14544 / i915#1825) +14 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#1825) -> SKIP (i915#1825) +3 other tests skip
>  * 
>
>     igt@kms_hdr@brightness-with-hdr:
>
>      +  shard-dg1: SKIP (i915#1187 / i915#12713) -> SKIP (i915#12713)
>  * 
>
>     igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
>
>      +  shard-rkl: SKIP (i915#15709) -> SKIP (i915#14544 / i915#15709) +4 other tests skip
>  * 
>
>     igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#15709) -> SKIP (i915#15709)
>  * 
>
>     igt@kms_pm_backlight@fade-with-dpms:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#5354) -> SKIP (i915#5354)
>  * 
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
>
>      +  shard-rkl: SKIP (i915#11520 / i915#14544) -> SKIP (i915#11520)
>  * 
>
>     igt@kms_psr2_sf@pr-cursor-plane-update-sf:
>
>      +  shard-rkl: SKIP (i915#11520) -> SKIP (i915#11520 / i915#14544) +1 other test skip
>  * 
>
>     igt@kms_psr@fbc-pr-sprite-mmap-gtt:
>
>      +  shard-rkl: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 / i915#14544 / i915#9732) +5 other tests skip
>  * 
>
>     igt@kms_psr@fbc-psr-basic:
>
>      +  shard-rkl: SKIP (i915#1072 / i915#14544 / i915#9732) -> SKIP (i915#1072 / i915#9732) +3 other tests skip
>  * 
>
>     igt@kms_vrr@flip-suspend:
>
>      +  shard-rkl: SKIP (i915#15243 / i915#3555) -> SKIP (i915#14544 / i915#15243 / i915#3555)
>  * 
>
>     igt@perf_pmu@module-unload:
>
>      +  shard-dg1: ABORT (i915#15778) -> ABORT (i915#13029 / i915#15778)
>  * 
>
>     igt@perf_pmu@rc6-all-gts:
>
>      +  shard-rkl: SKIP (i915#8516) -> SKIP (i915#14544 / i915#8516)
>  * 
>
>     igt@prime_vgem@basic-fence-read:
>
>      +  shard-rkl: SKIP (i915#3291 / i915#3708) -> SKIP (i915#14544 / i915#3291 / i915#3708)
> 
> BUILD CHANGES
>
>  *  CI: CI-20190529 -> None
>  *  IGT: IGT_8842 -> IGTPW_14918
>  *  Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_18270: 7b7e57c49dffb4329964027a09420a3e9998e65a @ git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_14918: b91b8ff819ce4f63a3b67b1dc6a4bca115891f33 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8842: 8842
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> 
>
--8323329-217032168-1775207852=:1818500--
