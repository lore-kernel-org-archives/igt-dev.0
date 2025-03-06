Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B48C282EC
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 12:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9887B10E95E;
	Thu,  6 Mar 2025 12:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQOnJR37";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA3C10E963;
 Thu,  6 Mar 2025 12:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741265266; x=1772801266;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EM26HrUjCDSYyL6biuV7hclQn24mp6V1EAH0rJLdOHM=;
 b=EQOnJR37e5z/EBomFHFX89yAOjfZGIMPPZ4/xgiaOQ20TwBlMn9WXFhT
 KijEpQ/IX936WypR1cHrL6ADfsuYMyRTpEX1PzEzPbXXYpe2k4KtMYJDA
 xPO53YKaMtsB3tReW9vGB5BViwQudTQQzUjMuVVajpofiGDWx5MK8gVHO
 7qniB4R4wJShs3+wWcuHWNGQJFiytYlpZ2j0Ocv8faGWZrGKqqBLLJHZD
 QzKWwI5PFUeDlVNbyypbS2NmUR8sxk4B2xqVkVFTrvbL47TJOS8Au0jx1
 /svARX/6phb42U4u/5g6hT76ruWn6L5CyWNpKS9Teggg14i5J/QeoE+OL w==;
X-CSE-ConnectionGUID: zmLMMKSdS++UniCRHR8zXQ==
X-CSE-MsgGUID: UJjzE3u6SeC4PEhZSFyYpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42404269"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="42404269"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 04:47:45 -0800
X-CSE-ConnectionGUID: Df6DollnQ6yXuyzYr9UGJw==
X-CSE-MsgGUID: f8KYFuquTCCj0PYQVzMMeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="124104214"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 04:47:43 -0800
Date: Thu, 6 Mar 2025 13:47:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests=2Fi?=
 =?utf-8?Q?ntel=2Fkms=5Fdraw=5Fcrc?= =?utf-8?Q?=3A?= Skip formats not
 supported by the plane (rev2)
Message-ID: <20250306124741.7ti2x4dzrafjhi5l@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250303110235.15976-1-ville.syrjala@linux.intel.com>
 <174123895065.65697.8998335499556489574@64e06c682a23>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174123895065.65697.8998335499556489574@64e06c682a23>
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
On 2025-03-06 at 05:29:10 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/kms_draw_crc: Skip formats not supported by the plane (rev2)
> URL   : https://patchwork.freedesktop.org/series/145712/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8262_full -> IGTPW_12705_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12705_full absolutely need to be
>   verified manually.

Unrelated, no need for re-run.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12705_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12705/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12705_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_compute@compute-square:
>     - shard-mtlp:         NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12705/shard-mtlp-1/igt@gem_compute@compute-square.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12705_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-keep-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][2] ([i915#8411]) +1 other test skip
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12705/shard-rkl-4/igt@api_intel_bb@object-reloc-keep-cache.html
> 
>   * igt@drm_fdinfo@busy-hang@bcs0:
>     - shard-dg2-9:        NOTRUN -> [SKIP][3] ([i915#8414]) +8 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12705/shard-dg2-9/igt@drm_fdinfo@busy-hang@bcs0.html
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8262 -> IGTPW_12705
> 
>   CI-20190529: 20190529
>   CI_DRM_16231: 3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12705: 12705
>   IGT_8262: 8262
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12705/index.html
