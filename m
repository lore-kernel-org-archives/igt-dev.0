Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3408ED729E3
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 14:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93ED10E4E2;
	Fri, 29 Nov 2024 14:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYV/uSTW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828FA10E4DE;
 Fri, 29 Nov 2024 14:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732892376; x=1764428376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D6i6EuSgRLjkao9R3OMr76p3c3YVaT0wY8qM4rg5z28=;
 b=TYV/uSTWE077xWWKHEMYyEZ/Uz6JIlyoGPqmeE6l69UVcvPXO71vZhvD
 JHaVLzJYQsxAFB02CtgavOEYUNBo/OhRnrEhserbz3NnQ9Sf0fOEp1fxU
 tRthFRI/uxsR2H2WOaXjAe/GwCnDqFTTJv76cHpC1lT/CH8tOj3EiGwc+
 i/N2vhRNLwtg60tSIyP1nEfvv2kitOtvUQZnAQEj07GtZKEzILjGBDHMa
 JJ17h4p0zZxyBNmm6r1x5BruvazdF1UUn7BQlFFfUxKfUToARjms9GP3o
 vfT6FSvZxEMAhOU3/zqjoEtsoaIjEeKsFn883guYJHORVIWMlKtbpnAqx A==;
X-CSE-ConnectionGUID: IHn7JwV5R8a4H/m1tQhPIA==
X-CSE-MsgGUID: XirI2PFxQnOq2iGtRbbvKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="58536187"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; d="scan'208";a="58536187"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 06:59:36 -0800
X-CSE-ConnectionGUID: x1Oc/PVNSYGchWAYKyoH/w==
X-CSE-MsgGUID: 3IrFAnseS+2ixTn7UnUxlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; d="scan'208";a="92613068"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.243])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 06:59:34 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= i915.CI.Full: failure for tests/gem_mmap_offset:
 Fix OOM hits (rev2)
Date: Fri, 29 Nov 2024 15:59:29 +0100
Message-ID: <16991126.geO5KgaWL5@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <173281420875.4175640.11647963787568657771@b555e5b46a47>
References: <20241128111822.836089-4-janusz.krzysztofik@linux.intel.com>
 <173281420875.4175640.11647963787568657771@b555e5b46a47>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi I915-ci-infra@lists.freedesktop.org,

On Thursday, 28 November 2024 18:16:48 CET Patchwork wrote:
> == Series Details ==
> 
> Series: tests/gem_mmap_offset: Fix OOM hits (rev2)
> URL   : https://patchwork.freedesktop.org/series/141643/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8129_full -> IGTPW_12214_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12214_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12214_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12214_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_ctx_exec@basic-norecovery:
>     - shard-mtlp:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-7/igt@gem_ctx_exec@basic-norecovery.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-4/igt@gem_ctx_exec@basic-norecovery.html
> 
>   * igt@gem_tiled_swapping@non-threaded:
>     - shard-tglu-1:       NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@gem_tiled_swapping@non-threaded.html
>     - shard-snb:          [PASS][4] -> [FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-snb1/igt@gem_tiled_swapping@non-threaded.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-snb4/igt@gem_tiled_swapping@non-threaded.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][6] +6 other tests incomplete
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-rkl:          [PASS][7] -> [SKIP][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-4/igt@kms_pm_rpm@system-suspend-modeset.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-2/igt@kms_pm_rpm@system-suspend-modeset.html

None of the above mentioned possible regressions are related to changes 
introduced by my series, which have only modified igt@gem_mmap_offset@clear 
and introduced igt@gem_mmap_offset@clear-via-pagefault, the former not 
mentioned then apparently succeeded, and the latter reported below as success.  
Please update CBL filters and re-report.

Thanks,
Janusz

> 
>   
> #### Warnings ####
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-tglu:         [INCOMPLETE][9] ([i915#7443]) -> [INCOMPLETE][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-tglu-6/igt@i915_suspend@basic-s3-without-i915.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-7/igt@i915_suspend@basic-s3-without-i915.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_8129_full and IGTPW_12214_full:
> 
> ### New IGT tests (3) ###
> 
>   * igt@gem_mmap_offset@clear-via-pagefault:
>     - Statuses : 4 pass(s)
>     - Exec time: [22.61, 51.21] s
> 
>   * igt@gem_mmap_offset@clear-via-pagefault@lmem0:
>     - Statuses : 2 pass(s)
>     - Exec time: [23.89, 25.75] s
> 
>   * igt@gem_mmap_offset@clear-via-pagefault@smem0:
>     - Statuses : 4 pass(s)
>     - Exec time: [22.29, 25.45] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12214_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#8411]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-12/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#8411]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-5/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#8411])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-3/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - shard-dg1:          NOTRUN -> [ABORT][14] ([i915#11814] / [i915#11815])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-12/igt@device_reset@unbind-reset-rebind.html
>     - shard-tglu:         NOTRUN -> [ABORT][15] ([i915#12817] / [i915#5507])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-3/igt@device_reset@unbind-reset-rebind.html
> 
>   * igt@drm_fdinfo@virtual-busy-all:
>     - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#8414]) +2 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-5/igt@drm_fdinfo@virtual-busy-all.html
>     - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#8414]) +2 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-12/igt@drm_fdinfo@virtual-busy-all.html
>     - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#8414])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-2/igt@drm_fdinfo@virtual-busy-all.html
> 
>   * igt@gem_ccs@ctrl-surf-copy:
>     - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#3555] / [i915#9323])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-14/igt@gem_ccs@ctrl-surf-copy.html
> 
>   * igt@gem_close_race@multigpu-basic-process:
>     - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#7697])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-4/igt@gem_close_race@multigpu-basic-process.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#7697])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-8/igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#8562])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-2/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_ctx_persistence@file:
>     - shard-snb:          NOTRUN -> [SKIP][23] ([i915#1099])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-snb1/igt@gem_ctx_persistence@file.html
> 
>   * igt@gem_ctx_persistence@heartbeat-stop:
>     - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#8555])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-stop.html
>     - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#8555])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-stop.html
>     - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#8555])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-stop.html
> 
>   * igt@gem_ctx_persistence@hostile:
>     - shard-tglu-1:       NOTRUN -> [FAIL][27] ([i915#11980] / [i915#12580])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@gem_ctx_persistence@hostile.html
> 
>   * igt@gem_ctx_sseu@engines:
>     - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#280])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-2/igt@gem_ctx_sseu@engines.html
>     - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#280])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-18/igt@gem_ctx_sseu@engines.html
>     - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#280])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-4/igt@gem_ctx_sseu@engines.html
>     - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#280])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-4/igt@gem_ctx_sseu@engines.html
> 
>   * igt@gem_exec_balancer@bonded-dual:
>     - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#4771])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-3/igt@gem_exec_balancer@bonded-dual.html
>     - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#4771])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-17/igt@gem_exec_balancer@bonded-dual.html
> 
>   * igt@gem_exec_balancer@bonded-semaphore:
>     - shard-mtlp:         NOTRUN -> [SKIP][34] ([i915#4812])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-3/igt@gem_exec_balancer@bonded-semaphore.html
> 
>   * igt@gem_exec_balancer@hog:
>     - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#4812]) +4 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-17/igt@gem_exec_balancer@hog.html
> 
>   * igt@gem_exec_balancer@invalid-bonds:
>     - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#4036])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-5/igt@gem_exec_balancer@invalid-bonds.html
>     - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#4036])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-12/igt@gem_exec_balancer@invalid-bonds.html
> 
>   * igt@gem_exec_capture@capture-invisible:
>     - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#6334]) +2 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-13/igt@gem_exec_capture@capture-invisible.html
> 
>   * igt@gem_exec_fence@concurrent:
>     - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4812]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-4/igt@gem_exec_fence@concurrent.html
> 
>   * igt@gem_exec_flush@basic-wb-ro-before-default:
>     - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#3539] / [i915#4852]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-18/igt@gem_exec_flush@basic-wb-ro-before-default.html
> 
>   * igt@gem_exec_reloc@basic-cpu-noreloc:
>     - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#3281]) +2 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-3/igt@gem_exec_reloc@basic-cpu-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-scanout:
>     - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#3281]) +6 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-4/igt@gem_exec_reloc@basic-scanout.html
> 
>   * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
>     - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#3281]) +14 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-13/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-write-read-active:
>     - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3281]) +7 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-4/igt@gem_exec_reloc@basic-write-read-active.html
> 
>   * igt@gem_exec_schedule@preempt-queue-chain:
>     - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4537] / [i915#4812])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-3/igt@gem_exec_schedule@preempt-queue-chain.html
> 
>   * igt@gem_exec_suspend@basic-s0@lmem0:
>     - shard-dg2:          [PASS][46] -> [INCOMPLETE][47] ([i915#11441]) +1 other test incomplete
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-11/igt@gem_exec_suspend@basic-s0@lmem0.html
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-1/igt@gem_exec_suspend@basic-s0@lmem0.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices:
>     - shard-dg2:          NOTRUN -> [ABORT][48] ([i915#7975] / [i915#8213]) +1 other test abort
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-10/igt@gem_exec_suspend@basic-s4-devices.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences:
>     - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4860])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#2190])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-3/igt@gem_huc_copy@huc-copy.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][51] ([i915#2190])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@heavy-multi:
>     - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#4613]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-7/igt@gem_lmem_swapping@heavy-multi.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi:
>     - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4613]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-multi.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][54] ([i915#4613])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-multi.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][55] ([i915#4613]) +4 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-glk1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#4565]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#12193]) +1 other test skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg1:          NOTRUN -> [TIMEOUT][58] ([i915#5493]) +1 other test timeout
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_lmem_swapping@verify:
>     - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#4613]) +2 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-4/igt@gem_lmem_swapping@verify.html
> 
>   * igt@gem_madvise@dontneed-before-pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#3282]) +5 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-3/igt@gem_madvise@dontneed-before-pwrite.html
> 
>   * igt@gem_mmap@bad-offset:
>     - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4083]) +5 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-14/igt@gem_mmap@bad-offset.html
> 
>   * igt@gem_mmap_gtt@basic-copy:
>     - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4077]) +6 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-5/igt@gem_mmap_gtt@basic-copy.html
> 
>   * igt@gem_mmap_gtt@basic-small-copy-odd:
>     - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4077]) +11 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-13/igt@gem_mmap_gtt@basic-small-copy-odd.html
> 
>   * igt@gem_mmap_wc@close:
>     - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#4083]) +6 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-7/igt@gem_mmap_wc@close.html
> 
>   * igt@gem_mmap_wc@write-cpu-read-wc:
>     - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4083])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-3/igt@gem_mmap_wc@write-cpu-read-wc.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>     - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#3282]) +4 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
>     - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#3282]) +1 other test skip
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-tglu-1:       NOTRUN -> [WARN][68] ([i915#2658])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@gem_pread@exhaustion.html
>     - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#3282]) +8 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-14/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-glk:          NOTRUN -> [WARN][70] ([i915#2658])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-glk8/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_pxp@create-regular-buffer:
>     - shard-rkl:          NOTRUN -> [TIMEOUT][71] ([i915#12917] / [i915#12964])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-1/igt@gem_pxp@create-regular-buffer.html
> 
>   * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
>     - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4270]) +2 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-1/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
>     - shard-rkl:          NOTRUN -> [TIMEOUT][73] ([i915#12964])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
> 
>   * igt@gem_pxp@hw-rejects-pxp-buffer:
>     - shard-tglu-1:       NOTRUN -> [SKIP][74] ([i915#13033])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.html
> 
>   * igt@gem_pxp@regular-baseline-src-copy-readible:
>     - shard-tglu:         [PASS][75] -> [SKIP][76] ([i915#4270])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-tglu-5/igt@gem_pxp@regular-baseline-src-copy-readible.html
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-2/igt@gem_pxp@regular-baseline-src-copy-readible.html
> 
>   * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>     - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4270]) +5 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-13/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
>     - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#4270])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-5/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
> 
>   * igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#8428])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-3/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#5190] / [i915#8428]) +6 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-4/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4079]) +2 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
> 
>   * igt@gem_set_tiling_vs_gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#4079]) +1 other test skip
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-3/igt@gem_set_tiling_vs_gtt.html
> 
>   * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
>     - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#4077]) +2 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-4/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html
> 
>   * igt@gem_tiled_pread_pwrite:
>     - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4079]) +1 other test skip
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-18/igt@gem_tiled_pread_pwrite.html
> 
>   * igt@gem_unfence_active_buffers:
>     - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4879])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-8/igt@gem_unfence_active_buffers.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-glk:          NOTRUN -> [SKIP][86] ([i915#3323])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-glk1/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@readonly-pwrite-unsync:
>     - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#3297]) +2 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-4/igt@gem_userptr_blits@readonly-pwrite-unsync.html
> 
>   * igt@gem_userptr_blits@unsync-overlap:
>     - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#3297])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-7/igt@gem_userptr_blits@unsync-overlap.html
>     - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#3297])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-4/igt@gem_userptr_blits@unsync-overlap.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-cycles:
>     - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#3297]) +3 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-13/igt@gem_userptr_blits@unsync-unmap-cycles.html
> 
>   * igt@gen7_exec_parse@bitmasks:
>     - shard-dg2:          NOTRUN -> [SKIP][91] +13 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-8/igt@gen7_exec_parse@bitmasks.html
> 
>   * igt@gen9_exec_parse@batch-invalid-length:
>     - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#2527]) +1 other test skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-2/igt@gen9_exec_parse@batch-invalid-length.html
> 
>   * igt@gen9_exec_parse@bb-chained:
>     - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#2856]) +1 other test skip
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-3/igt@gen9_exec_parse@bb-chained.html
> 
>   * igt@gen9_exec_parse@bb-large:
>     - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#2527]) +5 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-12/igt@gen9_exec_parse@bb-large.html
> 
>   * igt@gen9_exec_parse@bb-secure:
>     - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#2856]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-4/igt@gen9_exec_parse@bb-secure.html
> 
>   * igt@gen9_exec_parse@bb-start-cmd:
>     - shard-tglu-1:       NOTRUN -> [SKIP][96] ([i915#2527] / [i915#2856]) +2 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html
> 
>   * igt@gen9_exec_parse@cmd-crossing-page:
>     - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#2527] / [i915#2856]) +4 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-7/igt@gen9_exec_parse@cmd-crossing-page.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-mtlp:         [PASS][98] -> [ABORT][99] ([i915#10131] / [i915#9820])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-2/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_freq_api@freq-reset:
>     - shard-tglu-1:       NOTRUN -> [SKIP][100] ([i915#8399])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html
> 
>   * igt@i915_pm_freq_mult@media-freq@gt0:
>     - shard-tglu-1:       NOTRUN -> [SKIP][101] ([i915#6590]) +1 other test skip
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
>     - shard-dg1:          [PASS][102] -> [FAIL][103] ([i915#12548] / [i915#3591])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
> 
>   * igt@i915_pm_rps@min-max-config-idle:
>     - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#11681] / [i915#6621]) +1 other test skip
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-13/igt@i915_pm_rps@min-max-config-idle.html
> 
>   * igt@i915_pm_rps@thresholds-idle-park:
>     - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#11681])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-8/igt@i915_pm_rps@thresholds-idle-park.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#4387])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-8/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@i915_power@sanity:
>     - shard-mtlp:         [PASS][107] -> [SKIP][108] ([i915#7984])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-5/igt@i915_power@sanity.html
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-6/igt@i915_power@sanity.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-tglu-1:       NOTRUN -> [SKIP][109] ([i915#6245])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@i915_query@hwconfig_table.html
>     - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#6245])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-14/igt@i915_query@hwconfig_table.html
> 
>   * igt@i915_query@test-query-geometry-subslices:
>     - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#5723])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-3/igt@i915_query@test-query-geometry-subslices.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#4215])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
>     - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#4212])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#8709]) +11 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#1769] / [i915#3555])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>     - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#1769] / [i915#3555])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>     - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#1769] / [i915#3555])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>     - shard-tglu:         NOTRUN -> [SKIP][118] ([i915#1769] / [i915#3555])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>     - shard-glk:          NOTRUN -> [SKIP][119] ([i915#1769])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-glk4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>     - shard-tglu:         NOTRUN -> [SKIP][120] ([i915#5286]) +4 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-9/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
>     - shard-mtlp:         [PASS][121] -> [FAIL][122] ([i915#12469] / [i915#5138])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-tglu-1:       NOTRUN -> [SKIP][123] ([i915#5286]) +2 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
>     - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#4538] / [i915#5286]) +6 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-12/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#5286]) +1 other test skip
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>     - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#5286])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-13/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#3638]) +1 other test skip
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-7/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#3638]) +4 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-14/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>     - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#4538] / [i915#5190]) +7 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#5190]) +1 other test skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>     - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#6187]) +1 other test skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-mtlp:         NOTRUN -> [SKIP][132] +6 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#4538]) +8 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:
>     - shard-glk:          NOTRUN -> [SKIP][134] +333 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-glk5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#12313]) +2 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>     - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#12313])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>     - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#12313])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>     - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#12313])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#6095]) +104 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#10307] / [i915#6095]) +174 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#12805])
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#6095]) +92 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#6095]) +19 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#12805])
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
>     - shard-tglu-1:       NOTRUN -> [SKIP][145] ([i915#6095]) +54 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#6095]) +151 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-12/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#6095]) +11 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#12313]) +3 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-18/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#10307] / [i915#10434] / [i915#6095]) +5 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#3742])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#11616] / [i915#7213]) +3 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#3742]) +1 other test skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-17/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#4087]) +4 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-5/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio-edid:
>     - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#7828]) +9 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-14/igt@kms_chamelium_audio@hdmi-audio-edid.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg1:          NOTRUN -> [SKIP][155] +65 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-14/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#7828]) +8 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-5/igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-fast:
>     - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#7828]) +3 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-5/igt@kms_chamelium_frames@hdmi-crc-fast.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
>     - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#7828]) +3 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-tglu-1:       NOTRUN -> [SKIP][159] ([i915#7828]) +6 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#7828]) +10 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-5/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-10/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-tglu-1:       NOTRUN -> [SKIP][162] ([i915#3116] / [i915#3299])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#9424])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-14/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-tglu-1:       NOTRUN -> [SKIP][164] ([i915#6944] / [i915#9424])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-4:
>     - shard-dg2:          NOTRUN -> [TIMEOUT][165] ([i915#7173])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-10/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#7116] / [i915#9424])
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-18/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x10:
>     - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#3555] / [i915#8814]) +1 other test skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#13049]) +1 other test skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-4/igt@kms_cursor_crc@cursor-random-512x512.html
>     - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#13049]) +1 other test skip
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x512.html
>     - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#13049]) +1 other test skip
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-18/igt@kms_cursor_crc@cursor-random-512x512.html
>     - shard-mtlp:         NOTRUN -> [SKIP][171] ([i915#13049])
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-8/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#13049]) +3 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-tglu-1:       NOTRUN -> [SKIP][173] ([i915#4103])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>     - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#4213])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#4103] / [i915#4213])
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
>     - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#9809]) +1 other test skip
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-rkl:          NOTRUN -> [SKIP][177] +6 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
>     - shard-snb:          [PASS][178] -> [FAIL][179] ([i915#2346])
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#4103] / [i915#4213]) +1 other test skip
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-13/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>     - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#4103])
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#9723])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#9833])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-11/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#8588])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-3/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#1769] / [i915#3555] / [i915#3804])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#3804])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#12402])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#8812])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-14/igt@kms_draw_crc@draw-method-mmap-wc.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp:
>     - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#3840] / [i915#9688])
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-4/igt@kms_dsc@dsc-fractional-bpp.html
>     - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#3840]) +1 other test skip
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp.html
> 
>   * igt@kms_dsc@dsc-with-formats:
>     - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#3555] / [i915#3840])
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-6/igt@kms_dsc@dsc-with-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#3555] / [i915#3840])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-14/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][193] ([i915#9878])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-glk4/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#1839])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-4/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-tglu-1:       NOTRUN -> [SKIP][195] ([i915#1839]) +1 other test skip
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-tglu:         NOTRUN -> [SKIP][196] ([i915#658])
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-9/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-tglu-1:       NOTRUN -> [SKIP][197] ([i915#658])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@kms_feature_discovery@psr2.html
>     - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#658])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-4/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#3637])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-6/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-tglu-1:       NOTRUN -> [SKIP][200] ([i915#3637]) +2 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#9934]) +7 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-8/igt@kms_flip@2x-modeset-vs-vblank-race.html
>     - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#9934]) +2 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-3/igt@kms_flip@2x-modeset-vs-vblank-race.html
>     - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#9934]) +7 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-13/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#3637]) +7 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_flip@absolute-wf_vblank-interruptible:
>     - shard-rkl:          [PASS][205] -> [DMESG-WARN][206] ([i915#12917] / [i915#12964]) +3 other tests dmesg-warn
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-1/igt@kms_flip@absolute-wf_vblank-interruptible.html
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-3/igt@kms_flip@absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][207] ([i915#4839])
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-glk9/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
>     - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#3555] / [i915#8810] / [i915#8813])
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#3555] / [i915#8810])
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>     - shard-tglu-1:       NOTRUN -> [SKIP][210] ([i915#2587] / [i915#2672]) +1 other test skip
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#2587] / [i915#2672]) +3 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#2587] / [i915#2672]) +5 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#2672] / [i915#3555]) +3 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>     - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#2672] / [i915#3555]) +3 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>     - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#2587] / [i915#2672] / [i915#3555])
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#2672]) +5 other tests skip
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>     - shard-tglu-1:       NOTRUN -> [SKIP][218] ([i915#2672] / [i915#3555]) +1 other test skip
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#2672] / [i915#3555]) +1 other test skip
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
>     - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#2672] / [i915#3555]) +4 other tests skip
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#2672]) +1 other test skip
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#2672] / [i915#3555] / [i915#8813]) +3 other tests skip
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
>     - shard-rkl:          [PASS][223] -> [DMESG-WARN][224] ([i915#12964]) +58 other tests dmesg-warn
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
>     - shard-dg2:          [PASS][225] -> [FAIL][226] ([i915#6880]) +1 other test fail
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#1825]) +6 other tests skip
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>     - shard-snb:          [PASS][228] -> [SKIP][229] +4 other tests skip
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#5354]) +27 other tests skip
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
>     - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#1825]) +10 other tests skip
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-tglu-1:       NOTRUN -> [SKIP][232] +56 other tests skip
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
>     - shard-dg2:          NOTRUN -> [FAIL][233] ([i915#6880])
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-rkl:          [PASS][234] -> [DMESG-FAIL][235] ([i915#12964])
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html
>     - shard-glk:          NOTRUN -> [INCOMPLETE][236] ([i915#10056])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-glk3/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
>     - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#3458]) +10 other tests skip
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
>     - shard-tglu:         NOTRUN -> [SKIP][238] +76 other tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#8708]) +3 other tests skip
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>     - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#3023]) +7 other tests skip
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#8708]) +22 other tests skip
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#5439])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#8708]) +19 other tests skip
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#3458]) +18 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-dg2:          [PASS][245] -> [SKIP][246] ([i915#3555] / [i915#8228])
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-10/igt@kms_hdr@bpc-switch-dpms.html
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-5/igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#12713])
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-8/igt@kms_hdr@brightness-with-hdr.html
>     - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#1187] / [i915#12713])
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-tglu-1:       NOTRUN -> [SKIP][249] ([i915#3555] / [i915#8228])
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#3555] / [i915#8228]) +1 other test skip
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-5/igt@kms_hdr@invalid-metadata-sizes.html
>     - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#3555] / [i915#8228])
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-4/igt@kms_hdr@invalid-metadata-sizes.html
>     - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#3555] / [i915#8228])
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-4/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#3555] / [i915#8228]) +1 other test skip
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-13/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_hdr@static-toggle-dpms:
>     - shard-mtlp:         NOTRUN -> [SKIP][254] ([i915#3555] / [i915#8228])
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-6/igt@kms_hdr@static-toggle-dpms.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#10656])
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-11/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-tglu:         NOTRUN -> [SKIP][256] ([i915#12339])
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-6/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#4816])
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-10/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][258] ([i915#12756])
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#6953] / [i915#9423])
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-size.html
>     - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#6953])
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-12/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>     - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#12247] / [i915#9423]) +1 other test skip
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
>     - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#12247]) +2 other tests skip
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
>     - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#12247]) +14 other tests skip
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-10/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:
>     - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#12247]) +7 other tests skip
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
>     - shard-tglu-1:       NOTRUN -> [SKIP][265] ([i915#12247]) +3 other tests skip
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:
>     - shard-mtlp:         NOTRUN -> [SKIP][266] ([i915#12247]) +4 other tests skip
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
>     - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#12247]) +18 other tests skip
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
>     - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#12247] / [i915#6953])
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-14/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#12343])
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-4/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#5354]) +1 other test skip
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-7/igt@kms_pm_backlight@fade-with-dpms.html
>     - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#5354]) +1 other test skip
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-17/igt@kms_pm_backlight@fade-with-dpms.html
>     - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#9812]) +1 other test skip
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-7/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#9685])
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-10/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#9685])
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-18/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_lpsp@screens-disabled:
>     - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#8430])
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-7/igt@kms_pm_lpsp@screens-disabled.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-dg2:          [PASS][276] -> [SKIP][277] ([i915#9519]) +1 other test skip
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-2/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#9519])
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp.html
>     - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#9519])
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html
>     - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#9519])
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-rkl:          [PASS][281] -> [SKIP][282] ([i915#9519]) +1 other test skip
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#9519])
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_prime@basic-modeset-hybrid:
>     - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#6524]) +1 other test skip
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-18/igt@kms_prime@basic-modeset-hybrid.html
>     - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#6524])
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-4/igt@kms_prime@basic-modeset-hybrid.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#6524] / [i915#6805])
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-6/igt@kms_prime@d3hot.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
>     - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#11520]) +7 other tests skip
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>     - shard-tglu-1:       NOTRUN -> [SKIP][288] ([i915#11520]) +3 other tests skip
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
>     - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#12316]) +1 other test skip
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][290] ([i915#9808])
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#11520]) +7 other tests skip
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-11/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>     - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#11520]) +10 other tests skip
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-17/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#11520]) +1 other test skip
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
>     - shard-glk:          NOTRUN -> [SKIP][294] ([i915#11520]) +10 other tests skip
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-glk8/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#9683])
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#9683]) +1 other test skip
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-13/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-pr-sprite-render:
>     - shard-tglu-1:       NOTRUN -> [SKIP][297] ([i915#9732]) +10 other tests skip
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@kms_psr@fbc-pr-sprite-render.html
> 
>   * igt@kms_psr@fbc-psr-sprite-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#1072] / [i915#9732]) +18 other tests skip
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-5/igt@kms_psr@fbc-psr-sprite-blt.html
> 
>   * igt@kms_psr@fbc-psr-sprite-plane-move:
>     - shard-mtlp:         NOTRUN -> [SKIP][299] ([i915#9688]) +2 other tests skip
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-5/igt@kms_psr@fbc-psr-sprite-plane-move.html
> 
>   * igt@kms_psr@psr2-cursor-render:
>     - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#9732]) +15 other tests skip
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-4/igt@kms_psr@psr2-cursor-render.html
> 
>   * igt@kms_psr@psr2-sprite-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#1072] / [i915#9732]) +26 other tests skip
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-17/igt@kms_psr@psr2-sprite-mmap-gtt.html
> 
>   * igt@kms_psr@psr2-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][302] ([i915#1072] / [i915#9732]) +9 other tests skip
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-5/igt@kms_psr@psr2-suspend.html
> 
>   * igt@kms_pwrite_crc:
>     - shard-rkl:          NOTRUN -> [DMESG-WARN][303] ([i915#12964]) +6 other tests dmesg-warn
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-5/igt@kms_pwrite_crc.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-snb:          NOTRUN -> [SKIP][304] +78 other tests skip
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-snb5/igt@kms_rotation_crc@bad-pixel-format.html
>     - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#12755])
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-7/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#12755]) +1 other test skip
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-7/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-tglu:         NOTRUN -> [SKIP][307] ([i915#5289])
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-tglu-1:       NOTRUN -> [SKIP][308] ([i915#3555]) +4 other tests skip
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full:
>     - shard-tglu:         NOTRUN -> [SKIP][309] ([i915#3555]) +7 other tests skip
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-full.html
> 
>   * igt@kms_selftest@drm_framebuffer:
>     - shard-dg1:          NOTRUN -> [ABORT][310] ([i915#12231]) +1 other test abort
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-18/igt@kms_selftest@drm_framebuffer.html
>     - shard-glk:          NOTRUN -> [ABORT][311] ([i915#12231]) +1 other test abort
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-glk1/igt@kms_selftest@drm_framebuffer.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#3555]) +2 other tests skip
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>     - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#3555]) +2 other tests skip
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>     - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#3555]) +5 other tests skip
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-13/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-dg2:          NOTRUN -> [FAIL][315] ([IGT#160])
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-8/igt@kms_sysfs_edid_timing.html
>     - shard-dg1:          NOTRUN -> [FAIL][316] ([IGT#160] / [i915#6493])
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-13/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2:          NOTRUN -> [SKIP][317] ([i915#8623])
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-5/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-tglu-1:       NOTRUN -> [SKIP][318] ([i915#9906])
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#9906]) +1 other test skip
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-6/igt@kms_vrr@max-min.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][320] ([i915#3555] / [i915#9906])
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-11/igt@kms_vrr@negative-basic.html
>     - shard-rkl:          NOTRUN -> [SKIP][321] ([i915#3555] / [i915#9906])
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-7/igt@kms_vrr@negative-basic.html
>     - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#3555] / [i915#9906])
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-17/igt@kms_vrr@negative-basic.html
>     - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#3555] / [i915#9906])
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-6/igt@kms_vrr@negative-basic.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual:
>     - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#9906]) +2 other tests skip
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-virtual.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-glk:          NOTRUN -> [SKIP][325] ([i915#2437])
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-glk5/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-tglu-1:       NOTRUN -> [SKIP][326] ([i915#2437] / [i915#9412])
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#2437]) +1 other test skip
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-5/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#2437] / [i915#9412])
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-10/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#2437]) +1 other test skip
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-17/igt@kms_writeback@writeback-invalid-parameters.html
>     - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#2437])
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-10/igt@kms_writeback@writeback-invalid-parameters.html
>     - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#2437])
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-7/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@perf@mi-rpc:
>     - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#2434])
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-8/igt@perf@mi-rpc.html
> 
>   * igt@perf_pmu@busy-idle@ccs0:
>     - shard-mtlp:         [PASS][333] -> [FAIL][334] ([i915#4349]) +11 other tests fail
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-6/igt@perf_pmu@busy-idle@ccs0.html
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-6/igt@perf_pmu@busy-idle@ccs0.html
>     - shard-dg2:          [PASS][335] -> [FAIL][336] ([i915#4349]) +7 other tests fail
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-11/igt@perf_pmu@busy-idle@ccs0.html
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-2/igt@perf_pmu@busy-idle@ccs0.html
> 
>   * igt@perf_pmu@cpu-hotplug:
>     - shard-tglu:         NOTRUN -> [SKIP][337] ([i915#8850])
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-2/igt@perf_pmu@cpu-hotplug.html
> 
>   * igt@perf_pmu@most-busy-check-all:
>     - shard-rkl:          [PASS][338] -> [FAIL][339] ([i915#4349]) +1 other test fail
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-4/igt@perf_pmu@most-busy-check-all.html
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-4/igt@perf_pmu@most-busy-check-all.html
> 
>   * igt@perf_pmu@rc6-all-gts:
>     - shard-dg1:          NOTRUN -> [SKIP][340] ([i915#8516]) +1 other test skip
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-18/igt@perf_pmu@rc6-all-gts.html
> 
>   * igt@perf_pmu@rc6@other-idle-gt0:
>     - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#8516])
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-5/igt@perf_pmu@rc6@other-idle-gt0.html
> 
>   * igt@perf_pmu@render-node-busy-idle@vcs0:
>     - shard-dg2:          NOTRUN -> [FAIL][342] ([i915#4349]) +5 other tests fail
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-2/igt@perf_pmu@render-node-busy-idle@vcs0.html
> 
>   * igt@perf_pmu@semaphore-busy@vcs1:
>     - shard-dg1:          [PASS][343] -> [FAIL][344] ([i915#4349]) +3 other tests fail
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-12/igt@perf_pmu@semaphore-busy@vcs1.html
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-14/igt@perf_pmu@semaphore-busy@vcs1.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - shard-dg1:          NOTRUN -> [SKIP][345] ([i915#3708])
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-18/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][346] ([i915#3708] / [i915#4077])
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-14/igt@prime_vgem@coherency-gtt.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][347] ([i915#3708])
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-4/igt@prime_vgem@fence-flip-hang.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-dg1:          NOTRUN -> [SKIP][348] ([i915#9917])
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-13/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-dg2:          NOTRUN -> [SKIP][349] ([i915#9917])
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   * igt@tools_test@sysfs_l3_parity:
>     - shard-dg1:          NOTRUN -> [SKIP][350] ([i915#4818])
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-14/igt@tools_test@sysfs_l3_parity.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-dg2:          [INCOMPLETE][351] ([i915#7297]) -> [PASS][352] +1 other test pass
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-5/igt@gem_ccs@suspend-resume.html
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-10/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_eio@hibernate:
>     - shard-tglu:         [ABORT][353] ([i915#10030] / [i915#7975] / [i915#8213]) -> [PASS][354]
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-tglu-10/igt@gem_eio@hibernate.html
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-5/igt@gem_eio@hibernate.html
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-dg1:          [DMESG-WARN][355] ([i915#4391] / [i915#4423]) -> [PASS][356]
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-17/igt@gem_eio@in-flight-suspend.html
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-12/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_eio@kms:
>     - shard-tglu:         [DMESG-WARN][357] -> [PASS][358]
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-tglu-9/igt@gem_eio@kms.html
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-8/igt@gem_eio@kms.html
> 
>   * igt@gem_exec_whisper@basic-queues-priority:
>     - shard-rkl:          [DMESG-WARN][359] ([i915#12917] / [i915#12964]) -> [PASS][360]
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-2/igt@gem_exec_whisper@basic-queues-priority.html
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-4/igt@gem_exec_whisper@basic-queues-priority.html
> 
>   * igt@gem_pxp@verify-pxp-stale-buf-execution:
>     - shard-tglu:         [SKIP][361] ([i915#4270]) -> [PASS][362] +1 other test pass
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-tglu-4/igt@gem_pxp@verify-pxp-stale-buf-execution.html
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-5/igt@gem_pxp@verify-pxp-stale-buf-execution.html
> 
>   * igt@gem_workarounds@suspend-resume:
>     - shard-rkl:          [DMESG-FAIL][363] ([i915#12964]) -> [PASS][364]
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-4/igt@gem_workarounds@suspend-resume.html
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-2/igt@gem_workarounds@suspend-resume.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
>     - shard-dg1:          [FAIL][365] ([i915#12548] / [i915#3591]) -> [PASS][366]
>    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
>    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-snb:          [INCOMPLETE][367] ([i915#7790]) -> [PASS][368]
>    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-snb4/igt@i915_pm_rps@reset.html
>    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-snb5/igt@i915_pm_rps@reset.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - shard-mtlp:         [ABORT][369] ([i915#12061]) -> [PASS][370] +1 other test pass
>    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-6/igt@i915_selftest@live@workarounds.html
>    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-6/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
>     - shard-dg1:          [DMESG-WARN][371] ([i915#4423]) -> [PASS][372] +2 other tests pass
>    [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-17/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html
>    [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-17/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_flip@2x-flip-vs-fences-interruptible:
>     - shard-snb:          [INCOMPLETE][373] -> [PASS][374] +1 other test pass
>    [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-snb6/igt@kms_flip@2x-flip-vs-fences-interruptible.html
>    [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-snb5/igt@kms_flip@2x-flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a3:
>     - shard-dg2:          [FAIL][375] ([i915#11989]) -> [PASS][376] +5 other tests pass
>    [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-1/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a3.html
>    [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-1/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-rmfb-interruptible:
>     - shard-dg2:          [INCOMPLETE][377] ([i915#6113]) -> [PASS][378] +1 other test pass
>    [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-3/igt@kms_flip@flip-vs-rmfb-interruptible.html
>    [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-3/igt@kms_flip@flip-vs-rmfb-interruptible.html
> 
>   * igt@kms_flip@flip-vs-rmfb-interruptible@a-hdmi-a3:
>     - shard-dg1:          [INCOMPLETE][379] ([i915#6113]) -> [PASS][380] +1 other test pass
>    [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-13/igt@kms_flip@flip-vs-rmfb-interruptible@a-hdmi-a3.html
>    [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-12/igt@kms_flip@flip-vs-rmfb-interruptible@a-hdmi-a3.html
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:
>     - shard-mtlp:         [FAIL][381] ([i915#11989]) -> [PASS][382] +4 other tests pass
>    [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-5/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html
>    [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-5/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1:
>     - shard-snb:          [FAIL][383] ([i915#11989]) -> [PASS][384] +5 other tests pass
>    [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-snb7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html
>    [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-snb1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-snb:          [SKIP][385] -> [PASS][386] +3 other tests pass
>    [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>    [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
>     - shard-dg2:          [FAIL][387] ([i915#6880]) -> [PASS][388]
>    [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
>    [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
> 
>   * igt@kms_plane_cursor@primary:
>     - shard-mtlp:         [DMESG-WARN][389] ([i915#1982]) -> [PASS][390] +1 other test pass
>    [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-2/igt@kms_plane_cursor@primary.html
>    [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-4/igt@kms_plane_cursor@primary.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-tglu:         [FAIL][391] ([i915#9295]) -> [PASS][392]
>    [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-tglu-7/igt@kms_pm_dc@dc6-dpms.html
>    [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-5/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-dg2:          [SKIP][393] ([i915#9519]) -> [PASS][394] +1 other test pass
>    [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>    [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@perf@gen12-oa-tlb-invalidate:
>     - shard-rkl:          [DMESG-WARN][395] ([i915#12964]) -> [PASS][396] +52 other tests pass
>    [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-1/igt@perf@gen12-oa-tlb-invalidate.html
>    [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-3/igt@perf@gen12-oa-tlb-invalidate.html
> 
>   * igt@perf_pmu@all-busy-idle-check-all:
>     - shard-dg2:          [FAIL][397] ([i915#11943]) -> [PASS][398]
>    [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-1/igt@perf_pmu@all-busy-idle-check-all.html
>    [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-5/igt@perf_pmu@all-busy-idle-check-all.html
>     - shard-mtlp:         [FAIL][399] ([i915#11943]) -> [PASS][400]
>    [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-5/igt@perf_pmu@all-busy-idle-check-all.html
>    [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-2/igt@perf_pmu@all-busy-idle-check-all.html
> 
>   * igt@perf_pmu@busy-double-start@vecs0:
>     - shard-dg1:          [FAIL][401] ([i915#4349]) -> [PASS][402] +2 other tests pass
>    [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-14/igt@perf_pmu@busy-double-start@vecs0.html
>    [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-12/igt@perf_pmu@busy-double-start@vecs0.html
> 
>   * igt@perf_pmu@most-busy-idle-check-all@rcs0:
>     - shard-rkl:          [FAIL][403] ([i915#4349]) -> [PASS][404] +1 other test pass
>    [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-7/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
>    [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-7/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
> 
>   * igt@perf_pmu@multi-client:
>     - shard-mtlp:         [FAIL][405] ([i915#4349]) -> [PASS][406] +1 other test pass
>    [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-5/igt@perf_pmu@multi-client.html
>    [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-mtlp-4/igt@perf_pmu@multi-client.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_eio@hibernate:
>     - shard-dg2:          [DMESG-WARN][407] -> [ABORT][408] ([i915#10030] / [i915#7975] / [i915#8213])
>    [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-1/igt@gem_eio@hibernate.html
>    [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-1/igt@gem_eio@hibernate.html
> 
>   * igt@gem_lmem_swapping@smem-oom:
>     - shard-dg2:          [DMESG-WARN][409] ([i915#5493]) -> [SKIP][410] ([i915#12936])
>    [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-11/igt@gem_lmem_swapping@smem-oom.html
>    [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-7/igt@gem_lmem_swapping@smem-oom.html
> 
>   * igt@gem_pxp@hw-rejects-pxp-context:
>     - shard-rkl:          [TIMEOUT][411] ([i915#12917] / [i915#12964]) -> [FAIL][412] ([i915#13104])
>    [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-3/igt@gem_pxp@hw-rejects-pxp-context.html
>    [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-context.html
> 
>   * igt@gem_pxp@regular-baseline-src-copy-readible:
>     - shard-rkl:          [TIMEOUT][413] ([i915#12964]) -> [SKIP][414] ([i915#4270])
>    [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-5/igt@gem_pxp@regular-baseline-src-copy-readible.html
>    [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-4/igt@gem_pxp@regular-baseline-src-copy-readible.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-on:
>     - shard-rkl:          [TIMEOUT][415] ([i915#12917] / [i915#12964]) -> [SKIP][416] ([i915#4270])
>    [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-on.html
>    [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-on.html
> 
>   * igt@gem_pxp@verify-pxp-stale-buf-execution:
>     - shard-rkl:          [SKIP][417] ([i915#4270]) -> [TIMEOUT][418] ([i915#12917] / [i915#12964]) +1 other test timeout
>    [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-7/igt@gem_pxp@verify-pxp-stale-buf-execution.html
>    [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-3/igt@gem_pxp@verify-pxp-stale-buf-execution.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-tglu:         [ABORT][419] ([i915#10887] / [i915#12817] / [i915#9820]) -> [ABORT][420] ([i915#10887] / [i915#12817] / [i915#13010] / [i915#9820])
>    [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html
>    [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-4/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-dg1:          [SKIP][421] ([i915#4423] / [i915#4538] / [i915#5286]) -> [SKIP][422] ([i915#4538] / [i915#5286])
>    [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-dg1:          [SKIP][423] ([i915#9433]) -> [SKIP][424] ([i915#9424])
>    [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-13/igt@kms_content_protection@mei-interface.html
>    [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-14/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2:          [SKIP][425] ([i915#7118]) -> [TIMEOUT][426] ([i915#7173])
>    [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-7/igt@kms_content_protection@srm.html
>    [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-10/igt@kms_content_protection@srm.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
>     - shard-dg2:          [SKIP][427] ([i915#3458]) -> [SKIP][428] ([i915#10433] / [i915#3458])
>    [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html
>    [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-dg1:          [SKIP][429] -> [SKIP][430] ([i915#4423])
>    [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
>    [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-tglu:         [SKIP][431] ([i915#1187] / [i915#12713]) -> [SKIP][432] ([i915#12713])
>    [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html
>    [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-tglu-6/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_psr@pr-basic:
>     - shard-dg1:          [SKIP][433] ([i915#1072] / [i915#4423] / [i915#9732]) -> [SKIP][434] ([i915#1072] / [i915#9732])
>    [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-17/igt@kms_psr@pr-basic.html
>    [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-dg1-17/igt@kms_psr@pr-basic.html
> 
>   * igt@perf@gen12-group-concurrent-oa-buffer-read:
>     - shard-rkl:          [DMESG-WARN][435] ([i915#12964]) -> [FAIL][436] ([i915#10538])
>    [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-3/igt@perf@gen12-group-concurrent-oa-buffer-read.html
>    [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/shard-rkl-1/igt@perf@gen12-group-concurrent-oa-buffer-read.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [IGT#160]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/160
>   [i915#10030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10030
>   [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
>   [i915#10131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>   [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>   [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>   [i915#10538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538
>   [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#10887]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
>   [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
>   [i915#11441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11441
>   [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/iss
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12214/index.html
> 




