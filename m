Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D93CC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 17:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1A710E338;
	Mon, 19 Aug 2024 17:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9SoGEBg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49B910E338;
 Mon, 19 Aug 2024 17:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724089567; x=1755625567;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Omry94EtFJBOJXfXSfRFgX1uTviej7o/aUpkL+eBHv8=;
 b=h9SoGEBg82+r9YMJ2wZaU+NMOfN3FowTf/9jhG1vMfDLMC0/GpMOS6dw
 EsURu1laHq89kVXUBR5zbbBuuZrQiNWfKespfoa11UV+MNsofOPj+ZGVr
 T7pQuYDdBGKjlXAE4IcUGJcLgN8cZmPFZztb2UnJw09PbW8I4Rc6RFoZE
 hMCm7P5LYp3vCZdqqoQkXhMD5VCGmHYVRdV5D4CezHwwB/n+ZVKiGcrbu
 /7y58d62LnWtI6SXVeQZihKjvuPEjD3rli+tuOCXTUVzSB3G8zuM9hQTt
 Fatlw0jY6soWJwl3pmx8K1ezu2ofMyjZ+TMdBLe4vT/FzjM/DRDf3LgBe w==;
X-CSE-ConnectionGUID: mEVFs8V1QAaP0QspQDFnpg==
X-CSE-MsgGUID: HhBGtwevR6mJaEp/MGNVBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26108616"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="26108616"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 10:46:04 -0700
X-CSE-ConnectionGUID: Ws7t/tLPSOacKs6CsJ10/Q==
X-CSE-MsgGUID: k2hUn1uxQq2uOPK6c53pjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="60154977"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 10:46:03 -0700
Date: Mon, 19 Aug 2024 19:46:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tools/dpcd_reg: Advertise the dump command in usage text
Message-ID: <20240819174600.jhg7wpr5ovpkkxdl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240815191626.49244-1-gustavo.sousa@intel.com>
 <172380404179.653293.13831736505805369496@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172380404179.653293.13831736505805369496@2413ebb6fbb6>
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
On 2024-08-16 at 10:27:21 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tools/dpcd_reg: Advertise the dump command in usage text
> URL   : https://patchwork.freedesktop.org/series/137354/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7971_full -> IGTPW_11586_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11586_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11586_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11586/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11586_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_ctx_persistence@hostile:
>     - shard-mtlp:         NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11586/shard-mtlp-7/igt@gem_ctx_persistence@hostile.html
> 
>   * igt@i915_module_load@resize-bar:
>     - shard-dg2:          [PASS][2] -> [ABORT][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7971/shard-dg2-11/igt@i915_module_load@resize-bar.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11586/shard-dg2-4/igt@i915_module_load@resize-bar.html
> 
>   * igt@i915_pm_rpm@gem-idle:
>     - shard-dg2:          [PASS][4] -> [SKIP][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7971/shard-dg2-8/igt@i915_pm_rpm@gem-idle.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11586/shard-dg2-11/igt@i915_pm_rpm@gem-idle.html
> 

Unrelated to tools change, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11586_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_allocator@open-vm:
>     - shard-dg2:          [PASS][6] -> [SKIP][7] +2 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7971/shard-dg2-11/igt@api_intel_allocator@open-vm.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11586/shard-dg2-11/igt@api_intel_allocator@open-vm.html

...cut...

> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11586/index.html
