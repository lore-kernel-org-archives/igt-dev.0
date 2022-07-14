Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0930036151053331980=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 14 Jul 2022 16:51:36 -0000
Message-ID: <165781749685.7512.16156015289531359223@emeril.freedesktop.org>
References: <20220714154911.689566-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220714154911.689566-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcolor=5Fchamelium=3A_Convert_tests_to_dynamic?=
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

--===============0930036151053331980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_color_chamelium: Convert tests to dynamic
URL   : https://patchwork.freedesktop.org/series/106359/
State : success

== Summary ==

CI Bug Log - changes from IGT_6583 -> IGTPW_7523
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/index.html

Participating hosts (42 -> 42)
------------------------------

  Additional (1): bat-rpls-1 
  Missing    (1): bat-dg2-9 

Known issues
------------

  Here are the changes found in IGTPW_7523 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gem:
    - fi-pnv-d510:        NOTRUN -> [DMESG-FAIL][1] ([i915#4528])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/fi-pnv-d510/igt@i915_selftest@live@gem.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-bsw-n3050:       [PASS][2] -> [DMESG-FAIL][3] ([i915#5334])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6583/fi-bsw-n3050/igt@i915_selftest@live@gt_heartbeat.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/fi-bsw-n3050/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_lrc:
    - fi-rkl-11600:       [PASS][4] -> [DMESG-FAIL][5] ([i915#2373])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6583/fi-rkl-11600/igt@i915_selftest@live@gt_lrc.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/fi-rkl-11600/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-g3258:       [PASS][6] -> [INCOMPLETE][7] ([i915#4785])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6583/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
    - bat-dg1-5:          [PASS][8] -> [DMESG-FAIL][9] ([i915#4494] / [i915#4957])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6583/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/bat-dg1-5/igt@i915_selftest@live@hangcheck.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-kefka:       [PASS][10] -> [FAIL][11] ([i915#6298])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6583/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  * igt@runner@aborted:
    - fi-hsw-g3258:       NOTRUN -> [FAIL][12] ([fdo#109271] / [i915#4312] / [i915#6246])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/fi-hsw-g3258/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - {bat-adlm-1}:       [DMESG-WARN][13] -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6583/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-8809g:       [DMESG-FAIL][15] ([i915#5334]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6583/fi-kbl-8809g/igt@i915_selftest@live@gt_heartbeat.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/fi-kbl-8809g/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [DMESG-FAIL][17] ([i915#4528]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6583/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/fi-pnv-d510/igt@i915_selftest@live@requests.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5153]: https://gitlab.freedesktop.org/drm/intel/issues/5153
  [i915#5278]: https://gitlab.freedesktop.org/drm/intel/issues/5278
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#6106]: https://gitlab.freedesktop.org/drm/intel/issues/6106
  [i915#6246]: https://gitlab.freedesktop.org/drm/intel/issues/6246
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6583 -> IGTPW_7523

  CI-20190529: 20190529
  CI_DRM_11893: 932d346f9726fae3af81aba5e4362b428f6e3c56 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7523: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/index.html
  IGT_6583: 333ca8f6be43044d71ecf15d37a3e88e7a3ce821 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_color_chamelium@ctm-0-25
+igt@kms_color_chamelium@ctm-0-50
+igt@kms_color_chamelium@ctm-0-75
+igt@kms_color_chamelium@ctm-blue-to-red
+igt@kms_color_chamelium@ctm-green-to-red
+igt@kms_color_chamelium@ctm-limited-range
+igt@kms_color_chamelium@ctm-max
+igt@kms_color_chamelium@ctm-negative
+igt@kms_color_chamelium@ctm-red-to-blue
+igt@kms_color_chamelium@degamma
+igt@kms_color_chamelium@gamma
-igt@kms_color_chamelium@pipe-a-ctm-0-5
-igt@kms_color_chamelium@pipe-a-ctm-0-25
-igt@kms_color_chamelium@pipe-a-ctm-0-75
-igt@kms_color_chamelium@pipe-a-ctm-blue-to-red
-igt@kms_color_chamelium@pipe-a-ctm-green-to-red
-igt@kms_color_chamelium@pipe-a-ctm-limited-range
-igt@kms_color_chamelium@pipe-a-ctm-max
-igt@kms_color_chamelium@pipe-a-ctm-negative
-igt@kms_color_chamelium@pipe-a-ctm-red-to-blue
-igt@kms_color_chamelium@pipe-a-degamma
-igt@kms_color_chamelium@pipe-a-gamma
-igt@kms_color_chamelium@pipe-b-ctm-0-5
-igt@kms_color_chamelium@pipe-b-ctm-0-25
-igt@kms_color_chamelium@pipe-b-ctm-0-75
-igt@kms_color_chamelium@pipe-b-ctm-blue-to-red
-igt@kms_color_chamelium@pipe-b-ctm-green-to-red
-igt@kms_color_chamelium@pipe-b-ctm-limited-range
-igt@kms_color_chamelium@pipe-b-ctm-max
-igt@kms_color_chamelium@pipe-b-ctm-negative
-igt@kms_color_chamelium@pipe-b-ctm-red-to-blue
-igt@kms_color_chamelium@pipe-b-degamma
-igt@kms_color_chamelium@pipe-b-gamma
-igt@kms_color_chamelium@pipe-c-ctm-0-5
-igt@kms_color_chamelium@pipe-c-ctm-0-25
-igt@kms_color_chamelium@pipe-c-ctm-0-75
-igt@kms_color_chamelium@pipe-c-ctm-blue-to-red
-igt@kms_color_chamelium@pipe-c-ctm-green-to-red
-igt@kms_color_chamelium@pipe-c-ctm-limited-range
-igt@kms_color_chamelium@pipe-c-ctm-max
-igt@kms_color_chamelium@pipe-c-ctm-negative
-igt@kms_color_chamelium@pipe-c-ctm-red-to-blue
-igt@kms_color_chamelium@pipe-c-degamma
-igt@kms_color_chamelium@pipe-c-gamma
-igt@kms_color_chamelium@pipe-d-ctm-0-5
-igt@kms_color_chamelium@pipe-d-ctm-0-25
-igt@kms_color_chamelium@pipe-d-ctm-0-75
-igt@kms_color_chamelium@pipe-d-ctm-blue-to-red
-igt@kms_color_chamelium@pipe-d-ctm-green-to-red
-igt@kms_color_chamelium@pipe-d-ctm-limited-range
-igt@kms_color_chamelium@pipe-d-ctm-max
-igt@kms_color_chamelium@pipe-d-ctm-negative
-igt@kms_color_chamelium@pipe-d-ctm-red-to-blue
-igt@kms_color_chamelium@pipe-d-degamma
-igt@kms_color_chamelium@pipe-d-gamma
-igt@kms_color_chamelium@pipe-e-ctm-0-5
-igt@kms_color_chamelium@pipe-e-ctm-0-25
-igt@kms_color_chamelium@pipe-e-ctm-0-75
-igt@kms_color_chamelium@pipe-e-ctm-blue-to-red
-igt@kms_color_chamelium@pipe-e-ctm-green-to-red
-igt@kms_color_chamelium@pipe-e-ctm-limited-range
-igt@kms_color_chamelium@pipe-e-ctm-max
-igt@kms_color_chamelium@pipe-e-ctm-negative
-igt@kms_color_chamelium@pipe-e-ctm-red-to-blue
-igt@kms_color_chamelium@pipe-e-degamma
-igt@kms_color_chamelium@pipe-e-gamma
-igt@kms_color_chamelium@pipe-f-ctm-0-5
-igt@kms_color_chamelium@pipe-f-ctm-0-25
-igt@kms_color_chamelium@pipe-f-ctm-0-75
-igt@kms_color_chamelium@pipe-f-ctm-blue-to-red
-igt@kms_color_chamelium@pipe-f-ctm-green-to-red
-igt@kms_color_chamelium@pipe-f-ctm-limited-range
-igt@kms_color_chamelium@pipe-f-ctm-max
-igt@kms_color_chamelium@pipe-f-ctm-negative
-igt@kms_color_chamelium@pipe-f-ctm-red-to-blue
-igt@kms_color_chamelium@pipe-f-degamma
-igt@kms_color_chamelium@pipe-f-gamma

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/index.html

--===============0930036151053331980==
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
<tr><td><b>Series:</b></td><td>tests/kms_color_chamelium: Convert tests to dynamic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/106359/">https://patchwork.freedesktop.org/series/106359/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6583 -&gt; IGTPW_7523</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/index.html</p>
<h2>Participating hosts (42 -&gt; 42)</h2>
<p>Additional (1): bat-rpls-1 <br />
  Missing    (1): bat-dg2-9 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7523 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/fi-pnv-d510/igt@i915_selftest@live@gem.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6583/fi-bsw-n3050/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/fi-bsw-n3050/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6583/fi-rkl-11600/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/fi-rkl-11600/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2373">i915#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6583/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6583/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6583/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/fi-hsw-g3258/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6246">i915#6246</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6583/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6583/fi-kbl-8809g/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/fi-kbl-8809g/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6583/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6583 -&gt; IGTPW_7523</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11893: 932d346f9726fae3af81aba5e4362b428f6e3c56 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7523: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7523/index.html<br />
  IGT_6583: 333ca8f6be43044d71ecf15d37a3e88e7a3ce821 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_color_chamelium@ctm-0-25<br />
+igt@kms_color_chamelium@ctm-0-50<br />
+igt@kms_color_chamelium@ctm-0-75<br />
+igt@kms_color_chamelium@ctm-blue-to-red<br />
+igt@kms_color_chamelium@ctm-green-to-red<br />
+igt@kms_color_chamelium@ctm-limited-range<br />
+igt@kms_color_chamelium@ctm-max<br />
+igt@kms_color_chamelium@ctm-negative<br />
+igt@kms_color_chamelium@ctm-red-to-blue<br />
+igt@kms_color_chamelium@degamma<br />
+igt@kms_color_chamelium@gamma<br />
-igt@kms_color_chamelium@pipe-a-ctm-0-5<br />
-igt@kms_color_chamelium@pipe-a-ctm-0-25<br />
-igt@kms_color_chamelium@pipe-a-ctm-0-75<br />
-igt@kms_color_chamelium@pipe-a-ctm-blue-to-red<br />
-igt@kms_color_chamelium@pipe-a-ctm-green-to-red<br />
-igt@kms_color_chamelium@pipe-a-ctm-limited-range<br />
-igt@kms_color_chamelium@pipe-a-ctm-max<br />
-igt@kms_color_chamelium@pipe-a-ctm-negative<br />
-igt@kms_color_chamelium@pipe-a-ctm-red-to-blue<br />
-igt@kms_color_chamelium@pipe-a-degamma<br />
-igt@kms_color_chamelium@pipe-a-gamma<br />
-igt@kms_color_chamelium@pipe-b-ctm-0-5<br />
-igt@kms_color_chamelium@pipe-b-ctm-0-25<br />
-igt@kms_color_chamelium@pipe-b-ctm-0-75<br />
-igt@kms_color_chamelium@pipe-b-ctm-blue-to-red<br />
-igt@kms_color_chamelium@pipe-b-ctm-green-to-red<br />
-igt@kms_color_chamelium@pipe-b-ctm-limited-range<br />
-igt@kms_color_chamelium@pipe-b-ctm-max<br />
-igt@kms_color_chamelium@pipe-b-ctm-negative<br />
-igt@kms_color_chamelium@pipe-b-ctm-red-to-blue<br />
-igt@kms_color_chamelium@pipe-b-degamma<br />
-igt@kms_color_chamelium@pipe-b-gamma<br />
-igt@kms_color_chamelium@pipe-c-ctm-0-5<br />
-igt@kms_color_chamelium@pipe-c-ctm-0-25<br />
-igt@kms_color_chamelium@pipe-c-ctm-0-75<br />
-igt@kms_color_chamelium@pipe-c-ctm-blue-to-red<br />
-igt@kms_color_chamelium@pipe-c-ctm-green-to-red<br />
-igt@kms_color_chamelium@pipe-c-ctm-limited-range<br />
-igt@kms_color_chamelium@pipe-c-ctm-max<br />
-igt@kms_color_chamelium@pipe-c-ctm-negative<br />
-igt@kms_color_chamelium@pipe-c-ctm-red-to-blue<br />
-igt@kms_color_chamelium@pipe-c-degamma<br />
-igt@kms_color_chamelium@pipe-c-gamma<br />
-igt@kms_color_chamelium@pipe-d-ctm-0-5<br />
-igt@kms_color_chamelium@pipe-d-ctm-0-25<br />
-igt@kms_color_chamelium@pipe-d-ctm-0-75<br />
-igt@kms_color_chamelium@pipe-d-ctm-blue-to-red<br />
-igt@kms_color_chamelium@pipe-d-ctm-green-to-red<br />
-igt@kms_color_chamelium@pipe-d-ctm-limited-range<br />
-igt@kms_color_chamelium@pipe-d-ctm-max<br />
-igt@kms_color_chamelium@pipe-d-ctm-negative<br />
-igt@kms_color_chamelium@pipe-d-ctm-red-to-blue<br />
-igt@kms_color_chamelium@pipe-d-degamma<br />
-igt@kms_color_chamelium@pipe-d-gamma<br />
-igt@kms_color_chamelium@pipe-e-ctm-0-5<br />
-igt@kms_color_chamelium@pipe-e-ctm-0-25<br />
-igt@kms_color_chamelium@pipe-e-ctm-0-75<br />
-igt@kms_color_chamelium@pipe-e-ctm-blue-to-red<br />
-igt@kms_color_chamelium@pipe-e-ctm-green-to-red<br />
-igt@kms_color_chamelium@pipe-e-ctm-limited-range<br />
-igt@kms_color_chamelium@pipe-e-ctm-max<br />
-igt@kms_color_chamelium@pipe-e-ctm-negative<br />
-igt@kms_color_chamelium@pipe-e-ctm-red-to-blue<br />
-igt@kms_color_chamelium@pipe-e-degamma<br />
-igt@kms_color_chamelium@pipe-e-gamma<br />
-igt@kms_color_chamelium@pipe-f-ctm-0-5<br />
-igt@kms_color_chamelium@pipe-f-ctm-0-25<br />
-igt@kms_color_chamelium@pipe-f-ctm-0-75<br />
-igt@kms_color_chamelium@pipe-f-ctm-blue-to-red<br />
-igt@kms_color_chamelium@pipe-f-ctm-green-to-red<br />
-igt@kms_color_chamelium@pipe-f-ctm-limited-range<br />
-igt@kms_color_chamelium@pipe-f-ctm-max<br />
-igt@kms_color_chamelium@pipe-f-ctm-negative<br />
-igt@kms_color_chamelium@pipe-f-ctm-red-to-blue<br />
-igt@kms_color_chamelium@pipe-f-degamma<br />
-igt@kms_color_chamelium@pipe-f-gamma</p>

</body>
</html>

--===============0930036151053331980==--
