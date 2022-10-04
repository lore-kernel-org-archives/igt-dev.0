Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB1510E2B3
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Oct 2022 09:36:02 +0000 (UTC)
Date: Tue, 4 Oct 2022 12:35:34 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org,
 Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Message-ID: <Yzv+ZtYpyYzNQPcF@platvala-desk.ger.corp.intel.com>
References: <20220928193602.523414-1-jfree@freebsd.org>
 <166440761417.594.1150045796389464560@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166440761417.594.1150045796389464560@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgUmVwbGFj?=
 =?utf-8?q?ed_get=5Fcurrent=5Fdir=5Fname=28=29_with_getcwd=28=29_for_BSD_c?=
 =?utf-8?q?ompatibility_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jake@technologyfriends.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 28, 2022 at 11:26:54PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Replaced get_current_dir_name() with getcwd() for BSD compatibility (rev2)
> URL   : https://patchwork.freedesktop.org/series/108701/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12197 -> IGTPW_7876
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_7876 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_7876, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/index.html
> 
> Participating hosts (45 -> 42)
> ------------------------------
> 
>   Additional (1): fi-rkl-guc 
>   Missing    (4): fi-hsw-4770 fi-bdw-samus fi-icl-u2 bat-adlp-6 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_7876:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-snb-2600:        [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
> 


Lakshmi, false positive here.


-- 
Petri Latvala




>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@i915_pm_rpm@basic-rte:
>     - {bat-rplp-1}:       [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/bat-rplp-1/igt@i915_pm_rpm@basic-rte.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/bat-rplp-1/igt@i915_pm_rpm@basic-rte.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_7876 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_suspend@basic-s3@smem:
>     - fi-rkl-11600:       NOTRUN -> [INCOMPLETE][5] ([i915#6179])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-rkl-guc:         NOTRUN -> [SKIP][6] ([i915#4613]) +3 similar issues
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-rkl-guc/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_tiled_pread_basic:
>     - fi-rkl-guc:         NOTRUN -> [SKIP][7] ([i915#3282])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-rkl-guc/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_pm_backlight@basic-brightness:
>     - fi-rkl-guc:         NOTRUN -> [SKIP][8] ([i915#3012])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - fi-rkl-guc:         NOTRUN -> [SKIP][9] ([i915#6621])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-rkl-guc/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-hsw-g3258:       [PASS][10] -> [INCOMPLETE][11] ([i915#3303] / [i915#4785])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@i915_selftest@live@late_gt_pm:
>     - fi-cfl-8109u:       [PASS][12] -> [DMESG-WARN][13] ([i915#5904]) +35 similar issues
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - fi-cfl-8109u:       [PASS][14] -> [DMESG-WARN][15] ([i915#5904] / [i915#62]) +3 similar issues
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   * igt@kms_chamelium@common-hpd-after-suspend:
>     - bat-dg1-5:          NOTRUN -> [SKIP][16] ([fdo#111827])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/bat-dg1-5/igt@kms_chamelium@common-hpd-after-suspend.html
> 
>   * igt@kms_chamelium@hdmi-crc-fast:
>     - fi-rkl-guc:         NOTRUN -> [SKIP][17] ([fdo#111827]) +8 similar issues
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-rkl-guc/igt@kms_chamelium@hdmi-crc-fast.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
>     - fi-rkl-guc:         NOTRUN -> [SKIP][18] ([i915#4103])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
> 
>   * igt@kms_flip@basic-plain-flip@c-dp2:
>     - fi-cfl-8109u:       [PASS][19] -> [DMESG-WARN][20] ([i915#165])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@c-dp2.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-cfl-8109u/igt@kms_flip@basic-plain-flip@c-dp2.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - fi-rkl-guc:         NOTRUN -> [SKIP][21] ([fdo#109285])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-rkl-guc/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - fi-cfl-8109u:       [PASS][22] -> [DMESG-WARN][23] ([i915#165] / [i915#62]) +13 similar issues
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - bat-dg1-5:          NOTRUN -> [SKIP][24] ([i915#4078])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/bat-dg1-5/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_psr@sprite_plane_onoff:
>     - fi-rkl-guc:         NOTRUN -> [SKIP][25] ([i915#1072]) +3 similar issues
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-rkl-guc/igt@kms_psr@sprite_plane_onoff.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - fi-rkl-guc:         NOTRUN -> [SKIP][26] ([i915#3555] / [i915#4098])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-rkl-guc/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-userptr:
>     - fi-rkl-guc:         NOTRUN -> [SKIP][27] ([fdo#109295] / [i915#3301] / [i915#3708])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-rkl-guc/igt@prime_vgem@basic-userptr.html
>     - fi-tgl-u2:          NOTRUN -> [SKIP][28] ([fdo#109295] / [i915#3301])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-tgl-u2/igt@prime_vgem@basic-userptr.html
> 
>   * igt@prime_vgem@basic-write:
>     - fi-rkl-guc:         NOTRUN -> [SKIP][29] ([fdo#109295] / [i915#3291] / [i915#3708]) +2 similar issues
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-rkl-guc/igt@prime_vgem@basic-write.html
> 
>   * igt@runner@aborted:
>     - fi-hsw-g3258:       NOTRUN -> [FAIL][30] ([fdo#109271] / [i915#4312])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-hsw-g3258/igt@runner@aborted.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@gt_engines:
>     - bat-dg1-5:          [INCOMPLETE][31] ([i915#4418]) -> [PASS][32]
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/bat-dg1-5/igt@i915_selftest@live@gt_engines.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/bat-dg1-5/igt@i915_selftest@live@gt_engines.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2:
>     - {bat-dg2-11}:       [FAIL][33] ([i915#6818]) -> [PASS][34]
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - fi-rkl-11600:       [INCOMPLETE][35] ([i915#5982]) -> [FAIL][36] ([fdo#103375])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
>   [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
>   [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
>   [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
>   [i915#5836]: https://gitlab.freedesktop.org/drm/intel/issues/5836
>   [i915#5904]: https://gitlab.freedesktop.org/drm/intel/issues/5904
>   [i915#5982]: https://gitlab.freedesktop.org/drm/intel/issues/5982
>   [i915#6179]: https://gitlab.freedesktop.org/drm/intel/issues/6179
>   [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6818]: https://gitlab.freedesktop.org/drm/intel/issues/6818
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6668 -> IGTPW_7876
> 
>   CI-20190529: 20190529
>   CI_DRM_12197: cafa326de8e7860d45639e61bf66ec9c218207b1 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_7876: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/index.html
>   IGT_6668: 5f29c9369550164b35b65baaaeba4b370f434cf1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7876/index.html
