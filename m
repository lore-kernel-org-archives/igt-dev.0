Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D12C25B75
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 09:14:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7850910E396;
	Wed, 29 May 2024 09:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/Zi1QiY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D54810E396;
 Wed, 29 May 2024 09:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716974075; x=1748510075;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2nE2kDOc0ANsndFEa2g3sEfL38s2JUUlJNnP2slroHw=;
 b=Y/Zi1QiYqJex4t6UJ7omN5bnWiG9uo2hyOoT4MUc7uWpBmfDQ1W0613x
 7LEeBanpLsBpAmgQYxyt2vpFpUq3LrJ7SzJfsMQMh+9OUgJDYgL+T7V8v
 NVEGYVuorUZgdBpjx6HfRY6scr5RUvTR9O6ffVRkx9cXTzuMlAmnKqElF
 PXlSmaUrmKn26Higd3PsJheDvtLKaEnF/efAmQ8AKtMRZJlTzcJ9s62/b
 uMqiKMuCx5EhGj3SThU+OBcwigaaTijKnRvaqyaiPSvsSfty4Cynxpw4k
 IZBVYCnfqMa90ruWgRaq11UXf3S3qnwM+V7AbAFWFn5K7tFtW6FSpoBji A==;
X-CSE-ConnectionGUID: PhCLOUR7Th6nZKcTrZdo9Q==
X-CSE-MsgGUID: zEUROX29RZmqS2cTQ4cu7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13485683"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="13485683"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 02:14:35 -0700
X-CSE-ConnectionGUID: 8WJ9l09eQSW79o1M+H/DMQ==
X-CSE-MsgGUID: fucAFs72QeqPltALmMdlzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="35985563"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 02:14:33 -0700
Date: Wed, 29 May 2024 11:14:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 lib/gpgpu: add shader support (rev5)
Message-ID: <20240529091418.4lbjdcgycrwm54g4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240528-iga64_inline_ups-v5-0-fdd8e9dcd64c@intel.com>
 <171693562544.2217197.18223813109262861763@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171693562544.2217197.18223813109262861763@8e613ede5ea5>
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
On 2024-05-28 at 22:33:45 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/gpgpu: add shader support (rev5)
> URL   : https://patchwork.freedesktop.org/series/133020/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14840 -> IGTPW_11203
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11203 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11203, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11203/index.html
> 
> Participating hosts (40 -> 38)
> ------------------------------
> 
>   Additional (2): bat-kbl-2 fi-elk-e7500 
>   Missing    (4): fi-glk-j4005 fi-kbl-8809g bat-mtlp-8 bat-mtlp-6 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11203:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-rplp-1:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14840/bat-rplp-1/igt@i915_selftest@live@hangcheck.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11203/bat-rplp-1/igt@i915_selftest@live@hangcheck.html
> 

Unrelated,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11203 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@fbdev@info:
>     - bat-kbl-2:          NOTRUN -> [SKIP][3] ([i915#1849])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11203/bat-kbl-2/igt@fbdev@info.html
> 
>   * igt@gem_lmem_swapping@basic@lmem0:
>     - bat-dg2-11:         [PASS][4] -> [FAIL][5] ([i915#10378])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14840/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11203/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html
>     - bat-dg2-8:          [PASS][6] -> [FAIL][7] ([i915#10378])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14840/bat-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11203/bat-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-kbl-2:          NOTRUN -> [SKIP][8] +39 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11203/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@i915_module_load@load:
>     - bat-dg2-8:          [PASS][9] -> [DMESG-WARN][10] ([i915#10014])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14840/bat-dg2-8/igt@i915_module_load@load.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11203/bat-dg2-8/igt@i915_module_load@load.html
> 
>   * igt@kms_pm_rpm@basic-pci-d3-state:
>     - fi-elk-e7500:       NOTRUN -> [SKIP][11] +24 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11203/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_lmem_swapping@basic@lmem0:
>     - bat-dg2-9:          [FAIL][12] ([i915#10378]) -> [PASS][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14840/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11203/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-bsw-nick:        [ABORT][14] ([i915#10594]) -> [ABORT][15] ([i915#10800])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14840/fi-bsw-nick/igt@i915_selftest@live@execlists.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11203/fi-bsw-nick/igt@i915_selftest@live@execlists.html
> 
>   
>   [i915#10014]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10014
>   [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
>   [i915#10594]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10594
>   [i915#10800]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10800
>   [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7873 -> IGTPW_11203
> 
>   CI-20190529: 20190529
>   CI_DRM_14840: 2f9ce87f366102c67ef40c8223e02c33244a60c0 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11203: 11203
>   IGT_7873: b9bcded9123ac56ce05748de6c4870fb49451b87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11203/index.html
