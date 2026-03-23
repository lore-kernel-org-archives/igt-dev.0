Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7794BF46102
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 12:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FDF10E3D8;
	Mon, 23 Mar 2026 12:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXHP9mSE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D5210E4D2;
 Mon, 23 Mar 2026 12:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774270072; x=1805806072;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=snzngUfpZbkSNvbt/dVJFHiSIhWQci0a1q+OgHCiK0U=;
 b=kXHP9mSEYmsxOur/D3drr1cB3JsRBHF9bqXso7B1ALKxusavDrvmiN6K
 egdKb8jn2oja8Xr4IR5H0oy23FudgAQc2PWCY+HlARkyVcs/ooApC+S89
 1zF0uIM6g0tk28dBZXXw5eHvY+jqO/s3/nSH73txW/Oo5Ax32DZdcqJNj
 sUuHlBZLDRo6gNPCew2WnxPM4b/OTSCBKzSIgKwNS86s84rb2DL4BXMLm
 nSCXW0Qj3Rmg1KBSB4zTIKooeB4SkbeHr7yULovhfDEEfuXVOVmsDrgtN
 2C7AtGHB1TnqUQfIpzR/CfG3Ack7IOBUInFFJb91flbO1UwLnOAceZS+4 w==;
X-CSE-ConnectionGUID: j546J0NPSK+iDyxex+uOCQ==
X-CSE-MsgGUID: lN1lcT+/QbSh+UpvRvGN4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="79171679"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="79171679"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 05:47:52 -0700
X-CSE-ConnectionGUID: 8G2xd4hQQ4iLy1KjR0XV8g==
X-CSE-MsgGUID: bZoH//TESG6BGLMH6pjcSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="217521086"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 05:47:51 -0700
Date: Mon, 23 Mar 2026 13:47:48 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_lib=2Fdrmt?=
 =?utf-8?Q?est=3A?= Create proper error report when open driver fails
Message-ID: <20260323124748.3oj7zawy6gbpy3pt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260320123417.30143-1-kamil.konieczny@linux.intel.com>
 <177403186075.382001.3825855984815683728@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177403186075.382001.3825855984815683728@a3b018990fe9>
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
On 2026-03-20 at 18:37:40 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/drmtest: Create proper error report when open driver fails
> URL   : https://patchwork.freedesktop.org/series/163593/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8815 -> IGTPW_14826
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14826 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14826, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14826/index.html
> 
> Participating hosts (40 -> 39)
> ------------------------------
> 
>   Additional (1): bat-adls-6 
>   Missing    (2): bat-dg2-13 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14826:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - fi-tgl-1115g4:      [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8815/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14826/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
> 

Unrelated, please re-report and run full testing, thank you!

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14826 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-adls-6:         NOTRUN -> [SKIP][3] ([i915#4613]) +3 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14826/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_tiled_pread_basic@basic:
>     - bat-adls-6:         NOTRUN -> [SKIP][4] ([i915#15656])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14826/bat-adls-6/igt@gem_tiled_pread_basic@basic.html
> 
>   * igt@i915_selftest@live:
>     - bat-dg2-8:          [PASS][5] -> [DMESG-FAIL][6] ([i915#12061]) +1 other test dmesg-fail
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8815/bat-dg2-8/igt@i915_selftest@live.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14826/bat-dg2-8/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arls-5:         [PASS][7] -> [DMESG-FAIL][8] ([i915#12061]) +1 other test dmesg-fail
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8815/bat-arls-5/igt@i915_selftest@live@workarounds.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14826/bat-arls-5/igt@i915_selftest@live@workarounds.html
> 
>   * igt@intel_hwmon@hwmon-read:
>     - bat-adls-6:         NOTRUN -> [SKIP][9] ([i915#7707]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14826/bat-adls-6/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-adls-6:         NOTRUN -> [SKIP][10] ([i915#4103]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14826/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-adls-6:         NOTRUN -> [SKIP][11] ([i915#3555] / [i915#3840])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14826/bat-adls-6/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-adls-6:         NOTRUN -> [SKIP][12]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14826/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - bat-adls-6:         NOTRUN -> [SKIP][13] ([i915#5354])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14826/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_psr@psr-primary-mmap-gtt:
>     - bat-adls-6:         NOTRUN -> [SKIP][14] ([i915#1072] / [i915#9732]) +3 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14826/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-adls-6:         NOTRUN -> [SKIP][15] ([i915#3555])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14826/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-adls-6:         NOTRUN -> [SKIP][16] ([i915#3291]) +2 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14826/bat-adls-6/igt@prime_vgem@basic-fence-read.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live:
>     - bat-mtlp-8:         [DMESG-FAIL][17] ([i915#12061]) -> [PASS][18] +1 other test pass
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8815/bat-mtlp-8/igt@i915_selftest@live.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14826/bat-mtlp-8/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arlh-3:         [DMESG-FAIL][19] ([i915#12061]) -> [PASS][20] +1 other test pass
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8815/bat-arlh-3/igt@i915_selftest@live@workarounds.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14826/bat-arlh-3/igt@i915_selftest@live@workarounds.html
>     - bat-dg2-14:         [DMESG-FAIL][21] ([i915#12061]) -> [PASS][22] +1 other test pass
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8815/bat-dg2-14/igt@i915_selftest@live@workarounds.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14826/bat-dg2-14/igt@i915_selftest@live@workarounds.html
>     - bat-arls-6:         [DMESG-FAIL][23] ([i915#12061]) -> [PASS][24] +1 other test pass
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8815/bat-arls-6/igt@i915_selftest@live@workarounds.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14826/bat-arls-6/igt@i915_selftest@live@workarounds.html
> 
>   
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
>   [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
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
>   * IGT: IGT_8815 -> IGTPW_14826
>   * Linux: CI_DRM_18181 -> CI_DRM_18183
> 
>   CI-20190529: 20190529
>   CI_DRM_18181: 7535044a2418d22b59be0eb64af0353971f16bd8 @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_18183: f202c0d0dece0eeefb750a6a9d80f4b7442529f4 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_14826: 14826
>   IGT_8815: 8815
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14826/index.html
