Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1141760504143203758=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Sun, 27 Feb 2022 16:54:27 -0000
Message-ID: <164598086758.8578.11913447151026116660@emeril.freedesktop.org>
References: <20220227163057.28703-1-swati2.sharma@intel.com>
In-Reply-To: <20220227163057.28703-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkaXRp?=
 =?utf-8?q?on_of_new_plane_scaling_test_cases_=28rev10=29?=
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

--===============1141760504143203758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Addition of new plane scaling test cases (rev10)
URL   : https://patchwork.freedesktop.org/series/98333/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11291 -> IGTPW_6711
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6711/index.html

Participating hosts (41 -> 40)
------------------------------

  Additional (2): bat-jsl-2 fi-pnv-d510 
  Missing    (3): fi-bsw-cyan bat-rpls-2 shard-tglu 

Known issues
------------

  Here are the changes found in IGTPW_6711 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
    - fi-snb-2600:        NOTRUN -> [SKIP][1] ([fdo#109271]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6711/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-skl-6600u:       NOTRUN -> [FAIL][2] ([i915#4547])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6711/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html

  * igt@prime_vgem@basic-userptr:
    - fi-pnv-d510:        NOTRUN -> [SKIP][3] ([fdo#109271]) +57 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6711/fi-pnv-d510/igt@prime_vgem@basic-userptr.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [INCOMPLETE][4] ([i915#3921]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11291/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6711/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@perf:
    - {fi-tgl-dsi}:       [DMESG-WARN][6] ([i915#2867]) -> [PASS][7] +17 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11291/fi-tgl-dsi/igt@i915_selftest@live@perf.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6711/fi-tgl-dsi/igt@i915_selftest@live@perf.html

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - {bat-adlp-6}:       [DMESG-WARN][8] ([i915#3576]) -> [PASS][9] +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11291/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6711/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5127]: https://gitlab.freedesktop.org/drm/intel/issues/5127
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6359 -> IGTPW_6711

  CI-20190529: 20190529
  CI_DRM_11291: 1e3f898ee67cb2fd8c58799ae8a094f73054c8b9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6711: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6711/index.html
  IGT_6359: 57049558c452272b27eeb099fac07e55a924bbf9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5
+igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25
+igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75
+igt@kms_plane_scaling@downscale-with-rotation-factor-0-5
+igt@kms_plane_scaling@downscale-with-rotation-factor-0-25
+igt@kms_plane_scaling@downscale-with-rotation-factor-0-75
+igt@kms_plane_scaling@invalid-num-scalers
+igt@kms_plane_scaling@planes-downscale-factor-0-5
+igt@kms_plane_scaling@planes-downscale-factor-0-25
+igt@kms_plane_scaling@planes-downscale-factor-0-75
+igt@kms_plane_scaling@planes-scaling-unity-scaling
+igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5
+igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25
+igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75
+igt@kms_plane_scaling@planes-upscale-20x20
+igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5
+igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25
+igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75
+igt@kms_plane_scaling@planes-upscale-factor-0-25
+igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5
+igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25
+igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75
+igt@kms_plane_scaling@upscale-with-pixel-format-factor-0-25
+igt@kms_plane_scaling@upscale-with-rotation-factor-0-25
-igt@kms_plane_scaling@downscale-with-pixel-format-factor-2
-igt@kms_plane_scaling@downscale-with-pixel-format-factor-4
-igt@kms_plane_scaling@downscale-with-rotation-factor-2
-igt@kms_plane_scaling@downscale-with-rotation-factor-4
-igt@kms_plane_scaling@plane-scaling
-igt@kms_plane_scaling@upscale-with-pixel-format-factor-4
-igt@kms_plane_scaling@upscale-with-rotation-factor-4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6711/index.html

--===============1141760504143203758==
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
<tr><td><b>Series:</b></td><td>Addition of new plane scaling test cases (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/98333/">https://patchwork.freedesktop.org/series/98333/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6711/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6711/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11291 -&gt; IGTPW_6711</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6711/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Additional (2): bat-jsl-2 fi-pnv-d510 <br />
  Missing    (3): fi-bsw-cyan bat-rpls-2 shard-tglu </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6711 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-compute0:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6711/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6711/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6711/fi-pnv-d510/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +57 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11291/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6711/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@perf:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11291/fi-tgl-dsi/igt@i915_selftest@live@perf.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6711/fi-tgl-dsi/igt@i915_selftest@live@perf.html">PASS</a> +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11291/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6711/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6359 -&gt; IGTPW_6711</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11291: 1e3f898ee67cb2fd8c58799ae8a094f73054c8b9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6711: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6711/index.html<br />
  IGT_6359: 57049558c452272b27eeb099fac07e55a924bbf9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5<br />
+igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25<br />
+igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75<br />
+igt@kms_plane_scaling@downscale-with-rotation-factor-0-5<br />
+igt@kms_plane_scaling@downscale-with-rotation-factor-0-25<br />
+igt@kms_plane_scaling@downscale-with-rotation-factor-0-75<br />
+igt@kms_plane_scaling@invalid-num-scalers<br />
+igt@kms_plane_scaling@planes-downscale-factor-0-5<br />
+igt@kms_plane_scaling@planes-downscale-factor-0-25<br />
+igt@kms_plane_scaling@planes-downscale-factor-0-75<br />
+igt@kms_plane_scaling@planes-scaling-unity-scaling<br />
+igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5<br />
+igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25<br />
+igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75<br />
+igt@kms_plane_scaling@planes-upscale-20x20<br />
+igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5<br />
+igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25<br />
+igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75<br />
+igt@kms_plane_scaling@planes-upscale-factor-0-25<br />
+igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5<br />
+igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25<br />
+igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75<br />
+igt@kms_plane_scaling@upscale-with-pixel-format-factor-0-25<br />
+igt@kms_plane_scaling@upscale-with-rotation-factor-0-25<br />
-igt@kms_plane_scaling@downscale-with-pixel-format-factor-2<br />
-igt@kms_plane_scaling@downscale-with-pixel-format-factor-4<br />
-igt@kms_plane_scaling@downscale-with-rotation-factor-2<br />
-igt@kms_plane_scaling@downscale-with-rotation-factor-4<br />
-igt@kms_plane_scaling@plane-scaling<br />
-igt@kms_plane_scaling@upscale-with-pixel-format-factor-4<br />
-igt@kms_plane_scaling@upscale-with-rotation-factor-4</p>

</body>
</html>

--===============1141760504143203758==--
