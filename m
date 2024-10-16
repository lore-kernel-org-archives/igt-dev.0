Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E555AD1AD5D
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 13:56:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DF210E711;
	Wed, 16 Oct 2024 13:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kqvfFhuv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427D810E710;
 Wed, 16 Oct 2024 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729086981; x=1760622981;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1T7GOSf6UEOI06UgXSV3hghnP81Paf/giQK6dJXRsPA=;
 b=kqvfFhuvxXwrBF3gO07a/ncQqBZekImVolm0gNNJ7ehVmR/O7en7MHEB
 hflFAboeI7GSoetRokCqrWdbX/V+6GY++HA/ztmxII+Ha+8wEWn1tc+2Q
 aD7zg6cUMb17dCMh6hEg5T2v93DXvGwo/warjcbY/pFi8w/qXEIHnTSuZ
 gmoSVKsKZY2O8reebwFJDOSoPrMf2QN6D1YOFk2gmBlqeHEtqvPojIxUs
 NDcep7w+bZYdqyFd3OZlsY22LQHbPYo2TTqmDuM5KYCBKk3emoYXieGIJ
 joDW9qLW6Qj/jYoqcBMY/RHUA45NiX9zB3wdEfvVF15URx4t7eaqOuOXu w==;
X-CSE-ConnectionGUID: HyQgNad7Q1apbbp6JWOu8g==
X-CSE-MsgGUID: QlpoqhyAQeO6xrRkma67Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="32458604"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="32458604"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 06:56:21 -0700
X-CSE-ConnectionGUID: tta6IK9LSlubFgnuIYcdvg==
X-CSE-MsgGUID: 4MTjr4UFSHCgCCvAxywEOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="101563872"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:56:20 -0700
Date: Wed, 16 Oct 2024 15:55:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 rename drm_fdinfo into i915_fdinfo
Message-ID: <20241016135559.izznvvzj7xestaex@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20241016110144.87187-1-kamil.konieczny@linux.intel.com>
 <172908076376.1273660.16820494403668651399@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172908076376.1273660.16820494403668651399@2413ebb6fbb6>
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
On 2024-10-16 at 12:12:43 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: rename drm_fdinfo into i915_fdinfo
> URL   : https://patchwork.freedesktop.org/series/140053/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8077 -> IGTPW_11923
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11923 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11923, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11923/index.html
> 
> Participating hosts (44 -> 43)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11923:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - bat-dg2-13:         [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8077/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11923/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11923 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live:
>     - bat-mtlp-8:         [PASS][3] -> [ABORT][4] ([i915#12216]) +1 other test abort
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8077/bat-mtlp-8/igt@i915_selftest@live.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11923/bat-mtlp-8/igt@i915_selftest@live.html
>     - bat-twl-1:          [PASS][5] -> [INCOMPLETE][6] ([i915#12133] / [i915#9413])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8077/bat-twl-1/igt@i915_selftest@live.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11923/bat-twl-1/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@gt_lrc:
>     - bat-twl-1:          [PASS][7] -> [INCOMPLETE][8] ([i915#9413])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8077/bat-twl-1/igt@i915_selftest@live@gt_lrc.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11923/bat-twl-1/igt@i915_selftest@live@gt_lrc.html
> 

This is  unrelated to test renamed from drm_fdinfo into i915_fdinfo.

Regards,
Kamil

>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live:
>     - fi-bsw-n3050:       [DMESG-FAIL][9] ([i915#12172]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8077/fi-bsw-n3050/igt@i915_selftest@live.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11923/fi-bsw-n3050/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@active:
>     - fi-bsw-n3050:       [DMESG-FAIL][11] ([i915#12435]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8077/fi-bsw-n3050/igt@i915_selftest@live@active.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11923/fi-bsw-n3050/igt@i915_selftest@live@active.html
> 
>   
>   [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
>   [i915#12172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12172
>   [i915#12216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12216
>   [i915#12435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12435
>   [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8077 -> IGTPW_11923
> 
>   CI-20190529: 20190529
>   CI_DRM_15540: 12e4970af1ecdeb76e94df2daf51a9c3d6b9f519 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11923: cc1c6cf482a298d01e54b29ebf022e44ee014df5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8077: 42f9e9702f74a4993318adea936baaa186084689 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11923/index.html
