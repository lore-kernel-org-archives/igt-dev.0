Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDE0C282E3
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 12:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F8410E75B;
	Wed,  5 Mar 2025 12:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/AcPd3z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E0110E09B;
 Wed,  5 Mar 2025 12:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741179348; x=1772715348;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=Ma1GZZseHtuNmjz16bgi9Z/Iwe9ubEVpu6BOd1Krm5s=;
 b=H/AcPd3zwsSZ2iDUGJKMcsrdpwuN//Ex6Y9ngO1BHj9/BvRtlYv4eEfs
 M1zvnPy8UAzwfgxu7IuFjsFxeDOxy9XB3CN/Dr/Z1lhIadu3WeHhDKOrk
 nnorjpoTkWTLxZw4ATglF8auXkl2Sl80Kmsk1aftP+HCfVhbLJymrCudS
 ldkZIyt4aivs+HH97oCayKWZh+m7sC2CwNPow7+i4DdHHEUKPZaA+1LfN
 pQYHmkeMwYxdKXQSX2mZrrGO14mhkmBBDhRDnqGY4pSchkZp2Pccj/nxS
 Cc6adOmmZGF10MwpRQHXQ4uw7Yg9usdkDpN5BSkv36+xgMk/w20CGUxR1 w==;
X-CSE-ConnectionGUID: 0IZm2kX4ShuQCdIwEIjDlQ==
X-CSE-MsgGUID: LppiU5ObS/mcEAvX8rX/Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45794442"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="45794442"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 04:55:47 -0800
X-CSE-ConnectionGUID: 1JeSGr83T/+avjw0ZHdxIg==
X-CSE-MsgGUID: qqzVkhYVTeSXy9PhqVKeXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="123275115"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.63])
 ([10.245.246.63])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 04:55:46 -0800
Message-ID: <7d2067ed-1e85-4cea-b12f-5fe389dc9ffa@intel.com>
Date: Wed, 5 Mar 2025 13:55:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Ensure_that_?=
 =?UTF-8?Q?SR-IOV_and_eudebug_are_exclusive_for_Xe_=28rev3=29?=
To: igt-dev@lists.freedesktop.org
References: <20250304163227.49986-1-christoph.manszewski@intel.com>
 <174112831938.800437.14337314359664377929@b555e5b46a47>
Content-Language: en-US
Cc: I915-ci-infra@lists.freedesktop.org
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <174112831938.800437.14337314359664377929@b555e5b46a47>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 4.03.2025 23:45, Patchwork wrote:
> == Series Details ==
> 
> Series: Ensure that SR-IOV and eudebug are exclusive for Xe (rev3)
> URL   : https://patchwork.freedesktop.org/series/144864/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8259_BAT -> XEIGTPW_12699_BAT
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with XEIGTPW_12699_BAT absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_12699_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>    No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in XEIGTPW_12699_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@xe_intel_bb@intel-bb-blit-y:
>      - bat-adlp-vf:        [PASS][1] -> [ABORT][2]
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html

This failure seems unrelated to the change.

> 
>    
> Known issues
> ------------
> 
>    Here are the changes found in XEIGTPW_12699_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>    * igt@fbdev@nullptr:
>      - bat-dg2-oem2:       [SKIP][3] ([Intel XE#2134]) -> [PASS][4] +4 other tests pass
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/bat-dg2-oem2/igt@fbdev@nullptr.html
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/bat-dg2-oem2/igt@fbdev@nullptr.html
> 
>    * igt@kms_addfb_basic@bad-pitch-128:
>      - bat-dg2-oem2:       [SKIP][5] ([Intel XE#4208] / [i915#2575]) -> [PASS][6] +51 other tests pass
>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
> 
>    * igt@kms_frontbuffer_tracking@basic:
>      - bat-dg2-oem2:       [SKIP][7] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][8]
>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
> 
>    * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>      - bat-dg2-oem2:       [SKIP][9] ([Intel XE#2229] / [Intel XE#455]) -> [PASS][10] +2 other tests pass
>     [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>     [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>    * igt@xe_module_load@load:
>      - bat-dg2-oem2:       [FAIL][11] -> [PASS][12]
>     [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/bat-dg2-oem2/igt@xe_module_load@load.html
>     [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/bat-dg2-oem2/igt@xe_module_load@load.html
> 
>    * igt@xe_prime_self_import@basic-with_fd_dup:
>      - bat-dg2-oem2:       [SKIP][13] ([Intel XE#4208]) -> [PASS][14] +152 other tests pass
>     [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
>     [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
> 
>    
> #### Warnings ####
> 
>    * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>      - bat-dg2-oem2:       [SKIP][15] ([Intel XE#4208] / [i915#2575]) -> [SKIP][16] ([Intel XE#623])
>     [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>     [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>    * igt@kms_dsc@dsc-basic:
>      - bat-dg2-oem2:       [SKIP][17] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][18] ([Intel XE#455])
>     [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
>     [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
> 
>    * igt@kms_psr@psr-cursor-plane-move:
>      - bat-dg2-oem2:       [SKIP][19] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][20] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
>     [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
>     [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
> 
>    * igt@sriov_basic@enable-vfs-autoprobe-off:
>      - bat-dg2-oem2:       [SKIP][21] ([Intel XE#4208] / [i915#2575]) -> [SKIP][22] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
>     [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
>     [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>    * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
>      - bat-dg2-oem2:       [SKIP][23] ([Intel XE#4208]) -> [SKIP][24] ([Intel XE#288]) +32 other tests skip
>     [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
>     [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
> 
>    * igt@xe_huc_copy@huc_copy:
>      - bat-dg2-oem2:       [SKIP][25] ([Intel XE#4208]) -> [SKIP][26] ([Intel XE#255])
>     [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
>     [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
> 
>    * igt@xe_pat@pat-index-xe2:
>      - bat-dg2-oem2:       [SKIP][27] ([Intel XE#4208]) -> [SKIP][28] ([Intel XE#977])
>     [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
>     [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
> 
>    * igt@xe_pat@pat-index-xehpc:
>      - bat-dg2-oem2:       [SKIP][29] ([Intel XE#4208]) -> [SKIP][30] ([Intel XE#2838] / [Intel XE#979])
>     [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
>     [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
> 
>    * igt@xe_pat@pat-index-xelpg:
>      - bat-dg2-oem2:       [SKIP][31] ([Intel XE#4208]) -> [SKIP][32] ([Intel XE#979])
>     [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
>     [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
> 
>    * igt@xe_sriov_flr@flr-vf1-clear:
>      - bat-dg2-oem2:       [SKIP][33] ([Intel XE#4208]) -> [SKIP][34] ([Intel XE#3342])
>     [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html
>     [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>    
>    [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>    [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>    [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>    [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>    [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>    [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
>    [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>    [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>    [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>    [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
>    [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
>    [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>    [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>    [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>    [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>    [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>    [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>    * IGT: IGT_8259 -> IGTPW_12699
> 
>    IGTPW_12699: 12699
>    IGT_8259: 4252087362da9aa06b1a2280f7439bbb0af03aa6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-2754-ff2d693d88726e29a1d87291105135c31c21fa26: ff2d693d88726e29a1d87291105135c31c21fa26
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/index.html
> 
