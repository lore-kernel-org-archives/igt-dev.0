Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A862410E110
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Apr 2023 16:38:11 +0000 (UTC)
Date: Mon, 24 Apr 2023 18:38:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230424163807.ai325qo2wjzt2kdg@kamilkon-desk1>
References: <20230424133054.59629-1-hersenxs.wu@amd.com>
 <168235062363.1234.14952716115694615089@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168235062363.1234.14952716115694615089@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?amdgpu/amd=5Fmem=5Fleak=3A_add_delay_after_igt=5Fsystem=5Fsuspe?=
 =?utf-8?q?nd=5Fautoresume?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SanjuX Marikkar <sanjux.marikkar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

this is unrelated to i915 regressions,

Regards,
Kamil

On 2023-04-24 at 15:37:03 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/amdgpu/amd_mem_leak: add delay after igt_system_suspend_autoresume
> URL   : https://patchwork.freedesktop.org/series/116889/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13054 -> IGTPW_8846
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8846 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8846, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8846/index.html
> 
> Participating hosts (38 -> 37)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8846:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - fi-cfl-8700k:       [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13054/fi-cfl-8700k/igt@i915_suspend@basic-s3-without-i915.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8846/fi-cfl-8700k/igt@i915_suspend@basic-s3-without-i915.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8846 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_suspend@basic-s3@smem:
>     - bat-rpls-1:         NOTRUN -> [ABORT][3] ([i915#6687] / [i915#7978])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8846/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-dg1-5:          [PASS][4] -> [FAIL][5] ([i915#8308])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13054/bat-dg1-5/igt@i915_pm_rps@basic-api.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8846/bat-dg1-5/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-rpls-1:         NOTRUN -> [DMESG-FAIL][6] ([i915#6367])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8846/bat-rpls-1/igt@i915_selftest@live@slpc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@migrate:
>     - bat-adlp-6:         [DMESG-FAIL][7] ([i915#7699]) -> [PASS][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13054/bat-adlp-6/igt@i915_selftest@live@migrate.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8846/bat-adlp-6/igt@i915_selftest@live@migrate.html
> 
>   * igt@i915_selftest@live@requests:
>     - bat-rpls-1:         [ABORT][9] ([i915#4983] / [i915#7911]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13054/bat-rpls-1/igt@i915_selftest@live@requests.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8846/bat-rpls-1/igt@i915_selftest@live@requests.html
> 
>   
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
>   [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
>   [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
>   [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
>   [i915#8308]: https://gitlab.freedesktop.org/drm/intel/issues/8308
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7266 -> IGTPW_8846
> 
>   CI-20190529: 20190529
>   CI_DRM_13054: 8cabe2adb8e028197f9535daffd3d5ff98d51d8b @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8846: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8846/index.html
>   IGT_7266: 94411dd85f9ad6d76fb7b2097197122703a3914c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8846/index.html
