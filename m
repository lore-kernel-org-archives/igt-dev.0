Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD1FC28B2E
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 10:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BA110E0F2;
	Wed, 12 Mar 2025 10:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="USO0yyWm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0BD10E0A3;
 Wed, 12 Mar 2025 10:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741774738; x=1773310738;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=+DBoDCWdLkzBnJ+4ttnaZUEBc5lTQd7EehqHKfwk818=;
 b=USO0yyWmxZPP51zvewP/x9TEDlHA8DyMpmrgGdbX/SHdafniASKJ6PKd
 G4ZDHN/1MxuUYsD2Tf+gSoguqgn+rhBnhILGx2zFDapDJ7jNV/iDxY/H7
 nbISCiHvfJSlYq4gRceNR32lf/GQerRcN7EIHc2dA3idPPfBk5yiI37sQ
 pBekiSmzU1CkT7A3/l+ecYtViRK5nPZ4JnCvisgXIaz+jqtfLmdGNY1qV
 xYQbkb6hiXjJhnT7D+FbjLWvjI7GD4WECwl7uuukh9T7gosknWSlXeFE5
 jw4PVj8/Jw4ft1CdY0X6DG88jTtsH0gaMVpyY1KSX67Qlez6WLiORHPLS A==;
X-CSE-ConnectionGUID: RDhCVfswRCuL8G00/vZRYA==
X-CSE-MsgGUID: TokUU6EdTR2o6yWjBxOBKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65306307"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="65306307"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 03:18:58 -0700
X-CSE-ConnectionGUID: 5tKHT2KiRxi61GTW//lxJQ==
X-CSE-MsgGUID: EpmiPf+lSc+kW2apQ7RPyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="125642091"
Received: from unknown (HELO [10.245.80.210]) ([10.245.80.210])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 03:18:57 -0700
Message-ID: <16ff23f4-19d0-4f7e-b152-b04f97665cd7@linux.intel.com>
Date: Wed, 12 Mar 2025 11:18:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_runner/kmem?=
 =?UTF-8?Q?leak=3A_Remove_unnecessary_lseek=28=29_calls?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250310200220.233045-1-peter.senna@linux.intel.com>
 <174172982249.22025.16092550615438407434@18a75f3d1eae>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174172982249.22025.16092550615438407434@18a75f3d1eae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Dear I915,

On 11.03.2025 22:50, Patchwork wrote:
> == Series Details ==
> 
> Series: runner/kmemleak: Remove unnecessary lseek() calls
> URL   : https://patchwork.freedesktop.org/series/146105/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8270_full -> XEIGTPW_12739_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12739_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12739_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12739_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
>     - shard-bmg:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8270/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12739/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
>     - shard-dg2-set2:     [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8270/shard-dg2-464/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12739/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

These are unrelated to my change.

Thank you,

Peter
