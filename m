Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C87C3601E
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 09:07:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC4210EB9A;
	Fri,  4 Apr 2025 09:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGIV3u70";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7BA10EB90;
 Fri,  4 Apr 2025 09:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743757644; x=1775293644;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8zo9d+qOIvfX6NvL7AvZlUdAKscHVQAmnszoiYl6AzM=;
 b=fGIV3u70HCCejlEWYY0qs0yP1PnS3SRVrJSGVJgYp2AavnPP+N66obI2
 iGkO3cX+hYf0h/AqYI2W67XZwA5A5p0oLOxn2zw5zYk0/F9dz64WCIUBX
 uiM24gzEsDE5wnEGg9e9X4B3YxcN0LPXZj6Llooc4NegO0vWSXa+oOE/z
 jQkf+6nT4dbJkFyAQSo9gyMYm186ibn0Msr2zxpImx/LpUqNVcLssQ/1B
 xLYpniKugFDleMntK44xNMo1Z+jKbYWeILLgPclBE2QNzL2Wd8RCKmGoq
 hRioqrLa1dIk//rYBd6eajwWtHtDBdyb5Ss76c5+eIn97d4BFPiSrlZd0 g==;
X-CSE-ConnectionGUID: L4eWXdAkReGWwW9cH7KlgQ==
X-CSE-MsgGUID: AJ/BgADbRjW/qWIh3wLfCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="70564555"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="70564555"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 02:07:24 -0700
X-CSE-ConnectionGUID: Hcbz9pU+Sl6ovgpsO0yNww==
X-CSE-MsgGUID: Ft7whEY7S7en6jvvuvzmWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="127201074"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 02:07:24 -0700
Date: Fri, 4 Apr 2025 11:07:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib=2Fint?=
 =?utf-8?Q?el=5Fallocator?= =?utf-8?Q?=3A?= protect binding for multithreaded
 tests (rev2)
Message-ID: <20250404090720.752xd6udd7roqskh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250403083438.132035-1-zbigniew.kempczynski@intel.com>
 <174372948907.37018.18057580607674671651@e6b6f09ec485>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174372948907.37018.18057580607674671651@e6b6f09ec485>
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
On 2025-04-04 at 01:18:09 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/intel_allocator: protect binding for multithreaded tests (rev2)
> URL   : https://patchwork.freedesktop.org/series/147185/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16370_full -> IGTPW_12920_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12920_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12920_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12920/index.html
> 
> Participating hosts (10 -> 11)
> ------------------------------
> 
>   Additional (1): shard-snb-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12920_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_workarounds@suspend-resume-context:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12920/shard-glk2/igt@gem_workarounds@suspend-resume-context.html
> 
>   * igt@i915_pm_rpm@system-suspend:
>     - shard-rkl:          [PASS][2] -> [INCOMPLETE][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16370/shard-rkl-3/igt@i915_pm_rpm@system-suspend.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12920/shard-rkl-3/igt@i915_pm_rpm@system-suspend.html
> 

Unrelated, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12920_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg2-9:        NOTRUN -> [SKIP][4] ([i915#8411])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12920/shard-dg2-9/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
...cut...
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8304 -> IGTPW_12920
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_16370: bc18da45d48d337b92a7ff9546ba61da32b3b586 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12920: 276d57396d52a4c8f9e50fbae4bce93cec9ea1f6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8304: 8304
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12920/index.html
