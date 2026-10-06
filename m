Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDFBCA5FED
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 08:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B7810E013;
	Tue,  6 Oct 2026 08:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VDqyLXcI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0C810E07A
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 08:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791276395; x=1822812395;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=q3lQaGhzG1fpOp5SpCrK9y9mlrHHisrWkbd9bFYevgk=;
 b=VDqyLXcIoOOsSE0lQ1hWdDULEw0r/LEqqmBtOsLS3y4CKZfI7fy0Csod
 mDcA6Rmgdd8tfB/q/6Jncc2hSz5qTEtNeCaik7od2JKXy/piGv//j8ito
 jTYd/Cuc56NoJPvKpeNBbN0uPLwVDQDL1M5PZuf2CEZhlmlwdUX2gtnsv
 7naliO5X3LlgZKeYIllQO0HT4xD1XpkZsL+64SJ+WgjXil3ypMubWSYQB
 4oGkx4hlHlvy2S4Z/tRpPewXag3GuBBvVSZeEKj2wPIiWE8ycBqJM2Di8
 W6VVq8iOtz5p7LE+gIjN6X5fXNqGKYZQf+xTmOdTc+wJZAFjgJba+eQoN Q==;
X-CSE-ConnectionGUID: 6Lum42a6QQKMfHxcZJUMSQ==
X-CSE-MsgGUID: HRKZEOmMS7+vTyff54C5zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102536578"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="102536578"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 01:46:34 -0700
X-CSE-ConnectionGUID: jiakNBT9S1i1142vvOoMRw==
X-CSE-MsgGUID: nypxn2lLSqS+i/3FrYm33w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="275747078"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 01:46:33 -0700
Date: Tue, 6 Oct 2026 10:46:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/xe_pmu: Do not enable VFs in unrelated subtests
Message-ID: <20261006084631.62qrxcqiq6x3wbon@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Gustavo Sousa <gustavo.sousa@intel.com>
References: <20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v1-1-ccf95739aacc@intel.com>
 <179126587034.242742.2097871639053806414@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179126587034.242742.2097871639053806414@61270ab9df2a>
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
On 2026-10-06 at 05:51:10 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/xe_pmu: Do not enable VFs in unrelated subtests
> URL   : https://patchwork.freedesktop.org/series/175577/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_19284_full -> IGTPW_15942_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15942_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15942_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15942/index.html
> 
> Participating hosts (11 -> 10)
> ------------------------------
> 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15942_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
>     - shard-tglu:         NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15942/shard-tglu-8/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
>     - shard-dg1:          NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15942/shard-dg1-16/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html
> 
>   * igt@perf_pmu@semaphore-busy@bcs0:
>     - shard-glk:          NOTRUN -> [FAIL][3] +4 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15942/shard-glk1/igt@perf_pmu@semaphore-busy@bcs0.html
> 

Unrelated, this is xe test change.



Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15942_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][4] ([i915#8411])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15942/shard-dg2-4/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-rkl:          NOTRUN -> [SKIP][5] ([i915#8411]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15942/shard-rkl-5/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-mtlp:         NOTRUN -> [SKIP][6] ([i915#8411])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15942/shard-mtlp-6/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
...cut...
