Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD67D44D54
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 13:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D8F10E6D7;
	Wed,  6 Nov 2024 13:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/fA7kfw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BC810E6D7;
 Wed,  6 Nov 2024 13:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730898367; x=1762434367;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lun721GW8Apsp8aB1vy96O+R4OslBe573zo89mMLDdw=;
 b=V/fA7kfwCSUzj5oxzTL0hAbd9AipnJt7B3xRRSc6rumN8zzSoQkpze9a
 tYsYO72NySLGTq6Q/S5cqyyoZlzDaHHqJFavYJkKxxORh5eGqoSAddsx2
 auIt3wl97RzTG5SHSZOkSNa14hkewa0PRZ0bo9vPtA3+Foa7+PeTkyM86
 xMvYWfZ4FhgEyG5CK2o+kMmG/iNwn+Br+SX7ykdi/Qi93Mpcf9gxSP1wW
 6iGRQEU30b4ubg0rove6/ckg6aRh203lceIi/Grz+zQfGTi25+25o18D4
 tHqtteRAPNcE/Mmms9yOSrz5I1PjOp/tMng9gwwF+9WXpVgM90ZHMstWh g==;
X-CSE-ConnectionGUID: NHOihxd1RFuk+2j5K3tyBQ==
X-CSE-MsgGUID: /D3L9EPxTni/ukSOXh/cUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30122287"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="30122287"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 05:06:07 -0800
X-CSE-ConnectionGUID: SN4rKUrNTVqRH1MShe1mWg==
X-CSE-MsgGUID: Lf91GVYlQPelSVnF0Ej9kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="84079844"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:04:23 -0800
Date: Wed, 6 Nov 2024 14:04:21 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests=2Fsync?=
 =?utf-8?B?b2JqX3dhaXQ6?= Update invalid-wait-zero-handles test (rev2)
Message-ID: <20241106130421.2civxuntqqxsre5v@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241030144821.35043-2-krzysztof.niemiec@intel.com>
 <173075087807.1408486.13951166122374020067@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173075087807.1408486.13951166122374020067@2413ebb6fbb6>
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
On 2024-11-04 at 20:07:58 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/syncobj_wait: Update invalid-wait-zero-handles test (rev2)
> URL   : https://patchwork.freedesktop.org/series/140727/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8094 -> IGTPW_12026
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12026 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12026, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12026/index.html
> 
> Participating hosts (45 -> 44)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12026:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@dmabuf@all-tests@dma_fence_chain:
>     - bat-jsl-3:          [PASS][1] -> [INCOMPLETE][2] +4 other tests incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/bat-jsl-3/igt@dmabuf@all-tests@dma_fence_chain.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12026/bat-jsl-3/igt@dmabuf@all-tests@dma_fence_chain.html
> 

This is unrelated, please respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12026 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@vgem_basic@unload:
>     - bat-jsl-3:          [PASS][3] -> [INCOMPLETE][4] ([i915#12434])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/bat-jsl-3/igt@vgem_basic@unload.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12026/bat-jsl-3/igt@vgem_basic@unload.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_module_load@reload:
>     - bat-apl-1:          [DMESG-WARN][5] ([i915#180]) -> [PASS][6] +2 other tests pass
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/bat-apl-1/igt@i915_module_load@reload.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12026/bat-apl-1/igt@i915_module_load@reload.html
> 
>   * igt@i915_selftest@live:
>     - bat-twl-2:          [INCOMPLETE][7] ([i915#12133] / [i915#9413]) -> [PASS][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/bat-twl-2/igt@i915_selftest@live.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12026/bat-twl-2/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@gt_lrc:
>     - bat-twl-2:          [INCOMPLETE][9] ([i915#12445] / [i915#9413]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/bat-twl-2/igt@i915_selftest@live@gt_lrc.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12026/bat-twl-2/igt@i915_selftest@live@gt_lrc.html
> 
>   * igt@i915_selftest@live@sanitycheck:
>     - bat-apl-1:          [DMESG-WARN][11] ([i915#11621]) -> [PASS][12] +79 other tests pass
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/bat-apl-1/igt@i915_selftest@live@sanitycheck.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12026/bat-apl-1/igt@i915_selftest@live@sanitycheck.html
> 
>   * igt@kms_busy@basic@flip:
>     - bat-apl-1:          [DMESG-WARN][13] ([i915#180] / [i915#1982]) -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/bat-apl-1/igt@kms_busy@basic@flip.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12026/bat-apl-1/igt@kms_busy@basic@flip.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - bat-apl-1:          [DMESG-WARN][15] ([i915#11621] / [i915#180] / [i915#1982]) -> [PASS][16] +2 other tests pass
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12026/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   * igt@kms_pm_rpm@basic-pci-d3-state:
>     - bat-apl-1:          [DMESG-WARN][17] ([i915#11621] / [i915#180]) -> [PASS][18] +42 other tests pass
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8094/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12026/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
> 
>   
>   [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
>   [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
>   [i915#12434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12434
>   [i915#12445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445
>   [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
>   [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
>   [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8094 -> IGTPW_12026
> 
>   CI-20190529: 20190529
>   CI_DRM_15627: 0a6cc4357ae4d824f909468ca1deed28ae5ac96f @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12026: 12673a1148e253d4c6e46265442beb7e5abdff8b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8094: 19b8958a209f1ea14a3ae06b31d76179fed5733a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12026/index.html
