Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A161C36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 11:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A7610E247;
	Mon, 24 Mar 2025 11:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CNDeIgEQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9151C10E247;
 Mon, 24 Mar 2025 11:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742814148; x=1774350148;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=D+Afau5mCcYpCmeJK+Nx1E7M9rDnrZHg4o+vxWC8tXg=;
 b=CNDeIgEQH7Ior8jNpyoycqe45z7qkcKTu3a6D19witHWwZpSZFPhfld7
 T2jrVkj8FeI54AstHXzIq5YSyGa7i/XYtCV77giDsY6CfuU1TnVmwJzfb
 SatjsbXLNRvDAsu8qSvUxDzgj6/UPr/+OAiyRGXGUM45O0T9R/qabSY6z
 nlR6N6SS/oZOOdFLaezX/l+sZx1R81VbYl67vjixlexbrTiZmz2G7yXGl
 2ZR2Dhl2nGTI3lkzTceetQZLNm0kLGzJdy1lRxEj21X63Tt+UTxoYkBRR
 R2m22eqik8kOHvPZETKSwv0m85o9bfaIRT4pFHv1ZW4A/xDZBbX/M48sv A==;
X-CSE-ConnectionGUID: ha6oks3CT9e6Hk5fj4mwzw==
X-CSE-MsgGUID: R13eMMcfS6myfmEnOC8+Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="44026283"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="44026283"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 04:02:26 -0700
X-CSE-ConnectionGUID: wVkHveNKT8aAs6qIDmCVaw==
X-CSE-MsgGUID: QpgbkNgQQV2z/ccdN43KNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="123740210"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.228])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 04:02:26 -0700
Date: Mon, 24 Mar 2025 12:02:23 +0100
From: Pawel Sikora <pawel.sikora@linux.intel.com>
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 lib/igt_core: capture logs for child processes (rev4)
Message-ID: <20250324110223.tbd5se32w3xlr6oq@pawelsik-desk>
References: <20250321120344.737080-1-pawel.sikora@linux.intel.com>
 <174259529391.65891.15339581543553862467@18a75f3d1eae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174259529391.65891.15339581543553862467@18a75f3d1eae>
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

Hi I915,

On Fri, Mar 21, 2025 at 10:14:53PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_core: capture logs for child processes (rev4)
> URL   : https://patchwork.freedesktop.org/series/146262/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8278_full -> XEIGTPW_12812_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12812_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12812_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12812_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8278/shard-bmg-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12812/shard-bmg-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
> 
>   * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
>     - shard-lnl:          NOTRUN -> [ABORT][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12812/shard-lnl-7/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-mid:
>     - shard-dg2-set2:     [PASS][4] -> [INCOMPLETE][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8278/shard-dg2-466/igt@kms_plane_alpha_blend@constant-alpha-mid.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12812/shard-dg2-434/igt@kms_plane_alpha_blend@constant-alpha-mid.html
> 

Unrelated to my change.

Regards,
Pawel
