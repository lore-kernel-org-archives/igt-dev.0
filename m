Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7545421396142205373=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Tue, 06 Jun 2023 21:25:08 -0000
Message-ID: <168608670870.22671.11273467866590699544@emeril.freedesktop.org>
References: <20230605183612.41463-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230605183612.41463-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliOiBD?=
 =?utf-8?q?ancel_all_outstanding_requests_at_the_start_of_a_test?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============7545421396142205373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib: Cancel all outstanding requests at the start of a test
URL   : https://patchwork.freedesktop.org/series/118885/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13232_full -> IGTPW_9109_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/index.html

Participating hosts (7 -> 6)
------------------------------

  Missing    (1): shard-dg1 

Known issues
------------

  Here are the changes found in IGTPW_9109_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][1] -> [FAIL][2] ([i915#2842])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#4613])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-glk9/igt@gem_lmem_swapping@random.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#3886]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-glk9/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#3886]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-apl1/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_ccs:
    - shard-apl:          NOTRUN -> [SKIP][6] ([fdo#109271]) +31 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-apl1/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_ccs.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-snb:          [PASS][7] -> [SKIP][8] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-snb5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-snb2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#4767])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#79])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-glk:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#4579]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-b-hdmi-a-1:
    - shard-snb:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#4579]) +7 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-snb1/igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-b-hdmi-a-1.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-glk:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#658])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-glk2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-apl:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#4579])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-apl3/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-snb:          NOTRUN -> [SKIP][17] ([fdo#109271]) +38 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-snb6/igt@kms_tv_load_detect@load-detect.html

  * igt@perf_pmu@module-unload:
    - shard-snb:          [PASS][18] -> [ABORT][19] ([i915#4528])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-snb1/igt@perf_pmu@module-unload.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-snb5/igt@perf_pmu@module-unload.html

  * igt@v3d/v3d_perfmon@create-perfmon-exceed:
    - shard-glk:          NOTRUN -> [SKIP][20] ([fdo#109271]) +49 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-glk8/igt@v3d/v3d_perfmon@create-perfmon-exceed.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - {shard-rkl}:        [FAIL][21] ([i915#7742]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          [FAIL][23] ([i915#2846]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl3/igt@gem_exec_fair@basic-deadline.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-apl3/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          [FAIL][25] ([i915#2846]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-glk8/igt@gem_exec_fair@basic-deadline.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-glk2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][27] ([i915#2842]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [FAIL][29] ([i915#2842]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - {shard-rkl}:        [FAIL][31] ([i915#2842]) -> [PASS][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-rkl-6/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@i915_pm_dc@dc6-dpms:
    - {shard-tglu}:       [FAIL][33] ([i915#3989] / [i915#454]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-tglu-10/igt@i915_pm_dc@dc6-dpms.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - {shard-rkl}:        [SKIP][35] ([i915#1397]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-rkl-3/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [DMESG-FAIL][37] ([i915#8319]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-snb4/igt@i915_pm_rps@reset.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-snb6/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
    - shard-apl:          [ABORT][39] ([i915#180]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl4/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-apl7/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [FAIL][41] ([i915#2346]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
    - shard-glk:          [FAIL][43] ([i915#2346]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@single-bo@pipe-b:
    - {shard-rkl}:        [INCOMPLETE][45] ([i915#8011]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-rkl-7/igt@kms_cursor_legacy@single-bo@pipe-b.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-rkl-6/igt@kms_cursor_legacy@single-bo@pipe-b.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
    - shard-apl:          [FAIL][47] ([i915#1188]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl2/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-apl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#5099]: https://gitlab.freedesktop.org/drm/intel/issues/5099
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8319]: https://gitlab.freedesktop.org/drm/intel/issues/8319
  [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
  [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7319 -> IGTPW_9109

  CI-20190529: 20190529
  CI_DRM_13232: 450d228e38403a48aa273ec1e22b463dc64aaae6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9109: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/index.html
  IGT_7319: 2e1bcd49944452b5f9516eecee48e1fa3ae6a636 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/index.html

--===============7545421396142205373==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>lib: Cancel all outstanding requests at the start of a test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/118885/">https://patchwork.freedesktop.org/series/118885/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13232_full -&gt; IGTPW_9109_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/index.html</p>
<h2>Participating hosts (7 -&gt; 6)</h2>
<p>Missing    (1): shard-dg1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9109_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-glk9/igt@gem_lmem_swapping@random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-glk9/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-apl1/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-apl1/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-snb5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-snb2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-snb1/igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-glk2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-apl3/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-snb6/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +38 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-snb1/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-snb5/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@create-perfmon-exceed:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-glk8/igt@v3d/v3d_perfmon@create-perfmon-exceed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +49 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-apl3/igt@gem_exec_fair@basic-deadline.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-glk8/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-glk2/igt@gem_exec_fair@basic-deadline.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-rkl-6/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-tglu-10/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-rkl-3/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-snb4/igt@i915_pm_rps@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8319">i915#8319</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-snb6/igt@i915_pm_rps@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl4/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-apl7/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-rkl-7/igt@kms_cursor_legacy@single-bo@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-rkl-6/igt@kms_cursor_legacy@single-bo@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13232/shard-apl2/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/shard-apl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7319 -&gt; IGTPW_9109</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13232: 450d228e38403a48aa273ec1e22b463dc64aaae6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9109: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9109/index.html<br />
  IGT_7319: 2e1bcd49944452b5f9516eecee48e1fa3ae6a636 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7545421396142205373==--
