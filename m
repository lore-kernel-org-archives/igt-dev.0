Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96D31098796
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 15:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDBA10E15F;
	Fri, 20 Mar 2026 15:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKBkW0pa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA7710E15F;
 Fri, 20 Mar 2026 15:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774019827; x=1805555827;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=AjN/7dcZEyVduNRErX2aM0OXk38ohqDVXyeth8eQMaE=;
 b=gKBkW0pacHLsT5xlzutxZvLQsRkuC6OLVwJp6tR8wLvSNielacxa0qIK
 eNf6EOw7kr5r2VpQq6Ub/XImnZWFBHs6jmjEUbOUu++RByMJs45n/CGf0
 CUSmUoMSVCtNgsp7WRNKyFgKcXPzpIhBVmGYrw0lSpXbWWI3amKGYiwH8
 9/BjVDZRR8jEF6zpV4/1nxnY/MD6Ub8Rv+biZWZ+LGlsTfMl+x03nxVuE
 crlR3pzPAG7uKz8ki8/6sL8KdUEml5EZLo19ZwiFqrCfBKsuqdms2Jv8b
 viIzQuyVj7om43HWhEk4Kz1XnYl0DC6gskVzgDce2ERMTOXW5bR7iPq8F Q==;
X-CSE-ConnectionGUID: uRk4C6EfRDKulVvFZolXhA==
X-CSE-MsgGUID: UGgw3BkjTxWvEaev4P0kwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="78963296"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="78963296"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 08:17:06 -0700
X-CSE-ConnectionGUID: 6hkrrqvKQQK7/oisDJ3wWQ==
X-CSE-MsgGUID: naVdarsGTyCo0OXm6hJkKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="261219057"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 08:17:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: i915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97?= i915.CI.BAT: failure for Prepare for
 returning NULL from igt_crtc_for_pipe() (rev2)
In-Reply-To: <177401751651.379016.10035260206775763479@a3b018990fe9>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1774002591.git.jani.nikula@intel.com>
 <177401751651.379016.10035260206775763479@a3b018990fe9>
Date: Fri, 20 Mar 2026 17:17:02 +0200
Message-ID: <5a5423ea2fc500dfcb43f64a33d41e31a88239c9@intel.com>
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

On Fri, 20 Mar 2026, Patchwork <patchwork@emeril.freedesktop.org> wrote:
> == Series Details ==
>
> Series: Prepare for returning NULL from igt_crtc_for_pipe() (rev2)
> URL   : https://patchwork.freedesktop.org/series/163278/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from IGT_8815 -> IGTPW_14822
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with IGTPW_14822 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14822, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
>
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14822/index.html
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
>   Here are the unknown changes that may have been introduced in IGTPW_14822:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@i915_module_load@load:
>     - fi-cfl-8109u:       [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8815/fi-cfl-8109u/igt@i915_module_load@load.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14822/fi-cfl-8109u/igt@i915_module_load@load.html

Unrelated, please re-report.


>
>   
> Known issues
> ------------
>
>   Here are the changes found in IGTPW_14822 that come from known issues:
>
> ### IGT changes ###
>
> #### Issues hit ####
>
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-adls-6:         NOTRUN -> [SKIP][3] ([i915#4613]) +3 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14822/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html
>
>   * igt@gem_tiled_pread_basic@basic:
>     - bat-adls-6:         NOTRUN -> [SKIP][4] ([i915#15656])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14822/bat-adls-6/igt@gem_tiled_pread_basic@basic.html
>
>   * igt@i915_selftest@live@workarounds:
>     - bat-arls-5:         [PASS][5] -> [DMESG-FAIL][6] ([i915#12061]) +1 other test dmesg-fail
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8815/bat-arls-5/igt@i915_selftest@live@workarounds.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14822/bat-arls-5/igt@i915_selftest@live@workarounds.html
>
>   * igt@intel_hwmon@hwmon-read:
>     - bat-adls-6:         NOTRUN -> [SKIP][7] ([i915#7707]) +1 other test skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14822/bat-adls-6/igt@intel_hwmon@hwmon-read.html
>
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-adls-6:         NOTRUN -> [SKIP][8] ([i915#4103]) +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14822/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>
>   * igt@kms_dsc@dsc-basic:
>     - bat-adls-6:         NOTRUN -> [SKIP][9] ([i915#3555] / [i915#3840])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14822/bat-adls-6/igt@kms_dsc@dsc-basic.html
>
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-adls-6:         NOTRUN -> [SKIP][10]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14822/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html
>
>   * igt@kms_pm_backlight@basic-brightness:
>     - bat-adls-6:         NOTRUN -> [SKIP][11] ([i915#5354])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14822/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html
>
>   * igt@kms_psr@psr-primary-mmap-gtt:
>     - bat-adls-6:         NOTRUN -> [SKIP][12] ([i915#1072] / [i915#9732]) +3 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14822/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html
>
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-adls-6:         NOTRUN -> [SKIP][13] ([i915#3555])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14822/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html
>
>   * igt@prime_vgem@basic-fence-read:
>     - bat-adls-6:         NOTRUN -> [SKIP][14] ([i915#3291]) +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14822/bat-adls-6/igt@prime_vgem@basic-fence-read.html
>
>   
> #### Possible fixes ####
>
>   * igt@i915_selftest@live@workarounds:
>     - bat-arlh-3:         [DMESG-FAIL][15] ([i915#12061]) -> [PASS][16] +1 other test pass
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8815/bat-arlh-3/igt@i915_selftest@live@workarounds.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14822/bat-arlh-3/igt@i915_selftest@live@workarounds.html
>     - bat-dg2-14:         [DMESG-FAIL][17] ([i915#12061]) -> [PASS][18] +1 other test pass
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8815/bat-dg2-14/igt@i915_selftest@live@workarounds.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14822/bat-dg2-14/igt@i915_selftest@live@workarounds.html
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
>   * IGT: IGT_8815 -> IGTPW_14822
>
>   CI-20190529: 20190529
>   CI_DRM_18181: 7535044a2418d22b59be0eb64af0353971f16bd8 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_14822: 14822
>   IGT_8815: 8815
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14822/index.html

-- 
Jani Nikula, Intel
