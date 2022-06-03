Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1323199735956404663=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Date: Fri, 03 Jun 2022 16:44:45 -0000
Message-ID: <165427468567.17722.3322587343157968157@emeril.freedesktop.org>
References: <20220603104725.9344-1-karthik.b.s@intel.com>
In-Reply-To: <20220603104725.9344-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Flowres=3A_Test_Cleanup_=28rev2=29?=
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

--===============1323199735956404663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_lowres: Test Cleanup (rev2)
URL   : https://patchwork.freedesktop.org/series/104602/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11726 -> IGTPW_7226
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/index.html

Participating hosts (43 -> 45)
------------------------------

  Additional (3): bat-adln-1 fi-kbl-x1275 bat-atsm-1 
  Missing    (1): bat-dg2-8 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7226:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-adln-1}:       NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/bat-adln-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@kms_frontbuffer_tracking@basic:
    - {bat-adln-1}:       NOTRUN -> [SKIP][2] +19 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/bat-adln-1/igt@kms_frontbuffer_tracking@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_7226 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#4613]) +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_selftest@live@gt_pm:
    - fi-tgl-1115g4:      [PASS][5] -> [DMESG-FAIL][6] ([i915#3987])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11726/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-g3258:       [PASS][7] -> [INCOMPLETE][8] ([i915#4785])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11726/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [PASS][9] -> [DMESG-FAIL][10] ([i915#4528])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11726/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/fi-blb-e6850/igt@i915_selftest@live@requests.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][11] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/fi-kbl-x1275/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#533])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/fi-kbl-x1275/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@prime_vgem@basic-userptr:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][13] ([fdo#109271]) +12 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/fi-kbl-x1275/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-hsw-g3258:       NOTRUN -> [FAIL][14] ([fdo#109271] / [i915#4312])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/fi-hsw-g3258/igt@runner@aborted.html

  
#### Warnings ####

  * igt@i915_selftest@live@hangcheck:
    - fi-bdw-5557u:       [INCOMPLETE][15] ([i915#3921]) -> [INCOMPLETE][16] ([i915#3921] / [i915#6105])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11726/fi-bdw-5557u/igt@i915_selftest@live@hangcheck.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/fi-bdw-5557u/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#3987]: https://gitlab.freedesktop.org/drm/intel/issues/3987
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5874]: https://gitlab.freedesktop.org/drm/intel/issues/5874
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
  [i915#6092]: https://gitlab.freedesktop.org/drm/intel/issues/6092
  [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
  [i915#6099]: https://gitlab.freedesktop.org/drm/intel/issues/6099
  [i915#6105]: https://gitlab.freedesktop.org/drm/intel/issues/6105
  [i915#6133]: https://gitlab.freedesktop.org/drm/intel/issues/6133
  [i915#6134]: https://gitlab.freedesktop.org/drm/intel/issues/6134
  [i915#6135]: https://gitlab.freedesktop.org/drm/intel/issues/6135
  [i915#6136]: https://gitlab.freedesktop.org/drm/intel/issues/6136
  [i915#6137]: https://gitlab.freedesktop.org/drm/intel/issues/6137
  [i915#6138]: https://gitlab.freedesktop.org/drm/intel/issues/6138
  [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6505 -> IGTPW_7226

  CI-20190529: 20190529
  CI_DRM_11726: 74ea63ad8ffc71b8345436147517253dcabd4793 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7226: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/index.html
  IGT_6505: edb1a467fb622b23b927e28ff603fa43851fea97 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_plane_lowres@tiling-4
+igt@kms_plane_lowres@tiling-none
+igt@kms_plane_lowres@tiling-x
+igt@kms_plane_lowres@tiling-y
+igt@kms_plane_lowres@tiling-yf
-igt@kms_plane_lowres@pipe-a-tiling-4
-igt@kms_plane_lowres@pipe-a-tiling-none
-igt@kms_plane_lowres@pipe-a-tiling-x
-igt@kms_plane_lowres@pipe-a-tiling-y
-igt@kms_plane_lowres@pipe-a-tiling-yf
-igt@kms_plane_lowres@pipe-b-tiling-4
-igt@kms_plane_lowres@pipe-b-tiling-none
-igt@kms_plane_lowres@pipe-b-tiling-x
-igt@kms_plane_lowres@pipe-b-tiling-y
-igt@kms_plane_lowres@pipe-b-tiling-yf
-igt@kms_plane_lowres@pipe-c-tiling-4
-igt@kms_plane_lowres@pipe-c-tiling-none
-igt@kms_plane_lowres@pipe-c-tiling-x
-igt@kms_plane_lowres@pipe-c-tiling-y
-igt@kms_plane_lowres@pipe-c-tiling-yf
-igt@kms_plane_lowres@pipe-d-tiling-4
-igt@kms_plane_lowres@pipe-d-tiling-none
-igt@kms_plane_lowres@pipe-d-tiling-x
-igt@kms_plane_lowres@pipe-d-tiling-y
-igt@kms_plane_lowres@pipe-d-tiling-yf
-igt@kms_plane_lowres@pipe-e-tiling-4
-igt@kms_plane_lowres@pipe-e-tiling-none
-igt@kms_plane_lowres@pipe-e-tiling-x
-igt@kms_plane_lowres@pipe-e-tiling-y
-igt@kms_plane_lowres@pipe-e-tiling-yf
-igt@kms_plane_lowres@pipe-f-tiling-4
-igt@kms_plane_lowres@pipe-f-tiling-none
-igt@kms_plane_lowres@pipe-f-tiling-x
-igt@kms_plane_lowres@pipe-f-tiling-y
-igt@kms_plane_lowres@pipe-f-tiling-yf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/index.html

--===============1323199735956404663==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_lowres: Test Cleanup (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104602/">https://patchwork.freedesktop.org/series/104602/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11726 -&gt; IGTPW_7226</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/index.html</p>
<h2>Participating hosts (43 -&gt; 45)</h2>
<p>Additional (3): bat-adln-1 fi-kbl-x1275 bat-atsm-1 <br />
  Missing    (1): bat-dg2-8 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7226:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/bat-adln-1/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/bat-adln-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> +19 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7226 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11726/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3987">i915#3987</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11726/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11726/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/fi-kbl-x1275/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/fi-kbl-x1275/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/fi-kbl-x1275/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/fi-hsw-g3258/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11726/fi-bdw-5557u/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/fi-bdw-5557u/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6105">i915#6105</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6505 -&gt; IGTPW_7226</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11726: 74ea63ad8ffc71b8345436147517253dcabd4793 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7226: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7226/index.html<br />
  IGT_6505: edb1a467fb622b23b927e28ff603fa43851fea97 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_plane_lowres@tiling-4<br />
+igt@kms_plane_lowres@tiling-none<br />
+igt@kms_plane_lowres@tiling-x<br />
+igt@kms_plane_lowres@tiling-y<br />
+igt@kms_plane_lowres@tiling-yf<br />
-igt@kms_plane_lowres@pipe-a-tiling-4<br />
-igt@kms_plane_lowres@pipe-a-tiling-none<br />
-igt@kms_plane_lowres@pipe-a-tiling-x<br />
-igt@kms_plane_lowres@pipe-a-tiling-y<br />
-igt@kms_plane_lowres@pipe-a-tiling-yf<br />
-igt@kms_plane_lowres@pipe-b-tiling-4<br />
-igt@kms_plane_lowres@pipe-b-tiling-none<br />
-igt@kms_plane_lowres@pipe-b-tiling-x<br />
-igt@kms_plane_lowres@pipe-b-tiling-y<br />
-igt@kms_plane_lowres@pipe-b-tiling-yf<br />
-igt@kms_plane_lowres@pipe-c-tiling-4<br />
-igt@kms_plane_lowres@pipe-c-tiling-none<br />
-igt@kms_plane_lowres@pipe-c-tiling-x<br />
-igt@kms_plane_lowres@pipe-c-tiling-y<br />
-igt@kms_plane_lowres@pipe-c-tiling-yf<br />
-igt@kms_plane_lowres@pipe-d-tiling-4<br />
-igt@kms_plane_lowres@pipe-d-tiling-none<br />
-igt@kms_plane_lowres@pipe-d-tiling-x<br />
-igt@kms_plane_lowres@pipe-d-tiling-y<br />
-igt@kms_plane_lowres@pipe-d-tiling-yf<br />
-igt@kms_plane_lowres@pipe-e-tiling-4<br />
-igt@kms_plane_lowres@pipe-e-tiling-none<br />
-igt@kms_plane_lowres@pipe-e-tiling-x<br />
-igt@kms_plane_lowres@pipe-e-tiling-y<br />
-igt@kms_plane_lowres@pipe-e-tiling-yf<br />
-igt@kms_plane_lowres@pipe-f-tiling-4<br />
-igt@kms_plane_lowres@pipe-f-tiling-none<br />
-igt@kms_plane_lowres@pipe-f-tiling-x<br />
-igt@kms_plane_lowres@pipe-f-tiling-y<br />
-igt@kms_plane_lowres@pipe-f-tiling-yf</p>

</body>
</html>

--===============1323199735956404663==--
