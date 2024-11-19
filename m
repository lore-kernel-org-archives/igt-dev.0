Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBDED44144
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 11:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B79B10E025;
	Tue, 19 Nov 2024 11:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GrP1XOK6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605A710E025;
 Tue, 19 Nov 2024 11:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732014890; x=1763550890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xgAhZt3cMoZ/U7TgVhLM2O5i2qCgurTTD5+Cef7AvgA=;
 b=GrP1XOK6BChbzT1evY0Efn/zt/G2OH/t6yRJrd7U+46v6bvFBD6CZ7dU
 W6sEg0/uxxdKawQ3BWHM4nbcABOKLICmKB1nDQKVv2Pw0PdQKodsHEfcn
 Bi1DKzeEJL4x3DFwWPmMU2doh+9APnAXyS09XGLxyQZZDcmte0F3Si1kz
 pv5kJAb7QLW6OhktDLEtFG90Xw/Ejxs/ccR3Wq9gcsC8kEDi3/5vMJcIb
 Zfx5ZSa2Qa4IIn9Pw4DaQhR6iLKjdBrcfuY9QWwKJDkLWJCb2XnIDaThB
 vTtZHtaGX5/hHV2GuScsaN4MraFABCad7spxk97jJi5uK0I3OMQsAYC64 w==;
X-CSE-ConnectionGUID: gxCqawsQR/2rKWAzvPDinQ==
X-CSE-MsgGUID: /FVrBPO+RvS6WGt8Y26sdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="49543795"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="49543795"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 03:14:50 -0800
X-CSE-ConnectionGUID: 17g1sVjDRHCxIqr6XRnIEg==
X-CSE-MsgGUID: c/enWHJmRTGgaHrPhs/WqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="93598263"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.215])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 03:14:48 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: =?UTF-8?B?4pyX?= Fi.CI.IGT: failure for intel-ci: Blocklist
 igt@i915_module_load@load
Date: Tue, 19 Nov 2024 12:14:44 +0100
Message-ID: <2129768.KlZ2vcFHjT@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <173194529355.1263241.12238180803558908842@2413ebb6fbb6>
References: <20241115145854.19330-2-janusz.krzysztofik@linux.intel.com>
 <173194529355.1263241.12238180803558908842@2413ebb6fbb6>
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

On Monday, 18 November 2024 16:54:53 CET Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci: Blocklist igt@i915_module_load@load
> URL   : https://patchwork.freedesktop.org/series/141406/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8114_full -> IGTPW_12116_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12116_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12116_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12116_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_setmaster@master-drop-set-shared-fd:
>     - shard-dg2:          NOTRUN -> [SKIP][1] +13 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - shard-dg2:          [PASS][2] -> [SKIP][3] +4 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-3/igt@device_reset@unbind-reset-rebind.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html
> 
>   * igt@gem_wait@busy@rcs0:
>     - shard-dg1:          [PASS][4] -> [INCOMPLETE][5] +1 other test incomplete
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg1-17/igt@gem_wait@busy@rcs0.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-13/igt@gem_wait@busy@rcs0.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-tglu:         [PASS][6] -> [INCOMPLETE][7] +1 other test incomplete
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-tglu-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

None of the above is related, please update CBL filters and re-report.

Thanks,
Janusz

> 
>   
> #### Warnings ####
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg1:          [ABORT][8] ([i915#9820]) -> [WARN][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg1-18/igt@i915_module_load@reload-with-fault-injection.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-14/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_pm_rpm@pm-tiling:
>     - shard-dg2:          [SKIP][10] ([i915#4077]) -> [SKIP][11] +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-8/igt@kms_pm_rpm@pm-tiling.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@kms_pm_rpm@pm-tiling.html
> 
>   * igt@kms_prime@basic-modeset-hybrid:
>     - shard-dg2:          [SKIP][12] ([i915#6524] / [i915#6805]) -> [SKIP][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-6/igt@kms_prime@basic-modeset-hybrid.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@kms_prime@basic-modeset-hybrid.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12116_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_allocator@two-level-inception:
>     - shard-dg2:          [PASS][14] -> [SKIP][15] +23 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-6/igt@api_intel_allocator@two-level-inception.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@api_intel_allocator@two-level-inception.html
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#8411])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-15/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@drm_fdinfo@busy-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#12506]) +4 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@drm_fdinfo@busy-hang.html
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
>     - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#8414]) +14 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-4/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html
> 
>   * igt@drm_fdinfo@virtual-busy-idle:
>     - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#8414]) +7 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-4/igt@drm_fdinfo@virtual-busy-idle.html
>     - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#8414]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-15/igt@drm_fdinfo@virtual-busy-idle.html
> 
>   * igt@fbdev@info:
>     - shard-dg2:          [PASS][21] -> [SKIP][22] ([i915#1849] / [i915#2582])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-8/igt@fbdev@info.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@fbdev@info.html
> 
>   * igt@gem_basic@multigpu-create-close:
>     - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#7697])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-9/igt@gem_basic@multigpu-create-close.html
> 
>   * igt@gem_busy@close-race:
>     - shard-dg1:          NOTRUN -> [FAIL][24] ([i915#12296] / [i915#12577])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-14/igt@gem_busy@close-race.html
> 
>   * igt@gem_busy@semaphore:
>     - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#3936])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-14/igt@gem_busy@semaphore.html
> 
>   * igt@gem_ccs@ctrl-surf-copy:
>     - shard-tglu:         NOTRUN -> [SKIP][26] ([i915#3555] / [i915#9323])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-7/igt@gem_ccs@ctrl-surf-copy.html
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][27] ([i915#7297]) +1 other test incomplete
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-6/igt@gem_ccs@suspend-resume.html
>     - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#9323])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-12/igt@gem_ccs@suspend-resume.html
>     - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#9323])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-9/igt@gem_ccs@suspend-resume.html
>     - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#9323])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-6/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#7697])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-3/igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#8562])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-7/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_ctx_persistence@engines-persistence:
>     - shard-snb:          NOTRUN -> [SKIP][33] ([i915#1099]) +2 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-snb4/igt@gem_ctx_persistence@engines-persistence.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hostile:
>     - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#8555]) +2 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-hostile.html
> 
>   * igt@gem_ctx_persistence@hostile:
>     - shard-tglu:         NOTRUN -> [FAIL][35] ([i915#11980] / [i915#12580])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-7/igt@gem_ctx_persistence@hostile.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#280])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-2/igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_ctx_sseu@mmap-args:
>     - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#280])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-4/igt@gem_ctx_sseu@mmap-args.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-dg1:          [PASS][38] -> [FAIL][39] ([i915#12714] / [i915#5784])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg1-17/igt@gem_eio@unwedge-stress.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-15/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_balancer@bonded-pair:
>     - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#4771])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-18/igt@gem_exec_balancer@bonded-pair.html
> 
>   * igt@gem_exec_balancer@bonded-semaphore:
>     - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4812]) +2 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-18/igt@gem_exec_balancer@bonded-semaphore.html
>     - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#4812])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-5/igt@gem_exec_balancer@bonded-semaphore.html
> 
>   * igt@gem_exec_balancer@invalid-bonds:
>     - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#4036])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-18/igt@gem_exec_balancer@invalid-bonds.html
>     - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4036])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-2/igt@gem_exec_balancer@invalid-bonds.html
> 
>   * igt@gem_exec_balancer@noheartbeat:
>     - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#8555])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-15/igt@gem_exec_balancer@noheartbeat.html
>     - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#8555])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-4/igt@gem_exec_balancer@noheartbeat.html
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-tglu-1:       NOTRUN -> [FAIL][47] ([i915#6117])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@gem_exec_big@single:
>     - shard-tglu:         NOTRUN -> [ABORT][48] ([i915#11713])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-10/igt@gem_exec_big@single.html
> 
>   * igt@gem_exec_capture@capture-invisible:
>     - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#6334]) +2 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-12/igt@gem_exec_capture@capture-invisible.html
> 
>   * igt@gem_exec_capture@capture-recoverable:
>     - shard-tglu-1:       NOTRUN -> [SKIP][50] ([i915#6344])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@gem_exec_capture@capture-recoverable.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-rkl:          NOTRUN -> [FAIL][51] ([i915#2846])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-none:
>     - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#3539] / [i915#4852]) +3 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-14/igt@gem_exec_fair@basic-none.html
>     - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4473] / [i915#4771]) +2 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-2/igt@gem_exec_fair@basic-none.html
> 
>   * igt@gem_exec_fair@basic-none-rrul:
>     - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#3539] / [i915#4852]) +7 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-4/igt@gem_exec_fair@basic-none-rrul.html
> 
>   * igt@gem_exec_fair@basic-none-solo:
>     - shard-rkl:          NOTRUN -> [FAIL][55] ([i915#2842]) +1 other test fail
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-5/igt@gem_exec_fair@basic-none-solo.html
> 
>   * igt@gem_exec_fair@basic-none@rcs0:
>     - shard-tglu:         NOTRUN -> [FAIL][56] ([i915#2842]) +9 other tests fail
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-6/igt@gem_exec_fair@basic-none@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace:
>     - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3539])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-8/igt@gem_exec_fair@basic-pace.html
> 
>   * igt@gem_exec_fair@basic-pace-solo:
>     - shard-tglu-1:       NOTRUN -> [FAIL][58] ([i915#2842]) +1 other test fail
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@gem_exec_fair@basic-pace-solo.html
>     - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#3539]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-15/igt@gem_exec_fair@basic-pace-solo.html
> 
>   * igt@gem_exec_fair@basic-pace@vecs0:
>     - shard-rkl:          [PASS][60] -> [FAIL][61] ([i915#2842])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-3/igt@gem_exec_fair@basic-pace@vecs0.html
> 
>   * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
>     - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#3281]) +2 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-softpin:
>     - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#3281]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-8/igt@gem_exec_reloc@basic-softpin.html
> 
>   * igt@gem_exec_reloc@basic-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#3281]) +8 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-8/igt@gem_exec_reloc@basic-wc.html
> 
>   * igt@gem_exec_reloc@basic-write-gtt-active:
>     - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3281]) +4 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-15/igt@gem_exec_reloc@basic-write-gtt-active.html
> 
>   * igt@gem_exec_schedule@pi-common@vcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][66] ([i915#12296]) +4 other tests fail
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-5/igt@gem_exec_schedule@pi-common@vcs0.html
>     - shard-tglu-1:       NOTRUN -> [FAIL][67] ([i915#12296]) +5 other tests fail
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@gem_exec_schedule@pi-common@vcs0.html
> 
>   * igt@gem_exec_schedule@pi-common@vecs0:
>     - shard-dg2:          NOTRUN -> [FAIL][68] ([i915#12296]) +7 other tests fail
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-2/igt@gem_exec_schedule@pi-common@vecs0.html
> 
>   * igt@gem_exec_suspend@basic-s0@lmem0:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][69] ([i915#11441])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-2/igt@gem_exec_suspend@basic-s0@lmem0.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-x:
>     - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4860]) +3 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-x.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][71] ([i915#4613]) +2 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
>     - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#12193])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4565])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html
> 
>   * igt@gem_lmem_swapping@parallel-multi:
>     - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#4613])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-1/igt@gem_lmem_swapping@parallel-multi.html
>     - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4613])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-6/igt@gem_lmem_swapping@parallel-multi.html
> 
>   * igt@gem_lmem_swapping@verify-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#4613]) +4 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-2/igt@gem_lmem_swapping@verify-ccs.html
> 
>   * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
>     - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4077]) +9 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-19/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html
> 
>   * igt@gem_mmap_gtt@cpuset-big-copy-odd:
>     - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4077]) +6 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
> 
>   * igt@gem_mmap_gtt@hang-busy:
>     - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#4077]) +2 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-8/igt@gem_mmap_gtt@hang-busy.html
> 
>   * igt@gem_mmap_wc@close:
>     - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#4083]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-3/igt@gem_mmap_wc@close.html
> 
>   * igt@gem_mmap_wc@copy:
>     - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4083]) +3 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-3/igt@gem_mmap_wc@copy.html
>     - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#4083]) +3 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-19/igt@gem_mmap_wc@copy.html
> 
>   * igt@gem_partial_pwrite_pread@reads:
>     - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#3282]) +5 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-7/igt@gem_partial_pwrite_pread@reads.html
> 
>   * igt@gem_pread@bench:
>     - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#3282]) +1 other test skip
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-4/igt@gem_pread@bench.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#3282]) +5 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-14/igt@gem_pwrite@basic-exhaustion.html
>     - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#3282]) +1 other test skip
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-8/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
>     - shard-tglu-1:       NOTRUN -> [SKIP][87] ([i915#4270]) +1 other test skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
> 
>   * igt@gem_pxp@regular-baseline-src-copy-readible:
>     - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4270]) +2 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-18/igt@gem_pxp@regular-baseline-src-copy-readible.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-off-2:
>     - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#4270]) +3 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-4/igt@gem_pxp@reject-modify-context-protection-off-2.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-on:
>     - shard-tglu:         NOTRUN -> [SKIP][90] ([i915#4270]) +3 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-2/igt@gem_pxp@reject-modify-context-protection-on.html
> 
>   * igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#8428]) +1 other test skip
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-1/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html
> 
>   * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#5190] / [i915#8428]) +7 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-5/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#4079]) +3 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-1/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>     - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#8411])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
> 
>   * igt@gem_userptr_blits@coherency-unsync:
>     - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#3297]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-7/igt@gem_userptr_blits@coherency-unsync.html
> 
>   * igt@gem_userptr_blits@dmabuf-unsync:
>     - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#3297]) +3 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-3/igt@gem_userptr_blits@dmabuf-unsync.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][97] ([i915#3297]) +3 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@gem_userptr_blits@dmabuf-unsync.html
> 
>   * igt@gem_userptr_blits@readonly-unsync:
>     - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#3297])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-3/igt@gem_userptr_blits@readonly-unsync.html
> 
>   * igt@gen9_exec_parse@basic-rejected:
>     - shard-tglu-1:       NOTRUN -> [SKIP][99] ([i915#2527] / [i915#2856])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@gen9_exec_parse@basic-rejected.html
> 
>   * igt@gen9_exec_parse@batch-zero-length:
>     - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#2527] / [i915#2856]) +3 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-6/igt@gen9_exec_parse@batch-zero-length.html
>     - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#2856]) +1 other test skip
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-7/igt@gen9_exec_parse@batch-zero-length.html
>     - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#2856]) +2 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-8/igt@gen9_exec_parse@batch-zero-length.html
> 
>   * igt@gen9_exec_parse@bb-large:
>     - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#2527]) +2 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-19/igt@gen9_exec_parse@bb-large.html
> 
>   * igt@gen9_exec_parse@shadow-peek:
>     - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#2527]) +1 other test skip
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-mtlp:         [PASS][105] -> [ABORT][106] ([i915#10131] / [i915#10887])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_freq_api@freq-basic-api:
>     - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#8399])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-2/igt@i915_pm_freq_api@freq-basic-api.html
> 
>   * igt@i915_pm_rc6_residency@rc6-fence:
>     - shard-tglu-1:       NOTRUN -> [WARN][108] ([i915#2681]) +1 other test warn
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.html
> 
>   * igt@i915_pm_rps@min-max-config-loaded:
>     - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#11681] / [i915#6621])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-12/igt@i915_pm_rps@min-max-config-loaded.html
> 
>   * igt@i915_pm_rps@thresholds-park:
>     - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#11681]) +1 other test skip
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-7/igt@i915_pm_rps@thresholds-park.html
>     - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#11681])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-13/igt@i915_pm_rps@thresholds-park.html
>     - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#11681])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-8/igt@i915_pm_rps@thresholds-park.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#4387])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-1/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@i915_query@test-query-geometry-subslices:
>     - shard-tglu:         NOTRUN -> [SKIP][114] ([i915#5723])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-9/igt@i915_query@test-query-geometry-subslices.html
> 
>   * igt@i915_selftest@mock@memory_region:
>     - shard-dg2:          NOTRUN -> [DMESG-WARN][115] ([i915#9311]) +1 other test dmesg-warn
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-1/igt@i915_selftest@mock@memory_region.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-tglu-1:       NOTRUN -> [INCOMPLETE][116] ([i915#7443])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-tglu-1:       NOTRUN -> [SKIP][117] ([i915#7707])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#4212] / [i915#5190])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#4212] / [i915#4215] / [i915#5190])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-4/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
>     - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#4212]) +3 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-19/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
> 
>   * igt@kms_addfb_basic@clobberred-modifier:
>     - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#4212]) +1 other test skip
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-2/igt@kms_addfb_basic@clobberred-modifier.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#12454] / [i915#12712])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-10/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
>     - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#8709]) +3 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#9531])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>     - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#9531])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][126] ([i915#9531])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-dg1:          [PASS][127] -> [FAIL][128] ([i915#5956])
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#1769] / [i915#3555])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [FAIL][130] ([i915#5956])
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-overflow:
>     - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#5286])
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-16/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#5286]) +1 other test skip
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][133] ([i915#5286]) +2 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#5286]) +4 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#4538] / [i915#5286]) +2 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-mtlp:         [PASS][136] -> [FAIL][137] ([i915#5138])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#3638]) +1 other test skip
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-4/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#3638]) +1 other test skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-13/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#4538] / [i915#5190]) +11 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-mtlp:         NOTRUN -> [SKIP][141] +5 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#5190]) +7 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#4538]) +2 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-13/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#6095]) +4 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-edp-1.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#6095]) +157 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-12/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][146] ([i915#12313])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#10307] / [i915#6095]) +101 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#10307] / [i915#10434] / [i915#6095])
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#12313]) +2 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#12805])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>     - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#12805])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#6095]) +13 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#12313]) +1 other test skip
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-13/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
>     - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#6095]) +39 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#6095]) +78 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-hdmi-a-1:
>     - shard-tglu-1:       NOTRUN -> [SKIP][156] ([i915#6095]) +44 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#3742])
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-19/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-single:
>     - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#7828]) +4 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-1/igt@kms_chamelium_frames@hdmi-crc-single.html
>     - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#7828]) +1 other test skip
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-4/igt@kms_chamelium_frames@hdmi-crc-single.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>     - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#7828]) +3 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
>     - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#7828]) +5 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-18/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#7828]) +5 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-9/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#7828]) +8 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-7/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#7118] / [i915#9424])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-6/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@atomic@pipe-a-dp-4:
>     - shard-dg2:          NOTRUN -> [TIMEOUT][165] ([i915#7173]) +1 other test timeout
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-10/igt@kms_content_protection@atomic@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-tglu-1:       NOTRUN -> [SKIP][166] ([i915#6944] / [i915#9424])
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#3116] / [i915#3299]) +1 other test skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-6/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#3299])
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-6/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#9424]) +1 other test skip
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-13/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#7118] / [i915#9424]) +1 other test skip
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-1/igt@kms_content_protection@type1.html
>     - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#7116] / [i915#9424])
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-16/igt@kms_content_protection@type1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-64x21:
>     - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#8814]) +2 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-64x21.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#11453] / [i915#3359])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x10:
>     - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#3555]) +9 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-7/igt@kms_cursor_crc@cursor-random-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#11453] / [i915#3359])
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-14/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#11453] / [i915#3359])
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-9/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-max-size:
>     - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#3555])
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-max-size.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#9809]) +2 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#4103] / [i915#4213]) +2 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][180] +5 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#4103])
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#4103] / [i915#4213]) +1 other test skip
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#4103])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#9833])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#9723])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#3555] / [i915#3804])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#3804])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#12402])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#3555] / [i915#3840])
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-14/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#3555] / [i915#3840])
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-10/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-tglu-1:       NOTRUN -> [SKIP][191] ([i915#3555] / [i915#3840])
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#3840] / [i915#9053])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#1839])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-10/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#1839])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-2/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-tglu-1:       NOTRUN -> [SKIP][195] ([i915#658])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank:
>     - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#9934]) +7 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-13/igt@kms_flip@2x-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank:
>     - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#3637]) +6 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
>     - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#9934]) +3 other tests skip
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-7/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#3637])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>     - shard-tglu-1:       NOTRUN -> [SKIP][200] ([i915#3637]) +1 other test skip
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-snb:          [PASS][201] -> [FAIL][202] ([i915#2122]) +10 other tests fail
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-snb1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-snb1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-dg2:          [PASS][203] -> [FAIL][204] ([i915#2122])
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>     - shard-rkl:          [PASS][205] -> [FAIL][206] ([i915#2122])
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-rkl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>     - shard-dg1:          [PASS][207] -> [FAIL][208] ([i915#12517] / [i915#2122])
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg1-12/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-13/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3:
>     - shard-dg1:          [PASS][209] -> [FAIL][210] ([i915#12517]) +1 other test fail
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg1-12/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3.html
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-13/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1:
>     - shard-dg2:          NOTRUN -> [FAIL][211] ([i915#2122]) +1 other test fail
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-4/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html
>     - shard-rkl:          NOTRUN -> [FAIL][212] ([i915#2122]) +2 other tests fail
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3:
>     - shard-dg1:          [PASS][213] -> [FAIL][214] ([i915#12702])
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg1-12/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3.html
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-13/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a4:
>     - shard-dg1:          [PASS][215] -> [FAIL][216] ([i915#79]) +1 other test fail
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg1-14/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a4.html
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-14/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a4.html
> 
>   * igt@kms_flip@plain-flip-ts-check:
>     - shard-rkl:          [PASS][217] -> [FAIL][218] ([i915#12457] / [i915#2122])
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-rkl-1/igt@kms_flip@plain-flip-ts-check.html
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-7/igt@kms_flip@plain-flip-ts-check.html
>     - shard-tglu:         [PASS][219] -> [FAIL][220] ([i915#2122]) +1 other test fail
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-tglu-6/igt@kms_flip@plain-flip-ts-check.html
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-2/igt@kms_flip@plain-flip-ts-check.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#2672] / [i915#3555]) +2 other tests skip
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
>     - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#2672] / [i915#3555] / [i915#8813])
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#2672] / [i915#8813])
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#2587] / [i915#2672]) +2 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#2672] / [i915#3555]) +2 other tests skip
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>     - shard-tglu-1:       NOTRUN -> [SKIP][226] ([i915#2587] / [i915#2672] / [i915#3555])
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#2672]) +6 other tests skip
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][228] ([i915#2587] / [i915#2672]) +1 other test skip
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>     - shard-dg1:          [PASS][229] -> [DMESG-WARN][230] ([i915#4423])
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][231] ([i915#2587] / [i915#2672]) +1 other test skip
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
>     - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-tglu-1:       NOTRUN -> [SKIP][233] ([i915#2672] / [i915#3555])
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
>     - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#3555] / [i915#8810] / [i915#8813])
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#3555] / [i915#8810])
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2:          [PASS][237] -> [FAIL][238] ([i915#6880])
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#8708])
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>     - shard-snb:          [PASS][240] -> [SKIP][241] +3 other tests skip
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#5354]) +39 other tests skip
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#1825]) +7 other tests skip
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#1825]) +9 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#8708]) +12 other tests skip
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][246] +73 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#10433] / [i915#3458])
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#8708]) +14 other tests skip
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][249] +38 other tests skip
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#3458]) +14 other tests skip
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
>     - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#3023]) +9 other tests skip
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#5439])
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
>     - shard-tglu:         NOTRUN -> [SKIP][253] +58 other tests skip
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#3458]) +16 other tests skip
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
>     - shard-tglu-1:       NOTRUN -> [SKIP][255] +47 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html
> 
>   * igt@kms_getfb@getfb-handle-closed:
>     - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#2575]) +109 other tests skip
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@kms_getfb@getfb-handle-closed.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#3555] / [i915#8228])
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-9/igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-tglu-1:       NOTRUN -> [SKIP][258] ([i915#3555] / [i915#8228]) +1 other test skip
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_hdr@static-swap.html
>     - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#3555] / [i915#8228])
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-18/igt@kms_hdr@static-swap.html
>     - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#3555] / [i915#8228])
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-2/igt@kms_hdr@static-swap.html
>     - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#3555] / [i915#8228])
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-2/igt@kms_hdr@static-swap.html
>     - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#3555] / [i915#8228])
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-5/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#10656])
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-12/igt@kms_joiner@basic-big-joiner.html
>     - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#10656])
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-2/igt@kms_joiner@basic-big-joiner.html
>     - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#10656])
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-1/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#12394])
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-6/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-tglu-1:       NOTRUN -> [SKIP][267] ([i915#10656])
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#12388])
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>     - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#12388])
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-14/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>     - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#12388])
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#12394])
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-13/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#4816])
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>     - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#1839])
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-13/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#6301])
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-1/igt@kms_panel_fitting@atomic-fastset.html
>     - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#6301])
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-16/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#6301])
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-3/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_plane_alpha_blend@alpha-opaque-fb:
>     - shard-dg2:          [PASS][277] -> [SKIP][278] ([i915#2575]) +133 other tests skip
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-6/igt@kms_plane_alpha_blend@alpha-opaque-fb.html
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@kms_plane_alpha_blend@alpha-opaque-fb.html
> 
>   * igt@kms_plane_lowres@tiling-none:
>     - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#11614] / [i915#3582]) +1 other test skip
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-5/igt@kms_plane_lowres@tiling-none.html
> 
>   * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][280] ([i915#10226] / [i915#11614] / [i915#3582]) +2 other tests skip
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-5/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#3555] / [i915#8806])
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-2/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-tglu:         NOTRUN -> [FAIL][282] ([i915#8292]) +1 other test fail
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-3/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2:          NOTRUN -> [FAIL][283] ([i915#8292])
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
>     - shard-tglu-1:       NOTRUN -> [SKIP][284] ([i915#12247]) +8 other tests skip
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
>     - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#12247]) +23 other tests skip
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
>     - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#12247] / [i915#12504]) +3 other tests skip
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
>     - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#12247]) +5 other tests skip
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>     - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#12247] / [i915#6953]) +1 other test skip
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
>     - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#12247]) +12 other tests skip
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75:
>     - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#2575] / [i915#9423]) +2 other tests skip
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
>     - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#12247] / [i915#6953] / [i915#9423])
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][292] ([i915#12247] / [i915#6953])
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25:
>     - shard-dg2:          [PASS][293] -> [SKIP][294] ([i915#2575] / [i915#9423]) +5 other tests skip
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#5354])
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-17/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#9685])
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
>     - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#9685])
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][298] ([i915#9685])
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#3361])
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html
>     - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#4281])
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-9/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_lpsp@screens-disabled:
>     - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#8430])
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-14/igt@kms_pm_lpsp@screens-disabled.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#9519])
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-2/igt@kms_pm_rpm@dpms-lpsp.html
>     - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#9519])
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html
>     - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#9519])
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-18/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-dg2:          [PASS][305] -> [SKIP][306] ([i915#9519])
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-rkl:          [PASS][307] -> [SKIP][308] ([i915#9519]) +2 other tests skip
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_prime@basic-crc-vgem:
>     - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#6524] / [i915#6805])
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-4/igt@kms_prime@basic-crc-vgem.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#6524]) +1 other test skip
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-3/igt@kms_prime@d3hot.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#11520]) +10 other tests skip
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][312] ([i915#9808])
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
>     - shard-mtlp:         NOTRUN -> [SKIP][313] ([i915#12316]) +2 other tests skip
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
>     - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#11520]) +3 other tests skip
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-17/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#11520]) +5 other tests skip
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
>     - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#11520]) +2 other tests skip
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
>     - shard-tglu-1:       NOTRUN -> [SKIP][317] ([i915#11520]) +3 other tests skip
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
>     - shard-snb:          NOTRUN -> [SKIP][318] ([i915#11520]) +2 other tests skip
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-snb5/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#9683])
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-8/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-tglu-1:       NOTRUN -> [SKIP][320] ([i915#9683])
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.html
>     - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#9683])
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-17/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr2-primary-render:
>     - shard-mtlp:         NOTRUN -> [SKIP][322] ([i915#9688]) +8 other tests skip
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-4/igt@kms_psr@fbc-psr2-primary-render.html
> 
>   * igt@kms_psr@pr-basic:
>     - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#9732]) +16 other tests skip
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-3/igt@kms_psr@pr-basic.html
> 
>   * igt@kms_psr@psr-cursor-render:
>     - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#1072] / [i915#9732]) +27 other tests skip
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-10/igt@kms_psr@psr-cursor-render.html
> 
>   * igt@kms_psr@psr-sprite-plane-move:
>     - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#1072] / [i915#9732]) +12 other tests skip
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-3/igt@kms_psr@psr-sprite-plane-move.html
> 
>   * igt@kms_psr@psr2-cursor-blt@edp-1:
>     - shard-mtlp:         [PASS][326] -> [FAIL][327] ([i915#12432]) +1 other test fail
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-mtlp-7/igt@kms_psr@psr2-cursor-blt@edp-1.html
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-5/igt@kms_psr@psr2-cursor-blt@edp-1.html
> 
>   * igt@kms_psr@psr2-primary-mmap-cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#1072] / [i915#9732]) +25 other tests skip
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-14/igt@kms_psr@psr2-primary-mmap-cpu.html
> 
>   * igt@kms_psr@psr2-suspend:
>     - shard-tglu-1:       NOTRUN -> [SKIP][329] ([i915#9732]) +10 other tests skip
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_psr@psr2-suspend.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg1:          NOTRUN -> [SKIP][330] ([i915#9685])
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-17/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>     - shard-dg1:          NOTRUN -> [SKIP][331] ([i915#5289])
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-16/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#2575] / [i915#5190]) +3 other tests skip
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-tglu-1:       NOTRUN -> [SKIP][333] ([i915#5289]) +1 other test skip
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-tglu:         NOTRUN -> [SKIP][334] ([i915#5289]) +1 other test skip
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-rkl:          NOTRUN -> [SKIP][335] ([i915#5289])
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#12755] / [i915#5190])
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-dg1:          NOTRUN -> [SKIP][337] ([i915#3555]) +4 other tests skip
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-16/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#3555]) +6 other tests skip
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-3/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-tglu-1:       NOTRUN -> [SKIP][339] ([i915#8623])
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-dg2:          NOTRUN -> [SKIP][340] ([i915#9906])
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-10/igt@kms_vrr@max-min.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-tglu:         NOTRUN -> [SKIP][341] ([i915#2437])
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-5/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2:          NOTRUN -> [SKIP][342] ([i915#2437] / [i915#9412])
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>     - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#2437] / [i915#9412])
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][344] ([i915#2437] / [i915#9412]) +1 other test skip
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>     - shard-dg1:          NOTRUN -> [SKIP][345] ([i915#2437] / [i915#9412])
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-18/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>     - shard-mtlp:         NOTRUN -> [SKIP][346] ([i915#2437] / [i915#9412])
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@perf@mi-rpc:
>     - shard-dg1:          NOTRUN -> [SKIP][347] ([i915#2434])
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-17/igt@perf@mi-rpc.html
> 
>   * igt@perf@non-zero-reason:
>     - shard-dg2:          NOTRUN -> [FAIL][348] ([i915#7484]) +1 other test fail
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-3/igt@perf@non-zero-reason.html
> 
>   * igt@perf_pmu@busy-accuracy-98:
>     - shard-snb:          NOTRUN -> [SKIP][349] +120 other tests skip
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-snb4/igt@perf_pmu@busy-accuracy-98.html
> 
>   * igt@perf_pmu@frequency@gt0:
>     - shard-dg2:          NOTRUN -> [FAIL][350] ([i915#12549] / [i915#6806]) +1 other test fail
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-3/igt@perf_pmu@frequency@gt0.html
> 
>   * igt@perf_pmu@invalid-init:
>     - shard-dg2:          [PASS][351] -> [SKIP][352] ([i915#12506]) +4 other tests skip
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-10/igt@perf_pmu@invalid-init.html
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@perf_pmu@invalid-init.html
> 
>   * igt@perf_pmu@rc6@other-idle-gt0:
>     - shard-dg2:          NOTRUN -> [SKIP][353] ([i915#8516])
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-7/igt@perf_pmu@rc6@other-idle-gt0.html
>     - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#8516])
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-5/igt@perf_pmu@rc6@other-idle-gt0.html
> 
>   * igt@prime_vgem@fence-write-hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][355] ([i915#3708])
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-1/igt@prime_vgem@fence-write-hang.html
>     - shard-dg1:          NOTRUN -> [SKIP][356] ([i915#3708])
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-12/igt@prime_vgem@fence-write-hang.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-tglu:         NOTRUN -> [SKIP][357] ([i915#9917]) +1 other test skip
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_getversion@all-cards:
>     - shard-dg2:          [FAIL][358] ([i915#12869]) -> [PASS][359]
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-11/igt@core_getversion@all-cards.html
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-7/igt@core_getversion@all-cards.html
> 
>   * igt@fbdev@eof:
>     - shard-dg2:          [SKIP][360] ([i915#2582]) -> [PASS][361] +1 other test pass
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-11/igt@fbdev@eof.html
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-3/igt@fbdev@eof.html
> 
>   * igt@gem_ctx_engines@invalid-engines:
>     - shard-rkl:          [FAIL][362] ([i915#12031]) -> [PASS][363]
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-rkl-5/igt@gem_ctx_engines@invalid-engines.html
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-7/igt@gem_ctx_engines@invalid-engines.html
> 
>   * igt@gem_userptr_blits@sync-unmap:
>     - shard-dg2:          [SKIP][364] ([i915#2575]) -> [PASS][365] +122 other tests pass
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-11/igt@gem_userptr_blits@sync-unmap.html
>    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-10/igt@gem_userptr_blits@sync-unmap.html
> 
>   * igt@i915_module_load@reload:
>     - shard-dg2:          [FAIL][366] ([i915#12870]) -> [PASS][367]
>    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-11/igt@i915_module_load@reload.html
>    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-1/igt@i915_module_load@reload.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-snb:          [ABORT][368] ([i915#9820]) -> [PASS][369]
>    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html
>    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_rpm@system-suspend-execbuf:
>     - shard-dg1:          [ABORT][370] ([i915#12773]) -> [PASS][371]
>    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg1-14/igt@i915_pm_rpm@system-suspend-execbuf.html
>    [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-13/igt@i915_pm_rpm@system-suspend-execbuf.html
> 
>   * igt@i915_pm_rps@waitboost:
>     - shard-dg2:          [FAIL][372] ([i915#12871]) -> [PASS][373]
>    [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-2/igt@i915_pm_rps@waitboost.html
>    [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-8/igt@i915_pm_rps@waitboost.html
>     - shard-dg1:          [FAIL][374] ([i915#12868]) -> [PASS][375]
>    [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg1-12/igt@i915_pm_rps@waitboost.html
>    [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-13/igt@i915_pm_rps@waitboost.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - shard-dg1:          [FAIL][376] ([i915#5956]) -> [PASS][377]
>    [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg1-12/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
>    [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-17/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
>     - shard-dg2:          [SKIP][378] -> [PASS][379] +24 other tests pass
>    [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-11/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html
>    [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_flip@blocking-wf_vblank:
>     - shard-rkl:          [FAIL][380] ([i915#10826] / [i915#11961] / [i915#2122]) -> [PASS][381]
>    [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-rkl-6/igt@kms_flip@blocking-wf_vblank.html
>    [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-4/igt@kms_flip@blocking-wf_vblank.html
> 
>   * igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:
>     - shard-tglu:         [FAIL][382] ([i915#2122]) -> [PASS][383] +7 other tests pass
>    [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-tglu-4/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html
>    [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-tglu-2/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg1:          [INCOMPLETE][384] ([i915#4839] / [i915#6113]) -> [PASS][385]
>    [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg1-19/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-19/igt@kms_flip@flip-vs-suspend-interruptible.html
>     - shard-mtlp:         [INCOMPLETE][386] ([i915#6113]) -> [PASS][387]
>    [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-mtlp-5/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
>     - shard-dg2:          [INCOMPLETE][388] ([i915#4839] / [i915#6113]) -> [PASS][389]
>    [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-8/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-3/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@d-edp1:
>     - shard-mtlp:         [INCOMPLETE][390] ([i915#10056] / [i915#6113]) -> [PASS][391]
>    [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-mtlp-5/igt@kms_flip@flip-vs-suspend-interruptible@d-edp1.html
>    [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-8/igt@kms_flip@flip-vs-suspend-interruptible@d-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a4:
>     - shard-dg1:          [INCOMPLETE][392] ([i915#6113]) -> [PASS][393]
>    [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg1-19/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a4.html
>    [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-19/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a4.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-vga1:
>     - shard-snb:          [DMESG-WARN][394] -> [PASS][395] +1 other test pass
>    [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-snb6/igt@kms_flip@flip-vs-suspend@b-vga1.html
>    [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-snb5/igt@kms_flip@flip-vs-suspend@b-vga1.html
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible:
>     - shard-dg2:          [FAIL][396] ([i915#2122]) -> [PASS][397]
>    [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-1/igt@kms_flip@wf_vblank-ts-check-interruptible.html
>    [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-8/igt@kms_flip@wf_vblank-ts-check-interruptible.html
>     - shard-rkl:          [FAIL][398] ([i915#2122]) -> [PASS][399] +2 other tests pass
>    [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-rkl-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html
>    [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-3/igt@kms_flip@wf_vblank-ts-check-interruptible.html
>     - shard-dg1:          [FAIL][400] ([i915#12517] / [i915#2122]) -> [PASS][401]
>    [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg1-16/igt@kms_flip@wf_vblank-ts-check-interruptible.html
>    [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg1-13/igt@kms_flip@wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:
>     - shard-mtlp:         [FAIL][402] ([i915#2122]) -> [PASS][403] +3 other tests pass
>    [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-mtlp-1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html
>    [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1:
>     - shard-snb:          [FAIL][404] ([i915#2122]) -> [PASS][405] +2 other tests pass
>    [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-snb7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html
>    [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-snb2/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:
>     - shard-dg2:          [FAIL][406] ([i915#6880]) -> [PASS][407]
>    [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html
>    [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
>     - shard-snb:          [SKIP][408] -> [PASS][409] +1 other test pass
>    [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
>    [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
>     - shard-dg2:          [SKIP][410] ([i915#2575] / [i915#9423]) -> [PASS][411] +3 other tests pass
>    [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
>    [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-rkl:          [SKIP][412] ([i915#9519]) -> [PASS][413] +4 other tests pass
>    [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>    [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@perf_pmu@all-busy-idle-check-all:
>     - shard-dg2:          [SKIP][414] ([i915#12506]) -> [PASS][415] +9 other tests pass
>    [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-11/igt@perf_pmu@all-busy-idle-check-all.html
>    [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-7/igt@perf_pmu@all-busy-idle-check-all.html
> 
>   
> #### Warnings ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg2:          [SKIP][416] ([i915#2575]) -> [SKIP][417] ([i915#8411])
>    [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html
>    [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-3/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-dg2:          [SKIP][418] -> [SKIP][419] ([i915#11078])
>    [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-11/igt@device_reset@unbind-cold-reset-rebind.html
>    [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-10/igt@device_reset@unbind-cold-reset-rebind.html
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all:
>     - shard-dg2:          [SKIP][420] ([i915#12506]) -> [SKIP][421] ([i915#8414]) +1 other test skip
>    [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-11/igt@drm_fdinfo@most-busy-idle-check-all.html
>    [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-4/igt@drm_fdinfo@most-busy-idle-check-all.html
> 
>   * igt@drm_fdinfo@virtual-busy-all:
>     - shard-dg2:          [SKIP][422] ([i915#8414]) -> [SKIP][423] ([i915#12506])
>    [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-2/igt@drm_fdinfo@virtual-busy-all.html
>    [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@drm_fdinfo@virtual-busy-all.html
> 
>   * igt@gem_busy@close-race:
>     - shard-dg2:          [FAIL][424] ([i915#12296] / [i915#12577]) -> [SKIP][425] ([i915#2575])
>    [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-3/igt@gem_busy@close-race.html
>    [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@gem_busy@close-race.html
> 
>   * igt@gem_create@create-ext-cpu-access-big:
>     - shard-dg2:          [ABORT][426] ([i915#9846]) -> [SKIP][427] ([i915#2575])
>    [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-7/igt@gem_create@create-ext-cpu-access-big.html
>    [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html
> 
>   * igt@gem_ctx_persistence@heartbeat-stop:
>     - shard-dg2:          [SKIP][428] ([i915#8555]) -> [SKIP][429] ([i915#2575])
>    [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-3/igt@gem_ctx_persistence@heartbeat-stop.html
>    [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-stop.html
> 
>   * igt@gem_ctx_persistence@hostile:
>     - shard-dg2:          [SKIP][430] ([i915#2575]) -> [FAIL][431] ([i915#11980] / [i915#12580])
>    [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-11/igt@gem_ctx_persistence@hostile.html
>    [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-8/igt@gem_ctx_persistence@hostile.html
> 
>   * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
>     - shard-dg2:          [SKIP][432] ([i915#5882]) -> [SKIP][433] ([i915#2575])
>    [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html
>    [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html
> 
>   * igt@gem_ctx_sseu@engines:
>     - shard-dg2:          [SKIP][434] ([i915#2575]) -> [SKIP][435] ([i915#280])
>    [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-11/igt@gem_ctx_sseu@engines.html
>    [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-1/igt@gem_ctx_sseu@engines.html
> 
>   * igt@gem_exec_balancer@bonded-sync:
>     - shard-dg2:          [SKIP][436] ([i915#2575]) -> [SKIP][437] ([i915#4771])
>    [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html
>    [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-10/igt@gem_exec_balancer@bonded-sync.html
> 
>   * igt@gem_exec_balancer@bonded-true-hang:
>     - shard-dg2:          [SKIP][438] ([i915#2575]) -> [SKIP][439] ([i915#4812]) +1 other test skip
>    [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html
>    [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-2/igt@gem_exec_balancer@bonded-true-hang.html
> 
>   * igt@gem_exec_balancer@nop:
>     - shard-mtlp:         [DMESG-WARN][440] ([i915#12412]) -> [DMESG-WARN][441] ([i915#12830])
>    [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-mtlp-8/igt@gem_exec_balancer@nop.html
>    [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-mtlp-1/igt@gem_exec_balancer@nop.html
> 
>   * igt@gem_exec_fair@basic-throttle:
>     - shard-dg2:          [SKIP][442] ([i915#3539]) -> [SKIP][443] ([i915#2575]) +1 other test skip
>    [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-1/igt@gem_exec_fair@basic-throttle.html
>    [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/shard-dg2-11/igt@gem_exec_fair@basic-throttle.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-uc:
>     - shard-dg2:          [SKIP][444] ([i915#2575]) -> [SKIP][445] ([i915#3539] / [i915#4852]) +1 other test skip
>    [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8114/shard-dg2-11/igt@gem_exec_flush@basic-batch-kernel-default-uc.ht
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12116/index.html
> 




