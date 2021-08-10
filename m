Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7257563281795245058=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 10 Aug 2021 12:52:51 -0000
Message-ID: <162859997163.29681.3579542886437613426@emeril.freedesktop.org>
References: <20210810120038.339259-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210810120038.339259-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbusy=3A_Limit_the_execution_to_single_connector_=28rev2?=
 =?utf-8?q?=29?=
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
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============7257563281795245058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_busy: Limit the execution to single connector (rev2)
URL   : https://patchwork.freedesktop.org/series/93539/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10464 -> IGTPW_6110
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/index.html

Known issues
------------

  Here are the changes found in IGTPW_6110 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-gfx:
    - fi-rkl-guc:         NOTRUN -> [SKIP][1] ([fdo#109315]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/fi-rkl-guc/igt@amdgpu/amd_basic@cs-gfx.html

  * igt@i915_pm_rpm@module-reload:
    - fi-rkl-guc:         NOTRUN -> [SKIP][2] ([i915#3844] / [i915#579])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_mocs:
    - fi-tgl-1115g4:      [PASS][3] -> [DMESG-WARN][4] ([i915#2867]) +15 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10464/fi-tgl-1115g4/igt@i915_selftest@live@gt_mocs.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/fi-tgl-1115g4/igt@i915_selftest@live@gt_mocs.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-rkl-guc:         NOTRUN -> [SKIP][5] ([i915#1845])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/fi-rkl-guc/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-userptr:
    - fi-rkl-guc:         NOTRUN -> [SKIP][6] ([i915#3301])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/fi-rkl-guc/igt@prime_vgem@basic-userptr.html

  * igt@prime_vgem@basic-write:
    - fi-rkl-guc:         NOTRUN -> [SKIP][7] ([i915#3291]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/fi-rkl-guc/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-1115g4:      [FAIL][8] ([i915#1888]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10464/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_pm_rps@basic-api:
    - fi-rkl-guc:         [DMESG-WARN][10] ([i915#3925]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10464/fi-rkl-guc/igt@i915_pm_rps@basic-api.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/fi-rkl-guc/igt@i915_pm_rps@basic-api.html

  
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3844]: https://gitlab.freedesktop.org/drm/intel/issues/3844
  [i915#3925]: https://gitlab.freedesktop.org/drm/intel/issues/3925
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579


Participating hosts (37 -> 33)
------------------------------

  Missing    (4): fi-kbl-soraka fi-bdw-samus fi-bsw-cyan bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6165 -> IGTPW_6110

  CI-20190529: 20190529
  CI_DRM_10464: 294a55f328023a4e36f46e5eb6c4859076efd850 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6110: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/index.html
  IGT_6165: df5d05d742275b049f6f3c852a86c4769966b126 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/index.html

--===============7257563281795245058==
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
<tr><td><b>Series:</b></td><td>tests/kms_busy: Limit the execution to single connector (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93539/">https://patchwork.freedesktop.org/series/93539/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10464 -&gt; IGTPW_6110</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6110 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-gfx:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/fi-rkl-guc/igt@amdgpu/amd_basic@cs-gfx.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3844">i915#3844</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10464/fi-tgl-1115g4/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/fi-tgl-1115g4/igt@i915_selftest@live@gt_mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/fi-rkl-guc/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/fi-rkl-guc/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/fi-rkl-guc/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10464/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10464/fi-rkl-guc/igt@i915_pm_rps@basic-api.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3925">i915#3925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/fi-rkl-guc/igt@i915_pm_rps@basic-api.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (37 -&gt; 33)</h2>
<p>Missing    (4): fi-kbl-soraka fi-bdw-samus fi-bsw-cyan bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6165 -&gt; IGTPW_6110</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10464: 294a55f328023a4e36f46e5eb6c4859076efd850 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6110: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6110/index.html<br />
  IGT_6165: df5d05d742275b049f6f3c852a86c4769966b126 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7257563281795245058==--
