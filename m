Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CED10E501
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 14:07:04 +0000 (UTC)
Date: Thu, 15 Jun 2023 16:06:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230615140637.o6olhtrdy2tyizov@kamilkon-desk1>
References: <20230614094026.1292703-1-janga.rahul.kumar@intel.com>
 <168673912141.17430.12205101661817818310@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168673912141.17430.12205101661817818310@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogIGZhaWx1cmUgZm9yIHRlc3Rz?=
 =?utf-8?q?/intel-ci/xe=3A_Unblock_unbind_rebind_test?=
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

this is unrelated to xe teslist,

Regards,
Kamil

On 2023-06-14 at 10:38:41 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel-ci/xe: Unblock unbind rebind test
> URL   : https://patchwork.freedesktop.org/series/119331/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13269 -> IGTPW_9165
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9165 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9165, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/index.html
> 
> Participating hosts (40 -> 42)
> ------------------------------
> 
>   Additional (4): bat-rplp-1 bat-rpls-2 fi-rkl-11600 bat-dg1-8 
>   Missing    (2): fi-snb-2520m fi-pnv-d510 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9165:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gem_contexts:
>     - bat-mtlp-8:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13269/bat-mtlp-8/igt@i915_selftest@live@gem_contexts.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-mtlp-8/igt@i915_selftest@live@gem_contexts.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_pipe_crc_basic@hang-read-crc:
>     - {bat-dg1-8}:        NOTRUN -> [SKIP][3] +73 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-dg1-8/igt@kms_pipe_crc_basic@hang-read-crc.html
> 
>   * igt@xe_guc_pc@freq_fixed_idle:
>     - {bat-dg1-8}:        NOTRUN -> [FAIL][4] +1 similar issue
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-dg1-8/igt@xe_guc_pc@freq_fixed_idle.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9165 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-rpls-2:         NOTRUN -> [SKIP][5] ([i915#7456])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rpls-2/igt@debugfs_test@basic-hwmon.html
>     - bat-rplp-1:         NOTRUN -> [SKIP][6] ([i915#7456])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rplp-1/igt@debugfs_test@basic-hwmon.html
>     - fi-rkl-11600:       NOTRUN -> [SKIP][7] ([i915#7456])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@fbdev@read:
>     - bat-rpls-2:         NOTRUN -> [SKIP][8] ([i915#2582]) +4 similar issues
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rpls-2/igt@fbdev@read.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][9] ([i915#2190])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][10] ([i915#4613]) +3 similar issues
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/fi-rkl-11600/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - bat-rpls-2:         NOTRUN -> [SKIP][11] ([i915#4613]) +3 similar issues
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rpls-2/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@gem_tiled_pread_basic:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][12] ([i915#3282])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/fi-rkl-11600/igt@gem_tiled_pread_basic.html
>     - bat-rplp-1:         NOTRUN -> [SKIP][13] ([i915#3282])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rplp-1/igt@gem_tiled_pread_basic.html
>     - bat-rpls-2:         NOTRUN -> [SKIP][14] ([i915#3282])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rpls-2/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_pm_backlight@basic-brightness:
>     - bat-rpls-2:         NOTRUN -> [SKIP][15] ([i915#7561])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rpls-2/igt@i915_pm_backlight@basic-brightness.html
>     - fi-rkl-11600:       NOTRUN -> [SKIP][16] ([i915#7561])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html
> 
>   * igt@i915_pm_backlight@basic-brightness@edp-1:
>     - bat-rplp-1:         NOTRUN -> [ABORT][17] ([i915#7077])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rplp-1/igt@i915_pm_backlight@basic-brightness@edp-1.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-rpls-2:         NOTRUN -> [SKIP][18] ([i915#6621])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rpls-2/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-bsw-nick:        [PASS][19] -> [ABORT][20] ([i915#7911] / [i915#7913])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13269/fi-bsw-nick/igt@i915_selftest@live@execlists.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/fi-bsw-nick/igt@i915_selftest@live@execlists.html
> 
>   * igt@i915_selftest@live@gt_engines:
>     - bat-atsm-1:         [PASS][21] -> [FAIL][22] ([i915#6268])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13269/bat-atsm-1/igt@i915_selftest@live@gt_engines.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-atsm-1/igt@i915_selftest@live@gt_engines.html
> 
>   * igt@i915_selftest@live@gt_mocs:
>     - bat-mtlp-8:         [PASS][23] -> [DMESG-FAIL][24] ([i915#7059])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13269/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - bat-rpls-2:         NOTRUN -> [DMESG-FAIL][25] ([i915#4258] / [i915#7913])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@i915_selftest@live@reset:
>     - bat-rpls-2:         NOTRUN -> [ABORT][26] ([i915#4983] / [i915#7461] / [i915#7913] / [i915#8347])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rpls-2/igt@i915_selftest@live@reset.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-mtlp-6:         [PASS][27] -> [DMESG-WARN][28] ([i915#6367])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13269/bat-mtlp-6/igt@i915_selftest@live@slpc.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-mtlp-6/igt@i915_selftest@live@slpc.html
>     - bat-rpls-1:         NOTRUN -> [DMESG-WARN][29] ([i915#6367])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rpls-1/igt@i915_selftest@live@slpc.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - bat-rpls-1:         NOTRUN -> [ABORT][30] ([i915#6687] / [i915#7978])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_busy@basic:
>     - bat-rpls-2:         NOTRUN -> [SKIP][31] ([i915#1845]) +14 similar issues
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rpls-2/igt@kms_busy@basic.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - bat-rpls-2:         NOTRUN -> [SKIP][32] ([i915#7828]) +7 similar issues
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rpls-2/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - bat-rplp-1:         NOTRUN -> [SKIP][33] ([i915#7828]) +7 similar issues
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rplp-1/igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-fast:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][34] ([i915#7828]) +8 similar issues
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/fi-rkl-11600/igt@kms_chamelium_hpd@dp-hpd-fast.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-rplp-1:         NOTRUN -> [SKIP][35] ([i915#4103] / [i915#4213]) +1 similar issue
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>     - fi-rkl-11600:       NOTRUN -> [SKIP][36] ([i915#4103]) +1 similar issue
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms:
>     - bat-rpls-2:         NOTRUN -> [SKIP][37] ([i915#3637]) +3 similar issues
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rpls-2/igt@kms_flip@basic-flip-vs-dpms.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-rplp-1:         NOTRUN -> [SKIP][38] ([fdo#109285])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rplp-1/igt@kms_force_connector_basic@force-load-detect.html
>     - fi-rkl-11600:       NOTRUN -> [SKIP][39] ([fdo#109285] / [i915#4098])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html
>     - bat-rpls-2:         NOTRUN -> [SKIP][40] ([fdo#109285])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rpls-2/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-rpls-2:         NOTRUN -> [SKIP][41] ([i915#1849])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rpls-2/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@kms_psr@primary_page_flip:
>     - bat-rplp-1:         NOTRUN -> [SKIP][42] ([i915#1072]) +3 similar issues
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rplp-1/igt@kms_psr@primary_page_flip.html
>     - fi-rkl-11600:       NOTRUN -> [SKIP][43] ([i915#1072]) +3 similar issues
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/fi-rkl-11600/igt@kms_psr@primary_page_flip.html
> 
>   * igt@kms_psr@sprite_plane_onoff:
>     - bat-rpls-2:         NOTRUN -> [SKIP][44] ([i915#1072]) +3 similar issues
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rpls-2/igt@kms_psr@sprite_plane_onoff.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-rplp-1:         NOTRUN -> [SKIP][45] ([i915#3555] / [i915#4579])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
>     - fi-rkl-11600:       NOTRUN -> [SKIP][46] ([i915#3555] / [i915#4098] / [i915#4579])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-rpls-2:         NOTRUN -> [SKIP][47] ([i915#3555] / [i915#4579])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-flip:
>     - bat-rpls-2:         NOTRUN -> [SKIP][48] ([fdo#109295] / [i915#1845] / [i915#3708])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rpls-2/igt@prime_vgem@basic-fence-flip.html
> 
>   * igt@prime_vgem@basic-read:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][49] ([fdo#109295] / [i915#3291] / [i915#3708]) +2 similar issues
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/fi-rkl-11600/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-rpls-2:         NOTRUN -> [SKIP][50] ([fdo#109295] / [i915#3708]) +2 similar issues
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rpls-2/igt@prime_vgem@basic-write.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@requests:
>     - bat-mtlp-8:         [DMESG-FAIL][51] ([i915#8497]) -> [PASS][52]
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13269/bat-mtlp-8/igt@i915_selftest@live@requests.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-mtlp-8/igt@i915_selftest@live@requests.html
>     - bat-rpls-1:         [ABORT][53] ([i915#7911] / [i915#7920]) -> [PASS][54]
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13269/bat-rpls-1/igt@i915_selftest@live@requests.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-rpls-1/igt@i915_selftest@live@requests.html
>     - bat-mtlp-6:         [DMESG-FAIL][55] ([i915#8497]) -> [PASS][56]
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13269/bat-mtlp-6/igt@i915_selftest@live@requests.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-mtlp-6/igt@i915_selftest@live@requests.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_module_load@load:
>     - bat-adlp-11:        [DMESG-WARN][57] ([i915#4423]) -> [ABORT][58] ([i915#4423])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13269/bat-adlp-11/igt@i915_module_load@load.html
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/bat-adlp-11/igt@i915_module_load@load.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
>   [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
>   [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
>   [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
>   [i915#7077]: https://gitlab.freedesktop.org/drm/intel/issues/7077
>   [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
>   [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
>   [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#7920]: https://gitlab.freedesktop.org/drm/intel/issues/7920
>   [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
>   [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
>   [i915#8497]: https://gitlab.freedesktop.org/drm/intel/issues/8497
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7327 -> IGTPW_9165
> 
>   CI-20190529: 20190529
>   CI_DRM_13269: c73de42e50dc07f5ae9342b28be76f2ee015e5af @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9165: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/index.html
>   IGT_7327: 34e48b7d6402c3d7af19a40d8951eae017cf64df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9165/index.html
