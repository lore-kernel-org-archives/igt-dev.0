Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478ECD74ED3
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 14:07:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF2110EAF8;
	Fri, 23 Jan 2026 14:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N7GwVe7w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C020110EAF8;
 Fri, 23 Jan 2026 14:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769177244; x=1800713244;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9OYvkkNBJplpgYmUredbeJOx2waDrY9XXOmmETwj6ws=;
 b=N7GwVe7wBvpVDc20TaKQ5iEmlWQHkmilVQENnJZLL3F53c/q9OjkHxHR
 3EVBbTIap51+fYds6f+cBtj0CNO82GUhZPF4i7tFeyTehw7y5M3NzED4G
 O3M9Xk1YFQfkBrNXwp0TQ7gyr5ijUGMSWfxMEVLJttcvUjU1TVtfJBxXK
 wHKguMxKIjP4AEpyo6toFLjQKX82JZbMHr7MOV3ULtncLFye+aiXlIWAZ
 87r4eUUrBbw0/Xal26SgjZiCI9mk8EGxx4OKk1kVlty9nGGXCjjQDRFJv
 hvdbYD1sEoV2oo1toy4+DoXu+2n28V05pblROPvtIrHNehP21hkBq4ZFH Q==;
X-CSE-ConnectionGUID: ZNFF5xdMS9ezXaGOQDizwA==
X-CSE-MsgGUID: 7x1cFJ5wQRqmC6it5TARJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="73018504"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="73018504"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 06:07:23 -0800
X-CSE-ConnectionGUID: Bh/HpHwCQQ+qiqq5wKW79A==
X-CSE-MsgGUID: Rh6gfD0CTemvl06gCPfDfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="211158323"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 06:07:22 -0800
Date: Fri, 23 Jan 2026 15:07:19 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Hung <alex.hung@amd.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 README: Update oneliner build command for igt_runner
Message-ID: <20260123140719.jf5my4zlazx54mi6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260122170901.644692-1-alex.hung@amd.com>
 <176917401937.187526.17864613960551413181@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176917401937.187526.17864613960551413181@a3b018990fe9>
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
On 2026-01-23 at 13:13:39 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: README: Update oneliner build command for igt_runner
> URL   : https://patchwork.freedesktop.org/series/160517/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8713_FULL -> XEIGTPW_14402_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14402_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14402_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_14402_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:
>     - shard-lnl:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8713/shard-lnl-8/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14402/shard-lnl-8/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html
> 
>   * igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs:
>     - shard-bmg:          [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8713/shard-bmg-3/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14402/shard-bmg-4/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-lnl:          NOTRUN -> [ABORT][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14402/shard-lnl-8/igt@xe_pm@s4-exec-after.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-bmg:          [SKIP][6] ([Intel XE#2313]) -> [ABORT][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8713/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14402/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> 

Unrelated.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14402_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
...cut...
