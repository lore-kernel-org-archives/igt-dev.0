Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5E6C3DA59
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 12:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1F910E3C2;
	Mon, 22 Jul 2024 12:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AWENiHHm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510D310E3C2
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jul 2024 12:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721652758; x=1753188758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Pv8/jyIWjBsZd9If2KoAI78P4Khry5v8XHrWgB0MTY=;
 b=AWENiHHm++cNDpdKpHX9mSalzAOu37wCQDmoiny0rZPJ534THh/6FUUG
 5K5CTND7Y4y5JoY3WXHxR+SCVcJYoExMqz+0Qdh8ye6U48k7VSEgg5Jun
 5hKhKksREwWk6lF/PpdoAscala7GcfczxrxeMBqI2kLlelQHFrerDMIGp
 g9CyaEnJIhmvDVhqz4f1nKvoc8ATbzo35Y/iqYm01ZZhSQp41Mc6EDdEo
 SkssB38EEPPmTSijU4TmVi75r1VIWvlRF0HGykrNeyt2i888HD5fGNVoy
 dEPZAwH62dFnnkod2On7hed4+Xnl5aYD5to1muUTeWgJOagXIF9dPjIAv A==;
X-CSE-ConnectionGUID: gR6beg1uS3mV1P+nqLFAZA==
X-CSE-MsgGUID: YrHqudkLReiocxDKp6cVAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="19368162"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="19368162"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 05:52:37 -0700
X-CSE-ConnectionGUID: jTjR0GX0RniYgDFbgbU4pQ==
X-CSE-MsgGUID: HJ8zskmeQ/OtS2stnylHRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="56725811"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.233])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 05:52:36 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= Fi.CI.BAT: failure for lib/kunit: Fixes and
 enhancements
Date: Mon, 22 Jul 2024 14:52:32 +0200
Message-ID: <2189354.irdbgypaU6@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <172164446740.327170.9816142662019714960@2413ebb6fbb6>
References: <20240722080913.74333-5-janusz.krzysztofik@linux.intel.com>
 <172164446740.327170.9816142662019714960@2413ebb6fbb6>
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

On Monday, 22 July 2024 12:34:27 GMT+2 Patchwork wrote:
> == Series Details ==
> 
> Series: lib/kunit: Fixes and enhancements
> URL   : https://patchwork.freedesktop.org/series/136329/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15107 -> IGTPW_11440
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11440 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11440, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/index.html
> 
> Participating hosts (35 -> 39)
> ------------------------------
> 
>   Additional (6): bat-adlp-9 bat-adlp-6 bat-dg2-14 bat-dg2-13 bat-dg2-11 bat-mtlp-6 
>   Missing    (2): fi-tgl-1115g4 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11440:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gem_contexts:
>     - bat-arls-1:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15107/bat-arls-1/igt@i915_selftest@live@gem_contexts.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-arls-1/igt@i915_selftest@live@gem_contexts.html

Hi I915-ci-infra@lists.freedesktop.org,

My series touches kunit selftests only, and that's a native i915 selftest, 
then the failure is for sure not related to my changes.  Please update your 
filters and re-report.

Thanks,
Janusz


> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11440 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-adlp-9:         NOTRUN -> [SKIP][3] ([i915#9318])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-adlp-9/igt@debugfs_test@basic-hwmon.html
>     - bat-adlp-6:         NOTRUN -> [SKIP][4] ([i915#9318])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-adlp-6/igt@debugfs_test@basic-hwmon.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][5] ([i915#9318])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@fbdev@info:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][6] ([i915#1849] / [i915#2582])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@fbdev@info.html
> 
>   * igt@fbdev@write:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][7] ([i915#2582]) +3 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@fbdev@write.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - bat-adlp-9:         NOTRUN -> [SKIP][8] ([i915#4613]) +3 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-adlp-9/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - bat-adlp-6:         NOTRUN -> [SKIP][9] ([i915#4613]) +3 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-adlp-6/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][10] ([i915#4613]) +3 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@gem_mmap@basic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][11] ([i915#4083])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-11/igt@gem_mmap@basic.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][12] ([i915#4083])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@gem_mmap@basic.html
>     - bat-dg2-14:         NOTRUN -> [SKIP][13] ([i915#4083])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-14/igt@gem_mmap@basic.html
> 
>   * igt@gem_render_tiled_blits@basic:
>     - bat-dg2-14:         NOTRUN -> [SKIP][14] ([i915#4079]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-14/igt@gem_render_tiled_blits@basic.html
> 
>   * igt@gem_tiled_blits@basic:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][15] ([i915#4077]) +2 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@gem_tiled_blits@basic.html
> 
>   * igt@gem_tiled_fence_blits@basic:
>     - bat-dg2-14:         NOTRUN -> [SKIP][16] ([i915#4077]) +2 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][17] ([i915#4077]) +2 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-adlp-6:         NOTRUN -> [SKIP][18] ([i915#3282])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-adlp-6/igt@gem_tiled_pread_basic.html
>     - bat-adlp-9:         NOTRUN -> [SKIP][19] ([i915#3282])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-adlp-9/igt@gem_tiled_pread_basic.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][20] ([i915#4079]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-11/igt@gem_tiled_pread_basic.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][21] ([i915#4079]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-adlp-9:         NOTRUN -> [SKIP][22] ([i915#6621])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-adlp-9/igt@i915_pm_rps@basic-api.html
>     - bat-dg2-14:         NOTRUN -> [SKIP][23] ([i915#6621])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-14/igt@i915_pm_rps@basic-api.html
>     - bat-adlp-6:         NOTRUN -> [SKIP][24] ([i915#6621])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-adlp-6/igt@i915_pm_rps@basic-api.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][25] ([i915#6621])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-11/igt@i915_pm_rps@basic-api.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][26] ([i915#6621])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@i915_pm_rps@basic-api.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][27] ([i915#4212] / [i915#9792]) +8 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
>     - bat-dg2-11:         NOTRUN -> [SKIP][28] ([i915#4212]) +7 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][29] ([i915#5190] / [i915#9792])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][30] ([i915#5190])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>     - bat-dg2-14:         NOTRUN -> [SKIP][31] ([i915#5190])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@basic-x-tiled-legacy:
>     - bat-dg2-14:         NOTRUN -> [SKIP][32] ([i915#4212]) +7 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-14/igt@kms_addfb_basic@basic-x-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - bat-dg2-11:         NOTRUN -> [SKIP][33] ([i915#4215] / [i915#5190])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html
>     - bat-dg2-14:         NOTRUN -> [SKIP][34] ([i915#4215] / [i915#5190])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-fast:
>     - bat-dg2-13:         NOTRUN -> [SKIP][35] ([Intel XE#484] / [i915#4550]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - bat-adlp-9:         NOTRUN -> [SKIP][36] ([i915#4103]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][37] ([i915#4103] / [i915#4213]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-dg2-14:         NOTRUN -> [SKIP][38] ([i915#4103] / [i915#4213]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>     - bat-adlp-6:         NOTRUN -> [SKIP][39] ([i915#4103]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][40] ([i915#9792]) +17 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][41] ([i915#3555] / [i915#3840])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-11/igt@kms_dsc@dsc-basic.html
>     - bat-dg2-14:         NOTRUN -> [SKIP][42] ([i915#3555] / [i915#3840])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-14/igt@kms_dsc@dsc-basic.html
>     - bat-adlp-6:         NOTRUN -> [SKIP][43] ([i915#3555] / [i915#3840])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-adlp-6/igt@kms_dsc@dsc-basic.html
>     - bat-adlp-9:         NOTRUN -> [SKIP][44] ([i915#3555] / [i915#3840])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-adlp-9/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][45] ([i915#3637] / [i915#9792]) +3 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-dg2-14:         NOTRUN -> [SKIP][46]
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html
>     - bat-adlp-6:         NOTRUN -> [SKIP][47]
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html
>     - bat-adlp-9:         NOTRUN -> [SKIP][48]
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][49]
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-dg2-11:         NOTRUN -> [SKIP][50] ([i915#5274])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][51] ([i915#5274] / [i915#9792])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html
>     - bat-dg2-14:         NOTRUN -> [SKIP][52] ([i915#5274])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][53] ([i915#4342] / [i915#5354] / [i915#9792])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - bat-dg2-11:         NOTRUN -> [SKIP][54] ([i915#5354])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html
>     - bat-dg2-14:         NOTRUN -> [SKIP][55] ([i915#5354])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][56] ([i915#5354] / [i915#9792])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html
>     - bat-adlp-9:         NOTRUN -> [SKIP][57] ([i915#9812])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_psr@psr-cursor-plane-move:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][58] ([i915#1072] / [i915#9673] / [i915#9732] / [i915#9792]) +3 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - bat-adlp-9:         NOTRUN -> [SKIP][59] ([i915#1072] / [i915#9673] / [i915#9732]) +3 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][60] ([i915#1072] / [i915#9732]) +3 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html
>     - bat-dg2-14:         NOTRUN -> [SKIP][61] ([i915#1072] / [i915#9732]) +3 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-adlp-9:         NOTRUN -> [SKIP][62] ([i915#3555])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-dg2-14:         NOTRUN -> [SKIP][63] ([i915#3555])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-adlp-6:         NOTRUN -> [SKIP][64] ([i915#3555])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][65] ([i915#3555])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][66] ([i915#3555] / [i915#8809] / [i915#9792])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-flip:
>     - bat-dg2-11:         NOTRUN -> [SKIP][67] ([i915#3708])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html
>     - bat-dg2-14:         NOTRUN -> [SKIP][68] ([i915#3708])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][69] ([i915#3708] / [i915#9792])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html
> 
>   * igt@prime_vgem@basic-fence-mmap:
>     - bat-dg2-11:         NOTRUN -> [SKIP][70] ([i915#3708] / [i915#4077]) +1 other test skip
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-11/igt@prime_vgem@basic-fence-mmap.html
>     - bat-dg2-14:         NOTRUN -> [SKIP][71] ([i915#3708] / [i915#4077]) +1 other test skip
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-14/igt@prime_vgem@basic-fence-mmap.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][72] ([i915#3708] / [i915#4077]) +1 other test skip
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-adlp-9:         NOTRUN -> [SKIP][73] ([i915#3291] / [i915#3708]) +2 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-adlp-9/igt@prime_vgem@basic-fence-read.html
>     - bat-adlp-6:         NOTRUN -> [SKIP][74] ([i915#3291] / [i915#3708]) +2 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-adlp-6/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@basic-read:
>     - bat-dg2-11:         NOTRUN -> [SKIP][75] ([i915#3291] / [i915#3708]) +2 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-11/igt@prime_vgem@basic-read.html
>     - bat-dg2-14:         NOTRUN -> [SKIP][76] ([i915#3291] / [i915#3708]) +2 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-dg2-14/igt@prime_vgem@basic-read.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][77] ([i915#3708]) +1 other test skip
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][78] ([i915#10216] / [i915#3708])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/bat-mtlp-6/igt@prime_vgem@basic-write.html
> 
>   
>   [Intel XE#484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/484
>   [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
>   [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
>   [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
>   [i915#4342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342
>   [i915#4550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4550
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
>   [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
>   [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
>   [i915#9673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
>   [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7933 -> IGTPW_11440
> 
>   CI-20190529: 20190529
>   CI_DRM_15107: 867eb2599d00e03d12a2a49b223cf37280d7ee2e @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11440: 11440
>   IGT_7933: 7933
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11440/index.html
> 




