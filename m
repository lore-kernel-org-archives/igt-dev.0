Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6829919604412322846=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 20 Aug 2021 11:09:16 -0000
Message-ID: <162945775635.2688.10053998612533737793@emeril.freedesktop.org>
References: <20210820020327.612886-1-mastanx.katragadda@intel.com>
In-Reply-To: <20210820020327.612886-1-mastanx.katragadda@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/exec=5Fbalancer=3A_Added_Skip_invalid-bonds_=28rev2=29?=
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
To: Mastan Katragadda <mastanx.katragadda@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============6829919604412322846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/exec_balancer: Added Skip invalid-bonds (rev2)
URL   : https://patchwork.freedesktop.org/series/93813/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10502 -> IGTPW_6141
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6141/index.html

Known issues
------------

  Here are the changes found in IGTPW_6141 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@query-info:
    - fi-bsw-kefka:       NOTRUN -> [SKIP][1] ([fdo#109271]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6141/fi-bsw-kefka/igt@amdgpu/amd_basic@query-info.html

  * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][2] ([fdo#109271]) +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6141/fi-kbl-soraka/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - fi-rkl-guc:         [FAIL][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10502/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6141/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-kefka:       [INCOMPLETE][5] ([i915#2940]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10502/fi-bsw-kefka/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6141/fi-bsw-kefka/igt@i915_selftest@live@execlists.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940


Participating hosts (41 -> 35)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-tgl-1115g4 fi-bsw-cyan fi-bdw-samus bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6180 -> IGTPW_6141

  CI-20190529: 20190529
  CI_DRM_10502: 56219fa2bbb92c7b43d84507dc650e98d467b7bb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6141: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6141/index.html
  IGT_6180: f480bf1ebce4b88f8051783e19e62882a19726a1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6141/index.html

--===============6829919604412322846==
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
<tr><td><b>Series:</b></td><td>tests/i915/exec_balancer: Added Skip invalid-bonds (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93813/">https://patchwork.freedesktop.org/series/93813/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6141/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6141/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10502 -&gt; IGTPW_6141</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6141/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6141 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@query-info:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6141/fi-bsw-kefka/igt@amdgpu/amd_basic@query-info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-compute0:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6141/fi-kbl-soraka/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10502/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6141/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10502/fi-bsw-kefka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6141/fi-bsw-kefka/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (41 -&gt; 35)</h2>
<p>Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-tgl-1115g4 fi-bsw-cyan fi-bdw-samus bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6180 -&gt; IGTPW_6141</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10502: 56219fa2bbb92c7b43d84507dc650e98d467b7bb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6141: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6141/index.html<br />
  IGT_6180: f480bf1ebce4b88f8051783e19e62882a19726a1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6829919604412322846==--
