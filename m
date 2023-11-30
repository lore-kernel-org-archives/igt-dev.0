Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEF410E239
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 14:09:21 +0000 (UTC)
Date: Thu, 30 Nov 2023 15:09:17 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231130140917.2whdscuokm4pzigm@kamilkon-desk.igk.intel.com>
References: <20231129080502.135689-1-jesse.zhang@amd.com>
 <170125075516.12090.4256835377751518173@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170125075516.12090.4256835377751518173@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogIGZhaWx1cmUgZm9yIGxpYi9h?=
 =?utf-8?q?mdgpu=3A_add_GFX1150_chips_for_IGT_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: lgci.bug.filing@intel.com, I915-ci-infra@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

below regression is unrelated to change in amdgpu,
no need for respin nor full runs.

Regards,
Kamil

On 2023-11-29 at 09:39:15 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/amdgpu: add GFX1150 chips for IGT tests
> URL   : https://patchwork.freedesktop.org/series/127023/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13943 -> IGTPW_10288
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10288 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10288, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10288/index.html
> 
> Participating hosts (39 -> 36)
> ------------------------------
> 
>   Missing    (3): bat-adlp-11 bat-jsl-1 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10288:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@requests:
>     - bat-rpls-1:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13943/bat-rpls-1/igt@i915_selftest@live@requests.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10288/bat-rpls-1/igt@i915_selftest@live@requests.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10288 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_suspend@basic-s0@smem:
>     - bat-dg2-9:          [PASS][3] -> [INCOMPLETE][4] ([i915#9275])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13943/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10288/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - fi-apl-guc:         [PASS][5] -> [DMESG-FAIL][6] ([i915#5334])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13943/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10288/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - fi-kbl-guc:         [PASS][7] -> [FAIL][8] ([IGT#3])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13943/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10288/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
>     - bat-rplp-1:         [PASS][9] -> [ABORT][10] ([i915#8668])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13943/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10288/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-adls-5:         [DMESG-WARN][11] ([i915#5591]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13943/bat-adls-5/igt@i915_selftest@live@hangcheck.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10288/bat-adls-5/igt@i915_selftest@live@hangcheck.html
> 
>   
>   [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
>   [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
>   [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7609 -> IGTPW_10288
> 
>   CI-20190529: 20190529
>   CI_DRM_13943: 0417ec152200d74916f157bfe76677b3b4af8224 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10288: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10288/index.html
>   IGT_7609: 72a759595100b8d167ca78cd2d62e9acd97e36bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10288/index.html
