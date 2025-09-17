Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A02ACA0EE8
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 09:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C1410E037;
	Wed, 17 Sep 2025 09:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d90r8I5y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206E410E037
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 09:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758102699; x=1789638699;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=zWu/8YKHyOtRULxQIPh0ji/PfimPkUPm5h9ZaZ5DcWI=;
 b=d90r8I5yKq420OgxK71rsMCdFk36xiIzGnLo07hYetNVQU5x4qkMc5wX
 zc8rNKUcuxXoGZk+gFO9oV+KBwsW0Le4FY3a4YGCAZNtU/7ffWwJxr5CW
 eCqF90PQeznVcsphkHaL+jDcJwCd3CxxoWeMF7ae+9yAR8Zn2s9+sKDvX
 RNl2hBj8DNCVRdOJi3hD7jxxKTAZY8KDlANlmg6Ss8pDAtca9QCE6RE66
 WbBf5JdAPtPvyy1LoEaOthyEoySGleSlJ9Kr+b4vurEQexvAGrriezKbV
 KfGIBC0+YQ8jZpq+DY8PoXTW4ZsgY0YTIILnPvqlqtMmxOxPErXgr7m3G w==;
X-CSE-ConnectionGUID: vUaOULC6QHO7yjgaXm40hg==
X-CSE-MsgGUID: is5HYWqoQF+BRc4d7lQLdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="59623034"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="59623034"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 02:51:39 -0700
X-CSE-ConnectionGUID: Ra/VEIOCRhef2cCf/x/EVw==
X-CSE-MsgGUID: uE1pKpYlR+26TMcjHUoTmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="179204036"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 02:51:38 -0700
Date: Wed, 17 Sep 2025 11:51:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Revert IGT_DATA_PATH env setting in runner
Message-ID: <20250917095134.imvr4fpfowvyjv4w@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250916130904.166885-1-kamil.konieczny@linux.intel.com>
 <175807482332.339936.5067043546074581918@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175807482332.339936.5067043546074581918@1538d3639d33>
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
On 2025-09-17 at 02:07:03 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Revert IGT_DATA_PATH env setting in runner
> URL   : https://patchwork.freedesktop.org/series/154598/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8541_FULL -> XEIGTPW_13756_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13756_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13756_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13756_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8541/shard-bmg-5/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13756/shard-bmg-1/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html
> 

Unrelated to igt_runner change.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13756_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
>     - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#6084]) +3 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8541/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13756/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
> 

...cut...

> 
> Build changes
> -------------
> 
>   * IGT: IGT_8541 -> IGTPW_13756
>   * Linux: xe-3769-bbb6481c2b5e8ff72500665846dc121b6f093481 -> xe-3776-c3610fc0ab7c1c668031b3804549187d75550e93
> 
>   IGTPW_13756: 8075649ff33d83c1db5ffe1f3fdb37ca49b022df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8541: 8541
>   xe-3769-bbb6481c2b5e8ff72500665846dc121b6f093481: bbb6481c2b5e8ff72500665846dc121b6f093481
>   xe-3776-c3610fc0ab7c1c668031b3804549187d75550e93: c3610fc0ab7c1c668031b3804549187d75550e93
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13756/index.html
