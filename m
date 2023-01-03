Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BA010E25F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jan 2023 13:44:01 +0000 (UTC)
Date: Tue, 3 Jan 2023 14:43:56 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y7QxHDhPXhHx0CyX@kamilkon-desk1>
References: <20221229155842.2448977-1-andrzej.hajda@intel.com>
 <167266494637.12726.13825658551659481202@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <167266494637.12726.13825658551659481202@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fscaling=3A_remove_fb_after_test_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

On 2023-01-02 at 13:09:06 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_plane_scaling: remove fb after test (rev2)
> URL   : https://patchwork.freedesktop.org/series/112291/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12536 -> IGTPW_8287
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8287 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8287, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html
> 
> Participating hosts (45 -> 43)
> ------------------------------
> 
>   Missing    (2): fi-snb-2520m fi-pnv-d510 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8287:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@perf:
>     - fi-kbl-soraka:      [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/fi-kbl-soraka/igt@i915_selftest@live@perf.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/fi-kbl-soraka/igt@i915_selftest@live@perf.html

This is unrelated to change.

Regards,
Kamil

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8287 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@i915_module_load@load:
>     - fi-kbl-soraka:      [DMESG-WARN][3] ([i915#1982]) -> [PASS][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/fi-kbl-soraka/igt@i915_module_load@load.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/fi-kbl-soraka/igt@i915_module_load@load.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - fi-kbl-soraka:      [DMESG-FAIL][5] ([i915#5334]) -> [PASS][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size:
>     - {bat-adlp-9}:       [FAIL][7] ([i915#4289]) -> [PASS][8] +1 similar issue
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12536/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/bat-adlp-9/igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#4289]: https://gitlab.freedesktop.org/drm/intel/issues/4289
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7105 -> IGTPW_8287
> 
>   CI-20190529: 20190529
>   CI_DRM_12536: 4c18d8b1c2a1f11e99f865f60fbce9fedd3376fc @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8287: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html
>   IGT_7105: 305e8d105abf033cb850d1fb118e5cbfb6c9cd40 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8287/index.html
