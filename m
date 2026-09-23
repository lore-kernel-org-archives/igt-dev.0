Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B206C982FA
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 12:13:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061A810EDBE;
	Wed, 23 Sep 2026 12:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SVrqyyvd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C76310EB46;
 Wed, 23 Sep 2026 12:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790165544; x=1821701544;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HcQDcrapN/xmnmYu2y2cP8w3KLT3VIwYJI6xNKnERuk=;
 b=SVrqyyvdajRkGaoj75frIzQi9hvh6QJ0apFED3ydLz/hfWC4SGNjfYZl
 tnYcIjpk19a6y7nQ+3iAQ9cPBDI95AlTN7GzOHRsrzocnGUI7kml+50C7
 FisOEYYve5DzBAdQKgfbIA8BUZdbOV6vDBApKHNNwktZo+aLJ+AGYSiuS
 VRv1kRd7eIBdNudm6KYgXc1LJbFm66NOuvwHtLZ/14mvupJiCBJANEQZs
 7Xjs/Uq9wL7aC6V6sEhXmQXuvVJYfSZ6hxqfbe/5zPiKgZKXYhTlitXeA
 CEpR+SXNRmlTgFLkD1eMFH29kOAs6mBT7UQUYmEqWNFMlvBXklMXf7H1D w==;
X-CSE-ConnectionGUID: tfUR0MAZSB6MT1o7JOsb1Q==
X-CSE-MsgGUID: CfEmgYniR2m3D+FL7Vwh+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="102209500"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="102209500"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 05:12:24 -0700
X-CSE-ConnectionGUID: 01fRIKl9SliXmW7S2SsRHw==
X-CSE-MsgGUID: RoiWEQXiSi2ri6So0ODe5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="273765445"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 05:12:23 -0700
Date: Wed, 23 Sep 2026 14:12:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 intel-ci: Add multigpu svm to CRI Core blocklist
Message-ID: <20260923121221.64kuelb4hdv7fhlr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260921115610.933754-1-venkateswara.rao.muppidi@intel.com>
 <179003303749.188435.16779061515619002898@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179003303749.188435.16779061515619002898@61270ab9df2a>
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
On 2026-09-21 at 23:23:57 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci: Add multigpu svm to CRI Core blocklist
> URL   : https://patchwork.freedesktop.org/series/174617/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_9104_full -> IGTPW_15870_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15870_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15870_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15870/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15870_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic@plane-primary-legacy:
>     - shard-snb:          NOTRUN -> [FAIL][1] +5 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15870/shard-snb6/igt@kms_atomic@plane-primary-legacy.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-glk:          NOTRUN -> [FAIL][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15870/shard-glk4/igt@perf_pmu@module-unload.html
>     - shard-tglu:         NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15870/shard-tglu-7/igt@perf_pmu@module-unload.html
> 
>   * igt@perf_pmu@semaphore-busy@vcs1:
>     - shard-tglu:         [PASS][4] -> [FAIL][5] +4 other tests fail
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9104/shard-tglu-10/igt@perf_pmu@semaphore-busy@vcs1.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15870/shard-tglu-8/igt@perf_pmu@semaphore-busy@vcs1.html
> 

Unrelated to Xe blocklist.



Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15870_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#8411])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15870/shard-dg2-3/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#8411])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15870/shard-rkl-2/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#8411]) +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15870/shard-dg1-17/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
...cut...
