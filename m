Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD85CA0EED
	for <igt-dev@archiver.kernel.org>; Wed, 20 Aug 2025 08:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C55110E6BB;
	Wed, 20 Aug 2025 08:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nqH22HIh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC7C10E35E;
 Wed, 20 Aug 2025 08:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755679310; x=1787215310;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hLNb/Vn1NS8e9AfeQRu51jSyXK9M5aAX0MzQAacGnHQ=;
 b=nqH22HIhQeAr/o0zsJbX9HjjY9T9gYz6LkJ5Xbby0r0Pc12mEo8+tbYF
 6qAeHu9z0Am6m7nBIiV9kdQE+dBRp0l1+NvuWrhvlNITdiUCoTtubX9fL
 5S8NpighZQhX8UhU3CS1d2bkDW0b5zhMGO3mVbyut3M6QYVePHHJCykJo
 0OKJUAFet7C4IntBGwfrsMWnilFOXRZoo5l+YWT2gHYMBvkV6As9mKygv
 N/uZhkkE4VqYgdTz5MmYYCH8hezRm0SEAHpHH64/LplZ0tHfG3GNP8ZE2
 ebUflgCCQRBD8nZy5yF4tgU8H2p0OGh/2Mi1JhyY9sX/e/06/t62PRpW7 w==;
X-CSE-ConnectionGUID: rbbDBwnXR7WVlWvSCVh7lw==
X-CSE-MsgGUID: 7svjY5pTTvSv86YaMzcYNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58088629"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="58088629"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 01:41:49 -0700
X-CSE-ConnectionGUID: 9iZiG+4sRZCY7euGV0DHMQ==
X-CSE-MsgGUID: xHPr0Gv/Rx6AEU5wh+s+7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="172317192"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 01:41:48 -0700
Date: Wed, 20 Aug 2025 10:41:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Convert kms_3d into subtest
Message-ID: <20250820084146.y5msam5o253dlgoj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250819155058.129794-1-kamil.konieczny@linux.intel.com>
 <175566336946.250473.13965416509169453641@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175566336946.250473.13965416509169453641@1538d3639d33>
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
On 2025-08-20 at 04:16:09 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Convert kms_3d into subtest
> URL   : https://patchwork.freedesktop.org/series/153155/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17032_full -> IGTPW_13600_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13600_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13600_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/index.html
> 
> Participating hosts (12 -> 11)
> ------------------------------
> 
>   Missing    (1): shard-dg2-set2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13600_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_suspend@forcewake:
>     - shard-tglu:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17032/shard-tglu-3/igt@i915_suspend@forcewake.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/shard-tglu-2/igt@i915_suspend@forcewake.html

This is unrelated, no need for rerun.

Regards,
Kamil

> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_17032_full and IGTPW_13600_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@kms_3d@basic:
>     - Statuses : 5 pass(s)
>     - Exec time: [1.42, 3.46] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13600_full that come from known issues:

...cut...
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8498 -> IGTPW_13600
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_17032: 8093b67375779a975c13b9a23c8fcc25cb1e9c83 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_13600: e50acf4e67e6826b14605753615c30666f704747 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8498: 8498
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13600/index.html
