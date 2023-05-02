Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7105213979273898320=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Date: Tue, 02 May 2023 10:59:47 -0000
Message-ID: <168302518731.18870.5526246753192739812@emeril.freedesktop.org>
References: <20230502085307.3341569-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20230502085307.3341569-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?xe/xe=5Fcreate=3A_Exercise_oversized_object_detection?=
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

--===============7105213979273898320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe/xe_create: Exercise oversized object detection
URL   : https://patchwork.freedesktop.org/series/117191/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13078_full -> IGTPW_8895_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/index.html

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): shard-rkl0 

Known issues
------------

  Here are the changes found in IGTPW_8895_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [PASS][1] -> [FAIL][2] ([i915#2842])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-glk4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-glk8/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [PASS][3] -> [ABORT][4] ([i915#5566])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-glk2/igt@gen9_exec_parse@allowed-single.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-glk7/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][5] -> [SKIP][6] ([fdo#109271])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-apl7/igt@i915_pm_dc@dc9-dpms.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-apl3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-snb:          [PASS][7] -> [ABORT][8] ([i915#4528] / [i915#8213])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-snb5/igt@i915_suspend@basic-s2idle-without-i915.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-snb5/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][9] ([fdo#109271]) +87 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-snb5/igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1.html

  
#### Possible fixes ####

  * igt@gem_barrier_race@remote-request@rcs0:
    - {shard-rkl}:        [ABORT][10] ([i915#7461] / [i915#8211]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-rkl-7/igt@gem_barrier_race@remote-request@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-rkl-3/igt@gem_barrier_race@remote-request@rcs0.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          [FAIL][12] ([i915#2846]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-apl1/igt@gem_exec_fair@basic-deadline.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-apl3/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          [FAIL][14] ([i915#2846]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-glk7/igt@gem_exec_fair@basic-deadline.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-glk1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][16] ([i915#2842]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - {shard-rkl}:        [FAIL][18] ([i915#2842]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_spin_batch@engines@rcs0:
    - shard-apl:          [FAIL][20] ([i915#2898]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-apl3/igt@gem_spin_batch@engines@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-apl3/igt@gem_spin_batch@engines@rcs0.html

  * igt@i915_module_load@reload-no-display:
    - shard-snb:          [ABORT][22] ([i915#4528] / [i915#8393]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-snb4/igt@i915_module_load@reload-no-display.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-snb4/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
    - {shard-dg1}:        [FAIL][24] ([i915#3591]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html

  * igt@i915_pm_rps@waitboost:
    - {shard-dg1}:        [FAIL][26] ([i915#8229]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-dg1-18/igt@i915_pm_rps@waitboost.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-dg1-17/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][28] ([i915#2346]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@single-bo@pipe-b:
    - {shard-rkl}:        [INCOMPLETE][30] ([i915#8011]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-rkl-7/igt@kms_cursor_legacy@single-bo@pipe-b.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-rkl-6/igt@kms_cursor_legacy@single-bo@pipe-b.html

  * igt@perf_pmu@idle@rcs0:
    - {shard-rkl}:        [FAIL][32] ([i915#4349]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-rkl-4/igt@perf_pmu@idle@rcs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-rkl-7/igt@perf_pmu@idle@rcs0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2898]: https://gitlab.freedesktop.org/drm/intel/issues/2898
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
  [i915#8211]: https://gitlab.freedesktop.org/drm/intel/issues/8211
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8229]: https://gitlab.freedesktop.org/drm/intel/issues/8229
  [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
  [i915#8393]: https://gitlab.freedesktop.org/drm/intel/issues/8393


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7277 -> IGTPW_8895
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_13078: 59c67d4cf8b737c0c25649091a1a22809d6a06f8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8895: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/index.html
  IGT_7277: 1cb3507f3ff28d11bd5cfabcde576fe78ddab571 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/index.html

--===============7105213979273898320==
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
<tr><td><b>Series:</b></td><td>tests/xe/xe_create: Exercise oversized object detection</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/117191/">https://patchwork.freedesktop.org/series/117191/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13078_full -&gt; IGTPW_8895_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/index.html</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): shard-rkl0 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8895_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-glk4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-glk8/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-glk2/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-glk7/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-apl7/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-apl3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-snb5/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-snb5/igt@i915_suspend@basic-s2idle-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-snb5/igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +87 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_barrier_race@remote-request@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-rkl-7/igt@gem_barrier_race@remote-request@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8211">i915#8211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-rkl-3/igt@gem_barrier_race@remote-request@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-apl1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-apl3/igt@gem_exec_fair@basic-deadline.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-glk7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-glk1/igt@gem_exec_fair@basic-deadline.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@engines@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-apl3/igt@gem_spin_batch@engines@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2898">i915#2898</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-apl3/igt@gem_spin_batch@engines@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-snb4/igt@i915_module_load@reload-no-display.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8393">i915#8393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-snb4/igt@i915_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-dg1-18/igt@i915_pm_rps@waitboost.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8229">i915#8229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-dg1-17/igt@i915_pm_rps@waitboost.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-rkl-7/igt@kms_cursor_legacy@single-bo@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-rkl-6/igt@kms_cursor_legacy@single-bo@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@idle@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/shard-rkl-4/igt@perf_pmu@idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/shard-rkl-7/igt@perf_pmu@idle@rcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7277 -&gt; IGTPW_8895</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13078: 59c67d4cf8b737c0c25649091a1a22809d6a06f8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8895: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8895/index.html<br />
  IGT_7277: 1cb3507f3ff28d11bd5cfabcde576fe78ddab571 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============7105213979273898320==--
