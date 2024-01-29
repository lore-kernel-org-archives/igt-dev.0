Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8833C47422
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 10:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2738C10E545;
	Mon, 29 Jan 2024 10:05:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822F110E545;
 Mon, 29 Jan 2024 10:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706522723; x=1738058723;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sSuYOpe+fIvvytajkUQZrhPoufKDCmfTwdSuuBvpCNc=;
 b=kf+bU0NrfXb0nufeTFfRhiQdrnjGV6czDafFjOR6iLwgD8/gvXH5RWEd
 vRvuNNGxgO8eY+y5v11m/qNLkNTLVw4TNSCKY+fpsYiTobik6HTpALw19
 68jC8bblIGJI/oz1SyozQtHetnGbBZqCAtXmNFAumXmTonlSerkbiUrdx
 Cx63soT5w6U42BPx4AUVbw4K11K/CQ6TSQ6kaqRgS9mB7kSqQJR8Ir65D
 uUUFqrkLQLxszw8FuSIObiO8XZMcPp+awQ+YWnvj44LHZ2w+OqWVznzuR
 +YYDrV5Cy30lTrRRdnUuLMaJBGuWPVONXhzrI29efFuMMAe+4D/yVoAhJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="10295317"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; d="scan'208";a="10295317"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 02:05:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; d="scan'208";a="29736738"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 02:05:20 -0800
Date: Mon, 29 Jan 2024 11:05:17 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_series_start?=
 =?utf-8?Q?ing_wit?= =?utf-8?Q?h?= [i-g-t,v2,1/7] lib/xe/ioctl: introduce
 xe_bb_size() helper
Message-ID: <20240129100517.6wc4kafnb3wjo5hl@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240125105646.313561-1-matthew.auld@intel.com>
 <170651739196.789335.6006344513339161250@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170651739196.789335.6006344513339161250@5338d5abeb45>
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
Cc: lgci.bug.filing@intel.com, I915-ci-infra@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi igt-dev,
On 2024-01-29 at 08:36:31 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,v2,1/7] lib/xe/ioctl: introduce xe_bb_size() helper
> URL   : https://patchwork.freedesktop.org/series/129158/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7692_full -> IGTPW_10588_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10588_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10588_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10588_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_wait@await@bcs0:
>     - shard-snb:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-snb5/igt@gem_wait@await@bcs0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-snb6/igt@gem_wait@await@bcs0.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-dg1:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-dg1-18/igt@i915_pm_rps@reset.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-13/igt@i915_pm_rps@reset.html
> 

Unrealted to Xe libs and tests changes, no need for respin,

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_psr@psr2-cursor-mmap-gtt@edp-1}:
>     - shard-mtlp:         [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-mtlp-4/igt@kms_psr@psr2-cursor-mmap-gtt@edp-1.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-5/igt@kms_psr@psr2-cursor-mmap-gtt@edp-1.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10588_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][7] ([i915#8411])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-5/igt@api_intel_bb@blit-reloc-keep-cache.html
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#8411])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-12/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-mtlp:         NOTRUN -> [SKIP][9] ([i915#8411])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-5/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@api_intel_bb@crc32:
>     - shard-tglu:         NOTRUN -> [SKIP][10] ([i915#6230])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-2/igt@api_intel_bb@crc32.html
> 
>   * igt@drm_fdinfo@busy-hang@rcs0:
>     - shard-mtlp:         NOTRUN -> [SKIP][11] ([i915#8414]) +17 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-8/igt@drm_fdinfo@busy-hang@rcs0.html
> 
>   * igt@drm_fdinfo@idle@rcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][12] ([i915#7742])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-7/igt@drm_fdinfo@idle@rcs0.html
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_init:
>     - shard-glk:          NOTRUN -> [DMESG-WARN][13] ([i915#10140])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-glk8/igt@drm_mm@drm_mm@drm_test_mm_init.html
> 
>   * igt@fbdev@pan:
>     - shard-snb:          [PASS][14] -> [FAIL][15] ([i915#4435])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-snb6/igt@fbdev@pan.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-snb7/igt@fbdev@pan.html
> 
>   * igt@gem_ccs@block-copy-compressed:
>     - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#3555])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-7/igt@gem_ccs@block-copy-compressed.html
> 
>   * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][17] ([i915#7297])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
> 
>   * igt@gem_close_race@multigpu-basic-process:
>     - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#7697])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-1/igt@gem_close_race@multigpu-basic-process.html
> 
>   * igt@gem_create@create-ext-cpu-access-big:
>     - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#6335])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-8/igt@gem_create@create-ext-cpu-access-big.html
> 
>   * igt@gem_create@create-ext-cpu-access-sanity-check:
>     - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#6335])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-2/igt@gem_create@create-ext-cpu-access-sanity-check.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#8562])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-7/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_ctx_param@set-priority-not-supported:
>     - shard-tglu:         NOTRUN -> [SKIP][22] ([fdo#109314])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-10/igt@gem_ctx_param@set-priority-not-supported.html
> 
>   * igt@gem_ctx_persistence@heartbeat-close:
>     - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#8555])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-1/igt@gem_ctx_persistence@heartbeat-close.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#8555]) +2 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-hang.html
> 
>   * igt@gem_ctx_sseu@engines:
>     - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#280])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-2/igt@gem_ctx_sseu@engines.html
> 
>   * igt@gem_ctx_sseu@mmap-args:
>     - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#280])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@gem_ctx_sseu@mmap-args.html
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-tglu:         [PASS][27] -> [ABORT][28] ([i915#10030]) +1 other test abort
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-tglu-8/igt@gem_eio@in-flight-suspend.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-9/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_eio@reset-stress:
>     - shard-dg1:          [PASS][29] -> [FAIL][30] ([i915#5784])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-dg1-15/igt@gem_eio@reset-stress.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-17/igt@gem_eio@reset-stress.html
> 
>   * igt@gem_exec_balancer@bonded-pair:
>     - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#4771])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-1/igt@gem_exec_balancer@bonded-pair.html
> 
>   * igt@gem_exec_balancer@parallel-bb-first:
>     - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#4525])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-2/igt@gem_exec_balancer@parallel-bb-first.html
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-tglu:         NOTRUN -> [FAIL][33] ([i915#6117])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-6/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@gem_exec_capture@capture-invisible@smem0:
>     - shard-tglu:         NOTRUN -> [SKIP][34] ([i915#6334])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-6/igt@gem_exec_capture@capture-invisible@smem0.html
> 
>   * igt@gem_exec_capture@many-4k-incremental:
>     - shard-glk:          NOTRUN -> [FAIL][35] ([i915#9606]) +1 other test fail
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-glk5/igt@gem_exec_capture@many-4k-incremental.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-rkl:          [PASS][36] -> [FAIL][37] ([i915#2846])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-rkl-5/igt@gem_exec_fair@basic-deadline.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-flow:
>     - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#4473] / [i915#4771])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-7/igt@gem_exec_fair@basic-flow.html
> 
>   * igt@gem_exec_fair@basic-none-rrul@rcs0:
>     - shard-tglu:         NOTRUN -> [FAIL][39] ([i915#2842])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-3/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-vip@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][40] ([i915#2842])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-glk4/igt@gem_exec_fair@basic-none-vip@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@rcs0:
>     - shard-rkl:          [PASS][41] -> [FAIL][42] ([i915#2842]) +1 other test fail
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-rkl-6/igt@gem_exec_fair@basic-none@rcs0.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-1/igt@gem_exec_fair@basic-none@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace:
>     - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#3539])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-6/igt@gem_exec_fair@basic-pace.html
> 
>   * igt@gem_exec_fair@basic-pace-share:
>     - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3539] / [i915#4852]) +3 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-1/igt@gem_exec_fair@basic-pace-share.html
> 
>   * igt@gem_exec_fair@basic-pace-solo:
>     - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#4473])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-1/igt@gem_exec_fair@basic-pace-solo.html
> 
>   * igt@gem_exec_fair@basic-pace@bcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][46] ([i915#2842]) +1 other test fail
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-1/igt@gem_exec_fair@basic-pace@bcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][47] ([i915#2876])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-1/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-tglu:         [PASS][48] -> [FAIL][49] ([i915#2842])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-tglu-6/igt@gem_exec_fair@basic-throttle@rcs0.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-9/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_exec_fence@submit:
>     - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4812])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-5/igt@gem_exec_fence@submit.html
> 
>   * igt@gem_exec_fence@submit67:
>     - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4812]) +2 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-1/igt@gem_exec_fence@submit67.html
> 
>   * igt@gem_exec_gttfill@multigpu-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#7697])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-2/igt@gem_exec_gttfill@multigpu-basic.html
> 
>   * igt@gem_exec_params@secure-non-master:
>     - shard-dg2:          NOTRUN -> [SKIP][53] ([fdo#112283])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-1/igt@gem_exec_params@secure-non-master.html
> 
>   * igt@gem_exec_params@secure-non-root:
>     - shard-mtlp:         NOTRUN -> [SKIP][54] ([fdo#112283])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-2/igt@gem_exec_params@secure-non-root.html
> 
>   * igt@gem_exec_reloc@basic-gtt-wc-active:
>     - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#3281]) +3 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-19/igt@gem_exec_reloc@basic-gtt-wc-active.html
> 
>   * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
>     - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#3281]) +7 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-write-read-active:
>     - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3281]) +12 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-5/igt@gem_exec_reloc@basic-write-read-active.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts:
>     - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4537] / [i915#4812]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-6/igt@gem_exec_schedule@preempt-queue-contexts.html
> 
>   * igt@gem_exec_schedule@reorder-wide:
>     - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4537] / [i915#4812]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-2/igt@gem_exec_schedule@reorder-wide.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-none:
>     - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4860]) +1 other test skip
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-6/igt@gem_fence_thrash@bo-write-verify-none.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-x:
>     - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4860])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-x.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences:
>     - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4860])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-13/igt@gem_fenced_exec_thrash@no-spare-fences.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random:
>     - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#4613]) +4 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-random.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4565])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][65] ([i915#4613]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
>     - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4613]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@gem_lmem_swapping@random:
>     - shard-glk:          NOTRUN -> [SKIP][67] ([fdo#109271] / [i915#4613]) +7 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-glk1/igt@gem_lmem_swapping@random.html
> 
>   * igt@gem_mmap_gtt@coherency:
>     - shard-tglu:         NOTRUN -> [SKIP][68] ([fdo#111656])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-7/igt@gem_mmap_gtt@coherency.html
> 
>   * igt@gem_mmap_gtt@hang:
>     - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4077]) +11 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-6/igt@gem_mmap_gtt@hang.html
> 
>   * igt@gem_mmap_wc@close:
>     - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4083]) +1 other test skip
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-1/igt@gem_mmap_wc@close.html
> 
>   * igt@gem_mmap_wc@read:
>     - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#4083]) +5 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-1/igt@gem_mmap_wc@read.html
> 
>   * igt@gem_partial_pwrite_pread@write:
>     - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#3282]) +7 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-6/igt@gem_partial_pwrite_pread@write.html
> 
>   * igt@gem_partial_pwrite_pread@write-snoop:
>     - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#3282]) +2 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-6/igt@gem_partial_pwrite_pread@write-snoop.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#3282]) +9 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-4/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_pxp@create-protected-buffer:
>     - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4270])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-18/igt@gem_pxp@create-protected-buffer.html
> 
>   * igt@gem_pxp@create-regular-context-2:
>     - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#4270])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-7/igt@gem_pxp@create-regular-context-2.html
> 
>   * igt@gem_pxp@display-protected-crc:
>     - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4270]) +4 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-2/igt@gem_pxp@display-protected-crc.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-on:
>     - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#4270]) +3 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-on.html
> 
>   * igt@gem_pxp@verify-pxp-stale-ctx-execution:
>     - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#4270]) +1 other test skip
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-2/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
> 
>   * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#8428]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-5/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>     - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#8411]) +1 other test skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
> 
>   * igt@gem_softpin@evict-snoop-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#4885])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-6/igt@gem_softpin@evict-snoop-interruptible.html
> 
>   * igt@gem_tiled_blits@basic:
>     - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4077]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-15/igt@gem_tiled_blits@basic.html
> 
>   * igt@gem_tiled_pread_basic:
>     - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#4079])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-5/igt@gem_tiled_pread_basic.html
> 
>   * igt@gem_unfence_active_buffers:
>     - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4879])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-12/igt@gem_unfence_active_buffers.html
> 
>   * igt@gem_userptr_blits@access-control:
>     - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#3297]) +1 other test skip
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-5/igt@gem_userptr_blits@access-control.html
>     - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#3297]) +1 other test skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-6/igt@gem_userptr_blits@access-control.html
> 
>   * igt@gem_userptr_blits@create-destroy-unsync:
>     - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#3297]) +2 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-7/igt@gem_userptr_blits@create-destroy-unsync.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-glk:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#3323])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-glk1/igt@gem_userptr_blits@dmabuf-sync.html
>     - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#3323])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-1/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
>     - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#3297]) +3 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
> 
>   * igt@gem_userptr_blits@relocations:
>     - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#3281]) +6 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-7/igt@gem_userptr_blits@relocations.html
> 
>   * igt@gen3_render_linear_blits:
>     - shard-mtlp:         NOTRUN -> [SKIP][93] ([fdo#109289]) +3 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-1/igt@gen3_render_linear_blits.html
> 
>   * igt@gen7_exec_parse@chained-batch:
>     - shard-rkl:          NOTRUN -> [SKIP][94] ([fdo#109289]) +4 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-7/igt@gen7_exec_parse@chained-batch.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#2856]) +2 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-1/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@gen9_exec_parse@batch-without-end:
>     - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#2527]) +1 other test skip
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-1/igt@gen9_exec_parse@batch-without-end.html
> 
>   * igt@gen9_exec_parse@bb-secure:
>     - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#2527] / [i915#2856]) +1 other test skip
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-10/igt@gen9_exec_parse@bb-secure.html
> 
>   * igt@gen9_exec_parse@cmd-crossing-page:
>     - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#2527])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-12/igt@gen9_exec_parse@cmd-crossing-page.html
> 
>   * igt@gen9_exec_parse@valid-registers:
>     - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#2856]) +2 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-2/igt@gen9_exec_parse@valid-registers.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-mtlp:         NOTRUN -> [ABORT][100] ([i915#10131] / [i915#9820])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-dg2:          [PASS][101] -> [INCOMPLETE][102] ([i915#10137] / [i915#9820] / [i915#9849])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_freq_api@freq-reset-multiple:
>     - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#8399])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@i915_pm_freq_api@freq-reset-multiple.html
> 
>   * igt@i915_pm_rc6_residency@rc6-fence@gt0:
>     - shard-glk:          [PASS][104] -> [DMESG-WARN][105] ([i915#118])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-glk1/igt@i915_pm_rc6_residency@rc6-fence@gt0.html
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-glk4/igt@i915_pm_rc6_residency@rc6-fence@gt0.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>     - shard-mtlp:         NOTRUN -> [SKIP][106] ([fdo#109293])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
> 
>   * igt@i915_pm_rpm@system-suspend-execbuf:
>     - shard-dg1:          [PASS][107] -> [DMESG-WARN][108] ([i915#4423])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-dg1-14/igt@i915_pm_rpm@system-suspend-execbuf.html
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-12/igt@i915_pm_rpm@system-suspend-execbuf.html
> 
>   * igt@i915_pm_rps@min-max-config-idle:
>     - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#6621])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-5/igt@i915_pm_rps@min-max-config-idle.html
> 
>   * igt@i915_pm_rps@thresholds-idle-park@gt0:
>     - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#8925])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-12/igt@i915_pm_rps@thresholds-idle-park@gt0.html
> 
>   * igt@i915_pm_rps@thresholds-idle@gt0:
>     - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#8925]) +1 other test skip
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-2/igt@i915_pm_rps@thresholds-idle@gt0.html
> 
>   * igt@i915_pm_rps@thresholds-park@gt0:
>     - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#8925]) +1 other test skip
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-6/igt@i915_pm_rps@thresholds-park@gt0.html
> 
>   * igt@i915_pm_rps@thresholds@gt1:
>     - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#3555] / [i915#8925]) +1 other test skip
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-7/igt@i915_pm_rps@thresholds@gt1.html
> 
>   * igt@i915_query@query-topology-unsupported:
>     - shard-rkl:          NOTRUN -> [SKIP][114] ([fdo#109302])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@i915_query@query-topology-unsupported.html
> 
>   * igt@kms_addfb_basic@clobberred-modifier:
>     - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#4212]) +1 other test skip
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-5/igt@kms_addfb_basic@clobberred-modifier.html
> 
>   * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>     - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#4212])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-13/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
>     - shard-mtlp:         NOTRUN -> [SKIP][117] ([i915#4212]) +1 other test skip
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-6/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#3826])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
>     - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#8709]) +3 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#9531])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#1769] / [i915#3555])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#1769] / [i915#3555])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>     - shard-glk:          NOTRUN -> [SKIP][123] ([fdo#109271] / [i915#1769])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-glk5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#1769] / [i915#3555]) +1 other test skip
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#5286]) +4 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#4538] / [i915#5286])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-tglu:         NOTRUN -> [SKIP][127] ([fdo#111615] / [i915#5286]) +2 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-mtlp:         NOTRUN -> [SKIP][128] ([fdo#111614]) +1 other test skip
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-8/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][129] ([fdo#111614]) +4 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-tglu:         NOTRUN -> [SKIP][130] ([fdo#111614]) +1 other test skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>     - shard-mtlp:         NOTRUN -> [SKIP][131] ([fdo#111615]) +9 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][132] ([fdo#111614] / [i915#3638]) +1 other test skip
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-1/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-tglu:         [PASS][133] -> [FAIL][134] ([i915#3743]) +1 other test fail
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-tglu-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#5190]) +11 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#4538])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-19/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>     - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#4538] / [i915#5190]) +4 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][138] ([fdo#110723]) +3 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#6187])
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-5/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-rkl:          NOTRUN -> [SKIP][140] ([fdo#111615])
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-tglu:         NOTRUN -> [SKIP][141] ([fdo#111615]) +5 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#2705])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-2/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#2705]) +1 other test skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-10/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-yf-tiled-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#5354] / [i915#6095]) +21 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-2/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#5354] / [i915#6095]) +9 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-12/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#5354] / [i915#6095]) +36 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-9/igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@pipe-c-bad-pixel-format-yf-tiled-ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#5354] / [i915#6095]) +36 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-3/igt@kms_ccs@pipe-c-bad-pixel-format-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@pipe-d-bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
>     - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#5354]) +21 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@kms_ccs@pipe-d-bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#7213])
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-3/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#3742])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-7/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-tglu:         NOTRUN -> [SKIP][151] ([fdo#111827])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-8/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-rkl:          NOTRUN -> [SKIP][152] ([fdo#111827]) +1 other test skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_color@ctm-max:
>     - shard-mtlp:         NOTRUN -> [SKIP][153] ([fdo#111827])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-2/igt@kms_chamelium_color@ctm-max.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-dg1:          NOTRUN -> [SKIP][154] ([fdo#111827])
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-18/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-dg2:          NOTRUN -> [SKIP][155] ([fdo#111827]) +1 other test skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-2/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-fast:
>     - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#7828]) +11 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-3/igt@kms_chamelium_frames@hdmi-crc-fast.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - shard-snb:          NOTRUN -> [SKIP][157] ([fdo#109271]) +16 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-snb1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
>     - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#7828]) +5 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
>     - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#7828])
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-18/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-fast:
>     - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#7828]) +4 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#7828]) +5 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-1/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#7118])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-3/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#6944] / [i915#7116] / [i915#7118])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-10/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#3116])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#3116] / [i915#3299])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-2/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#3299])
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-1/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x32:
>     - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#3555]) +3 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#3359]) +4 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#3359]) +1 other test skip
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-7/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>     - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#3555]) +8 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x42:
>     - shard-mtlp:         NOTRUN -> [SKIP][171] ([i915#8814]) +3 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#3359])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
>     - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#3359]) +1 other test skip
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-max-size:
>     - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#3555] / [i915#8814]) +1 other test skip
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-1/igt@kms_cursor_crc@cursor-sliding-max-size.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-mtlp:         NOTRUN -> [SKIP][175] ([fdo#111767]) +1 other test skip
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>     - shard-tglu:         NOTRUN -> [SKIP][176] ([fdo#109274]) +1 other test skip
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#4103])
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][178] ([fdo#109274] / [i915#5354]) +2 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>     - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#9809]) +2 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-snb:          [PASS][180] -> [SKIP][181] ([fdo#109271] / [fdo#111767]) +1 other test skip
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-snb6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-glk:          NOTRUN -> [FAIL][182] ([i915#2346])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>     - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#9067])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
>     - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#9067])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#4103] / [i915#4213]) +1 other test skip
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#4213])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][187] ([fdo#110189] / [i915#9723])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][188] ([fdo#110189] / [i915#9723])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-12/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#3555]) +3 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#8588])
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-13/igt@kms_display_modes@mst-extended-mode-negative.html
>     - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#8588])
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-2/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#3804])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#1257])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-5/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#3555] / [i915#3840])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-6/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#3840])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
>     - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#3840])
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#3555] / [i915#3840])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-3/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_dsc@dsc-with-formats:
>     - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#3555] / [i915#3840])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-18/igt@kms_dsc@dsc-with-formats.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#3469])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-5/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#1839])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-2/igt@kms_feature_discovery@display-2x.html
>     - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#1839])
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-6/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-plain-flip:
>     - shard-rkl:          NOTRUN -> [SKIP][202] ([fdo#111825]) +9 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@kms_flip@2x-plain-flip.html
>     - shard-tglu:         NOTRUN -> [SKIP][203] ([fdo#109274] / [i915#3637]) +2 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-6/igt@kms_flip@2x-plain-flip.html
> 
>   * igt@kms_flip@2x-plain-flip-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][204] ([fdo#111825] / [i915#9934]) +1 other test skip
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-16/igt@kms_flip@2x-plain-flip-interruptible.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check:
>     - shard-dg2:          NOTRUN -> [SKIP][205] ([fdo#109274]) +4 other tests skip
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-5/igt@kms_flip@2x-wf_vblank-ts-check.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#8810])
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#2672]) +1 other test skip
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#2672]) +4 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#2672])
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#2587] / [i915#2672]) +2 other tests skip
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#3555] / [i915#8810]) +1 other test skip
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - shard-dg2:          NOTRUN -> [SKIP][212] ([fdo#109285])
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-5/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
>     - shard-dg2:          [PASS][213] -> [FAIL][214] ([i915#6880])
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#5354]) +78 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:
>     - shard-snb:          [PASS][216] -> [SKIP][217] ([fdo#109271]) +7 other tests skip
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#3458]) +18 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#8708]) +10 other tests skip
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-mtlp:         NOTRUN -> [SKIP][220] ([fdo#111767] / [i915#1825]) +1 other test skip
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#8708]) +3 other tests skip
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#8708]) +11 other tests skip
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#5439])
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#9766])
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:
>     - shard-tglu:         NOTRUN -> [SKIP][225] ([fdo#110189]) +13 other tests skip
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
>     - shard-glk:          NOTRUN -> [SKIP][226] ([fdo#109271]) +300 other tests skip
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-glk5/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#3458]) +3 other tests skip
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-rkl:          NOTRUN -> [SKIP][228] ([fdo#111767] / [fdo#111825] / [i915#1825]) +3 other tests skip
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
>     - shard-dg1:          NOTRUN -> [SKIP][229] ([fdo#111825]) +3 other tests skip
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
>     - shard-tglu:         NOTRUN -> [SKIP][230] ([fdo#109280] / [fdo#111767]) +1 other test skip
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-tglu:         NOTRUN -> [SKIP][231] ([fdo#109280]) +25 other tests skip
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][232] ([fdo#111767] / [i915#5354]) +1 other test skip
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][233] ([fdo#111825] / [i915#1825]) +20 other tests skip
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
>     - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#1825]) +16 other tests skip
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
>     - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#3023]) +14 other tests skip
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#3555] / [i915#8228])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-1/igt@kms_hdr@invalid-metadata-sizes.html
>     - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#3555] / [i915#8228])
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-1/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_hdr@static-toggle-dpms:
>     - shard-mtlp:         NOTRUN -> [SKIP][238] ([i915#3555] / [i915#8228])
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-7/igt@kms_hdr@static-toggle-dpms.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-tglu:         NOTRUN -> [SKIP][239] ([i915#3555] / [i915#8228])
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-5/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#4816])
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>     - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#1839]) +1 other test skip
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-18/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>     - shard-dg2:          NOTRUN -> [SKIP][242] ([fdo#109289]) +2 other tests skip
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-5/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
> 
>   * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
>     - shard-tglu:         NOTRUN -> [SKIP][243] ([fdo#109289])
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-10/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html
> 
>   * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [FAIL][244] ([i915#4573]) +3 other tests fail
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-glk5/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#3555] / [i915#8821])
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-5/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-dg2:          NOTRUN -> [SKIP][246] ([fdo#109274] / [i915#5354] / [i915#9423])
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#6953] / [i915#9423])
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-5/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [FAIL][248] ([i915#8292])
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#9423]) +7 other tests skip
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#5176]) +7 other tests skip
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#5176] / [i915#9423]) +1 other test skip
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#9423]) +1 other test skip
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#9423]) +11 other tests skip
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-13/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#5235] / [i915#9423]) +15 other tests skip
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#5235]) +2 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#3555] / [i915#5235])
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#5235]) +5 other tests skip
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#5235]) +3 other tests skip
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#5978])
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-1/igt@kms_pm_dc@dc6-dpms.html
>     - shard-tglu:         [PASS][260] -> [FAIL][261] ([i915#9295])
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-tglu-4/igt@kms_pm_dc@dc6-dpms.html
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-10/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#9340])
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-3/igt@kms_pm_lpsp@kms-lpsp.html
>     - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#9340])
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-14/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#9519])
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-tglu:         NOTRUN -> [SKIP][265] ([i915#9519])
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#9519]) +1 other test skip
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_pm_rpm@pc8-residency:
>     - shard-rkl:          NOTRUN -> [SKIP][267] ([fdo#109293] / [fdo#109506])
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-7/igt@kms_pm_rpm@pc8-residency.html
> 
>   * igt@kms_pm_rpm@pm-caching:
>     - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#4077]) +3 other tests skip
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-2/igt@kms_pm_rpm@pm-caching.html
> 
>   * igt@kms_prime@basic-crc-hybrid:
>     - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#6524])
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-5/igt@kms_prime@basic-crc-hybrid.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#6524])
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-2/igt@kms_prime@d3hot.html
>     - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#6524] / [i915#6805])
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-1/igt@kms_prime@d3hot.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
>     - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#9683]) +1 other test skip
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-4/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#9683]) +3 other tests skip
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
>     - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#9683])
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-7/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@plane-move-sf-dmg-area:
>     - shard-tglu:         NOTRUN -> [SKIP][275] ([fdo#111068] / [i915#9683]) +1 other test skip
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-8/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#4348])
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-tglu:         NOTRUN -> [SKIP][277] ([fdo#109642] / [fdo#111068] / [i915#9683])
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-6/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#9685])
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-rkl:          [PASS][279] -> [INCOMPLETE][280] ([i915#8875] / [i915#9569])
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-rkl-6/igt@kms_rotation_crc@primary-rotation-270.html
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-2/igt@kms_rotation_crc@primary-rotation-270.html
>     - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#4235])
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-5/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-mtlp:         NOTRUN -> [SKIP][282] ([i915#5289])
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#4235] / [i915#5190]) +1 other test skip
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#4235]) +1 other test skip
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_swab:
>     - shard-dg1:          [PASS][285] -> [DMESG-WARN][286] ([i915#10143])
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-dg1-19/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_swab.html
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-12/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_swab.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_abgr8888:
>     - shard-dg2:          [PASS][287] -> [DMESG-WARN][288] ([i915#10143]) +1 other test dmesg-warn
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-dg2-10/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_abgr8888.html
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-5/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_abgr8888.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_argb2101010:
>     - shard-rkl:          [PASS][289] -> [DMESG-WARN][290] ([i915#10143]) +1 other test dmesg-warn
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-rkl-1/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_argb2101010.html
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-4/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_argb2101010.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_xrgb2101010:
>     - shard-glk:          [PASS][291] -> [DMESG-WARN][292] ([i915#10143]) +1 other test dmesg-warn
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-glk7/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_xrgb2101010.html
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-glk8/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_xrgb2101010.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#3555] / [i915#8809])
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-5/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#8623])
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>     - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#8623])
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>     - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#8623])
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-mtlp:         NOTRUN -> [SKIP][297] ([fdo#109309])
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-8/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
>     - shard-tglu:         [PASS][298] -> [FAIL][299] ([i915#9196])
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
>     - shard-mtlp:         NOTRUN -> [FAIL][300] ([i915#9196])
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#2437])
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-1/igt@kms_writeback@writeback-fb-id.html
>     - shard-rkl:          NOTRUN -> [SKIP][302] ([i915#2437])
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-1/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-glk:          NOTRUN -> [SKIP][303] ([fdo#109271] / [i915#2437]) +1 other test skip
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-glk9/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@perf@gen8-unprivileged-single-ctx-counters:
>     - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#2436])
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-2/igt@perf@gen8-unprivileged-single-ctx-counters.html
>     - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#2436])
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html
> 
>   * igt@perf@mi-rpc:
>     - shard-mtlp:         NOTRUN -> [SKIP][306] ([i915#2434])
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-7/igt@perf@mi-rpc.html
> 
>   * igt@perf_pmu@busy-double-start@rcs0:
>     - shard-mtlp:         NOTRUN -> [FAIL][307] ([i915#4349]) +2 other tests fail
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-8/igt@perf_pmu@busy-double-start@rcs0.html
> 
>   * igt@prime_udl:
>     - shard-rkl:          NOTRUN -> [SKIP][308] ([fdo#109291])
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@prime_udl.html
> 
>   * igt@prime_vgem@basic-read:
>     - shard-mtlp:         NOTRUN -> [SKIP][309] ([i915#3708])
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-3/igt@prime_vgem@basic-read.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#9917])
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#9917])
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-6/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each:
>     - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#9917])
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-1/igt@sriov_basic@enable-vfs-bind-unbind-each.html
> 
>   * igt@v3d/v3d_perfmon@create-two-perfmon:
>     - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#2575]) +13 other tests skip
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-1/igt@v3d/v3d_perfmon@create-two-perfmon.html
> 
>   * igt@v3d/v3d_submit_csd@bad-pad:
>     - shard-tglu:         NOTRUN -> [SKIP][314] ([fdo#109315] / [i915#2575]) +7 other tests skip
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-3/igt@v3d/v3d_submit_csd@bad-pad.html
>     - shard-mtlp:         NOTRUN -> [SKIP][315] ([i915#2575]) +11 other tests skip
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-6/igt@v3d/v3d_submit_csd@bad-pad.html
> 
>   * igt@v3d/v3d_submit_csd@valid-submission:
>     - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#2575]) +1 other test skip
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-16/igt@v3d/v3d_submit_csd@valid-submission.html
> 
>   * igt@v3d/v3d_wait_bo@bad-bo:
>     - shard-rkl:          NOTRUN -> [SKIP][317] ([fdo#109315]) +9 other tests skip
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-4/igt@v3d/v3d_wait_bo@bad-bo.html
> 
>   * igt@vc4/vc4_create_bo@create-bo-4096:
>     - shard-mtlp:         NOTRUN -> [SKIP][318] ([i915#7711]) +5 other tests skip
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-5/igt@vc4/vc4_create_bo@create-bo-4096.html
> 
>   * igt@vc4/vc4_perfmon@create-two-perfmon:
>     - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#7711]) +6 other tests skip
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-7/igt@vc4/vc4_perfmon@create-two-perfmon.html
> 
>   * igt@vc4/vc4_purgeable_bo@access-purgeable-bo-mem:
>     - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#7711]) +1 other test skip
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-16/igt@vc4/vc4_purgeable_bo@access-purgeable-bo-mem.html
> 
>   * igt@vc4/vc4_purgeable_bo@free-purged-bo:
>     - shard-tglu:         NOTRUN -> [SKIP][321] ([i915#2575]) +5 other tests skip
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-3/igt@vc4/vc4_purgeable_bo@free-purged-bo.html
> 
>   * igt@vc4/vc4_tiling@get-bad-modifier:
>     - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#7711]) +5 other tests skip
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-1/igt@vc4/vc4_tiling@get-bad-modifier.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-dg1:          [FAIL][323] ([i915#5784]) -> [PASS][324]
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-dg1-15/igt@gem_eio@unwedge-stress.html
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-17/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_fair@basic-none-vip@rcs0:
>     - shard-rkl:          [FAIL][325] ([i915#2842]) -> [PASS][326] +1 other test pass
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-rkl-1/igt@gem_exec_fair@basic-none-vip@rcs0.html
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@gem_exec_fair@basic-none-vip@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vcs0:
>     - shard-glk:          [FAIL][327] ([i915#2842]) -> [PASS][328]
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-glk3/igt@gem_exec_fair@basic-none@vcs0.html
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-glk1/igt@gem_exec_fair@basic-none@vcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-tglu:         [FAIL][329] ([i915#2842]) -> [PASS][330]
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-tglu-8/igt@gem_exec_fair@basic-pace@rcs0.html
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-6/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-glk:          [INCOMPLETE][331] ([i915#10137] / [i915#5566]) -> [PASS][332]
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-glk8/igt@gen9_exec_parse@allowed-all.html
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-glk3/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-snb:          [INCOMPLETE][333] ([i915#10137] / [i915#9200] / [i915#9849]) -> [PASS][334]
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
>     - shard-dg1:          [FAIL][335] ([i915#3591]) -> [PASS][336]
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
>     - shard-glk:          [DMESG-WARN][337] ([i915#118]) -> [PASS][338]
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-glk7/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-glk9/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
> 
>   * igt@i915_pm_rpm@system-suspend-devices:
>     - shard-tglu:         [ABORT][339] -> [PASS][340]
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-tglu-9/igt@i915_pm_rpm@system-suspend-devices.html
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-3/igt@i915_pm_rpm@system-suspend-devices.html
> 
>   * igt@i915_power@sanity:
>     - shard-mtlp:         [SKIP][341] ([i915#7984]) -> [PASS][342]
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-mtlp-6/igt@i915_power@sanity.html
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-8/igt@i915_power@sanity.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-a:
>     - shard-glk:          [DMESG-WARN][343] -> [PASS][344]
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-glk8/igt@kms_cursor_legacy@torture-move@pipe-a.html
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-glk3/igt@kms_cursor_legacy@torture-move@pipe-a.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-tglu:         [INCOMPLETE][345] ([i915#8797] / [i915#9878]) -> [PASS][346]
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-tglu-7/igt@kms_fbcon_fbt@fbc-suspend.html
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-10/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
>     - shard-dg2:          [FAIL][347] ([i915#6880]) -> [PASS][348]
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
>     - shard-snb:          [SKIP][349] ([fdo#109271]) -> [PASS][350] +7 other tests pass
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-rkl:          [ABORT][351] ([i915#8875]) -> [PASS][352]
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-rkl-5/igt@kms_rotation_crc@sprite-rotation-270.html
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_clip_offset:
>     - shard-rkl:          [DMESG-WARN][353] ([i915#10143]) -> [PASS][354] +2 other tests pass
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-rkl-1/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_clip_offset.html
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-4/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_clip_offset.html
>     - shard-glk:          [DMESG-WARN][355] ([i915#10143]) -> [PASS][356]
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-glk7/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_clip_offset.html
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-glk8/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_clip_offset.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_swab:
>     - shard-dg2:          [DMESG-WARN][357] ([i915#10143]) -> [PASS][358] +1 other test pass
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-dg2-10/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_swab.html
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-5/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_swab.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_argb2101010:
>     - shard-dg1:          [DMESG-WARN][359] ([i915#10143]) -> [PASS][360]
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-dg1-19/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_argb2101010.html
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-12/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_argb2101010.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-glk:          [INCOMPLETE][361] ([i915#10042] / [i915#10137]) -> [WARN][362] ([i915#2658])
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-glk5/igt@gem_pwrite@basic-exhaustion.html
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-glk8/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg1:          [ABORT][363] ([i915#9820]) -> [INCOMPLETE][364] ([i915#10137] / [i915#9820] / [i915#9849])
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-dg1-13/igt@i915_module_load@reload-with-fault-injection.html
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-14/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-dg1:          [SKIP][365] ([i915#9424]) -> [SKIP][366] ([i915#9433])
>    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-dg1-19/igt@kms_content_protection@mei-interface.html
>    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-16/igt@kms_content_protection@mei-interface.html
>     - shard-snb:          [SKIP][367] ([fdo#109271]) -> [INCOMPLETE][368] ([i915#9878])
>    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-snb6/igt@kms_content_protection@mei-interface.html
>    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-snb7/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
>     - shard-snb:          [SKIP][369] ([fdo#109271]) -> [SKIP][370] ([fdo#109271] / [fdo#110189])
>    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-snb7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html
>    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-snb4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html
>     - shard-tglu:         [SKIP][371] ([i915#9723]) -> [SKIP][372] ([fdo#110189] / [i915#9723])
>    [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-tglu-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html
>    [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2:
>     - shard-glk:          [SKIP][373] ([fdo#109271]) -> [SKIP][374] ([fdo#109271] / [fdo#110189]) +1 other test skip
>    [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-glk9/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2.html
>    [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-glk1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-rkl:          [SKIP][375] ([fdo#110189] / [i915#3955]) -> [SKIP][376] ([i915#3955])
>    [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-rkl-2/igt@kms_fbcon_fbt@psr-suspend.html
>    [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-mtlp:         [SKIP][377] ([i915#1825]) -> [SKIP][378] ([fdo#111767] / [i915#1825]) +6 other tests skip
>    [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
>    [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-tglu:         [SKIP][379] ([fdo#109280]) -> [SKIP][380] ([fdo#109280] / [fdo#111767]) +10 other tests skip
>    [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>    [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-snb:          [SKIP][381] ([fdo#109271]) -> [SKIP][382] ([fdo#109271] / [fdo#111767]) +8 other tests skip
>    [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-snb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>    [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-snb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-dg2:          [SKIP][383] ([i915#5354]) -> [SKIP][384] ([fdo#111767] / [i915#5354]) +4 other tests skip
>    [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
>    [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
>     - shard-rkl:          [SKIP][385] ([fdo#111825] / [i915#1825]) -> [SKIP][386] ([fdo#111767] / [fdo#111825] / [i915#1825]) +6 other tests skip
>    [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html
>    [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html
>     - shard-dg1:          [SKIP][387] ([fdo#111825]) -> [SKIP][388] ([fdo#111767] / [fdo#111825]) +7 other tests skip
>    [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html
>    [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-rkl:          [SKIP][389] ([i915#4070] / [i915#4816]) -> [SKIP][390] ([i915#4816])
>    [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-rkl:          [SKIP][391] ([i915#3361]) -> [SKIP][392] ([i915#4281])
>    [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html
>    [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-rkl-5/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_build_fourcc_list:
>     - shard-glk:          [DMESG-FAIL][393] ([i915#10143]) -> [FAIL][394] ([i915#10136])
>    [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/shard-glk7/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_build_fourcc_list.html
>    [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/shard-glk8/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_build_fourcc_list.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
>   [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
>   [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
>   [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
>   [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
>   [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#10030]: https://gitlab.freedesktop.org/drm/intel/issues/10030
>   [i915#10042]: https://gitlab.freedesktop.org/drm/intel/issues/10042
>   [i915#10131]: https://gitlab.freedesktop.org/drm/intel/issues/10131
>   [i915#10136]: https://gitlab.freedesktop.org/drm/intel/issues/10136
>   [i915#10137]: https://gitlab.freedesktop.org/drm/intel/issues/10137
>   [i915#10140]: https://gitlab.freedesktop.org/drm/intel/issues/10140
>   [i915#10143]: https://gitlab.freedesktop.org/drm/intel/issues/10143
>   [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
>   [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
>   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
>   [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2876]: https://gitlab.freedesktop.org/drm/intel/issues/2876
>   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
>   [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
>   [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
>   [i915#4348]: https://gitlab.freedesktop.org/drm/intel/issues/4348
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
>   [i915#4435]: https://gitlab.freedesktop.org/drm/intel/issues/4435
>   [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
>   [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
>   [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#5978]: https://gitlab.freedesktop.org/drm/intel/issues/5978
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6117]: https://gitlab.freedesktop.org/drm/in
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/index.html
