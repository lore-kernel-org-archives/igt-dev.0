Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21E310E280
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Oct 2023 07:31:36 +0000 (UTC)
Date: Tue, 17 Oct 2023 09:31:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231017073132.hiyo3vc4etxp7zrx@kamilkon-desk.igk.intel.com>
References: <20231016205805.86100-1-hersenxs.wu@amd.com>
 <169749941228.13509.12418730900475202489@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169749941228.13509.12418730900475202489@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=2Ci-g-t=5D_tests/kms=5Fcursor=5Fcrc=3A_Fi?=
 =?utf-8?q?x_cursor_crop_on_AMD_gpu?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 Hersen Wu <hersenxs.wu@amd.com>, SanjuX Marikkar <sanjux.marikkar@intel.com>,
 RavitejaX Veesam <ravitejax.veesam@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

below regression is not related to kms_cursor_crc,
could you supress it and respin tests ?

Regards,
Kamil

On 2023-10-16 at 23:36:52 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/2,i-g-t] tests/kms_cursor_crc: Fix cursor crop on AMD gpu
> URL   : https://patchwork.freedesktop.org/series/125202/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13763 -> IGTPW_10012
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10012 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10012, please notify your bug team (lgci.bug.filing@intel.com) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/index.html
> 
> Participating hosts (33 -> 33)
> ------------------------------
> 
>   Additional (2): bat-dg2-9 fi-kbl-guc 
>   Missing    (2): fi-apl-guc bat-jsl-3 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10012:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@fbdev@read:
>     - fi-kbl-soraka:      [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13763/fi-kbl-soraka/igt@fbdev@read.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/fi-kbl-soraka/igt@fbdev@read.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10012 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@fbdev@info:
>     - fi-kbl-guc:         NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1849])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/fi-kbl-guc/igt@fbdev@info.html
> 
>   * igt@gem_exec_suspend@basic-s0@smem:
>     - bat-dg2-9:          NOTRUN -> [INCOMPLETE][4] ([i915#9275])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
> 
>   * igt@gem_exec_suspend@basic-s3@lmem0:
>     - bat-atsm-1:         NOTRUN -> [DMESG-WARN][5] ([i915#8841]) +4 other tests dmesg-warn
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-atsm-1/igt@gem_exec_suspend@basic-s3@lmem0.html
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - fi-kbl-guc:         NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#4613]) +3 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/fi-kbl-guc/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@gem_mmap@basic:
>     - bat-dg2-9:          NOTRUN -> [SKIP][7] ([i915#4083])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-dg2-9/igt@gem_mmap@basic.html
> 
>   * igt@gem_mmap_gtt@basic:
>     - bat-dg2-9:          NOTRUN -> [SKIP][8] ([i915#4077]) +2 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-dg2-9/igt@gem_mmap_gtt@basic.html
> 
>   * igt@gem_render_tiled_blits@basic:
>     - bat-dg2-9:          NOTRUN -> [SKIP][9] ([i915#4079]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-dg2-9/igt@gem_render_tiled_blits@basic.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-dg2-9:          NOTRUN -> [SKIP][10] ([i915#6621])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-dg2-9/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - bat-atsm-1:         NOTRUN -> [SKIP][11] ([i915#6645])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-atsm-1/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-dg2-9:          NOTRUN -> [SKIP][12] ([i915#5190])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - bat-dg2-9:          NOTRUN -> [SKIP][13] ([i915#4215] / [i915#5190])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>     - bat-dg2-9:          NOTRUN -> [SKIP][14] ([i915#4212]) +6 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
> 
>   * igt@kms_addfb_basic@tile-pitch-mismatch:
>     - bat-dg2-9:          NOTRUN -> [SKIP][15] ([i915#4212] / [i915#5608])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-dg2-9/igt@kms_addfb_basic@tile-pitch-mismatch.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-dg2-9:          NOTRUN -> [SKIP][16] ([i915#4103] / [i915#4213] / [i915#5608]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
>     - fi-kbl-guc:         NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#1845]) +8 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms@b-dp6:
>     - bat-adlp-11:        [PASS][18] -> [DMESG-WARN][19] ([i915#4309])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13763/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@b-dp6.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@b-dp6.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-dg2-9:          NOTRUN -> [SKIP][20] ([fdo#109285])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-dg2-9:          NOTRUN -> [SKIP][21] ([i915#5274])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - fi-kbl-guc:         NOTRUN -> [FAIL][22] ([IGT#3])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - fi-kbl-guc:         NOTRUN -> [SKIP][23] ([fdo#109271]) +25 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/fi-kbl-guc/igt@kms_pipe_crc_basic@suspend-read-crc.html
>     - bat-atsm-1:         NOTRUN -> [SKIP][24] ([i915#1836])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-atsm-1/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_psr@sprite_plane_onoff:
>     - bat-dg2-9:          NOTRUN -> [SKIP][25] ([i915#1072]) +3 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-dg2-9/igt@kms_psr@sprite_plane_onoff.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-dg2-9:          NOTRUN -> [SKIP][26] ([i915#3555] / [i915#4098])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-flip:
>     - bat-dg2-9:          NOTRUN -> [SKIP][27] ([i915#3708])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html
> 
>   * igt@prime_vgem@basic-fence-mmap:
>     - bat-dg2-9:          NOTRUN -> [SKIP][28] ([i915#3708] / [i915#4077]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-dg2-9:          NOTRUN -> [SKIP][29] ([i915#3291] / [i915#3708]) +2 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-dg2-9/igt@prime_vgem@basic-write.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@gt_lrc:
>     - bat-atsm-1:         [INCOMPLETE][30] -> [PASS][31]
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13763/bat-atsm-1/igt@i915_selftest@live@gt_lrc.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/bat-atsm-1/igt@i915_selftest@live@gt_lrc.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
>   [i915#4309]: https://gitlab.freedesktop.org/drm/intel/issues/4309
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
>   [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
>   [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7541 -> IGTPW_10012
> 
>   CI-20190529: 20190529
>   CI_DRM_13763: 67bce9faa651e4e14107ac8cc29e690d780685f6 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10012: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/index.html
>   IGT_7541: fcddb77c3f8a77020f7f3b2660a66cae27cfaa2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10012/index.html
