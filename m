Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1035854839486584198=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Date: Wed, 21 Sep 2022 07:52:58 -0000
Message-ID: <166374677805.11599.1070102101437822453@emeril.freedesktop.org>
References: <20220921061943.23329-1-karthik.b.s@intel.com>
In-Reply-To: <20220921061943.23329-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Falpha=5Fblend=3A_Convert_test_to_dynamic_=28rev2?=
 =?utf-8?q?=29?=
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

--===============1035854839486584198==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_alpha_blend: Convert test to dynamic (rev2)
URL   : https://patchwork.freedesktop.org/series/108500/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12163 -> IGTPW_7808
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/index.html

Participating hosts (42 -> 41)
------------------------------

  Additional (1): fi-tgl-u2 
  Missing    (2): fi-cfl-8109u fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_7808 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-tgl-u2:          NOTRUN -> [SKIP][1] ([i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-tgl-u2/igt@gem_huc_copy@huc-copy.html

  * igt@i915_selftest@live@gt_engines:
    - bat-dg1-5:          [PASS][2] -> [DMESG-FAIL][3] ([i915#4418])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12163/bat-dg1-5/igt@i915_selftest@live@gt_engines.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/bat-dg1-5/igt@i915_selftest@live@gt_engines.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-hsw-4770:        NOTRUN -> [SKIP][4] ([fdo#109271] / [fdo#111827])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][5] ([fdo#111827])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-rkl-11600/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-tgl-u2:          NOTRUN -> [SKIP][6] ([fdo#109284] / [fdo#111827]) +7 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-tgl-u2/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - fi-tgl-u2:          NOTRUN -> [SKIP][7] ([i915#4103])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-tgl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - fi-bsw-kefka:       [PASS][8] -> [FAIL][9] ([i915#6298])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12163/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-tgl-u2:          NOTRUN -> [SKIP][10] ([fdo#109285])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-tgl-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-tgl-u2:          NOTRUN -> [SKIP][11] ([i915#3555])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-tgl-u2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@runner@aborted:
    - bat-dg1-5:          NOTRUN -> [FAIL][12] ([i915#4312] / [i915#5257])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/bat-dg1-5/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - {bat-adlm-1}:       [DMESG-WARN][13] ([i915#2867]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12163/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-hsw-4770:        [DMESG-FAIL][15] -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12163/fi-hsw-4770/igt@i915_selftest@live@gt_heartbeat.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-hsw-4770/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][17] ([i915#4785]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12163/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-1}:       [DMESG-FAIL][19] ([i915#4983] / [i915#5828]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12163/bat-rpls-1/igt@i915_selftest@live@reset.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/bat-rpls-1/igt@i915_selftest@live@reset.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [INCOMPLETE][21] ([i915#5982]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12163/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5134]: https://gitlab.freedesktop.org/drm/intel/issues/5134
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5828]: https://gitlab.freedesktop.org/drm/intel/issues/5828
  [i915#5982]: https://gitlab.freedesktop.org/drm/intel/issues/5982
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6659 -> IGTPW_7808

  CI-20190529: 20190529
  CI_DRM_12163: 8a052348946d9ec1b368ddcc1d3db5f2fc486f75 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7808: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/index.html
  IGT_6659: 1becf700a737a7a98555a0cfbe8566355377afb2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_plane_alpha_blend@alpha-7efc
+igt@kms_plane_alpha_blend@alpha-basic
+igt@kms_plane_alpha_blend@alpha-opaque-fb
+igt@kms_plane_alpha_blend@alpha-transparent-fb
+igt@kms_plane_alpha_blend@constant-alpha-max
+igt@kms_plane_alpha_blend@constant-alpha-mid
+igt@kms_plane_alpha_blend@constant-alpha-min
+igt@kms_plane_alpha_blend@coverage-7efc
+igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant
-igt@kms_plane_alpha_blend@pipe-a-alpha-7efc
-igt@kms_plane_alpha_blend@pipe-a-alpha-basic
-igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb
-igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb
-igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max
-igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid
-igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min
-igt@kms_plane_alpha_blend@pipe-a-coverage-7efc
-igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant
-igt@kms_plane_alpha_blend@pipe-b-alpha-7efc
-igt@kms_plane_alpha_blend@pipe-b-alpha-basic
-igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb
-igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb
-igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max
-igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid
-igt@kms_plane_alpha_blend@pipe-b-constant-alpha-min
-igt@kms_plane_alpha_blend@pipe-b-coverage-7efc
-igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant
-igt@kms_plane_alpha_blend@pipe-c-alpha-7efc
-igt@kms_plane_alpha_blend@pipe-c-alpha-basic
-igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb
-igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb
-igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max
-igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid
-igt@kms_plane_alpha_blend@pipe-c-constant-alpha-min
-igt@kms_plane_alpha_blend@pipe-c-coverage-7efc
-igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant
-igt@kms_plane_alpha_blend@pipe-d-alpha-7efc
-igt@kms_plane_alpha_blend@pipe-d-alpha-basic
-igt@kms_plane_alpha_blend@pipe-d-alpha-opaque-fb
-igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb
-igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max
-igt@kms_plane_alpha_blend@pipe-d-constant-alpha-mid
-igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min
-igt@kms_plane_alpha_blend@pipe-d-coverage-7efc
-igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant
-igt@kms_plane_alpha_blend@pipe-e-alpha-7efc
-igt@kms_plane_alpha_blend@pipe-e-alpha-basic
-igt@kms_plane_alpha_blend@pipe-e-alpha-opaque-fb
-igt@kms_plane_alpha_blend@pipe-e-alpha-transparent-fb
-igt@kms_plane_alpha_blend@pipe-e-constant-alpha-max
-igt@kms_plane_alpha_blend@pipe-e-constant-alpha-mid
-igt@kms_plane_alpha_blend@pipe-e-constant-alpha-min
-igt@kms_plane_alpha_blend@pipe-e-coverage-7efc
-igt@kms_plane_alpha_blend@pipe-e-coverage-vs-premult-vs-constant
-igt@kms_plane_alpha_blend@pipe-f-alpha-7efc
-igt@kms_plane_alpha_blend@pipe-f-alpha-basic
-igt@kms_plane_alpha_blend@pipe-f-alpha-opaque-fb
-igt@kms_plane_alpha_blend@pipe-f-alpha-transparent-fb
-igt@kms_plane_alpha_blend@pipe-f-constant-alpha-max
-igt@kms_plane_alpha_blend@pipe-f-constant-alpha-mid
-igt@kms_plane_alpha_blend@pipe-f-constant-alpha-min
-igt@kms_plane_alpha_blend@pipe-f-coverage-7efc
-igt@kms_plane_alpha_blend@pipe-f-coverage-vs-premult-vs-constant

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/index.html

--===============1035854839486584198==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_alpha_blend: Convert test to dynamic (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/108500/">https://patchwork.freedesktop.org/series/108500/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12163 -&gt; IGTPW_7808</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Additional (1): fi-tgl-u2 <br />
  Missing    (2): fi-cfl-8109u fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7808 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-tgl-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12163/bat-dg1-5/igt@i915_selftest@live@gt_engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/bat-dg1-5/igt@i915_selftest@live@gt_engines.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-rkl-11600/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-tgl-u2/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-tgl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12163/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-tgl-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-tgl-u2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/bat-dg1-5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12163/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12163/fi-hsw-4770/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-hsw-4770/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12163/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12163/bat-rpls-1/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5828">i915#5828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12163/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5982">i915#5982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6659 -&gt; IGTPW_7808</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12163: 8a052348946d9ec1b368ddcc1d3db5f2fc486f75 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7808: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7808/index.html<br />
  IGT_6659: 1becf700a737a7a98555a0cfbe8566355377afb2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_plane_alpha_blend@alpha-7efc<br />
+igt@kms_plane_alpha_blend@alpha-basic<br />
+igt@kms_plane_alpha_blend@alpha-opaque-fb<br />
+igt@kms_plane_alpha_blend@alpha-transparent-fb<br />
+igt@kms_plane_alpha_blend@constant-alpha-max<br />
+igt@kms_plane_alpha_blend@constant-alpha-mid<br />
+igt@kms_plane_alpha_blend@constant-alpha-min<br />
+igt@kms_plane_alpha_blend@coverage-7efc<br />
+igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant<br />
-igt@kms_plane_alpha_blend@pipe-a-alpha-7efc<br />
-igt@kms_plane_alpha_blend@pipe-a-alpha-basic<br />
-igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb<br />
-igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb<br />
-igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max<br />
-igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid<br />
-igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min<br />
-igt@kms_plane_alpha_blend@pipe-a-coverage-7efc<br />
-igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant<br />
-igt@kms_plane_alpha_blend@pipe-b-alpha-7efc<br />
-igt@kms_plane_alpha_blend@pipe-b-alpha-basic<br />
-igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb<br />
-igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb<br />
-igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max<br />
-igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid<br />
-igt@kms_plane_alpha_blend@pipe-b-constant-alpha-min<br />
-igt@kms_plane_alpha_blend@pipe-b-coverage-7efc<br />
-igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant<br />
-igt@kms_plane_alpha_blend@pipe-c-alpha-7efc<br />
-igt@kms_plane_alpha_blend@pipe-c-alpha-basic<br />
-igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb<br />
-igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb<br />
-igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max<br />
-igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid<br />
-igt@kms_plane_alpha_blend@pipe-c-constant-alpha-min<br />
-igt@kms_plane_alpha_blend@pipe-c-coverage-7efc<br />
-igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant<br />
-igt@kms_plane_alpha_blend@pipe-d-alpha-7efc<br />
-igt@kms_plane_alpha_blend@pipe-d-alpha-basic<br />
-igt@kms_plane_alpha_blend@pipe-d-alpha-opaque-fb<br />
-igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb<br />
-igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max<br />
-igt@kms_plane_alpha_blend@pipe-d-constant-alpha-mid<br />
-igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min<br />
-igt@kms_plane_alpha_blend@pipe-d-coverage-7efc<br />
-igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant<br />
-igt@kms_plane_alpha_blend@pipe-e-alpha-7efc<br />
-igt@kms_plane_alpha_blend@pipe-e-alpha-basic<br />
-igt@kms_plane_alpha_blend@pipe-e-alpha-opaque-fb<br />
-igt@kms_plane_alpha_blend@pipe-e-alpha-transparent-fb<br />
-igt@kms_plane_alpha_blend@pipe-e-constant-alpha-max<br />
-igt@kms_plane_alpha_blend@pipe-e-constant-alpha-mid<br />
-igt@kms_plane_alpha_blend@pipe-e-constant-alpha-min<br />
-igt@kms_plane_alpha_blend@pipe-e-coverage-7efc<br />
-igt@kms_plane_alpha_blend@pipe-e-coverage-vs-premult-vs-constant<br />
-igt@kms_plane_alpha_blend@pipe-f-alpha-7efc<br />
-igt@kms_plane_alpha_blend@pipe-f-alpha-basic<br />
-igt@kms_plane_alpha_blend@pipe-f-alpha-opaque-fb<br />
-igt@kms_plane_alpha_blend@pipe-f-alpha-transparent-fb<br />
-igt@kms_plane_alpha_blend@pipe-f-constant-alpha-max<br />
-igt@kms_plane_alpha_blend@pipe-f-constant-alpha-mid<br />
-igt@kms_plane_alpha_blend@pipe-f-constant-alpha-min<br />
-igt@kms_plane_alpha_blend@pipe-f-coverage-7efc<br />
-igt@kms_plane_alpha_blend@pipe-f-coverage-vs-premult-vs-constant</p>

</body>
</html>

--===============1035854839486584198==--
