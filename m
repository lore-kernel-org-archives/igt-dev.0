Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AF7C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 14:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F6610F5F8;
	Fri, 19 Apr 2024 14:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QX58bLCv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C5610F5F8;
 Fri, 19 Apr 2024 14:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713536405; x=1745072405;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=k9/5R2SV0xha6UiBnEWaGSu695Nl7/BaJBBvH0bk7pA=;
 b=QX58bLCvJKJAbE50xBekV6tMR/7pQ2S8WLS1BhRb0RMdPsEqeUHOW5Cs
 Up1H0U6ksNNM5i60V2rQQbLh1XSBxQMSCcxxwzp+eKeheXACrWB6JjhnV
 iosuvXBCOmWxD7Z1IYfZ2iK5bHoTgTguWvqQ+fgWx0EpykseowfM3klby
 2jNtczt+qIcZPww2rToN5eFW0c2dtC+syaYjwxN7I2zgpr38L6cT4ffPs
 06Mf0g91pz4J/hf96Kg/+jlb3o41q4tiTy2VU3tq3lYkMuGPeIigVn9n3
 2w32ryChoseQKEOsqmZjEbfF8beir0W4OIEZChpp0eNyiO5O/xPoU1tsV Q==;
X-CSE-ConnectionGUID: WaGGE4mpTZqItSj5KBL5hw==
X-CSE-MsgGUID: scM0+4H1TgaHQykxQTqmnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9004825"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9004825"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:20:05 -0700
X-CSE-ConnectionGUID: 0e6HufXvQGSuItqpSExeow==
X-CSE-MsgGUID: g5sXAI/ZQj+h8ZWNWzIeHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23787120"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 07:20:04 -0700
Date: Fri, 19 Apr 2024 16:20:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmbw==?= =?utf-8?Q?r?=
 tests/intel/xe_pm: Tests to validate vm-bind with S&R (rev2)
Message-ID: <20240419142001.vybr6y3qbz2eyqys@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 I915-ci-infra@lists.freedesktop.org
References: <20240415084035.2603-1-sai.gowtham.ch@intel.com>
 <171324998199.1424678.2691937714529745288@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171324998199.1424678.2691937714529745288@8e613ede5ea5>
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
On 2024-04-16 at 06:46:21 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_pm: Tests to validate vm-bind with S&R (rev2)
> URL   : https://patchwork.freedesktop.org/series/131897/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7807 -> IGTPW_11022
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11022 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11022, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/index.html
> 
> Participating hosts (33 -> 36)
> ------------------------------
> 
>   Additional (8): fi-kbl-7567u bat-dg1-7 bat-kbl-2 fi-bsw-n3050 bat-adlp-6 fi-glk-j4005 bat-dg2-11 bat-mtlp-6 
>   Missing    (5): fi-apl-guc fi-snb-2520m bat-jsl-1 bat-mtlp-8 bat-arls-3 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11022:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@dmabuf:
>     - bat-mtlp-6:         NOTRUN -> [DMESG-FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@i915_selftest@live@dmabuf.html
> 

This is unrelated to Xe test.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11022 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-adlp-6:         NOTRUN -> [SKIP][2] ([i915#9318])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-adlp-6/igt@debugfs_test@basic-hwmon.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][3] ([i915#9318])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@fbdev@info:
>     - bat-kbl-2:          NOTRUN -> [SKIP][4] ([i915#1849])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-kbl-2/igt@fbdev@info.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][5] ([i915#1849] / [i915#2582])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@fbdev@info.html
> 
>   * igt@fbdev@write:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][6] ([i915#2582]) +3 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@fbdev@write.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-kbl-7567u:       NOTRUN -> [SKIP][7] ([i915#2190])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html
>     - fi-glk-j4005:       NOTRUN -> [SKIP][8] ([i915#2190])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-glk-j4005:       NOTRUN -> [SKIP][9] ([i915#4613]) +3 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/fi-glk-j4005/igt@gem_lmem_swapping@basic.html
>     - fi-kbl-7567u:       NOTRUN -> [SKIP][10] ([i915#4613]) +3 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/fi-kbl-7567u/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-kbl-2:          NOTRUN -> [SKIP][11] +39 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - fi-bsw-n3050:       NOTRUN -> [SKIP][12] +19 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html
>     - bat-adlp-6:         NOTRUN -> [SKIP][13] ([i915#4613]) +3 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-adlp-6/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][14] ([i915#4613]) +3 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@gem_mmap@basic:
>     - bat-dg1-7:          NOTRUN -> [SKIP][15] ([i915#4083])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg1-7/igt@gem_mmap@basic.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][16] ([i915#4083])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg2-11/igt@gem_mmap@basic.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][17] ([i915#4083])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@gem_mmap@basic.html
> 
>   * igt@gem_tiled_blits@basic:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][18] ([i915#4077]) +2 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@gem_tiled_blits@basic.html
> 
>   * igt@gem_tiled_fence_blits@basic:
>     - bat-dg1-7:          NOTRUN -> [SKIP][19] ([i915#4077]) +2 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg1-7/igt@gem_tiled_fence_blits@basic.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][20] ([i915#4077]) +2 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-adlp-6:         NOTRUN -> [SKIP][21] ([i915#3282])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-adlp-6/igt@gem_tiled_pread_basic.html
>     - bat-dg1-7:          NOTRUN -> [SKIP][22] ([i915#4079]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg1-7/igt@gem_tiled_pread_basic.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][23] ([i915#4079]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg2-11/igt@gem_tiled_pread_basic.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][24] ([i915#4079]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-dg1-7:          NOTRUN -> [SKIP][25] ([i915#6621])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg1-7/igt@i915_pm_rps@basic-api.html
>     - bat-adlp-6:         NOTRUN -> [SKIP][26] ([i915#6621])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-adlp-6/igt@i915_pm_rps@basic-api.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][27] ([i915#6621])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg2-11/igt@i915_pm_rps@basic-api.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][28] ([i915#6621])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-bsw-nick:        [PASS][29] -> [ABORT][30] ([i915#10594])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/fi-bsw-nick/igt@i915_selftest@live@execlists.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/fi-bsw-nick/igt@i915_selftest@live@execlists.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][31] ([i915#4212] / [i915#9792]) +8 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
>     - bat-dg1-7:          NOTRUN -> [SKIP][32] ([i915#4212]) +7 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg1-7/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][33] ([i915#4212]) +7 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][34] ([i915#5190] / [i915#9792])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][35] ([i915#5190])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - bat-dg1-7:          NOTRUN -> [SKIP][36] ([i915#4215])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][37] ([i915#4215] / [i915#5190])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - fi-glk-j4005:       NOTRUN -> [SKIP][38] +10 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][39] ([i915#4103] / [i915#4213]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-adlp-6:         NOTRUN -> [SKIP][40] ([i915#4103]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>     - bat-dg1-7:          NOTRUN -> [SKIP][41] ([i915#4103] / [i915#4213]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][42] ([i915#9792]) +17 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][43] ([i915#3555] / [i915#3840])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg2-11/igt@kms_dsc@dsc-basic.html
>     - bat-adlp-6:         NOTRUN -> [SKIP][44] ([i915#3555] / [i915#3840])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-adlp-6/igt@kms_dsc@dsc-basic.html
>     - bat-dg1-7:          NOTRUN -> [SKIP][45] ([i915#3555] / [i915#3840])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg1-7/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][46] ([i915#3637] / [i915#9792]) +3 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - fi-kbl-7567u:       NOTRUN -> [SKIP][47] +11 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/fi-kbl-7567u/igt@kms_force_connector_basic@force-load-detect.html
>     - bat-adlp-6:         NOTRUN -> [SKIP][48]
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html
>     - bat-dg1-7:          NOTRUN -> [SKIP][49]
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][50]
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-dg2-11:         NOTRUN -> [SKIP][51] ([i915#5274])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][52] ([i915#5274] / [i915#9792])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][53] ([i915#4342] / [i915#5354] / [i915#9792])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - bat-dg1-7:          NOTRUN -> [SKIP][54] ([i915#433])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg1-7/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - bat-dg1-7:          NOTRUN -> [SKIP][55] ([i915#5354])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg1-7/igt@kms_pm_backlight@basic-brightness.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][56] ([i915#5354])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][57] ([i915#5354] / [i915#9792])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_psr@psr-cursor-plane-move:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][58] ([i915#1072] / [i915#9673] / [i915#9732] / [i915#9792]) +3 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html
> 
>   * igt@kms_psr@psr-primary-page-flip:
>     - bat-dg1-7:          NOTRUN -> [SKIP][59] ([i915#1072] / [i915#9732]) +3 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg1-7/igt@kms_psr@psr-primary-page-flip.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - bat-dg2-11:         NOTRUN -> [SKIP][60] ([i915#1072] / [i915#9732]) +3 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-adlp-6:         NOTRUN -> [SKIP][61] ([i915#3555])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][62] ([i915#3555])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][63] ([i915#3555] / [i915#8809] / [i915#9792])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-dg1-7:          NOTRUN -> [SKIP][64] ([i915#3555])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg1-7/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-flip:
>     - bat-dg1-7:          NOTRUN -> [SKIP][65] ([i915#3708]) +3 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][66] ([i915#3708])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][67] ([i915#3708] / [i915#9792])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html
> 
>   * igt@prime_vgem@basic-fence-mmap:
>     - bat-dg1-7:          NOTRUN -> [SKIP][68] ([i915#3708] / [i915#4077]) +1 other test skip
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg1-7/igt@prime_vgem@basic-fence-mmap.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][69] ([i915#3708] / [i915#4077]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg2-11/igt@prime_vgem@basic-fence-mmap.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][70] ([i915#3708] / [i915#4077]) +1 other test skip
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-adlp-6:         NOTRUN -> [SKIP][71] ([i915#3291] / [i915#3708]) +2 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-adlp-6/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@basic-read:
>     - bat-dg2-11:         NOTRUN -> [SKIP][72] ([i915#3291] / [i915#3708]) +2 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg2-11/igt@prime_vgem@basic-read.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][73] ([i915#3708]) +1 other test skip
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][74] ([i915#10216] / [i915#3708])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-mtlp-6/igt@prime_vgem@basic-write.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@migrate:
>     - bat-dg2-9:          [ABORT][75] ([i915#10366] / [i915#10677]) -> [PASS][76]
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/bat-dg2-9/igt@i915_selftest@live@migrate.html
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/bat-dg2-9/igt@i915_selftest@live@migrate.html
> 
>   
>   [i915#10216]: https://gitlab.freedesktop.org/drm/intel/issues/10216
>   [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
>   [i915#10594]: https://gitlab.freedesktop.org/drm/intel/issues/10594
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
>   * IGT: IGT_7807 -> IGTPW_11022
> 
>   CI-20190529: 20190529
>   CI_DRM_14583: 5f7597e990bea547bd1261170497e7476fb781bb @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11022: 11022
>   IGT_7807: 43e71eeac0fb4fe59df40df2c96fd0fdbf585c0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> Testlist changes
> ----------------
> 
> +igt@xe_pm@s2idle-vm-bind-prefetch
> +igt@xe_pm@s2idle-vm-bind-unbind-all
> +igt@xe_pm@s2idle-vm-bind-usrptr
> +igt@xe_pm@s3-vm-bind-prefetch
> +igt@xe_pm@s3-vm-bind-unbind-all
> +igt@xe_pm@s3-vm-bind-usrptr
> +igt@xe_pm@s4-vm-bind-prefetch
> +igt@xe_pm@s4-vm-bind-unbind-all
> +igt@xe_pm@s4-vm-bind-usrptr
> -igt@xe_exec_fault_mode@many-basic-imm
> -igt@xe_exec_fault_mode@many-bindexecqueue-imm
> -igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm
> -igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm
> -igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-imm
> -igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm
> -igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm
> -igt@xe_exec_fault_mode@many-execqueues-basic-imm
> -igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm
> -igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm
> -igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm
> -igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm
> -igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm
> -igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm
> -igt@xe_exec_fault_mode@many-execqueues-rebind-imm
> -igt@xe_exec_fault_mode@many-execqueues-userptr-imm
> -igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm
> -igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm
> -igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm
> -igt@xe_exec_fault_mode@many-rebind-imm
> -igt@xe_exec_fault_mode@many-userptr-imm
> -igt@xe_exec_fault_mode@many-userptr-invalidate-imm
> -igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm
> -igt@xe_exec_fault_mode@many-userptr-rebind-imm
> -igt@xe_exec_fault_mode@once-basic-imm
> -igt@xe_exec_fault_mode@once-bindexecqueue-imm
> -igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm
> -igt@xe_exec_fault_mode@once-bindexecqueue-userptr-imm
> -igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm
> -igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-imm
> -igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm
> -igt@xe_exec_fault_mode@once-rebind-imm
> -igt@xe_exec_fault_mode@once-userptr-imm
> -igt@xe_exec_fault_mode@once-userptr-invalidate-imm
> -igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm
> -igt@xe_exec_fault_mode@once-userptr-rebind-imm
> -igt@xe_exec_fault_mode@twice-basic-imm
> -igt@xe_exec_fault_mode@twice-bindexecqueue-imm
> -igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm
> -igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm
> -igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm
> -igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm
> -igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm
> -igt@xe_exec_fault_mode@twice-rebind-imm
> -igt@xe_exec_fault_mode@twice-userptr-imm
> -igt@xe_exec_fault_mode@twice-userptr-invalidate-imm
> -igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm
> -igt@xe_exec_fault_mode@twice-userptr-rebind-imm
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11022/index.html
