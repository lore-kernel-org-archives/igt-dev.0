Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1653C021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 10:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EF188FAE;
	Wed, 19 Feb 2025 10:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QOzZXjyl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C2A88FAE;
 Wed, 19 Feb 2025 10:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739959479; x=1771495479;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=I8WGcl2vMoJ9f6eB4RYbNoBx6dbu91SMDbmpWiQGrco=;
 b=QOzZXjylJA9xQqWDNiCkd0sMQbAloN6gpcLRNalxuN9bhOPGDHrjrxRf
 bp5ebt49egUd8W6q35CcSAzdiyy/YOEcF2WKndz1SIuH9ewHWGA0DMEZL
 OHg1VH7Tnwzg/4/rAisMJsSFMhjMlQgz4TLglIlCYwF64g75L/fb06uLT
 c6mX3eMIV94RDYtJbO3cwpSGkL418LU0kG9RspwdLIePopAlEu/BSsnir
 FDKdl6ciXlHbiZ1o9ZAEG9WKSdT3FwH6xGqIjwezU6EUj8g1RB9xgY+yg
 tV9dQV79eDF1JjrSt6GL0Wq8wdMH1bcdsMv6s47nsGfb+PFbXXv9LCz49 Q==;
X-CSE-ConnectionGUID: 19jp3cdBRI2LA9lMWhNUwA==
X-CSE-MsgGUID: pt6m0+EZQISGjnSiOTEzFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40703646"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="40703646"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 02:04:39 -0800
X-CSE-ConnectionGUID: ssB3gHVFTjawlGFGP/Un2Q==
X-CSE-MsgGUID: 0wB6WsVATpa8mECLLNAhTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115149630"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 02:04:37 -0800
Date: Wed, 19 Feb 2025 11:04:34 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests=2Fkm?=
 =?utf-8?Q?s=5Fasync=5Fflips=3A?= Create subtest for overlay planes (rev3)
Message-ID: <20250219100434.ovtpq232n34z7mce@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241216202427.76168-1-andrealmeid@igalia.com>
 <173989727220.3614484.14738115741904567291@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173989727220.3614484.14738115741904567291@b555e5b46a47>
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
On 2025-02-18 at 16:47:52 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_async_flips: Create subtest for overlay planes (rev3)
> URL   : https://patchwork.freedesktop.org/series/142386/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8236 -> IGTPW_12625
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12625 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12625, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12625/index.html
> 
> Participating hosts (42 -> 41)
> ------------------------------
> 
>   Additional (1): fi-kbl-7567u 
>   Missing    (2): fi-glk-j4005 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12625:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live:
>     - bat-twl-1:          NOTRUN -> [ABORT][1] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12625/bat-twl-1/igt@i915_selftest@live.html
> 

This is unrelated, please file a bug and re-run.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12625 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-kbl-7567u:       NOTRUN -> [SKIP][2] ([i915#2190])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12625/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - fi-kbl-7567u:       NOTRUN -> [SKIP][3] ([i915#4613]) +3 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12625/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@i915_selftest@live:
>     - bat-twl-2:          NOTRUN -> [ABORT][4] ([i915#12919] / [i915#13503])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12625/bat-twl-2/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@gt_engines:
>     - bat-twl-2:          NOTRUN -> [ABORT][5] ([i915#12919])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12625/bat-twl-2/igt@i915_selftest@live@gt_engines.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - fi-kbl-7567u:       NOTRUN -> [SKIP][6] +11 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12625/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live:
>     - bat-adlp-9:         [ABORT][7] -> [PASS][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-adlp-9/igt@i915_selftest@live.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12625/bat-adlp-9/igt@i915_selftest@live.html
>     - bat-jsl-3:          [INCOMPLETE][9] ([i915#12445] / [i915#13241]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-jsl-3/igt@i915_selftest@live.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12625/bat-jsl-3/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@guc:
>     - bat-adlp-9:         [ABORT][11] ([i915#13696]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-adlp-9/igt@i915_selftest@live@guc.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12625/bat-adlp-9/igt@i915_selftest@live@guc.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arlh-2:         [DMESG-FAIL][13] ([i915#12061]) -> [PASS][14] +1 other test pass
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-arlh-2/igt@i915_selftest@live@workarounds.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12625/bat-arlh-2/igt@i915_selftest@live@workarounds.html
>     - bat-mtlp-6:         [DMESG-FAIL][15] ([i915#12061]) -> [PASS][16] +1 other test pass
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12625/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
>     - bat-arls-6:         [DMESG-FAIL][17] ([i915#12061]) -> [PASS][18] +1 other test pass
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-arls-6/igt@i915_selftest@live@workarounds.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12625/bat-arls-6/igt@i915_selftest@live@workarounds.html
> 
>   
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#12445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445
>   [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
>   [i915#13241]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13241
>   [i915#13503]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13503
>   [i915#13696]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13696
>   [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8236 -> IGTPW_12625
> 
>   CI-20190529: 20190529
>   CI_DRM_16149: 4587c05996666a92af63f86ba410bae1dc940794 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12625: 12625
>   IGT_8236: 8236
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12625/index.html
