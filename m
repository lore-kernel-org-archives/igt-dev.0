Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB50C71157
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 10:58:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740CA10E144;
	Tue, 17 Jun 2025 10:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="At//JRTd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E3510E144;
 Tue, 17 Jun 2025 10:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750157913; x=1781693913;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UVozgMCUMvhwLliqUrJOJt8gt865PceT25LsjKfLjy4=;
 b=At//JRTd8e2de7lk1NOQ7YyFcsuSZEGOhnafJvnH1eJf1tq2lZe4lo4d
 QTPNDiwDE4qFzaTGqX/pT4GvxRPn2Jf/fE1Dc6P0HutvR1zlExB0nGRvm
 t9WniXMMKqjLH/N6mxfn+TE02k7Q8d0fNeX8yfhTqJllN+Kt6gMOQeXT3
 6dJA7SfiIcVvDfpeQYCt2H2564McVGUyQ8EfGTyBR7dP8ZokPaYX025Gf
 IUU7UweJrfeMZQoHDb/dNonodtJRXj7/QzVfcmEXRRpMRGxNh9VbdHQOW
 ZantE2+4FKSGmFH39lsPCMeZO4KqOR+sphsoaibcI/VLJDlyUAS7wW4v7 g==;
X-CSE-ConnectionGUID: JkpL5hdKRmeMNPUP39iLtA==
X-CSE-MsgGUID: ebGu9+TeQkK1GI6rWlBjVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="54943627"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="54943627"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 03:58:32 -0700
X-CSE-ConnectionGUID: BD+pd9HrQD6kEoJcL8k3qg==
X-CSE-MsgGUID: 9o5Hi/aPTEmVWNRocbt4pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="153941668"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 03:58:31 -0700
Date: Tue, 17 Jun 2025 12:58:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 runner/executor: Abort if dmesg is flooded
Message-ID: <20250617105829.ywjcafwmk2euw2i7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250613162013.103165-1-kamil.konieczny@linux.intel.com>
 <174999391697.80309.9723666748976748600@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174999391697.80309.9723666748976748600@1538d3639d33>
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
On 2025-06-15 at 13:25:16 -0000, Patchwork wrote:

please do not file a bug for ABORT with 'Dmesg ratio exceeded'

This is new experimental feature in igt_runner.

Regards,
Kamil

> == Series Details ==
> 
> Series: runner/executor: Abort if dmesg is flooded
> URL   : https://patchwork.freedesktop.org/series/150246/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8411_FULL -> XEIGTPW_13295_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13295_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13295_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13295_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@test-cursor-atomic@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13295/shard-lnl-2/igt@kms_async_flips@test-cursor-atomic@pipe-b-edp-1.html
> 
>   * igt@xe_drm_fdinfo@parallel-utilization-single-idle:
>     - shard-dg2-set2:     [PASS][2] -> [ABORT][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8411/shard-dg2-435/igt@xe_drm_fdinfo@parallel-utilization-single-idle.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13295/shard-dg2-436/igt@xe_drm_fdinfo@parallel-utilization-single-idle.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap:
>     - shard-lnl:          NOTRUN -> [ABORT][4] +1 other test abort
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13295/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap.html
> 
>   * igt@xe_exec_system_allocator@twice-large-new-bo-map-nomemset:
>     - shard-lnl:          [PASS][5] -> [ABORT][6] +16 other tests abort
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8411/shard-lnl-2/igt@xe_exec_system_allocator@twice-large-new-bo-map-nomemset.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13295/shard-lnl-8/igt@xe_exec_system_allocator@twice-large-new-bo-map-nomemset.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][7] ([Intel XE#1124]) -> [ABORT][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8411/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13295/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
>     - shard-dg2-set2:     [SKIP][9] ([Intel XE#455] / [Intel XE#787]) -> [ABORT][10] +1 other test abort
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8411/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13295/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
>     - shard-lnl:          [SKIP][11] ([Intel XE#2893]) -> [ABORT][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8411/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13295/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@xe_exec_system_allocator@many-execqueues-mmap-free-nomemset:
>     - shard-dg2-set2:     [SKIP][13] ([Intel XE#4915]) -> [ABORT][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8411/shard-dg2-435/igt@xe_exec_system_allocator@many-execqueues-mmap-free-nomemset.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13295/shard-dg2-435/igt@xe_exec_system_allocator@many-execqueues-mmap-free-nomemset.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
>     - shard-dg2-set2:     [SKIP][15] ([Intel XE#4733]) -> [ABORT][16]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8411/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13295/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13295_FULL that come from known issues:
> 

...cut...

