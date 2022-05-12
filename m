Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0338026525378781104=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Date: Thu, 12 May 2022 11:26:23 -0000
Message-ID: <165235478338.6460.5632242472443576381@emeril.freedesktop.org>
References: <20220512074800.6416-1-swati2.sharma@intel.com>
In-Reply-To: <20220512074800.6416-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fplane=5Fscaling=2E?=
 =?utf-8?q?c=3A_Fix_indentation?=
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

--===============0338026525378781104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_plane_scaling.c: Fix indentation
URL   : https://patchwork.freedesktop.org/series/103918/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11640 -> IGTPW_7085
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/index.html

Participating hosts (45 -> 43)
------------------------------

  Additional (1): bat-adlm-1 
  Missing    (3): fi-bdw-samus fi-bsw-cyan bat-dg1-6 

Known issues
------------

  Here are the changes found in IGTPW_7085 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-rte:
    - fi-cfl-8109u:       [PASS][1] -> [DMESG-WARN][2] ([i915#1888] / [i915#62])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11640/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8109u:       [PASS][3] -> [DMESG-WARN][4] ([i915#62]) +13 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11640/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][5] -> [INCOMPLETE][6] ([i915#4785])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11640/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [PASS][7] -> [DMESG-FAIL][8] ([i915#4528])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11640/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cfl-8109u:       [PASS][9] -> [DMESG-FAIL][10] ([i915#62])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11640/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - {fi-ehl-2}:         [DMESG-WARN][11] ([i915#5122]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11640/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_pm_rpm@module-reload:
    - fi-bsw-kefka:       [DMESG-WARN][13] ([i915#1982]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11640/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@requests:
    - {bat-rpls-1}:       [DMESG-WARN][15] ([i915#5836]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11640/bat-rpls-1/igt@i915_selftest@live@requests.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/bat-rpls-1/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-1}:       [DMESG-FAIL][17] ([i915#4983] / [i915#5828]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11640/bat-rpls-1/igt@i915_selftest@live@reset.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/bat-rpls-1/igt@i915_selftest@live@reset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5828]: https://gitlab.freedesktop.org/drm/intel/issues/5828
  [i915#5836]: https://gitlab.freedesktop.org/drm/intel/issues/5836
  [i915#5879]: https://gitlab.freedesktop.org/drm/intel/issues/5879
  [i915#5885]: https://gitlab.freedesktop.org/drm/intel/issues/5885
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6471 -> IGTPW_7085

  CI-20190529: 20190529
  CI_DRM_11640: 5fc0ac55219330c47f2b42b918d5109670fc4fc9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7085: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/index.html
  IGT_6471: 1d6816f1200520f936a799b7b0ef2e6f396abb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/index.html

--===============0338026525378781104==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_plane_scaling.c: Fix indentation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/103918/">https://patchwork.freedesktop.org/series/103918/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11640 -&gt; IGTPW_7085</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/index.html</p>
<h2>Participating hosts (45 -&gt; 43)</h2>
<p>Additional (1): bat-adlm-1 <br />
  Missing    (3): fi-bdw-samus fi-bsw-cyan bat-dg1-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7085 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11640/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11640/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11640/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11640/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11640/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11640/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5122">i915#5122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11640/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11640/bat-rpls-1/igt@i915_selftest@live@requests.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5836">i915#5836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/bat-rpls-1/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11640/bat-rpls-1/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5828">i915#5828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6471 -&gt; IGTPW_7085</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11640: 5fc0ac55219330c47f2b42b918d5109670fc4fc9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7085: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7085/index.html<br />
  IGT_6471: 1d6816f1200520f936a799b7b0ef2e6f396abb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
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

--===============0338026525378781104==--
