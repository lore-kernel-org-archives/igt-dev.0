Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9CEE9A04A
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 14:36:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762D210E194;
	Thu, 19 Feb 2026 14:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCGNl5oF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D67F10E194;
 Thu, 19 Feb 2026 14:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771511783; x=1803047783;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NKB6UwC+6WqGiuVYNukWjlhWJzgxy/BkmTf3m4wG1hQ=;
 b=bCGNl5oFJy14RlamCrfsKFaw7WmGfmSAbkRz5/oczGYIJWkj9D57Dfzl
 me1Fp5Z2IycSO3cFPTZn48h7qhuN6GOenzKsfZbTagtPUbjXT0M/aSBSv
 A37u6ddMAp//FuPNYXU+zjD3+5d7hMC/PuKwyZwWml6JHMD1dkk499rKl
 xq5PhZvOoaBw9ajX2ydipy6csE550PBEKm1lYoL3RtoT7FP3GVw7oawb2
 3nSV8kD2CFv4kHq/6mMJWMrdTCvujMOgjpoJtRity9OjPalhgMGA5yHx6
 9C6/4PP3KgTbjR1fKRrLaqmmbjPR61cmSboEVoA1ABiHZ33dAWIzoF8G+ Q==;
X-CSE-ConnectionGUID: St/IJut+T5eQPjLPIkQ0Yw==
X-CSE-MsgGUID: cRqVZbCXQtKWp2RvEWJl9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72773225"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="72773225"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 06:36:22 -0800
X-CSE-ConnectionGUID: PqZ3ou/8S6Cqr/QApFUdrA==
X-CSE-MsgGUID: BVQv9vaNRfG3ndt7W6dMAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="219532304"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 06:36:21 -0800
Date: Thu, 19 Feb 2026 15:36:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 panthor: Enable compilation on big-endian arch
Message-ID: <20260219143618.lcqgfbtyelovwsx6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260218153444.80754-1-kamil.konieczny@linux.intel.com>
 <177144168751.262680.8056583558163614274@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177144168751.262680.8056583558163614274@a3b018990fe9>
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
On 2026-02-18 at 19:08:07 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: panthor: Enable compilation on big-endian arch
> URL   : https://patchwork.freedesktop.org/series/161768/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8760_FULL -> XEIGTPW_14569_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14569_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14569_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_14569_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][1] +4 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14569/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-modifier:
>     - shard-lnl:          NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14569/shard-lnl-2/igt@kms_plane@pixel-format-yf-tiled-modifier.html
> 

Unrelated to Panthor change (non-Intel HW).

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14569_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#3279])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14569/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
...cut...
