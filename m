Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1E6CA1009
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 08:52:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38AB10E125;
	Wed,  3 Sep 2025 08:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHm/mNbC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6FA10E063;
 Wed,  3 Sep 2025 08:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756889546; x=1788425546;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/8eIV5TURlEtWH8iTU2G1f1hZvjDEdBQlrSlFpNwIak=;
 b=EHm/mNbCW1J7QLJ3rBY2QZDSfjKsWOtTBKl0nbYqN2R4Q0XPXfmzg0hg
 F4DUIj/4fR52YqNI0gU1oGrIPEw7XUQlGGGJcIMrRJsS1og+P25Wx54M+
 e4JktDxii39IlsI+PU/y2L10gHVvhMho3lpb6EuTOodhBuFfTrkbSGa4r
 j99oPMM8vJbN4RQYyKGoa3b2/VlrhXxCY8/igASWBMYShrzqm1Vp3I8qg
 PJMdHqnPSVVmKjk0/k5ofnZdUIzrwJWFaB/uc8N+7F31iDlinaI6IcZA2
 Am3ja+LyggxTueWxxjRdC1+rKrkCZXK+IywuDSJ3bFgeIWM5Mo9ycq9LK g==;
X-CSE-ConnectionGUID: LV0C2WbQTZCWkAShYexYgA==
X-CSE-MsgGUID: +mqiB02IQ2K6FGQaieCR2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59332861"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="59332861"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 01:52:26 -0700
X-CSE-ConnectionGUID: l1Nb1EBsS5aZy6KuCX/mJg==
X-CSE-MsgGUID: sh09E0H5SFqzMWydQh3prA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="202483586"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 01:52:25 -0700
Date: Wed, 3 Sep 2025 10:52:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 lib/drmtest: Refactor chipset to string
Message-ID: <20250903085222.4sxp6r643eqezris@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250829153454.129913-1-kamil.konieczny@linux.intel.com>
 <175649804475.286105.12662097087688794161@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175649804475.286105.12662097087688794161@1538d3639d33>
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
On 2025-08-29 at 20:07:24 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/drmtest: Refactor chipset to string
> URL   : https://patchwork.freedesktop.org/series/153720/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8517 -> IGTPW_13662
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13662 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13662, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/index.html
> 
> Participating hosts (43 -> 43)
> ------------------------------
> 
>   Additional (1): bat-twl-1 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13662:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gtt:
>     - bat-arlh-3:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-arlh-3/igt@i915_selftest@live@gtt.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-arlh-3/igt@i915_selftest@live@gtt.html
> 

This is unrelated, please report and re-run.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13662 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-twl-1:          NOTRUN -> [SKIP][3] ([i915#10213] / [i915#11671]) +3 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-twl-1/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-twl-1:          NOTRUN -> [SKIP][4] ([i915#11031])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-twl-1/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-twl-1:          NOTRUN -> [SKIP][5] ([i915#10209] / [i915#11681])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-twl-1/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live:
>     - bat-mtlp-8:         [PASS][6] -> [DMESG-FAIL][7] ([i915#12061]) +1 other test dmesg-fail
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-mtlp-8/igt@i915_selftest@live.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-mtlp-8/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@reset:
>     - bat-atsm-1:         [PASS][8] -> [ABORT][9] ([i915#14201])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-atsm-1/igt@i915_selftest@live@reset.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-atsm-1/igt@i915_selftest@live@reset.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arls-5:         [PASS][10] -> [DMESG-FAIL][11] ([i915#12061]) +1 other test dmesg-fail
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-arls-5/igt@i915_selftest@live@workarounds.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-arls-5/igt@i915_selftest@live@workarounds.html
>     - bat-dg2-14:         [PASS][12] -> [DMESG-FAIL][13] ([i915#12061]) +1 other test dmesg-fail
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-dg2-14/igt@i915_selftest@live@workarounds.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-dg2-14/igt@i915_selftest@live@workarounds.html
> 
>   * igt@intel_hwmon@hwmon-read:
>     - bat-twl-1:          NOTRUN -> [SKIP][14] ([i915#7707]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-twl-1/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-twl-1:          NOTRUN -> [SKIP][15] ([i915#11030] / [i915#11731]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-twl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-twl-1:          NOTRUN -> [SKIP][16] ([i915#9886])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-twl-1/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-twl-1:          NOTRUN -> [SKIP][17] ([i915#11032])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-twl-1/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-twl-1:          NOTRUN -> [SKIP][18] ([i915#8809])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-twl-1/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-twl-1:          NOTRUN -> [SKIP][19] ([i915#10212] / [i915#3708])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-twl-1/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@basic-read:
>     - bat-twl-1:          NOTRUN -> [SKIP][20] ([i915#10214] / [i915#3708])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-twl-1/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-twl-1:          NOTRUN -> [SKIP][21] ([i915#10216] / [i915#3708])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-twl-1/igt@prime_vgem@basic-write.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@dmabuf@all-tests:
>     - bat-apl-1:          [ABORT][22] ([i915#12904]) -> [PASS][23] +1 other test pass
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-apl-1/igt@dmabuf@all-tests.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-apl-1/igt@dmabuf@all-tests.html
> 
>   * igt@i915_module_load@load:
>     - bat-mtlp-9:         [DMESG-WARN][24] ([i915#13494]) -> [PASS][25]
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-mtlp-9/igt@i915_module_load@load.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-mtlp-9/igt@i915_module_load@load.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arlh-3:         [DMESG-FAIL][26] ([i915#12061]) -> [PASS][27]
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-arlh-3/igt@i915_selftest@live@workarounds.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-arlh-3/igt@i915_selftest@live@workarounds.html
>     - bat-dg2-9:          [DMESG-FAIL][28] ([i915#12061]) -> [PASS][29] +1 other test pass
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-dg2-9/igt@i915_selftest@live@workarounds.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-dg2-9/igt@i915_selftest@live@workarounds.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_selftest@live:
>     - bat-arlh-3:         [DMESG-FAIL][30] ([i915#12061]) -> [INCOMPLETE][31] ([i915#14764] / [i915#14837])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-arlh-3/igt@i915_selftest@live.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-arlh-3/igt@i915_selftest@live.html
>     - bat-atsm-1:         [DMESG-FAIL][32] ([i915#12061] / [i915#13929]) -> [ABORT][33] ([i915#14201])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8517/bat-atsm-1/igt@i915_selftest@live.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/bat-atsm-1/igt@i915_selftest@live.html
> 
>   
>   [i915#10209]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209
>   [i915#10212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212
>   [i915#10213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213
>   [i915#10214]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214
>   [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
>   [i915#11030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11030
>   [i915#11031]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11031
>   [i915#11032]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11032
>   [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
>   [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
>   [i915#11731]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11731
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
>   [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
>   [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
>   [i915#14201]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201
>   [i915#14764]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14764
>   [i915#14837]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14837
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
>   [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
>   [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8517 -> IGTPW_13662
>   * Linux: CI_DRM_17092 -> CI_DRM_17093
> 
>   CI-20190529: 20190529
>   CI_DRM_17092: 73ec1b82fc684756350c4bb8ee675158ef439bba @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_17093: 94efba53a792987b3649b6370e69f772c2210412 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_13662: 0b9bcc64b0093f2fe4b516f3d84d73ea48d3f23d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8517: 8517
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/index.html
