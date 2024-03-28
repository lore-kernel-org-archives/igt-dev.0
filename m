Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CEECD11DD
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 15:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBFF1124AE;
	Thu, 28 Mar 2024 15:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDh1PJtP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F701124AE;
 Thu, 28 Mar 2024 15:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711641396; x=1743177396;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QZA7j/dSdQtuKePvvkvzQKQvd3HBsihyFFBUWnGPuI8=;
 b=PDh1PJtPmZJDWmqUkF7u+dhQa00/HsMGjMPbSdWnCp8EJdJlPiVlKrvl
 WXM4NnqaYkY1ypQiHMOtjh8KhyF+5mp3ym7k1Znq+JaeZLeBOWeNwPt5n
 uHI8LbRIxVYSSu8leTYYhbFGoWFldpsDOnUH76i3eAlCohkVyiiFj/Tv7
 I2y+I6c4zVujcV4kzI6FUstu0WMgZ+r5SRunOCEVJ/kooUqoMrel6GpwJ
 /Zt9sln5C14qriiVLmWXHvmk2SkE1IJd5VlQtCzuUKAL1RpsuA3+8Wpv5
 GOh7LbaSh+t6Vj0CaR227gEoVeP5XN+mGiT1DmAOjKZ9wI/u4VA/H7rzf w==;
X-CSE-ConnectionGUID: mYoJ8qDzQcS+PQYSy5kvDw==
X-CSE-MsgGUID: z8bK9DeZRCChSeR6DwpErQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6737215"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6737215"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 08:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="17328787"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 08:56:34 -0700
Date: Thu, 28 Mar 2024 16:56:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 Introduce Mega feature to Xe and i915 tests
Message-ID: <20240328155631.sgqapbjpi5vzhsx2@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240327122731.2104614-1-katarzyna.piecielska@intel.com>
 <171159510400.1060939.5454047124083312832@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171159510400.1060939.5454047124083312832@8e613ede5ea5>
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
On 2024-03-28 at 03:05:04 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Introduce Mega feature to Xe and i915 tests
> URL   : https://patchwork.freedesktop.org/series/131689/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14491_full -> IGTPW_10930_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10930_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10930_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10930/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10930_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane@pixel-format@pipe-a:
>     - shard-mtlp:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14491/shard-mtlp-5/igt@kms_plane@pixel-format@pipe-a.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10930/shard-mtlp-4/igt@kms_plane@pixel-format@pipe-a.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b-hdmi-a-1:
>     - shard-dg2:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14491/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b-hdmi-a-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10930/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b-hdmi-a-1.html
> 

This is unrelated to change in test descriptions (added mega feature).

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10930_full that come from known issues:
> 
> ### IGT changes ###
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7786 -> IGTPW_10930
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14491: 426c7cf8b01f87def935a357bfd76712c4f03016 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10930: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10930/index.html
>   IGT_7786: 1e4a3cd0a4bb3419fb70ed3e01259485b056dcfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10930/index.html
