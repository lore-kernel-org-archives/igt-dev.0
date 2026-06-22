Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58B3CDB46B
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 10:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAAA10E5D2;
	Mon, 22 Jun 2026 10:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PPoaq19M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB9C10E5D2;
 Mon, 22 Jun 2026 10:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782122499; x=1813658499;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sew71fOWD1UWF7j0C+Xt9OuZBJAW/6XCmQCh/Nc2i7I=;
 b=PPoaq19MGO3ZTcS1DVgSyjmPZM/6t20afyg+yRaji4pncnJl3pzvMKs5
 7BQ+lQLuN8ElysZGj6C0XrnKfQwM1bD0kXMlekikUxHGI2XwJ5YFvc2ha
 M2FO3IGT8HS7nMsaxAp2p7EdV6BrvWKja9E6s5EKA9b4uIC/eZ1MJPOcF
 GGWUImWZJrmReMPeIqrKvXTimonsu4iGxotEY+fI78KBQ6Clec3FCWDt8
 SFvaPIpR3LnAwnP2QkW2aYXsfBpRibWMQuCVJNS0Cu/S/GHQ+ZlgZucTS
 Ig7q/w/Oc/JQKmrVsx4MC7jg6bhKcHB/33KZkH+OrHZ/RVRawScGttxbZ A==;
X-CSE-ConnectionGUID: pDwtfpy7SOG4vp8aMV5/vg==
X-CSE-MsgGUID: 1Yx51wpAS4iZHCr6TWWEXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82889774"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82889774"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 03:01:38 -0700
X-CSE-ConnectionGUID: 3t7WyH0BQIuEcRaR7C3lZQ==
X-CSE-MsgGUID: TgWg3dcQTEqn7oNsN0C6gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="273256957"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 03:01:37 -0700
Date: Mon, 22 Jun 2026 12:01:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 Allow intel_reg tool to work also with accelerators
Message-ID: <20260622100135.nye7mjoyjpuowzz4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260617202600.251889-1-kamil.konieczny@linux.intel.com>
 <178176879977.92656.11538395169585273316@6beec6c84f66>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178176879977.92656.11538395169585273316@6beec6c84f66>
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
On 2026-06-18 at 07:46:39 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Allow intel_reg tool to work also with accelerators
> URL   : https://patchwork.freedesktop.org/series/168736/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8971_FULL -> XEIGTPW_15391_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15391_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15391_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_15391_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][1] +2 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15391/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-cm-userptr.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][2] +2 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15391/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html
> 
>   * igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-gt1-vcs0:
>     - shard-bmg:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8971/shard-bmg-10/igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-gt1-vcs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15391/shard-bmg-4/igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-gt1-vcs0.html
> 

Unrelated, change was in tools, not in tests.



Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15391_FULL that come from known issues:
> 
...cut...
