Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28805C021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 16:11:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC34310E413;
	Tue, 18 Feb 2025 16:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEzsdcqY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48A910E3F9;
 Tue, 18 Feb 2025 16:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739895088; x=1771431088;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z9t1y5606XwCW04wgX3bWNU/UFg/Zjqx/ZkOtxKm4tk=;
 b=cEzsdcqY8MQlLYYXVE4pG3mDyupH8zhTUETeW1tvWP16ClF8jKwRWPjR
 ton9GOl5iQ6Ia/omiJCqPfX53zI/jxuPKm0JXw9NoWsefmfcb3UXBgtPL
 aOlpM+Datx3ECqaCXt3MENDkCFQPh87xhskCRm5ngkzcNd95xOkgn/2hP
 ogjHsAAa6JjDt8ZG9v6nXYuBYw/AQcqBJMxaro0V1916vf19DqpRsuBe5
 oBredrwCmxaob3h0sRPl6vSS4MmUgyUhAdn3pZ78iVWwrGZyQOU3bj6KC
 8jHxfup14fBIlTnO8Qx6CYjTTft2CkEBlTJL9BsVCo+wIS+YaQo/DFpP0 w==;
X-CSE-ConnectionGUID: OSPh0bBMQaqudxLNyBQU/w==
X-CSE-MsgGUID: Q6OYNc6yTEijqVa30BTsLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40459489"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="40459489"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 08:11:28 -0800
X-CSE-ConnectionGUID: AUPW1JR3Qd+YaycB9/vXmQ==
X-CSE-MsgGUID: VQJK3jHySvCbpvUWTZghVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145343872"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 08:11:26 -0800
Date: Tue, 18 Feb 2025 17:11:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 tools: rename lsfacts into igt_facts
Message-ID: <20250218161123.xndikhqaht63v6xd@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250217133229.104948-1-kamil.konieczny@linux.intel.com>
 <173980386034.3285559.18258022132010550838@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173980386034.3285559.18258022132010550838@b555e5b46a47>
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
On 2025-02-17 at 14:51:00 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tools: rename lsfacts into igt_facts
> URL   : https://patchwork.freedesktop.org/series/144952/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8235 -> IGTPW_12614
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12614 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12614, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12614/index.html

Unrelated as this is a tool change, no tests nor libs changed.

Regards,
Kamil

> 
> Participating hosts (42 -> 40)
> ------------------------------
> 
>   Missing    (2): fi-bsw-nick fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12614:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live:
>     - bat-adlp-6:         [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8235/bat-adlp-6/igt@i915_selftest@live.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12614/bat-adlp-6/igt@i915_selftest@live.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12614 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arlh-3:         [PASS][3] -> [DMESG-FAIL][4] ([i915#12061]) +1 other test dmesg-fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8235/bat-arlh-3/igt@i915_selftest@live@workarounds.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12614/bat-arlh-3/igt@i915_selftest@live@workarounds.html
>     - bat-mtlp-6:         [PASS][5] -> [DMESG-FAIL][6] ([i915#12061]) +1 other test dmesg-fail
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8235/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12614/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
>     - bat-mtlp-9:         [PASS][7] -> [DMESG-FAIL][8] ([i915#12061])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8235/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12614/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_pm_rpm@basic-rte:
>     - bat-rpls-4:         [PASS][9] -> [DMESG-WARN][10] ([i915#13400])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8235/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12614/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_module_load@load:
>     - bat-mtlp-9:         [DMESG-WARN][11] ([i915#13494]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8235/bat-mtlp-9/igt@i915_module_load@load.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12614/bat-mtlp-9/igt@i915_module_load@load.html
> 
>   
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
>   [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8235 -> IGTPW_12614
>   * Linux: CI_DRM_16143 -> CI_DRM_16144
> 
>   CI-20190529: 20190529
>   CI_DRM_16143: 297dc497ff4e957b8a82d4d9f67631e322bdd2a5 @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_16144: 2269ae390491a4d5ba7f0b86befde426a9eedd95 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12614: fcf3a4bab154798c24335cdce60a7f91c5e8ddb3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8235: e7e14eff66bc42329903ee579f019094cf1fdfce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12614/index.html
