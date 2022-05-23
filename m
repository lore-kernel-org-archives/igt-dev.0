Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9126124468513150112=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Mon, 23 May 2022 11:56:21 -0000
Message-ID: <165330698137.9280.15873007956175670427@emeril.freedesktop.org>
References: <20220523080932.9326-1-swati2.sharma@intel.com>
In-Reply-To: <20220523080932.9326-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv2=2C1/2=5D_tests/kms=5Fplane=5Fscali?=
 =?utf-8?q?ng=3A_Fix_indentation?=
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

--===============9126124468513150112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] tests/kms_plane_scaling: Fix indentation
URL   : https://patchwork.freedesktop.org/series/104272/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11688 -> IGTPW_7154
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/index.html

Participating hosts (46 -> 45)
------------------------------

  Missing    (1): fi-icl-u2 

Known issues
------------

  Here are the changes found in IGTPW_7154 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-rkl-11600:       NOTRUN -> [INCOMPLETE][1] ([i915#5127] / [i915#5857])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@gem:
    - fi-pnv-d510:        NOTRUN -> [DMESG-FAIL][2] ([i915#4528])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/fi-pnv-d510/igt@i915_selftest@live@gem.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-6:          [PASS][3] -> [DMESG-FAIL][4] ([i915#4494] / [i915#4957])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11688/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
    - fi-snb-2600:        NOTRUN -> [INCOMPLETE][5] ([i915#3921])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-snb-2600:        NOTRUN -> [SKIP][6] ([fdo#109271]) +23 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/fi-snb-2600/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-snb-2600:        NOTRUN -> [SKIP][7] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/fi-snb-2600/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - bat-adlp-4:         [PASS][8] -> [DMESG-WARN][9] ([i915#3576])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11688/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-5:          [DMESG-FAIL][10] ([i915#4494] / [i915#4957]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11688/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/bat-dg1-5/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [DMESG-FAIL][12] ([i915#4528]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11688/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - fi-tgl-u2:          [DMESG-WARN][14] ([i915#402]) -> [PASS][15] +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11688/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-4:         [DMESG-WARN][16] ([i915#3576]) -> [PASS][17] +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11688/bat-adlp-4/igt@kms_flip@basic-plain-flip@a-edp1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/bat-adlp-4/igt@kms_flip@basic-plain-flip@a-edp1.html

  * igt@kms_force_connector_basic@force-connector-state:
    - {bat-adlp-6}:       [DMESG-WARN][18] ([i915#3576]) -> [PASS][19] +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11688/bat-adlp-6/igt@kms_force_connector_basic@force-connector-state.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/bat-adlp-6/igt@kms_force_connector_basic@force-connector-state.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [INCOMPLETE][20] ([i915#5982]) -> [FAIL][21] ([fdo#103375])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11688/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5127]: https://gitlab.freedesktop.org/drm/intel/issues/5127
  [i915#5857]: https://gitlab.freedesktop.org/drm/intel/issues/5857
  [i915#5982]: https://gitlab.freedesktop.org/drm/intel/issues/5982


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6485 -> IGTPW_7154

  CI-20190529: 20190529
  CI_DRM_11688: ecc81cedc1a4b62b69c748fd07ca880bd4c1cd3f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7154: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/index.html
  IGT_6485: 51663917b40d36086cc1c555ce4f67b22937694d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_plane_scaling@planes-scaler-unity-scaling
+igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5
+igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25
+igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75
+igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5
+igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25
+igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-75
+igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5
+igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25
+igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75
+igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers
+igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats
+igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation
+igt@kms_plane_scaling@plane-scaler-with-modifiers-unity-scaling
+igt@kms_plane_scaling@plane-scaler-with-pixel-format-unity-scaling
+igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling
+igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20
+igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25
+igt@kms_plane_scaling@plane-upscale-with-pixel-format-20x20
+igt@kms_plane_scaling@plane-upscale-with-pixel-format-factor-0-25
+igt@kms_plane_scaling@plane-upscale-with-rotation-20x20
+igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25
-igt@kms_plane_scaling@downscale-with-modifier-factor-0-5
-igt@kms_plane_scaling@downscale-with-modifier-factor-0-25
-igt@kms_plane_scaling@downscale-with-modifier-factor-0-75
-igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5
-igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25
-igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75
-igt@kms_plane_scaling@downscale-with-rotation-factor-0-5
-igt@kms_plane_scaling@downscale-with-rotation-factor-0-25
-igt@kms_plane_scaling@downscale-with-rotation-factor-0-75
-igt@kms_plane_scaling@planes-scaling-unity-scaling
-igt@kms_plane_scaling@scaler-with-clipping-clamping
-igt@kms_plane_scaling@scaler-with-modifier-unity-scaling
-igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling
-igt@kms_plane_scaling@scaler-with-rotation-unity-scaling
-igt@kms_plane_scaling@upscale-with-modifier-20x20
-igt@kms_plane_scaling@upscale-with-modifier-factor-0-25
-igt@kms_plane_scaling@upscale-with-pixel-format-20x20
-igt@kms_plane_scaling@upscale-with-pixel-format-factor-0-25
-igt@kms_plane_scaling@upscale-with-rotation-20x20
-igt@kms_plane_scaling@upscale-with-rotation-factor-0-25

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/index.html

--===============9126124468513150112==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/2] tests/kms_plane_scaling: Fix indentation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104272/">https://patchwork.freedesktop.org/series/104272/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11688 -&gt; IGTPW_7154</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/index.html</p>
<h2>Participating hosts (46 -&gt; 45)</h2>
<p>Missing    (1): fi-icl-u2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7154 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5127">i915#5127</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5857">i915#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/fi-pnv-d510/igt@i915_selftest@live@gem.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11688/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/fi-snb-2600/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/fi-snb-2600/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-edp1:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11688/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11688/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11688/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11688/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-edp1:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11688/bat-adlp-4/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/bat-adlp-4/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11688/bat-adlp-6/igt@kms_force_connector_basic@force-connector-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/bat-adlp-6/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11688/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5982">i915#5982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6485 -&gt; IGTPW_7154</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11688: ecc81cedc1a4b62b69c748fd07ca880bd4c1cd3f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7154: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7154/index.html<br />
  IGT_6485: 51663917b40d36086cc1c555ce4f67b22937694d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_plane_scaling@planes-scaler-unity-scaling<br />
+igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5<br />
+igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25<br />
+igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75<br />
+igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5<br />
+igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25<br />
+igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-75<br />
+igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5<br />
+igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25<br />
+igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75<br />
+igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers<br />
+igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats<br />
+igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation<br />
+igt@kms_plane_scaling@plane-scaler-with-modifiers-unity-scaling<br />
+igt@kms_plane_scaling@plane-scaler-with-pixel-format-unity-scaling<br />
+igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling<br />
+igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20<br />
+igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25<br />
+igt@kms_plane_scaling@plane-upscale-with-pixel-format-20x20<br />
+igt@kms_plane_scaling@plane-upscale-with-pixel-format-factor-0-25<br />
+igt@kms_plane_scaling@plane-upscale-with-rotation-20x20<br />
+igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25<br />
-igt@kms_plane_scaling@downscale-with-modifier-factor-0-5<br />
-igt@kms_plane_scaling@downscale-with-modifier-factor-0-25<br />
-igt@kms_plane_scaling@downscale-with-modifier-factor-0-75<br />
-igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5<br />
-igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25<br />
-igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75<br />
-igt@kms_plane_scaling@downscale-with-rotation-factor-0-5<br />
-igt@kms_plane_scaling@downscale-with-rotation-factor-0-25<br />
-igt@kms_plane_scaling@downscale-with-rotation-factor-0-75<br />
-igt@kms_plane_scaling@planes-scaling-unity-scaling<br />
-igt@kms_plane_scaling@scaler-with-clipping-clamping<br />
-igt@kms_plane_scaling@scaler-with-modifier-unity-scaling<br />
-igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling<br />
-igt@kms_plane_scaling@scaler-with-rotation-unity-scaling<br />
-igt@kms_plane_scaling@upscale-with-modifier-20x20<br />
-igt@kms_plane_scaling@upscale-with-modifier-factor-0-25<br />
-igt@kms_plane_scaling@upscale-with-pixel-format-20x20<br />
-igt@kms_plane_scaling@upscale-with-pixel-format-factor-0-25<br />
-igt@kms_plane_scaling@upscale-with-rotation-20x20<br />
-igt@kms_plane_scaling@upscale-with-rotation-factor-0-25</p>

</body>
</html>

--===============9126124468513150112==--
