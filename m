Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C007C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 14:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B0810E2E3;
	Fri, 19 Apr 2024 14:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9d/Oazz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C152910E0E2;
 Fri, 19 Apr 2024 14:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713536859; x=1745072859;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xi0NppkOMDzFHEVDV119XtJqCXIQTyeV4/gGHsJuezc=;
 b=P9d/OazzerTIKIfyaHLvio0dX2hapVaCKWO2pVvfkgaB+8aUvnAJ503T
 nNWHp2bozAbFYJR4qxqkYpf1fQ1FI7UEu9SENKcHXpSrk1TlUv5O43J+y
 ToZSu9mYK6X7ihStTpNOvMDnAq0iMn7eXgrqQ4A3qJecyQjvO5emjs9R/
 dlRtjm7VIZjhU52edyORb9Rbnu6XLMVxVamqdBwQihiCxQ35gWbK8U6UT
 6ol9jRGcln/Qm93hXoaFENGmsauKQT/AVWMJ4s90m2O9yw2ZvN0xmCC+O
 jf3c81FfeIbgFEiFeg3h5pn519UPRC2YFWewvXY4le96cKXyK/EdogFMh A==;
X-CSE-ConnectionGUID: 2zqAEn61QSOm7TRccmdhiw==
X-CSE-MsgGUID: qDcCPd3rSYWbRpF840Ka/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="31623274"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="31623274"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:27:39 -0700
X-CSE-ConnectionGUID: XQT9o1nWQS6SjBeSaMr0Kw==
X-CSE-MsgGUID: aaN77q6xQKSWSo+zH1IoZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23380052"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 07:27:37 -0700
Date: Fri, 19 Apr 2024 16:27:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <me@petersenna.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/gem_exec_capture: Fix many-* subtests (rev2)
Message-ID: <20240419142734.qkhlax4wlzndfjfm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <me@petersenna.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240410174031.5840-1-me@petersenna.com>
 <171286922955.1341683.14811804080850520449@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171286922955.1341683.14811804080850520449@8e613ede5ea5>
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
On 2024-04-11 at 21:00:29 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_exec_capture: Fix many-* subtests (rev2)
> URL   : https://patchwork.freedesktop.org/series/132291/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14567 -> IGTPW_11014
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11014 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11014, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/index.html
> 
> Participating hosts (37 -> 37)
> ------------------------------
> 
>   Additional (4): fi-blb-e6850 bat-kbl-2 bat-atsm-1 fi-bsw-n3050 
>   Missing    (4): fi-cfl-8109u bat-dg2-11 bat-arls-1 fi-elk-e7500 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11014:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gt_mocs:
>     - bat-adln-1:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14567/bat-adln-1/igt@i915_selftest@live@gt_mocs.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/bat-adln-1/igt@i915_selftest@live@gt_mocs.html

This is unrelated to change in gem_exec_capture,
also Xe tests failures are unrelated to this i915 test.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11014 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@fbdev@info:
>     - bat-kbl-2:          NOTRUN -> [SKIP][3] ([i915#1849])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/bat-kbl-2/igt@fbdev@info.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - bat-atsm-1:         NOTRUN -> [FAIL][4] ([i915#10563])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/bat-atsm-1/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-kbl-2:          NOTRUN -> [SKIP][5] +39 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - fi-bsw-n3050:       NOTRUN -> [SKIP][6] +19 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@gem_mmap@basic:
>     - bat-atsm-1:         NOTRUN -> [SKIP][7] ([i915#4083])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/bat-atsm-1/igt@gem_mmap@basic.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-atsm-1:         NOTRUN -> [SKIP][8] ([i915#4079]) +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/bat-atsm-1/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_pm_rpm@module-reload:
>     - fi-blb-e6850:       NOTRUN -> [SKIP][9] +32 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-atsm-1:         NOTRUN -> [SKIP][10] ([i915#6621])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/bat-atsm-1/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live@gem:
>     - bat-atsm-1:         NOTRUN -> [ABORT][11] ([i915#10182] / [i915#10564])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/bat-atsm-1/igt@i915_selftest@live@gem.html
> 
>   * igt@kms_addfb_basic@size-max:
>     - bat-atsm-1:         NOTRUN -> [SKIP][12] ([i915#6077]) +37 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/bat-atsm-1/igt@kms_addfb_basic@size-max.html
> 
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
>     - bat-atsm-1:         NOTRUN -> [SKIP][13] ([i915#6078]) +22 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-atsm-1:         NOTRUN -> [SKIP][14] ([i915#6093]) +4 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/bat-atsm-1/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
>     - bat-atsm-1:         NOTRUN -> [SKIP][15] ([i915#1836]) +6 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/bat-atsm-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
> 
>   * igt@kms_prop_blob@basic:
>     - bat-atsm-1:         NOTRUN -> [SKIP][16] ([i915#7357])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/bat-atsm-1/igt@kms_prop_blob@basic.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-atsm-1:         NOTRUN -> [SKIP][17] ([i915#6094])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-mmap:
>     - bat-atsm-1:         NOTRUN -> [SKIP][18] ([i915#4077]) +4 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/bat-atsm-1/igt@prime_vgem@basic-fence-mmap.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-atsm-1:         NOTRUN -> [SKIP][19] +2 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/bat-atsm-1/igt@prime_vgem@basic-write.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_lmem_swapping@basic@lmem0:
>     - bat-dg2-9:          [FAIL][20] ([i915#10378]) -> [PASS][21]
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14567/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
> 
>   
>   [i915#10182]: https://gitlab.freedesktop.org/drm/intel/issues/10182
>   [i915#10378]: https://gitlab.freedesktop.org/drm/intel/issues/10378
>   [i915#10563]: https://gitlab.freedesktop.org/drm/intel/issues/10563
>   [i915#10564]: https://gitlab.freedesktop.org/drm/intel/issues/10564
>   [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
>   [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
>   [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
>   [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7806 -> IGTPW_11014
> 
>   CI-20190529: 20190529
>   CI_DRM_14567: 64a24a7dc774886c660a412a0d12c02f4bfec223 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11014: 11014
>   IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11014/index.html
