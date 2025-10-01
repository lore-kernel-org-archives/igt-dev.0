Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6F0CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 11:49:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625E010E6AD;
	Wed,  1 Oct 2025 11:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAlI99O9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF95410E36A;
 Wed,  1 Oct 2025 11:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759319382; x=1790855382;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z1dRkTpSdvTSZ/GrRwklqSNaiNtPhAFWNIXsXUXapAs=;
 b=JAlI99O9QqX6BeKaiVVQEQW0aLgD/cOERdQm9xi+Cx9V2BcZTySRA/id
 FG1cNw8gAd2UUkwJTite2TNw9fdto24vBfaOWYrY5aIDfZR9NXGGf286s
 FnWFEt1Vzw01CK4WTErH5DIxlp9iqB0QplNVldGfMLHSM5mVpQi9rEHFt
 kxwR6NnGQ4OPJxavQfYamePOUeIZeqM96PDfMthJRrwv49i3e2a7iaodg
 x7xg93fizTlyAAxNHlIvWEIIABlh1JlZOfeO5Gj/byK6Pngy6a8AtdEqj
 P1glCzEmklmzib+mncOJyTCzyxurb+qtc+6Rs4fYLCatfgQBtch9qrkFe Q==;
X-CSE-ConnectionGUID: yB7x0pw/QuWx9FIhxQA3mQ==
X-CSE-MsgGUID: ZkTkEF+pTrqP5OVxOyiYbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="84209432"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="84209432"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:49:41 -0700
X-CSE-ConnectionGUID: Qfh3W6OnQyKzhK29PeQYrQ==
X-CSE-MsgGUID: 6aodbCQjRNyAeS3yh9lnYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="178378723"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 04:49:39 -0700
Date: Wed, 1 Oct 2025 13:49:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 intel-ci: Fix Xe blocklists for xe_noexec_ping_pong test
Message-ID: <20251001114920.ojogpaldvka7jsnl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250930192522.247775-1-kamil.konieczny@linux.intel.com>
 <175927378564.381168.9576032281576406913@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175927378564.381168.9576032281576406913@1538d3639d33>
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
On 2025-09-30 at 23:09:45 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci: Fix Xe blocklists for xe_noexec_ping_pong test
> URL   : https://patchwork.freedesktop.org/series/155258/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8563_FULL -> XEIGTPW_13846_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13846_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13846_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13846_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_drm_fdinfo@parallel-utilization-single-full-load:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8563/shard-dg2-466/igt@xe_drm_fdinfo@parallel-utilization-single-full-load.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13846/shard-dg2-435/igt@xe_drm_fdinfo@parallel-utilization-single-full-load.html
> 

Unrelated.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13846_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
>     - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#5993]) +3 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8563/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13846/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
...cut...

