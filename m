Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE30CC25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 14:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA4010E104;
	Thu, 23 May 2024 14:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jtdsv5CC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFDE10E06D
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 14:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716473301; x=1748009301;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LUKnkjYjjFBSIaPAJjmbx940EKEwsUgsAmw1UHIUOn8=;
 b=Jtdsv5CCVpaG09a3TaCzjEsCVxmC7d3FCwMbLL3GufW9JlV5CmfS/Zno
 Ip38b2XCEQAJCWikW7qqfFmC/Kp8Lq2pa3GYUTzVb17Zi29KIkAzXJLW2
 HPNxYVFhHpt+zhgjvMHJvlkKYjsLku9iZpQezqM0ZRWAW9HHK+uUSabve
 8BII7niYLOQRvl6dv4QCpb54kD1DqG1zKfufq1T9xOCXsJVWJImHNpX2N
 jeaqufFCxscnrk8yFLYbtZDNvcyKrUNfgq9Q0wvN/6Mdcq/0Tfd5w/wlS
 QuL2zZ7GXiqoq4feo/N0oNme5Fqkl26ZI+jaVFPaSTs03erSrgipvgKEU Q==;
X-CSE-ConnectionGUID: uE1NLurmRq6nCKOOVaehuQ==
X-CSE-MsgGUID: DRHc5ZT+QW+AF5Fn7ecuug==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12909544"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="12909544"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 07:08:19 -0700
X-CSE-ConnectionGUID: xNcY8l2ySEat0XpelQIlBg==
X-CSE-MsgGUID: kTmE+V3zRLqJLzxX0IB7/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="33563600"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 07:08:09 -0700
Date: Thu, 23 May 2024 16:07:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_chec?=
 =?utf-8?Q?k?= drmModeGetConnector() return value in some missing places
Message-ID: <20240523140752.ipxqsmhfekzfhphj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Luca Coelho <luciano.coelho@intel.com>
References: <20240523084426.284894-1-luciano.coelho@intel.com>
 <171645640549.2169609.15811742476364682252@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171645640549.2169609.15811742476364682252@8e613ede5ea5>
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
On 2024-05-23 at 09:26:45 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: check drmModeGetConnector() return value in some missing places
> URL   : https://patchwork.freedesktop.org/series/133953/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7869_BAT -> XEIGTPW_11181_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11181_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11181_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_11181_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_atomic@basic-inc-all:
>     - bat-atsm-2:         [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11181/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all.html
> 
>   * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-vram0-memory:
>     - bat-atsm-2:         [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-vram0-memory.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11181/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-vram0-memory.html
> 

Unrelated to change in lib/chamelium and a i915 test,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11181_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@xe_evict@evict-small-cm:
>     - bat-adlp-7:         NOTRUN -> [SKIP][5] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11181/bat-adlp-7/igt@xe_evict@evict-small-cm.html
> 
>   * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
>     - bat-dg2-oem2:       [PASS][6] -> [ABORT][7] ([Intel XE#1908])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11181/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
>     - bat-adlp-7:         [ABORT][8] ([Intel XE#1908]) -> [PASS][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11181/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7869 -> IGTPW_11181
>   * Linux: xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921 -> xe-1333-7643e429e72c546f3779339624df885f6160124c
> 
>   IGTPW_11181: 11181
>   IGT_7869: e43892a30d594f8bcbcbd42ccffe298313479215 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921: 42b9a14c5932c577019bf2f5d5ff25d208c1f921
>   xe-1333-7643e429e72c546f3779339624df885f6160124c: 7643e429e72c546f3779339624df885f6160124c
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11181/index.html
