Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9326C54E64
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 12:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C11210F59D;
	Thu, 28 Mar 2024 12:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gDszwRSS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2442610F59D;
 Thu, 28 Mar 2024 12:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711630234; x=1743166234;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v+gFigt1wEZNcbi5DoGAZsIlAcTL/2s9UYATUT1/YTg=;
 b=gDszwRSScSRKMqAuwqSv1VTnRbuKm0aLefGEgapoo0g+/FpSLKoeOqbf
 CMh2RNt8udEUHjbehYFqUu8hwb5mW6nW2eQg1nra9ZHVrjTrMi9hQcWOV
 noNYIboqiLJICTTsAL1148WT0PklDsYt7EdEkq9Buh3JX4E0YSSl/PRlf
 O0wGhraF8RV92fW1MHWXWaIk0P4swQNZwgOUtzXMF0VyugFn8+oZQ4u4S
 WOtMhss01acdD6+eCSb3ZPP8ASnFySs4mFd9DRJ2Rslzlhfwx/5NGvOxY
 BYOEsV44LRPFQbBZqHQgzFqIlFEImanPe6OZEk8BfqxrAcRciq5KBTn7h A==;
X-CSE-ConnectionGUID: NDuy1QnQRrWP6KCVyCPR9A==
X-CSE-MsgGUID: FYnAbAC3SeuMOy09zWUhTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6891689"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6891689"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 05:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="16628888"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 05:50:31 -0700
Date: Thu, 28 Mar 2024 13:50:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for Align
 Xe test documentation to recent i915 changes (rev2)
Message-ID: <20240328125015.ynbcvtl3zxq3n4ba@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
 <171159552492.1060939.1106694945252250710@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171159552492.1060939.1106694945252250710@8e613ede5ea5>
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
On 2024-03-28 at 03:12:04 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Align Xe test documentation to recent i915 changes (rev2)
> URL   : https://patchwork.freedesktop.org/series/131492/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14483_full -> IGTPW_10914_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10914_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10914_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10914_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@evict:
>     - shard-dg1:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/shard-dg1-15/igt@i915_selftest@live@evict.html
> 
>   * igt@i915_selftest@perf@request:
>     - shard-dg2:          [PASS][2] -> [ABORT][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14483/shard-dg2-6/igt@i915_selftest@perf@request.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/shard-dg2-3/igt@i915_selftest@perf@request.html
> 

This is unrelated to changes in documentation, no need for respin
(already merged).

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10914_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#8411]) +1 other test skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/shard-dg1-15/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-mtlp:         NOTRUN -> [SKIP][5] ([i915#8411])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/shard-mtlp-5/igt@api_intel_bb@blit-reloc-purge-cache.html
> 

...cut...

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7782 -> IGTPW_10914
> 
>   CI-20190529: 20190529
>   CI_DRM_14483: d652ec2b081fc8e252cc86ee84f72a3b78ee9732 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10914: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/index.html
>   IGT_7782: a404f73182948e843640d00cc279883391cf6ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/index.html
