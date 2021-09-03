Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6955189503385640419=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Sep 2021 17:25:15 -0000
Message-ID: <163068991538.21413.11979579440570694618@emeril.freedesktop.org>
References: <20210903162743.29851-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210903162743.29851-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcolor=3A_3D_LUT_tests_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============6955189503385640419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_color: 3D LUT tests (rev5)
URL   : https://patchwork.freedesktop.org/series/90165/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10550 -> IGTPW_6197
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6197/index.html

Known issues
------------

  Here are the changes found in IGTPW_6197 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-kbl-soraka:      [PASS][1] -> [INCOMPLETE][2] ([i915#155])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10550/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6197/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-icl-y:           [DMESG-FAIL][3] ([i915#1993]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10550/fi-icl-y/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6197/fi-icl-y/igt@i915_selftest@live@execlists.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-kbl-7500u:       [FAIL][5] ([i915#3449]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10550/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6197/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html

  
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1993]: https://gitlab.freedesktop.org/drm/intel/issues/1993
  [i915#3449]: https://gitlab.freedesktop.org/drm/intel/issues/3449


Participating hosts (45 -> 39)
------------------------------

  Missing    (6): bat-adls-5 bat-dg1-5 fi-bsw-cyan bat-adlp-4 fi-bdw-samus bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6197 -> IGTPW_6197

  CI-20190529: 20190529
  CI_DRM_10550: 07f6ce3dba287a2aa8a62cdd3b7d46ea0676007f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6197: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6197/index.html
  IGT_6197: 40888f97a6ad219f4ed48a1830d0ef3c9617d006 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_color@pipe-a-gamma-lut-3d
+igt@kms_color@pipe-a-invalid-ctm-matrix-sizes
+igt@kms_color@pipe-a-invalid-degamma-lut-sizes
+igt@kms_color@pipe-a-invalid-gamma-lut-3d-sizes
+igt@kms_color@pipe-a-invalid-gamma-lut-sizes
+igt@kms_color@pipe-b-gamma-lut-3d
+igt@kms_color@pipe-b-invalid-ctm-matrix-sizes
+igt@kms_color@pipe-b-invalid-degamma-lut-sizes
+igt@kms_color@pipe-b-invalid-gamma-lut-3d-sizes
+igt@kms_color@pipe-b-invalid-gamma-lut-sizes
+igt@kms_color@pipe-c-gamma-lut-3d
+igt@kms_color@pipe-c-invalid-ctm-matrix-sizes
+igt@kms_color@pipe-c-invalid-degamma-lut-sizes
+igt@kms_color@pipe-c-invalid-gamma-lut-3d-sizes
+igt@kms_color@pipe-c-invalid-gamma-lut-sizes
+igt@kms_color@pipe-d-gamma-lut-3d
+igt@kms_color@pipe-d-invalid-ctm-matrix-sizes
+igt@kms_color@pipe-d-invalid-degamma-lut-sizes
+igt@kms_color@pipe-d-invalid-gamma-lut-3d-sizes
+igt@kms_color@pipe-d-invalid-gamma-lut-sizes
+igt@kms_color@pipe-e-gamma-lut-3d
+igt@kms_color@pipe-e-invalid-ctm-matrix-sizes
+igt@kms_color@pipe-e-invalid-degamma-lut-sizes
+igt@kms_color@pipe-e-invalid-gamma-lut-3d-sizes
+igt@kms_color@pipe-e-invalid-gamma-lut-sizes
+igt@kms_color@pipe-f-gamma-lut-3d
+igt@kms_color@pipe-f-invalid-ctm-matrix-sizes
+igt@kms_color@pipe-f-invalid-degamma-lut-sizes
+igt@kms_color@pipe-f-invalid-gamma-lut-3d-sizes
+igt@kms_color@pipe-f-invalid-gamma-lut-sizes
-igt@kms_color@pipe-invalid-ctm-matrix-sizes
-igt@kms_color@pipe-invalid-degamma-lut-sizes
-igt@kms_color@pipe-invalid-gamma-lut-sizes
-igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes
-igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes
-igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6197/index.html

--===============6955189503385640419==
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
<tr><td><b>Series:</b></td><td>tests/kms_color: 3D LUT tests (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90165/">https://patchwork.freedesktop.org/series/90165/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6197/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6197/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10550 -&gt; IGTPW_6197</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6197/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6197 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s0:<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10550/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6197/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10550/fi-icl-y/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1993">i915#1993</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6197/fi-icl-y/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10550/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3449">i915#3449</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6197/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (45 -&gt; 39)</h2>
<p>Missing    (6): bat-adls-5 bat-dg1-5 fi-bsw-cyan bat-adlp-4 fi-bdw-samus bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6197 -&gt; IGTPW_6197</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10550: 07f6ce3dba287a2aa8a62cdd3b7d46ea0676007f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6197: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6197/index.html<br />
  IGT_6197: 40888f97a6ad219f4ed48a1830d0ef3c9617d006 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_color@pipe-a-gamma-lut-3d<br />
+igt@kms_color@pipe-a-invalid-ctm-matrix-sizes<br />
+igt@kms_color@pipe-a-invalid-degamma-lut-sizes<br />
+igt@kms_color@pipe-a-invalid-gamma-lut-3d-sizes<br />
+igt@kms_color@pipe-a-invalid-gamma-lut-sizes<br />
+igt@kms_color@pipe-b-gamma-lut-3d<br />
+igt@kms_color@pipe-b-invalid-ctm-matrix-sizes<br />
+igt@kms_color@pipe-b-invalid-degamma-lut-sizes<br />
+igt@kms_color@pipe-b-invalid-gamma-lut-3d-sizes<br />
+igt@kms_color@pipe-b-invalid-gamma-lut-sizes<br />
+igt@kms_color@pipe-c-gamma-lut-3d<br />
+igt@kms_color@pipe-c-invalid-ctm-matrix-sizes<br />
+igt@kms_color@pipe-c-invalid-degamma-lut-sizes<br />
+igt@kms_color@pipe-c-invalid-gamma-lut-3d-sizes<br />
+igt@kms_color@pipe-c-invalid-gamma-lut-sizes<br />
+igt@kms_color@pipe-d-gamma-lut-3d<br />
+igt@kms_color@pipe-d-invalid-ctm-matrix-sizes<br />
+igt@kms_color@pipe-d-invalid-degamma-lut-sizes<br />
+igt@kms_color@pipe-d-invalid-gamma-lut-3d-sizes<br />
+igt@kms_color@pipe-d-invalid-gamma-lut-sizes<br />
+igt@kms_color@pipe-e-gamma-lut-3d<br />
+igt@kms_color@pipe-e-invalid-ctm-matrix-sizes<br />
+igt@kms_color@pipe-e-invalid-degamma-lut-sizes<br />
+igt@kms_color@pipe-e-invalid-gamma-lut-3d-sizes<br />
+igt@kms_color@pipe-e-invalid-gamma-lut-sizes<br />
+igt@kms_color@pipe-f-gamma-lut-3d<br />
+igt@kms_color@pipe-f-invalid-ctm-matrix-sizes<br />
+igt@kms_color@pipe-f-invalid-degamma-lut-sizes<br />
+igt@kms_color@pipe-f-invalid-gamma-lut-3d-sizes<br />
+igt@kms_color@pipe-f-invalid-gamma-lut-sizes<br />
-igt@kms_color@pipe-invalid-ctm-matrix-sizes<br />
-igt@kms_color@pipe-invalid-degamma-lut-sizes<br />
-igt@kms_color@pipe-invalid-gamma-lut-sizes<br />
-igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes<br />
-igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes<br />
-igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes</p>

</body>
</html>

--===============6955189503385640419==--
