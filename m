Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508A0C48BF6
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 11:15:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0310510E3EE;
	Mon, 26 Feb 2024 11:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hI1Wrfra";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8020210E6A1;
 Mon, 26 Feb 2024 11:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708946126; x=1740482126;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LK0drO6J7IgnQm61TopAyIptiNG4ZeNknZ68moQv1xU=;
 b=hI1Wrfra5QH8j7SNzpNBvKp1zak8LaUzgCfhD833niItaekPiB7ZSuLl
 OS9EjlISukFHJoiaPD6IdmYPzI7Yzip4FMN71Mjqb4ettrHnlOyTczZZ8
 1oxDRAY/fXyhQgR8WHpvsxl3Hc4gMFfsNVCkkzoXeaeHDSAC5WyHaVUyr
 6f7QJfXyyN3Zr7wFIxKvRVfBZ85TEXECnH0tOIAEOzqtYYEJlEx+ouETE
 V2sutTWLarEtuPkn/FYaoFkwjG9YfHZD5sqDuYT0LKB944wq6GHopRTg2
 MxIoTt7mIatxQIjs6aVb2mh1NP2C6FqzbLY6vpN2UrQ3IFTZoOcJGbQQR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3341468"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3341468"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:15:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="11307444"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 03:15:23 -0800
Date: Mon, 26 Feb 2024 12:15:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 print info in core_getversion (rev2)
Message-ID: <20240226111520.hoyvxnbxpzljekjj@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org,
 lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240221102930.21473-1-kamil.konieczny@linux.intel.com>
 <170852474307.179839.14209056605498592971@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170852474307.179839.14209056605498592971@8e613ede5ea5>
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

Hi igt-dev,
On 2024-02-21 at 14:12:23 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: print info in core_getversion (rev2)
> URL   : https://patchwork.freedesktop.org/series/130111/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14307_full -> IGTPW_10709_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10709_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10709_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10709_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pm_rpm@basic-rte:
>     - shard-dg2:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-1/igt@kms_pm_rpm@basic-rte.html
> 

Unrelated to change in core_getversion.

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_14307_full and IGTPW_10709_full:
> 
> ### New IGT tests (2) ###
> 
>   * igt@core_getversion@basic:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@core_getversion@multigpu:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.01, 0.04] s
> 

These are changes in core_getversion - new subtests, both should work
on all configs (i915 and xe).

Regards,
Kamil

>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10709_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-mtlp:         NOTRUN -> [SKIP][2] ([i915#8411])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-7/igt@api_intel_bb@object-reloc-purge-cache.html
>     - shard-dg2:          NOTRUN -> [SKIP][3] ([i915#8411]) +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-7/igt@api_intel_bb@object-reloc-purge-cache.html
> 
>   * igt@api_intel_bb@render-ccs:
>     - shard-dg2:          NOTRUN -> [FAIL][4] ([i915#10288])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@api_intel_bb@render-ccs.html
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#7701])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-6/igt@device_reset@unbind-cold-reset-rebind.html
> 
>   * igt@drm_fdinfo@busy-idle-check-all@ccs0:
>     - shard-mtlp:         NOTRUN -> [SKIP][6] ([i915#8414]) +6 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-7/igt@drm_fdinfo@busy-idle-check-all@ccs0.html
> 
>   * igt@drm_fdinfo@busy-idle@bcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][7] ([i915#8414]) +34 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@drm_fdinfo@busy-idle@bcs0.html
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
>     - shard-rkl:          [PASS][8] -> [FAIL][9] ([i915#7742])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
> 
>   * igt@gem_busy@semaphore:
>     - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#3936])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-7/igt@gem_busy@semaphore.html
>     - shard-mtlp:         NOTRUN -> [SKIP][11] ([i915#3936])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-7/igt@gem_busy@semaphore.html
> 
>   * igt@gem_ccs@block-copy-compressed:
>     - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#3555] / [i915#9323])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-4/igt@gem_ccs@block-copy-compressed.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#8562])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-tglu:         [PASS][14] -> [FAIL][15] ([i915#6268])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-4/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_param@set-priority-not-supported:
>     - shard-mtlp:         NOTRUN -> [SKIP][16] ([fdo#109314])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-2/igt@gem_ctx_param@set-priority-not-supported.html
>     - shard-dg2:          NOTRUN -> [SKIP][17] ([fdo#109314])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@gem_ctx_param@set-priority-not-supported.html
> 
>   * igt@gem_ctx_persistence@engines-cleanup:
>     - shard-snb:          NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#1099]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-snb4/igt@gem_ctx_persistence@engines-cleanup.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#8555])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-hang.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hostile:
>     - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#8555]) +4 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-hostile.html
>     - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#8555])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-13/igt@gem_ctx_persistence@heartbeat-hostile.html
> 
>   * igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:
>     - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#5882]) +9 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html
> 
>   * igt@gem_ctx_sseu@invalid-args:
>     - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#280])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-8/igt@gem_ctx_sseu@invalid-args.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#280]) +2 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@gem_ctx_sseu@invalid-sseu.html
>     - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#280])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-8/igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_eio@hibernate:
>     - shard-dg2:          NOTRUN -> [ABORT][26] ([i915#10030] / [i915#7975] / [i915#8213])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-6/igt@gem_eio@hibernate.html
> 
>   * igt@gem_eio@reset-stress:
>     - shard-dg2:          NOTRUN -> [FAIL][27] ([i915#5784])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-7/igt@gem_eio@reset-stress.html
> 
>   * igt@gem_exec_balancer@bonded-dual:
>     - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#4771])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-1/igt@gem_exec_balancer@bonded-dual.html
> 
>   * igt@gem_exec_balancer@bonded-true-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#4812]) +4 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-1/igt@gem_exec_balancer@bonded-true-hang.html
> 
>   * igt@gem_exec_balancer@parallel:
>     - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#4525]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-1/igt@gem_exec_balancer@parallel.html
> 
>   * igt@gem_exec_capture@capture-invisible@lmem0:
>     - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#6334]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-7/igt@gem_exec_capture@capture-invisible@lmem0.html
> 
>   * igt@gem_exec_capture@capture-invisible@smem0:
>     - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#6334])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-6/igt@gem_exec_capture@capture-invisible@smem0.html
> 
>   * igt@gem_exec_capture@many-4k-incremental:
>     - shard-glk:          NOTRUN -> [FAIL][33] ([i915#9606])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-glk2/igt@gem_exec_capture@many-4k-incremental.html
>     - shard-dg2:          NOTRUN -> [FAIL][34] ([i915#9606]) +1 other test fail
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@gem_exec_capture@many-4k-incremental.html
>     - shard-rkl:          NOTRUN -> [FAIL][35] ([i915#9606])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-1/igt@gem_exec_capture@many-4k-incremental.html
>     - shard-dg1:          NOTRUN -> [FAIL][36] ([i915#9606])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-17/igt@gem_exec_capture@many-4k-incremental.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-rkl:          [PASS][37] -> [FAIL][38] ([i915#2842])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-rkl-2/igt@gem_exec_fair@basic-none-solo@rcs0.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-4/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share:
>     - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3539] / [i915#4852]) +12 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-7/igt@gem_exec_fair@basic-pace-share.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [PASS][40] -> [FAIL][41] ([i915#2842])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@bcs0:
>     - shard-tglu:         NOTRUN -> [FAIL][42] ([i915#2842]) +5 other tests fail
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-4/igt@gem_exec_fair@basic-pace@bcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-tglu:         NOTRUN -> [FAIL][43] ([i915#2876])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-4/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_exec_fair@basic-sync:
>     - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3539]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@gem_exec_fair@basic-sync.html
>     - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3539])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-13/igt@gem_exec_fair@basic-sync.html
> 
>   * igt@gem_exec_fence@submit67:
>     - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#4812]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-7/igt@gem_exec_fence@submit67.html
> 
>   * igt@gem_exec_gttfill@multigpu-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#7697]) +1 other test skip
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-6/igt@gem_exec_gttfill@multigpu-basic.html
> 
>   * igt@gem_exec_params@rsvd2-dirt:
>     - shard-dg2:          NOTRUN -> [SKIP][48] ([fdo#109283] / [i915#5107])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@gem_exec_params@rsvd2-dirt.html
> 
>   * igt@gem_exec_params@secure-non-master:
>     - shard-dg2:          NOTRUN -> [SKIP][49] ([fdo#112283])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@gem_exec_params@secure-non-master.html
> 
>   * igt@gem_exec_reloc@basic-active:
>     - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3281]) +22 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-1/igt@gem_exec_reloc@basic-active.html
> 
>   * igt@gem_exec_reloc@basic-concurrent0:
>     - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#3281]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-19/igt@gem_exec_reloc@basic-concurrent0.html
> 
>   * igt@gem_exec_reloc@basic-gtt-noreloc:
>     - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#3281]) +10 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-wc:
>     - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#3281]) +3 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-7/igt@gem_exec_reloc@basic-wc.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts-chain:
>     - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4537] / [i915#4812]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-2/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
> 
>   * igt@gem_exec_schedule@reorder-wide:
>     - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4537] / [i915#4812]) +2 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@gem_exec_schedule@reorder-wide.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices@lmem0:
>     - shard-dg2:          NOTRUN -> [ABORT][56] ([i915#7975] / [i915#8213])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-7/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
> 
>   * igt@gem_fenced_exec_thrash@2-spare-fences:
>     - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4860]) +3 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@gem_fenced_exec_thrash@2-spare-fences.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4860]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-7/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi:
>     - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#4613])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-multi.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][60] ([fdo#109271] / [i915#4613]) +3 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-glk6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
> 
>   * igt@gem_lmem_swapping@random:
>     - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4613]) +3 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-7/igt@gem_lmem_swapping@random.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - shard-tglu:         NOTRUN -> [SKIP][62] ([i915#4613])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-8/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg2:          NOTRUN -> [TIMEOUT][63] ([i915#5493])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-1/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_media_vme:
>     - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#284])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-1/igt@gem_media_vme.html
> 
>   * igt@gem_mmap@short-mmap:
>     - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4083]) +4 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-5/igt@gem_mmap@short-mmap.html
> 
>   * igt@gem_mmap_gtt@basic-small-bo:
>     - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4077]) +26 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@gem_mmap_gtt@basic-small-bo.html
> 
>   * igt@gem_mmap_gtt@close-race:
>     - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4077])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-13/igt@gem_mmap_gtt@close-race.html
> 
>   * igt@gem_mmap_gtt@cpuset-medium-copy:
>     - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4077]) +11 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-2/igt@gem_mmap_gtt@cpuset-medium-copy.html
> 
>   * igt@gem_mmap_wc@bad-offset:
>     - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4083]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-15/igt@gem_mmap_wc@bad-offset.html
> 
>   * igt@gem_mmap_wc@bad-size:
>     - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4083]) +16 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@gem_mmap_wc@bad-size.html
> 
>   * igt@gem_partial_pwrite_pread@reads-uncached:
>     - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#3282]) +16 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@gem_partial_pwrite_pread@reads-uncached.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#3282]) +2 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-6/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_pwrite@basic-random:
>     - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#3282]) +1 other test skip
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-4/igt@gem_pwrite@basic-random.html
> 
>   * igt@gem_pxp@display-protected-crc:
>     - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4270]) +7 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@gem_pxp@display-protected-crc.html
> 
>   * igt@gem_pxp@verify-pxp-stale-buf-execution:
>     - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4270])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-5/igt@gem_pxp@verify-pxp-stale-buf-execution.html
> 
>   * igt@gem_pxp@verify-pxp-stale-ctx-execution:
>     - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#4270]) +1 other test skip
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-9/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
>     - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#4270]) +1 other test skip
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-1/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
> 
>   * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#8428]) +4 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#4079])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
> 
>   * igt@gem_set_tiling_vs_gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4079])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@gem_set_tiling_vs_gtt.html
> 
>   * igt@gem_softpin@evict-snoop-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4885]) +1 other test skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-6/igt@gem_softpin@evict-snoop-interruptible.html
> 
>   * igt@gem_userptr_blits@create-destroy-unsync:
>     - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#3297]) +6 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@gem_userptr_blits@create-destroy-unsync.html
>     - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#3297]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-4/igt@gem_userptr_blits@create-destroy-unsync.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
>     - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#3297] / [i915#4880]) +2 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-7/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
> 
>   * igt@gem_userptr_blits@sd-probe:
>     - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#3297] / [i915#4958])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-1/igt@gem_userptr_blits@sd-probe.html
> 
>   * igt@gem_userptr_blits@unsync-unmap:
>     - shard-tglu:         NOTRUN -> [SKIP][86] ([i915#3297])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-9/igt@gem_userptr_blits@unsync-unmap.html
> 
>   * igt@gen3_render_tiledy_blits:
>     - shard-mtlp:         NOTRUN -> [SKIP][87] ([fdo#109289]) +4 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-7/igt@gen3_render_tiledy_blits.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-glk:          [PASS][88] -> [INCOMPLETE][89] ([i915#10137] / [i915#5566])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-glk9/igt@gen9_exec_parse@allowed-single.html
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-glk8/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@basic-rejected-ctx-param:
>     - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#2856]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-5/igt@gen9_exec_parse@basic-rejected-ctx-param.html
> 
>   * igt@gen9_exec_parse@batch-without-end:
>     - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#2527])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-4/igt@gen9_exec_parse@batch-without-end.html
> 
>   * igt@gen9_exec_parse@unaligned-access:
>     - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#2856]) +8 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-7/igt@gen9_exec_parse@unaligned-access.html
> 
>   * igt@i915_module_load@load:
>     - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#6227])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@i915_module_load@load.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-glk:          [PASS][94] -> [ABORT][95] ([i915#9849])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-glk9/igt@i915_module_load@reload-with-fault-injection.html
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-glk1/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-mtlp:         [PASS][96] -> [ABORT][97] ([i915#10131] / [i915#9820])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][98] ([i915#10137] / [i915#9849])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_module_load@resize-bar:
>     - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#6412])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-2/igt@i915_module_load@resize-bar.html
> 
>   * igt@i915_pm_freq_api@freq-reset:
>     - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#8399])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-4/igt@i915_pm_freq_api@freq-reset.html
> 
>   * igt@i915_pm_freq_mult@media-freq@gt1:
>     - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#6590]) +1 other test skip
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-1/igt@i915_pm_freq_mult@media-freq@gt1.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
>     - shard-dg1:          [PASS][102] -> [FAIL][103] ([i915#3591])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
> 
>   * igt@i915_pm_rps@min-max-config-idle:
>     - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#6621])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-8/igt@i915_pm_rps@min-max-config-idle.html
> 
>   * igt@i915_pm_rps@min-max-config-loaded:
>     - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#6621]) +1 other test skip
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@i915_pm_rps@min-max-config-loaded.html
> 
>   * igt@i915_pm_rps@thresholds-idle-park@gt0:
>     - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#8925]) +1 other test skip
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-7/igt@i915_pm_rps@thresholds-idle-park@gt0.html
> 
>   * igt@i915_pm_rps@thresholds-idle@gt0:
>     - shard-mtlp:         NOTRUN -> [SKIP][107] ([i915#8925])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-7/igt@i915_pm_rps@thresholds-idle@gt0.html
> 
>   * igt@i915_pm_rps@thresholds-idle@gt1:
>     - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#3555] / [i915#8925])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-7/igt@i915_pm_rps@thresholds-idle@gt1.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#4387])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-1/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@i915_query@query-topology-known-pci-ids:
>     - shard-dg1:          NOTRUN -> [SKIP][110] ([fdo#109303])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-16/igt@i915_query@query-topology-known-pci-ids.html
>     - shard-dg2:          NOTRUN -> [SKIP][111] ([fdo#109303])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-1/igt@i915_query@query-topology-known-pci-ids.html
>     - shard-rkl:          NOTRUN -> [SKIP][112] ([fdo#109303])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-4/igt@i915_query@query-topology-known-pci-ids.html
> 
>   * igt@i915_query@query-topology-unsupported:
>     - shard-dg2:          NOTRUN -> [SKIP][113] ([fdo#109302])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-6/igt@i915_query@query-topology-unsupported.html
> 
>   * igt@i915_selftest@mock@memory_region:
>     - shard-dg2:          NOTRUN -> [DMESG-WARN][114] ([i915#9311])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@i915_selftest@mock@memory_region.html
>     - shard-rkl:          NOTRUN -> [DMESG-WARN][115] ([i915#9311])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-5/igt@i915_selftest@mock@memory_region.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-snb:          [PASS][116] -> [INCOMPLETE][117] ([i915#10044])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-snb2/igt@i915_suspend@basic-s3-without-i915.html
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-snb4/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#7707])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-5/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#4215] / [i915#5190])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@clobberred-modifier:
>     - shard-mtlp:         NOTRUN -> [SKIP][120] ([i915#4212])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-2/igt@kms_addfb_basic@clobberred-modifier.html
> 
>   * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>     - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#4212]) +3 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:
>     - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#8709]) +11 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html
> 
>   * igt@kms_async_flips@test-cursor:
>     - shard-mtlp:         NOTRUN -> [SKIP][123] ([i915#6229])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-1/igt@kms_async_flips@test-cursor.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#1769] / [i915#3555])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#5286]) +2 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-tglu:         NOTRUN -> [SKIP][126] ([fdo#111615] / [i915#5286]) +2 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][127] ([fdo#111614]) +2 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-8/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-dg2:          NOTRUN -> [SKIP][128] ([fdo#111614]) +11 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-tglu:         NOTRUN -> [SKIP][129] ([fdo#111614])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
>     - shard-rkl:          NOTRUN -> [SKIP][130] ([fdo#111614] / [i915#3638])
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-tglu:         [PASS][131] -> [FAIL][132] ([i915#3743]) +1 other test fail
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-tglu-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#5190]) +21 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#4538] / [i915#5190]) +30 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-rkl:          NOTRUN -> [SKIP][135] ([fdo#111615])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-mtlp:         NOTRUN -> [SKIP][136] ([fdo#111615]) +9 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-tglu:         NOTRUN -> [SKIP][137] ([fdo#111615]) +2 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-rkl:          NOTRUN -> [SKIP][138] ([fdo#110723])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#2705]) +1 other test skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-1/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#2705])
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-3/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_ccs@pipe-a-missing-ccs-buffer-y-tiled-gen12-mc-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#5354] / [i915#6095]) +16 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-9/igt@kms_ccs@pipe-a-missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-mc-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#5354]) +226 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@pipe-b-missing-ccs-buffer-y-tiled-gen12-mc-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#5354] / [i915#6095]) +11 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-1/igt@kms_ccs@pipe-b-missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@pipe-c-bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
>     - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#5354] / [i915#6095]) +40 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-2/igt@kms_ccs@pipe-c-bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][145] ([fdo#109271]) +153 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-glk4/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@pipe-d-ccs-on-another-bo-4-tiled-mtl-mc-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#5354]) +14 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-7/igt@kms_ccs@pipe-d-ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#5354] / [i915#6095]) +6 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-17/igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#4087]) +3 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio:
>     - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#7828]) +26 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@kms_chamelium_audio@hdmi-audio.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-rkl:          NOTRUN -> [SKIP][150] ([fdo#111827])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-4/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-mtlp:         NOTRUN -> [SKIP][151] ([fdo#111827]) +1 other test skip
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-7/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-dg2:          NOTRUN -> [SKIP][152] ([fdo#111827]) +5 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-6/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-single:
>     - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#7828]) +4 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-1/igt@kms_chamelium_frames@hdmi-crc-single.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#7828])
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-9/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#7828]) +4 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-6/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-2/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#6944] / [i915#9424])
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-8/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#3299]) +1 other test skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-7/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#3299]) +1 other test skip
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#7118] / [i915#9424]) +1 other test skip
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@kms_content_protection@type1.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#7118] / [i915#9424]) +1 other test skip
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-7/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#3359]) +1 other test skip
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-19/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x32:
>     - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#3555] / [i915#8814]) +2 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-8/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#3359]) +3 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@kms_cursor_crc@cursor-random-512x170.html
>     - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#3359]) +1 other test skip
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-5/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
>     - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#8814]) +3 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>     - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#3555]) +1 other test skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#3359]) +2 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][169] ([fdo#109274] / [fdo#111767] / [i915#5354])
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][170] ([fdo#109274] / [i915#5354]) +11 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][171] ([i915#4213])
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#9809]) +2 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-tglu:         NOTRUN -> [SKIP][173] ([fdo#109274]) +1 other test skip
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-9/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-snb:          NOTRUN -> [SKIP][174] ([fdo#109271] / [fdo#111767])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-snb2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#4103] / [i915#4213]) +1 other test skip
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>     - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#4103])
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-a:
>     - shard-tglu:         [PASS][177] -> [DMESG-WARN][178] ([i915#10166] / [i915#1982])
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-tglu-6/igt@kms_cursor_legacy@torture-move@pipe-a.html
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-9/igt@kms_cursor_legacy@torture-move@pipe-a.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][179] ([fdo#110189] / [i915#9723])
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-18/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#9833])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#3804])
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
>     - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#3555]) +10 other tests skip
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#1257])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#3555] / [i915#8812])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-5/igt@kms_draw_crc@draw-method-mmap-gtt.html
>     - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#8812])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-gtt.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#3555] / [i915#3840]) +2 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp:
>     - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#3840] / [i915#9688])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp.html
>     - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#3840])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-15/igt@kms_dsc@dsc-fractional-bpp.html
>     - shard-tglu:         NOTRUN -> [SKIP][189] ([i915#3840]) +1 other test skip
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-6/igt@kms_dsc@dsc-fractional-bpp.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#3840])
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#3555] / [i915#3840]) +1 other test skip
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-8/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#3840] / [i915#9053])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#3469])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-7/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#4854])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#1839])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#658])
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_fence_pin_leak:
>     - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#4881])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@kms_fence_pin_leak.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][198] ([fdo#111825] / [i915#9934])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-15/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-dg2:          NOTRUN -> [SKIP][199] ([fdo#109274] / [fdo#111767])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][200] ([fdo#111825]) +4 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-1/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
>     - shard-snb:          [PASS][201] -> [DMESG-WARN][202] ([i915#10007])
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-snb6/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-snb2/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-dg2:          NOTRUN -> [SKIP][203] ([fdo#109274]) +21 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@kms_flip@2x-modeset-vs-vblank-race.html
>     - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#3637]) +5 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-8/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-tglu:         NOTRUN -> [SKIP][205] ([fdo#109274] / [i915#3637])
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#2672]) +2 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#2587] / [i915#2672]) +1 other test skip
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#2672]) +9 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#2672] / [i915#3555]) +1 other test skip
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#2587] / [i915#2672])
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-19/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
>     - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#2672])
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#3555] / [i915#8810])
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#2672] / [i915#3555])
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - shard-tglu:         NOTRUN -> [SKIP][214] ([fdo#109285])
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-6/igt@kms_force_connector_basic@force-load-detect.html
>     - shard-dg2:          NOTRUN -> [SKIP][215] ([fdo#109285])
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#5274])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-1/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#8708]) +48 other tests skip
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][218] ([fdo#111767] / [fdo#111825])
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:
>     - shard-snb:          [PASS][219] -> [SKIP][220] ([fdo#109271]) +8 other tests skip
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][221] ([fdo#111825] / [i915#1825]) +14 other tests skip
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#10055])
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>     - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#10055])
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
>     - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#3023]) +10 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#3458]) +1 other test skip
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
>     - shard-tglu:         NOTRUN -> [SKIP][226] ([fdo#110189]) +5 other tests skip
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:
>     - shard-mtlp:         NOTRUN -> [SKIP][227] ([fdo#111767] / [i915#1825])
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][228] ([fdo#109280]) +10 other tests skip
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][229] ([fdo#111825]) +4 other tests skip
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
>     - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#3458]) +45 other tests skip
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#8708]) +10 other tests skip
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#8708])
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
>     - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#1825]) +23 other tests skip
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-tglu:         NOTRUN -> [SKIP][234] ([fdo#109280] / [fdo#111767])
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][235] ([fdo#111767] / [i915#5354]) +3 other tests skip
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html
>     - shard-rkl:          NOTRUN -> [SKIP][236] ([fdo#111767] / [fdo#111825] / [i915#1825]) +2 other tests skip
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#3555] / [i915#8228])
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-7/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#3555] / [i915#8228]) +5 other tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
>     - shard-dg2:          NOTRUN -> [SKIP][239] ([fdo#109289]) +8 other tests skip
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
>     - shard-rkl:          NOTRUN -> [SKIP][240] ([fdo#109289]) +1 other test skip
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-4/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
> 
>   * igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#3582]) +3 other tests skip
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-3/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#8821])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#3555] / [i915#8821])
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#3555] / [i915#8806])
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-7/igt@kms_plane_multiple@tiling-y.html
>     - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#8806])
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-7/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#3555] / [i915#8806])
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-6/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#9423]) +7 other tests skip
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#9423]) +5 other tests skip
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#5176] / [i915#9423]) +3 other tests skip
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-16/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#9423]) +11 other tests skip
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-12/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#5235] / [i915#9423]) +15 other tests skip
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#5235]) +9 other tests skip
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#5235]) +7 other tests skip
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-15/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#5235] / [i915#9423] / [i915#9728]) +3 other tests skip
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#5235]) +9 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#3555] / [i915#5235]) +1 other test skip
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d-edp-1.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#9685])
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-7/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-tglu:         [PASS][258] -> [FAIL][259] ([i915#9295])
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#9685])
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-6/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#9340])
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_lpsp@screens-disabled:
>     - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#8430])
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-13/igt@kms_pm_lpsp@screens-disabled.html
>     - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#8430])
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@kms_pm_lpsp@screens-disabled.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#9519]) +1 other test skip
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-9/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#9519]) +2 other tests skip
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>     - shard-rkl:          [PASS][266] -> [SKIP][267] ([i915#9519]) +2 other tests skip
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_prime@basic-crc-vgem:
>     - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#6524] / [i915#6805]) +1 other test skip
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@kms_prime@basic-crc-vgem.html
> 
>   * igt@kms_prime@basic-modeset-hybrid:
>     - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#6524])
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-4/igt@kms_prime@basic-modeset-hybrid.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>     - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#9683])
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@cursor-plane-update-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#9683]) +9 other tests skip
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@kms_psr2_sf@cursor-plane-update-sf.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-snb:          NOTRUN -> [SKIP][272] ([fdo#109271]) +102 other tests skip
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-snb1/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#5289])
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#5289]) +1 other test skip
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#4235])
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-rkl:          NOTRUN -> [SKIP][276] ([fdo#111615] / [i915#5289]) +1 other test skip
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>     - shard-tglu:         NOTRUN -> [SKIP][277] ([fdo#111615] / [i915#5289])
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#4235] / [i915#5190])
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>     - shard-dg1:          NOTRUN -> [SKIP][279] ([fdo#111615] / [i915#5289])
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#4235]) +5 other tests skip
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full-aspect:
>     - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#3555]) +1 other test skip
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#8623])
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-19/igt@kms_tiled_display@basic-test-pattern.html
>     - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#8623])
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-5/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-mtlp:         NOTRUN -> [SKIP][284] ([fdo#109309])
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-7/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
>     - shard-mtlp:         [PASS][285] -> [FAIL][286] ([i915#9196])
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
>     - shard-tglu:         [PASS][287] -> [FAIL][288] ([i915#9196])
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-tglu-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#8808] / [i915#9906])
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-1/igt@kms_vrr@flip-basic-fastset.html
>     - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#9906])
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-7/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-glk:          NOTRUN -> [SKIP][291] ([fdo#109271] / [i915#2437])
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-glk9/igt@kms_writeback@writeback-fb-id.html
>     - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#2437]) +1 other test skip
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@kms_writeback@writeback-fb-id.html
>     - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#2437])
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-5/igt@kms_writeback@writeback-fb-id.html
>     - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#2437])
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-15/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#2437] / [i915#9412]) +1 other test skip
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@perf@global-sseu-config:
>     - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#7387])
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@perf@global-sseu-config.html
> 
>   * igt@perf@mi-rpc:
>     - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#2434] / [i915#7387])
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-6/igt@perf@mi-rpc.html
>     - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#2434])
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-1/igt@perf@mi-rpc.html
> 
>   * igt@perf@per-context-mode-unprivileged:
>     - shard-tglu:         NOTRUN -> [SKIP][299] ([fdo#109289]) +2 other tests skip
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-6/igt@perf@per-context-mode-unprivileged.html
> 
>   * igt@perf_pmu@busy-double-start@vecs1:
>     - shard-dg2:          NOTRUN -> [FAIL][300] ([i915#4349]) +3 other tests fail
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs1.html
> 
>   * igt@perf_pmu@frequency@gt0:
>     - shard-dg2:          NOTRUN -> [FAIL][301] ([i915#6806])
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@perf_pmu@frequency@gt0.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-dg2:          NOTRUN -> [FAIL][302] ([i915#5793])
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-1/igt@perf_pmu@module-unload.html
> 
>   * igt@perf_pmu@rc6-all-gts:
>     - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#8516])
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@perf_pmu@rc6-all-gts.html
> 
>   * igt@prime_udl:
>     - shard-dg2:          NOTRUN -> [SKIP][304] ([fdo#109291])
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-1/igt@prime_udl.html
> 
>   * igt@prime_vgem@basic-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#3708] / [i915#4077])
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@prime_vgem@basic-gtt.html
> 
>   * igt@prime_vgem@basic-read:
>     - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#3291] / [i915#3708])
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#3708])
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@prime_vgem@fence-flip-hang.html
> 
>   * igt@syncobj_timeline@invalid-wait-zero-handles:
>     - shard-snb:          NOTRUN -> [FAIL][308] ([i915#9781])
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-snb6/igt@syncobj_timeline@invalid-wait-zero-handles.html
> 
>   * igt@syncobj_wait@invalid-wait-zero-handles:
>     - shard-dg2:          NOTRUN -> [FAIL][309] ([i915#9779])
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-5/igt@syncobj_wait@invalid-wait-zero-handles.html
> 
>   * igt@tools_test@sysfs_l3_parity:
>     - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#4818])
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@tools_test@sysfs_l3_parity.html
> 
>   * igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync:
>     - shard-mtlp:         NOTRUN -> [SKIP][311] ([i915#2575]) +10 other tests skip
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-2/igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync.html
> 
>   * igt@v3d/v3d_perfmon@create-single-perfmon:
>     - shard-rkl:          NOTRUN -> [SKIP][312] ([fdo#109315]) +5 other tests skip
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-4/igt@v3d/v3d_perfmon@create-single-perfmon.html
> 
>   * igt@v3d/v3d_perfmon@destroy-valid-perfmon:
>     - shard-tglu:         NOTRUN -> [SKIP][313] ([fdo#109315] / [i915#2575])
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-2/igt@v3d/v3d_perfmon@destroy-valid-perfmon.html
> 
>   * igt@v3d/v3d_submit_cl@multisync-out-syncs:
>     - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#2575]) +36 other tests skip
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-6/igt@v3d/v3d_submit_cl@multisync-out-syncs.html
> 
>   * igt@v3d/v3d_submit_csd@bad-pad:
>     - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#2575]) +2 other tests skip
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-16/igt@v3d/v3d_submit_csd@bad-pad.html
> 
>   * igt@vc4/vc4_perfmon@create-perfmon-exceed:
>     - shard-mtlp:         NOTRUN -> [SKIP][316] ([i915#7711]) +7 other tests skip
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-8/igt@vc4/vc4_perfmon@create-perfmon-exceed.html
> 
>   * igt@vc4/vc4_perfmon@get-values-valid-perfmon:
>     - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#7711]) +3 other tests skip
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-5/igt@vc4/vc4_perfmon@get-values-valid-perfmon.html
> 
>   * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained:
>     - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#7711]) +25 other tests skip
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-2/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html
> 
>   * igt@vc4/vc4_tiling@get-bad-flags:
>     - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#7711])
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-18/igt@vc4/vc4_tiling@get-bad-flags.html
> 
>   * igt@vc4/vc4_tiling@set-get:
>     - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#2575]) +2 other tests skip
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-8/igt@vc4/vc4_tiling@set-get.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-dg1:          [FAIL][321] ([i915#5784]) -> [PASS][322] +1 other test pass
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-dg1-13/igt@gem_eio@unwedge-stress.html
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-19/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_fair@basic-none-share@rcs0:
>     - shard-glk:          [FAIL][323] ([i915#2842]) -> [PASS][324]
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-tglu:         [FAIL][325] ([i915#2842]) -> [PASS][326]
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-tglu-4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_exec_suspend@basic-s3@smem:
>     - shard-tglu:         [INCOMPLETE][327] ([i915#8797]) -> [PASS][328]
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-tglu-10/igt@gem_exec_suspend@basic-s3@smem.html
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-9/igt@gem_exec_suspend@basic-s3@smem.html
> 
>   * igt@i915_module_load@reload-no-display:
>     - shard-snb:          [INCOMPLETE][329] ([i915#9849]) -> [PASS][330]
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-snb7/igt@i915_module_load@reload-no-display.html
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-snb1/igt@i915_module_load@reload-no-display.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
>     - shard-dg1:          [FAIL][331] ([i915#3591]) -> [PASS][332] +1 other test pass
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-mtlp:         [FAIL][333] ([i915#5138]) -> [PASS][334]
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-tglu:         [FAIL][335] ([i915#3743]) -> [PASS][336]
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-tglu-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-glk:          [FAIL][337] ([i915#2346]) -> [PASS][338]
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@torture-bo@pipe-a:
>     - shard-tglu:         [DMESG-WARN][339] ([i915#10166]) -> [PASS][340]
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-tglu-4/igt@kms_cursor_legacy@torture-bo@pipe-a.html
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-6/igt@kms_cursor_legacy@torture-bo@pipe-a.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1:
>     - shard-glk:          [INCOMPLETE][341] -> [PASS][342]
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-glk1/igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1.html
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-glk6/igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
>     - shard-dg2:          [FAIL][343] ([i915#6880]) -> [PASS][344]
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
>     - shard-snb:          [SKIP][345] ([fdo#109271]) -> [PASS][346] +8 other tests pass
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-snb:          [SKIP][347] ([fdo#109271] / [fdo#111767]) -> [PASS][348]
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-rkl:          [SKIP][349] ([i915#9519]) -> [PASS][350] +1 other test pass
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
>     - shard-snb:          [FAIL][351] ([i915#9196]) -> [PASS][352] +1 other test pass
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-snb6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-snb2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
> 
>   * igt@perf_pmu@busy-double-start@rcs0:
>     - shard-mtlp:         [FAIL][353] ([i915#4349]) -> [PASS][354] +1 other test pass
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-mtlp-8/igt@perf_pmu@busy-double-start@rcs0.html
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-mtlp-5/igt@perf_pmu@busy-double-start@rcs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
>     - shard-tglu:         [WARN][355] ([i915#2681]) -> [FAIL][356] ([i915#3591])
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
>     - shard-tglu:         [FAIL][357] ([i915#3591]) -> [WARN][358] ([i915#2681])
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-dg1:          [SKIP][359] ([i915#9424]) -> [SKIP][360] ([i915#9433])
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-dg1-19/igt@kms_content_protection@mei-interface.html
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg1-19/igt@kms_content_protection@mei-interface.html
>     - shard-snb:          [INCOMPLETE][361] ([i915#9878]) -> [SKIP][362] ([fdo#109271])
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-snb7/igt@kms_content_protection@mei-interface.html
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-snb1/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-rkl:          [SKIP][363] ([i915#3955]) -> [SKIP][364] ([fdo#110189] / [i915#3955])
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
>     - shard-snb:          [SKIP][365] ([fdo#109271] / [fdo#111767]) -> [SKIP][366] ([fdo#109271])
>    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
>    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-snb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
>     - shard-snb:          [SKIP][367] ([fdo#109271]) -> [SKIP][368] ([fdo#109271] / [fdo#111767])
>    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-snb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html
>    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-snb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html
> 
>   * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
>     - shard-dg2:          [INCOMPLETE][369] ([i915#5493]) -> [CRASH][370] ([i915#9351])
>    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14307/shard-dg2-10/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
>    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/shard-dg2-6/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
>   [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
>   [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
>   [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
>   [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#10007]: https://gitlab.freedesktop.org/drm/intel/issues/10007
>   [i915#10030]: https://gitlab.freedesktop.org/drm/intel/issues/10030
>   [i915#10044]: https://gitlab.freedesktop.org/drm/intel/issues/10044
>   [i915#10055]: https://gitlab.freedesktop.org/drm/intel/issues/10055
>   [i915#10131]: https://gitlab.freedesktop.org/drm/intel/issues/10131
>   [i915#10137]: https://gitlab.freedesktop.org/drm/intel/issues/10137
>   [i915#10166]: https://gitlab.freedesktop.org/drm/intel/issues/10166
>   [i915#10278]: https://gitlab.freedesktop.org/drm/intel/issues/10278
>   [i915#10282]: https://gitlab.freedesktop.org/drm/intel/issues/10282
>   [i915#10288]: https://gitlab.freedesktop.org/drm/intel/issues/10288
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
>   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2876]: https://gitlab.freedesktop.org/drm/intel/issues/2876
>   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3582]: https://gitlab.freedesktop.org/drm/intel/issues/3582
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
>   [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
>   [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
>   [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
>   [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
>   [i915#5107]: https://gitlab.freedesktop.org/drm/intel/issues/5107
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#5793]: https://gitlab.freedesktop.org/drm/intel/issues/5793
>   [i915#5882]: https://gitlab.freedesktop.org/drm/intel/issues/5882
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
>   [i915#6229]: https://gitlab.freedesktop.org/drm/intel/issues/6229
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
>   [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
>   [i915#6806]: https://gitlab.freedesktop.org/drm/intel/issues/6806
>   [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
>   [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
>   [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7387]: https://gitlab.freedesktop.org/drm/intel/issues/7387
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
>   [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
>   [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8399]: https://gitlab.freedesktop.org/drm/intel/issues/8399
>   [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
>   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
>   [i915#8430]: https://gitlab.freedesktop.org/drm/intel/issues/8430
>   [i915#8516]: https://gitlab.freedesktop.org/drm/intel/issues/8516
>   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
>   [i915#8562]: https://gitlab.freedesktop.org/drm/intel/issues/8562
>   [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
>   [i915#8797]: https://gitlab.freedesktop.org/drm/intel/issues/8797
>   [i915#8806]: https://gitlab.freedesktop.org/drm/intel/issues/8806
>   [i915#8808]: https://gitlab.freedesktop.org/drm/intel/issues/8808
>   [i915#8810]: https://gitlab.freedesktop.org/drm/intel/issues/8810
>   [i915#8812]: https://gitlab.freedesktop.org/drm/intel/issues/8812
>   [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
>   [i915#8821]: https://gitlab.freedesktop.org/drm/intel/issues/8821
>   [i915#8925]: https://gitlab.freedesktop.org/drm/intel/issues/8925
>   [i915#9053]: https://gitlab.freedesktop.org/drm/intel/issues/9053
>   [i915#9196]: https://gitlab.freedesktop.org/drm/intel/issues/9196
>   [i915#9295]: https://gitlab.freedesktop.org/drm/intel/issues/9295
>   [i915#9311]: https://gitlab.freedesktop.org/drm/intel/issues/9311
>   [i915#9323]: https://gitlab.freedesktop.org/drm/intel/issues/9323
>   [i915#9340]: https://gitlab.freedesktop.org/drm/intel/issues/9340
>   [i915#9351]: https://gitlab.freedesktop.org/drm/intel/issues/9351
>   [i915#9412]: https://gitlab.freedesktop.org/drm/intel/issues/9412
>   [i915#9423]: https://gitlab.freedesktop.org/drm/intel/issues/9423
>   [i915#9424]: https://gitlab.freedesktop.org/drm/intel/issues/9424
>   [i915#9433]: https://gitlab.freedesktop.org/drm/intel/issues/9433
>   [i915#9519]: https://gitlab.freedesktop.org/drm/intel/issues/9519
>   [i915#9606]: https://gitlab.freedesktop.org/drm/intel/issues/9606
>   [i915#9683]: https://gitlab.freedesktop.org/drm/intel/issues/9683
>   [i915#9685]: https://gitlab.freedesktop.org/drm/intel/issues/9685
>   [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
>   [i915#9723]: https://gitlab.freedesktop.org/drm/intel/issues/9723
>   [i915#9728]: https://gitlab.freedesktop.org/drm/intel/issues/9728
>   [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
>   [i915#9779]: https://gitlab.freedesktop.org/drm/intel/issues/9779
>   [i915#9781]: https://gitlab.freedesktop.org/drm/intel/issues/9781
>   [i915#9808]: https://gitlab.freedesktop.org/drm/intel/issues/9808
>   [i915#9809]: https://gitlab.freedesktop.org/drm/intel/issues/9809
>   [i915#9820]: https://gitlab.freedesktop.org/drm/intel/issues/9820
>   [i915#9833]: https://gitlab.freedesktop.org/drm/intel/issues/9833
>   [i915#9849]: https://gitlab.freedesktop.org/drm/intel/issues/9849
>   [i915#9878]: https://gitlab.freedesktop.org/drm/intel/issues/9878
>   [i915#9906]: https://gitlab.freedesktop.org/drm/intel/issues/9906
>   [i915#9934]: https://gitlab.freedesktop.org/drm/intel/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7718 -> IGTPW_10709
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14307: b429bc6c8b05fe2346f4e6c3bd7
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10709/index.html
