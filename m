Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8682400058416969796=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Mon, 08 May 2023 05:53:26 -0000
Message-ID: <168352520611.22734.4618095994949360051@emeril.freedesktop.org>
References: <20230508034605.20177-1-nidhi1.gupta@intel.com>
In-Reply-To: <20230508034605.20177-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fsequence=3A_Modify_the_vblank_verification_condition?=
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

--===============8682400058416969796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_sequence: Modify the vblank verification condition
URL   : https://patchwork.freedesktop.org/series/117438/
State : success

== Summary ==

CI Bug Log - changes from IGT_7282_full -> IGTPW_8927_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/index.html

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): shard-rkl0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8927_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a1:
    - {shard-tglu}:       [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-tglu-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-tglu-10/igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a1.html

  
Known issues
------------

  Here are the changes found in IGTPW_8927_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@close-race:
    - shard-glk:          [PASS][3] -> [ABORT][4] ([i915#6016])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-glk2/igt@gem_busy@close-race.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-glk4/igt@gem_busy@close-race.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#2842])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2122]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#79])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][11] ([fdo#109271]) +31 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-snb7/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-b-vga-1.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - {shard-rkl}:        [ABORT][12] ([i915#5507]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-rkl-4/igt@device_reset@unbind-reset-rebind.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-rkl-2/igt@device_reset@unbind-reset-rebind.html
    - {shard-tglu}:       [ABORT][14] ([i915#5507]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-tglu-5/igt@device_reset@unbind-reset-rebind.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-tglu-8/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_ctx_freq@sysfs:
    - {shard-dg1}:        [FAIL][16] ([i915#6786]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-dg1-16/igt@gem_ctx_freq@sysfs.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-dg1-17/igt@gem_ctx_freq@sysfs.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][18] ([i915#2842]) -> [PASS][19] +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_parallel@engines@fds:
    - shard-glk:          [DMESG-WARN][20] ([i915#118]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-glk6/igt@gem_exec_parallel@engines@fds.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-glk2/igt@gem_exec_parallel@engines@fds.html

  * igt@i915_module_load@reload-with-fault-injection:
    - {shard-dg1}:        [DMESG-WARN][22] ([i915#8420]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-dg1-15/igt@i915_module_load@reload-with-fault-injection.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-dg1-15/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - {shard-dg1}:        [FAIL][24] ([i915#3591]) -> [PASS][25] +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - {shard-rkl}:        [SKIP][26] ([i915#1397]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-rkl-3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][28] ([i915#2346]) -> [PASS][29] +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [FAIL][30] ([i915#2346]) -> [PASS][31] +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - {shard-dg1}:        [FAIL][32] ([i915#5234]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-dg1-18/igt@perf_pmu@all-busy-idle-check-all.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-dg1-15/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@busy-idle-check-all@vecs0:
    - {shard-dg1}:        [FAIL][34] ([i915#4521]) -> [PASS][35] +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-dg1-14/igt@perf_pmu@busy-idle-check-all@vecs0.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-dg1-18/igt@perf_pmu@busy-idle-check-all@vecs0.html

  * igt@perf_pmu@render-node-busy-idle@vcs0:
    - {shard-dg1}:        [FAIL][36] ([i915#4349]) -> [PASS][37] +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-dg1-17/igt@perf_pmu@render-node-busy-idle@vcs0.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-dg1-16/igt@perf_pmu@render-node-busy-idle@vcs0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4521]: https://gitlab.freedesktop.org/drm/intel/issues/4521
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5251]: https://gitlab.freedesktop.org/drm/intel/issues/5251
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5507]: https://gitlab.freedesktop.org/drm/intel/issues/5507
  [i915#6016]: https://gitlab.freedesktop.org/drm/intel/issues/6016
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6786]: https://gitlab.freedesktop.org/drm/intel/issues/6786
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8420]: https://gitlab.freedesktop.org/drm/intel/issues/8420


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7282 -> IGTPW_8927

  CI-20190529: 20190529
  CI_DRM_13116: b34e363a43006fbfcdd34c40a774a939b5361865 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8927: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/index.html
  IGT_7282: e824c355829dd1e85c8014a0f6938a12c27b58dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/index.html

--===============8682400058416969796==
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
<tr><td><b>Series:</b></td><td>tests/kms_sequence: Modify the vblank verification condition</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/117438/">https://patchwork.freedesktop.org/series/117438/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7282_full -&gt; IGTPW_8927_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/index.html</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): shard-rkl0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8927_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a1:<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-tglu-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-tglu-10/igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8927_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_busy@close-race:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-glk2/igt@gem_busy@close-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-glk4/igt@gem_busy@close-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6016">i915#6016</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-snb7/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-b-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +31 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>
<p>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-rkl-4/igt@device_reset@unbind-reset-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5507">i915#5507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-rkl-2/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
<li>
<p>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-tglu-5/igt@device_reset@unbind-reset-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5507">i915#5507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-tglu-8/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-dg1-16/igt@gem_ctx_freq@sysfs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6786">i915#6786</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-dg1-17/igt@gem_ctx_freq@sysfs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-glk6/igt@gem_exec_parallel@engines@fds.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-glk2/igt@gem_exec_parallel@engines@fds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-dg1-15/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8420">i915#8420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-dg1-15/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-rkl-3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-dg1-18/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5234">i915#5234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-dg1-15/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vecs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-dg1-14/igt@perf_pmu@busy-idle-check-all@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4521">i915#4521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-dg1-18/igt@perf_pmu@busy-idle-check-all@vecs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle@vcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7282/shard-dg1-17/igt@perf_pmu@render-node-busy-idle@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/shard-dg1-16/igt@perf_pmu@render-node-busy-idle@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7282 -&gt; IGTPW_8927</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13116: b34e363a43006fbfcdd34c40a774a939b5361865 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8927: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8927/index.html<br />
  IGT_7282: e824c355829dd1e85c8014a0f6938a12c27b58dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8682400058416969796==--
