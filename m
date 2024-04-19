Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1929C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 14:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A05810E125;
	Fri, 19 Apr 2024 14:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mOrgKEnL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C300510E0C2;
 Fri, 19 Apr 2024 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713536716; x=1745072716;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X7Ca5YxGnd8Taiti+B3v+sr9+gckhM3zFyEnm/iDnF4=;
 b=mOrgKEnLeybhXMYMfPBhr5+eRJkbxiEOfs8U4lBXLSKvSsfl3DxsXujd
 qp4zCkgLeTya7nEG55ssXxGXkC5TueIkJPR8s5AkYb/FLKy1M+obA2gts
 sIvCyZ6hF31whtOIcEqmU1U0aFV2Kntl2V+znswM7MWLTJiEuwnw9s0k+
 3LedLDKxbgBKJuxgL0PtssI7lwDi+l7NfxTJxSRByK/LCzqVZfJyiOCpr
 s7dI1LZ/7ciYPU+3k9bsNaQWYATmjBfrKNSWWOt6J02zC6QksviYJAmqJ
 JnPIPbMhubiSkqMWiBDSuAaDmbyGhGlrButByoC4ZgO9l96zFTrPvQAuz A==;
X-CSE-ConnectionGUID: wDmmjLiTTuKX0y29VnQ1aQ==
X-CSE-MsgGUID: qQwfPITdQWCXU150WY3dWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9252916"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9252916"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:25:15 -0700
X-CSE-ConnectionGUID: iKZoA2xxRmajjAtaxUmjFg==
X-CSE-MsgGUID: hdt/y70LTjW5PkRAeXEduw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23370203"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 07:25:14 -0700
Date: Fri, 19 Apr 2024 16:25:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 i915/gem_mmap_offset: Partial mmap and munmap (rev2)
Message-ID: <20240419142511.xf4zid3omhhicyb4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240412004255.288046-1-andi.shyti@linux.intel.com>
 <171323945298.1424678.8597872125354871405@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171323945298.1424678.8597872125354871405@8e613ede5ea5>
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
On 2024-04-16 at 03:50:52 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: i915/gem_mmap_offset: Partial mmap and munmap (rev2)
> URL   : https://patchwork.freedesktop.org/series/132335/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7807 -> IGTPW_11018
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11018 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11018, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/index.html
> 
> Participating hosts (33 -> 37)
> ------------------------------
> 
>   Additional (7): fi-kbl-7567u bat-dg1-7 bat-kbl-2 bat-adlp-6 fi-glk-j4005 bat-dg2-11 bat-mtlp-6 
>   Missing    (3): bat-mtlp-8 bat-jsl-1 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11018:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gem:
>     - bat-arls-3:         [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/bat-arls-3/igt@i915_selftest@live@gem.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-arls-3/igt@i915_selftest@live@gem.html
> 

This is unrelated to tests, also Xe tests fails are unrelated to
changes for i915 test gem_mmap_offset.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11018 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-adlp-6:         NOTRUN -> [SKIP][3] ([i915#9318])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-adlp-6/igt@debugfs_test@basic-hwmon.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][4] ([i915#9318])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@fbdev@info:
>     - bat-kbl-2:          NOTRUN -> [SKIP][5] ([i915#1849])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-kbl-2/igt@fbdev@info.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][6] ([i915#1849] / [i915#2582])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@fbdev@info.html
> 
>   * igt@fbdev@write:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][7] ([i915#2582]) +3 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@fbdev@write.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-kbl-7567u:       NOTRUN -> [SKIP][8] ([i915#2190])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html
>     - fi-glk-j4005:       NOTRUN -> [SKIP][9] ([i915#2190])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@basic@lmem0:
>     - bat-dg2-9:          [PASS][10] -> [FAIL][11] ([i915#10378])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-kbl-2:          NOTRUN -> [SKIP][12] +39 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html
>     - fi-glk-j4005:       NOTRUN -> [SKIP][13] ([i915#4613]) +3 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html
>     - fi-kbl-7567u:       NOTRUN -> [SKIP][14] ([i915#4613]) +3 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - bat-adlp-6:         NOTRUN -> [SKIP][15] ([i915#4613]) +3 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-adlp-6/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][16] ([i915#4613]) +3 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@gem_mmap@basic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][17] ([i915#4083])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg2-11/igt@gem_mmap@basic.html
>     - bat-dg1-7:          NOTRUN -> [SKIP][18] ([i915#4083])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg1-7/igt@gem_mmap@basic.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][19] ([i915#4083])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@gem_mmap@basic.html
> 
>   * igt@gem_render_tiled_blits@basic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][20] ([i915#4079]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg2-11/igt@gem_render_tiled_blits@basic.html
> 
>   * igt@gem_tiled_blits@basic:
>     - bat-dg1-7:          NOTRUN -> [SKIP][21] ([i915#4077]) +2 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg1-7/igt@gem_tiled_blits@basic.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][22] ([i915#4077]) +2 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@gem_tiled_blits@basic.html
> 
>   * igt@gem_tiled_fence_blits@basic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][23] ([i915#4077]) +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-dg1-7:          NOTRUN -> [SKIP][24] ([i915#4079]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg1-7/igt@gem_tiled_pread_basic.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][25] ([i915#4079]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@gem_tiled_pread_basic.html
>     - bat-adlp-6:         NOTRUN -> [SKIP][26] ([i915#3282])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-adlp-6/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-adlp-6:         NOTRUN -> [SKIP][27] ([i915#6621])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-adlp-6/igt@i915_pm_rps@basic-api.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][28] ([i915#6621])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg2-11/igt@i915_pm_rps@basic-api.html
>     - bat-dg1-7:          NOTRUN -> [SKIP][29] ([i915#6621])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg1-7/igt@i915_pm_rps@basic-api.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][30] ([i915#6621])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live@memory_region:
>     - bat-arls-3:         [PASS][31] -> [DMESG-FAIL][32] ([i915#10262]) +15 other tests dmesg-fail
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/bat-arls-3/igt@i915_selftest@live@memory_region.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-arls-3/igt@i915_selftest@live@memory_region.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][33] ([i915#4212] / [i915#9792]) +8 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
>     - bat-dg2-11:         NOTRUN -> [SKIP][34] ([i915#4212]) +7 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][35] ([i915#5190] / [i915#9792])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][36] ([i915#5190])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - bat-dg1-7:          NOTRUN -> [SKIP][37] ([i915#4215])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][38] ([i915#4215] / [i915#5190])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
>     - bat-dg1-7:          NOTRUN -> [SKIP][39] ([i915#4212]) +7 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg1-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][40] ([i915#4103] / [i915#4213]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-dg1-7:          NOTRUN -> [SKIP][41] ([i915#4103] / [i915#4213]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>     - bat-adlp-6:         NOTRUN -> [SKIP][42] ([i915#4103]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][43] ([i915#9792]) +17 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - fi-kbl-7567u:       NOTRUN -> [SKIP][44] +11 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/fi-kbl-7567u/igt@kms_dsc@dsc-basic.html
>     - bat-adlp-6:         NOTRUN -> [SKIP][45] ([i915#3555] / [i915#3840])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-adlp-6/igt@kms_dsc@dsc-basic.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][46] ([i915#3555] / [i915#3840])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg2-11/igt@kms_dsc@dsc-basic.html
>     - bat-dg1-7:          NOTRUN -> [SKIP][47] ([i915#3555] / [i915#3840])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg1-7/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][48] ([i915#3637] / [i915#9792]) +3 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-dg1-7:          NOTRUN -> [SKIP][49]
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html
>     - bat-adlp-6:         NOTRUN -> [SKIP][50]
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][51]
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][52] ([i915#5274] / [i915#9792])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][53] ([i915#5274])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][54] ([i915#4342] / [i915#5354] / [i915#9792])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - bat-dg1-7:          NOTRUN -> [SKIP][55] ([i915#433])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg1-7/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - bat-dg2-11:         NOTRUN -> [SKIP][56] ([i915#5354])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html
>     - bat-dg1-7:          NOTRUN -> [SKIP][57] ([i915#5354])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][58] ([i915#5354] / [i915#9792])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_psr@psr-cursor-plane-move:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][59] ([i915#1072] / [i915#9673] / [i915#9732] / [i915#9792]) +3 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html
> 
>   * igt@kms_psr@psr-primary-page-flip:
>     - bat-dg1-7:          NOTRUN -> [SKIP][60] ([i915#1072] / [i915#9732]) +3 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html
>     - fi-glk-j4005:       NOTRUN -> [SKIP][61] +10 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - bat-dg2-11:         NOTRUN -> [SKIP][62] ([i915#1072] / [i915#9732]) +3 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][63] ([i915#3555] / [i915#8809] / [i915#9792])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-adlp-6:         NOTRUN -> [SKIP][64] ([i915#3555])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][65] ([i915#3555])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-dg1-7:          NOTRUN -> [SKIP][66] ([i915#3555])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg1-7/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-flip:
>     - bat-dg2-11:         NOTRUN -> [SKIP][67] ([i915#3708])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][68] ([i915#3708] / [i915#9792])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html
> 
>   * igt@prime_vgem@basic-fence-mmap:
>     - bat-dg1-7:          NOTRUN -> [SKIP][69] ([i915#3708] / [i915#4077]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][70] ([i915#3708] / [i915#4077]) +1 other test skip
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-dg1-7:          NOTRUN -> [SKIP][71] ([i915#3708]) +3 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg1-7/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@basic-gtt:
>     - bat-dg2-11:         NOTRUN -> [SKIP][72] ([i915#3708] / [i915#4077]) +1 other test skip
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg2-11/igt@prime_vgem@basic-gtt.html
> 
>   * igt@prime_vgem@basic-read:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][73] ([i915#3708]) +1 other test skip
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-adlp-6:         NOTRUN -> [SKIP][74] ([i915#3291] / [i915#3708]) +2 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-adlp-6/igt@prime_vgem@basic-write.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][75] ([i915#10216] / [i915#3708])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-mtlp-6/igt@prime_vgem@basic-write.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][76] ([i915#3291] / [i915#3708]) +2 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg2-11/igt@prime_vgem@basic-write.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@migrate:
>     - bat-dg2-9:          [ABORT][77] ([i915#10366] / [i915#10677]) -> [PASS][78]
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/bat-dg2-9/igt@i915_selftest@live@migrate.html
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/bat-dg2-9/igt@i915_selftest@live@migrate.html
> 
>   
>   [i915#10216]: https://gitlab.freedesktop.org/drm/intel/issues/10216
>   [i915#10262]: https://gitlab.freedesktop.org/drm/intel/issues/10262
>   [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
>   [i915#10378]: https://gitlab.freedesktop.org/drm/intel/issues/10378
>   [i915#10677]: https://gitlab.freedesktop.org/drm/intel/issues/10677
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
>   [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
>   [i915#4342]: https://gitlab.freedesktop.org/drm/intel/issues/4342
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
>   [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
>   [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
>   [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
>   [i915#9792]: https://gitlab.freedesktop.org/drm/intel/issues/9792
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7807 -> IGTPW_11018
> 
>   CI-20190529: 20190529
>   CI_DRM_14583: 5f7597e990bea547bd1261170497e7476fb781bb @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11018: 11018
>   IGT_7807: 43e71eeac0fb4fe59df40df2c96fd0fdbf585c0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> Testlist changes
> ----------------
> 
> +igt@gem_mmap_offset@partial-mmap
> +igt@gem_mmap_offset@partial-unmap
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11018/index.html
