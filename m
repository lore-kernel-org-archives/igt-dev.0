Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C399C83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 12:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C3210E802;
	Thu, 17 Jul 2025 12:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSvh9uiS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E4110E080;
 Thu, 17 Jul 2025 12:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752753660; x=1784289660;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=074q3nqlWdP3DUwx1QY3kWu9QI2uD3A9i9cfe2GjLls=;
 b=RSvh9uiSekQ5jZTnxEcAYAOnwDDaqScnU85FNv0vWkMk6ymuHHtlrYNC
 DvBmO8aiUQ7KaTPp487O1Q96E+jpCXWxQvUznvM1BQ3O2FuwYfR9iFvmn
 0upCVEkxnDkeiZ0GrtRhOy684TjZa030kAlvUfulujemofvvLnaRX7NWF
 iPS7AQv4DtTkMb4NDB8R0sNEwf4SuGNbJ95Yl9uhS861ehqPrvI4pHp7D
 lVTJGlSixZXbm4bbT42oy6dozOsjVOGlek+XDF30eWPoGTq0v589DXyJP
 k8u8ED2mUcjIMPk+5cqab0rSKS2OeBSFvxKFAhvw+JydaBHYEDJ6a/6fB Q==;
X-CSE-ConnectionGUID: 2p2299LKRl6jDiXcF+4wOw==
X-CSE-MsgGUID: vIiN5Qg/RjmKxMWvviQd3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58835886"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="58835886"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 05:01:00 -0700
X-CSE-ConnectionGUID: eC8mcyb1QxqG3pj3cNvc7A==
X-CSE-MsgGUID: aRzB0Mi2TTSChkjwztIG3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="158243796"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 05:00:59 -0700
Date: Thu, 17 Jul 2025 14:00:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 tests/intel/*test_config: Fix i915 blocklists rename
Message-ID: <20250717120056.knlxlpch7o7aa54i@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250716102315.48051-1-kamil.konieczny@linux.intel.com>
 <175275172655.169254.12268123194444765297@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175275172655.169254.12268123194444765297@1538d3639d33>
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
On 2025-07-17 at 11:28:46 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/*test_config: Fix i915 blocklists rename
> URL   : https://patchwork.freedesktop.org/series/151701/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8461_FULL -> XEIGTPW_13482_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13482_FULL absolutely need to be
>   verified manually.

Unrelated to change in {i915/kms}_test_config.json

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13482_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13482_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-remap:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8461/shard-bmg-2/igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-remap.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13482/shard-bmg-4/igt@xe_exec_system_allocator@process-many-execqueues-mmap-shared-remap.html
> 
>   * igt@xe_pmu@engine-activity-single-load:
>     - shard-dg2-set2:     [PASS][3] -> [FAIL][4] +6 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8461/shard-dg2-466/igt@xe_pmu@engine-activity-single-load.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13482/shard-dg2-432/igt@xe_pmu@engine-activity-single-load.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13482_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
>     - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#911]) +3 other tests fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8461/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13482/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
> 

