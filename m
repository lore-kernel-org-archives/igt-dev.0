Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60F4C3DA49
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 07:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5106A10E944;
	Fri, 26 Jul 2024 07:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QUf4s/km";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106EA10E281;
 Fri, 26 Jul 2024 07:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721980475; x=1753516475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+GJ8IPdz6tlQFSL3TwXlQKf+bsHQYqfQqenR4eHXYz8=;
 b=QUf4s/kmNULUv/v+9C99CzYesZgtDP8ksRDjATWkLwM+aBDYTcZFZi3j
 X98WoRzVmOlsRx27Oxbb3XRhGlTv4X8w9z8ESVKA01TpdlML7AsDMDS09
 k2UMNN+1nY6RlbU3mDgpLxbpwAmTxZ3QABuRnuOzLg5rCI4SZQ3q3POVW
 acEH42/ATzAp/HK2Lu/c9UvIwo467T4pk24qESasUqK83Gi81DUH31muG
 8GQlEQYUbKbyCJHvxCz0x+hRfR4Zh6lMZfeqIxLzJHvUBkKH67/SLlfqk
 cqz5V2PXcxYvnZUPQDNJ7HmvryZBuCe0scpdiVyYGTF1cLSv/m9zlKgTI g==;
X-CSE-ConnectionGUID: qEhTuotxRQmgggnGvo3xww==
X-CSE-MsgGUID: prIvHmnVSIe4+9eaO88KDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="45181017"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="45181017"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 00:54:35 -0700
X-CSE-ConnectionGUID: t/ABpvKFSnepNB3/E2A3Ww==
X-CSE-MsgGUID: KVxmaPOST7m6iRciGWmLNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57341995"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.60])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 00:54:32 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
Subject: Re: =?UTF-8?B?4pyX?= Fi.CI.IGT: failure for lib/kunit: Fixes and
 enhancements
Date: Fri, 26 Jul 2024 09:54:29 +0200
Message-ID: <2273504.iZASKD2KPV@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <172194770776.384171.14427518337869663482@2413ebb6fbb6>
References: <20240722080913.74333-5-janusz.krzysztofik@linux.intel.com>
 <172194770776.384171.14427518337869663482@2413ebb6fbb6>
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

On Friday, 26 July 2024 00:48:27 GMT+2 Patchwork wrote:
> == Series Details ==
> 
> Series: lib/kunit: Fixes and enhancements
> URL   : https://patchwork.freedesktop.org/series/136329/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15107_full -> IGTPW_11440_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11440_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11440_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11440_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4:
>     - shard-dg1:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-16/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
>     - shard-tglu:         [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-tglu-9/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-1-size-64:
>     - shard-dg2:          [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-dg2-8/igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-1-size-64.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-8/igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-1-size-64.html

Hi I915-ci-infra@lists.freedesktop.org,

The above failures have nothing to do with changes to IGT Kunit library the 
series is introducing.  Please update CI Bug Log filters and re-report so we 
are free to push the patches.

Thanks,
Janusz


> 
>   
> #### Warnings ####
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
>     - shard-snb:          [FAIL][7] ([i915#11462]) -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-snb7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-snb6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11440_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#8411])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-16/igt@api_intel_bb@blit-reloc-keep-cache.html
> 
>   * igt@api_intel_bb@object-reloc-keep-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8411])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-5/igt@api_intel_bb@object-reloc-keep-cache.html
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#11078]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-8/igt@device_reset@cold-reset-bound.html
> 
>   * igt@drm_fdinfo@busy-hang@rcs0:
>     - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#8414]) +5 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-7/igt@drm_fdinfo@busy-hang@rcs0.html
> 
>   * igt@drm_fdinfo@busy-idle@bcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#8414]) +13 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-5/igt@drm_fdinfo@busy-idle@bcs0.html
> 
>   * igt@drm_fdinfo@idle@rcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][14] ([i915#7742]) +1 other test fail
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-5/igt@drm_fdinfo@idle@rcs0.html
> 
>   * igt@gem_ccs@block-copy-compressed:
>     - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#3555] / [i915#9323])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-17/igt@gem_ccs@block-copy-compressed.html
>     - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#3555] / [i915#9323])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html
> 
>   * igt@gem_ccs@block-multicopy-inplace:
>     - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#3555] / [i915#9323])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-2/igt@gem_ccs@block-multicopy-inplace.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#7697])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-1/igt@gem_close_race@multigpu-basic-threads.html
>     - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#7697])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-1/igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_create@create-ext-cpu-access-big:
>     - shard-dg2:          NOTRUN -> [ABORT][20] ([i915#9846])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-5/igt@gem_create@create-ext-cpu-access-big.html
> 
>   * igt@gem_ctx_persistence@engines-mixed-process:
>     - shard-snb:          NOTRUN -> [SKIP][21] ([i915#1099]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-snb5/igt@gem_ctx_persistence@engines-mixed-process.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#8555]) +2 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-hang.html
> 
>   * igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:
>     - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#5882]) +6 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-8/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html
> 
>   * igt@gem_ctx_sseu@invalid-args:
>     - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#280])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-8/igt@gem_ctx_sseu@invalid-args.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-dg1:          NOTRUN -> [FAIL][25] ([i915#5784]) +2 other tests fail
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-13/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_balancer@bonded-sync:
>     - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#4771])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-15/igt@gem_exec_balancer@bonded-sync.html
> 
>   * igt@gem_exec_balancer@bonded-true-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#4812]) +2 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-8/igt@gem_exec_balancer@bonded-true-hang.html
> 
>   * igt@gem_exec_balancer@noheartbeat:
>     - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#8555])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-16/igt@gem_exec_balancer@noheartbeat.html
> 
>   * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
>     - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#4525])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-4/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html
> 
>   * igt@gem_exec_capture@capture-invisible@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#6334]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-16/igt@gem_exec_capture@capture-invisible@lmem0.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-glk:          NOTRUN -> [FAIL][31] ([i915#2846])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-glk3/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-none-rrul:
>     - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#3539] / [i915#4852]) +3 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-10/igt@gem_exec_fair@basic-none-rrul.html
> 
>   * igt@gem_exec_fair@basic-none-rrul@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][33] ([i915#2842]) +3 other tests fail
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-solo:
>     - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#3539]) +3 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-8/igt@gem_exec_fair@basic-pace-solo.html
> 
>   * igt@gem_exec_fair@basic-sync:
>     - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#3539]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-17/igt@gem_exec_fair@basic-sync.html
> 
>   * igt@gem_exec_fence@submit:
>     - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#4812]) +3 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-16/igt@gem_exec_fence@submit.html
> 
>   * igt@gem_exec_flush@basic-uc-rw-default:
>     - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#3539] / [i915#4852]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-13/igt@gem_exec_flush@basic-uc-rw-default.html
> 
>   * igt@gem_exec_reloc@basic-cpu-active:
>     - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#3281]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-active.html
> 
>   * igt@gem_exec_reloc@basic-gtt-read:
>     - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3281]) +15 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-5/igt@gem_exec_reloc@basic-gtt-read.html
> 
>   * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
>     - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#3281]) +8 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-16/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-write-read-noreloc:
>     - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#3281]) +10 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-3/igt@gem_exec_reloc@basic-write-read-noreloc.html
> 
>   * igt@gem_exec_schedule@preempt-queue:
>     - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4537] / [i915#4812])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-11/igt@gem_exec_schedule@preempt-queue.html
> 
>   * igt@gem_fence_thrash@bo-copy:
>     - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#4860]) +2 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-13/igt@gem_fence_thrash@bo-copy.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4860])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-6/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#2190])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-5/igt@gem_huc_copy@huc-copy.html
>     - shard-glk:          NOTRUN -> [SKIP][46] ([i915#2190])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-glk1/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi@lmem0:
>     - shard-dg1:          NOTRUN -> [FAIL][47] ([i915#10378])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random@lmem0:
>     - shard-dg2:          [PASS][48] -> [FAIL][49] ([i915#10378])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-dg2-2/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-5/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html
> 
>   * igt@gem_lmem_swapping@parallel-random:
>     - shard-tglu:         NOTRUN -> [SKIP][50] ([i915#4613])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-10/igt@gem_lmem_swapping@parallel-random.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify:
>     - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#4613]) +4 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-1/igt@gem_lmem_swapping@parallel-random-verify.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg1:          [PASS][52] -> [TIMEOUT][53] ([i915#5493])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_lmem_swapping@verify-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][54] ([i915#4613]) +7 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-glk3/igt@gem_lmem_swapping@verify-ccs.html
> 
>   * igt@gem_lmem_swapping@verify-ccs@lmem0:
>     - shard-dg2:          NOTRUN -> [FAIL][55] ([i915#10378])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-4/igt@gem_lmem_swapping@verify-ccs@lmem0.html
> 
>   * igt@gem_mmap@short-mmap:
>     - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4083]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-4/igt@gem_mmap@short-mmap.html
> 
>   * igt@gem_mmap_gtt@basic-small-bo-tiledx:
>     - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4077]) +5 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-2/igt@gem_mmap_gtt@basic-small-bo-tiledx.html
> 
>   * igt@gem_mmap_gtt@close-race:
>     - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4077]) +5 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-15/igt@gem_mmap_gtt@close-race.html
> 
>   * igt@gem_mmap_gtt@zero-extend:
>     - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4077]) +13 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-11/igt@gem_mmap_gtt@zero-extend.html
> 
>   * igt@gem_mmap_wc@write-cpu-read-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4083]) +4 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-5/igt@gem_mmap_wc@write-cpu-read-wc.html
> 
>   * igt@gem_mmap_wc@write-prefaulted:
>     - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4083]) +2 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-18/igt@gem_mmap_wc@write-prefaulted.html
> 
>   * igt@gem_partial_pwrite_pread@reads-uncached:
>     - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#3282]) +6 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-4/igt@gem_partial_pwrite_pread@reads-uncached.html
> 
>   * igt@gem_pread@self:
>     - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#3282]) +4 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-1/igt@gem_pread@self.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-glk:          NOTRUN -> [WARN][64] ([i915#2658])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-glk2/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_pwrite@basic-random:
>     - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3282]) +3 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-14/igt@gem_pwrite@basic-random.html
> 
>   * igt@gem_pxp@create-protected-buffer:
>     - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4270]) +2 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-16/igt@gem_pxp@create-protected-buffer.html
> 
>   * igt@gem_pxp@create-regular-context-1:
>     - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4270]) +3 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-8/igt@gem_pxp@create-regular-context-1.html
> 
>   * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
>     - shard-tglu:         NOTRUN -> [SKIP][68] ([i915#4270])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-3/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
> 
>   * igt@gem_pxp@protected-raw-src-copy-not-readible:
>     - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#4270]) +3 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-4/igt@gem_pxp@protected-raw-src-copy-not-readible.html
> 
>   * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#5190] / [i915#8428]) +8 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-4/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html
> 
>   * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#8428]) +2 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-7/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
>     - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#8411])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-4/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
> 
>   * igt@gem_set_tiling_vs_gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4079]) +2 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-15/igt@gem_set_tiling_vs_gtt.html
>     - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4079])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-11/igt@gem_set_tiling_vs_gtt.html
> 
>   * igt@gem_unfence_active_buffers:
>     - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4879])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-16/igt@gem_unfence_active_buffers.html
>     - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4879])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-3/igt@gem_unfence_active_buffers.html
> 
>   * igt@gem_userptr_blits@forbidden-operations:
>     - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#3282] / [i915#3297])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-6/igt@gem_userptr_blits@forbidden-operations.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-busy:
>     - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#3297] / [i915#4880]) +1 other test skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
>     - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#3297] / [i915#4880])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
> 
>   * igt@gem_userptr_blits@readonly-pwrite-unsync:
>     - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#3297])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-3/igt@gem_userptr_blits@readonly-pwrite-unsync.html
> 
>   * igt@gem_userptr_blits@set-cache-level:
>     - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#3297])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-5/igt@gem_userptr_blits@set-cache-level.html
> 
>   * igt@gem_userptr_blits@unsync-overlap:
>     - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#3297]) +2 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-8/igt@gem_userptr_blits@unsync-overlap.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-after-close:
>     - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#3297]) +5 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-after-close.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-cycles:
>     - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#3297]) +1 other test skip
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-15/igt@gem_userptr_blits@unsync-unmap-cycles.html
> 
>   * igt@gen7_exec_parse@bitmasks:
>     - shard-dg2:          NOTRUN -> [SKIP][85] +21 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-5/igt@gen7_exec_parse@bitmasks.html
> 
>   * igt@gen9_exec_parse@bb-chained:
>     - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#2527]) +4 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-3/igt@gen9_exec_parse@bb-chained.html
>     - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#2527] / [i915#2856]) +1 other test skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-8/igt@gen9_exec_parse@bb-chained.html
> 
>   * igt@gen9_exec_parse@bb-large:
>     - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#2527]) +2 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-15/igt@gen9_exec_parse@bb-large.html
> 
>   * igt@gen9_exec_parse@secure-batches:
>     - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#2856])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-4/igt@gen9_exec_parse@secure-batches.html
> 
>   * igt@gen9_exec_parse@unaligned-access:
>     - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#2856]) +5 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-6/igt@gen9_exec_parse@unaligned-access.html
> 
>   * igt@i915_module_load@load:
>     - shard-glk:          NOTRUN -> [SKIP][91] ([i915#6227])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-glk7/igt@i915_module_load@load.html
>     - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#6227])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-3/igt@i915_module_load@load.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
>     - shard-tglu:         NOTRUN -> [WARN][93] ([i915#2681]) +3 other tests warn
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
> 
>   * igt@i915_pm_rps@thresholds-park@gt0:
>     - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#8925])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-5/igt@i915_pm_rps@thresholds-park@gt0.html
> 
>   * igt@i915_pm_rps@thresholds-park@gt1:
>     - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#3555] / [i915#8925])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-5/igt@i915_pm_rps@thresholds-park@gt1.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#4387])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-4/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#6245])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-15/igt@i915_query@hwconfig_table.html
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#7707])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-5/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#7707])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-1/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#5190]) +1 other test skip
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-10/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@clobberred-modifier:
>     - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#4212])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-11/igt@kms_addfb_basic@clobberred-modifier.html
> 
>   * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>     - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#4212])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-14/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#3826])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_addfb_basic@tile-pitch-mismatch:
>     - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#4212])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-2/igt@kms_addfb_basic@tile-pitch-mismatch.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#8709]) +11 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#1769] / [i915#3555])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [FAIL][107] ([i915#5956])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-glk:          NOTRUN -> [SKIP][108] ([i915#1769])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-glk3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
>     - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#5286]) +4 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
>     - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#5286]) +1 other test skip
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-8/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#4538] / [i915#5286])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#3638]) +2 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#3638]) +2 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-18/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][114] +5 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-5/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#4538] / [i915#5190]) +13 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][116] +26 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#4538]) +5 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-13/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#10656])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-1/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_big_joiner@invalid-modeset-force-joiner:
>     - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#10656]) +1 other test skip
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-1/igt@kms_big_joiner@invalid-modeset-force-joiner.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#6095]) +51 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-16/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
>     - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#10307] / [i915#6095]) +174 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-11/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][123] ([i915#6095]) +7 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-a-edp-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>     - shard-snb:          NOTRUN -> [SKIP][124] +74 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-snb6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#6095]) +11 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-10/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#6095]) +75 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#3742])
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-16/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#7213]) +3 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-d-dp-4:
>     - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#4087]) +3 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio:
>     - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#7828]) +10 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-10/igt@kms_chamelium_audio@hdmi-audio.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#7828]) +2 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-9/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#7828]) +1 other test skip
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-5/igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
>     - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#7828]) +5 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-17/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-fast:
>     - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#7828]) +14 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-5/igt@kms_chamelium_hpd@vga-hpd-fast.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#7116] / [i915#9424]) +1 other test skip
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-17/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#9424])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-15/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#3299])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#3299])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-13/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#3116] / [i915#3299])
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-10/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#7118] / [i915#9424]) +1 other test skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-6/igt@kms_content_protection@type1.html
>     - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#7118] / [i915#9424]) +1 other test skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-2/igt@kms_content_protection@type1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x42:
>     - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#8814])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-max-size:
>     - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#3555]) +1 other test skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>     - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#3555] / [i915#8814]) +1 other test skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#11453])
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>     - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#11453])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#3555]) +4 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#4103] / [i915#4213]) +1 other test skip
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#4103]) +1 other test skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>     - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#4103] / [i915#4213]) +1 other test skip
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
>     - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#9809])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-glk:          NOTRUN -> [FAIL][152] ([i915#2346])
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>     - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#9067])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
>     - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#9067])
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#9723])
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-18/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
>     - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#9723])
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
>     - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#9833])
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#9723]) +1 other test skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#8588])
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-6/igt@kms_display_modes@mst-extended-mode-negative.html
>     - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#8588])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-18/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#3804])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-dg2:          [PASS][162] -> [SKIP][163] ([i915#1257])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-dg2-11/igt@kms_dp_aux_dev.html
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-4/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#3555] / [i915#3840])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-4/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#3840] / [i915#9053])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#4854])
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-7/igt@kms_feature_discovery@chamelium.html
>     - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#4854])
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-3/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#9337])
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-4/igt@kms_feature_discovery@dp-mst.html
>     - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#9337])
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-14/igt@kms_feature_discovery@dp-mst.html
>     - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#9337])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-8/igt@kms_feature_discovery@dp-mst.html
>     - shard-mtlp:         NOTRUN -> [SKIP][171] ([i915#9337])
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-5/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#658])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-16/igt@kms_feature_discovery@psr2.html
>     - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#658])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-4/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_fence_pin_leak:
>     - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#4881])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-16/igt@kms_fence_pin_leak.html
>     - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#4881])
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-7/igt@kms_fence_pin_leak.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#3637])
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-3/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
>     - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#3637]) +2 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#9934]) +4 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-17/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a4:
>     - shard-dg1:          [PASS][179] -> [FAIL][180] ([i915#2122])
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-dg1-18/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a4.html
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-17/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a4.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#2672]) +4 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#2587] / [i915#2672]) +1 other test skip
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#2587] / [i915#2672]) +2 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#2672]) +4 other tests skip
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#2672] / [i915#3555])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#2672])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2:          NOTRUN -> [FAIL][187] ([i915#6880]) +1 other test fail
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#1825]) +41 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>     - shard-dg1:          NOTRUN -> [SKIP][189] +43 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#5439]) +1 other test skip
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#3458]) +22 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#5354]) +39 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#8708]) +21 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#9766])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-11/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#3023]) +25 other tests skip
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#8708]) +3 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#8708]) +13 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
>     - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#1825]) +7 other tests skip
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-tglu:         NOTRUN -> [SKIP][199] +23 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#3458]) +14 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#3555] / [i915#8228]) +1 other test skip
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-16/igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#3555] / [i915#8228])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-6/igt@kms_hdr@invalid-metadata-sizes.html
>     - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#3555] / [i915#8228]) +2 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-1/igt@kms_hdr@invalid-metadata-sizes.html
>     - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#3555] / [i915#8228])
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-6/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#3555] / [i915#8228]) +2 other tests skip
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-6/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#4816])
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>     - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#1839])
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-18/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#6301])
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-18/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#6301])
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-6/igt@kms_panel_fitting@legacy.html
>     - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#6301])
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-1/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [FAIL][211] ([i915#10647]) +5 other tests fail
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-glk3/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#3555] / [i915#8821])
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-11/igt@kms_plane_lowres@tiling-yf.html
>     - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#3555]) +8 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-5/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#3555] / [i915#8806])
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-2/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [FAIL][215] ([i915#8292])
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-17/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#9423]) +16 other tests skip
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#5176]) +3 other tests skip
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-edp-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#9423]) +5 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#9423]) +15 other tests skip
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-15/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#5235] / [i915#9423]) +2 other tests skip
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#9728]) +5 other tests skip
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#9728]) +3 other tests skip
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#9728]) +3 other tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-16/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [SKIP][224] +538 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-glk1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#5354])
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-1/igt@kms_pm_backlight@basic-brightness.html
>     - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#5354])
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-18/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#9685])
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-8/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#3361])
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#9340])
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-6/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_lpsp@screens-disabled:
>     - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#8430])
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-7/igt@kms_pm_lpsp@screens-disabled.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#9519]) +1 other test skip
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-6/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-dg2:          [PASS][232] -> [SKIP][233] ([i915#9519])
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#9519])
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>     - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#9519])
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_prime@basic-crc-vgem:
>     - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#6524])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-18/igt@kms_prime@basic-crc-vgem.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#6524])
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-4/igt@kms_prime@d3hot.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#11520]) +4 other tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-1/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
>     - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#11520]) +2 other tests skip
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-1/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
>     - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#11520]) +1 other test skip
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-8/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>     - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#11520]) +4 other tests skip
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-15/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr-cursor-plane-move@edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#9688]) +2 other tests skip
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-7/igt@kms_psr@fbc-psr-cursor-plane-move@edp-1.html
> 
>   * igt@kms_psr@fbc-psr-cursor-render:
>     - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#9732]) +6 other tests skip
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-5/igt@kms_psr@fbc-psr-cursor-render.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#1072] / [i915#9732]) +17 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-18/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html
> 
>   * igt@kms_psr@pr-sprite-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#1072] / [i915#9732]) +24 other tests skip
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-6/igt@kms_psr@pr-sprite-mmap-gtt.html
> 
>   * igt@kms_psr@psr-cursor-render:
>     - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#1072] / [i915#9732]) +23 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-7/igt@kms_psr@psr-cursor-render.html
> 
>   * igt@kms_psr@psr2-primary-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#1072] / [i915#9673] / [i915#9732]) +6 other tests skip
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-11/igt@kms_psr@psr2-primary-blt.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#9685])
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#5289])
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#4235])
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#11131] / [i915#5190])
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#11131])
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#3555]) +4 other tests skip
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-14/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#8623])
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-8/igt@kms_tiled_display@basic-test-pattern.html
>     - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#8623])
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
>     - shard-mtlp:         [PASS][256] -> [FAIL][257] ([i915#9196])
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-mtlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#9906])
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-1/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#9906])
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-9/igt@kms_vrr@max-min.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#3555] / [i915#9906])
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-4/igt@kms_vrr@negative-basic.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#2437])
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-6/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-glk:          NOTRUN -> [SKIP][262] ([i915#2437]) +3 other tests skip
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-glk7/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#2437])
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-9/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@perf@gen8-unprivileged-single-ctx-counters:
>     - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#2436])
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html
> 
>   * igt@perf@mi-rpc:
>     - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#2434])
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-6/igt@perf@mi-rpc.html
>     - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#2434])
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-18/igt@perf@mi-rpc.html
> 
>   * igt@perf_pmu@cpu-hotplug:
>     - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#8850])
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-6/igt@perf_pmu@cpu-hotplug.html
>     - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#8850])
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-16/igt@perf_pmu@cpu-hotplug.html
> 
>   * igt@perf_pmu@frequency@gt0:
>     - shard-dg2:          NOTRUN -> [FAIL][269] ([i915#6806])
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-11/igt@perf_pmu@frequency@gt0.html
> 
>   * igt@perf_pmu@rc6@other-idle-gt0:
>     - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#8516])
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-7/igt@perf_pmu@rc6@other-idle-gt0.html
>     - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#8516])
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-5/igt@perf_pmu@rc6@other-idle-gt0.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#3291] / [i915#3708])
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-1/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#3708]) +1 other test skip
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-17/igt@prime_vgem@fence-flip-hang.html
> 
>   * igt@prime_vgem@fence-write-hang:
>     - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#3708])
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-3/igt@prime_vgem@fence-write-hang.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#9917])
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-6/igt@sriov_basic@bind-unbind-vf.html
>     - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#9917])
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-9/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#9917])
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-6/igt@sriov_basic@enable-vfs-autoprobe-on.html
>     - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#9917])
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-16/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   * igt@syncobj_timeline@invalid-wait-zero-handles:
>     - shard-dg2:          NOTRUN -> [FAIL][279] ([i915#9781]) +1 other test fail
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-11/igt@syncobj_timeline@invalid-wait-zero-handles.html
>     - shard-dg1:          NOTRUN -> [FAIL][280] ([i915#9781])
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-15/igt@syncobj_timeline@invalid-wait-zero-handles.html
> 
>   * igt@syncobj_wait@invalid-wait-zero-handles:
>     - shard-glk:          NOTRUN -> [FAIL][281] ([i915#9781])
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-glk2/igt@syncobj_wait@invalid-wait-zero-handles.html
> 
>   * igt@tools_test@sysfs_l3_parity:
>     - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#4818])
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
>     - shard-rkl:          [FAIL][283] ([i915#7742]) -> [PASS][284]
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
> 
>   * igt@gem_exec_big@single:
>     - shard-tglu:         [ABORT][285] ([i915#11713]) -> [PASS][286]
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-tglu-6/igt@gem_exec_big@single.html
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-3/igt@gem_exec_big@single.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-rkl:          [FAIL][287] ([i915#2842]) -> [PASS][288] +1 other test pass
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-rkl-5/igt@gem_exec_fair@basic-pace@rcs0.html
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-6/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-glk:          [ABORT][289] ([i915#5566]) -> [PASS][290]
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-glk2/igt@gen9_exec_parse@allowed-single.html
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-glk3/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg1:          [ABORT][291] ([i915#9820]) -> [PASS][292]
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-dg1-13/igt@i915_module_load@reload-with-fault-injection.html
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
>     - shard-snb:          [FAIL][293] ([i915#5956]) -> [PASS][294] +1 other test pass
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-snb6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-snb5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-4:
>     - shard-dg1:          [FAIL][295] ([i915#5956]) -> [PASS][296]
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-dg1-14/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-4.html
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-17/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_color@ctm-negative@pipe-b-hdmi-a-1:
>     - shard-snb:          [ABORT][297] -> [PASS][298] +1 other test pass
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-snb5/igt@kms_color@ctm-negative@pipe-b-hdmi-a-1.html
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-snb4/igt@kms_color@ctm-negative@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-glk:          [FAIL][299] ([i915#2346]) -> [PASS][300]
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
>     - shard-dg2:          [FAIL][301] ([i915#6880]) -> [PASS][302] +2 other tests pass
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-tglu:         [SKIP][303] ([i915#4281]) -> [PASS][304]
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-tglu-9/igt@kms_pm_dc@dc9-dpms.html
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-10/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-dg2:          [SKIP][305] ([i915#9519]) -> [PASS][306] +1 other test pass
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-rkl:          [SKIP][307] ([i915#9519]) -> [PASS][308] +3 other tests pass
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
>     - shard-tglu:         [FAIL][309] ([i915#9196]) -> [PASS][310]
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-tglu:         [ABORT][311] ([i915#9820]) -> [ABORT][312] ([i915#10887] / [i915#9820])
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-mtlp:         [ABORT][313] ([i915#10131] / [i915#10887] / [i915#9820]) -> [ABORT][314] ([i915#10131] / [i915#10887])
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-dg2:          [WARN][315] ([i915#7356]) -> [ABORT][316] ([i915#9820])
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-rkl:          [SKIP][317] ([i915#8063]) -> [SKIP][318] ([i915#9424])
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-rkl-2/igt@kms_content_protection@mei-interface.html
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-1/igt@kms_content_protection@mei-interface.html
>     - shard-dg1:          [SKIP][319] ([i915#9433]) -> [SKIP][320] ([i915#9424])
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-dg1-15/igt@kms_content_protection@mei-interface.html
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg1-16/igt@kms_content_protection@mei-interface.html
>     - shard-tglu:         [SKIP][321] ([i915#8063]) -> [SKIP][322] ([i915#6944] / [i915#9424])
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-tglu-9/igt@kms_content_protection@mei-interface.html
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-tglu-6/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2:          [SKIP][323] ([i915#11453]) -> [SKIP][324] ([i915#11453] / [i915#3359])
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-dg2-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
>     - shard-dg2:          [SKIP][325] ([i915#3458]) -> [SKIP][326] ([i915#10433] / [i915#3458]) +1 other test skip
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-rkl:          [SKIP][327] ([i915#4816]) -> [SKIP][328] ([i915#4070] / [i915#4816])
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_psr@fbc-pr-primary-mmap-gtt:
>     - shard-dg2:          [SKIP][329] ([i915#1072] / [i915#9732]) -> [SKIP][330] ([i915#1072] / [i915#9673] / [i915#9732]) +7 other tests skip
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-dg2-5/igt@kms_psr@fbc-pr-primary-mmap-gtt.html
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-11/igt@kms_psr@fbc-pr-primary-mmap-gtt.html
> 
>   * igt@kms_psr@fbc-psr-primary-page-flip:
>     - shard-dg2:          [SKIP][331] ([i915#1072] / [i915#9673] / [i915#9732]) -> [SKIP][332] ([i915#1072] / [i915#9732]) +7 other tests skip
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-dg2-11/igt@kms_psr@fbc-psr-primary-page-flip.html
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-4/igt@kms_psr@fbc-psr-primary-page-flip.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2:          [SKIP][333] ([i915#11131] / [i915#4235] / [i915#5190]) -> [SKIP][334] ([i915#11131] / [i915#5190])
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@perf@non-zero-reason@0-rcs0:
>     - shard-dg2:          [FAIL][335] ([i915#9100]) -> [FAIL][336] ([i915#7484])
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/shard-dg2-8/igt@perf@non-zero-reason@0-rcs0.html
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/shard-dg2-6/igt@perf@non-zero-reason@0-rcs0.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#10131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>   [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
>   [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>   [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>   [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
>   [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#10887]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
>   [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
>   [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
>   [i915#11131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131
>   [i915#11453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453
>   [i915#11462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11462
>   [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>   [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
>   [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
>   [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
>   [i915#2122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122
>   [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
>   [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
>   [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
>   [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
>   [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>   [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
>   [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>   [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
>   [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
>   [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
>   [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
>   [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>   [i915#3826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3826
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#4070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4087]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
>   [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>   [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
>   [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
>   [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>   [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>   [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
>   [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
>   [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>   [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
>   [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>   [i915#4879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879
>   [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
>   [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
>   [i915#5176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
>   [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
>   [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
>   [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
>   [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882
>   [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
>   [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>   [i915#6227]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227
>   [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
>   [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
>   [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
>   [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
>   [i915#6806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806
>   [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
>   [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
>   [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
>   [i915#7213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213
>   [i915#7356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7356
>   [i915#7484]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7484
>   [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
>   [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
>   [i915#7742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742
>   [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>   [i915#8063]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8063
>   [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>   [i915#8292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292
>   [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>   [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>   [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
>   [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
>   [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
>   [i915#8588]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588
>   [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
>   [i915#8806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8806
>   [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
>   [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
>   [i915#8850]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8850
>   [i915#8925]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8925
>   [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
>   [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
>   [i915#9100]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100
>   [i915#9196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
>   [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>   [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
>   [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
>   [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
>   [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
>   [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
>   [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
>   [i915#9673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673
>   [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>   [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
>   [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
>   [i915#9728]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
>   [i915#9781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781
>   [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
>   [i915#9820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
>   [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
>   [i915#9846]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9846
>   [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>   [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7933 -> IGTPW_11440
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_15107: 867eb2599d00e03d12a2a49b223cf37280d7ee2e @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11440: 11440
>   IGT_7933: 7933
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/index.html
> 




