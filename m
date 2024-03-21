Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B99C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 12:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E91E10E99C;
	Thu, 21 Mar 2024 12:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IboqNcs0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A99E10E99C;
 Thu, 21 Mar 2024 12:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711025387; x=1742561387;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Rg5H+6U9kj7tDAolxBrUwMMxtD0jljm4IoQl9/baxzM=;
 b=IboqNcs0zwCJtEfoxky7H58ZS40K7wQRvLe4inLpuG3mUnbf+kN4QgTV
 4YA7b7st4KtkjdZjfN4ysGAzPHR83WE08t68w9aihEILHnOUhRzWQ3Xz0
 Ix8SR7t5ayRBMdLPUAOI8qYnBXFobVhX4RZ69UH0yawkS+X5zR5yaEYZf
 jMw+uI2IxQg0elXTTPF8LQID6+ccLRovcqaYLwSl2Awe2FokvSShhFPlZ
 Dtk5Aiy6zDSndMAwTyVxFPCOEDRX03sWXABKjBf8iRh70+g3E/E/NA7wp
 wyo6ERygcraYySQLxJ+si1KE81JgfbUgmgUVzpJ6+1IvuYAv6lvugfai+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="9795384"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="9795384"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 05:49:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="37606927"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 05:49:44 -0700
Date: Thu, 21 Mar 2024 13:49:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 introduce Xe multigpu and other multi-GPU helpers (rev14)
Message-ID: <20240321124923.fdlo7rkpygvnv6g7@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org,
 lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
 <171100720036.938898.3335037622784355245@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171100720036.938898.3335037622784355245@8e613ede5ea5>
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
On 2024-03-21 at 07:46:40 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: introduce Xe multigpu and other multi-GPU helpers (rev14)
> URL   : https://patchwork.freedesktop.org/series/129101/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14457_full -> IGTPW_10866_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10866_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10866_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/index.html
> 
> Participating hosts (10 -> 9)
> ------------------------------
> 
>   Missing    (1): shard-snb-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10866_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_create@create-clear@smem0:
>     - shard-dg1:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14457/shard-dg1-18/igt@gem_create@create-clear@smem0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/shard-dg1-16/igt@gem_create@create-clear@smem0.html
> 
>   * igt@i915_pipe_stress@stress-xrgb8888-untiled:
>     - shard-snb:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14457/shard-snb1/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/shard-snb6/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-d-edp-1:
>     - shard-mtlp:         [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14457/shard-mtlp-3/igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-d-edp-1.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/shard-mtlp-1/igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-d-edp-1.html
> 
>   * igt@kms_setmode@basic@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [FAIL][7] +1 other test fail
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/shard-dg1-15/igt@kms_setmode@basic@pipe-a-hdmi-a-4.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_eio@kms:
>     - shard-dg1:          [FAIL][8] ([i915#5784]) -> [INCOMPLETE][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14457/shard-dg1-17/igt@gem_eio@kms.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/shard-dg1-18/igt@gem_eio@kms.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x42:
>     - shard-mtlp:         [SKIP][10] ([i915#8814]) -> [ABORT][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14457/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/shard-mtlp-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html
> 

These are unrelated to changes, please respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10866_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#9318])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/shard-mtlp-6/igt@debugfs_test@basic-hwmon.html
> 

...cut...

> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7770 -> IGTPW_10866
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14457: cfe25dc9ae2e1add3f2605831bf6d8bea481164b @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10866: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/index.html
>   IGT_7770: fef0422fd296f7c65724315f2a455ffb6959fb0d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10866/index.html
