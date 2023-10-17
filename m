Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1168717637535154954=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Date: Tue, 17 Oct 2023 14:54:08 -0000
Message-ID: <169755444827.14379.5872219250234274848@emeril.freedesktop.org>
References: <20231017140530.547-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20231017140530.547-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Add_copy?=
 =?utf-8?q?_basic_test_to_exercise_blt_commands_=28rev8=29?=
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

--===============1168717637535154954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add copy basic test to exercise blt commands (rev8)
URL   : https://patchwork.freedesktop.org/series/122615/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7543_BAT -> XEIGTPW_10018_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10018_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10018_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10018_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         NOTRUN -> [DMESG-FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10018_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-adlp-7:         NOTRUN -> [FAIL][2] ([Intel XE#609]) +2 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         NOTRUN -> [SKIP][3] ([i915#6077]) +33 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-adlp-7:         NOTRUN -> [FAIL][4] ([i915#2346])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-atsm-2:         NOTRUN -> [SKIP][5] ([Intel XE#782]) +5 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][6] ([Intel XE#784])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         NOTRUN -> [SKIP][7] ([Intel XE#423])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-atsm-2:         NOTRUN -> [SKIP][8] ([Intel XE#541]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         NOTRUN -> [FAIL][9] ([Intel XE#480]) +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:
    - bat-dg2-oem2:       [PASS][10] -> [FAIL][11] ([Intel XE#480]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7543/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-atsm-2:         NOTRUN -> [SKIP][12] ([Intel XE#540]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][13] ([Intel XE#783])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-atsm-2:         NOTRUN -> [SKIP][14] ([i915#1836]) +6 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][15] ([Intel XE#780])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@cursor_plane_move:
    - bat-atsm-2:         NOTRUN -> [SKIP][16] ([Intel XE#535]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@kms_psr@cursor_plane_move.html

  * igt@xe_compute@compute-square:
    - bat-atsm-2:         NOTRUN -> [SKIP][17] ([Intel XE#672])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@xe_compute@compute-square.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-adlp-7:         NOTRUN -> [SKIP][18] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_exec_fault_mode@twice-userptr:
    - bat-adlp-7:         NOTRUN -> [SKIP][19] ([Intel XE#288]) +17 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         NOTRUN -> [SKIP][20] ([Intel XE#288]) +17 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_huc_copy@huc_copy:
    - bat-atsm-2:         NOTRUN -> [SKIP][21] ([Intel XE#255])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@migrate:
    - bat-adlp-7:         NOTRUN -> [INCOMPLETE][22] ([Intel XE#753])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-adlp-7/igt@xe_live_ktest@migrate.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         NOTRUN -> [SKIP][23] ([Intel XE#263])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-adlp-7/igt@xe_mmap@vram.html

  
#### Possible fixes ####

  * igt@xe_module_load@load:
    - bat-atsm-2:         [INCOMPLETE][24] -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7543/bat-atsm-2/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#263]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/263
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/535
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/541
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/672
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#753]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/753
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7543 -> IGTPW_10018

  IGTPW_10018: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/index.html
  IGT_7543: 688f12831f876590e084e9b13b4d5ab85fe13d51 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-439-cbcd3e95647ff14d508d1a42dce785693446c7f2: cbcd3e95647ff14d508d1a42dce785693446c7f2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/index.html

--===============1168717637535154954==
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
<tr><td><b>Series:</b></td><td>Add copy basic test to exercise blt commands (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122615/">https://patchwork.freedesktop.org/series/122615/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7543_BAT -&gt; XEIGTPW_10018_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10018_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10018_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10018_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10018_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>
<p>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>)</p>
</li>
<li>
<p>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/541">Intel XE#541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7543/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/535">Intel XE#535</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/672">Intel XE#672</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@migrate:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-adlp-7/igt@xe_live_ktest@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/753">Intel XE#753</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/263">Intel XE#263</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7543/bat-atsm-2/igt@xe_module_load@load.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10018/bat-atsm-2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7543 -&gt; IGTPW_10018</li>
</ul>
<p>IGTPW_10018: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/index.html<br />
  IGT_7543: 688f12831f876590e084e9b13b4d5ab85fe13d51 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-439-cbcd3e95647ff14d508d1a42dce785693446c7f2: cbcd3e95647ff14d508d1a42dce785693446c7f2</p>

</body>
</html>

--===============1168717637535154954==--
