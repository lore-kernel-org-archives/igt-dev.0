Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9ECC67861
	for <igt-dev@archiver.kernel.org>; Tue,  9 Apr 2024 08:59:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7DE112BD4;
	Tue,  9 Apr 2024 08:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6jKRf59";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006FF112BD4
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2024 08:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712653184; x=1744189184;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=2s21xbf8BwFyjPl4IPFJnI8VveuRodJ8Uot7a//vL/E=;
 b=V6jKRf59z4XjH6Ve6s9uw6ty3S2Uhhpg7/XyXKMgWgou903/oTR/HCpa
 KkJFzPckPWmZYBZXlrwS8j30O8yPIycQIRSdUk6rQZcxtmLnsEyAKBFqF
 znSAmUt0Rh5Zyx1L3XpPzwO7ZQYVY//MYYqCJAcv1cpfuOSSKouaFE4WF
 wnDyOh9e/bIL9qItXAiPBTcweaRQJpHaDuUo3/G5s6IaiWjypwacIZvch
 uTPidOEegCQeePTx1Ry7c2BhREVcw9WDTX6ykZknar8/g6JVecB5vn0rf
 IKKNtwDlIIRYBDIkgsaWsg5vD4srAdZMPfVDqvstI/vRmbniHOwn90jEA A==;
X-CSE-ConnectionGUID: gqFQ7PH+R6+kd37zs4HOUA==
X-CSE-MsgGUID: yIhWY9ThQ5q/jgPWrRw6SA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="10931096"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="10931096"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 01:59:43 -0700
X-CSE-ConnectionGUID: ukFWX9xKT8Oau/PY0/3wOg==
X-CSE-MsgGUID: 69cLXD69QnW3OBV5Hvu19Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="24868096"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 01:59:43 -0700
Date: Tue, 9 Apr 2024 10:59:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/device_reset: move later skips into subtests (rev2)
Message-ID: <20240409085940.2pbwfolqs26wyzay@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240405125605.10425-1-kamil.konieczny@linux.intel.com>
 <171233686552.1239329.10785831677594967549@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171233686552.1239329.10785831677594967549@8e613ede5ea5>
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
On 2024-04-05 at 17:07:45 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/device_reset: move later skips into subtests (rev2)
> URL   : https://patchwork.freedesktop.org/series/132040/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14535 -> IGTPW_10984
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10984 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10984, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10984/index.html
> 
> Participating hosts (39 -> 37)
> ------------------------------
> 
>   Missing    (2): fi-snb-2520m fi-kbl-8809g 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10984:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_softpin@allocator-basic:
>     - bat-arls-2:         NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10984/bat-arls-2/igt@gem_softpin@allocator-basic.html
> 

This is unrelated to change in device_reset test.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10984 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_mmap@basic:
>     - bat-arls-2:         NOTRUN -> [SKIP][2] ([i915#4083])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10984/bat-arls-2/igt@gem_mmap@basic.html
> 
>   * igt@gem_mmap_gtt@basic:
>     - bat-arls-2:         NOTRUN -> [SKIP][3] ([i915#10196] / [i915#4077])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10984/bat-arls-2/igt@gem_mmap_gtt@basic.html
> 
>   * igt@gem_render_tiled_blits@basic:
>     - bat-arls-2:         NOTRUN -> [SKIP][4] ([i915#10197] / [i915#10211] / [i915#4079])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10984/bat-arls-2/igt@gem_render_tiled_blits@basic.html
> 
>   * igt@i915_selftest@live@gt_contexts:
>     - bat-dg2-11:         [PASS][5] -> [ABORT][6] ([i915#10366])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14535/bat-dg2-11/igt@i915_selftest@live@gt_contexts.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10984/bat-dg2-11/igt@i915_selftest@live@gt_contexts.html
> 
>   * igt@i915_selftest@live@objects:
>     - bat-arls-1:         [PASS][7] -> [DMESG-FAIL][8] ([i915#10262]) +33 other tests dmesg-fail
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14535/bat-arls-1/igt@i915_selftest@live@objects.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10984/bat-arls-1/igt@i915_selftest@live@objects.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arls-1:         [PASS][9] -> [DMESG-WARN][10] ([i915#10341])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14535/bat-arls-1/igt@i915_selftest@live@workarounds.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10984/bat-arls-1/igt@i915_selftest@live@workarounds.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_gttfill@basic:
>     - bat-arls-2:         [ABORT][11] -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14535/bat-arls-2/igt@gem_exec_gttfill@basic.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10984/bat-arls-2/igt@gem_exec_gttfill@basic.html
> 
>   * igt@i915_pm_rpm@module-reload:
>     - {bat-mtlp-9}:       [WARN][13] ([i915#10436]) -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14535/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10984/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-bsw-nick:        [ABORT][15] ([i915#10594]) -> [PASS][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14535/fi-bsw-nick/igt@i915_selftest@live@execlists.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10984/fi-bsw-nick/igt@i915_selftest@live@execlists.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - {bat-mtlp-9}:       [DMESG-FAIL][17] ([i915#9840]) -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14535/bat-mtlp-9/igt@i915_selftest@live@hangcheck.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10984/bat-mtlp-9/igt@i915_selftest@live@hangcheck.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#10196]: https://gitlab.freedesktop.org/drm/intel/issues/10196
>   [i915#10197]: https://gitlab.freedesktop.org/drm/intel/issues/10197
>   [i915#10211]: https://gitlab.freedesktop.org/drm/intel/issues/10211
>   [i915#10262]: https://gitlab.freedesktop.org/drm/intel/issues/10262
>   [i915#10341]: https://gitlab.freedesktop.org/drm/intel/issues/10341
>   [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
>   [i915#10436]: https://gitlab.freedesktop.org/drm/intel/issues/10436
>   [i915#10594]: https://gitlab.freedesktop.org/drm/intel/issues/10594
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#9840]: https://gitlab.freedesktop.org/drm/intel/issues/9840
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7801 -> IGTPW_10984
> 
>   CI-20190529: 20190529
>   CI_DRM_14535: 6cdd3c6cb168eb0c12808db45124f036eca2e9a5 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10984: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10984/index.html
>   IGT_7801: 7801
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10984/index.html
