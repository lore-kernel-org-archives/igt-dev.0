Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD84C48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 10:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4FF10FF25;
	Mon,  4 Mar 2024 10:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UY+u/AV2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E830D10FF28;
 Mon,  4 Mar 2024 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709546869; x=1741082869;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PYoWQXRloOdQH7iOZ+V8l1XKsZgQ2XGQXYXDU38uOdg=;
 b=UY+u/AV2W+GeQJ185Qsu25jE/8RS1XmRVVSStWK3C537abAvY1nVFKbj
 MT6K+oy5/Sp3ambPe9R54Qi+aJHaET8dfrOHkBiOkaSKr20/HfYmOueoE
 abwzDb8+Quib/WOwUweViMwOTBgTWqGKiJjq1kOqeOXS+7I2EfHi6LAjf
 EQzO8IleK+l0ghh3vg0LVjB7Un7GlkScuwmlRoLkKPveGenVVQMAQ8ExF
 dmAhBFzFtYNuGpOASzutqwE7xbiyvLi1bD3epiKxT6xvMrWLmwR8yr8b6
 FVNHOD4zG1+K180p6txzfi8SFqxOk23zR8ZzewBmuGqrqzWkg+p26eZRb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="3893336"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="3893336"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 02:07:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8829458"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 02:07:43 -0800
Date: Mon, 4 Mar 2024 11:07:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 lib/igt_fb: on Xe device don't apply legacy blitter rules
Message-ID: <20240304100740.ztkb5anzva2hghja@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240228143904.859714-1-juhapekka.heikkila@gmail.com>
 <170919404440.393540.6971466243711753355@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170919404440.393540.6971466243711753355@8e613ede5ea5>
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
On 2024-02-29 at 08:07:24 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_fb: on Xe device don't apply legacy blitter rules
> URL   : https://patchwork.freedesktop.org/series/130504/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14358_full -> IGTPW_10747_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10747_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10747_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10747/index.html
> 
> Participating hosts (8 -> 7)
> ------------------------------
> 
>   Missing    (1): shard-glk-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10747_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_caching@read-writes:
>     - shard-dg1:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10747/shard-dg1-18/igt@gem_caching@read-writes.html
> 
>   * igt@kms_psr@psr2-no-drrs@edp-1:
>     - shard-mtlp:         [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14358/shard-mtlp-2/igt@kms_psr@psr2-no-drrs@edp-1.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10747/shard-mtlp-5/igt@kms_psr@psr2-no-drrs@edp-1.html
> 

These are unreleted to Xe path change, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10747_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][4] ([i915#8411])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10747/shard-dg2-6/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@drm_fdinfo@virtual-busy-idle-all:
>     - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#8414])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10747/shard-dg2-5/igt@drm_fdinfo@virtual-busy-idle-all.html
> 
>   * igt@drm_fdinfo@virtual-idle:
>     - shard-rkl:          [PASS][6] -> [FAIL][7] ([i915#7742])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14358/shard-rkl-2/igt@drm_fdinfo@virtual-idle.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10747/shard-rkl-1/igt@drm_fdinfo@virtual-idle.html
> 
>   * igt@gem_ccs@ctrl-surf-copy:
>     - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#3555] / [i915#9323])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10747/shard-dg1-19/igt@gem_ccs@ctrl-surf-copy.html
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#9323])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10747/shard-dg1-18/igt@gem_ccs@suspend-resume.html
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7731 -> IGTPW_10747
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14358: 5911a71f0d896bebb7af7cf60d60e0d36c3dde99 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10747: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10747/index.html
>   IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10747/index.html
