Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9E7C83F07
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 08:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BFE10E2E6;
	Mon,  7 Jul 2025 08:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MzAU0ZPs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA3D10E2E6
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 08:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751875383; x=1783411383;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+qpyHFd7Juu4xTyG8YPywUMeOyC+W8J6kJsWAkNlTxs=;
 b=MzAU0ZPsUYfcvW9TwxCrWhyqJu0SYiOJRL6tffqV3dOXV4wXCujAanYO
 qhRRgJ8bEIGnhHf0mbEVg5zn9kiKgs2k27W16wUqJvSDFXipVdXP3QtLg
 9GDdyMC0EpT7rCplYqp80qISI3/PkF5Dnb7gmWIWiv7x4Gwsl+XgZKv3n
 ifl8ouzyi/sFMTx/KEmA90m2RXPdth9j5HPhkaAGHNRB/S94GK5Z/1QXv
 Erzo3vQhc14Lb9lW9XASisir+mjd73cwJXfy+hC6zLqFyxKs/Vz0uBvwd
 vdAVEQiqV8GjTN+DHdFMMVavWB5X2Zr4uHH5dnZaT0vEtx5TeghOrqPIa Q==;
X-CSE-ConnectionGUID: QDCjjINQS5ekytt1SYRnzw==
X-CSE-MsgGUID: hIcL0kpcQ4mdLrdDcSgPxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="71524557"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="71524557"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 01:03:03 -0700
X-CSE-ConnectionGUID: S48E0TiRQmq4NhWUhD3AXA==
X-CSE-MsgGUID: vn+xz1usQI6u+NO/n0CZPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="178811262"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 01:03:02 -0700
Date: Mon, 7 Jul 2025 10:03:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Robin Clark <robin.clark@oss.qualcomm.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 msm: recovery and mapping updates (rev2)
Message-ID: <20250707080300.dnd3u5ndhgu3w52x@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Robin Clark <robin.clark@oss.qualcomm.com>
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
 <175176825069.137462.8891542839610724577@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175176825069.137462.8891542839610724577@1538d3639d33>
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
On 2025-07-06 at 02:17:30 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: msm: recovery and mapping updates (rev2)
> URL   : https://patchwork.freedesktop.org/series/150977/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8441_FULL -> XEIGTPW_13408_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13408_FULL absolutely need to be
>   verified manually.

Unrelated to msm changes.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13408_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13408_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@blocking-absolute-wf_vblank@c-dp2:
>     - shard-bmg:          NOTRUN -> [FAIL][1] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13408/shard-bmg-1/igt@kms_flip@blocking-absolute-wf_vblank@c-dp2.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map:
>     - shard-lnl:          [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8441/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13408/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_eu_stall@invalid-event-report-count:
>     - shard-dg2-set2:     [SKIP][4] ([Intel XE#4208]) -> [SKIP][5] +1 other test skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8441/shard-dg2-436/igt@xe_eu_stall@invalid-event-report-count.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13408/shard-dg2-432/igt@xe_eu_stall@invalid-event-report-count.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13408_FULL that come from known issues:
> 
...cut...

