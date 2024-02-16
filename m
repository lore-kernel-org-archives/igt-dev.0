Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D666C48260
	for <igt-dev@archiver.kernel.org>; Fri, 16 Feb 2024 11:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CCD10EAEB;
	Fri, 16 Feb 2024 11:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QogXw8WN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E5D10EAEB
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Feb 2024 11:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708081994; x=1739617994;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Qig+ElkPxVtW6z+mRyU03zCggd/jqPsZiSeEa4lW9VY=;
 b=QogXw8WNnZ9KFvFR4BOrR27E6MYlMVL0zX5KCvh9RFc9Db8OIggRmEnA
 2F94+QsBtdTmx5Ay/yUIGUuedKq6Bfg1DxM4//gZBXeMD80SwQkqf0cQF
 jA6qY5KNWnnnqGgWtXbLMGOE3UnmpZjQukxR2nmQUJfvOUtT5xPQvTc2l
 2dkm+zOdfIyZlnU99ESuDOjdzRWShD1rel9WrQg977n/gSlmA9uKwn0dE
 lXAPTvNrFKrouNj5lSPU7cPvGQwwbxBHS5u5uM2v4Wz53bo6ww1FQqinb
 wTxPK+3FUobRe/ZJvtowYFe+nw8Q3dFbmOhNtvAWFjacpeWlVcXy1+dUP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2356480"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2356480"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 03:13:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="3833443"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 03:13:13 -0800
Date: Fri, 16 Feb 2024 12:12:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_series_start?=
 =?utf-8?Q?ing_with_=5Bi-g-t=2Cv2=2C1=2F8?= =?utf-8?Q?=5D?=
 tests/prime_nv_test: switch over to intel_buf_init()
Message-ID: <20240216111251.75zzov7uhios5t6h@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
References: <20240213100125.90085-1-matthew.auld@intel.com>
 <170783051528.1202360.8431467977308812270@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170783051528.1202360.8431467977308812270@5338d5abeb45>
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
On 2024-02-13 at 13:21:55 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,v2,1/8] tests/prime_nv_test: switch over to intel_buf_init()
> URL   : https://patchwork.freedesktop.org/series/129826/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14260_full -> IGTPW_10665_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10665_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10665_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10665/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10665_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1:
>     - shard-snb:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14260/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10665/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1.html
> 

This is unrelated.

>   
> #### Warnings ####
> 
>   * igt@api_intel_bb@render-ccs:
>     - shard-dg2:          [FAIL][3] ([i915#6122]) -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14260/shard-dg2-6/igt@api_intel_bb@render-ccs.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10665/shard-dg2-2/igt@api_intel_bb@render-ccs.html
> 

AFAIK this is bug on DG2 with render-ccs,
unrelated to current patchseries.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_14260_full and IGTPW_10665_full:
> 
> ### New IGT tests (3) ###
> 

...cut...

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7710 -> IGTPW_10665
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14260: d395a4fdb0e78537f06bb401a9501b8467c774a3 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10665: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10665/index.html
>   IGT_7710: d87a5d85a60fba1283821d5212c3aece64cb36ba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10665/index.html
