Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867E8F9936C
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 11:06:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D57210F0B1;
	Thu, 23 Apr 2026 11:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cCrt3Q3/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA6C10F0B0;
 Thu, 23 Apr 2026 11:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776942381; x=1808478381;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3jbjw7IJ4BdN2EoWOTGduD+sDVgsVLwcyKwcQQWUno8=;
 b=cCrt3Q3/2Kz34gdwpWmrzPzJyd44lg9OKV3jV7SmibD6ooeLOma46wpc
 86K4NG19THcfhCMdfySXOTC0RIfRf4qsqyaqZWx3BtHEb0vCitXm86WvL
 Gsz47Sk7nEmd13SEy78ohEimtpqoVTwHiU9coZ79zqHjhiU8VpmjQg0Hn
 wu73ybmjQA4F08OecCu6WkWweeUSUlBhUNdY7PswStsyCzHof+SlWDDTo
 PNwyVfUQuEskVu+j4TAQBGGleP7LIDF8NiHLt6zDQWCaAJ6t9VY6XVtO0
 9WTJ1pZl6lyeB/4ESSyNc/imEKeEdYKUe0KNgOOiWSFg+vQoEp6ZEnNHO g==;
X-CSE-ConnectionGUID: /6xdB1W0QwmU+WmhLvHnXQ==
X-CSE-MsgGUID: tt/KXcADQsSWLxoCUTzZtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="95468424"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="95468424"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 04:06:20 -0700
X-CSE-ConnectionGUID: BHXJKK2gRNa/LoVuDP8sNw==
X-CSE-MsgGUID: g3SSBaWGRn6vhM8v8VGNLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="232938059"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 04:06:20 -0700
Date: Thu, 23 Apr 2026 13:06:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXI=?= =?utf-8?Q?e?= for
 tests/meson: Move Xe experimental info to Xe EUdebug
Message-ID: <20260423110617.x4lz4ungfusaqgll@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260422163043.153991-1-kamil.konieczny@linux.intel.com>
 <177690280205.62.3892884175504952961@5ab824fced77>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177690280205.62.3892884175504952961@5ab824fced77>
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
On 2026-04-23 at 00:06:42 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/meson: Move Xe experimental info to Xe EUdebug
> URL   : https://patchwork.freedesktop.org/series/165314/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8870 -> IGTPW_15041
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15041 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15041, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15041/index.html
> 
> Participating hosts (42 -> 39)
> ------------------------------
> 
>   Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15041:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-adlp-11:        [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8870/bat-adlp-11/igt@i915_selftest@live@workarounds.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15041/bat-adlp-11/igt@i915_selftest@live@workarounds.html
> 

This is unrelated to Xe change in meson, no need for running
i915 FULL.


Regards,
Kamil 

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15041 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live:
>     - bat-mtlp-8:         [PASS][3] -> [DMESG-FAIL][4] ([i915#12061]) +1 other test dmesg-fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8870/bat-mtlp-8/igt@i915_selftest@live.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15041/bat-mtlp-8/igt@i915_selftest@live.html
> 
>   
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8870 -> IGTPW_15041
>   * Linux: CI_DRM_18355 -> CI_DRM_18356
> 
>   CI-20190529: 20190529
>   CI_DRM_18355: 489e26ada57ce96a2ee3e5853cfe74981ef85bbd @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_18356: 9917a06970fd6775b7b4259be6cca21cb4e2b165 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_15041: 2db9b6e920c093b43789dbb03d5fe76d8f5a4439 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8870: 1aba4b364b6dbdf7926cc78501e7281d5176b029 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15041/index.html
