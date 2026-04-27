Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2C5FF8868
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 14:44:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E9310E786;
	Mon, 27 Apr 2026 14:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QAjKFAtw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECC210E786;
 Mon, 27 Apr 2026 14:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777301072; x=1808837072;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=veoewf41VdwnaB1jqtLK1obsPpoK1ipcLmtDDjnAwGo=;
 b=QAjKFAtwTf2UlUZAvYw9+SNrqFwLtlP/MNMaZ7pvi7hbOhP5ACmU707E
 6YSHqut19X/pYLsfg6/dXHmju31m/PFKws2c20c3/BHGxxZ9RG67ek8D8
 HFZpPzNiQ1kt+NfzoblOG2HYgeO58mMEhU1DNGjIR7sKdhAFZkvvGc49B
 mP+E/lAKSGbWlNvEB+9aZ+R5ScKLCQWqgpJEmyJl2MBjiGo9fVunBR7wq
 cPUVtWJvvbjrNJsXXmBBMufeRlFda0v/E5ZWbJCqgJofuAlp/YQsgBls2
 rfS2qvrqEGSONXVNAU4UjUFbw0yxbu7nL5W1BtcK6bE0YedOxhhbGShQp Q==;
X-CSE-ConnectionGUID: l2OkZPEhRnGV87QgUAdvuA==
X-CSE-MsgGUID: Fcbvcu+LTbSuvN0moK8G3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="100848284"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="100848284"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 07:44:31 -0700
X-CSE-ConnectionGUID: c00Rf2YOSoKijFU39ez7FA==
X-CSE-MsgGUID: yzw63EI1TPqd5k50ymtmXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="237985339"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 07:44:31 -0700
Date: Mon, 27 Apr 2026 16:44:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 Few fixes for igt_display_reset_outputs() in lib/igt_kms
Message-ID: <20260427144427.tdb6cu2wllsmpv6t@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260424151355.129423-1-kamil.konieczny@linux.intel.com>
 <177705347341.7958.4179894556185423615@5ab824fced77>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177705347341.7958.4179894556185423615@5ab824fced77>
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
On 2026-04-24 at 17:57:53 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Few fixes for igt_display_reset_outputs() in lib/igt_kms
> URL   : https://patchwork.freedesktop.org/series/165439/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8873_FULL -> XEIGTPW_15053_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15053_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15053_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_15053_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_ccs@block-multicopy-compressed:
>     - shard-bmg:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15053/shard-bmg-9/igt@xe_ccs@block-multicopy-compressed.html
> 
>   * igt@xe_exec_balancer@once-virtual-userptr-invalidate-race:
>     - shard-bmg:          [PASS][2] -> [SKIP][3] +36 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-6/igt@xe_exec_balancer@once-virtual-userptr-invalidate-race.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15053/shard-bmg-9/igt@xe_exec_balancer@once-virtual-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@no-exec-rebind@vcs1:
>     - shard-bmg:          NOTRUN -> [FAIL][4] +2 other tests fail
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15053/shard-bmg-2/igt@xe_exec_basic@no-exec-rebind@vcs1.html
> 
>   * igt@xe_exec_basic@no-exec-rebind@vecs0:
>     - shard-bmg:          [PASS][5] -> [FAIL][6] +3 other tests fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-9/igt@xe_exec_basic@no-exec-rebind@vecs0.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15053/shard-bmg-2/igt@xe_exec_basic@no-exec-rebind@vecs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-bmg:          [SKIP][7] ([Intel XE#6911] / [Intel XE#7466]) -> [SKIP][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8873/shard-bmg-10/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15053/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 

Not related to change.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8873_FULL and XEIGTPW_15053_FULL:
> 
> ### New IGT tests (3) ###
> 
>   * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-c-plane-0:
>     - Statuses : 1 pass(s)
>     - Exec time: [6.86] s
> 
>   * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-c-plane-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.07] s
> 
>   * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-c-plane-5:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15053_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
...cut...
