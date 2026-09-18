Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB252C88E75
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 08:06:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8449110E4FC;
	Fri, 18 Sep 2026 08:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QsgaHnIq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE4410F265;
 Fri, 18 Sep 2026 08:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789718767; x=1821254767;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=w6Vm4WaoMqg26jjvgVha1y6z0LVZjiYflcbUL/lvobs=;
 b=QsgaHnIqm2vYjoaNDrpV2KgUWBmns49YRKM6/OWrDgblLW+J2zosL4jZ
 BOtoGxqC7XlBraan18wCR9TgosmBI8hpd9RPaaftWagyyzYgHBQ1nnUZ3
 bC1KiUo/zM3om6OoeWmSD5dVOSBUBHPelMIW6HgTLVkQAcY8enuQAHZMk
 9hSgZBKv0mxY2pARl5hVIYfyGfaK6uDxRJ78Tpln6uBeOgCQxlamtUT+o
 Oerh/5bVSG+hfQgfG/QEoYrUmoyICeFB0kFxei5Uw00UUtOIIwiKO28pk
 iZ3lmRwEPMl9Nf2TiojEtA0/5wVv1Ioji0DzbTE68Yj9M21xdBWh8BiQq A==;
X-CSE-ConnectionGUID: VaBkRulIRKGF49EBBAMBCQ==
X-CSE-MsgGUID: jeRRf71IQbuocZRXcIPPLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90072105"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="90072105"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 01:06:07 -0700
X-CSE-ConnectionGUID: 10tEB6XVQ7CiQ0g7NYVn+Q==
X-CSE-MsgGUID: 6Rme0EA0RpOfEKIqsmdzrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2468588"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 01:06:07 -0700
Date: Fri, 18 Sep 2026 10:06:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 lib/igt_core: Make build reproducible (rev4)
Message-ID: <20260918080600.bronhywhbwc2zdd7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260917170532.107916-1-kamil.konieczny@linux.intel.com>
 <178967104865.178464.9017621621669675222@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178967104865.178464.9017621621669675222@61270ab9df2a>
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
On 2026-09-17 at 18:50:48 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_core: Make build reproducible (rev4)
> URL   : https://patchwork.freedesktop.org/series/173723/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_9099 -> IGTPW_15859
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15859 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15859, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15859/index.html
> 
> Participating hosts (38 -> 37)
> ------------------------------
> 
>   Additional (1): fi-tgl-1115g4 
>   Missing    (2): bat-dg2-13 fi-rkl-11600 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15859:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@late_gt_pm:
>     - fi-bsw-nick:        [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9099/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15859/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html

Unrelated, please report and run full i915 testing.



Regards,
Kamil

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15859 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][3] ([i915#2190])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15859/fi-tgl-1115g4/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15859/fi-tgl-1115g4/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@intel_hwmon@hwmon-read:
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][5] ([i915#7707]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15859/fi-tgl-1115g4/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][6] ([i915#4103]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15859/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][7] ([i915#16361])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15859/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][8]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15859/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][9] ([i915#12343] / [i915#9812])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15859/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][10] ([i915#9732]) +3 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15859/fi-tgl-1115g4/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][11] ([i915#3555])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15859/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   
>   [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
>   [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
>   [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_9099 -> IGTPW_15859
>   * Linux: CI_DRM_19152 -> CI_DRM_19164
> 
>   CI-20190529: 20190529
>   CI_DRM_19152: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_19164: ff3a0609f8e49ff49a9cda23d1631155085cd537 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_15859: 4de372ef55efb83c13f471d58f0c1efaa02d4e4f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_9099: 9099
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15859/index.html
