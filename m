Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D698BC54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 13:23:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317D410E0D0;
	Thu, 21 Mar 2024 13:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i5MZTetR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5F210E0D0;
 Thu, 21 Mar 2024 13:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711027399; x=1742563399;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZJDFJFXroQxdU6av8v+nVYA73Qjid3WHUBBkJoqTzgM=;
 b=i5MZTetRWriAReETRIq41aSYz/JOVbCPjYnEFiWMeFQgovdtDByZpaeR
 RP2n52wX3spABazFWzbHkjhZmrLQodJiQItt/9oqVBoXLsQT4KCN5NnWI
 KifYSHV7eIuEOCUDYXm2LScaz12wWjKWP03AnCsSLYtieXbeUAqfWvrAk
 hC7XUDPjm0lDuVCVwm6Zf6oUWLVWmh40ZxvMpmR8GqEpp0vZLqIXRy0c7
 2t544gzLZSL/QFWp/m58w3b/onBScSj3wzpAOs5lIN0L4gTGbhhyoBWeV
 Y4XIhCq0pUsKb7Lxs23uJyfCXIZUtdSVEZR4sBRhBFa6coJxcMTInl+WO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6621091"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="6621091"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 06:23:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="37616688"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 06:23:17 -0700
Date: Thu, 21 Mar 2024 14:23:14 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMveGVf?=
 =?utf-8?Q?exec=5Fthreads=3A?= Fill in GT field for second balancer thread
Message-ID: <20240321132314.dk6gkcggtpnijlwl@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240320192356.359327-1-matthew.d.roper@intel.com>
 <171101244539.939689.9495282268259536683@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171101244539.939689.9495282268259536683@8e613ede5ea5>
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
On 2024-03-21 at 09:14:05 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/xe_exec_threads: Fill in GT field for second balancer thread
> URL   : https://patchwork.freedesktop.org/series/131382/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14458_full -> IGTPW_10867_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10867_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10867_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10867/index.html
> 
> Participating hosts (9 -> 10)
> ------------------------------
> 
>   Additional (1): shard-snb-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10867_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_store@dword@vcs0:
>     - shard-mtlp:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14458/shard-mtlp-5/igt@gem_exec_store@dword@vcs0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10867/shard-mtlp-8/igt@gem_exec_store@dword@vcs0.html
> 
>   * igt@kms_flip@plain-flip-ts-check@b-hdmi-a4:
>     - shard-dg1:          NOTRUN -> [FAIL][3] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10867/shard-dg1-17/igt@kms_flip@plain-flip-ts-check@b-hdmi-a4.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_eio@kms:
>     - shard-dg1:          [FAIL][4] ([i915#5784]) -> [INCOMPLETE][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14458/shard-dg1-13/igt@gem_eio@kms.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10867/shard-dg1-17/igt@gem_eio@kms.html
> 

These are unrelated to change in Xe test, no need for respin
as this is already merged.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10867_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#7701])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10867/shard-dg1-15/igt@device_reset@cold-reset-bound.html

...cut...

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7771 -> IGTPW_10867
> 
>   CI-20190529: 20190529
>   CI_DRM_14458: 1cbe0387180a61b6abb4f5a6261763adaecbf51b @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10867: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10867/index.html
>   IGT_7771: 7771
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10867/index.html
