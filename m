Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A6BC54E5D
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 11:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E0110E8D2;
	Mon, 18 Mar 2024 11:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjUxBLZN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD6410E8D2;
 Mon, 18 Mar 2024 11:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710761104; x=1742297104;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=k/u/JaSPRHB7GK194b3yCxfeA8mgbAV4aypKPbHbkTM=;
 b=fjUxBLZNC/362O5gwXjuBlAENvq7ddeOJ0aCdgXr2w/ZUB94GLOeV7es
 nrVttk9cP+UXB5GvRiRb4RvU59mcjTvbgtlYe3l31S7h+bYq1YWAgWT3u
 2yufLUqBPYYFhqNjWVA9mZ/wmJ+fPPXg6/M3wWGt0JCHMCtpgaaAK7GVI
 uSeRMmH9L/StqMFNEriwzE8W+0Wv+PAJUdD0IDWUCNiiXMVjQxEXiJMHc
 2yQIKXnjyaMTFvK4hS7XSgPS+Izv+lFjyoUv4b5U4zHYHPs4mLt0YBCcr
 lWKayzHJ25v2wCXZ73vylsvdesW46RYkaVOw+X8KtcVHJgJIl3PpjlTti w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5773288"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5773288"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 04:25:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="18124654"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 04:25:02 -0700
Date: Mon, 18 Mar 2024 12:24:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 more musl libc fixes for PATH_MAX
Message-ID: <20240318112437.w2q73npftv73j77a@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org,
 lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240315131901.28144-1-kamil.konieczny@linux.intel.com>
 <171061117920.834346.77920857067237699@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171061117920.834346.77920857067237699@8e613ede5ea5>
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
On 2024-03-16 at 17:46:19 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: more musl libc fixes for PATH_MAX
> URL   : https://patchwork.freedesktop.org/series/131186/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14439_full -> IGTPW_10845_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10845_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10845_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10845/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10845_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a1:
>     - shard-rkl:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10845/shard-rkl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a1.html
> 
>   * igt@kms_vblank@accuracy-idle@pipe-a-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10845/shard-dg2-10/igt@kms_vblank@accuracy-idle@pipe-a-hdmi-a-1.html
> 
>   * igt@prime_busy@hang-wait@ccs3:
>     - shard-dg2:          [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14439/shard-dg2-10/igt@prime_busy@hang-wait@ccs3.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10845/shard-dg2-8/igt@prime_busy@hang-wait@ccs3.html
> 

These are unrelated,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10845_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#8411])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10845/shard-dg2-6/igt@api_intel_bb@object-reloc-purge-cache.html

...cut...

> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7768 -> IGTPW_10845
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14439: 475ba6bf5ef939a53adf5fc2b93c21713c1735fd @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10845: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10845/index.html
>   IGT_7768: 7768
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10845/index.html
