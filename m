Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9A0C54E41
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 18:13:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7281133E7;
	Wed,  6 Mar 2024 18:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OgioxH5e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74C21133E4;
 Wed,  6 Mar 2024 18:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709748801; x=1741284801;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1dn8YYma1NLQrXGL6vPg28DA9wzZNq7Di7tJuwcN9bI=;
 b=OgioxH5e8F7NSyLn1YZw63ygcFFoNJz+JaYXizKlLbDcWJv2vS9Tced5
 yUHQ5y4nilfZ8Wa5NR3PdCxj56nUarBRdl1/3xVX/U+b+0H0aN6bboo6m
 +Gdhxsd8Z+PgnbwhgNEvH1rrWFfG3BXtWfhoxn3qjk9o/0+DW0pWIaISY
 nxtg9Tf5ULo9WBabHmpxWyH55ngebdcjd3vojUwXfPgrWI2chM8VDZ8R0
 zQu9U8LTxKhMgR3tAze7AWvLjgge7L7nbE+XlsFHQFnxSQK7U2zPwJRIP
 mute6SR2xClzfnn/BhOEn2zTp4uh0rJPsCaU6kq3IKDQDDRAnC0D922Bh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4265410"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4265410"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:13:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="14406876"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 10:13:18 -0800
Date: Wed, 6 Mar 2024 19:13:00 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 introduce Xe multigpu and other multi-GPU helpers (rev11)
Message-ID: <20240306181300.ip62t4qktccowpze@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org,
 lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240306133158.45187-1-kamil.konieczny@linux.intel.com>
 <170974431520.562293.4843385438372194349@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170974431520.562293.4843385438372194349@8e613ede5ea5>
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
On 2024-03-06 at 16:58:35 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: introduce Xe multigpu and other multi-GPU helpers (rev11)
> URL   : https://patchwork.freedesktop.org/series/129101/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14398 -> IGTPW_10786
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10786 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10786, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/index.html
> 
> Participating hosts (41 -> 38)
> ------------------------------
> 
>   Missing    (3): fi-cfl-8109u bat-jsl-1 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10786:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gem_migrate:
>     - bat-dg2-11:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14398/bat-dg2-11/igt@i915_selftest@live@gem_migrate.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-dg2-11/igt@i915_selftest@live@gem_migrate.html
> 

This is unrelated,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10786 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - bat-arls-2:         NOTRUN -> [SKIP][3] ([i915#10213]) +3 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-arls-2/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@gem_mmap@basic:
>     - bat-arls-2:         NOTRUN -> [SKIP][4] ([i915#4083])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-arls-2/igt@gem_mmap@basic.html
> 
>   * igt@gem_mmap_gtt@basic:
>     - bat-arls-2:         NOTRUN -> [SKIP][5] ([i915#10196] / [i915#4077]) +2 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-arls-2/igt@gem_mmap_gtt@basic.html
> 
>   * igt@gem_render_tiled_blits@basic:
>     - bat-arls-2:         NOTRUN -> [SKIP][6] ([i915#10197] / [i915#10211] / [i915#4079])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-arls-2/igt@gem_render_tiled_blits@basic.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-arls-2:         NOTRUN -> [SKIP][7] ([i915#10206] / [i915#4079])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-arls-2/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-arls-2:         NOTRUN -> [SKIP][8] ([i915#10209])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-arls-2/igt@i915_pm_rps@basic-api.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-arls-2:         NOTRUN -> [SKIP][9] ([i915#10200]) +9 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-arls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-arls-2:         NOTRUN -> [SKIP][10] ([i915#10202]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-arls-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-arls-2:         NOTRUN -> [SKIP][11] ([i915#9886])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-arls-2/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-arls-2:         NOTRUN -> [SKIP][12] ([i915#10207])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-arls-2/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
>     - bat-arls-2:         NOTRUN -> [SKIP][13] ([i915#10196] / [i915#4077] / [i915#9688])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-arls-2/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-arls-2:         NOTRUN -> [SKIP][14] ([i915#10208] / [i915#8809])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-arls-2/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-mmap:
>     - bat-arls-2:         NOTRUN -> [SKIP][15] ([i915#10196] / [i915#3708] / [i915#4077]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-arls-2/igt@prime_vgem@basic-fence-mmap.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-arls-2:         NOTRUN -> [SKIP][16] ([i915#10212] / [i915#3708])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-arls-2/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@basic-read:
>     - bat-arls-2:         NOTRUN -> [SKIP][17] ([i915#10214] / [i915#3708])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-arls-2/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-arls-2:         NOTRUN -> [SKIP][18] ([i915#10216] / [i915#3708])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-arls-2/igt@prime_vgem@basic-write.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_parallel@engines@contexts:
>     - bat-arls-2:         [ABORT][19] -> [PASS][20]
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14398/bat-arls-2/igt@gem_exec_parallel@engines@contexts.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-arls-2/igt@gem_exec_parallel@engines@contexts.html
> 
>   * igt@gem_lmem_swapping@basic@lmem0:
>     - bat-dg2-14:         [FAIL][21] ([i915#10378]) -> [PASS][22]
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14398/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - bat-dg2-14:         [ABORT][23] ([i915#10366]) -> [PASS][24]
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14398/bat-dg2-14/igt@i915_selftest@live@gt_pm.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-dg2-14/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@i915_selftest@live@gt_timelines:
>     - bat-arls-1:         [INCOMPLETE][25] -> [PASS][26]
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14398/bat-arls-1/igt@i915_selftest@live@gt_timelines.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-arls-1/igt@i915_selftest@live@gt_timelines.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - {bat-rpls-3}:       [DMESG-WARN][27] ([i915#5591]) -> [PASS][28]
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14398/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#10196]: https://gitlab.freedesktop.org/drm/intel/issues/10196
>   [i915#10197]: https://gitlab.freedesktop.org/drm/intel/issues/10197
>   [i915#10200]: https://gitlab.freedesktop.org/drm/intel/issues/10200
>   [i915#10202]: https://gitlab.freedesktop.org/drm/intel/issues/10202
>   [i915#10206]: https://gitlab.freedesktop.org/drm/intel/issues/10206
>   [i915#10207]: https://gitlab.freedesktop.org/drm/intel/issues/10207
>   [i915#10208]: https://gitlab.freedesktop.org/drm/intel/issues/10208
>   [i915#10209]: https://gitlab.freedesktop.org/drm/intel/issues/10209
>   [i915#10211]: https://gitlab.freedesktop.org/drm/intel/issues/10211
>   [i915#10212]: https://gitlab.freedesktop.org/drm/intel/issues/10212
>   [i915#10213]: https://gitlab.freedesktop.org/drm/intel/issues/10213
>   [i915#10214]: https://gitlab.freedesktop.org/drm/intel/issues/10214
>   [i915#10216]: https://gitlab.freedesktop.org/drm/intel/issues/10216
>   [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
>   [i915#10378]: https://gitlab.freedesktop.org/drm/intel/issues/10378
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
>   [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
>   [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
>   [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7749 -> IGTPW_10786
> 
>   CI-20190529: 20190529
>   CI_DRM_14398: e96742a33719079709b8e180448b491622e6a427 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10786: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/index.html
>   IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> Testlist changes
> ----------------
> 
> +igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic
> +igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind
> +igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap
> +igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue
> +igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind
> +igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr
> +igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate
> +igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race
> +igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind
> +igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null
> +igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind
> +igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap
> +igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind
> +igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind
> +igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr
> +igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate
> +igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race
> +igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind
> +igt@xe_exec_basic@multigpu-no-exec-basic
> +igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind
> +igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap
> +igt@xe_exec_basic@multigpu-no-exec-bindexecqueue
> +igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind
> +igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr
> +igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate
> +igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race
> +igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind
> +igt@xe_exec_basic@multigpu-no-exec-null
> +igt@xe_exec_basic@multigpu-no-exec-null-defer-bind
> +igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap
> +igt@xe_exec_basic@multigpu-no-exec-null-rebind
> +igt@xe_exec_basic@multigpu-no-exec-rebind
> +igt@xe_exec_basic@multigpu-no-exec-userptr
> +igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate
> +igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race
> +igt@xe_exec_basic@multigpu-no-exec-userptr-rebind
> +igt@xe_exec_basic@multigpu-once-basic
> +igt@xe_exec_basic@multigpu-once-basic-defer-bind
> +igt@xe_exec_basic@multigpu-once-basic-defer-mmap
> +igt@xe_exec_basic@multigpu-once-bindexecqueue
> +igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind
> +igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr
> +igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate
> +igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race
> +igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind
> +igt@xe_exec_basic@multigpu-once-null
> +igt@xe_exec_basic@multigpu-once-null-defer-bind
> +igt@xe_exec_basic@multigpu-once-null-defer-mmap
> +igt@xe_exec_basic@multigpu-once-null-rebind
> +igt@xe_exec_basic@multigpu-once-rebind
> +igt@xe_exec_basic@multigpu-once-userptr
> +igt@xe_exec_basic@multigpu-once-userptr-invalidate
> +igt@xe_exec_basic@multigpu-once-userptr-invalidate-race
> +igt@xe_exec_basic@multigpu-once-userptr-rebind
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10786/index.html
