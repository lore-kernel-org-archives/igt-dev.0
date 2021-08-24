Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2251270182191289249=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Aug 2021 14:34:01 -0000
Message-ID: <162981564168.27153.17774090915533488248@emeril.freedesktop.org>
References: <20210824110459.27235-1-swati2.sharma@intel.com>
In-Reply-To: <20210824110459.27235-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=5Fscaled=5Fcrc=3A_Add_upscaling_tests?=
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
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2251270182191289249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_flip_scaled_crc: Add upscaling tests
URL   : https://patchwork.freedesktop.org/series/93952/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10513 -> IGTPW_6148
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/index.html

Known issues
------------

  Here are the changes found in IGTPW_6148 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-gfx:
    - fi-rkl-guc:         NOTRUN -> [SKIP][1] ([fdo#109315]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/fi-rkl-guc/igt@amdgpu/amd_basic@cs-gfx.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-kbl-soraka:      [PASS][2] -> [INCOMPLETE][3] ([i915#155])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-guc:         [PASS][4] -> [FAIL][5] ([i915#2203])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][6] -> [INCOMPLETE][7] ([i915#2940])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-rkl-guc:         [DMESG-WARN][8] ([i915#3925]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-cfl-8109u:       [DMESG-WARN][10] ([i915#203] / [i915#262] / [i915#295]) -> [PASS][11] +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-cfl-8109u/igt@gem_exec_suspend@basic-s0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/fi-cfl-8109u/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_module_load@reload:
    - {fi-tgl-dsi}:       [DMESG-WARN][12] ([i915#1982]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-tgl-dsi/igt@i915_module_load@reload.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/fi-tgl-dsi/igt@i915_module_load@reload.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-rte:
    - fi-kbl-guc:         [FAIL][14] ([i915#579]) -> [SKIP][15] ([fdo#109271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#203]: https://gitlab.freedesktop.org/drm/intel/issues/203
  [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#295]: https://gitlab.freedesktop.org/drm/intel/issues/295
  [i915#3925]: https://gitlab.freedesktop.org/drm/intel/issues/3925
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579


Participating hosts (39 -> 33)
------------------------------

  Missing    (6): fi-ilk-m540 bat-adls-5 fi-hsw-4200u fi-bsw-cyan fi-bdw-samus bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6184 -> IGTPW_6148

  CI-20190529: 20190529
  CI_DRM_10513: 28c5d08c6c0d0946b9836306c25146a2f72de338 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6148: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/index.html
  IGT_6184: 84f9bbde1e6156c8b978613d9c85c9043fd3180c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling
-igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile
-igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs
-igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs
-igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile
-igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile
-igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile
-igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/index.html

--===============2251270182191289249==
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
<tr><td><b>Series:</b></td><td>tests/kms_flip_scaled_crc: Add upscaling tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93952/">https://patchwork.freedesktop.org/series/93952/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10513 -&gt; IGTPW_6148</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6148 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-gfx:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/fi-rkl-guc/igt@amdgpu/amd_basic@cs-gfx.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3925">i915#3925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-cfl-8109u/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/203">i915#203</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/295">i915#295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/fi-cfl-8109u/igt@gem_exec_suspend@basic-s0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-tgl-dsi/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/fi-tgl-dsi/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_rpm@basic-rte:<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (39 -&gt; 33)</h2>
<p>Missing    (6): fi-ilk-m540 bat-adls-5 fi-hsw-4200u fi-bsw-cyan fi-bdw-samus bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6184 -&gt; IGTPW_6148</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10513: 28c5d08c6c0d0946b9836306c25146a2f72de338 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6148: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6148/index.html<br />
  IGT_6184: 84f9bbde1e6156c8b978613d9c85c9043fd3180c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling<br />
-igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile<br />
-igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs<br />
-igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs<br />
-igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile<br />
-igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile<br />
-igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile<br />
-igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs</p>

</body>
</html>

--===============2251270182191289249==--
