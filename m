Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5E9C02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 13:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2024910E39E;
	Wed, 22 Jan 2025 13:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UfUZ4BMG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F0710E39E;
 Wed, 22 Jan 2025 13:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737551160; x=1769087160;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SwVSxUHPlvhABjGnDfP9Di97BdY6jZox86pnc6yHtyo=;
 b=UfUZ4BMG5NvWQWmOkRGpFNhPU/r1uUQx+9mtRKL6WlYKIxj4yXn6ljo3
 gyhATmek1/+iZMYlGuq7rRFCRoExBjC2oC1mNJXB4FVLNqub44IHqg3gi
 EHwpL4ADNUIsGMRoDxk7XYQ7nlNofD24h7+wmKLrhO6bNLnX55jh0BMh4
 SW2lnZEEbBUL2ekDeIkM8ciTm5Tw+DdM8O9ZwIpU2SVl1VaktcKupg6cB
 3OL6bmAH85bgJ41G/5YKPwODJaBc/nbm1GZhHtkC+m3WyCegITlDW71DW
 0qAHnK91ezwHdC1tlA+yr7Ye/EdJZWBaIeff6zvnRN7ZEEV9NN0eZsHvC g==;
X-CSE-ConnectionGUID: YQcYfwC7QlyMuwlZ4bV3PA==
X-CSE-MsgGUID: F65wR33pQJeA/RAc5yS7vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37885429"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="37885429"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 05:05:59 -0800
X-CSE-ConnectionGUID: YhiK+slkQtOsaVBuxB2eTg==
X-CSE-MsgGUID: 6e7LUumiTy2vmdmXytM6Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="112117887"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 05:05:58 -0800
Date: Wed, 22 Jan 2025 14:05:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 tools: rename power into igt_power
Message-ID: <20250122130540.d66ts2iogtmv7u7i@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250121154919.181947-1-kamil.konieczny@linux.intel.com>
 <173753820251.2977314.10591253366091190565@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173753820251.2977314.10591253366091190565@b555e5b46a47>
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
On 2025-01-22 at 09:30:02 -0000, Patchwork wrote:

these are unrelated, patch touches only tools/power,
no changes in tests nor libs.

Reagrds,
Kamil

> == Series Details ==
> 
> Series: tools: rename power into igt_power
> URL   : https://patchwork.freedesktop.org/series/143806/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8204_full -> XEIGTPW_12475_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12475_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12475_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12475_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12475/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-dg2-set2:     [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8204/shard-dg2-435/igt@kms_fbcon_fbt@fbc-suspend.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12475/shard-dg2-436/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
>     - shard-lnl:          [PASS][4] -> [FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8204/shard-lnl-5/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12475/shard-lnl-7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
>     - shard-lnl:          [PASS][6] -> [DMESG-WARN][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8204/shard-lnl-7/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12475/shard-lnl-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze:
>     - shard-dg2-set2:     [PASS][8] -> [ABORT][9] +1 other test abort
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8204/shard-dg2-463/igt@xe_pm_residency@gt-c6-freeze.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12475/shard-dg2-432/igt@xe_pm_residency@gt-c6-freeze.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12475_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotrebind-lateclose:
>     - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#1885])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8204/shard-bmg-8/igt@core_hotunplug@hotrebind-lateclose.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12475/shard-bmg-3/igt@core_hotunplug@hotrebind-lateclose.html
>     - shard-dg2-set2:     [PASS][12] -> [SKIP][13] ([Intel XE#1885])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8204/shard-dg2-435/igt@core_hotunplug@hotrebind-lateclose.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12475/shard-dg2-432/igt@core_hotunplug@hotrebind-lateclose.html
> 

...cut...

>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8204 -> IGTPW_12475
>   * Linux: xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e -> xe-2524-44010d7f04695da899c2860de32625a71011fbab
> 
>   IGTPW_12475: 011efc99ed7fce52387a923b8d4f01a6a056f9bd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8204: b8f853f36eed19149b36e5d70c63095c6da12ffe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e: 1895bff23f876faf3d3be7da46172eb4bb49453e
>   xe-2524-44010d7f04695da899c2860de32625a71011fbab: 44010d7f04695da899c2860de32625a71011fbab
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12475/index.html
