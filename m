Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D055CD41D74
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 12:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6462689D56;
	Mon, 15 Dec 2025 12:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJjS/5Xz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE9A89D56;
 Mon, 15 Dec 2025 12:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765800214; x=1797336214;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=//O9Yp0rxicNmo5963bRVkAfVEeMZeHGQBZcuY6q3ic=;
 b=fJjS/5XzJ7JxdNkhvFwLblZQ1YvW/wKe+MsKWjGIsEG64HkZncAD9lsM
 Pf2XQtG2QY+7XqVVtqwPznywim55Jq9094mbcnpLexQqUUmDJ46JX+fD1
 EdxQCJHm6014bohf/e4NUTRhcUkkNSXVFXcCD12kTa6WigFd53OjTGlks
 rqJVkY5mEYa4FkpNckEtiYXO1bX9ohXzpsLxTC/50+nBA+s33T0s7w5hu
 jY0YZ5NZ6qJeqFG2NWuxNAXqe5/UbWgGlsxupYV6mXa8oxZscaHJCGNTh
 ilA5QDXXJp7pxzklqokXhwc3pzASIQlRtgLW4lafsMrgSXAkCmZhZHr5U w==;
X-CSE-ConnectionGUID: tTKSc15NS7OdANo8cOhC2A==
X-CSE-MsgGUID: 2SHnkWxWQNaMyLNbcVYkJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="90353857"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="90353857"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 04:03:33 -0800
X-CSE-ConnectionGUID: lbw9S1MZQMacjDcwYupFUw==
X-CSE-MsgGUID: 4kysz7zjRbSXNTcC5UKbSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="196787631"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 04:03:29 -0800
Date: Mon, 15 Dec 2025 13:03:07 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pawel Sikora <pawel.sikora@intel.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 docs: update for platform-neutrality (rev5)
Message-ID: <20251215120307.4tx6dfzhsqrsoitj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pawel Sikora <pawel.sikora@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20251212110301.342433-1-pawel.sikora@intel.com>
 <176559465634.83024.6642960921708580908@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176559465634.83024.6642960921708580908@a3b018990fe9>
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
On 2025-12-13 at 02:57:36 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: docs: update for platform-neutrality (rev5)
> URL   : https://patchwork.freedesktop.org/series/158808/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8664_FULL -> XEIGTPW_14201_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14201_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14201_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_14201_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pm_rpm@universal-planes:
>     - shard-bmg:          [PASS][1] -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8664/shard-bmg-3/igt@kms_pm_rpm@universal-planes.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14201/shard-bmg-2/igt@kms_pm_rpm@universal-planes.html
> 

Unrelated,

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8664_FULL and XEIGTPW_14201_FULL:
> 
> ### New IGT tests (12) ###
> 
>   * igt@fbdev@eof:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@fbdev@nullptr:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@fbdev@read:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.46, 1.81] s
> 
>   * igt@fbdev@unaligned-read:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.01, 0.02] s
> 
>   * igt@fbdev@unaligned-write:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.10, 0.32] s
> 
>   * igt@fbdev@write:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.32, 1.18] s
> 
>   * igt@xe_exec_store@basic-all@engine-drm_xe_engine_class_compute-instance-0-tile-0:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@xe_gt_freq@freq_low_max:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@xe_gt_freq@freq_reset:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.49] s
> 
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - Statuses : 2 pass(s)
>     - Exec time: [24.51, 24.71] s
> 
>   * igt@xe_gt_freq@freq_suspend:
>     - Statuses : 1 pass(s) 1 skip(s)
>     - Exec time: [0.10, 3.46] s
> 
>   * igt@xe_gt_freq@throttle_basic_api:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14201_FULL that come from known issues:
> 
> ### IGT changes ###
> 
...cut...
