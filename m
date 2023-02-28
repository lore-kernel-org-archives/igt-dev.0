Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650D810E00F
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Feb 2023 20:14:32 +0000 (UTC)
Date: Tue, 28 Feb 2023 21:14:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230228201428.qpxzascs4excsqrt@kamilkon-desk1>
References: <20230220164927.27283-1-ville.syrjala@linux.intel.com>
 <167691614348.31318.10975814378655030130@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <167691614348.31318.10975814378655030130@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSAgZm9yIHRvb2xz?=
 =?utf-8?q?/intel=5Fvbt=5Fdecode=3A_Dump_mode_backlight_data?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

these are unrelated to change in tools.

Regards,
Kamil

On 2023-02-20 at 18:02:23 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tools/intel_vbt_decode: Dump mode backlight data
> URL   : https://patchwork.freedesktop.org/series/114197/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12762 -> IGTPW_8511
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8511 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8511, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8511/index.html
> 
> Participating hosts (40 -> 37)
> ------------------------------
> 
>   Missing    (3): bat-kbl-2 bat-dg1-6 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8511:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_legacy@basic-flip-before-cursor@atomic:
>     - fi-kbl-soraka:      [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12762/fi-kbl-soraka/igt@kms_cursor_legacy@basic-flip-before-cursor@atomic.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8511/fi-kbl-soraka/igt@kms_cursor_legacy@basic-flip-before-cursor@atomic.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8511 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_gttfill@basic:
>     - fi-pnv-d510:        [PASS][3] -> [FAIL][4] ([i915#7229])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12762/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8511/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
> 
>   * igt@i915_selftest@live@gt_lrc:
>     - bat-rpls-1:         [PASS][5] -> [INCOMPLETE][6] ([i915#4983])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12762/bat-rpls-1/igt@i915_selftest@live@gt_lrc.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8511/bat-rpls-1/igt@i915_selftest@live@gt_lrc.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-kbl-soraka:      [PASS][7] -> [INCOMPLETE][8] ([i915#7913])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12762/fi-kbl-soraka/igt@i915_selftest@live@hangcheck.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8511/fi-kbl-soraka/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@i915_selftest@live@requests:
>     - bat-rpls-2:         [PASS][9] -> [ABORT][10] ([i915#7982])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12762/bat-rpls-2/igt@i915_selftest@live@requests.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8511/bat-rpls-2/igt@i915_selftest@live@requests.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - bat-dg2-11:         NOTRUN -> [SKIP][11] ([i915#5354]) +2 similar issues
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8511/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - fi-kbl-soraka:      [DMESG-FAIL][12] ([i915#5334] / [i915#7872]) -> [PASS][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12762/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8511/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
> 
>   
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
>   [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#7982]: https://gitlab.freedesktop.org/drm/intel/issues/7982
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7166 -> IGTPW_8511
> 
>   CI-20190529: 20190529
>   CI_DRM_12762: 7db509313c2f676ff22df731c0e8b1acb4a3d2ba @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8511: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8511/index.html
>   IGT_7166: 73a66b9f4418cd14b0c0d20d50cdd4d41053f78c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8511/index.html
