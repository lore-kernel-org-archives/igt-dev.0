Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F77CC3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 11:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A8510E5D2;
	Wed, 31 Jul 2024 11:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GbEwboat";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86B310E5CD;
 Wed, 31 Jul 2024 11:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722426307; x=1753962307;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dLlsBuihhyfCzGuE0DTGrL6KvfqSdVwYKaN42CfyT5I=;
 b=GbEwboataqWhWLITJot7oXdw1ry39k07iyN/yYxPASn7KdceYC+dMA60
 RNglRdGN9yAarXrZKR5G+UbIZvWHdjwhdNq8oTfLuyXZmc3FVDeXDQGjz
 xheNNO8WK35YiQI3+5lnd3KbU1G6bb4FGh5KysYK4OrLsXj80RLX5ZqWo
 oSPGAFilb93pkbh4sYgd1T0b4NzZQtm+ma4eLXR+wRXl4gRKmRWOLNC/q
 rtmHduoFjdNr9Be32RjN6KS9fd6wHgaE2+WoPRcQgfLMa+RjyJ240n/Ef
 +u31x//6niS2uhsjUxJ/Oj4oUw00G3FCITqbqYc+YCcVjkflWcOD0LFue g==;
X-CSE-ConnectionGUID: Ybe3+joFSzilbHAuNvDaog==
X-CSE-MsgGUID: 9mD+hWn/TuuY7XKTAFE3Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20422085"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="20422085"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 04:45:06 -0700
X-CSE-ConnectionGUID: 71+4BYvATI21hhPt1nSPfQ==
X-CSE-MsgGUID: WXQC04F/R/yLAiiKcdoesw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="85582155"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 04:45:05 -0700
Date: Wed, 31 Jul 2024 13:45:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmbw==?= =?utf-8?Q?r?=
 benchmarks/gem_wsim: Extend engine selection syntax (rev3)
Message-ID: <20240731114502.wescfu6i4453qyn5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240729175219.1636694-1-marcin.bernatowicz@linux.intel.com>
 <172234116085.428730.13827867219870921348@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172234116085.428730.13827867219870921348@2413ebb6fbb6>
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
On 2024-07-30 at 12:06:00 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: benchmarks/gem_wsim: Extend engine selection syntax (rev3)
> URL   : https://patchwork.freedesktop.org/series/128780/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15150_full -> IGTPW_11487_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11487_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11487_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11487/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   Additional (1): shard-snb-0 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11487_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
>     - shard-tglu:         [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15150/shard-tglu-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11487/shard-tglu-9/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-mtlp:         [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15150/shard-mtlp-2/igt@kms_fbcon_fbt@fbc-suspend.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11487/shard-mtlp-8/igt@kms_fbcon_fbt@fbc-suspend.html
> 

Unrelated to benchmark, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11487_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-dg1:          NOTRUN -> [SKIP][5] ([i915#11078])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11487/shard-dg1-15/igt@device_reset@cold-reset-bound.html
>     - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#11078])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11487/shard-rkl-1/igt@device_reset@cold-reset-bound.html
> 
...cut...
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7942 -> IGTPW_11487
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_15150: e64cee35967e4b08dd7f3b3ad6f110927c4699a9 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11487: 11487
>   IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11487/index.html
