Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA0AC54FD1
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 10:52:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9573510E035;
	Wed, 29 Jul 2026 10:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hza0yYSu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E373710E1C4;
 Wed, 29 Jul 2026 10:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785322332; x=1816858332;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dhxsRwh2a5OdSbS2m5Cebu8YkHo0c/PwZUK80M3fWmA=;
 b=hza0yYSux5z7RrGEfrgPHD8I5Bs/9q4l4JQVsIK6vBN7EViQD68TJMpo
 rDCRK/MjHCl9SsU9Gbfk4h67Lh/TF0q9/IB52nKr1cs4IZe5pHEMdGkc1
 hftBU+H2Y0xilvLUpBr6FWoL0Tql/sGweHCUrToalAtouzxKFq6tLxDcQ
 rutzKHh7zT94dFc/wnd82f/+1uuJQPc6Nq35lDQuxXpbBQ6r//LoI5n8J
 EzO0AHQ5dpq30aysn+TEX14CYVNl5y1tGYvwPPeBhljSYX3l9W2EQKLgb
 wG47c2jmhJXHjuKh0FgrzKvDOzIM0ki7TVrDWt28DxbptrStWZFz5a/I3 g==;
X-CSE-ConnectionGUID: +KI76ZIGSJqVmTrI2CVL2w==
X-CSE-MsgGUID: NaGoHRveSo2wBcHy9Jg6Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="84900101"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="84900101"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 03:52:11 -0700
X-CSE-ConnectionGUID: 2mD+BDzMR8OMMRAmmosecw==
X-CSE-MsgGUID: 0HgK1mHnRtOvffllcVo2zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="263472852"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 03:52:11 -0700
Date: Wed, 29 Jul 2026 12:52:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Robert Mazur <robert.mazur@imgtec.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 tests/imagination: Additional DEV_QUERY tests
Message-ID: <20260729105208.w2kzz4bm6uxt6qek@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Robert Mazur <robert.mazur@imgtec.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260728-test-imagination-additional-dev_query-tests-v1-0-f361c7c2b513@imgtec.com>
 <178528708674.233181.1910225637970090575@6beec6c84f66>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178528708674.233181.1910225637970090575@6beec6c84f66>
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
On 2026-07-29 at 01:04:46 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/imagination: Additional DEV_QUERY tests
> URL   : https://patchwork.freedesktop.org/series/171212/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9029_FULL -> XEIGTPW_15602_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15602_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15602_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_15602_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_compute_preempt@compute-preempt-many-vram:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9029/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many-vram.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15602/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram.html
> 

Unrelated.



Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15602_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#3718] / [Intel XE#6078])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9029/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15602/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html
> 
...cut...
