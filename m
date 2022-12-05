Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACF810E0EE
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Dec 2022 14:33:57 +0000 (UTC)
Date: Mon, 5 Dec 2022 15:33:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y44BUWM3ksBP4Fg3@kamilkon-desk1>
References: <20221202205705.58879-1-kamil.konieczny@linux.intel.com>
 <167001708647.27866.6987223397694401299@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <167001708647.27866.6987223397694401299@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIGZl?=
 =?utf-8?q?w_multi-GPU_subtests_with_the_help_of_igt=5Fmulti=5Ffork_macro?=
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

these are unrelated,

--
Kamil

On 2022-12-02 at 21:38:06 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add few multi-GPU subtests with the help of igt_multi_fork macro
> URL   : https://patchwork.freedesktop.org/series/111594/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12463 -> IGTPW_8189
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8189 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8189, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/index.html
> 
> Participating hosts (32 -> 43)
> ------------------------------
> 
>   Additional (13): fi-kbl-soraka bat-kbl-2 bat-adlp-9 fi-bsw-n3050 bat-dg1-5 bat-dg2-8 bat-dg2-9 bat-adlp-6 bat-adlp-4 fi-hsw-4770 bat-jsl-3 bat-dg2-11 fi-bsw-nick 
>   Missing    (2): fi-ilk-m540 fi-tgl-dsi 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8189:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@guc_hang:
>     - fi-kbl-soraka:      NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/fi-kbl-soraka/igt@i915_selftest@live@guc_hang.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8189 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-adlp-4:         NOTRUN -> [SKIP][2] ([i915#7456])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-adlp-4/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@gem_exec_gttfill@basic:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][3] ([fdo#109271]) +7 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/fi-kbl-soraka/igt@gem_exec_gttfill@basic.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#2190])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#4613]) +3 similar issues
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - fi-bsw-nick:        NOTRUN -> [SKIP][6] ([fdo#109271]) +39 similar issues
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html
>     - bat-adlp-4:         NOTRUN -> [SKIP][7] ([i915#4613]) +3 similar issues
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-adlp-4/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_mmap@basic:
>     - bat-dg1-5:          NOTRUN -> [SKIP][8] ([i915#4083])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-dg1-5/igt@gem_mmap@basic.html
> 
>   * igt@gem_softpin@allocator-basic-reserve:
>     - fi-hsw-4770:        NOTRUN -> [SKIP][9] ([fdo#109271]) +11 similar issues
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html
> 
>   * igt@gem_tiled_blits@basic:
>     - bat-dg1-5:          NOTRUN -> [SKIP][10] ([i915#4077]) +2 similar issues
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-dg1-5/igt@gem_tiled_blits@basic.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-dg1-5:          NOTRUN -> [SKIP][11] ([i915#4079]) +1 similar issue
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-dg1-5/igt@gem_tiled_pread_basic.html
>     - bat-adlp-4:         NOTRUN -> [SKIP][12] ([i915#3282])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-adlp-4/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_module_load@load:
>     - fi-bsw-n3050:       NOTRUN -> [DMESG-WARN][13] ([i915#7430])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/fi-bsw-n3050/igt@i915_module_load@load.html
> 
>   * igt@i915_pm_backlight@basic-brightness:
>     - bat-dg1-5:          NOTRUN -> [SKIP][14] ([i915#7561])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-adlp-4:         NOTRUN -> [SKIP][15] ([i915#6621])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-adlp-4/igt@i915_pm_rps@basic-api.html
>     - bat-dg1-5:          NOTRUN -> [SKIP][16] ([i915#6621])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-dg1-5/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][17] ([i915#5334])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][18] ([i915#1886])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-hsw-4770:        NOTRUN -> [INCOMPLETE][19] ([i915#4785])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@kms_addfb_basic@basic-x-tiled-legacy:
>     - bat-dg1-5:          NOTRUN -> [SKIP][20] ([i915#4212]) +7 similar issues
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-dg1-5/igt@kms_addfb_basic@basic-x-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - bat-dg1-5:          NOTRUN -> [SKIP][21] ([i915#4215])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-dg1-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_chamelium@dp-crc-fast:
>     - fi-hsw-4770:        NOTRUN -> [SKIP][22] ([fdo#109271] / [fdo#111827]) +7 similar issues
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html
>     - bat-adlp-4:         NOTRUN -> [SKIP][23] ([fdo#111827]) +8 similar issues
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html
>     - bat-dg1-5:          NOTRUN -> [SKIP][24] ([fdo#111827]) +8 similar issues
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-dg1-5/igt@kms_chamelium@dp-crc-fast.html
> 
>   * igt@kms_chamelium@hdmi-hpd-fast:
>     - fi-bsw-nick:        NOTRUN -> [SKIP][25] ([fdo#109271] / [fdo#111827]) +8 similar issues
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/fi-bsw-nick/igt@kms_chamelium@hdmi-hpd-fast.html
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][26] ([fdo#109271] / [fdo#111827]) +7 similar issues
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/fi-kbl-soraka/igt@kms_chamelium@hdmi-hpd-fast.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
>     - bat-adlp-4:         NOTRUN -> [SKIP][27] ([i915#4103])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
>     - bat-dg1-5:          NOTRUN -> [SKIP][28] ([i915#4103] / [i915#4213])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-dg1-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-adlp-4:         NOTRUN -> [SKIP][29] ([i915#4093]) +3 similar issues
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-adlp-4/igt@kms_force_connector_basic@force-load-detect.html
>     - bat-dg1-5:          NOTRUN -> [SKIP][30] ([fdo#109285])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-dg1-5/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - bat-adlp-4:         NOTRUN -> [SKIP][31] ([i915#3546])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_psr@primary_page_flip:
>     - bat-dg1-5:          NOTRUN -> [SKIP][32] ([i915#1072] / [i915#4078]) +3 similar issues
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-dg1-5/igt@kms_psr@primary_page_flip.html
> 
>   * igt@kms_psr@sprite_plane_onoff:
>     - fi-hsw-4770:        NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#1072]) +3 similar issues
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-dg1-5:          NOTRUN -> [SKIP][34] ([i915#3555])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-adlp-4:         NOTRUN -> [SKIP][35] ([i915#3555] / [i915#4579])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-adlp-4/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-dg1-5:          NOTRUN -> [SKIP][36] ([i915#3708]) +3 similar issues
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-dg1-5/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@basic-gtt:
>     - bat-dg1-5:          NOTRUN -> [SKIP][37] ([i915#3708] / [i915#4077]) +1 similar issue
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-dg1-5/igt@prime_vgem@basic-gtt.html
> 
>   * igt@prime_vgem@basic-userptr:
>     - bat-adlp-4:         NOTRUN -> [SKIP][38] ([fdo#109295] / [i915#3301] / [i915#3708])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-adlp-4/igt@prime_vgem@basic-userptr.html
>     - bat-dg1-5:          NOTRUN -> [SKIP][39] ([i915#3708] / [i915#4873])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-dg1-5/igt@prime_vgem@basic-userptr.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-adlp-4:         NOTRUN -> [SKIP][40] ([fdo#109295] / [i915#3291] / [i915#3708]) +2 similar issues
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-adlp-4/igt@prime_vgem@basic-write.html
> 
>   * igt@runner@aborted:
>     - fi-hsw-4770:        NOTRUN -> [FAIL][41] ([fdo#109271] / [i915#4312] / [i915#5594])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/fi-hsw-4770/igt@runner@aborted.html
>     - fi-bsw-n3050:       NOTRUN -> [FAIL][42] ([i915#4312])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/fi-bsw-n3050/igt@runner@aborted.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_suspend@basic-s0@smem:
>     - {bat-rplp-1}:       [DMESG-WARN][43] ([i915#2867]) -> [PASS][44]
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12463/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - {fi-ehl-2}:         [INCOMPLETE][45] -> [PASS][46]
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12463/fi-ehl-2/igt@i915_selftest@live@hangcheck.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/fi-ehl-2/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@i915_selftest@live@reset:
>     - {bat-rpls-2}:       [DMESG-FAIL][47] ([i915#4983]) -> [PASS][48]
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12463/bat-rpls-2/igt@i915_selftest@live@reset.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/bat-rpls-2/igt@i915_selftest@live@reset.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
>   [i915#3003]: https://gitlab.freedesktop.org/drm/intel/issues/3003
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4093]: https://gitlab.freedesktop.org/drm/intel/issues/4093
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
>   [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
>   [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5594]: https://gitlab.freedesktop.org/drm/intel/issues/5594
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
>   [i915#6559]: https://gitlab.freedesktop.org/drm/intel/issues/6559
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
>   [i915#7346]: https://gitlab.freedesktop.org/drm/intel/issues/7346
>   [i915#7430]: https://gitlab.freedesktop.org/drm/intel/issues/7430
>   [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
>   [i915#7498]: https://gitlab.freedesktop.org/drm/intel/issues/7498
>   [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7080 -> IGTPW_8189
> 
>   CI-20190529: 20190529
>   CI_DRM_12463: b36215855627efb694b50c6cc0ba47b0e78d5aa5 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8189: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/index.html
>   IGT_7080: 14721e0783757dfa44ca2677851c3ba508b09682 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> Testlist changes
> ----------------
> 
> +igt@gem_basic@multigpu-create-close
> +igt@gem_close_race@multigpu-basic-process
> +igt@gem_close_race@multigpu-basic-threads
> +igt@gem_exec_gttfill@multigpu-basic
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8189/index.html
