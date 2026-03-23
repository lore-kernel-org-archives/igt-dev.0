Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A629EF46100
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 12:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3CD10E3D5;
	Mon, 23 Mar 2026 12:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jmsfZdVP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CED310E3D3;
 Mon, 23 Mar 2026 12:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774269999; x=1805805999;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=H/adUNuXy/VK3JZx6iWvvFCQBJQAtNUywbGsyXJskU8=;
 b=jmsfZdVPpNu238OODZyfg68ybpAp/802HaN0VgDZ37EpzHII9Rk2t/8C
 xPwAqm3c1baCt64ya2zQpVAXMJRP0CNslyI7X0c5DCkhQS37ePpY4Fxxs
 trodS9QgKpR/YJrxBx6vHtR18IZOdzE2p4pwT6WMZdN/ezUI9Jp+ZW0Hr
 Vz0mtRc+wf7T+ZrA6OPY05sUT8Gz1y6KFdH8l/oKKkrc+IA74unhDzvm0
 gd9Gocpfb/ouuWtsmHwcBAPPEpTJSjkMXDBphQb8BsEG+qz0du0uibBsy
 dv1GaQCvc+1h4dwDfqbwAukuDJP5ZcMDCPta2YI99BUqaAvIBIW7z5Lnx Q==;
X-CSE-ConnectionGUID: yiQ7NlJVT5OnU+nukPgeuw==
X-CSE-MsgGUID: IaROrtaOQYuI+R0vUT5UWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="85961399"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="85961399"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 05:46:38 -0700
X-CSE-ConnectionGUID: x3sntcQ+Sje2BqYN054DtA==
X-CSE-MsgGUID: FHfssYasRQ6GxMGZtuzSPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="224033210"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 05:46:37 -0700
Date: Mon, 23 Mar 2026 13:46:34 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_lib=2Fdrmte?=
 =?utf-8?B?c3Q6?= Create proper error report when open driver fails
Message-ID: <20260323124634.omjchm4iwuuhxr55@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260320123417.30143-1-kamil.konieczny@linux.intel.com>
 <177412240495.383329.390362022866951611@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177412240495.383329.390362022866951611@a3b018990fe9>
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
On 2026-03-21 at 19:46:44 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/drmtest: Create proper error report when open driver fails
> URL   : https://patchwork.freedesktop.org/series/163593/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8815_FULL -> XEIGTPW_14826_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14826_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14826_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_14826_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_psr@psr2-suspend:
>     - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-lnl-8/igt@kms_psr@psr2-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-1/igt@kms_psr@psr2-suspend.html
> 
>   * igt@xe_eudebug@basic-vm-access-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][3] +4 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-3/igt@xe_eudebug@basic-vm-access-userptr.html
> 
>   * igt@xe_eudebug@discovery-empty-clients:
>     - shard-lnl:          NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-4/igt@xe_eudebug@discovery-empty-clients.html
> 
>   * igt@xe_noexec_ping_pong@basic:
>     - shard-bmg:          [PASS][5] -> [INCOMPLETE][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8815/shard-bmg-10/igt@xe_noexec_ping_pong@basic.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-bmg-1/igt@xe_noexec_ping_pong@basic.html
> 

These are unrelated,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14826_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#3157])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14826/shard-lnl-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
...cut...
