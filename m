Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E78BC77B7F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 10:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B0E10E05B;
	Mon, 23 Jun 2025 10:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KVOAZV3J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F0810E05B;
 Mon, 23 Jun 2025 10:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750672829; x=1782208829;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zPGFYKurIS88y6GtDpP7VX2soLVl3NvUWFwnhASkXuI=;
 b=KVOAZV3JV+VgvDxKXXjPcgrJ4RwevWxG9yZyuYx26CVZ7+ASitPAo8zp
 4X2H2sayRd8jooe2vA9F7/fYGsRwKgJp18+1A7++cg2uLXYCkSxaqbSQl
 nzNQ4G0PlVnxt4s3sLKekpfeEVhYyHRTSXA0eZMKcZZEa2s1v7nwMNr5A
 WZrDi5OHzyF2bqnOwHMpz4xRFV9qxYERFKv+CCPfrNnX4NYaoSt1l4BrS
 AsQWCFT7e41GENNZ/R6basB3dOCJKnFnZDBoL7ZmYKvhIskth36V8uURZ
 DWvkQ1d7cHz5Gv/AQna1UNpfFsxeZR/HnzagGrnqT3NQgivJ8o1yzyafV w==;
X-CSE-ConnectionGUID: YRaRABSTQ6W5ogI5vOQXeQ==
X-CSE-MsgGUID: CilTH0NEQtOmi/uZc+4sOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="70440399"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="70440399"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 03:00:29 -0700
X-CSE-ConnectionGUID: uUiG1DHKSeKGlM/rc5QOJw==
X-CSE-MsgGUID: NaPNnP2STmuMR2yVK3W6PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="157340086"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 03:00:28 -0700
Date: Mon, 23 Jun 2025 12:00:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Hung <alex.hung@amd.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 README.md: Update oneliner build command
Message-ID: <20250623100025.ryx7zflyppeunp2p@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250618230257.1721932-1-alex.hung@amd.com>
 <175034313547.96073.17122575593281786094@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175034313547.96073.17122575593281786094@1538d3639d33>
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
On 2025-06-19 at 14:25:35 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: README.md: Update oneliner build command
> URL   : https://patchwork.freedesktop.org/series/150487/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8418_FULL -> XEIGTPW_13321_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13321_FULL absolutely need to be
>   verified manually.

Unrelated to change in documentation.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13321_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13321_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_eu_stall@invalid-gt-id:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][1] +2 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13321/shard-dg2-435/igt@xe_eu_stall@invalid-gt-id.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13321_FULL that come from known issues:
> 
...cut...
