Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93C810E00C
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jun 2023 08:52:37 +0000 (UTC)
Date: Fri, 16 Jun 2023 10:52:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230616085233.tdlckr6jy63x2v74@kamilkon-desk1>
References: <20230613124647.37529-1-hersenxs.wu@amd.com>
 <168685796737.10724.7772977818142420488@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168685796737.10724.7772977818142420488@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?amdgpu/amd=5Fvrr=5Frange=3A_fix_test_crash_when_n=5Fpipes_=3E_n?=
 =?utf-8?b?X291dHB1dHMgKHJldjQp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 SanjuX Marikkar <sanjux.marikkar@intel.com>,
 RavitejaX Veesam <ravitejax.veesam@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

this is unrelated do amdgpu tests, please supress it.
No need for respin,

Regards,
Kamil

On 2023-06-15 at 19:39:27 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/amdgpu/amd_vrr_range: fix test crash when n_pipes > n_outputs (rev4)
> URL   : https://patchwork.freedesktop.org/series/119276/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7332 -> IGTPW_9189
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9189 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9189, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9189/index.html
> 
> Participating hosts (42 -> 40)
> ------------------------------
> 
>   Missing    (2): bat-rpls-2 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9189:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_parallel@engines@basic:
>     - bat-mtlp-6:         [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-mtlp-6/igt@gem_exec_parallel@engines@basic.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9189/bat-mtlp-6/igt@gem_exec_parallel@engines@basic.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@xe_debugfs@forcewake:
>     - {bat-dg1-8}:        [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-dg1-8/igt@xe_debugfs@forcewake.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9189/bat-dg1-8/igt@xe_debugfs@forcewake.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9189 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live@gt_mocs:
>     - bat-mtlp-6:         [PASS][5] -> [DMESG-FAIL][6] ([i915#7059])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9189/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-mtlp-6:         [PASS][7] -> [DMESG-WARN][8] ([i915#6367])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-mtlp-6/igt@i915_selftest@live@slpc.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9189/bat-mtlp-6/igt@i915_selftest@live@slpc.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - bat-dg2-11:         NOTRUN -> [SKIP][9] ([i915#7828])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9189/bat-dg2-11/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-dg2-11:         [ABORT][10] ([i915#7913] / [i915#7979]) -> [PASS][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-dg2-11/igt@i915_selftest@live@hangcheck.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9189/bat-dg2-11/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-mtlp-6:         [DMESG-FAIL][12] ([i915#6763]) -> [PASS][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9189/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-rplp-1:         [SKIP][14] ([i915#3555] / [i915#4579]) -> [ABORT][15] ([i915#4579] / [i915#8260])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7332/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9189/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6763]: https://gitlab.freedesktop.org/drm/intel/issues/6763
>   [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#7979]: https://gitlab.freedesktop.org/drm/intel/issues/7979
>   [i915#8260]: https://gitlab.freedesktop.org/drm/intel/issues/8260
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7332 -> IGTPW_9189
> 
>   CI-20190529: 20190529
>   CI_DRM_13274: 134d180cacae82fadbc5ee32f86014cc290f5e0c @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9189: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9189/index.html
>   IGT_7332: 2a25a6109e8af4b0a69a717cc8710dcafed4bb4c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9189/index.html
