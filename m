Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2000C83F25
	for <igt-dev@archiver.kernel.org>; Tue, 22 Jul 2025 11:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C1C10E070;
	Tue, 22 Jul 2025 11:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ntxok/Cx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE5E10E070;
 Tue, 22 Jul 2025 11:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753182998; x=1784718998;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LRfAK8p3+BngQYC/mzPRruMyQt5OSCrva0n4b1s/82s=;
 b=Ntxok/Cx+NMOTAVDfL4JkE2XahWy5yjdAkMMM29RtkOk5JJAoBpMG7wd
 RuwuIhBeO42KooMyLYEsY5ej5o4KUer2ddgVJFBVq6JHS1OUvsdHQiYjs
 vHQow8pZAB9vo66BSHkKs64/tUEAh1g8e8Lz9Mc8Ua/j29UZs7MJ4sdCJ
 gWk/x6P3JZFhmIbZ+jv08IvWDT6QBiPgWS62VMnlOAezwBBs8+DjdUNbj
 SnCRyAcrJjh3ApNS2wcQgQjfEk0ze5Awp/M3s4UzFW2zIEO8/QIKyd1oq
 5kg7DjYM+OfMZhAHfCMc3V46s+D3t/d6tBrLkrmR8C7EDV9jQNfa39Vbw g==;
X-CSE-ConnectionGUID: VR7LPoxoTF+1m3gMrb3+SA==
X-CSE-MsgGUID: aev/+ixBTjWjLrD88GGTZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55384071"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55384071"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 04:16:38 -0700
X-CSE-ConnectionGUID: N05GMRHmRmKpnpsVR/9t8w==
X-CSE-MsgGUID: vBWRADhNSW6DbNIZ4uQgZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="158774913"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 04:16:37 -0700
Date: Tue, 22 Jul 2025 13:16:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 Fix igt v2.1 compilation on Void Linux with musl C libs
Message-ID: <20250722111621.2no4bypz6ycsc4jp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250721155824.112474-1-kamil.konieczny@linux.intel.com>
 <175312746354.177614.13047708307208280747@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175312746354.177614.13047708307208280747@1538d3639d33>
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
On 2025-07-21 at 19:51:03 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix igt v2.1 compilation on Void Linux with musl C libs
> URL   : https://patchwork.freedesktop.org/series/151898/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8469_FULL -> XEIGTPW_13503_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13503_FULL absolutely need to be
>   verified manually.
>   

Unrelated,

Regards,
Kamil

>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13503_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13503_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults:
>     - shard-bmg:          NOTRUN -> [ABORT][1] +12 other tests abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13503/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html
> 
>   * igt@xe_module_load@reload:
>     - shard-lnl:          NOTRUN -> [ABORT][2] +12 other tests abort
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13503/shard-lnl-7/igt@xe_module_load@reload.html
> 
>   * igt@xe_oa@buffer-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][3] +2 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13503/shard-dg2-436/igt@xe_oa@buffer-size.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_pipe_stress@stress-xrgb8888-yftiled}:
>     - shard-bmg:          NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13503/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
>     - shard-lnl:          NOTRUN -> [SKIP][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13503/shard-lnl-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13503_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@fbdev@read:
>     - shard-dg2-set2:     [PASS][6] -> [SKIP][7] ([Intel XE#2134])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8469/shard-dg2-436/igt@fbdev@read.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13503/shard-dg2-435/igt@fbdev@read.html
> 

...cut...

