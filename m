Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E82AD41D74
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 10:12:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DE510E282;
	Mon, 15 Dec 2025 10:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ealZJidj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDB910E282;
 Mon, 15 Dec 2025 10:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765793541; x=1797329541;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Him7Te2D+GOui7Y70LtXKD0hJXudmPfgY4Uc+BUzRqY=;
 b=ealZJidjGQ+5lTtQFF/lu+qpVfkLs6uCTkU7NLoYBjGSrXXSwc/D/Z2y
 OZJm6Flvy9EpTdf4u0l8sC9vh4I4zU+83/3wU6v7CE8AhZHiOQyUE6qrJ
 Hy0If0s2Y3dcdrsBbvqclFhxpzJCVB1Hh5Y0xfbhJLULkDcluc7FqprGR
 /e6jl0fpsMpYwX9RuSngRHyewGHTJ8ZKpuNpUaUf/dBo7YCUy2MS0eNzH
 58KNJlU9zOdxq4nDv/UjsrlKIBQLK508HMLu57vt++PYRR+o5mwMrRdnw
 tbffHAVaacz6Y0r/EoO4OsDpFftZlqMdncGRrgpvIcXsbnMdZW51jrchz A==;
X-CSE-ConnectionGUID: kfQc21+LRKGWxWXSkxADNg==
X-CSE-MsgGUID: e3u62J5jSbya3LWkmQS4qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="85283211"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="85283211"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 02:12:18 -0800
X-CSE-ConnectionGUID: XFEiBR4zTwmyByGeuEP2Pg==
X-CSE-MsgGUID: 8UGArVf5RSCBSx4FYtqqVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="197445251"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 02:12:17 -0800
Date: Mon, 15 Dec 2025 11:12:14 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 intel-ci: remove few i915 symlinks
Message-ID: <20251215101214.52bnibgzn6rjyfdj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20251212141808.65453-1-kamil.konieczny@linux.intel.com>
 <176563892005.84868.16720151137580063928@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176563892005.84868.16720151137580063928@a3b018990fe9>
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
On 2025-12-13 at 15:15:20 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci: remove few i915 symlinks
> URL   : https://patchwork.freedesktop.org/series/158863/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8665_FULL -> XEIGTPW_14203_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14203_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14203_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_14203_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:
>     - shard-bmg:          NOTRUN -> [SKIP][1] +7 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html
> 
>   * igt@xe_exec_multi_queue@one-queue-preempt-mode-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][2] +2 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-lnl-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-basic.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_exec_multi_queue@two-queues-basic-smem:
>     - shard-bmg:          [SKIP][3] ([Intel XE#6703]) -> [SKIP][4] +3 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-basic-smem.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14203/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-basic-smem.html
> 

Unrelated,

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8665_FULL and XEIGTPW_14203_FULL:
> 
> ### New IGT tests (1) ###
> 
>   * igt@kms_chamelium_frames:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14203_FULL that come from known issues:
> 
> ### IGT changes ###
> 
