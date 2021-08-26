Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9153022969924077181=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 26 Aug 2021 00:20:23 -0000
Message-ID: <162993722306.15050.14500593927400633348@emeril.freedesktop.org>
References: <20210825233139.1066504-1-robdclark@gmail.com>
In-Reply-To: <20210825233139.1066504-1-robdclark@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW5pdGlh?=
 =?utf-8?q?l_igt_tests_for_drm/msm_ioctls_=28rev2=29?=
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
To: Rob Clark <robdclark@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============9153022969924077181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Initial igt tests for drm/msm ioctls (rev2)
URL   : https://patchwork.freedesktop.org/series/93973/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10521 -> IGTPW_6157
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6157/index.html

Known issues
------------

  Here are the changes found in IGTPW_6157 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-gfx:
    - fi-rkl-guc:         NOTRUN -> [SKIP][1] ([fdo#109315]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6157/fi-rkl-guc/igt@amdgpu/amd_basic@cs-gfx.html

  * igt@i915_selftest@live@gt_lrc:
    - fi-rkl-guc:         NOTRUN -> [DMESG-WARN][2] ([i915#3958])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6157/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - fi-rkl-guc:         [DMESG-FAIL][3] ([i915#3928]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10521/fi-rkl-guc/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6157/fi-rkl-guc/igt@i915_selftest@live@workarounds.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-rkl-guc:         [FAIL][5] ([i915#3983]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10521/fi-rkl-guc/igt@kms_force_connector_basic@force-connector-state.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6157/fi-rkl-guc/igt@kms_force_connector_basic@force-connector-state.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-tgl-1115g4:      [INCOMPLETE][7] ([i915#1385] / [i915#4006]) -> [INCOMPLETE][8] ([i915#4006])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10521/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6157/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html

  * igt@kms_psr@primary_page_flip:
    - fi-tgl-1115g4:      [SKIP][9] ([i915#1072]) -> [SKIP][10] ([i915#1072] / [i915#1385])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10521/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6157/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html

  
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1385]: https://gitlab.freedesktop.org/drm/intel/issues/1385
  [i915#3928]: https://gitlab.freedesktop.org/drm/intel/issues/3928
  [i915#3958]: https://gitlab.freedesktop.org/drm/intel/issues/3958
  [i915#3983]: https://gitlab.freedesktop.org/drm/intel/issues/3983
  [i915#4006]: https://gitlab.freedesktop.org/drm/intel/issues/4006


Participating hosts (40 -> 34)
------------------------------

  Missing    (6): fi-ilk-m540 bat-adls-5 fi-hsw-4200u fi-bsw-cyan fi-bdw-samus bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6186 -> IGTPW_6157

  CI-20190529: 20190529
  CI_DRM_10521: 22d97eae8a21ddd48ba661b0a3a68c83bf518d35 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6157: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6157/index.html
  IGT_6186: 250081b306c6fa8f95405fab6a7604f1968dd4ec @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@msm_submit@empty-submit
+igt@msm_submit@invalid-cmd-idx-submit
+igt@msm_submit@invalid-cmd-type-submit
+igt@msm_submit@invalid-duplicate-bo-submit
+igt@msm_submit@invalid-flags-submit
+igt@msm_submit@invalid-in-fence-submit
+igt@msm_submit@invalid-queue-submit
+igt@msm_submit@valid-submit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6157/index.html

--===============9153022969924077181==
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
<tr><td><b>Series:</b></td><td>Initial igt tests for drm/msm ioctls (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93973/">https://patchwork.freedesktop.org/series/93973/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6157/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6157/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10521 -&gt; IGTPW_6157</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6157/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6157 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-gfx:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6157/fi-rkl-guc/igt@amdgpu/amd_basic@cs-gfx.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6157/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3958">i915#3958</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10521/fi-rkl-guc/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3928">i915#3928</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6157/fi-rkl-guc/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10521/fi-rkl-guc/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3983">i915#3983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6157/fi-rkl-guc/igt@kms_force_connector_basic@force-connector-state.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10521/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1385">i915#1385</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4006">i915#4006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6157/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4006">i915#4006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10521/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6157/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1385">i915#1385</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (40 -&gt; 34)</h2>
<p>Missing    (6): fi-ilk-m540 bat-adls-5 fi-hsw-4200u fi-bsw-cyan fi-bdw-samus bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6186 -&gt; IGTPW_6157</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10521: 22d97eae8a21ddd48ba661b0a3a68c83bf518d35 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6157: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6157/index.html<br />
  IGT_6186: 250081b306c6fa8f95405fab6a7604f1968dd4ec @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@msm_submit@empty-submit<br />
+igt@msm_submit@invalid-cmd-idx-submit<br />
+igt@msm_submit@invalid-cmd-type-submit<br />
+igt@msm_submit@invalid-duplicate-bo-submit<br />
+igt@msm_submit@invalid-flags-submit<br />
+igt@msm_submit@invalid-in-fence-submit<br />
+igt@msm_submit@invalid-queue-submit<br />
+igt@msm_submit@valid-submit</p>

</body>
</html>

--===============9153022969924077181==--
