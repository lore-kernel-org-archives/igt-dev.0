Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C34C47DAF
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 09:36:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FBA10E06E;
	Thu, 18 Jan 2024 09:36:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCC210E06E;
 Thu, 18 Jan 2024 09:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705570582; x=1737106582;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0HsWc1kDOUQbjGczu+4IB6wqVnvzhXTK0onkoHdAVEo=;
 b=iQt0YEZpPqv/bQIbRGM5f9WE0xyCznJfA6YOfCurPl88UQZ221M7JJJm
 l7liRuOQz/r8XXvzVg9/v/2MFS3GAz8dfVjxcWHBzpcw0iTt6cavM0zM1
 K1hCaEb4cX4Vlt+H1fyiakxnoiGIQiZVVHbsCjNzvo7jsylu/wEEw59/h
 7rKra7TUzd0e3B4lEWXjqcn0HnsZpWmWNSQyTyHvEDtq2lMNu/Xuvp2Su
 L3Pf8Auif8yMYmx7vOfH30Uh4TkYiBSp4vzNx4c57FnYLdtwC4J2y7q07
 v8fqBt2wyBvYJFirrKqUP4Bxkh/A3GNDtsEQR5ChUvfmfBflrKRZpxWg3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="18996954"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="18996954"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 01:36:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="271764"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 01:36:18 -0800
Date: Thu, 18 Jan 2024 10:36:04 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_series_start?=
 =?utf-8?Q?ing?= with [i-g-t,v5,1/3] tests/intel: Add xe_exec_atomic test
Message-ID: <20240118093604.yg2pofg7pcdih6ly@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240117172848.21144-1-nirmoy.das@intel.com>
 <170553338164.537693.14927519181958937800@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170553338164.537693.14927519181958937800@5338d5abeb45>
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
Cc: lgci.bug.filing@intel.com, I915-ci-infra@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi igt-dev,
On 2024-01-17 at 23:16:21 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,v5,1/3] tests/intel: Add xe_exec_atomic test
> URL   : https://patchwork.freedesktop.org/series/128891/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14133_full -> IGTPW_10547_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10547_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10547_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10547/index.html
> 
> Participating hosts (9 -> 8)
> ------------------------------
> 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10547_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_softpin@noreloc-s3:
>     - shard-dg2:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14133/shard-dg2-1/igt@gem_softpin@noreloc-s3.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10547/shard-dg2-1/igt@gem_softpin@noreloc-s3.html
> 
>   * igt@i915_hangman@detector@vcs0:
>     - shard-mtlp:         [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14133/shard-mtlp-2/igt@i915_hangman@detector@vcs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10547/shard-mtlp-4/igt@i915_hangman@detector@vcs0.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
>     - shard-dg2:          NOTRUN -> [FAIL][5] +2 other tests fail
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10547/shard-dg2-1/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-mtlp:         [SKIP][6] ([i915#9292]) -> [SKIP][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14133/shard-mtlp-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10547/shard-mtlp-8/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 

These are unrelated to change in Xe test, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10547_full that come from known issues:

...cut...

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7678 -> IGTPW_10547
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14133: e492ced01835ac1c2712724ed5728057f267b111 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10547: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10547/index.html
>   IGT_7678: 9f0b63bae98fa6164dd2262f8890a964fb1fc23d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10547/index.html
