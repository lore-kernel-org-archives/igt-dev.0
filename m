Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4484FC47DA9
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 12:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C4E10E9CE;
	Mon, 29 Jan 2024 12:16:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D0C10E9CA;
 Mon, 29 Jan 2024 12:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706530606; x=1738066606;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kg+WMn0zicH0lh8VfSJVzlrISZ2KjA2JlflVZNmrQWU=;
 b=ZfFBfHODrvk2/xx/P8fgKS2z2u86RmkzkMsjM7l88aN2ESROM/nurmM5
 UuwDTSUnYk+pzg+64hfJ7tENAmhBUj5VQR5TTyq4msMb6s470Rn0dm+gp
 o3XfnGXVVER4uwmibAtadZKsKZ0kIoxno/p0vGLjEXfbEW/OKo+BzK38R
 k86B9mc7Sc975BEM6uuvxt0E64RSrkpFgr5Jxl9T8YrUvtq6/ucLHkgWP
 HtkI8tWMydK6JjTDyNZdi/1Az7gONYNJt5ZCtqvg8AvWY39/s0i1m1gEM
 WgCMK/O1hYmapYL08h8y+SgtFDLMkLpaCt1TkepGgHh3qWrGHJfFPqKm6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="10316701"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="10316701"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 04:16:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3355198"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 04:16:43 -0800
Date: Mon, 29 Jan 2024 13:16:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_serie?=
 =?utf-8?Q?s?= starting with [1/3] lib/amdgpu: add support for gang cs
Message-ID: <20240129121640.22qm5guwuht5b3ak@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, vitaly.prosyak@amd.com,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240125034413.232349-1-vitaly.prosyak@amd.com>
 <170616214313.709515.13480237695014375689@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170616214313.709515.13480237695014375689@5338d5abeb45>
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
Cc: lgci.bug.filing@intel.com, I915-ci-infra@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi igt-dev,
On 2024-01-25 at 05:55:43 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/3] lib/amdgpu: add support for gang cs
> URL   : https://patchwork.freedesktop.org/series/129148/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7691_BAT -> XEIGTPW_10586_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_10586_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_10586_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_10586_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:
>     - bat-pvc-2:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7691/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10586/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html
> 

Unrelated to amdgpu, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_10586_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-adlp-7:         [PASS][3] -> [DMESG-FAIL][4] ([Intel XE#1033])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7691/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10586/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
> 
>   
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7691 -> IGTPW_10586
>   * Linux: xe-674-0496fe20d8ed5e73ed186d293ef67e7bae4658eb -> xe-679-e7da820591c355e591fe880ff1e02b85a3f1a413
> 
>   IGTPW_10586: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10586/index.html
>   IGT_7691: 7691
>   xe-674-0496fe20d8ed5e73ed186d293ef67e7bae4658eb: 0496fe20d8ed5e73ed186d293ef67e7bae4658eb
>   xe-679-e7da820591c355e591fe880ff1e02b85a3f1a413: e7da820591c355e591fe880ff1e02b85a3f1a413
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10586/index.html
