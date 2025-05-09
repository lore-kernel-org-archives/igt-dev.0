Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B7AC3ABC3
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 07:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED5410E9AE;
	Fri,  9 May 2025 07:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eoZQmPpX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4964B10E9AE
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 07:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746776380; x=1778312380;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=xReg4Bini+54jqI7PA7iZkavwTMDsGyIkrqmjta1FT8=;
 b=eoZQmPpX/FwTLclP91WyAAD71TvIZDTZ1RL+Z9z5/hFzyeKonU8a2VYT
 u3YJnztUjTQJUGL80vd3zX/JQ6bghCXdI3YukqaMH7DcI3vqwiHxlmNYW
 eEPWdvulgqb8AdHlV2FogzecXubx2aYQh+rp1hSGAOtvMTav8jgjecogk
 oo461BWDqUqEU1oz9s363otpFu1B2UCyITKI4e/ZG/YkOpqhEI4fc2cGr
 ZaS+xGJZhyOmxwBz/gmu1R7YYnxj5F+Af+NPbBIgN18G2mdeNgEB2G65X
 PB7hSOzTwgUV+N6tqoXSq5Vw+1w3y0c2/0zQ92/bdlE4ZJCiBmwa43C0g w==;
X-CSE-ConnectionGUID: 97HsArNqQq64Tz0ZXQ5xKg==
X-CSE-MsgGUID: 8l8Kz8cNTiS1k3Ue2Ch6EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48708340"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48708340"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:39:40 -0700
X-CSE-ConnectionGUID: hf4BJBcyQ4+QWNF6rn8tIA==
X-CSE-MsgGUID: p2Up283JRiSCWR3bkcuQzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="140601227"
Received: from apalm-mobl1.ger.corp.intel.com (HELO [10.245.84.12])
 ([10.245.84.12])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:39:39 -0700
Message-ID: <6716d404-9781-48f3-a7ea-dd97f3438ea7@linux.intel.com>
Date: Fri, 9 May 2025 09:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib/xe/xe?=
 =?UTF-8?Q?=5Flegacy=3A_Move_test=5Flegacy=5Fmode_to_lib/_=28rev3=29?=
To: igt-dev@lists.freedesktop.org
References: <20250417193032.329-1-peter.senna@linux.intel.com>
 <174674485872.61061.583445444777915905@c664b1dc75d1>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174674485872.61061.583445444777915905@c664b1dc75d1>
Content-Type: text/plain; charset=UTF-8
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

Dear I915,

On 5/9/2025 12:54 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/xe/xe_legacy: Move test_legacy_mode to lib/ (rev3)
> URL   : https://patchwork.freedesktop.org/series/147939/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16518_full -> IGTPW_13098_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13098_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13098_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/index.html
> 
> Participating hosts (10 -> 11)
> ------------------------------
> 
>   Additional (1): shard-dg2-set2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13098_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@load:
>     - shard-dg2:          ([PASS][1], [PASS][2], [PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22]) -> ([PASS][23], [PASS][24], [PASS][25], [PASS][26], [PASS][27], [PASS][28], [PASS][29], [PASS][30], [PASS][31], [PASS][32], [PASS][33], [PASS][34], [PASS][35], [PASS][36], [PASS][37], [PASS][38], [PASS][39], [PASS][40], [PASS][41], [DMESG-WARN][42], [PASS][43], [PASS][44], [PASS][45])
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-8/igt@i915_module_load@load.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-10/igt@i915_module_load@load.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-3/igt@i915_module_load@load.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-7/igt@i915_module_load@load.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-6/igt@i915_module_load@load.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-4/igt@i915_module_load@load.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-2/igt@i915_module_load@load.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-7/igt@i915_module_load@load.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-10/igt@i915_module_load@load.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-6/igt@i915_module_load@load.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-11/igt@i915_module_load@load.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-1/igt@i915_module_load@load.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-1/igt@i915_module_load@load.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-4/igt@i915_module_load@load.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-5/igt@i915_module_load@load.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-8/igt@i915_module_load@load.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-11/igt@i915_module_load@load.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-11/igt@i915_module_load@load.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-5/igt@i915_module_load@load.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-10/igt@i915_module_load@load.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-2/igt@i915_module_load@load.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-dg2-3/igt@i915_module_load@load.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-8/igt@i915_module_load@load.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-6/igt@i915_module_load@load.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-11/igt@i915_module_load@load.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-3/igt@i915_module_load@load.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-5/igt@i915_module_load@load.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-1/igt@i915_module_load@load.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-4/igt@i915_module_load@load.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-10/igt@i915_module_load@load.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-4/igt@i915_module_load@load.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-7/igt@i915_module_load@load.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-11/igt@i915_module_load@load.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-3/igt@i915_module_load@load.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-11/igt@i915_module_load@load.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-1/igt@i915_module_load@load.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-4/igt@i915_module_load@load.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-5/igt@i915_module_load@load.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-7/igt@i915_module_load@load.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-6/igt@i915_module_load@load.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-2/igt@i915_module_load@load.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-2/igt@i915_module_load@load.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-8/igt@i915_module_load@load.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-10/igt@i915_module_load@load.html
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg2-2/igt@i915_module_load@load.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-dg1:          NOTRUN -> [FAIL][46]
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-dg1-12/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_plane_multiple@tiling-4:
>     - shard-rkl:          NOTRUN -> [SKIP][47]
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-rkl-5/igt@kms_plane_multiple@tiling-4.html
> 
>   * igt@kms_psr@psr2-cursor-plane-move@edp-1:
>     - shard-mtlp:         [PASS][48] -> [FAIL][49] +1 other test fail
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16518/shard-mtlp-2/igt@kms_psr@psr2-cursor-plane-move@edp-1.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13098/shard-mtlp-6/igt@kms_psr@psr2-cursor-plane-move@edp-1.html

These are unrelated to my change. Please re-submit.

[...]
