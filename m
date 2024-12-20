Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB166E7718C
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 16:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8387410E229;
	Fri, 20 Dec 2024 16:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U7jPImsV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4F410E118;
 Fri, 20 Dec 2024 16:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734711767; x=1766247767;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uxsCXHXUW38cVzIajkZGcy15PRnyf07Xih4TcmpjH0o=;
 b=U7jPImsVt+Y7fqu7331KIuN9gWPK+oJFJ8WPABwfkB98GQwJGCpZ4S81
 KO33ck3ZoR+5150e0M3hbv2MPXrcVStBTfK5U1n2apdvb/ulNsVkuG1VZ
 Bj5K+cmV25GrAso5Za3JbS3pU6uy/hRMvvlkI92pc9uh1JEywmrqmKKq5
 y/IMJZb1DzftMFkV/fzY1yrkcl/Wqylg0ByQ93EFkzEnfD7ctz4XcwNnQ
 ibYUaiPHkULQuJWAAHbjnE4BFbgB7B+Eu77GmetQrcTNHFUfRodGo5w3u
 sN2lOMHFMKnS8thZ+zt0jXnXwulTLuJdS8g+wxGOAlsDkD3W8w7gRJxto A==;
X-CSE-ConnectionGUID: X6i2ZTfAQ/qvswg3oKr6yw==
X-CSE-MsgGUID: 2MoppoRVRZWZho7NAiubeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38948212"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="38948212"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 08:22:47 -0800
X-CSE-ConnectionGUID: C0HhWJ6eR3evM2t720iHyA==
X-CSE-MsgGUID: r5IIMsMuSMulY9UskRCTgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99383329"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 08:22:46 -0800
Date: Fri, 20 Dec 2024 17:22:43 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXI=?= =?utf-8?Q?e?= for
 tests/intel/xe_drm_fdinfo: Do not destroy NULL xe_cork
Message-ID: <20241220162243.z2kwwzldwdmcpp5p@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241218160808.65340-1-jonathan.cavitt@intel.com>
 <173456459155.212155.398582714929753119@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173456459155.212155.398582714929753119@b555e5b46a47>
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
On 2024-12-18 at 23:29:51 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_drm_fdinfo: Do not destroy NULL xe_cork
> URL   : https://patchwork.freedesktop.org/series/142799/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8164 -> IGTPW_12346
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12346 absolutely need to be
>   verified manually.

Not related to change in Xe test.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12346, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12346/index.html
> 
> Participating hosts (45 -> 44)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12346:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gt_pm:
>     - bat-adlp-11:        [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8164/bat-adlp-11/igt@i915_selftest@live@gt_pm.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12346/bat-adlp-11/igt@i915_selftest@live@gt_pm.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12346 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live:
>     - bat-adlp-11:        [PASS][3] -> [DMESG-FAIL][4] ([i915#12435])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8164/bat-adlp-11/igt@i915_selftest@live.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12346/bat-adlp-11/igt@i915_selftest@live.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@late_gt_pm:
>     - fi-cfl-8109u:       [DMESG-WARN][5] ([i915#11621]) -> [PASS][6] +132 other tests pass
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8164/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12346/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arls-5:         [ABORT][7] ([i915#12061]) -> [PASS][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8164/bat-arls-5/igt@i915_selftest@live@workarounds.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12346/bat-arls-5/igt@i915_selftest@live@workarounds.html
>     - {bat-mtlp-9}:       [ABORT][9] ([i915#12061]) -> [PASS][10] +1 other test pass
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8164/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12346/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#12435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12435
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8164 -> IGTPW_12346
>   * Linux: CI_DRM_15864 -> CI_DRM_15865
> 
>   CI-20190529: 20190529
>   CI_DRM_15864: e9a5d74b7f60fe6f7d55ebe636ff871214b6caec @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_15865: d8f0c44e2ed948dcc45d04a0dfa83612995a702b @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12346: e0bdee76b128153a559de450199ebd3fec2ac24c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8164: e9d9934c7c6dc6878792d82424fc928e7f6996cb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12346/index.html
