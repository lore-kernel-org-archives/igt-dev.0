Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FEC10E4AA
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jun 2023 16:08:33 +0000 (UTC)
Date: Fri, 30 Jun 2023 18:07:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230630160748.6j6ryvyoclqmy5qf@kamilkon-desk1>
References: <20230628122744.2810365-1-bhanuprakash.modem@intel.com>
 <168796301773.32036.18349793653821153532@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168796301773.32036.18349793653821153532@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSAgZm9yIGxpYi9r?=
 =?utf-8?q?ms=3A_Fix_the_missing_documentaion_for_KMS_library?=
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

On 2023-06-28 at 14:36:57 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/kms: Fix the missing documentaion for KMS library
> URL   : https://patchwork.freedesktop.org/series/119973/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7354 -> IGTPW_9294
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9294 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9294, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/index.html
> 
> Participating hosts (41 -> 41)
> ------------------------------
> 
>   Additional (1): fi-kbl-soraka 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9294:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - bat-rpls-1:         [PASS][1] -> [WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/bat-rpls-1/igt@i915_suspend@basic-s2idle-without-i915.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/bat-rpls-1/igt@i915_suspend@basic-s2idle-without-i915.html
> 

Please supress this, this patch only adds comments so need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9294 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#2190])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#4613]) +3 similar issues
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][5] ([i915#1886] / [i915#7913])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@i915_selftest@live@mman:
>     - bat-rpls-1:         [PASS][6] -> [TIMEOUT][7] ([i915#6794] / [i915#7392])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/bat-rpls-1/igt@i915_selftest@live@mman.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/bat-rpls-1/igt@i915_selftest@live@mman.html
> 
>   * igt@i915_selftest@live@requests:
>     - bat-mtlp-8:         [PASS][8] -> [DMESG-FAIL][9] ([i915#7269])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/bat-mtlp-8/igt@i915_selftest@live@requests.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/bat-mtlp-8/igt@i915_selftest@live@requests.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-rpls-2:         NOTRUN -> [DMESG-WARN][10] ([i915#6367])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/bat-rpls-2/igt@i915_selftest@live@slpc.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - bat-dg1-5:          NOTRUN -> [SKIP][11] ([i915#7828])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/bat-dg1-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
>     - bat-jsl-3:          NOTRUN -> [SKIP][12] ([i915#7828])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/bat-jsl-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][13] ([fdo#109271]) +14 similar issues
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:
>     - fi-ilk-650:         [PASS][14] -> [ABORT][15] ([fdo#103375])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/fi-ilk-650/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/fi-ilk-650/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#4579])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/fi-kbl-soraka/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_suspend@basic-s0@smem:
>     - bat-jsl-3:          [ABORT][17] ([i915#5122]) -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html
> 
>   * igt@i915_selftest@live@gt_mocs:
>     - bat-mtlp-8:         [DMESG-FAIL][19] ([i915#7059]) -> [PASS][20]
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html
> 
>   * igt@i915_selftest@live@mman:
>     - bat-rpls-2:         [TIMEOUT][21] ([i915#6794] / [i915#7392]) -> [PASS][22]
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/bat-rpls-2/igt@i915_selftest@live@mman.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/bat-rpls-2/igt@i915_selftest@live@mman.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-dg1-5:          [ABORT][23] ([i915#4983]) -> [PASS][24]
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/bat-dg1-5/igt@i915_selftest@live@workarounds.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/bat-dg1-5/igt@i915_selftest@live@workarounds.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - bat-jsl-3:          [FAIL][25] ([fdo#103375]) -> [PASS][26]
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7354/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
>   [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
>   [i915#7269]: https://gitlab.freedesktop.org/drm/intel/issues/7269
>   [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7354 -> IGTPW_9294
> 
>   CI-20190529: 20190529
>   CI_DRM_13330: dd3ec2080383e2bf738c6640aca4183997cf2dde @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9294: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/index.html
>   IGT_7354: 07fe9ec40f779a788946ad371b0b683cab3c2536 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> Testlist changes
> ----------------
> 
> +igt@xe_guc_pc@rc0_on_exec
> +igt@xe_guc_pc@rc6_on_idle
> -igt@xe_pm_residency@gt-c6-on-idle
> -igt@xe_pm_residency@idle-residency
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9294/index.html
