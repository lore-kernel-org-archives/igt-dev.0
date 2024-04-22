Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55180C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 14:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B863A112B6A;
	Mon, 22 Apr 2024 14:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aisrTyPw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827D7112B67;
 Mon, 22 Apr 2024 14:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713796177; x=1745332177;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MPtHgFFDgo10XgSbStPQow7cUuwAQh0/hb5AM2yQDfg=;
 b=aisrTyPwf0vdQNoa0lUgL3i4HmgLEDt8Nmm6X1pbxzX7JkDU/LD8zAid
 pxV9O5Rt6QGy4xLsinmAFPEfuXlCfW22wm9BXiy+vD8rrt+yR7Ufax7aw
 V4HdlHpHrDYZjaInLd8fPNG0WdTeLslgvPkL2DZZ2ZCj5P9pCW669B5Q3
 zgo6JRXmEctd2ffQk0HqKYrErdAofrVqnPoDebMONAAL04RrpgtNBycSw
 C8rWa8LRfEA2KeR9oKKOFtdS4NgXhiTJBpH6Yqo6UNMwEVAxNmRlOjxHa
 u/w5nshJPoCMB3/1rnTEQFDY29x6Dd3GgMmOoP/vIFyJmROCmFEi6fii2 A==;
X-CSE-ConnectionGUID: zh6N+UsBSeqBsbQ++PQ8/w==
X-CSE-MsgGUID: GgpV9KhPQ2u8Cekht/hY8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="19891932"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="19891932"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 07:29:36 -0700
X-CSE-ConnectionGUID: VmAyQ0aRQYOXnUyXGYG4EA==
X-CSE-MsgGUID: mrLp4DEwR4+/767TjFwUJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="61483896"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 07:29:34 -0700
Date: Mon, 22 Apr 2024 16:29:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for Align
 Xe header and restore some uAPI flags (rev5)
Message-ID: <20240422142931.cnmcr5wgyjoj5wrw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240412142159.6-1-francois.dugast@intel.com>
 <171352753058.1519312.11592706130472919027@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171352753058.1519312.11592706130472919027@8e613ede5ea5>
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
On 2024-04-19 at 11:52:10 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Align Xe header and restore some uAPI flags (rev5)
> URL   : https://patchwork.freedesktop.org/series/131816/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7813_full -> IGTPW_11039_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11039_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11039_full, please notify your bug team (&quot;I915-ci-infra@lists.freedesktop.org&quot;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/index.html
> 
> Participating hosts (10 -> 9)
> ------------------------------
> 
>   Missing    (1): shard-snb-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11039_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-hdmi-a-1:
>     - shard-snb:          NOTRUN -> [INCOMPLETE][1] +7 other tests incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-snb6/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [ABORT][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-glk9/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_flip@dpms-vs-vblank-race@b-hdmi-a4:
>     - shard-dg1:          NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-17/igt@kms_flip@dpms-vs-vblank-race@b-hdmi-a4.html
> 
>   * igt@kms_properties@crtc-properties-atomic:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][4] +1 other test incomplete
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-glk8/igt@kms_properties@crtc-properties-atomic.html
> 
>   * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-4:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][5] +1 other test incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-11/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-4.html
> 
>   * igt@kms_vblank@wait-forked-hang@pipe-d-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [INCOMPLETE][6] +1 other test incomplete
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-10/igt@kms_vblank@wait-forked-hang@pipe-d-hdmi-a-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_universal_plane@universal-plane-functional@pipe-b-hdmi-a-1:
>     - shard-snb:          [INCOMPLETE][7] ([i915#10875]) -> [INCOMPLETE][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/shard-snb5/igt@kms_universal_plane@universal-plane-functional@pipe-b-hdmi-a-1.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-snb2/igt@kms_universal_plane@universal-plane-functional@pipe-b-hdmi-a-1.html
> 

Above looks unrelated to Xe changes, please re-run.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11039_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-keep-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#8411])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-3/igt@api_intel_bb@object-reloc-keep-cache.html
>     - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#8411])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-15/igt@api_intel_bb@object-reloc-keep-cache.html
> 
>   * igt@debugfs_test@basic-hwmon:
>     - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#9318])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-6/igt@debugfs_test@basic-hwmon.html
>     - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#9318])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-9/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@drm_fdinfo@isolation@vecs0:
>     - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#8414]) +11 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-15/igt@drm_fdinfo@isolation@vecs0.html
> 
>   * igt@drm_fdinfo@virtual-busy-all:
>     - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#8414]) +8 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-11/igt@drm_fdinfo@virtual-busy-all.html
> 
>   * igt@drm_fdinfo@virtual-busy-idle:
>     - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#8414]) +7 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-3/igt@drm_fdinfo@virtual-busy-idle.html
> 
>   * igt@gem_basic@multigpu-create-close:
>     - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#7697]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-5/igt@gem_basic@multigpu-create-close.html
> 
>   * igt@gem_ccs@block-multicopy-inplace:
>     - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#3555] / [i915#9323])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-7/igt@gem_ccs@block-multicopy-inplace.html
> 
>   * igt@gem_close_race@multigpu-basic-process:
>     - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#7697])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-8/igt@gem_close_race@multigpu-basic-process.html
>     - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#7697])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-7/igt@gem_close_race@multigpu-basic-process.html
>     - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#7697])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-11/igt@gem_close_race@multigpu-basic-process.html
> 
>   * igt@gem_ctx_persistence@engines-mixed-process:
>     - shard-snb:          NOTRUN -> [SKIP][21] ([i915#1099]) +7 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-snb5/igt@gem_ctx_persistence@engines-mixed-process.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hang:
>     - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#8555])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-hang.html
>     - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#8555])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-hang.html
> 
>   * igt@gem_eio@kms:
>     - shard-dg1:          NOTRUN -> [INCOMPLETE][24] ([i915#10513])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-15/igt@gem_eio@kms.html
> 
>   * igt@gem_exec_balancer@bonded-dual:
>     - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#4771])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-4/igt@gem_exec_balancer@bonded-dual.html
>     - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#4771])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-6/igt@gem_exec_balancer@bonded-dual.html
>     - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#4771])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-17/igt@gem_exec_balancer@bonded-dual.html
> 
>   * igt@gem_exec_balancer@bonded-true-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#4812])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html
> 
>   * igt@gem_exec_balancer@hog:
>     - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#4812]) +1 other test skip
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-18/igt@gem_exec_balancer@hog.html
> 
>   * igt@gem_exec_balancer@invalid-bonds:
>     - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#4036])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-6/igt@gem_exec_balancer@invalid-bonds.html
>     - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#4036])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-17/igt@gem_exec_balancer@invalid-bonds.html
> 
>   * igt@gem_exec_balancer@parallel-keep-in-fence:
>     - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#4525]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-1/igt@gem_exec_balancer@parallel-keep-in-fence.html
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-tglu:         NOTRUN -> [FAIL][33] ([i915#6117])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-10/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@gem_exec_fair@basic-flow:
>     - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#3539] / [i915#4852])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-5/igt@gem_exec_fair@basic-flow.html
> 
>   * igt@gem_exec_fair@basic-none-rrul@rcs0:
>     - shard-tglu:         NOTRUN -> [FAIL][35] ([i915#2842]) +1 other test fail
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-7/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> 
>   * igt@gem_exec_flush@basic-wb-rw-before-default:
>     - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#3539] / [i915#4852]) +4 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-18/igt@gem_exec_flush@basic-wb-rw-before-default.html
> 
>   * igt@gem_exec_params@larger-than-life-batch:
>     - shard-glk:          NOTRUN -> [SKIP][37] +73 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-glk8/igt@gem_exec_params@larger-than-life-batch.html
> 
>   * igt@gem_exec_reloc@basic-concurrent0:
>     - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#3281]) +12 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-15/igt@gem_exec_reloc@basic-concurrent0.html
>     - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#3281]) +4 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-6/igt@gem_exec_reloc@basic-concurrent0.html
> 
>   * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
>     - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#3281]) +6 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-5/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-gtt-read-noreloc:
>     - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#3281]) +7 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-read-noreloc.html
> 
>   * igt@gem_exec_schedule@thriceslice:
>     - shard-snb:          NOTRUN -> [SKIP][42] +521 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-snb4/igt@gem_exec_schedule@thriceslice.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-threaded-none:
>     - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#4860]) +2 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-18/igt@gem_fence_thrash@bo-write-verify-threaded-none.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-x:
>     - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4860]) +2 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-x.html
> 
>   * igt@gem_lmem_swapping@basic@lmem0:
>     - shard-dg2:          NOTRUN -> [FAIL][45] ([i915#10378])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#4613]) +2 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
>     - shard-tglu:         NOTRUN -> [SKIP][47] ([i915#4613]) +2 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
>     - shard-glk:          NOTRUN -> [SKIP][48] ([i915#4613])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-glk4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
>     - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#4613]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#4565])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-18/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html
> 
>   * igt@gem_media_fill@media-fill:
>     - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#8289])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-3/igt@gem_media_fill@media-fill.html
>     - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#8289])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-8/igt@gem_media_fill@media-fill.html
> 
>   * igt@gem_media_vme:
>     - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#284])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-3/igt@gem_media_vme.html
>     - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#284])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-15/igt@gem_media_vme.html
> 
>   * igt@gem_mmap_gtt@hang:
>     - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4077]) +8 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-5/igt@gem_mmap_gtt@hang.html
> 
>   * igt@gem_mmap_wc@write-gtt-read-wc:
>     - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4083]) +2 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-6/igt@gem_mmap_wc@write-gtt-read-wc.html
> 
>   * igt@gem_mmap_wc@write-prefaulted:
>     - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4083]) +1 other test skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-10/igt@gem_mmap_wc@write-prefaulted.html
>     - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4083]) +6 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-18/igt@gem_mmap_wc@write-prefaulted.html
> 
>   * igt@gem_partial_pwrite_pread@reads:
>     - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#3282]) +5 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-3/igt@gem_partial_pwrite_pread@reads.html
> 
>   * igt@gem_partial_pwrite_pread@write-uncached:
>     - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#3282]) +2 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-6/igt@gem_partial_pwrite_pread@write-uncached.html
>     - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#3282]) +2 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-4/igt@gem_partial_pwrite_pread@write-uncached.html
> 
>   * igt@gem_pwrite_snooped:
>     - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#3282]) +5 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-17/igt@gem_pwrite_snooped.html
> 
>   * igt@gem_pxp@create-regular-buffer:
>     - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4270]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-5/igt@gem_pxp@create-regular-buffer.html
> 
>   * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>     - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#4270]) +3 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-5/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
> 
>   * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>     - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4270]) +3 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-15/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
> 
>   * igt@gem_pxp@verify-pxp-stale-ctx-execution:
>     - shard-tglu:         NOTRUN -> [SKIP][66] ([i915#4270]) +3 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-10/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
>     - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4270])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-4/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
> 
>   * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#5190] / [i915#8428]) +4 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-8/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html
>     - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#8428]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-6/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html
> 
>   * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
>     - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4077]) +16 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-14/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html
> 
>   * igt@gem_tiled_pread_pwrite:
>     - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4079])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-15/igt@gem_tiled_pread_pwrite.html
> 
>   * igt@gem_tiling_max_stride:
>     - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4077]) +5 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-2/igt@gem_tiling_max_stride.html
> 
>   * igt@gem_userptr_blits@access-control:
>     - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#3297])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-3/igt@gem_userptr_blits@access-control.html
>     - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3297])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-8/igt@gem_userptr_blits@access-control.html
>     - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#3297])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-3/igt@gem_userptr_blits@access-control.html
> 
>   * igt@gem_userptr_blits@forbidden-operations:
>     - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#3282] / [i915#3297])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-4/igt@gem_userptr_blits@forbidden-operations.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
>     - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#3297] / [i915#4880])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
> 
>   * igt@gem_userptr_blits@readonly-pwrite-unsync:
>     - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#3297]) +3 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-10/igt@gem_userptr_blits@readonly-pwrite-unsync.html
> 
>   * igt@gem_userptr_blits@sd-probe:
>     - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#3297] / [i915#4958])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-6/igt@gem_userptr_blits@sd-probe.html
>     - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#3297] / [i915#4958])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-17/igt@gem_userptr_blits@sd-probe.html
> 
>   * igt@gem_userptr_blits@unsync-overlap:
>     - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#3297]) +1 other test skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-15/igt@gem_userptr_blits@unsync-overlap.html
> 
>   * igt@gen3_render_linear_blits:
>     - shard-mtlp:         NOTRUN -> [SKIP][82] +9 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-4/igt@gen3_render_linear_blits.html
> 
>   * igt@gen9_exec_parse@bb-chained:
>     - shard-tglu:         NOTRUN -> [SKIP][83] ([i915#2527] / [i915#2856])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-5/igt@gen9_exec_parse@bb-chained.html
> 
>   * igt@i915_pm_freq_api@freq-basic-api:
>     - shard-tglu:         NOTRUN -> [SKIP][84] ([i915#8399]) +1 other test skip
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-4/igt@i915_pm_freq_api@freq-basic-api.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#6621]) +1 other test skip
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-15/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_power@sanity:
>     - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#7984])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-5/igt@i915_power@sanity.html
> 
>   * igt@i915_selftest@mock@memory_region:
>     - shard-dg2:          NOTRUN -> [DMESG-WARN][87] ([i915#9311])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-8/igt@i915_selftest@mock@memory_region.html
>     - shard-rkl:          NOTRUN -> [DMESG-WARN][88] ([i915#9311])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-3/igt@i915_selftest@mock@memory_region.html
>     - shard-dg1:          NOTRUN -> [DMESG-WARN][89] ([i915#9311])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-15/igt@i915_selftest@mock@memory_region.html
>     - shard-tglu:         NOTRUN -> [DMESG-WARN][90] ([i915#9311])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-4/igt@i915_selftest@mock@memory_region.html
>     - shard-mtlp:         NOTRUN -> [DMESG-WARN][91] ([i915#9311])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-6/igt@i915_selftest@mock@memory_region.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#4212]) +1 other test skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-8/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
>     - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#4212])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-6/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
> 
>   * igt@kms_addfb_basic@basic-x-tiled-legacy:
>     - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#4212])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-17/igt@kms_addfb_basic@basic-x-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-tglu:         NOTRUN -> [SKIP][95] ([i915#3826])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-x:
>     - shard-snb:          NOTRUN -> [INCOMPLETE][96] ([i915#10875]) +1 other test incomplete
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-snb6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-x.html
> 
>   * igt@kms_atomic_interruptible@legacy-dpms@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][97] ([i915#10875])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-6/igt@kms_atomic_interruptible@legacy-dpms@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-snb:          NOTRUN -> [SKIP][98] ([i915#1769])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-snb6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>     - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#5286]) +4 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-5/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-overflow:
>     - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#5286]) +1 other test skip
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-15/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#5286]) +2 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#4538] / [i915#5286]) +2 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#3638]) +1 other test skip
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
>     - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#3638]) +2 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-16/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#4538] / [i915#5190]) +9 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#4538]) +6 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-17/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-tglu:         NOTRUN -> [SKIP][107] +99 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-8/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#6095]) +51 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#10278])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-6/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#6095]) +23 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#10278])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
>     - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#10278])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-15/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#10307] / [i915#6095]) +48 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-5/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#6095]) +35 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#6095]) +27 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-4/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#10278])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-10/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#3742])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-15/igt@kms_cdclk@mode-transition-all-outputs.html
>     - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#3742])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-6/igt@kms_cdclk@mode-transition-all-outputs.html
>     - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#7213])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-11/igt@kms_cdclk@mode-transition-all-outputs.html
>     - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#3742])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-5/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>     - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#7828]) +2 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-7/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
>     - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#7828]) +3 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-5/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#7828]) +8 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-18/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_edid@hdmi-mode-timings:
>     - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#7828]) +7 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-7/igt@kms_chamelium_edid@hdmi-mode-timings.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm:
>     - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#7828]) +3 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-4/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#6944] / [i915#9424])
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-4/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#6944] / [i915#9424]) +1 other test skip
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-5/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#7118])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-5/igt@kms_content_protection@srm.html
>     - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#7116])
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-15/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#7118] / [i915#9424])
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-10/igt@kms_content_protection@uevent.html
>     - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#7118] / [i915#9424])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-1/igt@kms_content_protection@uevent.html
>     - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#7116] / [i915#9424]) +1 other test skip
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-18/igt@kms_content_protection@uevent.html
>     - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-3/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x32:
>     - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#3555] / [i915#8814])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#3359]) +2 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#3359]) +3 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>     - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#3359]) +1 other test skip
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-max-size:
>     - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#3555]) +1 other test skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#3359]) +3 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x512.html
>     - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#3359]) +2 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#4103] / [i915#4213])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
>     - shard-mtlp:         NOTRUN -> [ABORT][143] ([i915#10875]) +20 other tests abort
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][144] +32 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#9809]) +1 other test skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>     - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#9067])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-18/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#8588])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-5/igt@kms_display_modes@mst-extended-mode-negative.html
>     - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#8588])
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-2/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
>     - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#3555]) +1 other test skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-10/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
>     - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#3555]) +2 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-18/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-2:
>     - shard-glk:          NOTRUN -> [DMESG-WARN][151] ([i915#10875])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-glk9/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#3555] / [i915#3840])
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-16/igt@kms_dsc@dsc-basic.html
>     - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#3555] / [i915#3840]) +1 other test skip
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-5/igt@kms_dsc@dsc-basic.html
>     - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#3555] / [i915#3840] / [i915#9159])
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-5/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#3555] / [i915#3840]) +1 other test skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-3/igt@kms_dsc@dsc-with-output-formats.html
>     - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#3555] / [i915#3840])
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-6/igt@kms_dsc@dsc-with-output-formats.html
>     - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#3555] / [i915#3840]) +1 other test skip
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][158] ([i915#9878])
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-6/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#4854])
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-5/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#1839]) +1 other test skip
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-5/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#1839])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-5/igt@kms_feature_discovery@display-4x.html
>     - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#1839]) +2 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-16/igt@kms_feature_discovery@display-4x.html
>     - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#1839])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-10/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#9337])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-5/igt@kms_feature_discovery@dp-mst.html
>     - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#9337])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-3/igt@kms_feature_discovery@dp-mst.html
>     - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#9337])
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-15/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-dg2:          NOTRUN -> [SKIP][167] +13 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-10/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-modeset:
>     - shard-tglu:         NOTRUN -> [SKIP][168] ([i915#3637] / [i915#3966]) +1 other test skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-7/igt@kms_flip@2x-flip-vs-modeset.html
>     - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#3637]) +3 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-2/igt@kms_flip@2x-flip-vs-modeset.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#3637]) +5 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-10/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#9934]) +4 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-14/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-vga1:
>     - shard-snb:          [PASS][172] -> [INCOMPLETE][173] ([i915#10875])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/shard-snb6/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-vga1.html
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-snb2/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-vga1.html
> 
>   * igt@kms_flip@flip-vs-fences:
>     - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#8381])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-16/igt@kms_flip@flip-vs-fences.html
> 
>   * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a1:
>     - shard-tglu:         NOTRUN -> [INCOMPLETE][175] ([i915#10875]) +1 other test incomplete
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-8/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a4:
>     - shard-dg1:          NOTRUN -> [INCOMPLETE][176] ([i915#1982])
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-16/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a4.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [ABORT][177] ([i915#10875]) +4 other tests abort
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html
>     - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#2672])
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#2587] / [i915#2672]) +4 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#2672])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#2672])
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#2587] / [i915#2672]) +3 other tests skip
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#8708]) +12 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-dg1:          NOTRUN -> [SKIP][184] +48 other tests skip
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#8708]) +17 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#5439])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
>     - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#5439]) +1 other test skip
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#3023]) +17 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
>     - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#8708]) +1 other test skip
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:
>     - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#3458]) +11 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#3458]) +23 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#9766])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
>     - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#9766])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#5354]) +19 other tests skip
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#1825]) +23 other tests skip
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-pwrite:
>     - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#1825]) +10 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#3555] / [i915#8228])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-8/igt@kms_hdr@invalid-hdr.html
>     - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#3555] / [i915#8228])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-17/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#3555] / [i915#8228]) +1 other test skip
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-5/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#6301])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-18/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#3582]) +3 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-5/igt@kms_plane_lowres@tiling-x@pipe-a-edp-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#6953] / [i915#9423])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-8/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [FAIL][203] ([i915#8292])
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [FAIL][204] ([i915#8292])
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [FAIL][205] ([i915#8292])
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-17/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#9423]) +3 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#9423]) +11 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-16/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#5176] / [i915#9423]) +1 other test skip
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#5176] / [i915#9423]) +3 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-15/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#9423]) +7 other tests skip
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-10/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#3361])
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-3/igt@kms_pm_dc@dc6-dpms.html
>     - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#3361])
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-15/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@drm-resources-equal:
>     - shard-mtlp:         NOTRUN -> [ABORT][213] ([i915#10553] / [i915#10875])
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-1/igt@kms_pm_rpm@drm-resources-equal.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-rkl:          NOTRUN -> [ABORT][214] ([i915#10875]) +9 other tests abort
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-mtlp:         NOTRUN -> [ABORT][215] ([i915#10159] / [i915#10553] / [i915#10875])
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-8/igt@kms_pm_rpm@system-suspend-modeset.html
> 
>   * igt@kms_prime@basic-crc-vgem:
>     - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#6524] / [i915#6805])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-2/igt@kms_prime@basic-crc-vgem.html
>     - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#6524])
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-17/igt@kms_prime@basic-crc-vgem.html
> 
>   * igt@kms_properties@crtc-properties-atomic:
>     - shard-rkl:          NOTRUN -> [DMESG-WARN][218] ([i915#10875])
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-4/igt@kms_properties@crtc-properties-atomic.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#4348])
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-2/igt@kms_psr2_su@page_flip-nv12.html
>     - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#9683])
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-10/igt@kms_psr2_su@page_flip-nv12.html
>     - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#9683])
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-4/igt@kms_psr2_su@page_flip-nv12.html
>     - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#9683])
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-16/igt@kms_psr2_su@page_flip-nv12.html
>     - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#9683])
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-7/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#9688]) +4 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-2/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html
> 
>   * igt@kms_psr@pr-sprite-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#1072] / [i915#9732]) +11 other tests skip
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-1/igt@kms_psr@pr-sprite-mmap-gtt.html
>     - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#1072] / [i915#9732]) +15 other tests skip
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-18/igt@kms_psr@pr-sprite-mmap-gtt.html
> 
>   * igt@kms_psr@psr2-cursor-plane-onoff:
>     - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#9732]) +18 other tests skip
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-4/igt@kms_psr@psr2-cursor-plane-onoff.html
> 
>   * igt@kms_psr@psr2-primary-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#1072] / [i915#9732]) +6 other tests skip
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-10/igt@kms_psr@psr2-primary-mmap-gtt.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#9685])
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-18/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>     - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#5289])
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#5289]) +1 other test skip
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>     - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#5289]) +1 other test skip
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#8623])
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-18/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vblank@crtc-id@pipe-c-hdmi-a-2:
>     - shard-glk:          NOTRUN -> [ABORT][234] ([i915#10875]) +4 other tests abort
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-glk9/igt@kms_vblank@crtc-id@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_vblank@query-busy@pipe-d-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [DMESG-WARN][235] ([i915#10875])
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-2/igt@kms_vblank@query-busy@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [ABORT][236] ([i915#10875] / [i915#9508])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-5/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_vblank@wait-forked-hang@pipe-d-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [DMESG-WARN][237] ([i915#10875]) +1 other test dmesg-warn
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-6/igt@kms_vblank@wait-forked-hang@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#9906])
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-2/igt@kms_vrr@flip-basic-fastset.html
>     - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#9906]) +1 other test skip
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-5/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#3555])
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-5/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#8808] / [i915#9906])
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-8/igt@kms_vrr@max-min.html
>     - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#9906])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-6/igt@kms_vrr@max-min.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#2437])
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-18/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#2437])
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-11/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#2437] / [i915#9412])
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-2/igt@kms_writeback@writeback-pixel-formats.html
>     - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#2437] / [i915#9412])
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-17/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@perf@per-context-mode-unprivileged:
>     - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#2433]) +1 other test skip
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-18/igt@perf@per-context-mode-unprivileged.html
> 
>   * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
>     - shard-dg2:          NOTRUN -> [CRASH][248] ([i915#9351])
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-8/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#9917])
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-5/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@v3d/v3d_get_bo_offset@get-bad-handle:
>     - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#2575]) +9 other tests skip
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-6/igt@v3d/v3d_get_bo_offset@get-bad-handle.html
> 
>   * igt@v3d/v3d_submit_cl@job-perfmon:
>     - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#2575]) +15 other tests skip
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-16/igt@v3d/v3d_submit_cl@job-perfmon.html
> 
>   * igt@v3d/v3d_submit_cl@single-out-sync:
>     - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#2575]) +24 other tests skip
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-3/igt@v3d/v3d_submit_cl@single-out-sync.html
> 
>   * igt@v3d/v3d_submit_csd@bad-bo:
>     - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#2575]) +7 other tests skip
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-4/igt@v3d/v3d_submit_csd@bad-bo.html
> 
>   * igt@vc4/vc4_create_bo@create-bo-4096:
>     - shard-mtlp:         NOTRUN -> [SKIP][254] ([i915#7711]) +4 other tests skip
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-mtlp-8/igt@vc4/vc4_create_bo@create-bo-4096.html
> 
>   * igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:
>     - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#7711]) +8 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg2-5/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html
>     - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#7711]) +7 other tests skip
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-6/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html
> 
>   * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-twice:
>     - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#7711]) +6 other tests skip
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-dg1-17/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-twice.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-tglu:         [FAIL][258] ([i915#3743]) -> [PASS][259]
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/shard-tglu-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1:
>     - shard-snb:          [INCOMPLETE][260] -> [PASS][261]
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1.html
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-snb6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1.html
> 
>   * igt@kms_plane@plane-position-hole@pipe-b:
>     - shard-rkl:          [ABORT][262] ([i915#10875]) -> [PASS][263]
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/shard-rkl-3/igt@kms_plane@plane-position-hole@pipe-b.html
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-2/igt@kms_plane@plane-position-hole@pipe-b.html
> 
>   * igt@kms_vblank@wait-busy@pipe-b-hdmi-a-1:
>     - shard-rkl:          [DMESG-WARN][264] ([i915#10875]) -> [PASS][265]
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/shard-rkl-4/igt@kms_vblank@wait-busy@pipe-b-hdmi-a-1.html
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-rkl-4/igt@kms_vblank@wait-busy@pipe-b-hdmi-a-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-1:
>     - shard-snb:          [INCOMPLETE][266] -> [INCOMPLETE][267] ([i915#10875])
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/shard-snb7/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-1.html
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-snb2/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1:
>     - shard-tglu:         [INCOMPLETE][268] ([i915#9508]) -> [INCOMPLETE][269] ([i915#10875] / [i915#9508])
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/shard-tglu-2/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/shard-tglu-6/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html
> 
>   
>   [i915#10159]: https://gitlab.freedesktop.org/drm/intel/issues/10159
>   [i915#10278]: https://gitlab.freedesktop.org/drm/intel/issues/10278
>   [i915#10307]: https://gitlab.freedesktop.org/drm/intel/issues/10307
>   [i915#10378]: https://gitlab.freedesktop.org/drm/intel/issues/10378
>   [i915#10434]: https://gitlab.freedesktop.org/drm/intel/issues/10434
>   [i915#10513]: https://gitlab.freedesktop.org/drm/intel/issues/10513
>   [i915#10553]: https://gitlab.freedesktop.org/drm/intel/issues/10553
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#10875]: https://gitlab.freedesktop.org/drm/intel/issues/10875
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3582]: https://gitlab.freedesktop.org/drm/intel/issues/3582
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
>   [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4348]: https://gitlab.freedesktop.org/drm/intel/issues/4348
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
>   [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
>   [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
>   [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
>   [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
>   [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7984]: https://gitlab.freedesktop.org/drm/intel/issues/7984
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8289]: https://gitlab.freedesktop.org/drm/intel/issues/8289
>   [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
>   [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
>   [i915#8399]: https://gitlab.freedesktop.org/drm/intel/issues/8399
>   [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
>   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
>   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
>   [i915#8588]: https://gitlab.freedesktop.org/drm/intel/issues/8588
>   [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
>   [i915#8808]: https://gitlab.freedesktop.org/drm/intel/issues/8808
>   [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
>   [i915#9067]: https://gitlab.freedesktop.org/drm/intel/issues/9067
>   [i915#9159]: https://gitlab.freedesktop.org/drm/intel/issues/9159
>   [i915#9311]: https://gitlab.freedesktop.org/drm/intel/issues/9311
>   [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
>   [i915#9323]: https://gitlab.freedesktop.org/drm/intel/issues/9323
>   [i915#9337]: https://gitlab.freedesktop.org/drm/intel/issues/9337
>   [i915#9351]: https://gitlab.freedesktop.org/drm/intel/issues/9351
>   [i915#9412]: https://gitlab.freedesktop.org/drm/intel/issues/9412
>   [i915#9423]: https://gitlab.freedesktop.org/drm/intel/issues/9423
>   [i915#9424]: https://gitlab.freedesktop.org/drm/intel/issues/9424
>   [i915#9508]: https://gitlab.freedesktop.org/drm/intel/issues/9508
>   [i915#9683]: https://gitlab.freedesktop.org/drm/intel/issues/9683
>   [i915#9685]: https://gitlab.freedesktop.org/drm/intel/issues/9685
>   [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
>   [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
>   [i915#9766]: https://gitlab.freedesktop.org/drm/intel/issues/9766
>   [i915#9809]: https://gitlab.freedesktop.org/drm/intel/issues/9809
>   [i915#9878]: https://gitlab.freedesktop.org/drm/intel/issues/9878
>   [i915#9906]: https://gitlab.freedesktop.org/drm/intel/issues/9906
>   [i915#9917]: https://gitlab.freedesktop.org/drm/intel/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/intel/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7813 -> IGTPW_11039
> 
>   CI-20190529: 20190529
>   CI_DRM_14602: 4eddedf2b31be4f2280a7c42966eaf9b6cb251a8 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11039: 7d07174eaa3a97b60dd118a1775ae7b23c06817c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7813: 66841b7d9024447be4f4f5449aaf4f021e6323e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/index.html
