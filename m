Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A01CD128A
	for <igt-dev@archiver.kernel.org>; Mon,  8 Apr 2024 08:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A34112295;
	Mon,  8 Apr 2024 08:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FP3f5YFC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736B0112295
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2024 08:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712565307; x=1744101307;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eL6nSBFF6Aq8Dgb/TNRIiyq3MGyy/g1TtyXcTr2v+KQ=;
 b=FP3f5YFChvW7/6ZZZ/uuuqLXOCXp8Wdszkol1GxJVJ7ee0PWQ6gZgzr8
 f+zbbrb4LwOrvkryzL+OKCmBDdsH9dCcIA8gd+MzoysbFKjYhBVjJRJvl
 X9Dp59jQDjGr1tXGaWiME19ZKarYnEOlyOuRANcBtHbmP/UysKhH8Tvc4
 sqb5l4v3JOg9NFSJWxmPPiWAi6diozzer/8/QcR6lmc5Sw5Q7uTTngoKm
 BBkz1AuKQWRWWdg+yilBMK5WrxbVTSOf8wzpDMNbs8sv33IhUkAPo34IY
 P7jLrKDVXd2OF0I5zAMDg6EoUM63Vd4tFv9pKd1IAg48lF9bBr++qxIaY w==;
X-CSE-ConnectionGUID: Xlsf9xQrShCy6S3yP+6lNw==
X-CSE-MsgGUID: yLglYAQWRO2nzIECCFXeoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="10802751"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="10802751"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 01:34:24 -0700
X-CSE-ConnectionGUID: RPq0lDJMRKChXohGGz4sNA==
X-CSE-MsgGUID: 1JwyldnoRKqee2lwK8ADzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19768467"
Received: from msobrero-mobl1.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.ger.corp.intel.com) ([10.213.18.147])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 01:34:23 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: lgci.bug.filing@intel.com
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: =?UTF-8?B?4pyX?= Fi.CI.BAT: failure for lib/kunit: Read results
 from debugfs (rev2)
Date: Mon, 08 Apr 2024 10:34:19 +0200
Message-ID: <12411462.O9o76ZdvQC@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <171234254181.1239329.11069845657292552921@8e613ede5ea5>
References: <20240405175544.6047-2-janusz.krzysztofik@linux.intel.com>
 <171234254181.1239329.11069845657292552921@8e613ede5ea5>
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

Hi BUG Filing,

On Friday, 5 April 2024 20:42:21 CEST Patchwork wrote:
> == Series Details ==
> 
> Series: lib/kunit: Read results from debugfs (rev2)
> URL   : https://patchwork.freedesktop.org/series/131686/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14536 -> IGTPW_10985
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10985 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10985, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/index.html
> 
> Participating hosts (37 -> 38)
> ------------------------------
> 
>   Additional (3): fi-kbl-8809g bat-mtlp-8 bat-arls-3 
>   Missing    (2): bat-kbl-2 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10985:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@vgem_basic@dmabuf-fence:
>     - bat-arls-2:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14536/bat-arls-2/igt@vgem_basic@dmabuf-fence.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-arls-2/igt@vgem_basic@dmabuf-fence.html

This has nothing to do with changes to IGT Kunit library introduced by the 
patch, please update filters and re-report.

Thanks,
Janusz

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@i915_selftest@live@coherency:
>     - {bat-mtlp-9}:       [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14536/bat-mtlp-9/igt@i915_selftest@live@coherency.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-mtlp-9/igt@i915_selftest@live@coherency.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10985 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][5] ([i915#9318])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html
>     - bat-arls-3:         NOTRUN -> [SKIP][6] ([i915#9318])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-arls-3/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-arls-3:         NOTRUN -> [SKIP][7] ([i915#10213]) +3 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-arls-3/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][8] ([i915#4613]) +3 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-mtlp-8/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@gem_mmap@basic:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][9] ([i915#4083])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-mtlp-8/igt@gem_mmap@basic.html
>     - bat-arls-3:         NOTRUN -> [SKIP][10] ([i915#4083])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-arls-3/igt@gem_mmap@basic.html
> 
>   * igt@gem_mmap_gtt@basic:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][11] ([i915#4077]) +2 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-mtlp-8/igt@gem_mmap_gtt@basic.html
> 
>   * igt@gem_render_tiled_blits@basic:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][12] ([i915#4079]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html
>     - bat-arls-3:         NOTRUN -> [SKIP][13] ([i915#10197] / [i915#10211] / [i915#4079])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-arls-3/igt@gem_render_tiled_blits@basic.html
> 
>   * igt@gem_tiled_blits@basic:
>     - bat-arls-3:         NOTRUN -> [SKIP][14] ([i915#10196] / [i915#4077]) +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-arls-3/igt@gem_tiled_blits@basic.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-arls-3:         NOTRUN -> [SKIP][15] ([i915#10206] / [i915#4079])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-arls-3/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][16] ([i915#6621])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-mtlp-8/igt@i915_pm_rps@basic-api.html
>     - bat-arls-3:         NOTRUN -> [SKIP][17] ([i915#10209])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-arls-3/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-dg2-8:          [PASS][18] -> [ABORT][19] ([i915#10366])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14536/bat-dg2-8/igt@i915_selftest@live@workarounds.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-dg2-8/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>     - bat-arls-3:         NOTRUN -> [SKIP][20] ([i915#10200]) +9 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-arls-3/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][21] ([i915#5190])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][22] ([i915#4212]) +8 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - bat-arls-3:         NOTRUN -> [SKIP][23] ([i915#10202]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-arls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][24] ([i915#4213]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-arls-3:         NOTRUN -> [SKIP][25] ([i915#9886])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-arls-3/igt@kms_dsc@dsc-basic.html
>     - bat-mtlp-8:         NOTRUN -> [SKIP][26] ([i915#3555] / [i915#3840] / [i915#9159])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-mtlp-8/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-arls-3:         NOTRUN -> [SKIP][27] ([i915#10207])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-arls-3/igt@kms_force_connector_basic@force-load-detect.html
>     - bat-mtlp-8:         NOTRUN -> [SKIP][28]
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][29] ([i915#5274])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - bat-arls-3:         NOTRUN -> [SKIP][30] ([i915#9812])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-arls-3/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_psr@psr-primary-mmap-gtt:
>     - bat-arls-3:         NOTRUN -> [SKIP][31] ([i915#9732]) +3 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-arls-3/igt@kms_psr@psr-primary-mmap-gtt.html
> 
>   * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][32] ([i915#4077] / [i915#9688])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-mtlp-8/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][33] ([i915#3555] / [i915#8809])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-arls-3:         NOTRUN -> [SKIP][34] ([i915#10208] / [i915#8809])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-arls-3/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-mmap:
>     - bat-arls-3:         NOTRUN -> [SKIP][35] ([i915#10196] / [i915#3708] / [i915#4077]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-arls-3/igt@prime_vgem@basic-fence-mmap.html
>     - bat-mtlp-8:         NOTRUN -> [SKIP][36] ([i915#3708] / [i915#4077]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-mtlp-8/igt@prime_vgem@basic-fence-mmap.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][37] ([i915#3708]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html
>     - bat-arls-3:         NOTRUN -> [SKIP][38] ([i915#10212] / [i915#3708])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-arls-3/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@basic-read:
>     - bat-arls-3:         NOTRUN -> [SKIP][39] ([i915#10214] / [i915#3708])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-arls-3/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][40] ([i915#10216] / [i915#3708])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-mtlp-8/igt@prime_vgem@basic-write.html
>     - bat-arls-3:         NOTRUN -> [SKIP][41] ([i915#10216] / [i915#3708])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-arls-3/igt@prime_vgem@basic-write.html
> 
>   * igt@runner@aborted:
>     - fi-kbl-8809g:       NOTRUN -> [FAIL][42] ([i915#10689])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/fi-kbl-8809g/igt@runner@aborted.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_module_load@load:
>     - bat-dg2-8:          [DMESG-WARN][43] ([i915#10014]) -> [PASS][44]
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14536/bat-dg2-8/igt@i915_module_load@load.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-dg2-8/igt@i915_module_load@load.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-adlp-6:         [INCOMPLETE][45] ([i915#9413]) -> [PASS][46]
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14536/bat-adlp-6/igt@i915_selftest@live@workarounds.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/bat-adlp-6/igt@i915_selftest@live@workarounds.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#10014]: https://gitlab.freedesktop.org/drm/intel/issues/10014
>   [i915#10196]: https://gitlab.freedesktop.org/drm/intel/issues/10196
>   [i915#10197]: https://gitlab.freedesktop.org/drm/intel/issues/10197
>   [i915#10200]: https://gitlab.freedesktop.org/drm/intel/issues/10200
>   [i915#10202]: https://gitlab.freedesktop.org/drm/intel/issues/10202
>   [i915#10206]: https://gitlab.freedesktop.org/drm/intel/issues/10206
>   [i915#10207]: https://gitlab.freedesktop.org/drm/intel/issues/10207
>   [i915#10208]: https://gitlab.freedesktop.org/drm/intel/issues/10208
>   [i915#10209]: https://gitlab.freedesktop.org/drm/intel/issues/10209
>   [i915#10211]: https://gitlab.freedesktop.org/drm/intel/issues/10211
>   [i915#10212]: https://gitlab.freedesktop.org/drm/intel/issues/10212
>   [i915#10213]: https://gitlab.freedesktop.org/drm/intel/issues/10213
>   [i915#10214]: https://gitlab.freedesktop.org/drm/intel/issues/10214
>   [i915#10216]: https://gitlab.freedesktop.org/drm/intel/issues/10216
>   [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
>   [i915#10689]: https://gitlab.freedesktop.org/drm/intel/issues/10689
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
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
>   [i915#9159]: https://gitlab.freedesktop.org/drm/intel/issues/9159
>   [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
>   [i915#9413]: https://gitlab.freedesktop.org/drm/intel/issues/9413
>   [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
>   [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
>   [i915#9812]: https://gitlab.freedesktop.org/drm/intel/issues/9812
>   [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7801 -> IGTPW_10985
> 
>   CI-20190529: 20190529
>   CI_DRM_14536: 8cb1ee178ef7e504e233814ef50c1f18f42dac72 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10985: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/index.html
>   IGT_7801: 7801
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10985/index.html
> 




