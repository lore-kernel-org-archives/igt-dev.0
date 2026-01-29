Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54E3D358F5
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 10:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B2B10E844;
	Thu, 29 Jan 2026 10:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWjN+/jS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CDB10E844
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 10:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769681465; x=1801217465;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=BhQfAW/RvmxOgOx1kRo6yFIFY6E6nferGGAztz/1dBQ=;
 b=WWjN+/jSj8yIL1KhJjkou3lOu0516nh6TVNm1gl4a3l7aQtcx8PmFWch
 fGHe3inr16bV111rk7wKfPepotz37+7DOH8ZmojQ66Nx/+924+ESoiK9G
 f1VnNc1tdQorC18e4gmuYSgsgmBZ3YlY57ImasaoSpnOr6SKV6IpPRvXK
 5ZxkvF3EK5HSZGAfOyPqupxIFKFDidgOip++Ohf6Nddev5Qy4nXL7LUUt
 PnfUaoU5nmwkfrqoDdAk9dGPx1I35/7nishEDJqZcKS1K9Ntwy3SZ3Bii
 6Ai9hM5brkTRbi2rcH6i1W+ocWOj/ybKluOTdRS/bUZGRXYWrgUMD1cR1 g==;
X-CSE-ConnectionGUID: N+dxJzdHSIiHfv2Ftun4WQ==
X-CSE-MsgGUID: qWUoBjAUTDCCafs+yoBFWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="71079839"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="71079839"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 02:11:05 -0800
X-CSE-ConnectionGUID: HjLR+zZzRhGxF6u4AJgGAg==
X-CSE-MsgGUID: vaBT5TttRASBux5R0b42PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="239789856"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.180.102])
 ([172.28.180.102])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 02:11:04 -0800
Message-ID: <65da9cae-c49b-47a4-9a6b-40174b13db2b@linux.intel.com>
Date: Thu, 29 Jan 2026 11:11:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Xe_SR-IOV_?=
 =?UTF-8?Q?admin_scheduling_helpers_and_test_updates_=28rev3=29?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20260128180819.1373376-1-marcin.bernatowicz@linux.intel.com>
 <176963326610.202811.153305377259600957@a3b018990fe9>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <176963326610.202811.153305377259600957@a3b018990fe9>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 1/28/2026 9:47 PM, Patchwork wrote:
> == Series Details ==
>
> Series: Xe SR-IOV admin scheduling helpers and test updates (rev3)
> URL   : https://patchwork.freedesktop.org/series/157591/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from IGT_8723 -> IGTPW_14443
> ====================================================
>
> Summary
> -------
>
>    **FAILURE**
>
>    Serious unknown changes coming with IGTPW_14443 absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_14443, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
>
>    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14443/index.html
>
> Participating hosts (42 -> 41)
> ------------------------------
>
>    Additional (1): bat-adls-6
>    Missing    (2): bat-dg2-13 fi-snb-2520m
>
> Possible new issues
> -------------------
>
>    Here are the unknown changes that may have been introduced in IGTPW_14443:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>    * igt@i915_pm_rpm@module-reload:
>      - bat-adlp-6:         [PASS][1] -> [DMESG-WARN][2] +78 other tests dmesg-warn
>     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8723/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
>     [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14443/bat-adlp-6/igt@i915_pm_rpm@module-reload.html

Not related to the series.

--

marcin

>
>    
> Known issues
> ------------
>
>    Here are the changes found in IGTPW_14443 that come from known issues:
>
> ### IGT changes ###
>
> #### Issues hit ####
>
>    * igt@gem_lmem_swapping@parallel-random-engines:
>      - bat-adls-6:         NOTRUN -> [SKIP][3] ([i915#4613]) +3 other tests skip
>     [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14443/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html
>
>    * igt@gem_tiled_pread_basic:
>      - bat-adls-6:         NOTRUN -> [SKIP][4] ([i915#3282])
>     [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14443/bat-adls-6/igt@gem_tiled_pread_basic.html
>
>    * igt@i915_selftest@live:
>      - bat-twl-1:          [PASS][5] -> [DMESG-WARN][6] ([i915#14872]) +1 other test dmesg-warn
>     [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8723/bat-twl-1/igt@i915_selftest@live.html
>     [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14443/bat-twl-1/igt@i915_selftest@live.html
>
>    * igt@intel_hwmon@hwmon-read:
>      - bat-adls-6:         NOTRUN -> [SKIP][7] ([i915#7707]) +1 other test skip
>     [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14443/bat-adls-6/igt@intel_hwmon@hwmon-read.html
>
>    * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>      - bat-adls-6:         NOTRUN -> [SKIP][8] ([i915#4103]) +1 other test skip
>     [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14443/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>
>    * igt@kms_dsc@dsc-basic:
>      - bat-adls-6:         NOTRUN -> [SKIP][9] ([i915#3555] / [i915#3840])
>     [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14443/bat-adls-6/igt@kms_dsc@dsc-basic.html
>
>    * igt@kms_force_connector_basic@force-load-detect:
>      - bat-adls-6:         NOTRUN -> [SKIP][10]
>     [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14443/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html
>
>    * igt@kms_pm_backlight@basic-brightness:
>      - bat-adls-6:         NOTRUN -> [SKIP][11] ([i915#5354])
>     [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14443/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html
>
>    * igt@kms_psr@psr-primary-mmap-gtt:
>      - bat-adls-6:         NOTRUN -> [SKIP][12] ([i915#1072] / [i915#9732]) +3 other tests skip
>     [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14443/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html
>
>    * igt@kms_setmode@basic-clone-single-crtc:
>      - bat-adls-6:         NOTRUN -> [SKIP][13] ([i915#3555])
>     [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14443/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html
>
>    * igt@prime_vgem@basic-fence-read:
>      - bat-adls-6:         NOTRUN -> [SKIP][14] ([i915#3291]) +2 other tests skip
>     [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14443/bat-adls-6/igt@prime_vgem@basic-fence-read.html
>
>    
> #### Possible fixes ####
>
>    * igt@i915_selftest@live:
>      - bat-mtlp-8:         [DMESG-FAIL][15] ([i915#12061]) -> [PASS][16] +1 other test pass
>     [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8723/bat-mtlp-8/igt@i915_selftest@live.html
>     [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14443/bat-mtlp-8/igt@i915_selftest@live.html
>
>    * igt@i915_selftest@live@workarounds:
>      - bat-arls-6:         [DMESG-FAIL][17] ([i915#12061]) -> [PASS][18] +1 other test pass
>     [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8723/bat-arls-6/igt@i915_selftest@live@workarounds.html
>     [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14443/bat-arls-6/igt@i915_selftest@live@workarounds.html
>
>    
>    [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>    [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>    [i915#14872]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14872
>    [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>    [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>    [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>    [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>    [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>    [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>    [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>    [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
>    [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>
>
> Build changes
> -------------
>
>    * CI: CI-20190529 -> None
>    * IGT: IGT_8723 -> IGTPW_14443
>
>    CI-20190529: 20190529
>    CI_DRM_17900: 8059f097e25f736bb3da09af6a9b283079abfd4f @ git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_14443: 14443
>    IGT_8723: 8723
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14443/index.html
>
