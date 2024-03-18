Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BC3C54E5D
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 12:34:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B743810F6B5;
	Mon, 18 Mar 2024 12:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HMeSDEbX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFF510F6B2;
 Mon, 18 Mar 2024 12:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710765286; x=1742301286;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=67H2D6f23HR4zb3NKo6HX6SLxm/Q7kj1PRMLtUwVuZw=;
 b=HMeSDEbX18YeL9uriRHcRuN0o/mWle9Kt+v/icR2WuNqyHl1JDpaPARZ
 zOtQqQWujzesE5LMNsJKGRimpEdAxBHCji2oMLw6QhJCPlLF+AZatsM12
 PG9nd2EmDHnUxJTUsZM1M7bHimvsyp7Nt10u5EWUt1XWg4lCFjKM+bihr
 ihepxRSzhK8Xvgy3mADhU2bEPQxM+TlgQvrHe/ZzvcmL/wtW0ghlXnWF2
 ykcdYofoiZul/mO6fj7qqJ+7uKC+h0UrNsRmQFmL/4ZI8By2/pChw6LyD
 Gc1Iq9trOFZjZQtfs6fksXTX44/Dm4q4R6EWbEADEava+IyRuMfoFZYgN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5697815"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5697815"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 05:34:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="17944939"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 05:34:44 -0700
Date: Mon, 18 Mar 2024 13:34:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 tests/intel/xe_ccs: fix bo size for ccs
Message-ID: <20240318123441.qm4xevayffhjmdrs@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240315162701.309560-1-matthew.auld@intel.com>
 <171052400459.812644.3028996086955521975@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171052400459.812644.3028996086955521975@8e613ede5ea5>
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
On 2024-03-15 at 17:33:24 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_ccs: fix bo size for ccs
> URL   : https://patchwork.freedesktop.org/series/131194/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14440 -> IGTPW_10847
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10847 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10847, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/index.html
> 
> Participating hosts (35 -> 35)
> ------------------------------
> 
>   Additional (1): bat-mtlp-8 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10847:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@dmabuf@all-tests@dma_fence_chain:
>     - fi-kbl-8809g:       [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14440/fi-kbl-8809g/igt@dmabuf@all-tests@dma_fence_chain.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/fi-kbl-8809g/igt@dmabuf@all-tests@dma_fence_chain.html
> 
>   * igt@i915_selftest@live@reset:
>     - bat-arls-1:         [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14440/bat-arls-1/igt@i915_selftest@live@reset.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-arls-1/igt@i915_selftest@live@reset.html
> 

These are unrelated to Xe test change,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10847 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][5] ([i915#9318])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][6] ([i915#4613]) +3 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-mtlp-8/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@gem_mmap@basic:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][7] ([i915#4083])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-mtlp-8/igt@gem_mmap@basic.html
> 
>   * igt@gem_mmap_gtt@basic:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][8] ([i915#4077]) +2 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-mtlp-8/igt@gem_mmap_gtt@basic.html
> 
>   * igt@gem_render_tiled_blits@basic:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][9] ([i915#4079]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][10] ([i915#6621])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-mtlp-8/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live@memory_region:
>     - bat-dg2-14:         [PASS][11] -> [ABORT][12] ([i915#10366])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14440/bat-dg2-14/igt@i915_selftest@live@memory_region.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-dg2-14/igt@i915_selftest@live@memory_region.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-dg2-9:          [PASS][13] -> [DMESG-FAIL][14] ([i915#9500])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14440/bat-dg2-9/igt@i915_selftest@live@workarounds.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-dg2-9/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][15] ([i915#5190])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][16] ([i915#4212]) +8 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][17] ([i915#4213]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][18] ([i915#3555] / [i915#3840] / [i915#9159])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-mtlp-8/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][19]
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][20] ([i915#5274])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][21] ([i915#4077] / [i915#9688])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][22] ([i915#3555] / [i915#8809])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-mmap:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][23] ([i915#3708] / [i915#4077]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-mtlp-8/igt@prime_vgem@basic-fence-mmap.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][24] ([i915#3708]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][25] ([i915#10216] / [i915#3708])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-mtlp-8/igt@prime_vgem@basic-write.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - {bat-mtlp-9}:       [CRASH][26] -> [PASS][27]
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14440/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-rpls-3:         [DMESG-WARN][28] ([i915#5591]) -> [PASS][29]
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14440/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#10216]: https://gitlab.freedesktop.org/drm/intel/issues/10216
>   [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
>   [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
>   [i915#9159]: https://gitlab.freedesktop.org/drm/intel/issues/9159
>   [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
>   [i915#9500]: https://gitlab.freedesktop.org/drm/intel/issues/9500
>   [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7768 -> IGTPW_10847
> 
>   CI-20190529: 20190529
>   CI_DRM_14440: 22ba12a6eded33d40fba58b4dac24a1e2bdc4b25 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10847: 10847
>   IGT_7768: 7768
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10847/index.html
