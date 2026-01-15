Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D32D41177
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 11:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2CD10E73F;
	Thu, 15 Jan 2026 11:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Az8M8nYq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CCE10E73F
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 11:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768477695; x=1800013695;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=bLPtOi9u3FH1KQOw5OXQYS1a87A5y1i2XA+j5U0MXdo=;
 b=Az8M8nYqFPxISJ/dh8KjH5E71XcyyoQ0hkRDTHV9wjmELNAcrv/a7Tpm
 rXqQWI+63iRu2H6z6SKkD7BdSRHK7nLTFeFklpg1IsdG6jCS5j9KieeG9
 dJbK/ZFYSlH4t9fpd73W/d7r8G5CBmDRrvT0gRJl8QkEHxLz9K4GcVRbo
 juJ37DASalKq214Wb7Zay0NEWzxEzsmAUkoZzRXkuJ87cLP2r08qDNovf
 oNQMROm2ay9r/AdWi9/RlYfL5BRPb/eXgJDzcqgC8tkDV/10WnDr0gGt4
 OP04TiyToEJDXHi+0yZP5bjql3fooh17oBwHdpQDs1DH6pRUmLYAiWKh2 Q==;
X-CSE-ConnectionGUID: cuUQCIb2Tsmmf5l1I3sJug==
X-CSE-MsgGUID: bdBW/QkwQ+CjepF8nPfLcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69947721"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="69947721"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 03:48:14 -0800
X-CSE-ConnectionGUID: ZvTvWaBfSmmIDdWV4tJw4w==
X-CSE-MsgGUID: oAoqoXNhSRuKwta4gn+sRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="209412309"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 03:48:13 -0800
Date: Thu, 15 Jan 2026 12:48:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 RFC: cut successful dmesg logs
Message-ID: <20260115114810.3jd4eb3sfnbg42hz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260112165006.237964-1-kamil.konieczny@linux.intel.com>
 <176824874497.147209.10091541703444441950@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176824874497.147209.10091541703444441950@a3b018990fe9>
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
On 2026-01-12 at 20:12:24 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: RFC: cut successful dmesg logs
> URL   : https://patchwork.freedesktop.org/series/159973/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8697 -> IGTPW_14325
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14325 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14325, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14325/index.html
> 
> Participating hosts (42 -> 41)
> ------------------------------
> 
>   Additional (1): fi-kbl-7567u 
>   Missing    (2): bat-dg2-13 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14325:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@sanitycheck:
>     - bat-arlh-2:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8697/bat-arlh-2/igt@i915_selftest@live@sanitycheck.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14325/bat-arlh-2/igt@i915_selftest@live@sanitycheck.html

Unrelated, no need for respin as this is only igt_runner change.

Regards,
Kamil

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14325 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-kbl-7567u:       NOTRUN -> [SKIP][3] ([i915#2190])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14325/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - fi-kbl-7567u:       NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14325/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@i915_selftest@live:
>     - bat-arlh-2:         [PASS][5] -> [INCOMPLETE][6] ([i915#14837])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8697/bat-arlh-2/igt@i915_selftest@live.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14325/bat-arlh-2/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arls-5:         [PASS][7] -> [DMESG-FAIL][8] ([i915#12061]) +1 other test dmesg-fail
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8697/bat-arls-5/igt@i915_selftest@live@workarounds.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14325/bat-arls-5/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - fi-kbl-7567u:       NOTRUN -> [SKIP][9] +12 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14325/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arls-6:         [DMESG-FAIL][10] ([i915#12061]) -> [PASS][11] +1 other test pass
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8697/bat-arls-6/igt@i915_selftest@live@workarounds.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14325/bat-arls-6/igt@i915_selftest@live@workarounds.html
> 
>   
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#14837]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14837
>   [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8697 -> IGTPW_14325
>   * Linux: CI_DRM_17808 -> CI_DRM_17809
> 
>   CI-20190529: 20190529
>   CI_DRM_17808: 630dc29de423d3640e7b2ee4a7125e0433d9eb7f @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_17809: 38e0a7138ef62d49ddc449601fc5456099ef33b2 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_14325: 8d9a0e2390df3dd43be75fce0dac1d387b0a0a6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8697: 8697
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14325/index.html
