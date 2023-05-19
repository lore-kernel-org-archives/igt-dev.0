Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF5410E080
 for <igt-dev@lists.freedesktop.org>; Fri, 19 May 2023 10:30:26 +0000 (UTC)
Date: Fri, 19 May 2023 12:30:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230519103019.lb7urasugyh6irg2@kamilkon-desk1>
References: <20230519090527.11396-1-kamil.konieczny@linux.intel.com>
 <168449046676.26993.16923135916614640164@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168449046676.26993.16923135916614640164@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaW50ZWwt?=
 =?utf-8?q?ci/xe-fast-feedback=2Etestlist=3A_Add_pagefault_tests_=28rev4?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

below change in xe.fast-feedback is not related to igt i915 tests,
could you supress them and respin BAT tests ?

Regards,
Kamil

On 2023-05-19 at 10:01:06 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci/xe-fast-feedback.testlist: Add pagefault tests (rev4)
> URL   : https://patchwork.freedesktop.org/series/117995/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13165 -> IGTPW_9008
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9008 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9008, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/index.html
> 
> Participating hosts (37 -> 37)
> ------------------------------
> 
>   Additional (2): bat-rpls-2 bat-mtlp-8 
>   Missing    (2): fi-kbl-soraka fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9008:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:
>     - bat-adlp-6:         NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-adlp-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@i915_selftest@live@requests:
>     - {bat-mtlp-8}:       NOTRUN -> [DMESG-FAIL][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-mtlp-8/igt@i915_selftest@live@requests.html
>     - {bat-mtlp-6}:       [PASS][3] -> [DMESG-FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13165/bat-mtlp-6/igt@i915_selftest@live@requests.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-mtlp-6/igt@i915_selftest@live@requests.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9008 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-rpls-2:         NOTRUN -> [SKIP][5] ([i915#7456])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-rpls-2/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@fbdev@read:
>     - bat-rpls-2:         NOTRUN -> [SKIP][6] ([i915#2582]) +4 similar issues
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-rpls-2/igt@fbdev@read.html
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - bat-rpls-2:         NOTRUN -> [SKIP][7] ([i915#4613]) +3 similar issues
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-rpls-2/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-rpls-2:         NOTRUN -> [SKIP][8] ([i915#3282])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-rpls-2/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_pm_backlight@basic-brightness:
>     - bat-rpls-2:         NOTRUN -> [SKIP][9] ([i915#7561])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-rpls-2/igt@i915_pm_backlight@basic-brightness.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-rpls-2:         NOTRUN -> [SKIP][10] ([i915#6621])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-rpls-2/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - bat-rpls-2:         NOTRUN -> [DMESG-FAIL][11] ([i915#4258] / [i915#7913])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - bat-rpls-2:         NOTRUN -> [ABORT][12] ([i915#6687])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   * igt@kms_busy@basic:
>     - bat-rpls-2:         NOTRUN -> [SKIP][13] ([i915#1845]) +14 similar issues
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-rpls-2/igt@kms_busy@basic.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - bat-rpls-2:         NOTRUN -> [SKIP][14] ([i915#7828]) +7 similar issues
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-rpls-2/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms:
>     - bat-rpls-2:         NOTRUN -> [SKIP][15] ([i915#3637]) +3 similar issues
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-rpls-2/igt@kms_flip@basic-flip-vs-dpms.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-rpls-2:         NOTRUN -> [SKIP][16] ([fdo#109285])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-rpls-2/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-rpls-2:         NOTRUN -> [SKIP][17] ([i915#1849])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-rpls-2/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - bat-dg2-11:         NOTRUN -> [SKIP][18] ([i915#1845] / [i915#5354]) +1 similar issue
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   * igt@kms_psr@sprite_plane_onoff:
>     - bat-rpls-2:         NOTRUN -> [SKIP][19] ([i915#1072]) +3 similar issues
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-rpls-2/igt@kms_psr@sprite_plane_onoff.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-rpls-2:         NOTRUN -> [SKIP][20] ([i915#3555] / [i915#4579])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-flip:
>     - bat-rpls-2:         NOTRUN -> [SKIP][21] ([fdo#109295] / [i915#1845] / [i915#3708])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-rpls-2/igt@prime_vgem@basic-fence-flip.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-rpls-2:         NOTRUN -> [SKIP][22] ([fdo#109295] / [i915#3708]) +2 similar issues
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-rpls-2/igt@prime_vgem@basic-fence-read.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@gt_engines:
>     - bat-atsm-1:         [FAIL][23] ([i915#6268]) -> [PASS][24]
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13165/bat-atsm-1/igt@i915_selftest@live@gt_engines.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-atsm-1/igt@i915_selftest@live@gt_engines.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:
>     - bat-dg2-8:          [FAIL][25] ([i915#7932]) -> [PASS][26]
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13165/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html
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
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
>   [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
>   [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
>   [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
>   [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7296 -> IGTPW_9008
> 
>   CI-20190529: 20190529
>   CI_DRM_13165: b5b59a92a8b9df8696f50cae4cea1635e5f8dc16 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9008: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/index.html
>   IGT_7296: f58eaf30c30c1cc9f00c8b5c596ee5c94d054198 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9008/index.html
