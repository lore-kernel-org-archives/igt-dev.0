Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 16 Feb 2021 14:57:26 -0000
Message-ID: <161348744689.32287.6828224769808357174@emeril.freedesktop.org>
References: <20210216123236.693768-1-martin.peres@mupuf.org>
In-Reply-To: <20210216123236.693768-1-martin.peres@mupuf.org>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_amdgpu/basic=3A_move_amdgpu=5F?=
 =?utf-8?q?query=5Finfo=5Ftest_to_its_own_file?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0459067350=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Martin Peres <martin.peres@mupuf.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0459067350==
Content-Type: multipart/alternative;
 boundary="===============5359029704218848321=="

--===============5359029704218848321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] amdgpu/basic: move amdgpu_query_info_test to its own file
URL   : https://patchwork.freedesktop.org/series/87125/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9779 -> IGTPW_5514
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5514/index.html

Known issues
------------

  Here are the changes found in IGTPW_5514 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@query-info:
    - fi-tgl-y:           NOTRUN -> [SKIP][1] ([fdo#109315])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5514/fi-tgl-y/igt@amdgpu/amd_basic@query-info.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7500u:       [PASS][2] -> [DMESG-WARN][3] ([i915#2605]) +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9779/fi-kbl-7500u/igt@i915_selftest@live@sanitycheck.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5514/fi-kbl-7500u/igt@i915_selftest@live@sanitycheck.html

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - fi-tgl-y:           [PASS][4] -> [DMESG-WARN][5] ([i915#402]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9779/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5514/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html

  
#### Possible fixes ####

  * igt@prime_vgem@basic-fence-flip:
    - fi-tgl-y:           [DMESG-WARN][6] ([i915#402]) -> [PASS][7] +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9779/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5514/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html

  
#### Warnings ####

  * igt@amdgpu/amd_basic@query-info:
    - fi-tgl-u2:          [SKIP][8] ([fdo#109315] / [i915#2575]) -> [SKIP][9] ([fdo#109315])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9779/fi-tgl-u2/igt@amdgpu/amd_basic@query-info.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5514/fi-tgl-u2/igt@amdgpu/amd_basic@query-info.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2605]: https://gitlab.freedesktop.org/drm/intel/issues/2605
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (45 -> 39)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6004 -> IGTPW_5514

  CI-20190529: 20190529
  CI_DRM_9779: 775dbe8d5e041442fcadf63894468a63582a87a2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5514: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5514/index.html
  IGT_6004: fe9ac2aeffc1828c6d61763a611a44fbd450aa96 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@amdgpu/amd_info@query-firmware-version
+igt@amdgpu/amd_info@query-timestamp
-igt@amdgpu/amd_basic@query-info

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5514/index.html

--===============5359029704218848321==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] amdgpu/basic: move amdgpu_query_info_test to its own file</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87125/">https://patchwork.freedesktop.org/series/87125/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5514/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5514/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9779 -&gt; IGTPW_5514</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5514/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5514 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@query-info:</p>
<ul>
<li>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5514/fi-tgl-y/igt@amdgpu/amd_basic@query-info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9779/fi-kbl-7500u/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5514/fi-kbl-7500u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2605">i915#2605</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9779/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5514/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@prime_vgem@basic-fence-flip:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9779/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5514/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@amdgpu/amd_basic@query-info:<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9779/fi-tgl-u2/igt@amdgpu/amd_basic@query-info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5514/fi-tgl-u2/igt@amdgpu/amd_basic@query-info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (45 -&gt; 39)</h2>
<p>Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6004 -&gt; IGTPW_5514</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9779: 775dbe8d5e041442fcadf63894468a63582a87a2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5514: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5514/index.html<br />
  IGT_6004: fe9ac2aeffc1828c6d61763a611a44fbd450aa96 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@amdgpu/amd_info@query-firmware-version<br />
+igt@amdgpu/amd_info@query-timestamp<br />
-igt@amdgpu/amd_basic@query-info</p>

</body>
</html>

--===============5359029704218848321==--

--===============0459067350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0459067350==--
