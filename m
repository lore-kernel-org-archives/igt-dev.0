Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0FECA100F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 15:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DF789EBB;
	Mon, 22 Sep 2025 15:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Id5HGgJ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E055489EBB;
 Mon, 22 Sep 2025 15:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758556491; x=1790092491;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NaAjRnEbQXQBDWNNf9TUrgcorGh+ldM4ENWOaq+WIuU=;
 b=Id5HGgJ8vg3bSH+GIyvc0mFB4rncGTEQnu/62FSkGdaktt5sz/in0B+B
 2/0tGLXjyMPD2gRd+BNg8KMJozf6N2QhchQUJtnSxzY1s3+pCAQSNo42G
 qxtiVAP18fBp9iVXzzaes45SejYgLLJvuR9D/Q2Wa5C4UvpPwOfAHCzZ7
 BXMpZpPZpfV3gKOA9bYw2oj+P7wUmz67GLPwXEAEuSRELxoGBjCYcT1T4
 FblPyfpI4oAizIF/pvb6Nj9611KuXBJP0iFK2ANA6hNII9GIGFpJ5Gzkz
 rp1D6qMOgad0fa4guqyyFjeMTjVRSYScAK/QrWKiaoz2DUzd3Z3ULJuCT Q==;
X-CSE-ConnectionGUID: 7ZiKXpDER7mv/UwSVh7TZQ==
X-CSE-MsgGUID: 2di24k7UQL2LSl9SexRT1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="59861266"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="59861266"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 08:54:51 -0700
X-CSE-ConnectionGUID: 8is/dG9wRNSuJbhN1rOhaw==
X-CSE-MsgGUID: XvOnGU1iRg+Tz4zJvsUDkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="213650839"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 08:54:50 -0700
Date: Mon, 22 Sep 2025 17:54:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Convert core_* and one xe_* to subtests
Message-ID: <20250922155447.qxbg2hlx7trlqblz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250919170510.154992-1-kamil.konieczny@linux.intel.com>
 <175833962522.350725.1914522535283969539@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175833962522.350725.1914522535283969539@1538d3639d33>
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
On 2025-09-20 at 03:40:25 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Convert core_* and one xe_* to subtests
> URL   : https://patchwork.freedesktop.org/series/154787/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8545_FULL -> XEIGTPW_13788_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13788_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13788_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13788_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_threads@threads-cm-shared-vm-rebind:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8545/shard-bmg-3/igt@xe_exec_threads@threads-cm-shared-vm-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13788/shard-bmg-7/igt@xe_exec_threads@threads-cm-shared-vm-rebind.html
> 
>   * {igt@xe_noexec_ping_pong@basic} (NEW):
>     - shard-lnl:          NOTRUN -> [SKIP][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13788/shard-lnl-5/igt@xe_noexec_ping_pong@basic.html

This is expected and it should be blocked, there is already:
xe.lnl.core.blocklist.txt:igt@xe_noexec_ping_pong

so it needs an update. Rest are unrelated.

Regards,
Kamil

> 
>   * igt@xe_pm@s3-basic:
>     - shard-bmg:          [PASS][4] -> [ABORT][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8545/shard-bmg-7/igt@xe_pm@s3-basic.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13788/shard-bmg-4/igt@xe_pm@s3-basic.html
> 
>   * igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_decode0:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][6] +2 other tests dmesg-warn
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13788/shard-bmg-3/igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_decode0.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@xe_exec_system_allocator@many-execqueues-mmap-prefetch}:
>     - shard-bmg:          [PASS][7] -> [CRASH][8] +12 other tests crash
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8545/shard-bmg-6/igt@xe_exec_system_allocator@many-execqueues-mmap-prefetch.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13788/shard-bmg-6/igt@xe_exec_system_allocator@many-execqueues-mmap-prefetch.html
> 
>   * {igt@xe_exec_system_allocator@many-malloc-prefetch}:
>     - shard-lnl:          [PASS][9] -> [CRASH][10] +4 other tests crash
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8545/shard-lnl-8/igt@xe_exec_system_allocator@many-malloc-prefetch.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13788/shard-lnl-7/igt@xe_exec_system_allocator@many-malloc-prefetch.html
> 
>   * {igt@xe_exec_system_allocator@many-malloc-prefetch-madvise}:
>     - shard-lnl:          [WARN][11] ([Intel XE#5786]) -> [CRASH][12] +4 other tests crash
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8545/shard-lnl-1/igt@xe_exec_system_allocator@many-malloc-prefetch-madvise.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13788/shard-lnl-2/igt@xe_exec_system_allocator@many-malloc-prefetch-madvise.html
> 
>   * {igt@xe_exec_system_allocator@many-new-prefetch}:
>     - shard-lnl:          NOTRUN -> [CRASH][13] +1 other test crash
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13788/shard-lnl-3/igt@xe_exec_system_allocator@many-new-prefetch.html
> 
>   * {igt@xe_exec_system_allocator@many-stride-mmap-prefetch}:
>     - shard-bmg:          NOTRUN -> [CRASH][14]
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13788/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-mmap-prefetch.html
> 
>   * {igt@xe_exec_system_allocator@process-many-large-malloc-prefetch-madvise}:
>     - shard-lnl:          NOTRUN -> [FAIL][15] +2 other tests fail
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13788/shard-lnl-2/igt@xe_exec_system_allocator@process-many-large-malloc-prefetch-madvise.html
> 
>   * {igt@xe_exec_system_allocator@process-many-large-mmap-prefetch}:
>     - shard-bmg:          NOTRUN -> [FAIL][16] +1 other test fail
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13788/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-mmap-prefetch.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8545_FULL and XEIGTPW_13788_FULL:
> 
> ### New IGT tests (4) ###
> 
>   * igt@core_getclient@basic:
>     - Statuses : 3 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@core_getstats@all-cards:
>     - Statuses : 3 pass(s)
>     - Exec time: [0.01, 0.05] s
> 
>   * igt@core_getstats@basic:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@xe_noexec_ping_pong@basic:
>     - Statuses : 2 pass(s) 1 skip(s)
>     - Exec time: [0.0, 10.67] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13788_FULL that come from known issues:

...cut...
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8545 -> IGTPW_13788
> 
>   IGTPW_13788: 182bddb848dbbbe9ac91dd0e671524497b9ab47a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8545: 8545
>   xe-3802-6279a928fb7ed7a69e44171637abf2bf50668a9c: 6279a928fb7ed7a69e44171637abf2bf50668a9c
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13788/index.html
