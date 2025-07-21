Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864ADC83F25
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 16:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF5A10E39A;
	Mon, 21 Jul 2025 16:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P80epHHU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C641F10E2BC;
 Mon, 21 Jul 2025 16:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753113844; x=1784649844;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fr2zPYDfHZ5JDVgVztsB6Cs7m0C5JQvzz56voRBStGg=;
 b=P80epHHUlbMv9mYjaL0p0cQe8ca7daXzVauHOByZpzl2a1BB5IkEANCj
 niz30nyVUVilo3/nLKZ1GlHWJSkQ2Thu/NoWB5X/HrhBmJxx+WnmGTZES
 7hhZ4TNTJV9NrlR608/Qpg6qkdhVy6HAXjeQ14wbXBXU3A6EGRSAoyl+9
 SU9/ev8dJH8gCxYRhN9P2KfwVtPvbgfBSWuH2mTEynR3wCTlU68Q+Rppr
 emhBiP6OHD9wNgx45HC3O3cE0/1Fe06kQrcDSvYVCsucM6Lsrxq40qgRx
 EFleXjsPBqtfNDX3w13U5vRGU6fYWi4pw2hAwV9ngYwCASOgRl0nInagu Q==;
X-CSE-ConnectionGUID: 6MIwCp4hQPWaOlHz2SbLOA==
X-CSE-MsgGUID: 9OXlWjkzSsGAf6+NR/Qurw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55291942"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="55291942"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 09:04:03 -0700
X-CSE-ConnectionGUID: 9uI2nonhQNyru8Jx/vQ7aA==
X-CSE-MsgGUID: qPtqq2JqQXeR2p7Tm1aeNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="158662237"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 09:04:03 -0700
Date: Mon, 21 Jul 2025 18:03:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 Fix follow_symlinks meson error and few other warns
Message-ID: <20250721160347.hidpjxwuqhjqkcth@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250718151521.105886-1-kamil.konieczny@linux.intel.com>
 <175309939698.177010.5913074782030012596@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175309939698.177010.5913074782030012596@1538d3639d33>
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
On 2025-07-21 at 12:03:16 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix follow_symlinks meson error and few other warns
> URL   : https://patchwork.freedesktop.org/series/151819/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8468_FULL -> XEIGTPW_13496_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13496_FULL absolutely need to be
>   verified manually.

Unrelated, this is only change in meson.build files and
should not affect any test.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13496_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13496_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset:
>     - shard-bmg:          [PASS][1] -> [TIMEOUT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/shard-bmg-8/igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13496/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-new-bo-map:
>     - shard-lnl:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-new-bo-map.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13496/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-new-bo-map.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_eu_stall@blocking-re-enable:
>     - shard-dg2-set2:     [SKIP][5] ([Intel XE#4208]) -> [SKIP][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/shard-dg2-432/igt@xe_eu_stall@blocking-re-enable.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13496/shard-dg2-432/igt@xe_eu_stall@blocking-re-enable.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13496_FULL that come from known issues:
> 

...cut...
