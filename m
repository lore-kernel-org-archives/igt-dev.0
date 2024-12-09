Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278D2E7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 10:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9EC610E6C0;
	Mon,  9 Dec 2024 10:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZpcOadn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E713510E6C0
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 10:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733741577; x=1765277577;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=nOaYwUt20X4cWtb+BGtnWiOppqModwy/DP2Qtax0fgE=;
 b=MZpcOadn/ebGb+DwrhYktngskfZlUmBVW86Bs/kWxNvm5RIXUIt5LwAe
 vgQPhKdYiW20u9rIMknjPnqbAEO1jAJrS8REBO8BwImqJewxaVZjXp9Ir
 +WzikXuI+FbwrEWfCTUeqXtD/mP0VvKJPSttf80BNV6+zfcA7zXtPhRot
 1UoS0X3+ELJxjJr2hLvftJa/OJt+qyBTEJL4XofR/Zu7EavQ4X1MtEpbh
 MEsF/Ce+x6Qi3zTt37gV/GnwdhELXocpG7XO03K0IkyP5voxYWujkE9bH
 7ZkrP1LMUsCoHB5t4VRdMCaIy3WRVmeUqsvLnucdwoJUvwHM31XXZ98WB g==;
X-CSE-ConnectionGUID: CEq91anlSZikenLeRd6vWg==
X-CSE-MsgGUID: 8BsbdrmpR2Cfw54gq6oT4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34152774"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34152774"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 02:52:56 -0800
X-CSE-ConnectionGUID: jS57T9r/QpqEV/Ky8/oXHg==
X-CSE-MsgGUID: uIRiQ5lZTAmB8k4N2xk+Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="125880082"
Received: from amiszcza-mobl.ger.corp.intel.com (HELO [10.245.81.229])
 ([10.245.81.229])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 02:52:55 -0800
Message-ID: <8b3ad32b-683d-4088-8b02-a30296f2f0e1@linux.intel.com>
Date: Mon, 9 Dec 2024 11:52:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHZtdGI6IElu?=
 =?UTF-8?Q?troduce_SR-IOV_VM-level_testing_tool_=28rev3=29?=
To: igt-dev@lists.freedesktop.org
References: <20241127102202.3903735-1-adam.miszczak@linux.intel.com>
 <173271472524.3737589.16616294820264870137@b555e5b46a47>
Content-Language: en-US
From: Adam Miszczak <adam.miszczak@linux.intel.com>
In-Reply-To: <173271472524.3737589.16616294820264870137@b555e5b46a47>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Unrelated issues: series introduces a new tool independent from the 
existing igt tests.

- Adam Miszczak

On 27.11.2024 14:38, Patchwork wrote:
> == Series Details ==
>
> Series: vmtb: Introduce SR-IOV VM-level testing tool (rev3)
> URL   : https://patchwork.freedesktop.org/series/141049/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from CI_DRM_15751_full -> IGTPW_12206_full
> ====================================================
>
> Summary
> -------
>
>    **FAILURE**
>
>    Serious unknown changes coming with IGTPW_12206_full absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_12206_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
>
>    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/index.html
>
> Participating hosts (10 -> 10)
> ------------------------------
>
>    No changes in participating hosts
>
> Possible new issues
> -------------------
>
>    Here are the unknown changes that may have been introduced in IGTPW_12206_full:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>    * igt@core_getversion@basic:
>      - shard-dg2:          [PASS][1] -> [FAIL][2]
>     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-5/igt@core_getversion@basic.html
>     [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-11/igt@core_getversion@basic.html
>
>    * igt@core_hotunplug@unbind-rebind:
>      - shard-dg2:          NOTRUN -> [SKIP][3]
>     [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-11/igt@core_hotunplug@unbind-rebind.html
>
>    * igt@gem_tiled_swapping@non-threaded:
>      - shard-rkl:          [PASS][4] -> [FAIL][5]
>     [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-7/igt@gem_tiled_swapping@non-threaded.html
>     [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-1/igt@gem_tiled_swapping@non-threaded.html
>
>    * igt@i915_module_load@resize-bar:
>      - shard-dg2:          [PASS][6] -> [SKIP][7]
>     [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-10/igt@i915_module_load@resize-bar.html
>     [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-11/igt@i915_module_load@resize-bar.html
>
>    * igt@i915_selftest@live@gt_pm:
>      - shard-rkl:          [PASS][8] -> [DMESG-FAIL][9]
>     [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-1/igt@i915_selftest@live@gt_pm.html
>     [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-7/igt@i915_selftest@live@gt_pm.html
>
>    * igt@i915_suspend@basic-s3-without-i915:
>      - shard-dg2:          NOTRUN -> [WARN][10]
>     [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html
>
>    * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>      - shard-dg2:          [PASS][11] -> [INCOMPLETE][12]
>     [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>     [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>
>    
> #### Warnings ####
>
>    * igt@device_reset@cold-reset-bound:
>      - shard-dg2:          [SKIP][13] ([i915#11078]) -> [SKIP][14]
>     [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-8/igt@device_reset@cold-reset-bound.html
>     [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-11/igt@device_reset@cold-reset-bound.html
>
>    
> Known issues
> ------------
>
>    Here are the changes found in IGTPW_12206_full that come from known issues:
>
> ### IGT changes ###
>
> #### Issues hit ####
>
>    * igt@api_intel_bb@blit-reloc-keep-cache:
>      - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#8411])
>     [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-6/igt@api_intel_bb@blit-reloc-keep-cache.html
>      - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#8411])
>     [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-5/igt@api_intel_bb@blit-reloc-keep-cache.html
>
>    * igt@api_intel_bb@crc32:
>      - shard-tglu-1:       NOTRUN -> [SKIP][17] ([i915#6230])
>     [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@api_intel_bb@crc32.html
>
>    * igt@device_reset@unbind-cold-reset-rebind:
>      - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#11078])
>     [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-5/igt@device_reset@unbind-cold-reset-rebind.html
>      - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#11078])
>     [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@device_reset@unbind-cold-reset-rebind.html
>      - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#11078])
>     [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-2/igt@device_reset@unbind-cold-reset-rebind.html
>
>    * igt@drm_fdinfo@busy-idle-check-all@vcs1:
>      - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#8414]) +12 other tests skip
>     [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@drm_fdinfo@busy-idle-check-all@vcs1.html
>
>    * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
>      - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#8414]) +23 other tests skip
>     [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-1/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html
>
>    * igt@drm_fdinfo@virtual-busy-hang:
>      - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#12506]) +5 other tests skip
>     [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-11/igt@drm_fdinfo@virtual-busy-hang.html
>
>    * igt@gem_caching@writes:
>      - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#4873])
>     [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-7/igt@gem_caching@writes.html
>
>    * igt@gem_ccs@ctrl-surf-copy:
>      - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#3555] / [i915#9323])
>     [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy.html
>      - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#3555] / [i915#9323])
>     [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-12/igt@gem_ccs@ctrl-surf-copy.html
>
>    * igt@gem_ccs@large-ctrl-surf-copy:
>      - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#13008])
>     [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-2/igt@gem_ccs@large-ctrl-surf-copy.html
>      - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#13008])
>     [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-8/igt@gem_ccs@large-ctrl-surf-copy.html
>      - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#13008])
>     [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-4/igt@gem_ccs@large-ctrl-surf-copy.html
>
>    * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
>      - shard-dg2:          [PASS][30] -> [INCOMPLETE][31] ([i915#12392] / [i915#7297])
>     [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
>     [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
>
>    * igt@gem_close_race@multigpu-basic-process:
>      - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#7697])
>     [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-6/igt@gem_close_race@multigpu-basic-process.html
>      - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#7697])
>     [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-4/igt@gem_close_race@multigpu-basic-process.html
>
>    * igt@gem_close_race@multigpu-basic-threads:
>      - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#7697]) +1 other test skip
>     [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@gem_close_race@multigpu-basic-threads.html
>
>    * igt@gem_create@create-ext-cpu-access-big:
>      - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#6335])
>     [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-3/igt@gem_create@create-ext-cpu-access-big.html
>      - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#6335])
>     [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-5/igt@gem_create@create-ext-cpu-access-big.html
>
>    * igt@gem_create@create-ext-set-pat:
>      - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#8562])
>     [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-12/igt@gem_create@create-ext-set-pat.html
>
>    * igt@gem_ctx_exec@basic-nohangcheck:
>      - shard-dg2:          [PASS][38] -> [SKIP][39] ([i915#2575]) +118 other tests skip
>     [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-4/igt@gem_ctx_exec@basic-nohangcheck.html
>     [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-11/igt@gem_ctx_exec@basic-nohangcheck.html
>
>    * igt@gem_ctx_persistence@hang:
>      - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#8555]) +1 other test skip
>     [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-3/igt@gem_ctx_persistence@hang.html
>      - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#8555])
>     [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-4/igt@gem_ctx_persistence@hang.html
>
>    * igt@gem_ctx_persistence@heartbeat-hostile:
>      - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#8555]) +2 other tests skip
>     [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-13/igt@gem_ctx_persistence@heartbeat-hostile.html
>
>    * igt@gem_ctx_persistence@hostile:
>      - shard-dg1:          NOTRUN -> [FAIL][43] ([i915#11980] / [i915#12580])
>     [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@gem_ctx_persistence@hostile.html
>      - shard-mtlp:         NOTRUN -> [FAIL][44] ([i915#11980] / [i915#12580])
>     [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-8/igt@gem_ctx_persistence@hostile.html
>
>    * igt@gem_ctx_persistence@smoketest:
>      - shard-snb:          NOTRUN -> [SKIP][45] ([i915#1099]) +3 other tests skip
>     [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-snb7/igt@gem_ctx_persistence@smoketest.html
>
>    * igt@gem_ctx_sseu@invalid-sseu:
>      - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#280])
>     [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-10/igt@gem_ctx_sseu@invalid-sseu.html
>      - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#280])
>     [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-17/igt@gem_ctx_sseu@invalid-sseu.html
>
>    * igt@gem_eio@kms:
>      - shard-dg1:          NOTRUN -> [FAIL][48] ([i915#5784])
>     [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-17/igt@gem_eio@kms.html
>
>    * igt@gem_exec_balancer@bonded-false-hang:
>      - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#4812])
>     [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-3/igt@gem_exec_balancer@bonded-false-hang.html
>
>    * igt@gem_exec_balancer@parallel-ordering:
>      - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#4525])
>     [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-2/igt@gem_exec_balancer@parallel-ordering.html
>      - shard-tglu:         NOTRUN -> [FAIL][51] ([i915#6117])
>     [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-9/igt@gem_exec_balancer@parallel-ordering.html
>
>    * igt@gem_exec_capture@capture-recoverable:
>      - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#6344])
>     [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-3/igt@gem_exec_capture@capture-recoverable.html
>      - shard-tglu:         NOTRUN -> [SKIP][53] ([i915#6344])
>     [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-5/igt@gem_exec_capture@capture-recoverable.html
>
>    * igt@gem_exec_capture@capture@vecs0-lmem0:
>      - shard-dg1:          NOTRUN -> [FAIL][54] ([i915#11965] / [i915#12558]) +2 other tests fail
>     [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-13/igt@gem_exec_capture@capture@vecs0-lmem0.html
>
>    * igt@gem_exec_fence@submit:
>      - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4812]) +2 other tests skip
>     [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@gem_exec_fence@submit.html
>      - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4812])
>     [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-7/igt@gem_exec_fence@submit.html
>
>    * igt@gem_exec_flush@basic-uc-pro-default:
>      - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#3539] / [i915#4852]) +2 other tests skip
>     [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@gem_exec_flush@basic-uc-pro-default.html
>
>    * igt@gem_exec_flush@basic-uc-prw-default:
>      - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#3539])
>     [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-14/igt@gem_exec_flush@basic-uc-prw-default.html
>
>    * igt@gem_exec_flush@basic-uc-ro-default:
>      - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#3539] / [i915#4852]) +3 other tests skip
>     [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-2/igt@gem_exec_flush@basic-uc-ro-default.html
>
>    * igt@gem_exec_reloc@basic-gtt:
>      - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#3281]) +6 other tests skip
>     [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-7/igt@gem_exec_reloc@basic-gtt.html
>      - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#3281]) +4 other tests skip
>     [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-1/igt@gem_exec_reloc@basic-gtt.html
>
>    * igt@gem_exec_reloc@basic-write-cpu-active:
>      - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#3281]) +11 other tests skip
>     [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-14/igt@gem_exec_reloc@basic-write-cpu-active.html
>
>    * igt@gem_exec_reloc@basic-write-wc-noreloc:
>      - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#3281]) +4 other tests skip
>     [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-7/igt@gem_exec_reloc@basic-write-wc-noreloc.html
>
>    * igt@gem_exec_schedule@thriceslice:
>      - shard-snb:          NOTRUN -> [SKIP][64] +155 other tests skip
>     [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-snb4/igt@gem_exec_schedule@thriceslice.html
>
>    * igt@gem_exec_whisper@basic-queues-priority:
>      - shard-rkl:          NOTRUN -> [DMESG-WARN][65] ([i915#12917] / [i915#12964])
>     [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-5/igt@gem_exec_whisper@basic-queues-priority.html
>
>    * igt@gem_fence_thrash@bo-write-verify-threaded-none:
>      - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4860]) +2 other tests skip
>     [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-17/igt@gem_fence_thrash@bo-write-verify-threaded-none.html
>
>    * igt@gem_fence_thrash@bo-write-verify-y:
>      - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4860])
>     [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-y.html
>
>    * igt@gem_fenced_exec_thrash@too-many-fences:
>      - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4860]) +1 other test skip
>     [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-4/igt@gem_fenced_exec_thrash@too-many-fences.html
>
>    * igt@gem_huc_copy@huc-copy:
>      - shard-tglu:         NOTRUN -> [SKIP][69] ([i915#2190])
>     [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-6/igt@gem_huc_copy@huc-copy.html
>
>    * igt@gem_lmem_swapping@heavy-multi:
>      - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#12936])
>     [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-11/igt@gem_lmem_swapping@heavy-multi.html
>
>    * igt@gem_lmem_swapping@heavy-random:
>      - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#4613]) +4 other tests skip
>     [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-10/igt@gem_lmem_swapping@heavy-random.html
>
>    * igt@gem_lmem_swapping@heavy-verify-multi:
>      - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4613]) +2 other tests skip
>     [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-3/igt@gem_lmem_swapping@heavy-verify-multi.html
>
>    * igt@gem_lmem_swapping@massive:
>      - shard-dg2:          [PASS][73] -> [SKIP][74] ([i915#12936]) +3 other tests skip
>     [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-3/igt@gem_lmem_swapping@massive.html
>     [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-11/igt@gem_lmem_swapping@massive.html
>
>    * igt@gem_lmem_swapping@massive-random:
>      - shard-dg1:          NOTRUN -> [DMESG-WARN][75] ([i915#4423])
>     [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@gem_lmem_swapping@massive-random.html
>
>    * igt@gem_lmem_swapping@parallel-random:
>      - shard-tglu-1:       NOTRUN -> [SKIP][76] ([i915#4613]) +1 other test skip
>     [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@gem_lmem_swapping@parallel-random.html
>
>    * igt@gem_lmem_swapping@random:
>      - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#4613])
>     [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-7/igt@gem_lmem_swapping@random.html
>
>    * igt@gem_lmem_swapping@random-engines:
>      - shard-glk:          NOTRUN -> [SKIP][78] ([i915#4613]) +4 other tests skip
>     [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-glk9/igt@gem_lmem_swapping@random-engines.html
>
>    * igt@gem_lmem_swapping@smem-oom@lmem0:
>      - shard-dg1:          NOTRUN -> [TIMEOUT][79] ([i915#5493]) +1 other test timeout
>     [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html
>
>    * igt@gem_media_vme:
>      - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#284])
>     [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-7/igt@gem_media_vme.html
>
>    * igt@gem_mmap@pf-nonblock:
>      - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4083]) +2 other tests skip
>     [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-1/igt@gem_mmap@pf-nonblock.html
>
>    * igt@gem_mmap_gtt@basic-small-copy-odd:
>      - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#4077]) +17 other tests skip
>     [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-14/igt@gem_mmap_gtt@basic-small-copy-odd.html
>
>    * igt@gem_mmap_gtt@cpuset-big-copy:
>      - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#4077]) +9 other tests skip
>     [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-4/igt@gem_mmap_gtt@cpuset-big-copy.html
>
>    * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
>      - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#4077]) +6 other tests skip
>     [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-5/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html
>
>    * igt@gem_mmap_wc@coherency:
>      - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#4083]) +5 other tests skip
>     [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-2/igt@gem_mmap_wc@coherency.html
>
>    * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
>      - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4083]) +5 other tests skip
>     [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html
>
>    * igt@gem_partial_pwrite_pread@reads-snoop:
>      - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#3282]) +8 other tests skip
>     [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-13/igt@gem_partial_pwrite_pread@reads-snoop.html
>
>    * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
>      - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#3282])
>     [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
>      - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#3282])
>     [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-7/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
>
>    * igt@gem_pread@exhaustion:
>      - shard-tglu:         NOTRUN -> [WARN][90] ([i915#2658])
>     [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-6/igt@gem_pread@exhaustion.html
>      - shard-glk:          NOTRUN -> [WARN][91] ([i915#2658])
>     [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-glk9/igt@gem_pread@exhaustion.html
>
>    * igt@gem_pxp@hw-rejects-pxp-buffer:
>      - shard-tglu-1:       NOTRUN -> [FAIL][92] ([i915#12940])
>     [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.html
>
>    * igt@gem_pxp@hw-rejects-pxp-context:
>      - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#13033])
>     [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-9/igt@gem_pxp@hw-rejects-pxp-context.html
>
>    * igt@gem_pxp@protected-raw-src-copy-not-readible:
>      - shard-rkl:          NOTRUN -> [TIMEOUT][94] ([i915#12917] / [i915#12964]) +1 other test timeout
>     [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html
>
>    * igt@gem_pxp@regular-baseline-src-copy-readible:
>      - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#4270]) +4 other tests skip
>     [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-3/igt@gem_pxp@regular-baseline-src-copy-readible.html
>
>    * igt@gem_pxp@reject-modify-context-protection-on:
>      - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4270]) +5 other tests skip
>     [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-14/igt@gem_pxp@reject-modify-context-protection-on.html
>
>    * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
>      - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#8428]) +5 other tests skip
>     [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-5/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html
>
>    * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
>      - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#5190] / [i915#8428]) +5 other tests skip
>     [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-3/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html
>
>    * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
>      - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#2575] / [i915#5190]) +3 other tests skip
>     [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
>
>    * igt@gem_render_tiled_blits@basic:
>      - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#4079])
>     [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-10/igt@gem_render_tiled_blits@basic.html
>
>    * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
>      - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#4079]) +1 other test skip
>     [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-13/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
>
>    * igt@gem_set_tiling_vs_gtt:
>      - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#4079])
>     [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-7/igt@gem_set_tiling_vs_gtt.html
>
>    * igt@gem_userptr_blits@create-destroy-unsync:
>      - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#2575]) +98 other tests skip
>     [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-11/igt@gem_userptr_blits@create-destroy-unsync.html
>      - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#3297]) +1 other test skip
>     [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-2/igt@gem_userptr_blits@create-destroy-unsync.html
>      - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#3297]) +2 other tests skip
>     [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-9/igt@gem_userptr_blits@create-destroy-unsync.html
>      - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#3297]) +1 other test skip
>     [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-7/igt@gem_userptr_blits@create-destroy-unsync.html
>
>    * igt@gem_userptr_blits@dmabuf-sync:
>      - shard-tglu-1:       NOTRUN -> [SKIP][107] ([i915#3297] / [i915#3323])
>     [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@gem_userptr_blits@dmabuf-sync.html
>
>    * igt@gem_userptr_blits@dmabuf-unsync:
>      - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#3297]) +1 other test skip
>     [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-13/igt@gem_userptr_blits@dmabuf-unsync.html
>
>    * igt@gem_userptr_blits@readonly-unsync:
>      - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#3297]) +1 other test skip
>     [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-10/igt@gem_userptr_blits@readonly-unsync.html
>
>    * igt@gem_userptr_blits@relocations:
>      - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#3281] / [i915#3297])
>     [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@gem_userptr_blits@relocations.html
>
>    * igt@gen7_exec_parse@bitmasks:
>      - shard-dg2:          NOTRUN -> [SKIP][111] +62 other tests skip
>     [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-1/igt@gen7_exec_parse@bitmasks.html
>
>    * igt@gen9_exec_parse@basic-rejected:
>      - shard-tglu-1:       NOTRUN -> [SKIP][112] ([i915#2527] / [i915#2856])
>     [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@gen9_exec_parse@basic-rejected.html
>
>    * igt@gen9_exec_parse@bb-start-out:
>      - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#2527]) +2 other tests skip
>     [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-5/igt@gen9_exec_parse@bb-start-out.html
>      - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#2527]) +8 other tests skip
>     [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@gen9_exec_parse@bb-start-out.html
>
>    * igt@gen9_exec_parse@cmd-crossing-page:
>      - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#2527] / [i915#2856]) +5 other tests skip
>     [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-10/igt@gen9_exec_parse@cmd-crossing-page.html
>
>    * igt@gen9_exec_parse@unaligned-jump:
>      - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#2856]) +2 other tests skip
>     [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-2/igt@gen9_exec_parse@unaligned-jump.html
>
>    * igt@gen9_exec_parse@valid-registers:
>      - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#2856]) +4 other tests skip
>     [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-6/igt@gen9_exec_parse@valid-registers.html
>
>    * igt@i915_module_load@reload-with-fault-injection:
>      - shard-mtlp:         [PASS][118] -> [ABORT][119] ([i915#10131] / [i915#10887] / [i915#9820])
>     [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html
>     [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html
>
>    * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
>      - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#7091])
>     [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
>      - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#8436])
>     [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-8/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
>
>    * igt@i915_pm_freq_api@freq-reset-multiple:
>      - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#8399])
>     [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-5/igt@i915_pm_freq_api@freq-reset-multiple.html
>
>    * igt@i915_pm_freq_api@freq-suspend:
>      - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#8399])
>     [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html
>
>    * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
>      - shard-dg1:          NOTRUN -> [FAIL][124] ([i915#12548] / [i915#3591]) +1 other test fail
>     [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
>
>    * igt@i915_pm_rpm@sysfs-read:
>      - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#13014]) +1 other test skip
>     [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-11/igt@i915_pm_rpm@sysfs-read.html
>
>    * igt@i915_pm_rps@min-max-config-idle:
>      - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#11681] / [i915#6621])
>     [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-17/igt@i915_pm_rps@min-max-config-idle.html
>
>    * igt@i915_pm_rps@thresholds-idle:
>      - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#11681])
>     [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@i915_pm_rps@thresholds-idle.html
>
>    * igt@i915_pm_sseu@full-enable:
>      - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#4387])
>     [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-2/igt@i915_pm_sseu@full-enable.html
>
>    * igt@i915_query@test-query-geometry-subslices:
>      - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#5723])
>     [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-8/igt@i915_query@test-query-geometry-subslices.html
>
>    * igt@i915_selftest@mock:
>      - shard-tglu:         NOTRUN -> [DMESG-WARN][130] ([i915#9311]) +1 other test dmesg-warn
>     [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-9/igt@i915_selftest@mock.html
>
>    * igt@i915_suspend@basic-s3-without-i915:
>      - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#6645])
>     [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-4/igt@i915_suspend@basic-s3-without-i915.html
>
>    * igt@intel_hwmon@hwmon-read:
>      - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#7707])
>     [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-2/igt@intel_hwmon@hwmon-read.html
>
>    * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
>      - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#4212])
>     [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-14/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
>
>    * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>      - shard-mtlp:         NOTRUN -> [SKIP][134] ([i915#4212])
>     [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-5/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
>
>    * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
>      - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#8709]) +11 other tests skip
>     [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html
>
>    * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>      - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#9531])
>     [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>      - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#9531])
>     [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>
>    * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>      - shard-snb:          NOTRUN -> [SKIP][138] ([i915#1769]) +1 other test skip
>     [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-snb1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>      - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#1769] / [i915#3555])
>     [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>      - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#1769] / [i915#3555])
>     [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>
>    * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>      - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#1769] / [i915#3555]) +1 other test skip
>     [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>      - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#1769] / [i915#3555]) +1 other test skip
>     [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>
>    * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
>      - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#5286]) +3 other tests skip
>     [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
>
>    * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
>      - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#4538] / [i915#5286]) +7 other tests skip
>     [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
>
>    * igt@kms_big_fb@4-tiled-addfb-size-overflow:
>      - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#5286])
>     [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
>
>    * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
>      - shard-tglu-1:       NOTRUN -> [SKIP][146] ([i915#5286])
>     [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
>
>    * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>      - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#5286]) +7 other tests skip
>     [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>
>    * igt@kms_big_fb@linear-8bpp-rotate-270:
>      - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#3638]) +2 other tests skip
>     [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-1/igt@kms_big_fb@linear-8bpp-rotate-270.html
>      - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#3638]) +5 other tests skip
>     [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-17/igt@kms_big_fb@linear-8bpp-rotate-270.html
>
>    * igt@kms_big_fb@y-tiled-addfb:
>      - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#6187])
>     [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-8/igt@kms_big_fb@y-tiled-addfb.html
>
>    * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>      - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#5190]) +8 other tests skip
>     [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>
>    * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>      - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#4538] / [i915#5190]) +6 other tests skip
>     [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>
>    * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>      - shard-mtlp:         NOTRUN -> [SKIP][153] +15 other tests skip
>     [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
>
>    * igt@kms_big_fb@yf-tiled-addfb:
>      - shard-rkl:          NOTRUN -> [SKIP][154] +8 other tests skip
>     [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-1/igt@kms_big_fb@yf-tiled-addfb.html
>
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>      - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#4538]) +5 other tests skip
>     [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>
>    * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
>      - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#6095]) +183 other tests skip
>     [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html
>
>    * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:
>      - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#6095]) +84 other tests skip
>     [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-4/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html
>
>    * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>      - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#12313]) +1 other test skip
>     [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>      - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#12313]) +1 other test skip
>     [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>
>    * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>      - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#12313])
>     [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
>
>    * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
>      - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#6095]) +87 other tests skip
>     [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html
>
>    * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>      - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#12313]) +1 other test skip
>     [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
>
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>      - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#12805])
>     [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>      - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#12805])
>     [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
>
>    * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
>      - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#6095]) +11 other tests skip
>     [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html
>
>    * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
>      - shard-tglu-1:       NOTRUN -> [SKIP][166] ([i915#6095]) +39 other tests skip
>     [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
>
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
>      - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#10307] / [i915#6095]) +156 other tests skip
>     [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html
>
>    * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
>      - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
>     [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html
>
>    * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
>      - shard-glk:          NOTRUN -> [SKIP][169] +301 other tests skip
>     [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-glk9/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html
>
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:
>      - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#6095]) +54 other tests skip
>     [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html
>
>    * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
>      - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#11616] / [i915#7213]) +3 other tests skip
>     [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html
>
>    * igt@kms_chamelium_audio@dp-audio-edid:
>      - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#7828]) +8 other tests skip
>     [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-7/igt@kms_chamelium_audio@dp-audio-edid.html
>
>    * igt@kms_chamelium_frames@dp-crc-single:
>      - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#7828]) +10 other tests skip
>     [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-12/igt@kms_chamelium_frames@dp-crc-single.html
>
>    * igt@kms_chamelium_hpd@dp-hpd:
>      - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#7828]) +5 other tests skip
>     [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd.html
>
>    * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
>      - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#7828]) +1 other test skip
>     [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
>
>    * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>      - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#7828]) +10 other tests skip
>     [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-3/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
>
>    * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
>      - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#7828]) +7 other tests skip
>     [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-6/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html
>
>    * igt@kms_content_protection@atomic-dpms:
>      - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
>     [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-5/igt@kms_content_protection@atomic-dpms.html
>      - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#6944] / [i915#9424])
>     [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-2/igt@kms_content_protection@atomic-dpms.html
>
>    * igt@kms_content_protection@dp-mst-lic-type-1:
>      - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#3299])
>     [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_content_protection@dp-mst-lic-type-1.html
>
>    * igt@kms_content_protection@mei-interface:
>      - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#9424]) +1 other test skip
>     [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-3/igt@kms_content_protection@mei-interface.html
>      - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#9424])
>     [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_content_protection@mei-interface.html
>
>    * igt@kms_content_protection@type1:
>      - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#7118] / [i915#9424]) +2 other tests skip
>     [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-2/igt@kms_content_protection@type1.html
>      - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#7118] / [i915#9424]) +1 other test skip
>     [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-5/igt@kms_content_protection@type1.html
>      - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#7116] / [i915#9424]) +1 other test skip
>     [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_content_protection@type1.html
>      - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#3555] / [i915#6944] / [i915#9424])
>     [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-2/igt@kms_content_protection@type1.html
>
>    * igt@kms_cursor_crc@cursor-offscreen-32x32:
>      - shard-tglu-1:       NOTRUN -> [SKIP][187] ([i915#3555]) +2 other tests skip
>     [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html
>
>    * igt@kms_cursor_crc@cursor-offscreen-512x512:
>      - shard-tglu-1:       NOTRUN -> [SKIP][188] ([i915#13049])
>     [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>
>    * igt@kms_cursor_crc@cursor-onscreen-256x256:
>      - shard-rkl:          [PASS][189] -> [DMESG-WARN][190] ([i915#12964]) +48 other tests dmesg-warn
>     [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-256x256.html
>     [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x256.html
>
>    * igt@kms_cursor_crc@cursor-onscreen-512x170:
>      - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#13049])
>     [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>
>    * igt@kms_cursor_crc@cursor-random-512x512:
>      - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#13049]) +4 other tests skip
>     [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-12/igt@kms_cursor_crc@cursor-random-512x512.html
>
>    * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
>      - shard-mtlp:         NOTRUN -> [SKIP][193] ([i915#8814]) +2 other tests skip
>     [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
>
>    * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>      - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#3555] / [i915#8814]) +1 other test skip
>     [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
>
>    * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>      - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#13049]) +2 other tests skip
>     [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>
>    * igt@kms_cursor_crc@cursor-sliding-512x170:
>      - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#13049]) +1 other test skip
>     [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-5/igt@kms_cursor_crc@cursor-sliding-512x170.html
>
>    * igt@kms_cursor_crc@cursor-sliding-512x512:
>      - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#13049])
>     [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
>
>    * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>      - shard-rkl:          [PASS][198] -> [DMESG-FAIL][199] ([i915#12964]) +4 other tests dmesg-fail
>     [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
>     [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
>
>    * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>      - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#9809]) +4 other tests skip
>     [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>
>    * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>      - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#4213])
>     [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>      - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#4103] / [i915#4213])
>     [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>
>    * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
>      - shard-mtlp:         [PASS][203] -> [FAIL][204] ([i915#2346])
>     [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-mtlp-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
>     [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
>
>    * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>      - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#9067])
>     [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-2/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][206] ([i915#9067])
>     [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
>
>    * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>      - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#4103] / [i915#4213])
>     [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>      - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#4103])
>     [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>
>    * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>      - shard-snb:          NOTRUN -> [FAIL][209] ([i915#12170])
>     [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-snb6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
>
>    * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
>      - shard-snb:          NOTRUN -> [FAIL][210] ([i915#11968])
>     [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-snb6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html
>
>    * igt@kms_dp_linktrain_fallback@dp-fallback:
>      - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#12402])
>     [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_dp_linktrain_fallback@dp-fallback.html
>
>    * igt@kms_draw_crc@draw-method-mmap-wc:
>      - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#8812])
>     [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-wc.html
>
>    * igt@kms_dsc@dsc-fractional-bpp:
>      - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#3840] / [i915#9688])
>     [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp.html
>
>    * igt@kms_dsc@dsc-with-formats:
>      - shard-tglu-1:       NOTRUN -> [SKIP][214] ([i915#3555] / [i915#3840])
>     [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_dsc@dsc-with-formats.html
>
>    * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>      - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#3840] / [i915#9053])
>     [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>      - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#3840] / [i915#9053])
>     [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-14/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>
>    * igt@kms_feature_discovery@chamelium:
>      - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#2065] / [i915#4854])
>     [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-9/igt@kms_feature_discovery@chamelium.html
>
>    * igt@kms_feature_discovery@dp-mst:
>      - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#9337])
>     [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-2/igt@kms_feature_discovery@dp-mst.html
>      - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#9337])
>     [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-2/igt@kms_feature_discovery@dp-mst.html
>
>    * igt@kms_feature_discovery@psr2:
>      - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#658])
>     [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-5/igt@kms_feature_discovery@psr2.html
>
>    * igt@kms_fence_pin_leak:
>      - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#4881])
>     [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-14/igt@kms_fence_pin_leak.html
>
>    * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>      - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#3637]) +6 other tests skip
>     [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
>
>    * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:
>      - shard-snb:          [PASS][223] -> [FAIL][224] ([i915#11989]) +1 other test fail
>     [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html
>     [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-snb4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html
>
>    * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>      - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#9934]) +7 other tests skip
>     [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-12/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>
>    * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
>      - shard-glk:          [PASS][226] -> [FAIL][227] ([i915#13027]) +1 other test fail
>     [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
>     [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
>
>    * igt@kms_flip@2x-flip-vs-panning:
>      - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#9934]) +1 other test skip
>     [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-4/igt@kms_flip@2x-flip-vs-panning.html
>
>    * igt@kms_flip@2x-flip-vs-rmfb:
>      - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#3637]) +2 other tests skip
>     [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-3/igt@kms_flip@2x-flip-vs-rmfb.html
>
>    * igt@kms_flip@2x-modeset-vs-vblank-race:
>      - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#9934]) +6 other tests skip
>     [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
>
>    * igt@kms_flip@2x-plain-flip-interruptible:
>      - shard-tglu-1:       NOTRUN -> [SKIP][231] ([i915#3637]) +4 other tests skip
>     [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_flip@2x-plain-flip-interruptible.html
>
>    * igt@kms_flip@blocking-wf_vblank:
>      - shard-rkl:          [PASS][232] -> [FAIL][233] ([i915#11989] / [i915#12840])
>     [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-1/igt@kms_flip@blocking-wf_vblank.html
>     [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-1/igt@kms_flip@blocking-wf_vblank.html
>
>    * igt@kms_flip@blocking-wf_vblank@a-hdmi-a2:
>      - shard-rkl:          [PASS][234] -> [FAIL][235] ([i915#11989])
>     [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-1/igt@kms_flip@blocking-wf_vblank@a-hdmi-a2.html
>     [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-1/igt@kms_flip@blocking-wf_vblank@a-hdmi-a2.html
>
>    * igt@kms_flip@flip-vs-blocking-wf-vblank:
>      - shard-dg1:          [PASS][236] -> [INCOMPLETE][237] ([i915#6113]) +1 other test incomplete
>     [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg1-14/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>     [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-14/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>
>    * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
>      - shard-mtlp:         [PASS][238] -> [FAIL][239] ([i915#11989]) +1 other test fail
>     [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-mtlp-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
>     [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
>
>    * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a3:
>      - shard-dg2:          NOTRUN -> [FAIL][240] ([i915#11989]) +6 other tests fail
>     [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-7/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a3.html
>
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
>      - shard-dg2:          NOTRUN -> [FAIL][241] ([i915#13027])
>     [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
>
>    * igt@kms_flip@flip-vs-fences:
>      - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#8381])
>     [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-6/igt@kms_flip@flip-vs-fences.html
>
>    * igt@kms_flip@flip-vs-fences-interruptible:
>      - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#8381])
>     [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-8/igt@kms_flip@flip-vs-fences-interruptible.html
>      - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#8381])
>     [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-17/igt@kms_flip@flip-vs-fences-interruptible.html
>
>    * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>      - shard-tglu-1:       NOTRUN -> [SKIP][245] ([i915#2672] / [i915#3555])
>     [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
>
>    * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>      - shard-tglu-1:       NOTRUN -> [SKIP][246] ([i915#2587] / [i915#2672]) +1 other test skip
>     [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
>
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>      - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#2587] / [i915#2672]) +6 other tests skip
>     [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
>
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>      - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#2587] / [i915#2672]) +5 other tests skip
>     [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
>
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>      - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#2672] / [i915#3555]) +5 other tests skip
>     [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
>      - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#2672] / [i915#3555]) +2 other tests skip
>     [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
>
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>      - shard-tglu-1:       NOTRUN -> [SKIP][251] ([i915#2587] / [i915#2672] / [i915#3555])
>     [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
>      - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#2587] / [i915#2672] / [i915#3555])
>     [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
>
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
>      - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#2672] / [i915#3555] / [i915#5190]) +5 other tests skip
>     [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
>
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>      - shard-mtlp:         NOTRUN -> [SKIP][254] ([i915#2672] / [i915#8813]) +1 other test skip
>     [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
>
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>      - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#2672] / [i915#3555]) +1 other test skip
>     [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
>
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
>      - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#2672]) +1 other test skip
>     [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html
>
>    * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>      - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#2672] / [i915#3555]) +5 other tests skip
>     [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
>
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
>      - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#2672]) +12 other tests skip
>     [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html
>
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>      - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#2672] / [i915#3555] / [i915#8813]) +5 other tests skip
>     [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
>
>    * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt:
>      - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#8708]) +8 other tests skip
>     [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt.html
>
>    * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
>      - shard-dg2:          NOTRUN -> [FAIL][261] ([i915#6880]) +1 other test fail
>     [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
>
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:
>      - shard-snb:          [PASS][262] -> [SKIP][263] +11 other tests skip
>     [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html
>     [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html
>
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>      - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#8708]) +16 other tests skip
>     [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
>
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>      - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#1825]) +21 other tests skip
>     [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
>
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>      - shard-tglu-1:       NOTRUN -> [SKIP][266] +39 other tests skip
>     [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
>
>    * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
>      - shard-dg2:          [PASS][267] -> [SKIP][268] +22 other tests skip
>     [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
>     [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
>
>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
>      - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#3458]) +19 other tests skip
>     [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html
>
>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
>      - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#3023]) +9 other tests skip
>     [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
>
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>      - shard-dg1:          NOTRUN -> [SKIP][271] +53 other tests skip
>     [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
>
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:
>      - shard-mtlp:         NOTRUN -> [SKIP][272] ([i915#1825]) +21 other tests skip
>     [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html
>
>    * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
>      - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#3458]) +31 other tests skip
>     [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
>
>    * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>      - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#10055])
>     [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>
>    * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>      - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#9766])
>     [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
>
>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
>      - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#8708]) +18 other tests skip
>     [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
>
>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>      - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#4423] / [i915#8708])
>     [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
>
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
>      - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#5354]) +33 other tests skip
>     [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html
>
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>      - shard-tglu:         NOTRUN -> [SKIP][279] +106 other tests skip
>     [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>
>    * igt@kms_getfb@getfb-reject-ccs:
>      - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#6118])
>     [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-3/igt@kms_getfb@getfb-reject-ccs.html
>
>    * igt@kms_hdr@bpc-switch-dpms:
>      - shard-tglu-1:       NOTRUN -> [SKIP][281] ([i915#3555] / [i915#8228])
>     [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_hdr@bpc-switch-dpms.html
>      - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#3555] / [i915#8228]) +2 other tests skip
>     [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-17/igt@kms_hdr@bpc-switch-dpms.html
>
>    * igt@kms_hdr@brightness-with-hdr:
>      - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#12713])
>     [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-4/igt@kms_hdr@brightness-with-hdr.html
>
>    * igt@kms_hdr@invalid-metadata-sizes:
>      - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#3555] / [i915#8228])
>     [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-4/igt@kms_hdr@invalid-metadata-sizes.html
>      - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#3555] / [i915#8228])
>     [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-2/igt@kms_hdr@invalid-metadata-sizes.html
>
>    * igt@kms_joiner@basic-big-joiner:
>      - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#10656])
>     [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-2/igt@kms_joiner@basic-big-joiner.html
>      - shard-mtlp:         NOTRUN -> [SKIP][287] ([i915#10656])
>     [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-7/igt@kms_joiner@basic-big-joiner.html
>
>    * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>      - shard-tglu-1:       NOTRUN -> [SKIP][288] ([i915#12394])
>     [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
>      - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#12394])
>     [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-17/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
>
>    * igt@kms_joiner@invalid-modeset-ultra-joiner:
>      - shard-mtlp:         NOTRUN -> [SKIP][290] ([i915#12339])
>     [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>      - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#12339])
>     [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>      - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#12339])
>     [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>
>    * igt@kms_plane_lowres@tiling-y:
>      - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#3555] / [i915#8821])
>     [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-7/igt@kms_plane_lowres@tiling-y.html
>
>    * igt@kms_plane_lowres@tiling-yf:
>      - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#3555] / [i915#8821])
>     [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html
>
>    * igt@kms_plane_multiple@tiling-yf:
>      - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#3555]) +3 other tests skip
>     [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html
>      - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#3555]) +3 other tests skip
>     [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-3/igt@kms_plane_multiple@tiling-yf.html
>      - shard-mtlp:         NOTRUN -> [SKIP][297] ([i915#3555] / [i915#8806])
>     [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-5/igt@kms_plane_multiple@tiling-yf.html
>
>    * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>      - shard-dg2:          NOTRUN -> [FAIL][298] ([i915#8292])
>     [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>
>    * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
>      - shard-dg2:          [PASS][299] -> [SKIP][300] ([i915#2575] / [i915#9423]) +2 other tests skip
>     [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
>     [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-11/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
>
>    * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
>      - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#12247]) +14 other tests skip
>     [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html
>
>    * igt@kms_plane_scaling@planes-downscale-factor-0-25:
>      - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#12247] / [i915#6953] / [i915#9423])
>     [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
>
>    * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
>      - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#12247]) +5 other tests skip
>     [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html
>
>    * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
>      - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#12247]) +14 other tests skip
>     [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html
>
>    * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:
>      - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#12247]) +9 other tests skip
>     [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c.html
>
>    * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:
>      - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#12247]) +3 other tests skip
>     [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d.html
>
>    * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
>      - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#2575] / [i915#9423]) +3 other tests skip
>     [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-11/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
>
>    * igt@kms_pm_backlight@basic-brightness:
>      - shard-tglu-1:       NOTRUN -> [SKIP][308] ([i915#9812])
>     [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html
>      - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#5354]) +1 other test skip
>     [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-12/igt@kms_pm_backlight@basic-brightness.html
>
>    * igt@kms_pm_dc@dc6-dpms:
>      - shard-mtlp:         NOTRUN -> [FAIL][310] ([i915#12913])
>     [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-2/igt@kms_pm_dc@dc6-dpms.html
>      - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#5978])
>     [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-7/igt@kms_pm_dc@dc6-dpms.html
>      - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#3361])
>     [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-1/igt@kms_pm_dc@dc6-dpms.html
>
>    * igt@kms_pm_dc@dc9-dpms:
>      - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#4281])
>     [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-7/igt@kms_pm_dc@dc9-dpms.html
>
>    * igt@kms_pm_lpsp@kms-lpsp:
>      - shard-tglu-1:       NOTRUN -> [SKIP][314] ([i915#3828])
>     [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html
>
>    * igt@kms_pm_lpsp@screens-disabled:
>      - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#8430])
>     [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-8/igt@kms_pm_lpsp@screens-disabled.html
>
>    * igt@kms_pm_rpm@dpms-lpsp:
>      - shard-rkl:          [PASS][316] -> [SKIP][317] ([i915#9519])
>     [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html
>     [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html
>      - shard-dg1:          NOTRUN -> [SKIP][318] ([i915#9519]) +1 other test skip
>     [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_pm_rpm@dpms-lpsp.html
>
>    * igt@kms_pm_rpm@i2c:
>      - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#12937])
>     [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-11/igt@kms_pm_rpm@i2c.html
>
>    * igt@kms_pm_rpm@modeset-lpsp-stress:
>      - shard-dg2:          NOTRUN -> [SKIP][320] ([i915#9519])
>     [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp-stress.html
>
>    * igt@kms_pm_rpm@modeset-non-lpsp:
>      - shard-tglu-1:       NOTRUN -> [SKIP][321] ([i915#9519])
>     [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp.html
>
>    * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>      - shard-dg2:          [PASS][322] -> [SKIP][323] ([i915#12937]) +1 other test skip
>     [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>     [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>
>    * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>      - shard-tglu:         NOTRUN -> [SKIP][324] ([i915#9519])
>     [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>
>    * igt@kms_prime@basic-modeset-hybrid:
>      - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#6524])
>     [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-5/igt@kms_prime@basic-modeset-hybrid.html
>      - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#6524]) +1 other test skip
>     [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_prime@basic-modeset-hybrid.html
>      - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#6524]) +1 other test skip
>     [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-2/igt@kms_prime@basic-modeset-hybrid.html
>      - shard-mtlp:         NOTRUN -> [SKIP][328] ([i915#6524])
>     [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-3/igt@kms_prime@basic-modeset-hybrid.html
>      - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#6524] / [i915#6805]) +1 other test skip
>     [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-4/igt@kms_prime@basic-modeset-hybrid.html
>
>    * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
>      - shard-glk:          NOTRUN -> [SKIP][330] ([i915#11520]) +10 other tests skip
>     [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-glk5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
>
>    * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>      - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#11520]) +6 other tests skip
>     [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
>      - shard-snb:          NOTRUN -> [SKIP][332] ([i915#11520]) +4 other tests skip
>     [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-snb2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
>
>    * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
>      - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#11520]) +5 other tests skip
>     [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
>
>    * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
>      - shard-mtlp:         NOTRUN -> [SKIP][334] ([i915#9808]) +2 other tests skip
>     [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html
>
>    * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
>      - shard-mtlp:         NOTRUN -> [SKIP][335] ([i915#12316]) +7 other tests skip
>     [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
>
>    * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
>      - shard-tglu:         NOTRUN -> [SKIP][336] ([i915#11520]) +8 other tests skip
>     [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-10/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
>
>    * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
>      - shard-tglu-1:       NOTRUN -> [SKIP][337] ([i915#11520]) +1 other test skip
>     [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
>
>    * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
>      - shard-dg1:          NOTRUN -> [SKIP][338] ([i915#11520]) +7 other tests skip
>     [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-12/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
>
>    * igt@kms_psr2_su@frontbuffer-xrgb8888:
>      - shard-tglu:         NOTRUN -> [SKIP][339] ([i915#9683])
>     [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>
>    * igt@kms_psr2_su@page_flip-p010:
>      - shard-dg2:          NOTRUN -> [SKIP][340] ([i915#9683])
>     [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-6/igt@kms_psr2_su@page_flip-p010.html
>      - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#9683])
>     [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-3/igt@kms_psr2_su@page_flip-p010.html
>      - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#9683]) +1 other test skip
>     [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-13/igt@kms_psr2_su@page_flip-p010.html
>
>    * igt@kms_psr2_su@page_flip-xrgb8888:
>      - shard-mtlp:         NOTRUN -> [SKIP][343] ([i915#4348]) +1 other test skip
>     [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-6/igt@kms_psr2_su@page_flip-xrgb8888.html
>
>    * igt@kms_psr@fbc-pr-sprite-plane-onoff:
>      - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#1072] / [i915#9732]) +10 other tests skip
>     [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-7/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
>
>    * igt@kms_psr@fbc-psr-cursor-plane-move:
>      - shard-dg2:          NOTRUN -> [SKIP][345] ([i915#1072] / [i915#9732]) +24 other tests skip
>     [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-4/igt@kms_psr@fbc-psr-cursor-plane-move.html
>
>    * igt@kms_psr@fbc-psr2-primary-render:
>      - shard-mtlp:         NOTRUN -> [SKIP][346] ([i915#9688]) +13 other tests skip
>     [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-8/igt@kms_psr@fbc-psr2-primary-render.html
>
>    * igt@kms_psr@pr-sprite-plane-onoff:
>      - shard-tglu-1:       NOTRUN -> [SKIP][347] ([i915#9732]) +9 other tests skip
>     [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_psr@pr-sprite-plane-onoff.html
>
>    * igt@kms_psr@psr-sprite-mmap-gtt@edp-1:
>      - shard-mtlp:         NOTRUN -> [SKIP][348] ([i915#4077] / [i915#9688]) +1 other test skip
>     [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-7/igt@kms_psr@psr-sprite-mmap-gtt@edp-1.html
>
>    * igt@kms_psr@psr2-cursor-plane-onoff:
>      - shard-tglu:         NOTRUN -> [SKIP][349] ([i915#9732]) +25 other tests skip
>     [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-5/igt@kms_psr@psr2-cursor-plane-onoff.html
>
>    * igt@kms_psr@psr2-sprite-mmap-gtt:
>      - shard-dg1:          NOTRUN -> [SKIP][350] ([i915#1072] / [i915#9732]) +27 other tests skip
>     [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_psr@psr2-sprite-mmap-gtt.html
>
>    * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>      - shard-tglu:         NOTRUN -> [SKIP][351] ([i915#9685])
>     [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>
>    * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>      - shard-tglu-1:       NOTRUN -> [SKIP][352] ([i915#9685])
>     [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>      - shard-dg1:          NOTRUN -> [SKIP][353] ([i915#9685])
>     [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-12/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>
>    * igt@kms_pwrite_crc:
>      - shard-dg1:          [PASS][354] -> [DMESG-WARN][355] ([i915#4423]) +1 other test dmesg-warn
>     [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg1-17/igt@kms_pwrite_crc.html
>     [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_pwrite_crc.html
>
>    * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>      - shard-rkl:          NOTRUN -> [SKIP][356] ([i915#5289])
>     [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>      - shard-tglu:         NOTRUN -> [SKIP][357] ([i915#5289]) +1 other test skip
>     [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>
>    * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>      - shard-dg1:          NOTRUN -> [SKIP][358] ([i915#5289]) +1 other test skip
>     [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-14/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>      - shard-mtlp:         NOTRUN -> [SKIP][359] ([i915#12755])
>     [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>
>    * igt@kms_setmode@basic:
>      - shard-dg1:          [PASS][360] -> [FAIL][361] ([i915#5465])
>     [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg1-13/igt@kms_setmode@basic.html
>     [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-14/igt@kms_setmode@basic.html
>
>    * igt@kms_setmode@basic-clone-single-crtc:
>      - shard-dg2:          NOTRUN -> [SKIP][362] ([i915#3555]) +2 other tests skip
>     [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-3/igt@kms_setmode@basic-clone-single-crtc.html
>
>    * igt@kms_setmode@basic@pipe-a-hdmi-a-4:
>      - shard-dg1:          NOTRUN -> [FAIL][363] ([i915#5465]) +1 other test fail
>     [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-14/igt@kms_setmode@basic@pipe-a-hdmi-a-4.html
>
>    * igt@kms_setmode@clone-exclusive-crtc:
>      - shard-dg1:          NOTRUN -> [SKIP][364] ([i915#3555]) +10 other tests skip
>     [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_setmode@clone-exclusive-crtc.html
>
>    * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>      - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#8623])
>     [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>
>    * igt@kms_vblank@query-forked-hang:
>      - shard-rkl:          [PASS][366] -> [DMESG-WARN][367] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
>     [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-1/igt@kms_vblank@query-forked-hang.html
>     [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-1/igt@kms_vblank@query-forked-hang.html
>
>    * igt@kms_vblank@wait-forked-hang@pipe-b-hdmi-a-1:
>      - shard-rkl:          NOTRUN -> [DMESG-WARN][368] ([i915#12964]) +13 other tests dmesg-warn
>     [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-2/igt@kms_vblank@wait-forked-hang@pipe-b-hdmi-a-1.html
>
>    * igt@kms_vrr@lobf:
>      - shard-dg2:          NOTRUN -> [SKIP][369] ([i915#11920])
>     [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-8/igt@kms_vrr@lobf.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][370] ([i915#11920])
>     [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@kms_vrr@lobf.html
>
>    * igt@kms_vrr@seamless-rr-switch-drrs:
>      - shard-dg1:          NOTRUN -> [SKIP][371] ([i915#9906])
>     [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-drrs.html
>      - shard-mtlp:         NOTRUN -> [SKIP][372] ([i915#8808] / [i915#9906])
>     [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-7/igt@kms_vrr@seamless-rr-switch-drrs.html
>
>    * igt@kms_vrr@seamless-rr-switch-virtual:
>      - shard-dg2:          NOTRUN -> [SKIP][373] ([i915#9906]) +2 other tests skip
>     [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-1/igt@kms_vrr@seamless-rr-switch-virtual.html
>
>    * igt@kms_writeback@writeback-check-output:
>      - shard-tglu:         NOTRUN -> [SKIP][374] ([i915#2437])
>     [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-4/igt@kms_writeback@writeback-check-output.html
>
>    * igt@kms_writeback@writeback-pixel-formats:
>      - shard-tglu:         NOTRUN -> [SKIP][375] ([i915#2437] / [i915#9412])
>     [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-8/igt@kms_writeback@writeback-pixel-formats.html
>
>    * igt@perf@gen8-unprivileged-single-ctx-counters:
>      - shard-dg2:          NOTRUN -> [SKIP][376] ([i915#2436])
>     [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-2/igt@perf@gen8-unprivileged-single-ctx-counters.html
>
>    * igt@perf@per-context-mode-unprivileged:
>      - shard-dg1:          NOTRUN -> [SKIP][377] ([i915#2433])
>     [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-14/igt@perf@per-context-mode-unprivileged.html
>
>    * igt@perf_pmu@busy-double-start@vecs1:
>      - shard-dg2:          NOTRUN -> [FAIL][378] ([i915#4349]) +3 other tests fail
>     [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-10/igt@perf_pmu@busy-double-start@vecs1.html
>
>    * igt@perf_pmu@module-unload:
>      - shard-tglu:         [PASS][379] -> [ABORT][380] ([i915#13010]) +4 other tests abort
>     [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-tglu-2/igt@perf_pmu@module-unload.html
>     [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-7/igt@perf_pmu@module-unload.html
>      - shard-dg2:          NOTRUN -> [FAIL][381] ([i915#11823])
>     [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-3/igt@perf_pmu@module-unload.html
>
>    * igt@perf_pmu@rc6-all-gts:
>      - shard-dg1:          NOTRUN -> [SKIP][382] ([i915#8516]) +1 other test skip
>     [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-18/igt@perf_pmu@rc6-all-gts.html
>      - shard-tglu:         NOTRUN -> [SKIP][383] ([i915#8516])
>     [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-5/igt@perf_pmu@rc6-all-gts.html
>
>    * igt@perf_pmu@rc6@other-idle-gt0:
>      - shard-dg2:          NOTRUN -> [SKIP][384] ([i915#8516]) +1 other test skip
>     [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-4/igt@perf_pmu@rc6@other-idle-gt0.html
>
>    * igt@perf_pmu@render-node-busy:
>      - shard-dg2:          [PASS][385] -> [SKIP][386] ([i915#12506]) +7 other tests skip
>     [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-5/igt@perf_pmu@render-node-busy.html
>     [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-11/igt@perf_pmu@render-node-busy.html
>
>    * igt@prime_mmap@test_aperture_limit:
>      - shard-dg2:          NOTRUN -> [WARN][387] ([i915#9351])
>     [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-8/igt@prime_mmap@test_aperture_limit.html
>
>    * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
>      - shard-dg2:          NOTRUN -> [CRASH][388] ([i915#9351])
>     [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-8/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
>
>    * igt@prime_vgem@coherency-gtt:
>      - shard-rkl:          NOTRUN -> [SKIP][389] ([i915#3708]) +1 other test skip
>     [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-3/igt@prime_vgem@coherency-gtt.html
>      - shard-dg1:          NOTRUN -> [SKIP][390] ([i915#3708] / [i915#4077])
>     [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-17/igt@prime_vgem@coherency-gtt.html
>
>    * igt@prime_vgem@fence-read-hang:
>      - shard-mtlp:         NOTRUN -> [SKIP][391] ([i915#3708])
>     [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-2/igt@prime_vgem@fence-read-hang.html
>      - shard-dg1:          NOTRUN -> [SKIP][392] ([i915#3708]) +1 other test skip
>     [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-13/igt@prime_vgem@fence-read-hang.html
>
>    * igt@prime_vgem@fence-write-hang:
>      - shard-dg2:          NOTRUN -> [SKIP][393] ([i915#3708])
>     [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-3/igt@prime_vgem@fence-write-hang.html
>
>    * igt@sriov_basic@enable-vfs-autoprobe-off:
>      - shard-dg2:          NOTRUN -> [SKIP][394] ([i915#9917])
>     [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-10/igt@sriov_basic@enable-vfs-autoprobe-off.html
>      - shard-rkl:          NOTRUN -> [SKIP][395] ([i915#9917])
>     [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
>      - shard-dg1:          NOTRUN -> [SKIP][396] ([i915#9917])
>     [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg1-17/igt@sriov_basic@enable-vfs-autoprobe-off.html
>
>    * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
>      - shard-mtlp:         NOTRUN -> [FAIL][397] ([i915#12910]) +9 other tests fail
>     [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-6/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html
>
>    * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>      - shard-tglu-1:       NOTRUN -> [FAIL][398] ([i915#12910])
>     [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>
>    * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
>      - shard-tglu:         NOTRUN -> [FAIL][399] ([i915#12910]) +8 other tests fail
>     [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-5/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html
>
>    * igt@tools_test@sysfs_l3_parity:
>      - shard-dg2:          NOTRUN -> [SKIP][400] ([i915#2575] / [i915#4818])
>     [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html
>
>    
> #### Possible fixes ####
>
>    * igt@fbdev@pan:
>      - shard-dg2:          [SKIP][401] ([i915#2582]) -> [PASS][402] +1 other test pass
>     [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-11/igt@fbdev@pan.html
>     [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-10/igt@fbdev@pan.html
>
>    * igt@gem_ctx_isolation@preservation-s3:
>      - shard-dg2:          [INCOMPLETE][403] ([i915#12353]) -> [PASS][404] +1 other test pass
>     [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-4/igt@gem_ctx_isolation@preservation-s3.html
>     [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-8/igt@gem_ctx_isolation@preservation-s3.html
>
>    * igt@gem_ctx_isolation@preservation-s3@rcs0:
>      - shard-snb:          [ABORT][405] -> [PASS][406] +1 other test pass
>     [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-snb4/igt@gem_ctx_isolation@preservation-s3@rcs0.html
>     [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-snb2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
>
>    * igt@gem_lmem_swapping@heavy-verify-random:
>      - shard-dg2:          [SKIP][407] ([i915#12936]) -> [PASS][408] +4 other tests pass
>     [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random.html
>     [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-7/igt@gem_lmem_swapping@heavy-verify-random.html
>
>    * igt@i915_module_load@reload-with-fault-injection:
>      - shard-rkl:          [ABORT][409] ([i915#9820]) -> [PASS][410]
>     [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html
>     [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html
>      - shard-snb:          [ABORT][411] ([i915#9820]) -> [PASS][412]
>     [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html
>     [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
>
>    * igt@i915_pm_rc6_residency@rc6-accuracy:
>      - shard-rkl:          [FAIL][413] ([i915#12942]) -> [PASS][414] +1 other test pass
>     [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-accuracy.html
>     [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-accuracy.html
>
>    * igt@i915_pm_rpm@gem-execbuf-stress:
>      - shard-dg2:          [SKIP][415] ([i915#13014]) -> [PASS][416] +2 other tests pass
>     [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress.html
>     [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-3/igt@i915_pm_rpm@gem-execbuf-stress.html
>
>    * igt@i915_pm_rpm@reg-read-ioctl:
>      - shard-rkl:          [SKIP][417] -> [PASS][418] +3 other tests pass
>     [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-7/igt@i915_pm_rpm@reg-read-ioctl.html
>     [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-7/igt@i915_pm_rpm@reg-read-ioctl.html
>
>    * igt@i915_power@sanity:
>      - shard-mtlp:         [SKIP][419] ([i915#7984]) -> [PASS][420]
>     [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-mtlp-7/igt@i915_power@sanity.html
>     [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-mtlp-4/igt@i915_power@sanity.html
>
>    * igt@i915_suspend@basic-s2idle-without-i915:
>      - shard-rkl:          [DMESG-WARN][421] ([i915#12917] / [i915#12964]) -> [PASS][422] +5 other tests pass
>     [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-3/igt@i915_suspend@basic-s2idle-without-i915.html
>     [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-2/igt@i915_suspend@basic-s2idle-without-i915.html
>      - shard-tglu:         [ABORT][423] ([i915#13010]) -> [PASS][424]
>     [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-tglu-7/igt@i915_suspend@basic-s2idle-without-i915.html
>     [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-tglu-2/igt@i915_suspend@basic-s2idle-without-i915.html
>
>    * igt@kms_addfb_basic@addfb25-4-tiled:
>      - shard-rkl:          [DMESG-WARN][425] ([i915#12964]) -> [PASS][426] +41 other tests pass
>     [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-2/igt@kms_addfb_basic@addfb25-4-tiled.html
>     [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-rkl-4/igt@kms_addfb_basic@addfb25-4-tiled.html
>
>    * igt@kms_dp_linktrain_fallback@dp-fallback:
>      - shard-dg2:          [SKIP][427] ([i915#12402]) -> [PASS][428]
>     [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
>     [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-dg2-10/igt@kms_dp_linktrain_fallback@dp-fallback.html
>
>    * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>      - shard-snb:          [INCOMPLETE][429] ([i915#4839]) -> [PASS][430] +1 other test pass
>     [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-snb6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
>     [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-snb1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
>
>    * igt@kms_flip@plain-flip-fb-recreate@a-vga1:
>      - shard-snb:          [FAIL][431] ([i915#11989]) -> [PASS][432] +9 other tests pass
>     [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-snb2/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html
>     [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/shard-snb2/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html
>
>    * igt@kms_flip@plain-flip-ts-check:
>      - shard-rkl:          [FAIL][433] ([i915#11989]) -> [PASS][434] +1 other test pass
>     [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-1/igt@kms_flip
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12206/index.html
