Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7AECF8853
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 12:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678DD10E749;
	Thu, 20 Nov 2025 12:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gVxQl3n3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E748010E173;
 Thu, 20 Nov 2025 12:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763642804; x=1795178804;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=n2QDylIKvuDhXmFzw4j/5KjHyEYOERiD8D0Wk9tqyXk=;
 b=gVxQl3n3Yg+oN1iJVyI1Gjbx6aYnn3sR2iE6nfB8npFvyR/aOMtv72pK
 RxXxDGSMfO12e4PBNKz8Pcz0zOjEUkSIPe8B3ew8CUzaxz4dgp62MDHgu
 CS17QMLMAOSgfAgb9fKz0CTT+hwOoMD26SxB9N2u4G0rkru0wnC4I+Q/x
 T8GnKzUuijenQgiftmU85cCBl8w/7y0BtoBEAPkiaf01gNQmgJ8rEpJ+V
 sxDc49PFMbRMp6nRgghtitpGpBbuE8Qe/3fny96AM7B5b47Mo4fCtE+yB
 +qo0zSf+l9TOxIWvWf+5WoTQxusaCJm1G07mOpfcHPbFi+VeKsvnJetZV g==;
X-CSE-ConnectionGUID: z5l74Yf7QqOrp74KlLKoiQ==
X-CSE-MsgGUID: XUEM1CrJRjudwPVcCeYAbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69577902"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="69577902"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 04:46:34 -0800
X-CSE-ConnectionGUID: PRouEhAjQSC4fAx0um5yLQ==
X-CSE-MsgGUID: GlrhvygMTN6aUqW8UvrarQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191386176"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.6])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 04:46:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97?= i915.CI.BAT: failure for fix CRTC index
 to pipe conversion, cleanup
In-Reply-To: <176363853021.13788.10344289381230254231@a3b018990fe9>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1763634045.git.jani.nikula@intel.com>
 <176363853021.13788.10344289381230254231@a3b018990fe9>
Date: Thu, 20 Nov 2025 14:46:29 +0200
Message-ID: <b3e98cc3324d4f55566fcc83643eb262d0ab0c9c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 20 Nov 2025, Patchwork <patchwork@emeril.freedesktop.org> wrote:
> == Series Details ==
>
> Series: fix CRTC index to pipe conversion, cleanup
> URL   : https://patchwork.freedesktop.org/series/157831/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from IGT_8635 -> IGTPW_14085
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with IGTPW_14085 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14085, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
>
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/index.html
>
> Participating hosts (43 -> 44)
> ------------------------------
>
>   Additional (2): fi-glk-j4005 fi-rkl-11600 
>   Missing    (1): fi-snb-2520m 
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in IGTPW_14085:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@i915_selftest@live@guc_multi_lrc:
>     - bat-arls-6:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8635/bat-arls-6/igt@i915_selftest@live@guc_multi_lrc.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/bat-arls-6/igt@i915_selftest@live@guc_multi_lrc.html
>
>   
> #### Warnings ####
>
>   * igt@i915_selftest@live:
>     - bat-arls-6:         [DMESG-FAIL][3] ([i915#12061]) -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8635/bat-arls-6/igt@i915_selftest@live.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/bat-arls-6/igt@i915_selftest@live.html

Hardly related, please re-report.

BR,
Jani.


>
>   
> Known issues
> ------------
>
>   Here are the changes found in IGTPW_14085 that come from known issues:
>
> ### IGT changes ###
>
> #### Issues hit ####
>
>   * igt@fbdev@eof:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][5] ([i915#2582]) +3 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/fi-rkl-11600/igt@fbdev@eof.html
>
>   * igt@fbdev@info:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][6] ([i915#1849] / [i915#2582])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/fi-rkl-11600/igt@fbdev@info.html
>
>   * igt@gem_huc_copy@huc-copy:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][7] ([i915#2190])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html
>     - fi-glk-j4005:       NOTRUN -> [SKIP][8] ([i915#2190])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html
>
>   * igt@gem_lmem_swapping@basic:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][9] ([i915#4613]) +3 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/fi-rkl-11600/igt@gem_lmem_swapping@basic.html
>
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - fi-glk-j4005:       NOTRUN -> [SKIP][10] ([i915#4613]) +3 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html
>
>   * igt@gem_tiled_pread_basic:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][11] ([i915#3282])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/fi-rkl-11600/igt@gem_tiled_pread_basic.html
>
>   * igt@i915_selftest@live@workarounds:
>     - bat-arls-5:         [PASS][12] -> [DMESG-FAIL][13] ([i915#12061]) +1 other test dmesg-fail
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8635/bat-arls-5/igt@i915_selftest@live@workarounds.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/bat-arls-5/igt@i915_selftest@live@workarounds.html
>
>   * igt@intel_hwmon@hwmon-read:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][14] ([i915#7707]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/fi-rkl-11600/igt@intel_hwmon@hwmon-read.html
>
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][15] ([i915#3637]) +3 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html
>
>   * igt@kms_force_connector_basic@force-load-detect:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][16]
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html
>
>   * igt@kms_frontbuffer_tracking@basic:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][17] ([i915#1849] / [i915#5354])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html
>
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][18] ([i915#11190]) +16 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
>
>   * igt@kms_pm_backlight@basic-brightness:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][19] ([i915#5354])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html
>
>   * igt@kms_pm_rpm@basic-rte:
>     - bat-rpls-4:         [PASS][20] -> [DMESG-WARN][21] ([i915#13400])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8635/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html
>
>   * igt@kms_psr@psr-primary-page-flip:
>     - fi-glk-j4005:       NOTRUN -> [SKIP][22] +12 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html
>     - fi-rkl-11600:       NOTRUN -> [SKIP][23] ([i915#1072] / [i915#9732]) +3 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/fi-rkl-11600/igt@kms_psr@psr-primary-page-flip.html
>
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][24] ([i915#3555])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html
>
>   * igt@prime_vgem@basic-fence-flip:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][25] ([i915#3708])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html
>
>   * igt@prime_vgem@basic-read:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][26] ([i915#3291] / [i915#3708]) +2 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/fi-rkl-11600/igt@prime_vgem@basic-read.html
>
>   
> #### Possible fixes ####
>
>   * igt@i915_selftest@live:
>     - bat-jsl-1:          [DMESG-FAIL][27] ([i915#13774]) -> [PASS][28] +1 other test pass
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8635/bat-jsl-1/igt@i915_selftest@live.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/bat-jsl-1/igt@i915_selftest@live.html
>
>   * igt@i915_selftest@live@workarounds:
>     - bat-adlp-9:         [ABORT][29] ([i915#14365]) -> [PASS][30] +1 other test pass
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8635/bat-adlp-9/igt@i915_selftest@live@workarounds.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/bat-adlp-9/igt@i915_selftest@live@workarounds.html
>     - bat-arls-6:         [DMESG-FAIL][31] ([i915#12061]) -> [PASS][32]
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8635/bat-arls-6/igt@i915_selftest@live@workarounds.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/bat-arls-6/igt@i915_selftest@live@workarounds.html
>
>   
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
>   [i915#13774]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13774
>   [i915#14365]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14365
>   [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
>   [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
>   [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>
>
> Build changes
> -------------
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8635 -> IGTPW_14085
>   * Linux: CI_DRM_17572 -> CI_DRM_17574
>
>   CI-20190529: 20190529
>   CI_DRM_17572: a95032b2166b5ae428c065917b843a1caf1e82b8 @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_17574: 434668b827ca78eb5bf6645ad31fa6d0217c3872 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_14085: 5c3d6e18e731799ca594034087d013efd1e56631 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8635: 8635
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14085/index.html

-- 
Jani Nikula, Intel
