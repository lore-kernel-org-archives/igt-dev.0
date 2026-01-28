Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13443D35691
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 08:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB9D10E625;
	Wed, 28 Jan 2026 08:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DWLMq5D3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3A310E625;
 Wed, 28 Jan 2026 08:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769588676; x=1801124676;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=14IsrjjMwvDONKbAeAsP0L76eG71a9Z+UtOugDmYrvA=;
 b=DWLMq5D32GXIHvm4R+/w9WEmC8LCYYFL+xDu6bYMzP8PAYofwVMskNYU
 OtaiTrOKPkgdiYMbxeJ00UacuD41k3tIDjlhy8xIGkUmLZF1NTdoRUIYV
 GzeN2yN+x6pbmE0aUO+Ismw8j+7tIUr8HbvrSe0EwYGzZhQ5AIViz5i31
 BnPiiP9LMVH+f0YuPDVhiz4wpwnxgFZRrZwHVes7X8GARPT8CvyT8Lvzs
 3LGlloL3Db8YEo+92fjx35UU3r35CPFc9Ue9UEUn0KUkoBiaHemgylXw8
 FCPyikibbWskzS0yYxBvnoH6KOwIZE0S0cbZNYIyayncPFec0+EAL7G4L Q==;
X-CSE-ConnectionGUID: lK0C+/GmSse9uF7EQ8fbcg==
X-CSE-MsgGUID: 422rgjIASEOKhGQHKpxIQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70768623"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70768623"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 00:24:32 -0800
X-CSE-ConnectionGUID: 3MW0SBgeQiiyeYb9JCAY+Q==
X-CSE-MsgGUID: bZckid5sT9WIXKJ2KCarSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208105656"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 00:24:29 -0800
Date: Wed, 28 Jan 2026 09:24:27 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 tests/intel/kms_joiner: Fix var usage
Message-ID: <20260128082427.mooqiduqpwpmygqw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260127164018.63157-1-kamil.konieczny@linux.intel.com>
 <176953828942.197229.12111453565230579635@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176953828942.197229.12111453565230579635@a3b018990fe9>
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
On 2026-01-27 at 18:24:49 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/kms_joiner: Fix var usage
> URL   : https://patchwork.freedesktop.org/series/160713/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8720 -> IGTPW_14429
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14429 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14429, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14429/index.html
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
>   Here are the unknown changes that may have been introduced in IGTPW_14429:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gt_pm:
>     - bat-dg2-14:         [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8720/bat-dg2-14/igt@i915_selftest@live@gt_pm.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14429/bat-dg2-14/igt@i915_selftest@live@gt_pm.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_selftest@live:
>     - bat-dg2-14:         [DMESG-FAIL][3] ([i915#12061]) -> [DMESG-FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8720/bat-dg2-14/igt@i915_selftest@live.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14429/bat-dg2-14/igt@i915_selftest@live.html
> 

These are unrelated, please update and run full i915 testing.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14429 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-adls-6:         NOTRUN -> [SKIP][5] ([i915#4613]) +3 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14429/bat-adls-6/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-adls-6:         NOTRUN -> [SKIP][6] ([i915#3282])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14429/bat-adls-6/igt@gem_tiled_pread_basic.html
> 
>   * igt@intel_hwmon@hwmon-read:
>     - bat-adls-6:         NOTRUN -> [SKIP][7] ([i915#7707]) +1 other test skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14429/bat-adls-6/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-adls-6:         NOTRUN -> [SKIP][8] ([i915#4103]) +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14429/bat-adls-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-adls-6:         NOTRUN -> [SKIP][9] ([i915#3555] / [i915#3840])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14429/bat-adls-6/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-adls-6:         NOTRUN -> [SKIP][10]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14429/bat-adls-6/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - bat-adls-6:         NOTRUN -> [SKIP][11] ([i915#5354])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14429/bat-adls-6/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_psr@psr-primary-mmap-gtt:
>     - bat-adls-6:         NOTRUN -> [SKIP][12] ([i915#1072] / [i915#9732]) +3 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14429/bat-adls-6/igt@kms_psr@psr-primary-mmap-gtt.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-adls-6:         NOTRUN -> [SKIP][13] ([i915#3555])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14429/bat-adls-6/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-adls-6:         NOTRUN -> [SKIP][14] ([i915#3291]) +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14429/bat-adls-6/igt@prime_vgem@basic-fence-read.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-dg2-14:         [DMESG-FAIL][15] ([i915#12061]) -> [PASS][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8720/bat-dg2-14/igt@i915_selftest@live@workarounds.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14429/bat-dg2-14/igt@i915_selftest@live@workarounds.html
>     - bat-mtlp-9:         [DMESG-FAIL][17] ([i915#12061]) -> [PASS][18] +1 other test pass
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8720/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14429/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
> 
>   
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
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
>   * IGT: IGT_8720 -> IGTPW_14429
>   * Linux: CI_DRM_17894 -> CI_DRM_17895
> 
>   CI-20190529: 20190529
>   CI_DRM_17894: 6d88e21d3ccde3ca984304cde021744d0e326ee1 @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_17895: 0d98ae30dc3a1479c9a2d3e38b3068faa46e04d0 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_14429: 0310a1feeebd6497a0cfd0186385ac71ffc47750 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8720: b37a4d70080afd7426cb249787545df75f762dc0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14429/index.html
