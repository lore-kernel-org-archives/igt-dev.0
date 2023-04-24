Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C66710E1C8
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Apr 2023 17:22:15 +0000 (UTC)
Date: Mon, 24 Apr 2023 19:22:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230424172211.teqrehb6bn3ljye6@kamilkon-desk1>
References: <20230424162642.116013-1-kamil.konieczny@linux.intel.com>
 <168235640563.1231.14187516844598123526@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168235640563.1231.14187516844598123526@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgVXNlIG5l?=
 =?utf-8?q?w_library_libproc2?=
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

this is unrelated to change (on older sys these will use
the same old libproc in igt_core).

Regards,
Kamil

On 2023-04-24 at 17:13:25 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Use new library libproc2
> URL   : https://patchwork.freedesktop.org/series/116896/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13054 -> IGTPW_8848
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8848 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8848, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8848/index.html
> 
> Participating hosts (38 -> 37)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8848:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_store@basic:
>     - fi-rkl-11600:       [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13054/fi-rkl-11600/igt@gem_exec_store@basic.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8848/fi-rkl-11600/igt@gem_exec_store@basic.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8848 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_suspend@basic-s3@smem:
>     - bat-rpls-1:         NOTRUN -> [ABORT][3] ([i915#6687] / [i915#7978])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8848/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-rpls-1:         NOTRUN -> [DMESG-FAIL][4] ([i915#6367])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8848/bat-rpls-1/igt@i915_selftest@live@slpc.html
> 
>   * igt@kms_pipe_crc_basic@read-crc:
>     - bat-adlp-9:         NOTRUN -> [SKIP][5] ([i915#3546]) +1 similar issue
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8848/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@migrate:
>     - bat-adlp-6:         [DMESG-FAIL][6] ([i915#7699]) -> [PASS][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13054/bat-adlp-6/igt@i915_selftest@live@migrate.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8848/bat-adlp-6/igt@i915_selftest@live@migrate.html
> 
>   * igt@i915_selftest@live@requests:
>     - bat-rpls-1:         [ABORT][8] ([i915#4983] / [i915#7911]) -> [PASS][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13054/bat-rpls-1/igt@i915_selftest@live@requests.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8848/bat-rpls-1/igt@i915_selftest@live@requests.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:
>     - bat-dg2-8:          [FAIL][10] ([i915#7932]) -> [PASS][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13054/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8848/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html
> 
>   
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
>   [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
>   [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
>   [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
>   [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7266 -> IGTPW_8848
> 
>   CI-20190529: 20190529
>   CI_DRM_13054: 8cabe2adb8e028197f9535daffd3d5ff98d51d8b @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8848: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8848/index.html
>   IGT_7266: 94411dd85f9ad6d76fb7b2097197122703a3914c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8848/index.html
