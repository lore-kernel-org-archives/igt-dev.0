Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C7E10E1E0
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Apr 2023 18:58:18 +0000 (UTC)
Date: Thu, 20 Apr 2023 20:58:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230420185814.suma2f776sqwekah@kamilkon-desk1>
References: <20230227142748.28811-1-kamil.konieczny@linux.intel.com>
 <168198430474.778.6724814884180675096@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168198430474.778.6724814884180675096@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_check_disk_limit_at_dumping_kmsg_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Laxminarayana Naramasetti <laxminarayanax.naramasetti@intel.com>,
 Sai Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 Raviteja Veesam <ravitejax.veesam@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

looks like another report unrelated to change in runner.

Regards,
Kamil

On 2023-04-20 at 09:51:44 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: check disk limit at dumping kmsg (rev4)
> URL   : https://patchwork.freedesktop.org/series/114353/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13033 -> IGTPW_8830
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8830 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8830, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8830/index.html
> 
> Participating hosts (37 -> 37)
> ------------------------------
> 
>   Additional (1): fi-kbl-soraka 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8830:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gt_pm:
>     - fi-kbl-soraka:      NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8830/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-skl-guc:         [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13033/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8830/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_suspend@basic-s3@smem:
>     - bat-rpls-1:         [ABORT][4] ([i915#6687] / [i915#7978]) -> [ABORT][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13033/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8830/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-rpls-1:         [DMESG-FAIL][6] ([i915#6367] / [i915#6997]) -> [FAIL][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13033/bat-rpls-1/igt@i915_selftest@live@slpc.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8830/bat-rpls-1/igt@i915_selftest@live@slpc.html
>     - bat-adln-1:         [DMESG-FAIL][8] ([i915#6997]) -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13033/bat-adln-1/igt@i915_selftest@live@slpc.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8830/bat-adln-1/igt@i915_selftest@live@slpc.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - fi-tgl-1115g4:      [INCOMPLETE][10] ([i915#7443]) -> [INCOMPLETE][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13033/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8830/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_force_connector_basic@force-connector-state:
>     - fi-kbl-8809g:       [DMESG-FAIL][12] ([i915#8299]) -> [FAIL][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13033/fi-kbl-8809g/igt@kms_force_connector_basic@force-connector-state.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8830/fi-kbl-8809g/igt@kms_force_connector_basic@force-connector-state.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@i915_selftest@live@gt_mocs:
>     - {bat-mtlp-8}:       [ABORT][14] ([i915#8369]) -> [ABORT][15]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13033/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8830/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - {bat-mtlp-8}:       [DMESG-FAIL][16] ([i915#8370]) -> [FAIL][17]
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13033/bat-mtlp-8/igt@i915_selftest@live@gt_pm.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8830/bat-mtlp-8/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - {bat-mtlp-8}:       [DMESG-FAIL][18] ([i915#2017]) -> [FAIL][19]
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13033/bat-mtlp-8/igt@kms_frontbuffer_tracking@basic.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8830/bat-mtlp-8/igt@kms_frontbuffer_tracking@basic.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8830 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#2190])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8830/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#4613]) +3 similar issues
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8830/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-fast:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][22] ([fdo#109271]) +16 similar issues
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8830/fi-kbl-soraka/igt@kms_chamelium_frames@hdmi-crc-fast.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - fi-kbl-8809g:       [DMESG-WARN][23] ([i915#8298]) -> [PASS][24]
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13033/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8830/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - fi-apl-guc:         [DMESG-FAIL][25] ([i915#5334]) -> [PASS][26]
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13033/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8830/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-adls-5:         [DMESG-WARN][27] ([i915#5591]) -> [PASS][28]
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13033/bat-adls-5/igt@i915_selftest@live@hangcheck.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8830/bat-adls-5/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@kms_psr@sprite_plane_onoff:
>     - {bat-mtlp-8}:       [DMESG-WARN][29] ([i915#2017]) -> [PASS][30] +2 similar issues
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13033/bat-mtlp-8/igt@kms_psr@sprite_plane_onoff.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8830/bat-mtlp-8/igt@kms_psr@sprite_plane_onoff.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
>   [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
>   [i915#7443]: https://gitlab.freedesktop.org/drm/intel/issues/7443
>   [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
>   [i915#8298]: https://gitlab.freedesktop.org/drm/intel/issues/8298
>   [i915#8299]: https://gitlab.freedesktop.org/drm/intel/issues/8299
>   [i915#8369]: https://gitlab.freedesktop.org/drm/intel/issues/8369
>   [i915#8370]: https://gitlab.freedesktop.org/drm/intel/issues/8370
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7261 -> IGTPW_8830
> 
>   CI-20190529: 20190529
>   CI_DRM_13033: 9e075fd5e9f743c09bf3c220ffda0e32d868667b @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8830: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8830/index.html
>   IGT_7261: 364d0b3291cba6e99deda07499c876bb2b6c1c1d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8830/index.html
