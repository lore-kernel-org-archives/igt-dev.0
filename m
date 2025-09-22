Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F656CAC592
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 15:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE27B10E1E1;
	Mon, 22 Sep 2025 15:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ayhm3MU5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5825610E4CD;
 Mon, 22 Sep 2025 15:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758556363; x=1790092363;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eMWiVeziulE3kQddf7IZhbSVODTNYgR0mY4MvjPtjNM=;
 b=ayhm3MU5mkznR8+EIvuYkmBWCeECLqp9GElbA8Jq5DUlwgLGP2Vo9BAA
 Iz6EhqkOOED2qULBQkRC0x+uf/itZdBGrxmTO3AhI61S/RSSKXTrzuBYt
 CH6LeOFHjxudiiRoXWOVu4qwjH8GRW5h5Hd0dhGmyWXNv3d072yWIUJI5
 6wEU8wvVBTp7e31qxQISXWDY8RQqZEWF/YO8Hkv1EZzUe/zWLHdDbKXav
 nvdH/MiOQ0Asp3hmE/AAmBvq+3+4SCW92lfZemf1v8cdoiId88uxHtQj0
 5jp4/iO+GzV9QTP+Pjq7bqs7+ixBjApLU9BFZsBNqrsY3L67FsSuSn5bJ Q==;
X-CSE-ConnectionGUID: l6niBzuAQwCCMdZlTKq5nw==
X-CSE-MsgGUID: RlBWnxShS3q3BOmxCLhung==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60876270"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60876270"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 08:52:42 -0700
X-CSE-ConnectionGUID: pn6TSohtRESmLsyjhM4C4A==
X-CSE-MsgGUID: iAhiVCnFQ1m/XgwDYa/2+Q==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 08:52:40 -0700
Date: Mon, 22 Sep 2025 17:52:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Convert core_* and one xe_* to subtests
Message-ID: <20250922155229.xx4peavghhkii4dp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250919170510.154992-1-kamil.konieczny@linux.intel.com>
 <175838068683.351131.18263477411237354138@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175838068683.351131.18263477411237354138@1538d3639d33>
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
On 2025-09-20 at 15:04:46 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Convert core_* and one xe_* to subtests
> URL   : https://patchwork.freedesktop.org/series/154787/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8545_full -> IGTPW_13788_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13788_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13788_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13788/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13788_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
>     - shard-tglu:         [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8545/shard-tglu-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13788/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
> 

Unrelated.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_8545_full and IGTPW_13788_full:
> 
> ### New IGT tests (3) ###
> 
>   * igt@core_getclient@basic:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@core_getstats@all-cards:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.01, 0.03] s
> 
>   * igt@core_getstats@basic:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.0] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13788_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####

...cut...

