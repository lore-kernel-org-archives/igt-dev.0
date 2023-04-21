Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2289989540937414153=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anna Karas" <anna.karas@intel.com>
Date: Fri, 21 Apr 2023 05:28:35 -0000
Message-ID: <168205491583.5825.14862730646666539321@emeril.freedesktop.org>
References: <20230420191454.497237-1-anna.karas@intel.com>
In-Reply-To: <20230420191454.497237-1-anna.karas@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL3hl?=
 =?utf-8?q?=5Fgpu=3A_Introduce_xe=5Fgpu_library?=
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

--===============2289989540937414153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe_gpu: Introduce xe_gpu library
URL   : https://patchwork.freedesktop.org/series/116776/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13035_full -> IGTPW_8834_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/index.html

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8834_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-flip-vs-fences:
    - {shard-dg1}:        NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - {shard-tglu}:       [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-tglu-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-tglu-7/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  
Known issues
------------

  Here are the changes found in IGTPW_8834_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          [PASS][4] -> [FAIL][5] ([i915#2846])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-apl4/igt@gem_exec_fair@basic-deadline.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-apl4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][6] -> [FAIL][7] ([i915#2842])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][8] -> [FAIL][9] ([i915#2346])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-snb:          NOTRUN -> [SKIP][10] ([fdo#109271]) +54 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-snb6/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][11] ([i915#5465]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@pipe-c-accuracy-idle:
    - shard-glk:          [PASS][12] -> [FAIL][13] ([i915#43])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-glk4/igt@kms_vblank@pipe-c-accuracy-idle.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-glk9/igt@kms_vblank@pipe-c-accuracy-idle.html

  * igt@perf@stress-open-close@0-rcs0:
    - shard-glk:          [PASS][14] -> [ABORT][15] ([i915#5213])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-glk9/igt@perf@stress-open-close@0-rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-glk4/igt@perf@stress-open-close@0-rcs0.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - {shard-rkl}:        [FAIL][16] ([i915#7742]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [FAIL][18] ([i915#2842]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_suspend@basic-s4-devices@smem:
    - {shard-tglu}:       [ABORT][20] ([i915#7975]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices@smem.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-tglu-9/igt@gem_exec_suspend@basic-s4-devices@smem.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - {shard-rkl}:        [SKIP][22] ([i915#1397]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-rkl-3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [INCOMPLETE][24] ([i915#7790]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-snb1/igt@i915_pm_rps@reset.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-snb2/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-apl:          [DMESG-FAIL][26] ([i915#5334]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-apl6/igt@i915_selftest@live@gt_heartbeat.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-apl2/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - {shard-rkl}:        [FAIL][28] ([i915#3743]) -> [PASS][29] +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-rkl-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-rkl-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][30] ([i915#2346]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
    - shard-apl:          [FAIL][32] ([i915#2346]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - {shard-rkl}:        [INCOMPLETE][34] ([i915#8011]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-rkl-7/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-rkl-4/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@perf_pmu@idle@rcs0:
    - {shard-rkl}:        [FAIL][36] ([i915#4349]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-rkl-4/igt@perf_pmu@idle@rcs0.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-rkl-2/igt@perf_pmu@idle@rcs0.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [FAIL][38] ([i915#4275]) -> [SKIP][39] ([fdo#109271])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-apl6/igt@i915_pm_dc@dc9-dpms.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-apl6/igt@i915_pm_dc@dc9-dpms.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4275]: https://gitlab.freedesktop.org/drm/intel/issues/4275
  [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5431]: https://gitlab.freedesktop.org/drm/intel/issues/5431
  [i915#5465]: https://gitlab.freedesktop.org/drm/intel/issues/5465
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7790]: https://gitlab.freedesktop.org/drm/intel/issues/7790
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
  [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8304]: https://gitlab.freedesktop.org/drm/intel/issues/8304


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7263 -> IGTPW_8834
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_13035: 182419213bd7d88fead18eb0830855b675b093d7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8834: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/index.html
  IGT_7263: a6bd8f415c4ec41b5a014c7db47e46c81ffd0074 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/index.html

--===============2289989540937414153==
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
<tr><td><b>Series:</b></td><td>lib/xe_gpu: Introduce xe_gpu library</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/116776/">https://patchwork.freedesktop.org/series/116776/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13035_full -&gt; IGTPW_8834_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/index.html</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8834_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-tglu-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-tglu-7/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8834_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-apl4/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-apl4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-snb6/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +54 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5465">i915#5465</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-accuracy-idle:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-glk4/igt@kms_vblank@pipe-c-accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-glk9/igt@kms_vblank@pipe-c-accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/43">i915#43</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close@0-rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-glk9/igt@perf@stress-open-close@0-rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-glk4/igt@perf@stress-open-close@0-rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5213">i915#5213</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@smem:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-tglu-9/igt@gem_exec_suspend@basic-s4-devices@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-rkl-3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-snb1/igt@i915_pm_rps@reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7790">i915#7790</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-snb2/igt@i915_pm_rps@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-apl6/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-apl2/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-rkl-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-rkl-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-rkl-7/igt@kms_cursor_legacy@forked-move@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-rkl-4/igt@kms_cursor_legacy@forked-move@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@idle@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-rkl-4/igt@perf_pmu@idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-rkl-2/igt@perf_pmu@idle@rcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_dc@dc9-dpms:<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13035/shard-apl6/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4275">i915#4275</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/shard-apl6/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7263 -&gt; IGTPW_8834</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13035: 182419213bd7d88fead18eb0830855b675b093d7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8834: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8834/index.html<br />
  IGT_7263: a6bd8f415c4ec41b5a014c7db47e46c81ffd0074 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============2289989540937414153==--
