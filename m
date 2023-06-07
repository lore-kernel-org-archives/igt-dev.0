Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8CC10E1E9
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 17:02:16 +0000 (UTC)
Date: Wed, 7 Jun 2023 19:01:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230607170130.3lu2tbppxa5kuhye@kamilkon-desk1>
References: <20230605180745.40121-1-kamil.konieczny@linux.intel.com>
 <168608489992.22674.10273065571744772461@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168608489992.22674.10273065571744772461@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Dump_GPU_state_on_timeout?=
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

On 2023-06-06 at 20:54:59 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Dump GPU state on timeout
> URL   : https://patchwork.freedesktop.org/series/118881/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13232_full -> IGTPW_9107_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9107_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9107_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/index.html
> 
> Participating hosts (7 -> 6)
--------------------------- ^
This is quite the drop in number.

> ------------------------------
> 
>   Missing    (1): shard-dg1 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9107_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gen9_exec_parse@bb-large:
>     - shard-apl:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl3/igt@gen9_exec_parse@bb-large.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-apl4/igt@gen9_exec_parse@bb-large.html
>     - shard-glk:          [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-glk5/igt@gen9_exec_parse@bb-large.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-glk7/igt@gen9_exec_parse@bb-large.html

This is unrelated to change in runner (dump GPU state on timeout).
May you respin full runs ?

Regards,
Kamil

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@gem_mmap_offset@clear@smem0:
>     - {shard-rkl}:        [PASS][5] -> [ABORT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-rkl-6/igt@gem_mmap_offset@clear@smem0.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-rkl-3/igt@gem_mmap_offset@clear@smem0.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9107_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-apl:          [PASS][7] -> [FAIL][8] ([i915#2842])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][9] ([i915#2842])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_lmem_swapping@random:
>     - shard-glk:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#4613])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-glk9/igt@gem_lmem_swapping@random.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-apl:          [PASS][11] -> [TIMEOUT][12] ([i915#3778])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-apl3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>     - shard-glk:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#3886]) +1 similar issue
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-glk5/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
>     - shard-apl:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#3886]) +2 similar issues
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-apl1/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_ccs:
>     - shard-apl:          NOTRUN -> [SKIP][15] ([fdo#109271]) +30 similar issues
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-apl3/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_ccs.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-glk:          [PASS][16] -> [FAIL][17] ([i915#2346])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-apl:          [PASS][18] -> [ABORT][19] ([i915#180])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:
>     - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#2122])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-glk7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-glk:          NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#4579]) +2 similar issues
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-glk3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-hdmi-a-1:
>     - shard-snb:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#4579]) +10 similar issues
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-snb1/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-glk:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#658])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-glk9/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-apl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#4579])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-apl2/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-snb:          NOTRUN -> [SKIP][26] ([fdo#109271]) +40 similar issues
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-snb4/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@v3d/v3d_perfmon@create-perfmon-exceed:
>     - shard-glk:          NOTRUN -> [SKIP][27] ([fdo#109271]) +49 similar issues
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-glk1/igt@v3d/v3d_perfmon@create-perfmon-exceed.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@drm_fdinfo@idle@rcs0:
>     - {shard-rkl}:        [FAIL][28] ([i915#7742]) -> [PASS][29]
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-rkl-2/igt@drm_fdinfo@idle@rcs0.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-rkl-3/igt@drm_fdinfo@idle@rcs0.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-glk:          [FAIL][30] ([i915#2846]) -> [PASS][31]
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-glk8/igt@gem_exec_fair@basic-deadline.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-glk3/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [FAIL][32] ([i915#2842]) -> [PASS][33]
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-apl:          [FAIL][34] ([i915#2842]) -> [PASS][35]
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - {shard-rkl}:        [FAIL][36] ([i915#2842]) -> [PASS][37] +2 similar issues
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-rkl-6/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
>     - {shard-rkl}:        [SKIP][38] ([i915#1397]) -> [PASS][39] +2 similar issues
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-snb:          [DMESG-FAIL][40] ([i915#8319]) -> [PASS][41]
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-snb4/igt@i915_pm_rps@reset.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-snb6/igt@i915_pm_rps@reset.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
>     - shard-apl:          [ABORT][42] ([i915#180]) -> [PASS][43] +1 similar issue
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl4/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-apl3/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html
> 
>   * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
>     - shard-apl:          [FAIL][44] ([i915#1188]) -> [PASS][45]
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl2/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/shard-apl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
>   [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
>   [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
>   [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
>   [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
>   [i915#8311]: https://gitlab.freedesktop.org/drm/intel/issues/8311
>   [i915#8319]: https://gitlab.freedesktop.org/drm/intel/issues/8319
>   [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7319 -> IGTPW_9107
> 
>   CI-20190529: 20190529
>   CI_DRM_13232: 450d228e38403a48aa273ec1e22b463dc64aaae6 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9107: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/index.html
>   IGT_7319: 2e1bcd49944452b5f9516eecee48e1fa3ae6a636 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9107/index.html
