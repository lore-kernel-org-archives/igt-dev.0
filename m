Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1441B10E1F6
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Dec 2022 21:32:41 +0000 (UTC)
Date: Thu, 8 Dec 2022 22:32:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y5JX9dSUjMSIxhcf@kamilkon-desk1>
References: <20221207165248.226867-1-matthew.auld@intel.com>
 <167044170902.14515.13990656288913791596@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <167044170902.14515.13990656288913791596@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv3=2C1/2=5D_lib/dmabuf=5Fsync=5Ffile?=
 =?utf-8?q?=3A_move_common_stuff_into_lib?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2022-12-07 at 19:35:09 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,v3,1/2] lib/dmabuf_sync_file: move common stuff into lib
> URL   : https://patchwork.freedesktop.org/series/111738/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12478 -> IGTPW_8213
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8213 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8213, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8213/index.html
> 
> Participating hosts (39 -> 41)
> ------------------------------
> 
>   Additional (4): bat-rpls-2 fi-bwr-2160 fi-tgl-dsi fi-bsw-nick 
>   Missing    (2): fi-hsw-4770 fi-rkl-11600 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8213:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@guc_multi_lrc:
>     - fi-kbl-soraka:      [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12478/fi-kbl-soraka/igt@i915_selftest@live@guc_multi_lrc.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8213/fi-kbl-soraka/igt@i915_selftest@live@guc_multi_lrc.html
> 

This is unrelated to the changes in gem_exec_balancer and lib.

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@i915_selftest@live@gt_lrc:
>     - {fi-tgl-dsi}:       NOTRUN -> [DMESG-FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8213/fi-tgl-dsi/igt@i915_selftest@live@gt_lrc.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2:
>     - {bat-dg2-11}:       [PASS][4] -> [FAIL][5] +1 similar issue
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12478/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8213/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8213 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - fi-bsw-nick:        NOTRUN -> [SKIP][6] ([fdo#109271]) +39 similar issues
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8213/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - fi-kbl-soraka:      [PASS][7] -> [DMESG-FAIL][8] ([i915#5334])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12478/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8213/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@i915_selftest@live@gt_lrc:
>     - bat-dg1-5:          [PASS][9] -> [INCOMPLETE][10] ([i915#4983])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12478/bat-dg1-5/igt@i915_selftest@live@gt_lrc.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8213/bat-dg1-5/igt@i915_selftest@live@gt_lrc.html
> 
>   * igt@kms_chamelium@hdmi-hpd-fast:
>     - fi-bsw-nick:        NOTRUN -> [SKIP][11] ([fdo#109271] / [fdo#111827]) +8 similar issues
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8213/fi-bsw-nick/igt@kms_chamelium@hdmi-hpd-fast.html
> 
>   * igt@kms_psr@primary_mmap_gtt:
>     - fi-bwr-2160:        NOTRUN -> [SKIP][12] ([fdo#109271]) +54 similar issues
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8213/fi-bwr-2160/igt@kms_psr@primary_mmap_gtt.html
> 
>   * igt@runner@aborted:
>     - bat-dg1-5:          NOTRUN -> [FAIL][13] ([i915#4312])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8213/bat-dg1-5/igt@runner@aborted.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
>     - fi-bsw-kefka:       [FAIL][14] ([i915#6298]) -> [PASS][15]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12478/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8213/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
> 
>   * igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-1:
>     - {bat-adlp-9}:       [FAIL][16] -> [PASS][17] +3 similar issues
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12478/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-1.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8213/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_module_load@load:
>     - fi-bsw-n3050:       [DMESG-WARN][18] ([i915#1982] / [i915#7430]) -> [DMESG-WARN][19] ([i915#7430])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12478/fi-bsw-n3050/igt@i915_module_load@load.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8213/fi-bsw-n3050/igt@i915_module_load@load.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6559]: https://gitlab.freedesktop.org/drm/intel/issues/6559
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6816]: https://gitlab.freedesktop.org/drm/intel/issues/6816
>   [i915#6818]: https://gitlab.freedesktop.org/drm/intel/issues/6818
>   [i915#6949]: https://gitlab.freedesktop.org/drm/intel/issues/6949
>   [i915#7058]: https://gitlab.freedesktop.org/drm/intel/issues/7058
>   [i915#7346]: https://gitlab.freedesktop.org/drm/intel/issues/7346
>   [i915#7430]: https://gitlab.freedesktop.org/drm/intel/issues/7430
>   [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
>   [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7085 -> IGTPW_8213
> 
>   CI-20190529: 20190529
>   CI_DRM_12478: f5d2f00fe4daf65ecd6634dec39fbf66b44535e3 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8213: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8213/index.html
>   IGT_7085: 11af20de3877b23a244b816453bfc41d83591a15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> Testlist changes
> ----------------
> 
> +igt@gem_exec_balancer@parallel-dmabuf-import-out-fence
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8213/index.html
