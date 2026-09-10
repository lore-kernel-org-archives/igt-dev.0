Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DFEC79FB9
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 11:44:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA3A10F46B;
	Thu, 10 Sep 2026 11:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfdemJw9";
	dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 10 Sep 2026 11:44:00 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7E410F46B;
 Thu, 10 Sep 2026 11:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789040641; x=1820576641;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DWaDd8KqVTcFkkPPOrAwSbQY5E7XjEZ+nJEhedrCX+E=;
 b=cfdemJw9VFQ8l7UX4XgFI/mdSurYhuJnHdBV+jxMYFqkT/SDTCC5z9ol
 SgMfK51kTukS4nbi0/G9g3clzcemYMVvrNUMIhEURf7s0PboA7YXoeJMN
 sCAvN+hX5F34cLyITIubVwsQZ9suKM+QLxcPqBQtMIstlEqge2vrYgFIB
 d6lfqfmIOIXJbAYOFi+SEMwKfV5MJ/O63x1OaAe4pe+57PbUoFT23cgyY
 BKLSyDZswpG0s34AKOYLPkqFPui98nTqs6MUCiF+xzH+fejeqXzQ5oEjy
 2AUN6YT8LMVD52fD3tmBs9NbNx8ZbISxT0PM/XI9osU8pXtBfzDawyPPy w==;
X-CSE-ConnectionGUID: K+GY5ifpSPmz2hqZHexCeQ==
X-CSE-MsgGUID: itLOC1bkRsuOKVZookvwPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="7330"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="7330"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 04:36:55 -0700
X-CSE-ConnectionGUID: nublI9g8RJOsnAam07QOqg==
X-CSE-MsgGUID: KjlgtM3/ROKXDY3oLFHAKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="271581576"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 04:36:53 -0700
Date: Thu, 10 Sep 2026 13:36:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 lib/igt_core: Make build reproducible
Message-ID: <20260910113650.5524tvsuxpg6lcxu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260909133320.71100-1-kamil.konieczny@linux.intel.com>
 <178901865390.145374.9498457842510032918@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178901865390.145374.9498457842510032918@61270ab9df2a>
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
On 2026-09-10 at 05:37:33 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_core: Make build reproducible
> URL   : https://patchwork.freedesktop.org/series/173723/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9088_FULL -> XEIGTPW_15815_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15815_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15815_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_15815_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-random-gt1-vcs0:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-6/igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-random-gt1-vcs0.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority@numvfs-random-gt1-vcs0.html
> 

Unrelated, change could affect only kms_3d.



Regards,
Kamil


>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15815_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_9088 -> IGTPW_15815
>   * Linux: xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada -> xe-5715-0d30bc4f35590b6353a77f23e397ab2168b69673
> 
>   IGTPW_15815: 15815
>   IGT_9088: 55a88d20e327d5c440cd3f3d661684fb83f29027 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada: dd822035c9dcd89e47cbfa75da6f3119617fbada
>   xe-5715-0d30bc4f35590b6353a77f23e397ab2168b69673: 0d30bc4f35590b6353a77f23e397ab2168b69673
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15815/index.html
