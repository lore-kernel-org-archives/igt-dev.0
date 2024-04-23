Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB08C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 19:56:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA289113642;
	Tue, 23 Apr 2024 19:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mcUQz+qy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179F3113642;
 Tue, 23 Apr 2024 19:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713902173; x=1745438173;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4dC8cLv8S13JQpAVghbCkG6Pc02Q+V0D328UE8LUtDc=;
 b=mcUQz+qyz/GugT6ivSRVy/w6cWnbu3QFvg0jlr92Y/nDbO4zqdCkU67n
 ChtxL3NF2NAEAZCznzG82mnnWI9oBPhWpQUiREkqBrcpG7mD8Y4mZvLPa
 b9I2lLxXyxMCRbUnpFFfttKSpJ6htz2DKW/TnzJpumbtE7I6tcRuuiQ8y
 11ti9p3Nq/6w+z7Fhqu1z7oKTVwS38f5aioL+38pDE1CVbxflq8i4q3qE
 CjefqXITtKLmE18OoBnov8HeKjiPDFftZaSXhS1zKAmmLpuMs2OkeBUl1
 YGPRxDd23jQK22ZDz+C1+PcjUAfqWfILVLeT3azqrZ+/jfUFzHylpZ7oo w==;
X-CSE-ConnectionGUID: avrRqY5nSXaqoHbLy4rFPg==
X-CSE-MsgGUID: XL6535gQSLWp30wWzjtEoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20120761"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20120761"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 12:56:12 -0700
X-CSE-ConnectionGUID: jYVHH7ZiQGGPomNGiXo95A==
X-CSE-MsgGUID: t3a3gwmsTU6SaRwdVSs7wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24446690"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 12:56:11 -0700
Date: Tue, 23 Apr 2024 21:56:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arthur Grillo <arthurgrillo@riseup.net>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 benchmarks/kms_fb_stress: benchmark formats (rev2)
Message-ID: <20240423195608.46rw23qbf4dpl62u@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 I915-ci-infra@lists.freedesktop.org
References: <20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net>
 <171386922461.1607645.5830649155286968875@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171386922461.1607645.5830649155286968875@8e613ede5ea5>
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
On 2024-04-23 at 10:47:04 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: benchmarks/kms_fb_stress: benchmark formats (rev2)
> URL   : https://patchwork.freedesktop.org/series/132328/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14630_full -> IGTPW_11052_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11052_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11052_full, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11052/index.html
> 
> Participating hosts (9 -> 10)
> ------------------------------
> 
>   Additional (1): shard-snb-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11052_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@drm_fdinfo@context-close-stress:
>     - shard-dg1:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14630/shard-dg1-15/igt@drm_fdinfo@context-close-stress.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11052/shard-dg1-13/igt@drm_fdinfo@context-close-stress.html
> 
>   * igt@kms_vblank@query-idle-hang@pipe-d-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11052/shard-dg1-15/igt@kms_vblank@query-idle-hang@pipe-d-hdmi-a-4.html
>

Unrelated to change in benchmark, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11052_full that come from known issues:
> 
> ### IGT changes ###
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7815 -> IGTPW_11052
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14630: d3410a305a38ffffd42343c3beba610f2ceca377 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11052: 11052
>   IGT_7815: d5d516bfdf77898e934b4c7ed947a43711cfb226 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11052/index.html
