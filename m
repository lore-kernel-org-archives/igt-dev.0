Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B336C982FA
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 12:12:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16EF10E7F4;
	Wed, 23 Sep 2026 12:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lj+YjsYr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BD189819;
 Wed, 23 Sep 2026 12:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790165490; x=1821701490;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wTBSYnEtCvd2tSjNc4atBfSfzpPRLbYiXyFZ7mTULRM=;
 b=lj+YjsYrj268wJiWtclA0BTtqLOpXHyUC8fFLNhlHSDDqyfXH6oqkZOE
 ZXCxRLB+ciQF1tmJNIFXPB0wEt00hZJJ3AO0/kwtDRhFfrbysomuArues
 6Q6TqwHDzCfHu+p1QhLFKiQtW3UbYPblMV5kLRpnaQGXOndjRvK4MoFfe
 79thv5snIzAvbCO3pMaxrqt2NcRPusy7920i9GFqtPDLDlLjh45ez7djm
 Jf6a+9TkJ+rkC+69DJvcHe//1B8SNl787C4AXdGcc5bIHMkWmNxBNWWi1
 p6eHY00Im2a59IrrW//lY0z+6Bb6SxqoEJI+di64Z7k+Jn5ifyXBRW0UD g==;
X-CSE-ConnectionGUID: EjUKCOmFSAmZfQFQctATtg==
X-CSE-MsgGUID: yzFMXaLCTPOWeXZ4cMeeHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="102209388"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="102209388"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 05:11:30 -0700
X-CSE-ConnectionGUID: XVpbMlYISdid3x7oRK0vpw==
X-CSE-MsgGUID: DaRk4MjlQ9OT6Tqm6+ZPig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="281656858"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 05:11:29 -0700
Date: Wed, 23 Sep 2026 14:11:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 intel-ci: Add multigpu svm to CRI Core blocklist
Message-ID: <20260923121106.3fjvztkndctqwvot@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260921115610.933754-1-venkateswara.rao.muppidi@intel.com>
 <179000895240.188435.6584871939786844367@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179000895240.188435.6584871939786844367@61270ab9df2a>
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
On 2026-09-21 at 16:42:32 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci: Add multigpu svm to CRI Core blocklist
> URL   : https://patchwork.freedesktop.org/series/174617/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9104_BAT -> XEIGTPW_15870_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15870_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15870_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (15 -> 15)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_15870_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_fault_mode@twice-invalid-fault:
>     - bat-bmg-2:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15870/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
> 
>   * igt@xe_exec_fault_mode@twice-rebind-prefetch:
>     - bat-bmg-1:          [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15870/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html
> 
>   * igt@xe_exec_system_allocator@many-execqueues-malloc:
>     - bat-bmg-vm:         [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15870/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html
> 
>   * igt@xe_multigpu_svm@mgpu-pagefault-basic:
>     - bat-bmg-3:          [PASS][7] -> [DMESG-WARN][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15870/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html
> 

Unrelated, this only modifies CRI blocklist.



Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15870_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@xe_waitfence@engine:
>     - bat-ptl-2:          [PASS][9] -> [FAIL][10] ([Intel XE#9109])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-ptl-2/igt@xe_waitfence@engine.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15870/bat-ptl-2/igt@xe_waitfence@engine.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-bmg-2:          [ABORT][11] ([Intel XE#8007]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15870/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
>     - bat-bmg-1:          [DMESG-WARN][13] -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15870/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_system_allocator@many-execqueues-free:
>     - bat-bmg-vm:         [DMESG-WARN][15] -> [PASS][16]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15870/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html
> 
>   * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
>     - bat-bmg-3:          [DMESG-WARN][17] -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15870/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html
> 
>   
>   [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
>   [Intel XE#9109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_9104 -> IGTPW_15870
>   * Linux: xe-5796-211407639045faaf2eeb884e801d1762b43c837c -> xe-5797-ab82471ddff094939d9981e0647332562c7e1c9b
> 
>   IGTPW_15870: 15870
>   IGT_9104: a89d58dad0dd62228269a6049b39fc39ae6cf698 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-5796-211407639045faaf2eeb884e801d1762b43c837c: 211407639045faaf2eeb884e801d1762b43c837c
>   xe-5797-ab82471ddff094939d9981e0647332562c7e1c9b: ab82471ddff094939d9981e0647332562c7e1c9b
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15870/index.html
