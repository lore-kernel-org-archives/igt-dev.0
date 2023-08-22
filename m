Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDAE10E0C4
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Aug 2023 16:14:35 +0000 (UTC)
Date: Tue, 22 Aug 2023 18:12:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230822161207.4olj6zdip55gi6zn@kamilkon-desk.igk.intel.com>
References: <20230821224106.1412967-1-vinay.belgaumkar@intel.com>
 <169266253447.20551.8143618417427638976@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169266253447.20551.8143618417427638976@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSAgZm9yIHRlc3Rz?=
 =?utf-8?q?/i915=5Fpm=5Ffreq=5Fapi=3A_Ignore_zero_register_value_=28rev4?=
 =?utf-8?q?=29?=
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

On 2023-08-22 at 00:02:14 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/i915_pm_freq_api: Ignore zero register value (rev4)
> URL   : https://patchwork.freedesktop.org/series/122187/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13541 -> IGTPW_9631
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9631 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9631, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/index.html
> 
> Participating hosts (39 -> 39)
> ------------------------------
> 
>   Additional (2): fi-kbl-soraka bat-mtlp-6 
>   Missing    (2): fi-snb-2520m fi-pnv-d510 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9631:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_suspend@basic-s0@lmem0:
>     - bat-dg2-9:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13541/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html
> 

this is unrelated to test, please supress and respin tests.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9631 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][3] ([i915#7456])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@fbdev@info:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][4] ([i915#1849] / [i915#2582])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@fbdev@info.html
> 
>   * igt@fbdev@write:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][5] ([i915#2582]) +3 similar issues
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@fbdev@write.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#2190])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#4613]) +3 similar issues
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][8] ([i915#4613]) +3 similar issues
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@gem_mmap@basic:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][9] ([i915#4083])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@gem_mmap@basic.html
> 
>   * igt@gem_tiled_blits@basic:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][10] ([i915#4077]) +2 similar issues
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@gem_tiled_blits@basic.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][11] ([i915#4079]) +1 similar issue
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_pm_backlight@basic-brightness:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][12] ([i915#3546])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@i915_pm_backlight@basic-brightness.html
> 
>   * igt@i915_pm_backlight@basic-brightness@edp-1:
>     - bat-rplp-1:         NOTRUN -> [ABORT][13] ([i915#7077] / [i915#8668])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-rplp-1/igt@i915_pm_backlight@basic-brightness@edp-1.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][14] ([i915#6621])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][15] ([i915#1886] / [i915#7913])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@i915_selftest@live@mman:
>     - bat-rpls-2:         [PASS][16] -> [TIMEOUT][17] ([i915#6794] / [i915#7392])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13541/bat-rpls-2/igt@i915_selftest@live@mman.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-rpls-2/igt@i915_selftest@live@mman.html
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - bat-rpls-2:         [PASS][18] -> [WARN][19] ([i915#8747])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13541/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][20] ([i915#6645])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][21] ([i915#4212]) +8 similar issues
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][22] ([i915#5190])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][23] ([fdo#109271]) +8 similar issues
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][24] ([i915#1845]) +11 similar issues
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][25] ([i915#3637]) +3 similar issues
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][26] ([fdo#109285])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][27] ([i915#5274])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][28] ([i915#4342])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][29] ([i915#1845] / [i915#4078]) +4 similar issues
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_psr@cursor_plane_move:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][30] ([i915#1072]) +3 similar issues
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@kms_psr@cursor_plane_move.html
> 
>   * igt@kms_psr@primary_mmap_gtt:
>     - bat-rplp-1:         NOTRUN -> [SKIP][31] ([i915#1072]) +1 similar issue
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-rplp-1:         NOTRUN -> [SKIP][32] ([i915#3555])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][33] ([i915#8809])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-flip:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][34] ([i915#1845] / [i915#3708])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html
> 
>   * igt@prime_vgem@basic-fence-mmap:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][35] ([i915#3708] / [i915#4077]) +1 similar issue
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][36] ([i915#3708]) +2 similar issues
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-mtlp-6/igt@prime_vgem@basic-write.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_auth@basic-auth:
>     - bat-adlp-11:        [ABORT][37] ([i915#4423] / [i915#9164]) -> [ABORT][38] ([i915#9164])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13541/bat-adlp-11/igt@core_auth@basic-auth.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-adlp-11/igt@core_auth@basic-auth.html
> 
>   * igt@kms_psr@cursor_plane_move:
>     - bat-rplp-1:         [ABORT][39] ([i915#8469] / [i915#8668]) -> [SKIP][40] ([i915#1072])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13541/bat-rplp-1/igt@kms_psr@cursor_plane_move.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/bat-rplp-1/igt@kms_psr@cursor_plane_move.html
> 
>   
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4342]: https://gitlab.freedesktop.org/drm/intel/issues/4342
>   [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
>   [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
>   [i915#7077]: https://gitlab.freedesktop.org/drm/intel/issues/7077
>   [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
>   [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#8469]: https://gitlab.freedesktop.org/drm/intel/issues/8469
>   [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
>   [i915#8747]: https://gitlab.freedesktop.org/drm/intel/issues/8747
>   [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
>   [i915#9164]: https://gitlab.freedesktop.org/drm/intel/issues/9164
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7448 -> IGTPW_9631
> 
>   CI-20190529: 20190529
>   CI_DRM_13541: 035b310211a224d37e0968584c01c91f4581f037 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9631: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/index.html
>   IGT_7448: 84aa6d50648d9349fb4f1520f37e5374908c9f4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9631/index.html
