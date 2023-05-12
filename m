Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765F710E0DF
 for <igt-dev@lists.freedesktop.org>; Fri, 12 May 2023 13:23:30 +0000 (UTC)
Date: Fri, 12 May 2023 15:23:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230512132326.7xckrkjcierh3z44@kamilkon-desk1>
References: <20230509104203.1163545-1-mauro.chehab@linux.intel.com>
 <168389761048.26102.7811012101691627543@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168389761048.26102.7811012101691627543@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogIGZhaWx1cmUgZm9yIEFkZCBh?=
 =?utf-8?q?n_option_to_protect_Xe_test_builds_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

On 2023-05-12 at 13:20:10 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add an option to protect Xe test builds (rev3)
> URL   : https://patchwork.freedesktop.org/series/117511/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7286 -> IGTPW_8949
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8949 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8949, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/index.html
> 
> Participating hosts (40 -> 40)
> ------------------------------
> 
>   Additional (1): fi-kbl-soraka 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8949:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_busy@busy@all-engines:
>     - bat-adls-5:         NOTRUN -> [DMESG-WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-adls-5/igt@gem_busy@busy@all-engines.html
> 

Another unrelated regression,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8949 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-adls-5:         NOTRUN -> [SKIP][2] ([i915#7456])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-adls-5/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#2190])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#4613]) +3 similar issues
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-adls-5:         NOTRUN -> [SKIP][5] ([i915#4613]) +3 similar issues
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-adls-5/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-adls-5:         NOTRUN -> [SKIP][6] ([i915#3282])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-adls-5/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_pm_backlight@basic-brightness@edp-1:
>     - bat-rplp-1:         NOTRUN -> [ABORT][7] ([i915#7077])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-rplp-1/igt@i915_pm_backlight@basic-brightness@edp-1.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][8] ([i915#5334] / [i915#7872])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][9] ([i915#1886] / [i915#7913])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-adls-5:         NOTRUN -> [DMESG-WARN][10] ([i915#5591])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-adls-5/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-rpls-2:         [PASS][11] -> [DMESG-WARN][12] ([i915#6367])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7286/bat-rpls-2/igt@i915_selftest@live@slpc.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-rpls-2/igt@i915_selftest@live@slpc.html
>     - bat-rpls-1:         NOTRUN -> [DMESG-WARN][13] ([i915#6367] / [i915#7953])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-rpls-1/igt@i915_selftest@live@slpc.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - bat-rpls-1:         NOTRUN -> [ABORT][14] ([i915#6687] / [i915#7953] / [i915#7978])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_addfb_basic@bad-pitch-0:
>     - bat-adls-5:         NOTRUN -> [DMESG-WARN][15] ([i915#8449]) +36 similar issues
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-adls-5/igt@kms_addfb_basic@bad-pitch-0.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-fast:
>     - bat-adls-5:         NOTRUN -> [SKIP][16] ([i915#7828]) +8 similar issues
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-adls-5/igt@kms_chamelium_hpd@dp-hpd-fast.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][17] ([fdo#109271]) +15 similar issues
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>     - bat-adls-5:         NOTRUN -> [SKIP][18] ([i915#4103]) +1 similar issue
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-adls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-adls-5:         NOTRUN -> [SKIP][19] ([fdo#109285])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-adls-5/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - bat-dg2-11:         NOTRUN -> [SKIP][20] ([i915#1845] / [i915#5354]) +2 similar issues
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   * igt@kms_psr@primary_page_flip:
>     - bat-adls-5:         NOTRUN -> [SKIP][21] ([i915#668]) +3 similar issues
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-adls-5/igt@kms_psr@primary_page_flip.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-rplp-1:         NOTRUN -> [SKIP][22] ([i915#3555] / [i915#4579])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-adls-5:         NOTRUN -> [SKIP][23] ([i915#3555] / [i915#4579])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-adls-5/igt@kms_setmode@basic-clone-single-crtc.html
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#4579])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/fi-kbl-soraka/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-read:
>     - bat-adls-5:         NOTRUN -> [SKIP][25] ([fdo#109295] / [i915#3291]) +2 similar issues
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-adls-5/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@basic-userptr:
>     - bat-adls-5:         NOTRUN -> [SKIP][26] ([fdo#109295] / [i915#3301])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-adls-5/igt@prime_vgem@basic-userptr.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_module_load@load:
>     - bat-adls-5:         [ABORT][27] -> [PASS][28]
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7286/bat-adls-5/igt@i915_module_load@load.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-adls-5/igt@i915_module_load@load.html
> 
>   * igt@i915_selftest@live@requests:
>     - {bat-mtlp-8}:       [ABORT][29] ([i915#4983] / [i915#7920] / [i915#7953]) -> [PASS][30]
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7286/bat-mtlp-8/igt@i915_selftest@live@requests.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-mtlp-8/igt@i915_selftest@live@requests.html
> 
>   * igt@i915_selftest@live@reset:
>     - bat-rpls-1:         [ABORT][31] ([i915#4983] / [i915#7461] / [i915#7953] / [i915#8347] / [i915#8384]) -> [PASS][32]
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7286/bat-rpls-1/igt@i915_selftest@live@reset.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-rpls-1/igt@i915_selftest@live@reset.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-adlm-1:         [DMESG-FAIL][33] ([i915#7904]) -> [PASS][34]
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7286/bat-adlm-1/igt@i915_selftest@live@workarounds.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-adlm-1/igt@i915_selftest@live@workarounds.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_psr@primary_mmap_gtt:
>     - bat-rplp-1:         [ABORT][35] -> [SKIP][36] ([i915#1072])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7286/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
>   [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
>   [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
>   [i915#7077]: https://gitlab.freedesktop.org/drm/intel/issues/7077
>   [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
>   [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
>   [i915#7904]: https://gitlab.freedesktop.org/drm/intel/issues/7904
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#7920]: https://gitlab.freedesktop.org/drm/intel/issues/7920
>   [i915#7953]: https://gitlab.freedesktop.org/drm/intel/issues/7953
>   [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
>   [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
>   [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384
>   [i915#8449]: https://gitlab.freedesktop.org/drm/intel/issues/8449
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7286 -> IGTPW_8949
> 
>   CI-20190529: 20190529
>   CI_DRM_13141: c201176285d7a79884421d1b907ec858c5aee657 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8949: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/index.html
>   IGT_7286: a482779488f11c432d7ddcb1980691ab1603f356 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> Testlist changes
> ----------------
> 
> +++ 0 lines
> --- 817 lines
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8949/index.html
