Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06271C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 09:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B469710E76D;
	Thu, 18 Jan 2024 09:39:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E15210E76D;
 Thu, 18 Jan 2024 09:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705570794; x=1737106794;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qo74c4LJXrRAZm2tSqO3YiQh915KuhnlNkdKbMnxSEc=;
 b=VA4Z9UTwcEnYXyHUhhZFFEai8A7ikNOP0C0oBZal4W5rLZpx2QsSKkrD
 AY3w7bZklVZYs4loVu5q9EHEq0ZIxv7J4F0aBjG5FdgcdCrJOxfC388e/
 wuIL3SH1czE9wyLl1vA6LvC5EiZDQ7LduLr8L9jBH4ebf9J+oYU3fxOdr
 AESUdGGZz77mG3SX7gfhCnldnnaDWPKrv5E/+4E2o6rtAkjJfCjSUeOmY
 gfHuTl4DFqrUF/KqXkfMagaXzShxJO7x7fGOhrlD+mjwKaK/8GqsJul5n
 fiWe6xwwa6NqnFICfOqXHFDNnEeftE+4t9vXkkp+1dLumEUTHgjA5MhsE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="400067630"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="400067630"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 01:39:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="33063728"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 01:39:35 -0800
Date: Thu, 18 Jan 2024 10:39:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for Fix
 CAT error by adjusting prefetch size for Xe2
Message-ID: <20240118093932.jklhx2bnmb24mwrf@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <440d8d632ad08907dd8fc7ac1b8322176c2b48df.1705523804.git.jagmeet.randhawa@intel.com>
 <170554340057.537693.5824917410705579131@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170554340057.537693.5824917410705579131@5338d5abeb45>
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
Cc: lgci.bug.filing@intel.com, I915-ci-infra@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi igt-dev,
On 2024-01-18 at 02:03:20 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix CAT error by adjusting prefetch size for Xe2
> URL   : https://patchwork.freedesktop.org/series/128904/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14134_full -> IGTPW_10548_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10548_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10548_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10548/index.html
> 
> Participating hosts (9 -> 8)
> ------------------------------
> 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10548_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-mtlp:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14134/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10548/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-dg2:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14134/shard-dg2-5/igt@i915_pm_rps@reset.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10548/shard-dg2-10/igt@i915_pm_rps@reset.html
>     - shard-dg1:          [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14134/shard-dg1-16/igt@i915_pm_rps@reset.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10548/shard-dg1-17/igt@i915_pm_rps@reset.html
> 
>   * igt@runner@aborted:
>     - shard-glk:          NOTRUN -> [FAIL][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10548/shard-glk1/igt@runner@aborted.html
> 

Unrelated to Xe test, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10548_full that come from known issues:
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7678 -> IGTPW_10548
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14134: 6002d529f9fe420895d407e481d39b19b58ec001 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10548: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10548/index.html
>   IGT_7678: 9f0b63bae98fa6164dd2262f8890a964fb1fc23d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10548/index.html
