Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208A4C47422
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 08:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B733810E9B8;
	Mon, 29 Jan 2024 08:53:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40AF10F69D;
 Mon, 29 Jan 2024 08:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706518421; x=1738054421;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7nKphVtj/yvyNhdxsFvpNw/E2330PanM8WziCb9O3/Y=;
 b=eMKvIwkSOij8DxBSs6hTRj2P98jPnfdFILuyzWy1GiUn36pgXQRa3Lg4
 naDDdPb8XK9u0xOEWDkwXzJcFhWXs0GGey+G8Xw1cDlF76n6Moq+I9hOK
 KW8VQlUe1ptdt/hRliUjJKhvPo9krPOHyJi551E47purP19kO4GP2SaXZ
 773yTI/uwqF1te0uy94JJzF5gJbB83JUJ708jZjcBnkbaYgEwOpX5kUsG
 lDMqYBW4qZbUhkHzCuHhOCWx7o+wAGjEGbAxKqGDsxf7iMvLT9T2dS18v
 I1ndIANfVgyrSxzOttwCXYU7JyFHrP43HuuJC/TAulY/mHV5wrsx0ZqIF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="9640335"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="9640335"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 00:53:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="931026619"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; d="scan'208";a="931026619"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmsmga001-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 00:53:34 -0800
Date: Mon, 29 Jan 2024 09:53:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 introduce Xe multigpu and other multi-GPU helpers (rev4)
Message-ID: <20240129085332.yp7zbgh6xqy7o7xt@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org,
 lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240126173148.63246-1-kamil.konieczny@linux.intel.com>
 <170631495791.764780.8091895371997407757@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170631495791.764780.8091895371997407757@5338d5abeb45>
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
On 2024-01-27 at 00:22:37 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: introduce Xe multigpu and other multi-GPU helpers (rev4)
> URL   : https://patchwork.freedesktop.org/series/129101/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14186_full -> IGTPW_10594_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10594_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10594_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/index.html
> 
> Participating hosts (8 -> 9)
> ------------------------------
> 
>   Additional (1): shard-snb-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10594_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_create@create-ext-cpu-access-big:
>     - shard-dg2:          NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html
> 

This is unrelated to new gem_mmap subtest.

>   * {igt@gem_mmap@basic-multigpu} (NEW):
>     - shard-dg1:          NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-15/igt@gem_mmap@basic-multigpu.html
>     - shard-mtlp:         NOTRUN -> [SKIP][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-3/igt@gem_mmap@basic-multigpu.html
> 

These are expected on single-GPU boards.

>   * igt@kms_cursor_legacy@torture-bo@pipe-a:
>     - shard-dg1:          [PASS][4] -> [DMESG-WARN][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg1-15/igt@kms_cursor_legacy@torture-bo@pipe-a.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-17/igt@kms_cursor_legacy@torture-bo@pipe-a.html
> 

Unrelated,

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_14186_full and IGTPW_10594_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@gem_mmap@basic-multigpu:
>     - Statuses : 4 pass(s) 2 skip(s)
>     - Exec time: [0.0, 0.11] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10594_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#8411])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-14/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-dg2:          NOTRUN -> [SKIP][7] ([i915#8411])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-1/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@debugfs_test@basic-hwmon:
>     - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#9318])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-1/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-mtlp:         NOTRUN -> [SKIP][9] ([i915#7701])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-4/igt@device_reset@cold-reset-bound.html
> 
>   * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_limit:
>     - shard-tglu:         NOTRUN -> [DMESG-WARN][10] ([i915#10140])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-5/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_limit.html
>     - shard-rkl:          NOTRUN -> [DMESG-WARN][11] ([i915#10140])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-1/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_limit.html
>     - shard-dg1:          NOTRUN -> [DMESG-WARN][12] ([i915#10140])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-16/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_limit.html
> 
>   * igt@drm_fdinfo@all-busy-check-all:
>     - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#8414]) +12 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-5/igt@drm_fdinfo@all-busy-check-all.html
> 
>   * igt@drm_fdinfo@busy@rcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#8414]) +9 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-6/igt@drm_fdinfo@busy@rcs0.html
> 
>   * igt@drm_fdinfo@virtual-idle:
>     - shard-rkl:          NOTRUN -> [FAIL][15] ([i915#7742])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-1/igt@drm_fdinfo@virtual-idle.html
> 
>   * igt@gem_busy@semaphore:
>     - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#3936])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-5/igt@gem_busy@semaphore.html
>     - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#3936])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-18/igt@gem_busy@semaphore.html
> 
>   * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][18] ([i915#7297])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-10/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html
> 
>   * igt@gem_create@hog-create@smem0:
>     - shard-mtlp:         NOTRUN -> [FAIL][19] ([i915#8758])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-5/igt@gem_create@hog-create@smem0.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-rkl:          [PASS][20] -> [FAIL][21] ([i915#6268])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-rkl-6/igt@gem_ctx_exec@basic-nohangcheck.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-5/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_persistence@heartbeat-close:
>     - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#8555])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-close.html
> 
>   * igt@gem_ctx_sseu@invalid-args:
>     - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#280])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-3/igt@gem_ctx_sseu@invalid-args.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#280])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html
>     - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#280])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-17/igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_eio@hibernate:
>     - shard-dg1:          [PASS][26] -> [ABORT][27] ([i915#7975] / [i915#8213])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg1-16/igt@gem_eio@hibernate.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-14/igt@gem_eio@hibernate.html
>     - shard-tglu:         [PASS][28] -> [ABORT][29] ([i915#10030] / [i915#7975] / [i915#8213])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-tglu-3/igt@gem_eio@hibernate.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-10/igt@gem_eio@hibernate.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-dg1:          NOTRUN -> [FAIL][30] ([i915#5784])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-19/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_balancer@invalid-bonds:
>     - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#4036])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-2/igt@gem_exec_balancer@invalid-bonds.html
>     - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#4036])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-15/igt@gem_exec_balancer@invalid-bonds.html
> 
>   * igt@gem_exec_balancer@parallel-out-fence:
>     - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#4525])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-5/igt@gem_exec_balancer@parallel-out-fence.html
> 
>   * igt@gem_exec_capture@many-4k-zero:
>     - shard-dg1:          NOTRUN -> [FAIL][34] ([i915#9606])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-14/igt@gem_exec_capture@many-4k-zero.html
>     - shard-tglu:         NOTRUN -> [FAIL][35] ([i915#9606])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-8/igt@gem_exec_capture@many-4k-zero.html
>     - shard-rkl:          NOTRUN -> [FAIL][36] ([i915#9606])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-1/igt@gem_exec_capture@many-4k-zero.html
> 
>   * igt@gem_exec_fair@basic-none-rrul@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][37] ([i915#2842]) +2 other tests fail
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-glk4/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vecs0:
>     - shard-rkl:          [PASS][38] -> [FAIL][39] ([i915#2842]) +1 other test fail
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-rkl-2/igt@gem_exec_fair@basic-none@vecs0.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-7/igt@gem_exec_fair@basic-none@vecs0.html
> 
>   * igt@gem_exec_fair@basic-pace-solo:
>     - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#3539]) +2 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-7/igt@gem_exec_fair@basic-pace-solo.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-rkl:          [PASS][41] -> [FAIL][42] ([i915#2876])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-rkl-2/igt@gem_exec_fair@basic-pace@rcs0.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-tglu:         [PASS][43] -> [FAIL][44] ([i915#2842])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-tglu-3/igt@gem_exec_fair@basic-throttle@rcs0.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-5/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_exec_fence@submit:
>     - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#4812])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-3/igt@gem_exec_fence@submit.html
> 
>   * igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines:
>     - shard-dg1:          [PASS][46] -> [DMESG-WARN][47] ([i915#4423])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg1-15/igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines.html
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-17/igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-uc:
>     - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#3539] / [i915#4852])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-5/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
> 
>   * igt@gem_exec_flush@basic-uc-pro-default:
>     - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3539] / [i915#4852]) +2 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-17/igt@gem_exec_flush@basic-uc-pro-default.html
> 
>   * igt@gem_exec_gttfill@multigpu-basic:
>     - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#7697])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-2/igt@gem_exec_gttfill@multigpu-basic.html
> 
>   * igt@gem_exec_params@rsvd2-dirt:
>     - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#5107])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-4/igt@gem_exec_params@rsvd2-dirt.html
>     - shard-tglu:         NOTRUN -> [SKIP][52] ([fdo#109283])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-6/igt@gem_exec_params@rsvd2-dirt.html
> 
>   * igt@gem_exec_params@secure-non-root:
>     - shard-rkl:          NOTRUN -> [SKIP][53] ([fdo#112283])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-2/igt@gem_exec_params@secure-non-root.html
> 
>   * igt@gem_exec_reloc@basic-cpu-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#3281]) +8 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-16/igt@gem_exec_reloc@basic-cpu-wc.html
> 
>   * igt@gem_exec_reloc@basic-scanout:
>     - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#3281]) +8 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-7/igt@gem_exec_reloc@basic-scanout.html
> 
>   * igt@gem_exec_reloc@basic-softpin:
>     - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#3281]) +9 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-6/igt@gem_exec_reloc@basic-softpin.html
> 
>   * igt@gem_exec_reloc@basic-write-cpu:
>     - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#3281]) +3 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-2/igt@gem_exec_reloc@basic-write-cpu.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts:
>     - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4812]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-15/igt@gem_exec_schedule@preempt-queue-contexts.html
> 
>   * igt@gem_exec_schedule@semaphore-power:
>     - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4537] / [i915#4812]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-5/igt@gem_exec_schedule@semaphore-power.html
> 
>   * igt@gem_exec_whisper@basic-queues-forked:
>     - shard-rkl:          [PASS][60] -> [INCOMPLETE][61] ([i915#9857])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-rkl-4/igt@gem_exec_whisper@basic-queues-forked.html
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-6/igt@gem_exec_whisper@basic-queues-forked.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences:
>     - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4860]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences.html
> 
>   * igt@gem_lmem_evict@dontneed-evict-race:
>     - shard-dg1:          [PASS][63] -> [DMESG-WARN][64] ([i915#4391] / [i915#4423])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg1-19/igt@gem_lmem_evict@dontneed-evict-race.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-17/igt@gem_lmem_evict@dontneed-evict-race.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random:
>     - shard-tglu:         NOTRUN -> [SKIP][65] ([i915#4613]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-5/igt@gem_lmem_swapping@heavy-verify-random.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#4613]) +4 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
> 
>   * igt@gem_lmem_swapping@random:
>     - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4613]) +2 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-1/igt@gem_lmem_swapping@random.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - shard-glk:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#4613]) +3 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-glk3/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@gem_lmem_swapping@verify-ccs@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4565])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-18/igt@gem_lmem_swapping@verify-ccs@lmem0.html
> 
>   * igt@gem_media_fill@media-fill:
>     - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#8289])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-5/igt@gem_media_fill@media-fill.html
> 
>   * igt@gem_media_vme:
>     - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#284])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-4/igt@gem_media_vme.html
>     - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#284])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-12/igt@gem_media_vme.html
>     - shard-tglu:         NOTRUN -> [SKIP][73] ([i915#284])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-5/igt@gem_media_vme.html
> 
>   * igt@gem_mmap@bad-size:
>     - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#4083]) +6 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-6/igt@gem_mmap@bad-size.html
> 
>   * igt@gem_mmap@big-bo:
>     - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4083])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-15/igt@gem_mmap@big-bo.html
> 
>   * igt@gem_mmap_gtt@basic-read-write-distinct:
>     - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4077]) +4 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-4/igt@gem_mmap_gtt@basic-read-write-distinct.html
> 
>   * igt@gem_mmap_gtt@basic-small-copy-xy:
>     - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4077]) +4 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-15/igt@gem_mmap_gtt@basic-small-copy-xy.html
> 
>   * igt@gem_mmap_wc@fault-concurrent:
>     - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4083]) +3 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-6/igt@gem_mmap_wc@fault-concurrent.html
> 
>   * igt@gem_pread@bench:
>     - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#3282]) +5 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-5/igt@gem_pread@bench.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#3282]) +3 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-12/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
>     - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4270]) +7 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-6/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
> 
>   * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
>     - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#4270]) +4 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
> 
>   * igt@gem_pxp@verify-pxp-stale-buf-execution:
>     - shard-tglu:         NOTRUN -> [SKIP][83] ([i915#4270])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-5/igt@gem_pxp@verify-pxp-stale-buf-execution.html
> 
>   * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
>     - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#4270]) +1 other test skip
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-8/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
> 
>   * igt@gem_pxp@verify-pxp-stale-ctx-execution:
>     - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4270]) +2 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-19/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
> 
>   * igt@gem_readwrite@beyond-eob:
>     - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#3282]) +5 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-6/igt@gem_readwrite@beyond-eob.html
> 
>   * igt@gem_readwrite@read-write:
>     - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#3282]) +1 other test skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-3/igt@gem_readwrite@read-write.html
> 
>   * igt@gem_render_copy@y-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#8428]) +3 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-1/igt@gem_render_copy@y-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>     - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#8411]) +2 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-1/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
>     - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#4079])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-16/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
> 
>   * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#4079])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-2/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
> 
>   * igt@gem_spin_batch@spin-all-new:
>     - shard-dg2:          NOTRUN -> [FAIL][92] ([i915#5889])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-6/igt@gem_spin_batch@spin-all-new.html
> 
>   * igt@gem_tiled_partial_pwrite_pread@writes:
>     - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#4077]) +7 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-7/igt@gem_tiled_partial_pwrite_pread@writes.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
>     - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#3297]) +1 other test skip
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-1/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
> 
>   * igt@gem_userptr_blits@unsync-unmap:
>     - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#3297])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-13/igt@gem_userptr_blits@unsync-unmap.html
>     - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#3297])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-2/igt@gem_userptr_blits@unsync-unmap.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-after-close:
>     - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#3297]) +2 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap-after-close.html
>     - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#3297])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-10/igt@gem_userptr_blits@unsync-unmap-after-close.html
> 
>   * igt@gen3_render_tiledx_blits:
>     - shard-dg2:          NOTRUN -> [SKIP][99] ([fdo#109289]) +2 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-5/igt@gen3_render_tiledx_blits.html
> 
>   * igt@gen7_exec_parse@load-register-reg:
>     - shard-rkl:          NOTRUN -> [SKIP][100] ([fdo#109289])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-6/igt@gen7_exec_parse@load-register-reg.html
>     - shard-dg1:          NOTRUN -> [SKIP][101] ([fdo#109289])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-18/igt@gen7_exec_parse@load-register-reg.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-glk:          [PASS][102] -> [INCOMPLETE][103] ([i915#10137] / [i915#5566])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-glk5/igt@gen9_exec_parse@allowed-single.html
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-glk7/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@bb-oversize:
>     - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#2527])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-16/igt@gen9_exec_parse@bb-oversize.html
> 
>   * igt@gen9_exec_parse@bb-secure:
>     - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#2527] / [i915#2856]) +1 other test skip
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-4/igt@gen9_exec_parse@bb-secure.html
>     - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#2856]) +1 other test skip
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-3/igt@gen9_exec_parse@bb-secure.html
> 
>   * igt@gen9_exec_parse@bb-start-cmd:
>     - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#2527]) +1 other test skip
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-5/igt@gen9_exec_parse@bb-start-cmd.html
> 
>   * igt@gen9_exec_parse@unaligned-jump:
>     - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#2856]) +4 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-6/igt@gen9_exec_parse@unaligned-jump.html
> 
>   * igt@i915_module_load@load:
>     - shard-mtlp:         NOTRUN -> [SKIP][109] ([i915#6227])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-8/igt@i915_module_load@load.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-glk:          [PASS][110] -> [INCOMPLETE][111] ([i915#10137] / [i915#9200] / [i915#9849])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-glk1/igt@i915_module_load@reload-with-fault-injection.html
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-glk8/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-mtlp:         [PASS][112] -> [ABORT][113] ([i915#10131] / [i915#9820])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-dg2:          [PASS][114] -> [ABORT][115] ([i915#9820])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_module_load@resize-bar:
>     - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#6412])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-8/igt@i915_module_load@resize-bar.html
> 
>   * igt@i915_pm_freq_api@freq-suspend@gt0:
>     - shard-dg2:          [PASS][117] -> [INCOMPLETE][118] ([i915#9407])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg2-10/igt@i915_pm_freq_api@freq-suspend@gt0.html
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html
> 
>   * igt@i915_pm_freq_mult@media-freq@gt0:
>     - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#6590])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-4/igt@i915_pm_freq_mult@media-freq@gt0.html
> 
>   * igt@i915_pm_freq_mult@media-freq@gt1:
>     - shard-mtlp:         NOTRUN -> [SKIP][120] ([i915#6590]) +1 other test skip
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-3/igt@i915_pm_freq_mult@media-freq@gt1.html
> 
>   * igt@i915_pm_rc6_residency@rc6-fence@gt0:
>     - shard-tglu:         NOTRUN -> [WARN][121] ([i915#2681])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-fence@gt0.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
>     - shard-dg1:          [PASS][122] -> [FAIL][123] ([i915#3591])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>     - shard-dg2:          NOTRUN -> [SKIP][124] ([fdo#109293] / [fdo#109506])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
> 
>   * igt@i915_pm_rps@thresholds-park@gt0:
>     - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#8925])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-2/igt@i915_pm_rps@thresholds-park@gt0.html
> 
>   * igt@i915_pm_rps@thresholds-park@gt1:
>     - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#3555] / [i915#8925])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-2/igt@i915_pm_rps@thresholds-park@gt1.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#6245])
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-4/igt@i915_query@hwconfig_table.html
> 
>   * igt@i915_query@query-topology-unsupported:
>     - shard-mtlp:         NOTRUN -> [SKIP][128] ([fdo#109302])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-7/igt@i915_query@query-topology-unsupported.html
> 
>   * igt@i915_selftest@mock@memory_region:
>     - shard-mtlp:         NOTRUN -> [DMESG-WARN][129] ([i915#9311])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-6/igt@i915_selftest@mock@memory_region.html
> 
>   * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
>     - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#4212]) +3 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-7/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
> 
>   * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>     - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#4212])
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-5/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:
>     - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#8709]) +11 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#8709]) +7 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#8709]) +11 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#6228])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-3/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#9531])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#1769] / [i915#3555])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
>     - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#5286]) +2 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-tglu:         NOTRUN -> [SKIP][139] ([fdo#111615] / [i915#5286]) +1 other test skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-3/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>     - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#5286])
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#4538] / [i915#5286])
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-mtlp:         NOTRUN -> [FAIL][142] ([i915#5138])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][143] ([fdo#111614]) +2 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-5/igt@kms_big_fb@linear-64bpp-rotate-270.html
>     - shard-tglu:         NOTRUN -> [SKIP][144] ([fdo#111614])
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-3/igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][145] ([fdo#111614] / [i915#3638]) +2 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html
>     - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#3638])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-18/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-dg2:          NOTRUN -> [SKIP][147] ([fdo#111614]) +3 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
>     - shard-mtlp:         NOTRUN -> [SKIP][148] ([fdo#111615]) +5 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#5190]) +12 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-tglu:         [PASS][150] -> [FAIL][151] ([i915#3743]) +2 other tests fail
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#4538]) +3 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-18/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>     - shard-tglu:         NOTRUN -> [SKIP][153] ([fdo#111615]) +3 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#4538] / [i915#5190]) +3 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-rkl:          NOTRUN -> [SKIP][155] ([fdo#110723]) +2 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#2705])
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-5/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_ccs@pipe-a-bad-pixel-format-y-tiled-gen12-mc-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#5354] / [i915#6095]) +20 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-2/igt@kms_ccs@pipe-a-bad-pixel-format-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-dg2-mc-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#5354] / [i915#6095]) +26 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-9/igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@pipe-a-missing-ccs-buffer-y-tiled-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#5354]) +59 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-3/igt@kms_ccs@pipe-a-missing-ccs-buffer-y-tiled-ccs.html
> 
>   * igt@kms_ccs@pipe-b-bad-pixel-format-4-tiled-dg2-mc-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#5354] / [i915#6095]) +30 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-14/igt@kms_ccs@pipe-b-bad-pixel-format-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-dg2-mc-ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#5354] / [i915#6095]) +22 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-2/igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#5354]) +27 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-4/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#7213])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-4/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#7213]) +3 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#4087]) +3 other tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-5/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio-edid:
>     - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#7828]) +4 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-17/igt@kms_chamelium_audio@hdmi-audio-edid.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-mtlp:         NOTRUN -> [SKIP][167] ([fdo#111827])
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-2/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-rkl:          NOTRUN -> [SKIP][168] ([fdo#111827]) +1 other test skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-5/igt@kms_chamelium_color@ctm-red-to-blue.html
>     - shard-dg1:          NOTRUN -> [SKIP][169] ([fdo#111827])
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-18/igt@kms_chamelium_color@ctm-red-to-blue.html
>     - shard-tglu:         NOTRUN -> [SKIP][170] ([fdo#111827]) +1 other test skip
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-8/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2:          NOTRUN -> [SKIP][171] ([fdo#111827]) +1 other test skip
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-7/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#7828]) +6 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-3/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_frames@dp-crc-multiple:
>     - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#7828]) +5 other tests skip
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-7/igt@kms_chamelium_frames@dp-crc-multiple.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-single:
>     - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#7828]) +2 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-3/igt@kms_chamelium_frames@hdmi-crc-single.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#7828]) +6 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-5/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#6944] / [i915#9424])
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-3/igt@kms_content_protection@content-type-change.html
>     - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#6944] / [i915#9424])
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-5/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#3359])
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-64x21:
>     - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#8814])
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-64x21.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x32:
>     - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#3555]) +7 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-16/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#3359]) +2 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#3359]) +1 other test skip
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-13/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-max-size:
>     - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#3555] / [i915#8814])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-7/igt@kms_cursor_crc@cursor-random-max-size.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-tglu:         NOTRUN -> [SKIP][184] ([fdo#109274])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][185] ([fdo#111825]) +9 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>     - shard-snb:          [PASS][186] -> [SKIP][187] ([fdo#109271]) +7 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-snb7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-snb1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#4103])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#4103] / [i915#4213]) +1 other test skip
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>     - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#4103] / [i915#4213])
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][191] ([fdo#109274] / [i915#5354]) +2 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#9809])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-glk:          NOTRUN -> [FAIL][193] ([i915#2346])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#9723])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#9723])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-15/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#3555]) +7 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-1/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#8588])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-4/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#3804])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#3555] / [i915#3840] / [i915#9159])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-5/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp:
>     - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#3840] / [i915#9688])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-10/igt@kms_dsc@dsc-fractional-bpp.html
>     - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#3840])
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-5/igt@kms_dsc@dsc-fractional-bpp.html
>     - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#3840])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-14/igt@kms_dsc@dsc-fractional-bpp.html
> 
>   * igt@kms_dsc@dsc-with-bpc:
>     - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#3555] / [i915#3840])
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-5/igt@kms_dsc@dsc-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#3555] / [i915#3840]) +1 other test skip
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-7/igt@kms_dsc@dsc-with-output-formats.html
>     - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#3555] / [i915#3840])
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-5/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#3469])
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-10/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#3469])
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-4/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#9337])
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-5/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#658])
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-3/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_fence_pin_leak:
>     - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#4881])
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-6/igt@kms_fence_pin_leak.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race:
>     - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#3637]) +5 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-3/igt@kms_flip@2x-dpms-vs-vblank-race.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-tglu:         NOTRUN -> [SKIP][212] ([fdo#109274] / [fdo#111767] / [i915#3637])
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-dg2:          NOTRUN -> [SKIP][213] ([fdo#109274]) +2 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-7/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@2x-nonexisting-fb-interruptible:
>     - shard-tglu:         NOTRUN -> [SKIP][214] ([fdo#109274] / [i915#3637]) +3 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-5/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> 
>   * igt@kms_flip@flip-vs-fences:
>     - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#8381])
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-6/igt@kms_flip@flip-vs-fences.html
>     - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#8381])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-19/igt@kms_flip@flip-vs-fences.html
> 
>   * igt@kms_flip@flip-vs-fences-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#8381])
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-1/igt@kms_flip@flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#2672]) +4 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#2672]) +2 other tests skip
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#2672]) +1 other test skip
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#2587] / [i915#2672]) +2 other tests skip
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#8810])
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#2587] / [i915#2672]) +2 other tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-glk:          NOTRUN -> [SKIP][224] ([fdo#109271]) +162 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-glk1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#5274])
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-1/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#8708]) +8 other tests skip
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-rkl:          NOTRUN -> [SKIP][227] ([fdo#111825] / [i915#1825]) +29 other tests skip
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
>     - shard-tglu:         NOTRUN -> [SKIP][228] ([fdo#109280]) +22 other tests skip
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#8708]) +7 other tests skip
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
>     - shard-dg1:          NOTRUN -> [SKIP][230] ([fdo#111825]) +24 other tests skip
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#5439])
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
>     - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#5439])
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#10055])
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
>     - shard-tglu:         NOTRUN -> [SKIP][234] ([fdo#110189]) +10 other tests skip
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
>     - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#3458]) +16 other tests skip
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
>     - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#1825]) +16 other tests skip
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#8708]) +13 other tests skip
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
>     - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#3023]) +22 other tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#3458]) +12 other tests skip
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#3555] / [i915#8228])
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-5/igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#3555] / [i915#8228]) +1 other test skip
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-6/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#3555] / [i915#8228]) +1 other test skip
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-3/igt@kms_hdr@static-toggle-suspend.html
>     - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#3555] / [i915#8228]) +2 other tests skip
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-12/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#9457]) +3 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-1/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#1839])
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:
>     - shard-snb:          NOTRUN -> [SKIP][246] ([fdo#109271])
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-snb7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [FAIL][247] ([i915#10053])
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2.html
> 
>   * igt@kms_plane_lowres@tiling-4:
>     - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#3555]) +3 other tests skip
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-6/igt@kms_plane_lowres@tiling-4.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#3555]) +5 other tests skip
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#6953] / [i915#9423])
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-6/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [FAIL][251] ([i915#8292])
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [FAIL][252] ([i915#8292])
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-16/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#9423]) +9 other tests skip
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#9423]) +3 other tests skip
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-12/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#5176] / [i915#9423]) +1 other test skip
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#5235] / [i915#9423]) +7 other tests skip
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#5235]) +7 other tests skip
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#5235]) +7 other tests skip
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-16/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#5235]) +2 other tests skip
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#3555] / [i915#5235])
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#9812]) +1 other test skip
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-2/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#10139])
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-1/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#9685])
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-1/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#3361])
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-1/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_lpsp@screens-disabled:
>     - shard-tglu:         NOTRUN -> [SKIP][265] ([i915#8430])
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-6/igt@kms_pm_lpsp@screens-disabled.html
>     - shard-mtlp:         NOTRUN -> [SKIP][266] ([i915#8430])
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-4/igt@kms_pm_lpsp@screens-disabled.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#9519]) +1 other test skip
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-rkl:          [PASS][268] -> [SKIP][269] ([i915#9519]) +2 other tests skip
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#9519]) +1 other test skip
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp-stress.html
>     - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#9519]) +1 other test skip
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_prime@basic-modeset-hybrid:
>     - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#6524])
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-4/igt@kms_prime@basic-modeset-hybrid.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#6524]) +1 other test skip
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-7/igt@kms_prime@d3hot.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>     - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#9683])
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
>     - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#9683])
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-7/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@cursor-plane-update-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#9683]) +1 other test skip
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-7/igt@kms_psr2_sf@cursor-plane-update-sf.html
>     - shard-rkl:          NOTRUN -> [SKIP][277] ([fdo#111068] / [i915#9683]) +1 other test skip
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-3/igt@kms_psr2_sf@cursor-plane-update-sf.html
>     - shard-dg1:          NOTRUN -> [SKIP][278] ([fdo#111068] / [i915#9683]) +1 other test skip
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-18/igt@kms_psr2_sf@cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#4348])
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-2/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#9685])
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@exhaust-fences:
>     - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#4235])
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-5/igt@kms_rotation_crc@exhaust-fences.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>     - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#5289])
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-14/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#5289]) +1 other test skip
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_clip_offset:
>     - shard-snb:          [PASS][284] -> [DMESG-WARN][285] ([i915#10143]) +1 other test dmesg-warn
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-snb6/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_clip_offset.html
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-snb4/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_clip_offset.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_abgr8888:
>     - shard-rkl:          [PASS][286] -> [DMESG-WARN][287] ([i915#10143])
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-rkl-5/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_abgr8888.html
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-3/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_abgr8888.html
>     - shard-tglu:         [PASS][288] -> [DMESG-WARN][289] ([i915#10143])
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-tglu-7/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_abgr8888.html
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-3/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_abgr8888.html
>     - shard-glk:          [PASS][290] -> [DMESG-WARN][291] ([i915#10143])
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-glk9/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_abgr8888.html
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-glk9/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_abgr8888.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_xbgr8888:
>     - shard-dg2:          [PASS][292] -> [DMESG-WARN][293] ([i915#10143])
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg2-10/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_xbgr8888.html
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-7/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_xbgr8888.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-dg2:          NOTRUN -> [FAIL][294] ([IGT#2])
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-7/igt@kms_sysfs_edid_timing.html
>     - shard-dg1:          NOTRUN -> [FAIL][295] ([IGT#2] / [i915#6493])
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-19/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#8623])
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern.html
>     - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#8623])
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-10/igt@kms_tiled_display@basic-test-pattern.html
>     - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#8623])
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-mtlp:         NOTRUN -> [SKIP][299] ([fdo#109309])
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-3/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
>     - shard-tglu:         [PASS][300] -> [FAIL][301] ([i915#9196]) +1 other test fail
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-tglu-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4:
>     - shard-dg1:          [PASS][302] -> [FAIL][303] ([i915#9196])
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg1-18/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4.html
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-18/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#2437])
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-7/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#2437] / [i915#9412])
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#2437])
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-1/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@perf@gen8-unprivileged-single-ctx-counters:
>     - shard-mtlp:         NOTRUN -> [SKIP][307] ([fdo#109289]) +3 other tests skip
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-2/igt@perf@gen8-unprivileged-single-ctx-counters.html
> 
>   * igt@perf@global-sseu-config:
>     - shard-dg2:          NOTRUN -> [SKIP][308] ([i915#7387])
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-3/igt@perf@global-sseu-config.html
> 
>   * igt@perf@unprivileged-single-ctx-counters:
>     - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#2433])
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-4/igt@perf@unprivileged-single-ctx-counters.html
>     - shard-dg1:          NOTRUN -> [SKIP][310] ([fdo#109289] / [i915#2433])
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-17/igt@perf@unprivileged-single-ctx-counters.html
>     - shard-tglu:         NOTRUN -> [SKIP][311] ([fdo#109289]) +3 other tests skip
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-9/igt@perf@unprivileged-single-ctx-counters.html
> 
>   * igt@perf_pmu@busy-double-start@vecs1:
>     - shard-dg2:          [PASS][312] -> [FAIL][313] ([i915#4349]) +3 other tests fail
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-7/igt@perf_pmu@busy-double-start@vecs1.html
> 
>   * igt@perf_pmu@busy-idle-check-all@vcs0:
>     - shard-dg1:          [PASS][314] -> [FAIL][315] ([i915#4349]) +1 other test fail
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg1-18/igt@perf_pmu@busy-idle-check-all@vcs0.html
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-14/igt@perf_pmu@busy-idle-check-all@vcs0.html
> 
>   * igt@prime_vgem@basic-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#3708] / [i915#4077]) +1 other test skip
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-2/igt@prime_vgem@basic-gtt.html
>     - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#3708] / [i915#4077])
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-15/igt@prime_vgem@basic-gtt.html
> 
>   * igt@prime_vgem@basic-write:
>     - shard-mtlp:         NOTRUN -> [SKIP][318] ([i915#3708])
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-4/igt@prime_vgem@basic-write.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#9917])
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-1/igt@sriov_basic@bind-unbind-vf.html
>     - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#9917]) +1 other test skip
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-7/igt@sriov_basic@bind-unbind-vf.html
>     - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#9917])
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-15/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-tglu:         NOTRUN -> [SKIP][322] ([i915#9917])
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe-off.html
>     - shard-mtlp:         NOTRUN -> [SKIP][323] ([i915#9917])
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-4/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@syncobj_timeline@invalid-wait-zero-handles:
>     - shard-rkl:          NOTRUN -> [FAIL][324] ([i915#9781])
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-5/igt@syncobj_timeline@invalid-wait-zero-handles.html
> 
>   * igt@syncobj_wait@invalid-wait-zero-handles:
>     - shard-dg2:          NOTRUN -> [FAIL][325] ([i915#9779])
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-5/igt@syncobj_wait@invalid-wait-zero-handles.html
> 
>   * igt@v3d/v3d_perfmon@destroy-invalid-perfmon:
>     - shard-mtlp:         NOTRUN -> [SKIP][326] ([i915#2575]) +8 other tests skip
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-1/igt@v3d/v3d_perfmon@destroy-invalid-perfmon.html
> 
>   * igt@v3d/v3d_submit_cl@bad-multisync-pad:
>     - shard-tglu:         NOTRUN -> [SKIP][327] ([fdo#109315] / [i915#2575]) +7 other tests skip
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-6/igt@v3d/v3d_submit_cl@bad-multisync-pad.html
> 
>   * igt@v3d/v3d_submit_cl@job-perfmon:
>     - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#2575]) +8 other tests skip
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-18/igt@v3d/v3d_submit_cl@job-perfmon.html
> 
>   * igt@v3d/v3d_submit_cl@multisync-out-syncs:
>     - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#2575]) +11 other tests skip
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-10/igt@v3d/v3d_submit_cl@multisync-out-syncs.html
> 
>   * igt@v3d/v3d_submit_csd@bad-multisync-pad:
>     - shard-rkl:          NOTRUN -> [SKIP][330] ([fdo#109315]) +10 other tests skip
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-7/igt@v3d/v3d_submit_csd@bad-multisync-pad.html
> 
>   * igt@vc4/vc4_purgeable_bo@free-purged-bo:
>     - shard-mtlp:         NOTRUN -> [SKIP][331] ([i915#7711]) +4 other tests skip
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-8/igt@vc4/vc4_purgeable_bo@free-purged-bo.html
> 
>   * igt@vc4/vc4_purgeable_bo@mark-purgeable:
>     - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#7711]) +7 other tests skip
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-6/igt@vc4/vc4_purgeable_bo@mark-purgeable.html
> 
>   * igt@vc4/vc4_tiling@set-get:
>     - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#7711]) +3 other tests skip
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-10/igt@vc4/vc4_tiling@set-get.html
> 
>   * igt@vc4/vc4_wait_bo@used-bo-0ns:
>     - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#7711]) +4 other tests skip
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-12/igt@vc4/vc4_wait_bo@used-bo-0ns.html
> 
>   * igt@vc4/vc4_wait_seqno@bad-seqno-0ns:
>     - shard-tglu:         NOTRUN -> [SKIP][335] ([i915#2575]) +4 other tests skip
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-2/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
>     - shard-dg2:          [INCOMPLETE][336] ([i915#7297]) -> [PASS][337]
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
> 
>   * igt@gem_eio@reset-stress:
>     - shard-dg1:          [FAIL][338] ([i915#5784]) -> [PASS][339] +1 other test pass
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg1-13/igt@gem_eio@reset-stress.html
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-17/igt@gem_eio@reset-stress.html
> 
>   * igt@gem_exec_fair@basic-none@vcs0:
>     - shard-glk:          [FAIL][340] ([i915#2842]) -> [PASS][341]
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-glk4/igt@gem_exec_fair@basic-none@vcs0.html
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-glk7/igt@gem_exec_fair@basic-none@vcs0.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg1:          [TIMEOUT][342] ([i915#5493]) -> [PASS][343]
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_mmap_offset@clear@smem0:
>     - shard-mtlp:         [ABORT][344] ([i915#10029]) -> [PASS][345]
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-mtlp-7/igt@gem_mmap_offset@clear@smem0.html
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-5/igt@gem_mmap_offset@clear@smem0.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-glk:          [INCOMPLETE][346] ([i915#10137] / [i915#5566]) -> [PASS][347]
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-glk4/igt@gen9_exec_parse@allowed-all.html
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-glk9/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg1:          [INCOMPLETE][348] ([i915#10137] / [i915#9820] / [i915#9849]) -> [PASS][349]
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg1-16/igt@i915_module_load@reload-with-fault-injection.html
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-tglu:         [INCOMPLETE][350] ([i915#10137] / [i915#9200]) -> [PASS][351]
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-mtlp:         [FAIL][352] ([i915#5138]) -> [PASS][353]
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-tglu:         [FAIL][354] ([i915#3743]) -> [PASS][355]
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-tglu-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-snb:          [SKIP][356] ([fdo#109271] / [fdo#111767]) -> [PASS][357]
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-snb5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-snb7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-glk:          [FAIL][358] ([i915#2346]) -> [PASS][359]
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-snb:          [SKIP][360] ([fdo#109271]) -> [PASS][361] +21 other tests pass
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-rkl:          [SKIP][362] ([i915#9519]) -> [PASS][363] +1 other test pass
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_swab:
>     - shard-dg1:          [DMESG-WARN][364] ([i915#10143]) -> [PASS][365]
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg1-13/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_swab.html
>    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-18/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_swab.html
>     - shard-snb:          [DMESG-WARN][366] ([i915#10143]) -> [PASS][367] +1 other test pass
>    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-snb6/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_swab.html
>    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-snb4/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_swab.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_mono:
>     - shard-dg2:          [DMESG-WARN][368] ([i915#10143]) -> [PASS][369]
>    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg2-10/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_mono.html
>    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-7/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_mono.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-3:
>     - shard-dg2:          [FAIL][370] ([i915#9196]) -> [PASS][371]
>    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg2-7/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-3.html
>    [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-3.html
> 
>   * igt@perf@non-zero-reason@0-rcs0:
>     - shard-dg2:          [FAIL][372] ([i915#7484]) -> [PASS][373]
>    [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg2-2/igt@perf@non-zero-reason@0-rcs0.html
>    [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-5/igt@perf@non-zero-reason@0-rcs0.html
> 
>   * igt@perf_pmu@busy-double-start@bcs0:
>     - shard-mtlp:         [FAIL][374] ([i915#4349]) -> [PASS][375]
>    [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-mtlp-7/igt@perf_pmu@busy-double-start@bcs0.html
>    [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-mtlp-2/igt@perf_pmu@busy-double-start@bcs0.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-dg2:          [FAIL][376] ([i915#5793]) -> [PASS][377]
>    [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg2-7/igt@perf_pmu@module-unload.html
>    [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg2-6/igt@perf_pmu@module-unload.html
> 
>   
> #### Warnings ####
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - shard-dg1:          [INCOMPLETE][378] ([i915#10137] / [i915#9408] / [i915#9618]) -> [ABORT][379] ([i915#9618])
>    [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg1-19/igt@device_reset@unbind-reset-rebind.html
>    [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-13/igt@device_reset@unbind-reset-rebind.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-tglu:         [FAIL][380] ([i915#2842]) -> [FAIL][381] ([i915#2876])
>    [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-tglu-4/igt@gem_exec_fair@basic-pace@rcs0.html
>    [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-tglu-6/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-glk:          [INCOMPLETE][382] ([i915#10042] / [i915#10137]) -> [WARN][383] ([i915#2658])
>    [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-glk3/igt@gem_pwrite@basic-exhaustion.html
>    [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-glk7/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-dg1:          [SKIP][384] ([i915#3638]) -> [SKIP][385] ([i915#3638] / [i915#4423])
>    [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg1-13/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
>    [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-17/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
>     - shard-dg1:          [SKIP][386] ([i915#5354] / [i915#6095]) -> [SKIP][387] ([i915#4423] / [i915#5354] / [i915#6095]) +2 other tests skip
>    [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg1-16/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html
>    [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-17/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-snb:          [SKIP][388] ([fdo#109271]) -> [INCOMPLETE][389] ([i915#8816]) +1 other test incomplete
>    [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-snb5/igt@kms_content_protection@atomic-dpms.html
>    [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-snb7/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-dg1:          [SKIP][390] ([i915#9424]) -> [SKIP][391] ([i915#9433])
>    [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-dg1-19/igt@kms_content_protection@mei-interface.html
>    [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-dg1-19/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-rkl:          [SKIP][392] ([i915#4816]) -> [SKIP][393] ([i915#4070] / [i915#4816])
>    [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14186/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
>   [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
>   [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#10029]: https://gitlab.freedesktop.org/drm/intel/issues/10029
>   [i915#10030]: https://gitlab.freedesktop.org/drm/intel/issues/10030
>   [i915#10042]: https://gitlab.freedesktop.org/drm/intel/issues/10042
>   [i915#10053]: https://gitlab.freedesktop.org/drm/intel/issues/10053
>   [i915#10055]: https://gitlab.freedesktop.org/drm/intel/issues/10055
>   [i915#10131]: https://gitlab.freedesktop.org/drm/intel/issues/10131
>   [i915#10137]: https://gitlab.freedesktop.org/drm/intel/issues/10137
>   [i915#10139]: https://gitlab.freedesktop.org/drm/intel/issues/10139
>   [i915#10140]: https://gitlab.freedesktop.org/drm/intel/issues/10140
>   [i915#10143]: https://gitlab.freedesktop.org/drm/intel/issues/10143
>   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
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
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
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
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
>   [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4348]: https://gitlab.freedesktop.org/drm/intel/issues/4348
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
>   [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
>   [i915#5107]: https://gitlab.freedesktop.org/drm/intel/issues/5107
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
>   [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#5793]: https://gitlab.freedesktop.org/drm/intel/issues/5793
>   [i915#5889]: https://gitlab.freedesktop.org/drm/intel/issues/5889
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
>   [i915#6228]: https://gitlab.freedesktop.org/drm/intel/issues/6228
>   [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
>   [i915#6493]: https://gitlab.freedesktop.org/drm/intel/issues/6493
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
>   [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
>   [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
>   [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
>   [i915#7297]: https://gitlab.freedesktop.org/drm/intel/issues/7297
>   [i915#7387]: https://gitlab.freedesktop.org/drm/intel/issues/7387
>   [i915#7484]: https://gitlab.freedesktop.org/drm/intel/issues/7484
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
>   [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8289]: https://gitlab.freedesktop.org/drm/intel/issues/8289
>   [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
>   [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
>   [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
>   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
>   [i915#8430]: https://gitlab.freedesktop.org/drm/intel/issues/8430
>   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
>   [i915#8588]: https://gitlab.freedesktop.org/drm/intel/issues/8588
>   [i915#8623]: https://gitlab.freedesktop.or
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10594/index.html
