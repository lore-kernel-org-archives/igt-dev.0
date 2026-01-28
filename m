Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FE2D3F06B
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 14:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1E110E2C5;
	Wed, 28 Jan 2026 14:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mwz9Z2rq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A80489D7F;
 Wed, 28 Jan 2026 14:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769609558; x=1801145558;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=I4wEZB1u/J/Jqe0dPoe4dSbcz+uXc+QwO2Mt0oYo1Y0=;
 b=Mwz9Z2rq2uW2mMH+GynQpgcd6U9dD4pu881HNgDfxMtN62qKYVJ4x2ph
 2FGdXjiSusrKhKGPIcwf9cu89DwKTTFvgjiCa72MkW2AO+AYhHhxl/Y9q
 S0VaeVRCPNKBsFRLUEt4q9/pNoQjZwILwgID7qWG0F09pAX7dO8J1OT4W
 bwXyTOVtIPh6XTJ1zAaXFtqeZ4sYRNHIDzmxT3q4KOFMs5X5fbFcPhNdB
 21Aquoo5HEnjO6HUbuXfBoJUDrWOQSgLBaOSbTdhXCPQADJpEdvTz/0w/
 eGV8tMESpzuxRCnPa2oH1yGrLcnPVUtPPN3WiSAOzup+Lzt8ZPM0sLrL3 g==;
X-CSE-ConnectionGUID: NCytrHQeQnaKsPH1N7EW8g==
X-CSE-MsgGUID: UfntS6HsT/KQ1LgOIHA3Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="88238784"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="88238784"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 06:12:38 -0800
X-CSE-ConnectionGUID: zoporS9IQnuIrK2HxxaO1A==
X-CSE-MsgGUID: 7MeQf60yS9m127fRa6b+sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="207897845"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 06:12:36 -0800
Date: Wed, 28 Jan 2026 15:12:19 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 Runner: Use Jansson instead of json-c (rev3)
Message-ID: <20260128141219.rl2vjqbwag3zkmvu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260115175811.179898-1-kamil.konieczny@linux.intel.com>
 <176960467447.200099.2821899461965491566@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176960467447.200099.2821899461965491566@a3b018990fe9>
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
On 2026-01-28 at 12:51:14 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Runner: Use Jansson instead of json-c (rev3)
> URL   : https://patchwork.freedesktop.org/series/160154/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8721 -> IGTPW_14436
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14436 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14436, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/index.html
> 
> Participating hosts (42 -> 41)
> ------------------------------
> 
>   Additional (1): bat-adls-6 
>   Missing    (2): bat-dg2-13 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14436:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gem_migrate:
>     - bat-arlh-3:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8721/bat-arlh-3/igt@i915_selftest@live@gem_migrate.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/bat-arlh-3/igt@i915_selftest@live@gem_migrate.html
> 

Unrelated, please update and run i915 FULL.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14436 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-adls-6:         NOTRUN -> [SKIP][3] ([i915#4613]) +3 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-adls-6:         NOTRUN -> [SKIP][4] ([i915#3282])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/bat-adls-6/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_selftest@live:
>     - bat-arlh-3:         [PASS][5] -> [INCOMPLETE][6] ([i915#15622])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8721/bat-arlh-3/igt@i915_selftest@live.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/bat-arlh-3/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arlh-2:         [PASS][7] -> [DMESG-FAIL][8] ([i915#12061]) +1 other test dmesg-fail
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8721/bat-arlh-2/igt@i915_selftest@live@workarounds.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/bat-arlh-2/igt@i915_selftest@live@workarounds.html
> 
>   * igt@intel_hwmon@hwmon-read:
>     - bat-adls-6:         NOTRUN -> [SKIP][9] ([i915#7707]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/bat-adls-6/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-adls-6:         NOTRUN -> [SKIP][10] ([i915#4103]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-adls-6:         NOTRUN -> [SKIP][11] ([i915#3555] / [i915#3840])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/bat-adls-6/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-adls-6:         NOTRUN -> [SKIP][12]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - fi-tgl-1115g4:      [PASS][13] -> [FAIL][14] ([i915#14867])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8721/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - bat-adls-6:         NOTRUN -> [SKIP][15] ([i915#5354])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_psr@psr-primary-mmap-gtt:
>     - bat-adls-6:         NOTRUN -> [SKIP][16] ([i915#1072] / [i915#9732]) +3 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-adls-6:         NOTRUN -> [SKIP][17] ([i915#3555])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-adls-6:         NOTRUN -> [SKIP][18] ([i915#3291]) +2 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/bat-adls-6/igt@prime_vgem@basic-fence-read.html
> 
>   
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#14867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14867
>   [i915#15622]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15622
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
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
>   * IGT: IGT_8721 -> IGTPW_14436
>   * Linux: CI_DRM_17897 -> CI_DRM_17900
> 
>   CI-20190529: 20190529
>   CI_DRM_17897: ba05f22d6945596fac691e952c98f566696c24ad @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_17900: 8059f097e25f736bb3da09af6a9b283079abfd4f @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_14436: 9d76741e56c0a80a388f69d589d749706b37bc15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8721: 3707bb4267de22a18d61b232c4ab5fbaf61db90c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14436/index.html
