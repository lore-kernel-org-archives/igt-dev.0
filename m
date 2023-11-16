Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B2810E26E
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Nov 2023 11:19:49 +0000 (UTC)
Date: Thu, 16 Nov 2023 12:19:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231116111944.4y2k6g7hqidh3hd5@kamilkon-desk.igk.intel.com>
References: <20231107205932.701351-1-jagmeet.randhawa@intel.com>
 <170008209095.646.16459294130461686148@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170008209095.646.16459294130461686148@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSAgZm9yIGxpYi9n?=
 =?utf-8?q?pgpu=5Ffill=3A_Add_support_for_Xe2_platforms_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 lgci.bug.filing@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2023-11-15 at 21:01:30 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/gpgpu_fill: Add support for Xe2 platforms (rev2)
> URL   : https://patchwork.freedesktop.org/series/126096/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13881 -> IGTPW_10197
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10197 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10197, please notify your bug team (lgci.bug.filing@intel.com) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10197/index.html
> 
> Participating hosts (40 -> 38)
> ------------------------------
> 
>   Additional (1): fi-kbl-soraka 
>   Missing    (3): fi-hsw-4770 bat-atsm-1 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10197:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@dmabuf:
>     - bat-mtlp-6:         [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13881/bat-mtlp-6/igt@i915_selftest@live@dmabuf.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10197/bat-mtlp-6/igt@i915_selftest@live@dmabuf.html
> 
>   * igt@i915_selftest@live@perf:
>     - fi-kbl-soraka:      NOTRUN -> [ABORT][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10197/fi-kbl-soraka/igt@i915_selftest@live@perf.html
> 

This is unrelated to a change, please supress and respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10197 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#2190])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10197/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#4613]) +3 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10197/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - fi-bsw-n3050:       NOTRUN -> [SKIP][6] ([fdo#109271]) +14 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10197/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][7] ([i915#1886])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10197/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - bat-rpls-1:         [PASS][8] -> [ABORT][9] ([i915#7978] / [i915#9631])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13881/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10197/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][10] ([fdo#109271]) +9 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10197/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - fi-bsw-n3050:       NOTRUN -> [FAIL][11] ([IGT#3])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10197/fi-bsw-n3050/igt@kms_hdmi_inject@inject-audio.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
>     - bat-rplp-1:         [ABORT][12] ([i915#8668]) -> [PASS][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13881/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10197/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
>   [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
>   [i915#9631]: https://gitlab.freedesktop.org/drm/intel/issues/9631
>   [i915#9648]: https://gitlab.freedesktop.org/drm/intel/issues/9648
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7590 -> IGTPW_10197
> 
>   CI-20190529: 20190529
>   CI_DRM_13881: 36732395a74634a9ff9db10c79c4c52719cdab40 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10197: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10197/index.html
>   IGT_7590: c484e1422184a3183d11f1595e53a6715574520f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> Testlist changes
> ----------------
> 
> -igt@xe_waitfence@hasengine
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10197/index.html
