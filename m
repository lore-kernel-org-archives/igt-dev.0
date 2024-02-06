Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87CFC4828D
	for <igt-dev@archiver.kernel.org>; Tue,  6 Feb 2024 16:46:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD9F112CDA;
	Tue,  6 Feb 2024 16:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q9o7vtmb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA580112CDA
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Feb 2024 16:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707237989; x=1738773989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZNxnOwQpYmAewEquIw4rJxsQfOBxK+Jv854mc12o8uA=;
 b=Q9o7vtmbkapPCIwxBcAZZltzZ+rxalw4K9XzL7AtdMild7ekDHVYImtD
 LYL1o6tmDq881wSvfGNAnDrPwrvib6d/lDmyAvVAJGsdV67oWxj385/hg
 X8M8y1qTj/iXmtDOqyzncCVo+v9yYcho21EwHBZKoVdHFIbKHfPE1h2SQ
 na3b8H1UdgtEqaUAaCUcJuJhY623cp0GMAqA4GhBugBHyzjAV4MLnf1qL
 5f9DF6b6LSOezaHUChXZpSRJ4sQwQKHxCUeNuBqs0vX22fyTk4hfJyULr
 bfLkhNaO3xyWxVkMLJ9mQkCKjIWvdkwIBIZz8WngKhCMkFoPyZnegh8pz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="676101"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="676101"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 08:46:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; d="scan'208";a="31886294"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.2.162])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 08:46:16 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lgci.bug.filing@intel.com,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: =?UTF-8?B?4pyX?= Fi.CI.IGT: failure for lib/kunit: Support
 writable filter* parameters of kunit module (rev4)
Date: Tue, 06 Feb 2024 17:46:10 +0100
Message-ID: <1801641.TLkxdtWsSY@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <170722347334.1055668.6427182785863118663@5338d5abeb45>
References: <20240206101514.6897-10-janusz.krzysztofik@linux.intel.com>
 <170722347334.1055668.6427182785863118663@5338d5abeb45>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Tuesday, 6 February 2024 13:44:33 CET Patchwork wrote:
> == Series Details ==
> 
> Series: lib/kunit: Support writable filter* parameters of kunit module (rev4)
> URL   : https://patchwork.freedesktop.org/series/129174/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14230_full -> IGTPW_10636_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10636_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10636_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10636_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@runner@aborted:
>     - shard-glk:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-glk1/igt@runner@aborted.html

Kernel taint on kernel warning reported while loading i915 module has nothing 
to do with changes to IGT KUnit library.  @BUG Filing, please update filters 
and re-report.

Thanks,
Janusz

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10636_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@drm_fdinfo@most-busy-check-all@bcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][2] ([i915#8414]) +19 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-5/igt@drm_fdinfo@most-busy-check-all@bcs0.html
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
>     - shard-rkl:          [PASS][3] -> [FAIL][4] ([i915#7742])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
> 
>   * igt@drm_fdinfo@virtual-busy-hang:
>     - shard-dg1:          NOTRUN -> [SKIP][5] ([i915#8414])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-12/igt@drm_fdinfo@virtual-busy-hang.html
> 
>   * igt@gem_busy@semaphore:
>     - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#3936])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-19/igt@gem_busy@semaphore.html
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#9323])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-2/igt@gem_ccs@suspend-resume.html
>     - shard-tglu:         NOTRUN -> [SKIP][8] ([i915#9323])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-10/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][9] ([i915#7297])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-6/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-tglu:         NOTRUN -> [SKIP][10] ([i915#7697]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-2/igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_create@create-ext-cpu-access-big:
>     - shard-dg2:          NOTRUN -> [ABORT][11] ([i915#10183])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-2/igt@gem_create@create-ext-cpu-access-big.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-rkl:          [PASS][12] -> [FAIL][13] ([i915#6268])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-rkl-7/igt@gem_ctx_exec@basic-nohangcheck.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_param@set-priority-not-supported:
>     - shard-dg1:          NOTRUN -> [SKIP][14] ([fdo#109314])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-13/igt@gem_ctx_param@set-priority-not-supported.html
> 
>   * igt@gem_ctx_persistence@hang:
>     - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#8555])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-18/igt@gem_ctx_persistence@hang.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hostile:
>     - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#8555])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-hostile.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#280])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-6/igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_exec_balancer@invalid-bonds:
>     - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#4036])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-10/igt@gem_exec_balancer@invalid-bonds.html
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-tglu:         NOTRUN -> [FAIL][19] ([i915#6117])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-10/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@gem_exec_balancer@sliced:
>     - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#4812]) +2 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-10/igt@gem_exec_balancer@sliced.html
> 
>   * igt@gem_exec_capture@many-4k-incremental:
>     - shard-glk:          NOTRUN -> [FAIL][21] ([i915#9606])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-glk4/igt@gem_exec_capture@many-4k-incremental.html
>     - shard-dg2:          NOTRUN -> [FAIL][22] ([i915#9606])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-5/igt@gem_exec_capture@many-4k-incremental.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-rkl:          [PASS][23] -> [FAIL][24] ([i915#2846])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html
>     - shard-glk:          NOTRUN -> [FAIL][25] ([i915#2846])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-glk3/igt@gem_exec_fair@basic-deadline.html
>     - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#4473] / [i915#4771])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-7/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-none-rrul@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][27] ([i915#2842])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-glk6/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-solo:
>     - shard-mtlp:         NOTRUN -> [SKIP][28] ([i915#4473])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-3/igt@gem_exec_fair@basic-none-solo.html
> 
>   * igt@gem_exec_fair@basic-pace@vecs0:
>     - shard-rkl:          [PASS][29] -> [FAIL][30] ([i915#2842]) +1 other test fail
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-rkl-3/igt@gem_exec_fair@basic-pace@vecs0.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-1/igt@gem_exec_fair@basic-pace@vecs0.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-uc:
>     - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#3539] / [i915#4852]) +3 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-2/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
> 
>   * igt@gem_exec_gttfill@multigpu-basic:
>     - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#7697]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-5/igt@gem_exec_gttfill@multigpu-basic.html
>     - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#7697]) +2 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-2/igt@gem_exec_gttfill@multigpu-basic.html
>     - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#7697]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-5/igt@gem_exec_gttfill@multigpu-basic.html
>     - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#7697]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-17/igt@gem_exec_gttfill@multigpu-basic.html
> 
>   * igt@gem_exec_params@rsvd2-dirt:
>     - shard-dg2:          NOTRUN -> [SKIP][36] ([fdo#109283] / [i915#5107])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-2/igt@gem_exec_params@rsvd2-dirt.html
> 
>   * igt@gem_exec_params@secure-non-master:
>     - shard-mtlp:         NOTRUN -> [SKIP][37] ([fdo#112283])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-1/igt@gem_exec_params@secure-non-master.html
> 
>   * igt@gem_exec_reloc@basic-cpu-noreloc:
>     - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#3281]) +6 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-7/igt@gem_exec_reloc@basic-cpu-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-wc-read-active:
>     - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#3281]) +3 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-18/igt@gem_exec_reloc@basic-wc-read-active.html
> 
>   * igt@gem_exec_reloc@basic-write-wc:
>     - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#3281]) +2 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-4/igt@gem_exec_reloc@basic-write-wc.html
>     - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#3281]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-4/igt@gem_exec_reloc@basic-write-wc.html
> 
>   * igt@gem_exec_suspend@basic-s0@lmem0:
>     - shard-dg2:          [PASS][42] -> [INCOMPLETE][43] ([i915#9275])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-dg2-1/igt@gem_exec_suspend@basic-s0@lmem0.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-1/igt@gem_exec_suspend@basic-s0@lmem0.html
> 
>   * igt@gem_fence_thrash@bo-copy:
>     - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4860]) +2 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-2/igt@gem_fence_thrash@bo-copy.html
>     - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#4860])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-13/igt@gem_fence_thrash@bo-copy.html
>     - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#4860])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-4/igt@gem_fence_thrash@bo-copy.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#4613])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#4613]) +2 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-glk6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg2:          NOTRUN -> [TIMEOUT][49] ([i915#5493])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_lmem_swapping@verify:
>     - shard-tglu:         NOTRUN -> [SKIP][50] ([i915#4613])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-9/igt@gem_lmem_swapping@verify.html
> 
>   * igt@gem_lmem_swapping@verify-random-ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#4613])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-7/igt@gem_lmem_swapping@verify-random-ccs.html
> 
>   * igt@gem_mmap@bad-object:
>     - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4083]) +2 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-16/igt@gem_mmap@bad-object.html
> 
>   * igt@gem_mmap_gtt@basic-read:
>     - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4077]) +11 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-10/igt@gem_mmap_gtt@basic-read.html
> 
>   * igt@gem_mmap_gtt@big-copy-xy:
>     - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#4077]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-13/igt@gem_mmap_gtt@big-copy-xy.html
> 
>   * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
>     - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4077]) +2 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-7/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html
> 
>   * igt@gem_mmap_wc@pf-nonblock:
>     - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4083]) +4 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-10/igt@gem_mmap_wc@pf-nonblock.html
> 
>   * igt@gem_mmap_wc@read-write:
>     - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4083]) +1 other test skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-5/igt@gem_mmap_wc@read-write.html
> 
>   * igt@gem_partial_pwrite_pread@reads:
>     - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#3282]) +3 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-5/igt@gem_partial_pwrite_pread@reads.html
> 
>   * igt@gem_partial_pwrite_pread@reads-display:
>     - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#3282])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-16/igt@gem_partial_pwrite_pread@reads-display.html
> 
>   * igt@gem_pread@display:
>     - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#3282])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-5/igt@gem_pread@display.html
> 
>   * igt@gem_pxp@create-regular-context-2:
>     - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4270])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-18/igt@gem_pxp@create-regular-context-2.html
> 
>   * igt@gem_pxp@display-protected-crc:
>     - shard-tglu:         NOTRUN -> [SKIP][62] ([i915#4270]) +2 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-7/igt@gem_pxp@display-protected-crc.html
> 
>   * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
>     - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4270]) +2 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
> 
>   * igt@gem_readwrite@read-write:
>     - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#3282]) +3 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-8/igt@gem_readwrite@read-write.html
> 
>   * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#8428])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-1/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
> 
>   * igt@gem_softpin@evict-snoop:
>     - shard-tglu:         NOTRUN -> [SKIP][66] ([fdo#109312])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-3/igt@gem_softpin@evict-snoop.html
> 
>   * igt@gem_tiled_pread_basic:
>     - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4079])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-16/igt@gem_tiled_pread_basic.html
> 
>   * igt@gem_unfence_active_buffers:
>     - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4879])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-17/igt@gem_unfence_active_buffers.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-glk:          NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#3323])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-glk8/igt@gem_userptr_blits@dmabuf-sync.html
>     - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3297])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-2/igt@gem_userptr_blits@dmabuf-sync.html
>     - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#3323])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-4/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@sd-probe:
>     - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#3297] / [i915#4958])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-2/igt@gem_userptr_blits@sd-probe.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-cycles:
>     - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#3297]) +1 other test skip
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-cycles.html
> 
>   * igt@gen3_render_linear_blits:
>     - shard-dg1:          NOTRUN -> [SKIP][74] ([fdo#109289])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-13/igt@gen3_render_linear_blits.html
> 
>   * igt@gen7_exec_parse@chained-batch:
>     - shard-rkl:          NOTRUN -> [SKIP][75] ([fdo#109289]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-5/igt@gen7_exec_parse@chained-batch.html
> 
>   * igt@gen7_exec_parse@oacontrol-tracking:
>     - shard-tglu:         NOTRUN -> [SKIP][76] ([fdo#109289])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-8/igt@gen7_exec_parse@oacontrol-tracking.html
>     - shard-dg2:          NOTRUN -> [SKIP][77] ([fdo#109289]) +2 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-5/igt@gen7_exec_parse@oacontrol-tracking.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-glk:          [PASS][78] -> [INCOMPLETE][79] ([i915#10137] / [i915#5566])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-glk3/igt@gen9_exec_parse@allowed-all.html
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-glk3/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@gen9_exec_parse@basic-rejected-ctx-param:
>     - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#2527] / [i915#2856])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-7/igt@gen9_exec_parse@basic-rejected-ctx-param.html
> 
>   * igt@gen9_exec_parse@bb-large:
>     - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#2856])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-7/igt@gen9_exec_parse@bb-large.html
> 
>   * igt@gen9_exec_parse@cmd-crossing-page:
>     - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#2527])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-13/igt@gen9_exec_parse@cmd-crossing-page.html
> 
>   * igt@gen9_exec_parse@valid-registers:
>     - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#2856]) +2 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-10/igt@gen9_exec_parse@valid-registers.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
>     - shard-dg1:          [PASS][84] -> [FAIL][85] ([i915#3591])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>     - shard-tglu:         NOTRUN -> [SKIP][86] ([fdo#109293] / [fdo#109506])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
> 
>   * igt@i915_pm_rpm@system-suspend:
>     - shard-tglu:         [PASS][87] -> [ABORT][88] ([i915#8213])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-tglu-7/igt@i915_pm_rpm@system-suspend.html
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-9/igt@i915_pm_rpm@system-suspend.html
> 
>   * igt@i915_pm_rpm@system-suspend-devices:
>     - shard-snb:          NOTRUN -> [SKIP][89] ([fdo#109271]) +48 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-snb1/igt@i915_pm_rpm@system-suspend-devices.html
> 
>   * igt@i915_pm_rps@thresholds-idle@gt0:
>     - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#8925])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-2/igt@i915_pm_rps@thresholds-idle@gt0.html
> 
>   * igt@i915_pm_rps@thresholds-idle@gt1:
>     - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#3555] / [i915#8925])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-2/igt@i915_pm_rps@thresholds-idle@gt1.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#6245])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-15/igt@i915_query@hwconfig_table.html
> 
>   * igt@i915_query@query-topology-known-pci-ids:
>     - shard-mtlp:         NOTRUN -> [SKIP][93] ([fdo#109303])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-5/igt@i915_query@query-topology-known-pci-ids.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-tglu:         NOTRUN -> [INCOMPLETE][94] ([i915#7443])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-9/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#4212]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-7/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
> 
>   * igt@kms_addfb_basic@tile-pitch-mismatch:
>     - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4212]) +1 other test skip
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-19/igt@kms_addfb_basic@tile-pitch-mismatch.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#8709]) +7 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-12/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
>     - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#8709]) +3 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#8709]) +11 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#9531])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#1769] / [i915#3555])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#1769] / [i915#3555])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][103] ([fdo#111614])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-tglu:         NOTRUN -> [SKIP][104] ([fdo#111615] / [i915#5286]) +3 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
>     - shard-dg2:          NOTRUN -> [SKIP][105] ([fdo#111614]) +2 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#4538] / [i915#5286]) +3 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-19/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#5286]) +3 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-tglu:         NOTRUN -> [SKIP][108] ([fdo#111614])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-8/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-tglu:         NOTRUN -> [FAIL][109] ([i915#3743])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#6187])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-4/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#5190]) +8 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-tglu:         [PASS][112] -> [FAIL][113] ([i915#3743])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-tglu-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>     - shard-rkl:          NOTRUN -> [SKIP][114] ([fdo#110723])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
>     - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#4538])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-15/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
>     - shard-mtlp:         NOTRUN -> [SKIP][116] ([fdo#111615]) +1 other test skip
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>     - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#4538] / [i915#5190]) +7 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>     - shard-tglu:         NOTRUN -> [SKIP][118] ([fdo#111615])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_joiner@2x-modeset:
>     - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#2705])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-6/igt@kms_big_joiner@2x-modeset.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#2705]) +1 other test skip
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-3/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y-tiled-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#5354] / [i915#6095]) +18 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-18/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y-tiled-ccs.html
> 
>   * igt@kms_ccs@pipe-a-random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#5354] / [i915#6095]) +6 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-4/igt@kms_ccs@pipe-a-random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@pipe-a-random-ccs-data-y-tiled-gen12-mc-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#5354] / [i915#6095]) +16 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-7/igt@kms_ccs@pipe-a-random-ccs-data-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@pipe-b-bad-rotation-90-yf-tiled-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#5354]) +60 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-6/igt@kms_ccs@pipe-b-bad-rotation-90-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@pipe-c-bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>     - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#5354]) +7 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-5/igt@kms_ccs@pipe-c-bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][126] ([fdo#109271]) +126 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-glk2/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#5354] / [i915#6095]) +7 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-1/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#3742])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-12/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#7213]) +3 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#4087]) +3 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-5/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-dg2:          NOTRUN -> [SKIP][131] ([fdo#111827]) +1 other test skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-10/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>     - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#7828]) +4 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_frames@dp-crc-single:
>     - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#7828]) +4 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-17/igt@kms_chamelium_frames@dp-crc-single.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-fast:
>     - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#7828]) +3 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-7/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>     - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#7828]) +3 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#7828]) +9 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-7/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#3299])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-12/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#3116])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-4/igt@kms_content_protection@dp-mst-type-1.html
>     - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#3116] / [i915#3299])
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-9/igt@kms_content_protection@dp-mst-type-1.html
>     - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#3299])
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-1/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#7118]) +1 other test skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-6/igt@kms_content_protection@type1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x85:
>     - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#8814])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#3359]) +1 other test skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#3359])
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-10/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>     - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#3555]) +1 other test skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-12/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#3359])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-snb:          [PASS][147] -> [SKIP][148] ([fdo#109271] / [fdo#111767])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-snb7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-snb5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>     - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#9809]) +3 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#4103] / [i915#4213])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#4213])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
>     - shard-dg2:          NOTRUN -> [SKIP][152] ([fdo#109274] / [i915#5354]) +7 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
>     - shard-rkl:          NOTRUN -> [SKIP][153] ([fdo#111825]) +6 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-tglu:         NOTRUN -> [SKIP][154] ([fdo#109274]) +2 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-snb:          [PASS][155] -> [SKIP][156] ([fdo#109271]) +5 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-snb4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#4103])
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#9833])
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][159] ([fdo#110189] / [i915#9723])
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][160] ([fdo#110189] / [i915#9227])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#3555]) +3 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-10/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#8588])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-7/igt@kms_display_modes@mst-extended-mode-negative.html
>     - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#8588])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-4/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#3804])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp:
>     - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#3840])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp.html
>     - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#3840])
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-15/igt@kms_dsc@dsc-fractional-bpp.html
>     - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#3840]) +1 other test skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-2/igt@kms_dsc@dsc-fractional-bpp.html
>     - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#3840] / [i915#9688])
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-8/igt@kms_dsc@dsc-fractional-bpp.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#3555] / [i915#3840])
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-5/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#3840] / [i915#9053])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>     - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#3840] / [i915#9053])
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#1839])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-1/igt@kms_feature_discovery@display-4x.html
>     - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#1839])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-3/igt@kms_feature_discovery@display-4x.html
>     - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#1839])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-10/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][175] ([fdo#109274]) +7 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-dg1:          NOTRUN -> [SKIP][176] ([fdo#111767] / [fdo#111825])
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-19/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#3637])
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-7/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][178] ([fdo#111767] / [i915#3637])
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][179] ([fdo#111825] / [i915#9934]) +1 other test skip
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-18/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@flip-vs-fences-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#8381]) +1 other test skip
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-10/igt@kms_flip@flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#2672]) +2 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#2587] / [i915#2672])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#2587] / [i915#2672])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#2672] / [i915#3555])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#2672]) +4 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#8708]) +3 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#8708]) +11 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
>     - shard-rkl:          NOTRUN -> [SKIP][188] ([fdo#111825] / [i915#1825]) +10 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][189] ([fdo#109280] / [fdo#111767]) +1 other test skip
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#3458]) +15 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-tglu:         NOTRUN -> [SKIP][191] ([fdo#110189]) +5 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][192] ([fdo#111825]) +13 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#3023]) +6 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html
>     - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#8708]) +3 other tests skip
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#9766])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#3458]) +4 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-mtlp:         NOTRUN -> [SKIP][197] ([fdo#111767] / [i915#1825])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][198] ([fdo#109280]) +13 other tests skip
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#1825]) +11 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
>     - shard-dg2:          NOTRUN -> [SKIP][200] ([fdo#111767] / [i915#5354]) +1 other test skip
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#3555] / [i915#8228])
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-12/igt@kms_hdr@static-swap.html
>     - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#3555] / [i915#8228])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-7/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [FAIL][203] ([i915#7862]) +1 other test fail
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-glk3/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#6953] / [i915#9423])
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-7/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#9423]) +7 other tests skip
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#9423]) +11 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-17/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#9423]) +7 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#5176] / [i915#9423]) +3 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#5235] / [i915#9423]) +3 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#5235]) +5 other tests skip
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#5235]) +2 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#5235]) +19 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#3555] / [i915#5235])
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#5235]) +3 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#9685])
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
>     - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#9685])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-dpms-negative:
>     - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#9293])
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-8/igt@kms_pm_dc@dc5-dpms-negative.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#3361])
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-17/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-dg2:          [PASS][219] -> [SKIP][220] ([i915#9519])
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
>     - shard-rkl:          [PASS][221] -> [SKIP][222] ([i915#9519])
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#9519]) +1 other test skip
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_prime@basic-modeset-hybrid:
>     - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#6524])
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-17/igt@kms_prime@basic-modeset-hybrid.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#6524] / [i915#6805])
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-10/igt@kms_prime@d3hot.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#2920])
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>     - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#9683])
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-17/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
>     - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#9683])
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>     - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#9683]) +1 other test skip
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-10/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg1:          NOTRUN -> [SKIP][230] ([fdo#111068] / [i915#9683])
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-17/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_rotation_crc@exhaust-fences:
>     - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#4235])
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-8/igt@kms_rotation_crc@exhaust-fences.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#4235]) +1 other test skip
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#8623])
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#2437])
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-5/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#2437] / [i915#9412])
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-6/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#2437])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-8/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@perf@mi-rpc:
>     - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#2434])
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-18/igt@perf@mi-rpc.html
> 
>   * igt@perf_pmu@event-wait@rcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][238] ([fdo#112283])
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-5/igt@perf_pmu@event-wait@rcs0.html
> 
>   * igt@perf_pmu@rc6-all-gts:
>     - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#8516]) +1 other test skip
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-12/igt@perf_pmu@rc6-all-gts.html
>     - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#8516])
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-6/igt@perf_pmu@rc6-all-gts.html
>     - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#8516])
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-1/igt@perf_pmu@rc6-all-gts.html
> 
>   * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][242] ([i915#5493])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-5/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
> 
>   * igt@prime_udl:
>     - shard-dg2:          NOTRUN -> [SKIP][243] ([fdo#109291])
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-5/igt@prime_udl.html
> 
>   * igt@prime_vgem@basic-fence-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#3708])
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-10/igt@prime_vgem@basic-fence-flip.html
> 
>   * igt@prime_vgem@basic-write:
>     - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#3291] / [i915#3708])
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-3/igt@prime_vgem@basic-write.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#9917])
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   * igt@syncobj_timeline@invalid-wait-zero-handles:
>     - shard-tglu:         NOTRUN -> [FAIL][247] ([i915#9781])
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-7/igt@syncobj_timeline@invalid-wait-zero-handles.html
> 
>   * igt@v3d/v3d_create_bo@create-bo-0:
>     - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#2575]) +11 other tests skip
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-10/igt@v3d/v3d_create_bo@create-bo-0.html
> 
>   * igt@v3d/v3d_perfmon@create-perfmon-exceed:
>     - shard-rkl:          NOTRUN -> [SKIP][249] ([fdo#109315]) +1 other test skip
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-5/igt@v3d/v3d_perfmon@create-perfmon-exceed.html
> 
>   * igt@v3d/v3d_submit_cl@multiple-job-submission:
>     - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#2575])
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-8/igt@v3d/v3d_submit_cl@multiple-job-submission.html
> 
>   * igt@v3d/v3d_submit_cl@simple-flush-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#2575]) +1 other test skip
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-13/igt@v3d/v3d_submit_cl@simple-flush-cache.html
> 
>   * igt@v3d/v3d_wait_bo@used-bo-0ns:
>     - shard-tglu:         NOTRUN -> [SKIP][252] ([fdo#109315] / [i915#2575]) +3 other tests skip
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-6/igt@v3d/v3d_wait_bo@used-bo-0ns.html
> 
>   * igt@vc4/vc4_label_bo@set-bad-handle:
>     - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#7711]) +1 other test skip
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-4/igt@vc4/vc4_label_bo@set-bad-handle.html
> 
>   * igt@vc4/vc4_purgeable_bo@access-purgeable-bo-mem:
>     - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#2575]) +3 other tests skip
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-4/igt@vc4/vc4_purgeable_bo@access-purgeable-bo-mem.html
> 
>   * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained:
>     - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#7711]) +7 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-1/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html
>     - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#7711]) +2 other tests skip
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-4/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html
> 
>   * igt@vc4/vc4_tiling@get-bad-flags:
>     - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#7711]) +1 other test skip
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-18/igt@vc4/vc4_tiling@get-bad-flags.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_limit:
>     - shard-tglu:         [DMESG-WARN][258] ([i915#10140]) -> [PASS][259] +1 other test pass
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-tglu-3/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_limit.html
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-8/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_limit.html
>     - shard-glk:          [DMESG-WARN][260] ([i915#10140]) -> [PASS][261] +1 other test pass
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-glk3/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_limit.html
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-glk9/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_limit.html
>     - shard-mtlp:         [DMESG-WARN][262] ([i915#10140]) -> [PASS][263] +1 other test pass
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-mtlp-5/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_limit.html
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-5/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_limit.html
>     - shard-dg2:          [DMESG-WARN][264] ([i915#10140]) -> [PASS][265]
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-dg2-7/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_limit.html
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-10/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_limit.html
> 
>   * igt@drm_mm@drm_mm@drm_test_mm_init:
>     - shard-dg1:          [DMESG-WARN][266] ([i915#10140]) -> [PASS][267] +1 other test pass
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-dg1-19/igt@drm_mm@drm_mm@drm_test_mm_init.html
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-13/igt@drm_mm@drm_mm@drm_test_mm_init.html
>     - shard-snb:          [DMESG-WARN][268] ([i915#10140]) -> [PASS][269] +1 other test pass
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-snb6/igt@drm_mm@drm_mm@drm_test_mm_init.html
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-snb2/igt@drm_mm@drm_mm@drm_test_mm_init.html
>     - shard-rkl:          [DMESG-WARN][270] ([i915#10140]) -> [PASS][271]
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-rkl-1/igt@drm_mm@drm_mm@drm_test_mm_init.html
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-7/igt@drm_mm@drm_mm@drm_test_mm_init.html
> 
>   * igt@fbdev@pan:
>     - shard-snb:          [FAIL][272] ([i915#4435]) -> [PASS][273]
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-snb7/igt@fbdev@pan.html
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-snb6/igt@fbdev@pan.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-tglu:         [FAIL][274] ([i915#6268]) -> [PASS][275]
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_eio@suspend:
>     - shard-tglu:         [ABORT][276] ([i915#10030]) -> [PASS][277]
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-tglu-9/igt@gem_eio@suspend.html
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-8/igt@gem_eio@suspend.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-dg1:          [FAIL][278] ([i915#5784]) -> [PASS][279]
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-dg1-19/igt@gem_eio@unwedge-stress.html
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-16/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-rkl:          [FAIL][280] ([i915#2842]) -> [PASS][281]
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-tglu:         [FAIL][282] ([i915#2842]) -> [PASS][283] +2 other tests pass
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-tglu-4/igt@gem_exec_fair@basic-pace@rcs0.html
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-7/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_exec_whisper@basic-fds:
>     - shard-mtlp:         [INCOMPLETE][284] ([i915#9857]) -> [PASS][285]
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-mtlp-3/igt@gem_exec_whisper@basic-fds.html
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-7/igt@gem_exec_whisper@basic-fds.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-rkl:          [ABORT][286] ([i915#9820]) -> [PASS][287]
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-snb:          [INCOMPLETE][288] ([i915#10137] / [i915#9200] / [i915#9849]) -> [PASS][289]
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - shard-mtlp:         [FAIL][290] ([i915#5138]) -> [PASS][291]
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-mtlp-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-tglu:         [FAIL][292] ([i915#3743]) -> [PASS][293] +1 other test pass
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-tglu-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-glk:          [FAIL][294] ([i915#2346]) -> [PASS][295] +1 other test pass
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
>     - shard-dg2:          [FAIL][296] ([i915#6880]) -> [PASS][297]
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>     - shard-snb:          [SKIP][298] ([fdo#109271]) -> [PASS][299] +7 other tests pass
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-d-edp-1-size-256:
>     - shard-mtlp:         [DMESG-WARN][300] ([i915#1982]) -> [PASS][301]
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-mtlp-8/igt@kms_plane_cursor@viewport@pipe-d-edp-1-size-256.html
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-5/igt@kms_plane_cursor@viewport@pipe-d-edp-1-size-256.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-dg1:          [DMESG-WARN][302] ([i915#4423]) -> [PASS][303]
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-dg1-15/igt@kms_pm_rpm@dpms-non-lpsp.html
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-19/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-rkl:          [SKIP][304] ([i915#9519]) -> [PASS][305] +1 other test pass
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-dg2:          [SKIP][306] ([i915#9519]) -> [PASS][307]
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_build_fourcc_list:
>     - shard-tglu:         [FAIL][308] -> [PASS][309]
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-tglu-6/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_build_fourcc_list.html
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-10/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_build_fourcc_list.html
>     - shard-mtlp:         [FAIL][310] -> [PASS][311]
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-mtlp-4/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_build_fourcc_list.html
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-8/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_build_fourcc_list.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_clip_offset:
>     - shard-rkl:          [FAIL][312] -> [PASS][313]
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-rkl-1/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_clip_offset.html
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-2/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_clip_offset.html
>     - shard-tglu:         [DMESG-WARN][314] -> [PASS][315]
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-tglu-6/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_clip_offset.html
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-10/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_clip_offset.html
>     - shard-glk:          [DMESG-FAIL][316] -> [PASS][317]
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-glk9/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_clip_offset.html
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-glk7/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_clip_offset.html
>     - shard-mtlp:         [DMESG-WARN][318] -> [PASS][319]
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-mtlp-4/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_clip_offset.html
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-8/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_clip_offset.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_abgr8888:
>     - shard-rkl:          [DMESG-WARN][320] -> [PASS][321]
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-rkl-1/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_abgr8888.html
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-2/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_abgr8888.html
>     - shard-snb:          [FAIL][322] -> [PASS][323]
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-snb7/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_abgr8888.html
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-snb7/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_abgr8888.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_argb2101010:
>     - shard-dg1:          [DMESG-WARN][324] -> [PASS][325]
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-dg1-17/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_argb2101010.html
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-16/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_argb2101010.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_gray8:
>     - shard-mtlp:         [ABORT][326] -> [PASS][327]
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-mtlp-4/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_gray8.html
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-8/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_gray8.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_mono:
>     - shard-dg1:          [FAIL][328] -> [PASS][329]
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-dg1-17/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_mono.html
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-16/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_mono.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_rgb332:
>     - shard-dg1:          [ABORT][330] -> [PASS][331]
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-dg1-17/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_rgb332.html
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-16/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_rgb332.html
>     - shard-rkl:          [ABORT][332] -> [PASS][333]
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-rkl-1/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_rgb332.html
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-2/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_rgb332.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_rgb565:
>     - shard-snb:          [ABORT][334] -> [PASS][335]
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-snb7/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_rgb565.html
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-snb7/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_rgb565.html
>     - shard-tglu:         [ABORT][336] -> [PASS][337]
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-tglu-6/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_rgb565.html
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-10/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_rgb565.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_xbgr8888:
>     - shard-snb:          [DMESG-WARN][338] -> [PASS][339]
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-snb7/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_xbgr8888.html
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-snb7/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_xbgr8888.html
> 
>   * igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_xrgb1555:
>     - shard-glk:          [ABORT][340] -> [PASS][341]
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-glk9/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_xrgb1555.html
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-glk7/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_xrgb8888_to_xrgb1555.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>     - shard-tglu:         [FAIL][342] ([i915#9196]) -> [PASS][343]
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
>     - shard-mtlp:         [FAIL][344] ([i915#9196]) -> [PASS][345]
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-mtlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
>     - shard-snb:          [FAIL][346] ([i915#9196]) -> [PASS][347] +1 other test pass
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-snb4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-snb2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
>     - shard-dg1:          [SKIP][348] ([i915#4423] / [i915#4565]) -> [SKIP][349] ([i915#4565])
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-mtlp:         [ABORT][350] ([i915#10131] / [i915#9820]) -> [ABORT][351] ([i915#10131])
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-dg2:          [INCOMPLETE][352] ([i915#10137] / [i915#9849]) -> [INCOMPLETE][353] ([i915#10137] / [i915#9820] / [i915#9849])
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-rkl:          [SKIP][354] ([i915#8063]) -> [SKIP][355] ([i915#9424])
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-rkl-7/igt@kms_content_protection@mei-interface.html
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-7/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-rkl:          [SKIP][356] ([i915#3955]) -> [SKIP][357] ([fdo#110189] / [i915#3955])
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-rkl-3/igt@kms_fbcon_fbt@psr-suspend.html
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
>     - shard-snb:          [SKIP][358] ([fdo#109271]) -> [SKIP][359] ([fdo#109271] / [fdo#111767])
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-snb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-snb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-rkl:          [SKIP][360] ([i915#4816]) -> [SKIP][361] ([i915#4070] / [i915#4816])
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-rkl:          [SKIP][362] ([i915#3361]) -> [FAIL][363] ([i915#9295])
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14230/shard-rkl-7/igt@kms_pm_dc@dc6-dpms.html
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
>   [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
>   [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
>   [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
>   [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
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
>   [i915#10030]: https://gitlab.freedesktop.org/drm/intel/issues/10030
>   [i915#10131]: https://gitlab.freedesktop.org/drm/intel/issues/10131
>   [i915#10137]: https://gitlab.freedesktop.org/drm/intel/issues/10137
>   [i915#10140]: https://gitlab.freedesktop.org/drm/intel/issues/10140
>   [i915#10183]: https://gitlab.freedesktop.org/drm/intel/issues/10183
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
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
>   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
>   [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
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
>   [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
>   [i915#4435]: https://gitlab.freedesktop.org/drm/intel/issues/4435
>   [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
>   [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
>   [i915#5107]: https://gitlab.freedesktop.org/drm/intel/issues/5107
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
>   [i915#6187]: https://gitlab.freedesktop.org/drm/intel/issues/6187
>   [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
>   [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
>   [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
>   [i915#7297]: https://gitlab.freedesktop.org/drm/intel/issues/7297
>   [i915#7443]: https://gitlab.freedesktop.org/drm/intel/issues/7443
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7862]: https://gitlab.freedesktop.org/drm/intel/issues/7862
>   [i915#8063]: https://gitlab.freedesktop.org/drm/intel/issues/8063
>   [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
>   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
>   [i915#8516]: https://gitlab.freedesktop.org/drm/intel/issues/8516
>   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
>   [i915#8588]: https://gitlab.freedesktop.org/drm/intel/issues/8588
>   [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
>   [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
>   [i915#8925]: https://gitlab.freedesktop.org/drm/intel/issues/8925
>   [i915#9053]: https://gitlab.freedesktop.org/drm/intel/issues/9053
>   [i915#9196]: https://gitlab.freedesktop.org/drm/intel/issues/9196
>   [i915#9200]: https://gitlab.freedesktop.org/drm/intel/issues/9200
>   [i915#9227]: https://gitlab.freedesktop.org/drm/intel/issues/9227
>   [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275
>   [i915#9293]: https://gitlab.freedesktop.org/drm/intel/issues/9293
>   [i915#9295]: https://gitlab.freedesktop.org/drm/intel/issues/9295
>   [i915#9323]: https://gitlab.freedesktop.org/drm/intel/issues/9323
>   [i915#9412]: https://gitlab.freedesktop.org/drm/intel/issues/9412
>   [i915#9423]: https://gitlab.freedesktop.org/drm/intel/issues/9423
>   [i915#9424]: https://gitlab.freedesktop.org/drm/intel/issues/9424
>   [i915#9519]: https://gitlab.freedesktop.org/drm/intel/issues/9519
>   [i915#9531]: https://gitlab.freedesktop.org/drm/intel/issues/9531
>   [i915#9606]: https://gitlab.freedesktop.org/drm/intel/issues/9606
>   [i915#9683]: https://gitlab.freedesktop.org/drm/intel/issues/9683
>   [i915#9685]: https://gitlab.freedesktop.org/drm/intel/issues/9685
>   [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
>   [i915#9723]: https://gitlab.freedesktop.org/drm/intel/issues/9723
>   [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
>   [i915#9766]: https://gitlab.freedesktop.org/drm/intel/issues/9766
>   [i915#9781]: https://gitlab.freedesktop.org/drm/intel/issues/9781
>   [i915#9808]: https://gitlab.freedesktop.org/drm/intel/issues/9808
>   [i915#9809]: https://gitlab.freedesktop.org/drm/intel/issues/9809
>   [i915#9820]: https://gitlab.freedesktop.org/drm/intel/issues/9820
>   [i915#9833]: https://gitlab.freedesktop.org/drm/intel/issues/9833
>   [i915#9849]: https://gitlab.freedesktop.org/drm/intel/issues/9849
>   [i915#9857]: https://gitlab.freedesktop.org/drm/intel/issues/9857
>   [i915#9917]: https://gitlab.freedesktop.org/drm/intel/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/intel/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7704 -> IGTPW_10636
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14230: b1651bcc3e78d3eca42061e8cf6bf1fea6843026 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10636: 10636
>   IGT_7704: 7704
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10636/index.html
> 




