Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3245310E485
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jun 2023 13:27:05 +0000 (UTC)
Date: Fri, 30 Jun 2023 15:26:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230630132659.nzljr4td4qpnel7l@kamilkon-desk1>
References: <20230630110426.23829-1-sai.gowtham.ch@intel.com>
 <168813008109.24874.17749489027431335156@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168813008109.24874.17749489027431335156@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?xe/xe=5Fexec=5Fstore=3A_Add_xe=5Fexec=5Fstore_test_to_check_sto?=
 =?utf-8?q?re_dword_functionality?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: sai.gowtham.ch@intel.com,
 SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 RavitejaX Veesam <ravitejax.veesam@intel.com>,
 SanjuX Marikkar <sanjux.marikkar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

On 2023-06-30 at 13:01:21 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/xe/xe_exec_store: Add xe_exec_store test to check store dword functionality
> URL   : https://patchwork.freedesktop.org/series/120062/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7359 -> IGTPW_9312
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9312 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9312, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/index.html
> 
> Participating hosts (41 -> 41)
> ------------------------------
> 
>   Additional (1): bat-adlp-6 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9312:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-cfl-8109u:       [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7359/fi-cfl-8109u/igt@i915_selftest@live@execlists.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/fi-cfl-8109u/igt@i915_selftest@live@execlists.html
> 

This is not related to xe_exec_store.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9312 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_auth@basic-auth:
>     - bat-adlp-11:        NOTRUN -> [ABORT][3] ([i915#4423] / [i915#8011])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/bat-adlp-11/igt@core_auth@basic-auth.html
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-adlp-6:         NOTRUN -> [SKIP][4] ([i915#7456])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/bat-adlp-6/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-adlp-6:         NOTRUN -> [SKIP][5] ([i915#3282])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/bat-adlp-6/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_selftest@live@gt_mocs:
>     - bat-mtlp-8:         [PASS][6] -> [DMESG-FAIL][7] ([i915#7059])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7359/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - bat-rpls-2:         [PASS][8] -> [DMESG-FAIL][9] ([i915#4258] / [i915#7913])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7359/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@i915_selftest@live@migrate:
>     - bat-adlp-9:         [PASS][10] -> [DMESG-FAIL][11] ([i915#7699] / [i915#7913])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7359/bat-adlp-9/igt@i915_selftest@live@migrate.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/bat-adlp-9/igt@i915_selftest@live@migrate.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-rpls-2:         [PASS][12] -> [DMESG-WARN][13] ([i915#6367])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7359/bat-rpls-2/igt@i915_selftest@live@slpc.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/bat-rpls-2/igt@i915_selftest@live@slpc.html
>     - bat-rpls-1:         [PASS][14] -> [DMESG-WARN][15] ([i915#6367])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7359/bat-rpls-1/igt@i915_selftest@live@slpc.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/bat-rpls-1/igt@i915_selftest@live@slpc.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-fast:
>     - bat-adlp-6:         NOTRUN -> [SKIP][16] ([i915#7828]) +7 similar issues
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/bat-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-adlp-6:         NOTRUN -> [SKIP][17] ([i915#4103]) +1 similar issue
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-adlp-6:         NOTRUN -> [SKIP][18] ([fdo#109285])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - bat-dg2-11:         NOTRUN -> [SKIP][19] ([i915#1845] / [i915#5354]) +3 similar issues
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:
>     - bat-adlp-6:         NOTRUN -> [ABORT][20] ([i915#7977] / [i915#8434] / [i915#8668])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/bat-adlp-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1.html
> 
>   * igt@kms_psr@primary_mmap_gtt:
>     - bat-rplp-1:         NOTRUN -> [SKIP][21] ([i915#1072]) +1 similar issue
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-rplp-1:         NOTRUN -> [ABORT][22] ([i915#4579] / [i915#8260] / [i915#8668])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@guc:
>     - bat-rpls-1:         [DMESG-WARN][23] ([i915#7852]) -> [PASS][24]
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7359/bat-rpls-1/igt@i915_selftest@live@guc.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/bat-rpls-1/igt@i915_selftest@live@guc.html
> 
>   * igt@i915_selftest@live@migrate:
>     - bat-dg2-11:         [DMESG-WARN][25] ([i915#7699]) -> [PASS][26]
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7359/bat-dg2-11/igt@i915_selftest@live@migrate.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/bat-dg2-11/igt@i915_selftest@live@migrate.html
>     - bat-atsm-1:         [DMESG-FAIL][27] ([i915#7699] / [i915#7913]) -> [PASS][28]
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7359/bat-atsm-1/igt@i915_selftest@live@migrate.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/bat-atsm-1/igt@i915_selftest@live@migrate.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_module_load@load:
>     - bat-adlp-11:        [ABORT][29] ([i915#4423]) -> [DMESG-WARN][30] ([i915#4423])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7359/bat-adlp-11/igt@i915_module_load@load.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/bat-adlp-11/igt@i915_module_load@load.html
> 
>   * igt@kms_psr@cursor_plane_move:
>     - bat-rplp-1:         [ABORT][31] -> [SKIP][32] ([i915#1072])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7359/bat-rplp-1/igt@kms_psr@cursor_plane_move.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/bat-rplp-1/igt@kms_psr@cursor_plane_move.html
> 
>   
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
>   [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
>   [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
>   [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
>   [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7852]: https://gitlab.freedesktop.org/drm/intel/issues/7852
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#7977]: https://gitlab.freedesktop.org/drm/intel/issues/7977
>   [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
>   [i915#8260]: https://gitlab.freedesktop.org/drm/intel/issues/8260
>   [i915#8434]: https://gitlab.freedesktop.org/drm/intel/issues/8434
>   [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7359 -> IGTPW_9312
> 
>   CI-20190529: 20190529
>   CI_DRM_13340: a3b671a5e12f1fd972ad7046f39a470acbefbbdc @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9312: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/index.html
>   IGT_7359: fc1e79f35e391a5a9aa3dc7e7a4207e5ceb3f0dd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> Testlist changes
> ----------------
> 
> +igt@xe_exec_store@basic-all
> +igt@xe_exec_store@basic-store
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9312/index.html
