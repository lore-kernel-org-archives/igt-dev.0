Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E296C25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 16:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8080010E2EA;
	Fri, 24 May 2024 16:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BkodbsNU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAB510E2EA;
 Fri, 24 May 2024 16:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716568150; x=1748104150;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/tudVRMbI8q68L76DY5C9yWl3ebH0YBAc7aVMwMfOgk=;
 b=BkodbsNUPOc1Uoi+gPQckCMrJBLJfQ0Seo5dCMKRaL0FJXpVY7r6AH6i
 ElbJaj2AcX0D7bIhdMFsPj3CTJwTZNkE1lmILOLfYsq4EigFQP362MUtG
 5o7lUsZIkohUHew0Sgrx9FohWEocVTTSG7YUf6CgrWF/6JEuu5xu2RX8X
 6sDAguwq4/aE2ObX+jsg6BsYH6f/LXOCnk81jJRwqXq3SUwiaTYlCIbIW
 WHprADXuSHG5hqEaawrtSGtP6cYWalP39JDS/xBC3GeX35MtFUlBfX5Km
 hMj1J//T6uMFMeQeo0TI0HGA8+lCxLrRN4i/ea0Xj42WAC9qQrrkGXsT1 Q==;
X-CSE-ConnectionGUID: j+JUqy1wSVqGMMqdJNorHg==
X-CSE-MsgGUID: mNsYUfqzQWaT71NsiDQw+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="23522690"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="23522690"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 09:29:09 -0700
X-CSE-ConnectionGUID: gDaxBnKRQeCsuRH2vSbmUg==
X-CSE-MsgGUID: c+t4qpqgR16hh3aVYXE3nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="34090032"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 09:29:08 -0700
Date: Fri, 24 May 2024 18:29:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Khaled Almahallawy <khaled.almahallawy@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/kms_sysfs_edid_timing: Skip the first detect (rev2)
Message-ID: <20240524162905.7yo73pamdqwtc72t@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240523000409.284668-1-khaled.almahallawy@intel.com>
 <171648564602.2170280.12021533951200524629@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171648564602.2170280.12021533951200524629@8e613ede5ea5>
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
On 2024-05-23 at 17:34:06 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_sysfs_edid_timing: Skip the first detect (rev2)
> URL   : https://patchwork.freedesktop.org/series/133778/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14805_full -> IGTPW_11179_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11179_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11179_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11179/index.html
> 
> Participating hosts (10 -> 9)
> ------------------------------
> 
>   Missing    (1): shard-snb-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11179_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_busy@close-race:
>     - shard-dg2:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14805/shard-dg2-10/igt@gem_busy@close-race.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11179/shard-dg2-6/igt@gem_busy@close-race.html
> 
>   * igt@gem_exec_schedule@preempt-engines@bcs0:
>     - shard-mtlp:         [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14805/shard-mtlp-6/igt@gem_exec_schedule@preempt-engines@bcs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11179/shard-mtlp-6/igt@gem_exec_schedule@preempt-engines@bcs0.html
> 
>   * igt@gem_exec_schedule@preempt-engines@rcs0:
>     - shard-mtlp:         [PASS][5] -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14805/shard-mtlp-6/igt@gem_exec_schedule@preempt-engines@rcs0.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11179/shard-mtlp-6/igt@gem_exec_schedule@preempt-engines@rcs0.html
> 

Not related,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11179_full that come from known issues:
> 
> ### IGT changes ###

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7869 -> IGTPW_11179
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14805: b912a794bf8a370cde8be56c138f5c82de0dde8f @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11179: 11179
>   IGT_7869: e43892a30d594f8bcbcbd42ccffe298313479215 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11179/index.html
