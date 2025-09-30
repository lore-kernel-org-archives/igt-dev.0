Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFAECCA468
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 13:03:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A09610E2BF;
	Tue, 30 Sep 2025 13:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MgH55J6K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C611410E2BF;
 Tue, 30 Sep 2025 13:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759237391; x=1790773391;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PA6sC06N62+VQ3UtKweyiDTpjgUgOj+0Tcg8fddfzag=;
 b=MgH55J6KyFL0e8FND7h1mhld3vwDrbx8wPmhcC4xt9/X4XHUYTMlr/0F
 cwwpysmeI64dwIEGQyjXxFqvE6W1R0LfTcfFjmROhHFybgeHm53QYZw7i
 bHa+0V+3kgnRGcFCnOwFwrhsyKvM3x9yrglPfV+rRyUWx4FcKVEMqYgbE
 mtXjwj1CG4HVg7PjSSaGU5+Tp3Oqolal/AhkbS8HVjWvatNbpiEQXRsMv
 32LgaAEV5WFhLvvAoBLQOtsuyYlJjYf3fkZGPV1NSriOG4hl/qxWzJiYA
 bcfNXqeMEbCuk9EHcruJ1KqnivSv8ZbVSq664bZWD3+504tiJHJRiWeL2 Q==;
X-CSE-ConnectionGUID: 5bljr9Y3TEqMnuZAdUURNg==
X-CSE-MsgGUID: ihfcgr+kS+WVWBOd1X0J9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61657410"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="61657410"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 06:03:11 -0700
X-CSE-ConnectionGUID: jpA3vxWpTlqASIWCG6gZCQ==
X-CSE-MsgGUID: wWclOncxQl6sEFC53MrNcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178922632"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 06:03:10 -0700
Date: Tue, 30 Sep 2025 15:03:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 intel-ci: Fix typo in Xe LNL display blocklist
Message-ID: <20250930130308.otavjl4adzldskuq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250923113718.78290-1-kamil.konieczny@linux.intel.com>
 <175868420091.360576.2112325790495380609@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175868420091.360576.2112325790495380609@1538d3639d33>
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
On 2025-09-24 at 03:23:20 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci: Fix typo in Xe LNL display blocklist
> URL   : https://patchwork.freedesktop.org/series/154899/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8550_FULL -> XEIGTPW_13801_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13801_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13801_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13801_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_render_copy@render-stress-1-copies:
>     - shard-bmg:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13801/shard-bmg-6/igt@xe_render_copy@render-stress-1-copies.html
> 

This is unrelated.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13801_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
