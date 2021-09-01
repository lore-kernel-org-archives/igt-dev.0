Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6458347614517532239=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 01 Sep 2021 12:42:50 -0000
Message-ID: <163050017080.2830.6093187745080666332@emeril.freedesktop.org>
References: <20210901121017.12398-1-stylon.wang@amd.com>
In-Reply-To: <20210901121017.12398-1-stylon.wang@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIHRl?=
 =?utf-8?q?sts_to_check_Freesync_capability_reporting?=
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
To: Stylon Wang <stylon.wang@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============6458347614517532239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add tests to check Freesync capability reporting
URL   : https://patchwork.freedesktop.org/series/94244/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10543 -> IGTPW_6182
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6182/index.html

Known issues
------------

  Here are the changes found in IGTPW_6182 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-1115g4:      [PASS][1] -> [FAIL][2] ([i915#1888])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10543/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6182/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-guc:         [FAIL][3] ([i915#2203] / [i915#579]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10543/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6182/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@hangcheck:
    - {fi-hsw-gt1}:       [DMESG-WARN][5] ([i915#3303]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10543/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6182/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579


Participating hosts (43 -> 35)
------------------------------

  Missing    (8): fi-ilk-m540 bat-adls-5 bat-dg1-6 bat-dg1-5 fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6193 -> IGTPW_6182

  CI-20190529: 20190529
  CI_DRM_10543: 53abe6ce13dc725c123934c74d1f23157bf99c39 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6182: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6182/index.html
  IGT_6193: 080869f804cb86b25a38889e5ce9a870571cd8c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@amdgpu/amd_vrr_range@freesync-parsing-dp
+igt@amdgpu/amd_vrr_range@freesync-parsing-dp-suspend
+igt@amdgpu/amd_vrr_range@freesync-parsing-hdmi
+igt@amdgpu/amd_vrr_range@freesync-parsing-hdmi-suspend
+igt@amdgpu/amd_vrr_range@freesync-range-dp
+igt@amdgpu/amd_vrr_range@freesync-range-dp-suspend
+igt@amdgpu/amd_vrr_range@freesync-range-hdmi
+igt@amdgpu/amd_vrr_range@freesync-range-hdmi-suspend

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6182/index.html

--===============6458347614517532239==
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
<tr><td><b>Series:</b></td><td>Add tests to check Freesync capability reporting</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/94244/">https://patchwork.freedesktop.org/series/94244/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6182/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6182/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10543 -&gt; IGTPW_6182</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6182/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6182 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s0:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10543/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6182/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10543/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6182/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10543/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6182/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (43 -&gt; 35)</h2>
<p>Missing    (8): fi-ilk-m540 bat-adls-5 bat-dg1-6 bat-dg1-5 fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6193 -&gt; IGTPW_6182</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10543: 53abe6ce13dc725c123934c74d1f23157bf99c39 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6182: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6182/index.html<br />
  IGT_6193: 080869f804cb86b25a38889e5ce9a870571cd8c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@amdgpu/amd_vrr_range@freesync-parsing-dp<br />
+igt@amdgpu/amd_vrr_range@freesync-parsing-dp-suspend<br />
+igt@amdgpu/amd_vrr_range@freesync-parsing-hdmi<br />
+igt@amdgpu/amd_vrr_range@freesync-parsing-hdmi-suspend<br />
+igt@amdgpu/amd_vrr_range@freesync-range-dp<br />
+igt@amdgpu/amd_vrr_range@freesync-range-dp-suspend<br />
+igt@amdgpu/amd_vrr_range@freesync-range-hdmi<br />
+igt@amdgpu/amd_vrr_range@freesync-range-hdmi-suspend</p>

</body>
</html>

--===============6458347614517532239==--
