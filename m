Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56898E7716B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 07:28:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE17B10EC1B;
	Wed,  4 Dec 2024 07:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdtmsdkL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585B410E09C;
 Wed,  4 Dec 2024 07:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733297290; x=1764833290;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vQQJ7doszzr/mTUexBYcyyBRp5cDn5Oo5cEOIdUhHxE=;
 b=UdtmsdkLD2wGclpC/PQkS9NZU9R4iH8GQjg581JU4AhwXY8rMqqidFtf
 W9RVHv5BrYYo8Beo+42wEGCThjVKtwkDGv44qInPnvJzi3cy0O83bRF6L
 9b9USHSqL5WLXlM/c7uxDJEG7PohE0lgAAhAFBeyTSYeGXwBrUwlIVudJ
 pZBW5UwYh8nxUnJkhB3yYbpkAoXYq3Ku+OTrd4U6PVhUPjpLfidMxUgAv
 JAD4iCXiid6n9ExcWF+IrZd/bNw2k7v6ShBYlCZPj+oXgARX80DGWaP2d
 WEiSjfTrEWEClbCL32qlYo3+GTnOTPmgsdklT7Dv49Ubo3L8hK78j/Imk g==;
X-CSE-ConnectionGUID: yN4jrwJ/SF2V+kQBiKbucA==
X-CSE-MsgGUID: P3IOW8u+SA2uYXmngCUbpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44211005"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44211005"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 23:28:10 -0800
X-CSE-ConnectionGUID: nO3jrnliRKCmvITkcQgiSg==
X-CSE-MsgGUID: rZu37CUeQjWmivA3ETdJ7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="93544852"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:28:09 -0800
Date: Wed, 4 Dec 2024 08:28:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 tests/vkms: Delete VKMS test list
Message-ID: <20241204072806.tvbhqkpypzvomimj@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241201114506.19947-1-mcanal@igalia.com>
 <173305590486.1248488.14598537840666288773@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173305590486.1248488.14598537840666288773@b555e5b46a47>
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
On 2024-12-01 at 12:25:04 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/vkms: Delete VKMS test list
> URL   : https://patchwork.freedesktop.org/series/141962/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8132 -> IGTPW_12225
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12225 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12225, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/index.html
> 
> Participating hosts (45 -> 45)
> ------------------------------
> 
>   Additional (1): fi-rkl-11600 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12225:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live:
>     - bat-arlh-2:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/bat-arlh-2/igt@i915_selftest@live.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/bat-arlh-2/igt@i915_selftest@live.html
> 

This is unrelated, no need for respin unless you want to test
i915 on full run.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12225 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][3] ([i915#9318])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@dmabuf@all-tests:
>     - bat-apl-1:          [PASS][4] -> [INCOMPLETE][5] ([i915#12904]) +1 other test incomplete
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/bat-apl-1/igt@dmabuf@all-tests.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/bat-apl-1/igt@dmabuf@all-tests.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][6] ([i915#2190])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][7] ([i915#4613]) +3 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/fi-rkl-11600/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_tiled_pread_basic:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][8] ([i915#3282])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/fi-rkl-11600/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_pm_rpm@module-reload:
>     - bat-dg1-7:          [PASS][9] -> [FAIL][10] ([i915#12903])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][11] ([i915#4103]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][12] ([i915#3555] / [i915#3840])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/fi-rkl-11600/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][13]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][14] ([i915#5354])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_psr@psr-primary-page-flip:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][15] ([i915#1072] / [i915#9732]) +3 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/fi-rkl-11600/igt@kms_psr@psr-primary-page-flip.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][16] ([i915#3555])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-read:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][17] ([i915#3291] / [i915#3708]) +2 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/fi-rkl-11600/igt@prime_vgem@basic-read.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - bat-adls-6:         [FAIL][18] ([i915#12903]) -> [PASS][19]
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/bat-adls-6/igt@i915_pm_rpm@module-reload.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/bat-adls-6/igt@i915_pm_rpm@module-reload.html
>     - bat-arls-5:         [DMESG-WARN][20] ([i915#4423]) -> [PASS][21]
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/bat-arls-5/igt@i915_pm_rpm@module-reload.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/bat-arls-5/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_selftest@live:
>     - bat-mtlp-8:         [ABORT][22] ([i915#12061]) -> [PASS][23] +1 other test pass
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/bat-mtlp-8/igt@i915_selftest@live.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/bat-mtlp-8/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@late_gt_pm:
>     - fi-cfl-8109u:       [DMESG-WARN][24] ([i915#11621]) -> [PASS][25] +38 other tests pass
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-1:
>     - fi-cfl-8109u:       [DMESG-WARN][26] -> [PASS][27] +2 other tests pass
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-1.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-1.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#12695]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12695
>   [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
>   [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
>   [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8132 -> IGTPW_12225
> 
>   CI-20190529: 20190529
>   CI_DRM_15763: 108f610005f88de624c1a8c4f85d5cab9f530ddb @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12225: 61c3fe7f34c7aa79951575c5668fd63e58d0fa30 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8132: 7675e070cb74c6808050764367f978f6b74ebc36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12225/index.html
