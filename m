Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458F010E0EE
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Dec 2022 14:33:15 +0000 (UTC)
Date: Mon, 5 Dec 2022 15:32:52 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y44BFAHY7g7y5/g9@kamilkon-desk1>
References: <20221202120242.425128-1-matthew.auld@intel.com>
 <166998766760.27866.18106823357537809869@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <166998766760.27866.18106823357537809869@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv2=2C1/2=5D_lib/dmabuf=5Fsync=5Ffile?=
 =?utf-8?q?=3A_move_common_stuff_into_lib?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

these are unrelated to the change.

--
Kamil

On 2022-12-02 at 13:27:47 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,v2,1/2] lib/dmabuf_sync_file: move common stuff into lib
> URL   : https://patchwork.freedesktop.org/series/111582/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7079 -> IGTPW_8187
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8187 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8187, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8187/index.html
> 
> Participating hosts (42 -> 40)
> ------------------------------
> 
>   Additional (1): bat-atsm-1 
>   Missing    (3): fi-ilk-m540 fi-tgl-dsi bat-dg1-6 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8187:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-apl-guc:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7079/fi-apl-guc/igt@i915_selftest@live@execlists.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8187/fi-apl-guc/igt@i915_selftest@live@execlists.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8187 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - {bat-rpls-2}:       [WARN][3] ([i915#7346]) -> [PASS][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7079/bat-rpls-2/igt@i915_pm_rpm@module-reload.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8187/bat-rpls-2/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - fi-cfl-guc:         [DMESG-FAIL][5] ([i915#5334]) -> [PASS][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7079/fi-cfl-guc/igt@i915_selftest@live@gt_heartbeat.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8187/fi-cfl-guc/igt@i915_selftest@live@gt_heartbeat.html
>     - fi-apl-guc:         [DMESG-FAIL][7] ([i915#5334]) -> [PASS][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7079/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8187/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@i915_selftest@live@migrate:
>     - {bat-dg2-11}:       [DMESG-WARN][9] ([i915#7359]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7079/bat-dg2-11/igt@i915_selftest@live@migrate.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8187/bat-dg2-11/igt@i915_selftest@live@migrate.html
> 
>   * igt@i915_selftest@live@requests:
>     - fi-kbl-soraka:      [INCOMPLETE][11] ([i915#7640]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7079/fi-kbl-soraka/igt@i915_selftest@live@requests.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8187/fi-kbl-soraka/igt@i915_selftest@live@requests.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
>   [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
>   [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
>   [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
>   [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166
>   [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
>   [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
>   [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
>   [i915#7346]: https://gitlab.freedesktop.org/drm/intel/issues/7346
>   [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357
>   [i915#7359]: https://gitlab.freedesktop.org/drm/intel/issues/7359
>   [i915#7640]: https://gitlab.freedesktop.org/drm/intel/issues/7640
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7079 -> IGTPW_8187
> 
>   CI-20190529: 20190529
>   CI_DRM_12462: 00b10bdfd8b9edc9b2c681d806fbb6ae2e5f31a3 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8187: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8187/index.html
>   IGT_7079: 272354f8e1bbeb56df1663c42a9958f2ff9b8f54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> Testlist changes
> ----------------
> 
> +igt@gem_exec_balancer@parallel-dmabuf-import-out-fence
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8187/index.html
