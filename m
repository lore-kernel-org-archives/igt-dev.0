Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6036410E6EB
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 14:14:21 +0000 (UTC)
Date: Thu, 13 Jul 2023 15:45:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230713134540.vxkznqg2qq7bki2y@kamilkon-desk1>
References: <20230713123711.276613-1-kunal1.joshi@intel.com>
 <168925442945.14982.2082662921781655733@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168925442945.14982.2082662921781655733@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/1=5D_tests/intel-ci/xe=2Eblocklist=3A_Add_n?=
 =?utf-8?q?ot_present_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Joshi, Kunal1" <kunal1.joshi@intel.com>,
 SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 RavitejaX Veesam <ravitejax.veesam@intel.com>,
 SanjuX Marikkar <sanjux.marikkar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

fail not related to Xe testlist, no need for respin.

Regards,
Kamil

On 2023-07-13 at 13:20:29 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/1] tests/intel-ci/xe.blocklist: Add not present tests
> URL   : https://patchwork.freedesktop.org/series/120667/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13382 -> IGTPW_9401
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9401 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9401, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9401/index.html
> 
> Participating hosts (41 -> 39)
> ------------------------------
> 
>   Missing    (2): bat-adlp-6 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9401:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - bat-dg2-9:          [PASS][1] -> [WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13382/bat-dg2-9/igt@i915_suspend@basic-s2idle-without-i915.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9401/bat-dg2-9/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9401 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_pm_rpm@basic-rte:
>     - fi-skl-guc:         [PASS][3] -> [FAIL][4] ([i915#7940])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13382/fi-skl-guc/igt@i915_pm_rpm@basic-rte.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9401/fi-skl-guc/igt@i915_pm_rpm@basic-rte.html
>     - fi-kbl-7567u:       [PASS][5] -> [FAIL][6] ([i915#7940])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13382/fi-kbl-7567u/igt@i915_pm_rpm@basic-rte.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9401/fi-kbl-7567u/igt@i915_pm_rpm@basic-rte.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - fi-kbl-7567u:       [PASS][7] -> [DMESG-FAIL][8] ([i915#5334] / [i915#7872])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13382/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9401/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html
>     - fi-apl-guc:         [PASS][9] -> [DMESG-FAIL][10] ([i915#5334])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13382/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9401/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-mtlp-6:         [PASS][11] -> [DMESG-WARN][12] ([i915#6367])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13382/bat-mtlp-6/igt@i915_selftest@live@slpc.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9401/bat-mtlp-6/igt@i915_selftest@live@slpc.html
>     - bat-rpls-1:         [PASS][13] -> [DMESG-WARN][14] ([i915#6367])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13382/bat-rpls-1/igt@i915_selftest@live@slpc.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9401/bat-rpls-1/igt@i915_selftest@live@slpc.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-mtlp-6:         [PASS][15] -> [DMESG-FAIL][16] ([i915#6763])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13382/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9401/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_psr@cursor_plane_move:
>     - bat-rplp-1:         NOTRUN -> [SKIP][17] ([i915#1072]) +1 similar issue
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9401/bat-rplp-1/igt@kms_psr@cursor_plane_move.html
> 
>   * igt@kms_psr@primary_mmap_gtt:
>     - bat-rplp-1:         NOTRUN -> [ABORT][18] ([i915#8434] / [i915#8442] / [i915#8668])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9401/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_pm_rpm@basic-rte:
>     - fi-cfl-8109u:       [FAIL][19] ([i915#7940]) -> [PASS][20]
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13382/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9401/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html
> 
>   * igt@i915_selftest@live@gt_mocs:
>     - bat-mtlp-6:         [DMESG-FAIL][21] ([i915#7059]) -> [PASS][22]
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13382/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9401/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html
> 
>   * igt@i915_selftest@live@requests:
>     - bat-mtlp-8:         [DMESG-FAIL][23] ([i915#8497]) -> [PASS][24]
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13382/bat-mtlp-8/igt@i915_selftest@live@requests.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9401/bat-mtlp-8/igt@i915_selftest@live@requests.html
>     - bat-mtlp-6:         [DMESG-FAIL][25] ([i915#7269]) -> [PASS][26]
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13382/bat-mtlp-6/igt@i915_selftest@live@requests.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9401/bat-mtlp-6/igt@i915_selftest@live@requests.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-rpls-2:         [DMESG-WARN][27] ([i915#6367]) -> [PASS][28]
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13382/bat-rpls-2/igt@i915_selftest@live@slpc.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9401/bat-rpls-2/igt@i915_selftest@live@slpc.html
>     - bat-mtlp-8:         [DMESG-WARN][29] ([i915#6367]) -> [PASS][30]
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13382/bat-mtlp-8/igt@i915_selftest@live@slpc.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9401/bat-mtlp-8/igt@i915_selftest@live@slpc.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_psr@primary_page_flip:
>     - bat-rplp-1:         [ABORT][31] ([i915#8860]) -> [SKIP][32] ([i915#1072])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13382/bat-rplp-1/igt@kms_psr@primary_page_flip.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9401/bat-rplp-1/igt@kms_psr@primary_page_flip.html
> 
>   
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6763]: https://gitlab.freedesktop.org/drm/intel/issues/6763
>   [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
>   [i915#7269]: https://gitlab.freedesktop.org/drm/intel/issues/7269
>   [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
>   [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
>   [i915#8434]: https://gitlab.freedesktop.org/drm/intel/issues/8434
>   [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
>   [i915#8497]: https://gitlab.freedesktop.org/drm/intel/issues/8497
>   [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
>   [i915#8860]: https://gitlab.freedesktop.org/drm/intel/issues/8860
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7385 -> IGTPW_9401
> 
>   CI-20190529: 20190529
>   CI_DRM_13382: c732b5826ab2d8610161e831f4e7df13b5b56f42 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9401: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9401/index.html
>   IGT_7385: 6f68af5bc4c508fee58b7eb8eae61c7463b521a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9401/index.html
