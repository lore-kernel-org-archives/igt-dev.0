Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93376C3600C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 11:22:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E31910E66F;
	Tue,  8 Apr 2025 11:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBVB1CnA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887F110E66F;
 Tue,  8 Apr 2025 11:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744111346; x=1775647346;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4GODSBRTJifGXW6IfVxxhmklg1CEl+0+/1IzyL/YRqk=;
 b=hBVB1CnAiuqhdzkN7n3LhzWyCr4GG5wPgslgayFIxNBFoC1d1jxovopS
 UrhAuXDm3+7qKRCuboXQejtVA9k3yPJvMn9rF6yyibpX0u/NWOcFuK3HP
 eqlsCgOHSvgG5Rkc99q8zKao53cKj4WKwqCs3Dv1wcMMPrpi1Cy5U2em1
 k3PlbTMO1LxGPl2yTbHwnvmZy9vO4+0rYLkIyYr3yuewhKphPGPkHtybm
 K8cyY1pf8Az8Aw7suCfI223qeHu6XJJ4HHFxRsnB9LssYvuv6lMkYaU2a
 /m/iQL1OU1Yr9rIEK3u3IAQPL9A3FF3ya4blTKiODYuSQJ6VfMkIOLkG5 A==;
X-CSE-ConnectionGUID: pwhKAufxQC+zDPIB07aBXQ==
X-CSE-MsgGUID: F+Dfh2AGRDqPRMt8NjjEcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="68010918"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="68010918"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 04:22:26 -0700
X-CSE-ConnectionGUID: Q0PNe4I0SYaj2pbA4R9SWw==
X-CSE-MsgGUID: HUK4HIkMRneXYIT9YptA5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="128233569"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:22:24 -0700
Date: Tue, 8 Apr 2025 13:22:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Stress copy engines during render (rev7)
Message-ID: <20250408112213.zpygzu6n4jzspck3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250402115055.156765-1-francois.dugast@intel.com>
 <174398561363.41500.18295929326445119385@e6b6f09ec485>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174398561363.41500.18295929326445119385@e6b6f09ec485>
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
On 2025-04-07 at 00:26:53 -0000, Patchwork wrote:

Most of this is unrelated except one, see below.

> == Series Details ==
> 
> Series: Stress copy engines during render (rev7)
> URL   : https://patchwork.freedesktop.org/series/145831/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8301_FULL -> XEIGTPW_12906_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12906_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12906_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12906_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-b-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-dg2-432/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-b-dp-2.html
> 
>   * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
>     - shard-dg2-set2:     [PASS][2] -> ([SKIP][3], [PASS][4]) +5 other tests ( 1 pass, 1 skip )
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-dg2-464/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-dg2-464/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [PASS][5] -> [SKIP][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>     - shard-bmg:          [PASS][7] -> ([PASS][8], [INCOMPLETE][9]) +1 other test ( 1 incomplete, 1 pass )
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [FAIL][10]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_universal_plane@universal-plane-functional:
>     - shard-lnl:          [PASS][11] -> ([PASS][12], [ABORT][13]) +1 other test ( 1 abort, 1 pass )
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-7/igt@kms_universal_plane@universal-plane-functional.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-lnl-4/igt@kms_universal_plane@universal-plane-functional.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-lnl-6/igt@kms_universal_plane@universal-plane-functional.html
> 
>   * igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1:
>     - shard-lnl:          [PASS][14] -> ([PASS][15], [DMESG-WARN][16])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-7/igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-lnl-4/igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-lnl-6/igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1.html
> 
>   * igt@kms_universal_plane@universal-plane-functional@pipe-c-edp-1:
>     - shard-lnl:          [PASS][17] -> ([PASS][18], [DMESG-FAIL][19])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-7/igt@kms_universal_plane@universal-plane-functional@pipe-c-edp-1.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-lnl-4/igt@kms_universal_plane@universal-plane-functional@pipe-c-edp-1.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-lnl-6/igt@kms_universal_plane@universal-plane-functional@pipe-c-edp-1.html
> 
>   * igt@xe_exec_basic@many-execqueues-null-defer-mmap:
>     - shard-lnl:          [PASS][20] -> ([INCOMPLETE][21], [PASS][22])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-lnl-2/igt@xe_exec_basic@many-execqueues-null-defer-mmap.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-lnl-3/igt@xe_exec_basic@many-execqueues-null-defer-mmap.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-lnl-2/igt@xe_exec_basic@many-execqueues-null-defer-mmap.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-dg2-set2:     [PASS][23] -> ([INCOMPLETE][24], [PASS][25]) +1 other test ( 1 incomplete, 1 pass )
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-432/igt@xe_pm@s4-basic-exec.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-dg2-466/igt@xe_pm@s4-basic-exec.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-dg2-466/igt@xe_pm@s4-basic-exec.html

All of above is unrelated, below one should be skip:

> 
>   * {igt@xe_spin_batch@spin-mem-copy} (NEW):
>     - shard-dg2-set2:     NOTRUN -> [FAIL][26] +1 other test fail
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-dg2-435/igt@xe_spin_batch@spin-mem-copy.html
> 

After a talk with Zbigniew it seems that this test should have:

igt_require(blt_has_mem_copy(fd));

and make a skip on DG2. Please make fix and resend this series.
As this is a new test it should not be filed as bug.

>   
> #### Warnings ####
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][27] ([Intel XE#367]) -> [SKIP][28]
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][29] ([Intel XE#1489]) -> [SKIP][30]
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> 

These two above are also unrelated.

Regards,
Kamil


>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8301_FULL and XEIGTPW_12906_FULL:
> 
> ### New IGT tests (5) ###
> 
>   * igt@xe_render_copy@render-stress-0-copies:
>     - Statuses : 3 pass(s)
>     - Exec time: [3.22, 3.23] s
> 
>   * igt@xe_render_copy@render-stress-1-copies:
>     - Statuses : 1 fail(s) 2 pass(s)
>     - Exec time: [3.23, 3.24] s
> 
>   * igt@xe_render_copy@render-stress-2-copies:
>     - Statuses : 2 pass(s)
>     - Exec time: [3.23] s
> 
>   * igt@xe_render_copy@render-stress-4-copies:
>     - Statuses : 2 pass(s)
>     - Exec time: [3.25, 3.26] s
> 
>   * igt@xe_spin_batch@spin-mem-copy:
>     - Statuses : 1 fail(s) 2 pass(s)
>     - Exec time: [0.11, 5.96] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12906_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_3d:
>     - shard-dg2-set2:     [PASS][31] -> ([PASS][32], [SKIP][33]) ([Intel XE#540])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8301/shard-dg2-463/igt@kms_3d.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-dg2-463/igt@kms_3d.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/shard-dg2-464/igt@kms_3d.html
> 

...cut...

>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8301 -> IGTPW_12906
>   * Linux: xe-2897-883e4daea46ff15b470f138ee61573513243210d -> xe-2898-6deef7a0418bc26082804287b18c8db1e0810686
> 
>   IGTPW_12906: 75719507aec085505d60e4ef1d9deeb65f57484e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8301: 8301
>   xe-2897-883e4daea46ff15b470f138ee61573513243210d: 883e4daea46ff15b470f138ee61573513243210d
>   xe-2898-6deef7a0418bc26082804287b18c8db1e0810686: 6deef7a0418bc26082804287b18c8db1e0810686
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12906/index.html
