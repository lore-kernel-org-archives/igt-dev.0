Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A38610E589
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 16:01:21 +0000 (UTC)
Date: Wed, 12 Jul 2023 17:59:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230712155928.urfyzk2bzs3vkkbq@kamilkon-desk1>
References: <20230711093602.987411-1-priyanka.dandamudi@intel.com>
 <168907178822.18667.1779471044341031275@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168907178822.18667.1779471044341031275@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogIGZhaWx1cmUgZm9yIHhlL3hl?=
 =?utf-8?q?=5Fcreate=3A_Modify_massive_test?=
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

On 2023-07-11 at 10:36:28 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: xe/xe_create: Modify massive test
> URL   : https://patchwork.freedesktop.org/series/120537/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13368 -> IGTPW_9382
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9382 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9382, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/index.html
> 
> Participating hosts (42 -> 41)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9382:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-dg2-11:         [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/bat-dg2-11/igt@i915_selftest@live@slpc.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-dg2-11/igt@i915_selftest@live@slpc.html
> 

Not related to xe test,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9382 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_pm_rpm@basic-rte:
>     - fi-cfl-guc:         [PASS][3] -> [FAIL][4] ([i915#7940])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/fi-cfl-guc/igt@i915_pm_rpm@basic-rte.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/fi-cfl-guc/igt@i915_pm_rpm@basic-rte.html
> 
>   * igt@i915_pm_rpm@module-reload:
>     - fi-cfl-8109u:       [PASS][5] -> [FAIL][6] ([i915#7940]) +1 similar issue
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - fi-apl-guc:         [PASS][7] -> [DMESG-FAIL][8] ([i915#5334])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@i915_selftest@live@reset:
>     - bat-rpls-1:         [PASS][9] -> [ABORT][10] ([i915#4983] / [i915#7461] / [i915#8347] / [i915#8384])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/bat-rpls-1/igt@i915_selftest@live@reset.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-rpls-1/igt@i915_selftest@live@reset.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - bat-rpls-2:         NOTRUN -> [SKIP][11] ([i915#7828])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-rpls-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
>     - bat-atsm-1:         NOTRUN -> [SKIP][12] ([i915#6078])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-atsm-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - bat-dg2-11:         NOTRUN -> [SKIP][13] ([i915#1845] / [i915#5354]) +3 similar issues
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - bat-rpls-2:         NOTRUN -> [SKIP][14] ([i915#1845])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-rpls-2/igt@kms_pipe_crc_basic@suspend-read-crc.html
>     - bat-atsm-1:         NOTRUN -> [SKIP][15] ([i915#1836])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-atsm-1/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_psr@primary_mmap_gtt:
>     - bat-rplp-1:         NOTRUN -> [ABORT][16] ([i915#8434] / [i915#8442] / [i915#8668])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_pm_rpm@basic-rte:
>     - fi-skl-guc:         [FAIL][17] ([i915#7940]) -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/fi-skl-guc/igt@i915_pm_rpm@basic-rte.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/fi-skl-guc/igt@i915_pm_rpm@basic-rte.html
>     - fi-kbl-7567u:       [FAIL][19] ([i915#7940]) -> [PASS][20]
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/fi-kbl-7567u/igt@i915_pm_rpm@basic-rte.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/fi-kbl-7567u/igt@i915_pm_rpm@basic-rte.html
> 
>   * igt@i915_selftest@live@reset:
>     - bat-rpls-2:         [ABORT][21] ([i915#4983] / [i915#7461] / [i915#7913] / [i915#8347]) -> [PASS][22]
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/bat-rpls-2/igt@i915_selftest@live@reset.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-rpls-2/igt@i915_selftest@live@reset.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_suspend@basic-s3@lmem0:
>     - bat-atsm-1:         [ABORT][23] ([i915#6311]) -> [DMESG-WARN][24] ([i915#8504])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/bat-atsm-1/igt@gem_exec_suspend@basic-s3@lmem0.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-atsm-1/igt@gem_exec_suspend@basic-s3@lmem0.html
> 
>   * igt@i915_pm_rpm@basic-pci-d3-state:
>     - fi-kbl-guc:         [SKIP][25] ([fdo#109271]) -> [FAIL][26] ([i915#7940])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
> 
>   * igt@kms_psr@sprite_plane_onoff:
>     - bat-rplp-1:         [ABORT][27] ([i915#8712]) -> [SKIP][28] ([i915#1072])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html
> 
>   
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
>   [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
>   [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
>   [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
>   [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384
>   [i915#8434]: https://gitlab.freedesktop.org/drm/intel/issues/8434
>   [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
>   [i915#8504]: https://gitlab.freedesktop.org/drm/intel/issues/8504
>   [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
>   [i915#8712]: https://gitlab.freedesktop.org/drm/intel/issues/8712
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7380 -> IGTPW_9382
> 
>   CI-20190529: 20190529
>   CI_DRM_13368: 5f6430479a127acb898b37ee8d6124b0e509618c @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9382: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/index.html
>   IGT_7380: 8e65f12de2fd52c05dc48fdbcb8cfe86f6de1a75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/index.html
