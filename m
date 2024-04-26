Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECABC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 09:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E2E10F96C;
	Fri, 26 Apr 2024 09:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ao0R9/I9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B709310F96C;
 Fri, 26 Apr 2024 09:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714125427; x=1745661427;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uUSAirgGPnNeZ8MVrWasaP0mNjKAa7gx1OnY2WzzBYY=;
 b=Ao0R9/I9a2XNsaW4tQ39tsR95p/wNaE7equkoJ9OXmID7hRnDcOVQD3L
 sySld0FVWeW+BEod5eXe10LokngP6oHVihSNy+LrOZFUBGLxpKUxiI75A
 BWif9ZnORI7izy9AKT8n7RyyIG7BHuJIls/3vyP4NCN93AtzR+4AehO0x
 j+talhfUMuiTCaRH/5xiQHpZb8dNbHfw+SUNnDjmaxq5dh6f26D9tWXV3
 97fLZ9OzZUMUmsF6uTfEVed8xNvjBJoNk+hPMDHMrqfrJLPO/3nITko6q
 vq7TsxQxs0jiQO6fJMLXZue4E3wW5JQCraBDI5tGscAW5IUvJ8Ge08ll8 w==;
X-CSE-ConnectionGUID: TsJ/YtVNR42OrwWHz4n8yw==
X-CSE-MsgGUID: FO+EBJe2SzSs9fxrNXyi9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9722700"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9722700"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:57:06 -0700
X-CSE-ConnectionGUID: eHNTB1SSRWG50+VcBtp/SQ==
X-CSE-MsgGUID: tMMc2bEhR9CWVlrU6TKUEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="56303288"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:57:05 -0700
Date: Fri, 26 Apr 2024 11:56:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/xe_gt_freq: Check for RPe freq updates
Message-ID: <20240426095646.eb36vgw23d2zdlhw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240425195657.3638599-1-vinay.belgaumkar@intel.com>
 <171407763556.1668155.12576594446513071033@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171407763556.1668155.12576594446513071033@8e613ede5ea5>
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
On 2024-04-25 at 20:40:35 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_gt_freq: Check for RPe freq updates
> URL   : https://patchwork.freedesktop.org/series/132926/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14657 -> IGTPW_11073
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11073 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11073, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/index.html
> 
> Participating hosts (41 -> 39)
> ------------------------------
> 
>   Additional (1): bat-arls-3 
>   Missing    (3): bat-adlm-1 fi-snb-2520m fi-bsw-n3050 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11073:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_parallel@engines@fds:
>     - bat-arls-2:         NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-2/igt@gem_exec_parallel@engines@fds.html
> 

Unrelated to Xe test,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11073 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-arls-3:         NOTRUN -> [SKIP][2] ([i915#9318])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-arls-3:         NOTRUN -> [SKIP][3] ([i915#10213]) +3 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_mmap@basic:
>     - bat-arls-3:         NOTRUN -> [SKIP][4] ([i915#4083])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@gem_mmap@basic.html
> 
>   * igt@gem_render_tiled_blits@basic:
>     - bat-arls-3:         NOTRUN -> [SKIP][5] ([i915#10197] / [i915#10211] / [i915#4079])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@gem_render_tiled_blits@basic.html
> 
>   * igt@gem_tiled_blits@basic:
>     - bat-arls-3:         NOTRUN -> [SKIP][6] ([i915#10196] / [i915#4077]) +2 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@gem_tiled_blits@basic.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-arls-3:         NOTRUN -> [SKIP][7] ([i915#10206] / [i915#4079])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_pm_rpm@module-reload:
>     - fi-kbl-7567u:       [PASS][8] -> [DMESG-WARN][9] ([i915#1982] / [i915#8585])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14657/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-arls-3:         NOTRUN -> [SKIP][10] ([i915#10209])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@i915_pm_rps@basic-api.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>     - bat-arls-3:         NOTRUN -> [SKIP][11] ([i915#10200]) +9 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - bat-arls-3:         NOTRUN -> [SKIP][12] ([i915#10202]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-arls-3:         NOTRUN -> [SKIP][13] ([i915#9886])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-arls-3:         NOTRUN -> [SKIP][14] ([i915#10207])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - bat-arls-3:         NOTRUN -> [SKIP][15] ([i915#9812])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_rpm@basic-pci-d3-state:
>     - fi-kbl-7567u:       [PASS][16] -> [DMESG-WARN][17] ([i915#8585]) +82 other tests dmesg-warn
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14657/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
> 
>   * igt@kms_psr@psr-primary-mmap-gtt:
>     - bat-arls-3:         NOTRUN -> [SKIP][18] ([i915#9732]) +3 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_psr@psr-primary-mmap-gtt.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-arls-3:         NOTRUN -> [SKIP][19] ([i915#10208] / [i915#8809])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-mmap:
>     - bat-arls-3:         NOTRUN -> [SKIP][20] ([i915#10196] / [i915#3708] / [i915#4077]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@prime_vgem@basic-fence-mmap.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-arls-3:         NOTRUN -> [SKIP][21] ([i915#10212] / [i915#3708])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@basic-read:
>     - bat-arls-3:         NOTRUN -> [SKIP][22] ([i915#10214] / [i915#3708])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-arls-3:         NOTRUN -> [SKIP][23] ([i915#10216] / [i915#3708])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-3/igt@prime_vgem@basic-write.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_fence@basic-busy@ccs0:
>     - bat-arls-2:         [ABORT][24] -> [PASS][25]
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14657/bat-arls-2/igt@gem_exec_fence@basic-busy@ccs0.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-arls-2/igt@gem_exec_fence@basic-busy@ccs0.html
> 
>   * igt@gem_lmem_swapping@basic@lmem0:
>     - bat-dg2-11:         [FAIL][26] ([i915#10378]) -> [PASS][27]
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14657/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-bsw-nick:        [ABORT][28] ([i915#10594]) -> [PASS][29]
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14657/fi-bsw-nick/igt@i915_selftest@live@execlists.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/fi-bsw-nick/igt@i915_selftest@live@execlists.html
> 
>   
>   [i915#10196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196
>   [i915#10197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197
>   [i915#10200]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200
>   [i915#10202]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202
>   [i915#10206]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10206
>   [i915#10207]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207
>   [i915#10208]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208
>   [i915#10209]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209
>   [i915#10211]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211
>   [i915#10212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212
>   [i915#10213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213
>   [i915#10214]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214
>   [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
>   [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
>   [i915#10594]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10594
>   [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#8585]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8585
>   [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
>   [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
>   [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7824 -> IGTPW_11073
> 
>   CI-20190529: 20190529
>   CI_DRM_14657: 92b848b529903fb99d21168491692474aae4872c @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11073: fc14ad950ade7db2f9fe9a09f3dfee544644e969 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7824: 7824
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11073/index.html
