Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0B110EA72
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Apr 2023 17:40:17 +0000 (UTC)
Date: Wed, 19 Apr 2023 19:40:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230419174013.sy5udym3fi3dgk26@kamilkon-desk1>
References: <20230227142748.28811-1-kamil.konieczny@linux.intel.com>
 <168191154314.10530.16406432277060680244@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168191154314.10530.16406432277060680244@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_check_disk_limit_at_dumping_kmsg_=28rev3=29?=
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

Hi,

these are unrelated to change in runner.

Regards,
Kamil

On 2023-04-19 at 13:39:03 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: check disk limit at dumping kmsg (rev3)
> URL   : https://patchwork.freedesktop.org/series/114353/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13028 -> IGTPW_8823
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8823 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8823, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8823/index.html
> 
> Participating hosts (38 -> 36)
> ------------------------------
> 
>   Missing    (2): fi-kbl-soraka fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8823:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_suspend@basic-s3@smem:
>     - bat-rpls-1:         NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8823/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-dg2-11:         [PASS][2] -> [ABORT][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13028/bat-dg2-11/igt@i915_selftest@live@hangcheck.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8823/bat-dg2-11/igt@i915_selftest@live@hangcheck.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-adln-1:         [DMESG-FAIL][4] ([i915#6997]) -> [FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13028/bat-adln-1/igt@i915_selftest@live@slpc.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8823/bat-adln-1/igt@i915_selftest@live@slpc.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - fi-tgl-1115g4:      [INCOMPLETE][6] ([i915#7443]) -> [INCOMPLETE][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13028/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8823/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_force_connector_basic@force-connector-state:
>     - fi-kbl-8809g:       [DMESG-FAIL][8] ([i915#8299]) -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13028/fi-kbl-8809g/igt@kms_force_connector_basic@force-connector-state.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8823/fi-kbl-8809g/igt@kms_force_connector_basic@force-connector-state.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@i915_selftest@live@gt_mocs:
>     - {bat-mtlp-8}:       NOTRUN -> [ABORT][10]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8823/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - {bat-mtlp-8}:       NOTRUN -> [FAIL][11]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8823/bat-mtlp-8/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - {bat-mtlp-8}:       [DMESG-FAIL][12] ([i915#2017]) -> [FAIL][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13028/bat-mtlp-8/igt@kms_frontbuffer_tracking@basic.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8823/bat-mtlp-8/igt@kms_frontbuffer_tracking@basic.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8823 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - fi-kbl-8809g:       [DMESG-WARN][14] ([i915#8298]) -> [PASS][15]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13028/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8823/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-dg2-11:         [FAIL][16] ([i915#8308]) -> [PASS][17]
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13028/bat-dg2-11/igt@i915_pm_rps@basic-api.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8823/bat-dg2-11/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live@gt_engines:
>     - {bat-mtlp-8}:       [ABORT][18] -> [PASS][19]
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13028/bat-mtlp-8/igt@i915_selftest@live@gt_engines.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8823/bat-mtlp-8/igt@i915_selftest@live@gt_engines.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-adls-5:         [DMESG-WARN][20] ([i915#5591]) -> [PASS][21]
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13028/bat-adls-5/igt@i915_selftest@live@hangcheck.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8823/bat-adls-5/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@i915_selftest@live@migrate:
>     - bat-adlp-9:         [DMESG-FAIL][22] ([i915#7699]) -> [PASS][23]
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13028/bat-adlp-9/igt@i915_selftest@live@migrate.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8823/bat-adlp-9/igt@i915_selftest@live@migrate.html
> 
>   * igt@i915_selftest@live@reset:
>     - bat-rpls-1:         [ABORT][24] ([i915#4983] / [i915#7981]) -> [PASS][25]
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13028/bat-rpls-1/igt@i915_selftest@live@reset.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8823/bat-rpls-1/igt@i915_selftest@live@reset.html
> 
>   * igt@kms_psr@sprite_plane_onoff:
>     - {bat-mtlp-8}:       [DMESG-WARN][26] ([i915#2017]) -> [PASS][27] +2 similar issues
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13028/bat-mtlp-8/igt@kms_psr@sprite_plane_onoff.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8823/bat-mtlp-8/igt@kms_psr@sprite_plane_onoff.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
>   [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
>   [i915#7443]: https://gitlab.freedesktop.org/drm/intel/issues/7443
>   [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
>   [i915#7981]: https://gitlab.freedesktop.org/drm/intel/issues/7981
>   [i915#8298]: https://gitlab.freedesktop.org/drm/intel/issues/8298
>   [i915#8299]: https://gitlab.freedesktop.org/drm/intel/issues/8299
>   [i915#8308]: https://gitlab.freedesktop.org/drm/intel/issues/8308
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7259 -> IGTPW_8823
> 
>   CI-20190529: 20190529
>   CI_DRM_13028: 7b52b5268848bb482c4ffc4a7613ad13f4077a6b @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8823: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8823/index.html
>   IGT_7259: 3d3a7f1c041d3f8d84d7457abf96adef0ea071cb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> Testlist changes
> ----------------
> 
> -igt@xe_gpgpu_fill@basic
> -igt@xe_intel_bb@add-remove-objects
> -igt@xe_intel_bb@bb-with-allocator
> -igt@xe_intel_bb@blit-reloc
> -igt@xe_intel_bb@blit-simple
> -igt@xe_intel_bb@create-in-region
> -igt@xe_intel_bb@delta-check
> -igt@xe_intel_bb@destroy-bb
> -igt@xe_intel_bb@full-batch
> -igt@xe_intel_bb@intel-bb-blit-none
> -igt@xe_intel_bb@intel-bb-blit-x
> -igt@xe_intel_bb@intel-bb-blit-y
> -igt@xe_intel_bb@lot-of-buffers
> -igt@xe_intel_bb@offset-control
> -igt@xe_intel_bb@purge-bb
> -igt@xe_intel_bb@render
> -igt@xe_intel_bb@reset-bb
> -igt@xe_intel_bb@simple-bb
> -igt@xe_intel_bb@simple-bb-ctx
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8823/index.html
