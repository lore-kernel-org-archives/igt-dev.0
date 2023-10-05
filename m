Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5117539766772822260=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Date: Thu, 05 Oct 2023 20:12:39 -0000
Message-ID: <169653675931.7515.14416596347074241343@emeril.freedesktop.org>
References: <20231002104846.21443-1-nirmoy.das@intel.com>
In-Reply-To: <20231002104846.21443-1-nirmoy.das@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/in?=
 =?utf-8?q?tel/gem=5Feio=3A_Skip_stress_test_on_BCS0_for_MTL_=28rev2=29?=
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

--===============5117539766772822260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/gem_eio: Skip stress test on BCS0 for MTL (rev2)
URL   : https://patchwork.freedesktop.org/series/124517/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7517_BAT -> XEIGTPW_9928_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_9928_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9928_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9928_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9928_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - bat-dg2-oem2:       [PASS][3] -> [SKIP][4] ([i915#2575]) +49 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [PASS][5] -> [FAIL][6] ([Intel XE#480]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][7] -> [SKIP][8] ([Intel XE#678]) +128 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_live_ktest@bo:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][9] ([Intel XE#722]) +3 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@xe_live_ktest@bo.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][10] -> [FAIL][11] ([Intel XE#681])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@xe_module_load@load.html

  
#### Possible fixes ####

  * igt@xe_exec_store@basic-store:
    - bat-adlp-7:         [FAIL][12] ([Intel XE#761]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-adlp-7/igt@xe_exec_store@basic-store.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-adlp-7/igt@xe_exec_store@basic-store.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [INCOMPLETE][14] ([Intel XE#764]) -> [SKIP][15] ([Intel XE#679])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][16] ([Intel XE#623]) -> [SKIP][17] ([i915#2575])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-oem2:       [SKIP][18] ([Intel XE#624]) -> [SKIP][19] ([i915#2575])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       [FAIL][20] ([Intel XE#609]) -> [SKIP][21] ([i915#2575]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][22] ([Intel XE#423]) -> [SKIP][23] ([Intel XE#678])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][24] ([i915#5274]) -> [SKIP][25] ([i915#2575])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [FAIL][26] ([Intel XE#608]) -> [SKIP][27] ([Intel XE#678])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][28] ([Intel XE#400]) -> [SKIP][29] ([i915#2575])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_psr@primary_page_flip:
    - bat-dg2-oem2:       [SKIP][30] ([i915#1072]) -> [SKIP][31] ([Intel XE#678]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html

  * igt@xe_compute@compute-square:
    - bat-dg2-oem2:       [SKIP][32] ([Intel XE#672]) -> [SKIP][33] ([Intel XE#678])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@xe_compute@compute-square.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@xe_compute@compute-square.html

  * igt@xe_exec_fault_mode@many-basic:
    - bat-dg2-oem2:       [SKIP][34] ([Intel XE#288]) -> [SKIP][35] ([Intel XE#678]) +17 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][36] ([Intel XE#255]) -> [SKIP][37] ([Intel XE#678])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
  [Intel XE#672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/672
  [Intel XE#678]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/678
  [Intel XE#679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/679
  [Intel XE#681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/681
  [Intel XE#722]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/722
  [Intel XE#761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/761
  [Intel XE#764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/764
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274


Build changes
-------------

  * IGT: IGT_7517 -> IGTPW_9928
  * Linux: xe-415-3d2b298aaf52e74d4e90470cd65de047362e4875 -> xe-416-be79dc2504eef9a437df54ca9aac316755e475cf

  IGTPW_9928: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9928/index.html
  IGT_7517: 8368e3ad3f9459a8f5cdd24f813ae802c1211029 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-415-3d2b298aaf52e74d4e90470cd65de047362e4875: 3d2b298aaf52e74d4e90470cd65de047362e4875
  xe-416-be79dc2504eef9a437df54ca9aac316755e475cf: be79dc2504eef9a437df54ca9aac316755e475cf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/index.html

--===============5117539766772822260==
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
<tr><td><b>Series:</b></td><td>tests/intel/gem_eio: Skip stress test on BCS0 for MTL (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124517/">https://patchwork.freedesktop.org/series/124517/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7517_BAT -&gt; XEIGTPW_9928_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_9928_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9928_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9928_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9928_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) +128 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@xe_live_ktest@bo.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/722">Intel XE#722</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/681">Intel XE#681</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_store@basic-store:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-adlp-7/igt@xe_exec_store@basic-store.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/761">Intel XE#761</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-adlp-7/igt@xe_exec_store@basic-store.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/764">Intel XE#764</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/679">Intel XE#679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/624">Intel XE#624</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/672">Intel XE#672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9928/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7517 -&gt; IGTPW_9928</li>
<li>Linux: xe-415-3d2b298aaf52e74d4e90470cd65de047362e4875 -&gt; xe-416-be79dc2504eef9a437df54ca9aac316755e475cf</li>
</ul>
<p>IGTPW_9928: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9928/index.html<br />
  IGT_7517: 8368e3ad3f9459a8f5cdd24f813ae802c1211029 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-415-3d2b298aaf52e74d4e90470cd65de047362e4875: 3d2b298aaf52e74d4e90470cd65de047362e4875<br />
  xe-416-be79dc2504eef9a437df54ca9aac316755e475cf: be79dc2504eef9a437df54ca9aac316755e475cf</p>

</body>
</html>

--===============5117539766772822260==--
