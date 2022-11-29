Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8271054995214737401=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alex Hung" <alex.hung@amd.com>
Date: Tue, 29 Nov 2022 23:30:08 -0000
Message-ID: <166976460808.23271.14547528514142170207@emeril.freedesktop.org>
References: <20221129220309.1472045-1-alex.hung@amd.com>
In-Reply-To: <20221129220309.1472045-1-alex.hung@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=3A_check_before_calling_i915_libraries?=
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

--===============8271054995214737401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: check before calling i915 libraries
URL   : https://patchwork.freedesktop.org/series/111455/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12447 -> IGTPW_8173
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/index.html

Participating hosts (36 -> 36)
------------------------------

  Additional (1): fi-rkl-11600 
  Missing    (1): fi-tgl-dsi 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8173:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_suspend@basic-s0@smem:
    - {bat-atsm-1}:       NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/bat-atsm-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_suspend@basic-s3-without-i915:
    - {bat-atsm-1}:       NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/bat-atsm-1/igt@i915_suspend@basic-s3-without-i915.html

  
Known issues
------------

  Here are the changes found in IGTPW_8173 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - fi-rkl-11600:       NOTRUN -> [SKIP][3] ([i915#7456])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html

  * igt@gem_huc_copy@huc-copy:
    - fi-rkl-11600:       NOTRUN -> [SKIP][4] ([i915#2190])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-rkl-11600:       NOTRUN -> [SKIP][5] ([i915#4613]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_tiled_pread_basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][6] ([i915#3282])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_backlight@basic-brightness:
    - fi-rkl-11600:       NOTRUN -> [SKIP][7] ([i915#7561])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-cfl-guc:         [PASS][8] -> [DMESG-FAIL][9] ([i915#5334])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12447/fi-cfl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-cfl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@migrate:
    - bat-adlp-4:         [PASS][10] -> [INCOMPLETE][11] ([i915#7308] / [i915#7348])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12447/bat-adlp-4/igt@i915_selftest@live@migrate.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/bat-adlp-4/igt@i915_selftest@live@migrate.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       NOTRUN -> [INCOMPLETE][12] ([i915#4817])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-rkl-11600:       NOTRUN -> [SKIP][13] ([fdo#111827]) +7 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - fi-rkl-11600:       NOTRUN -> [SKIP][14] ([i915#4103])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-rkl-11600:       NOTRUN -> [SKIP][15] ([fdo#109285] / [i915#4098])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-rkl-11600:       NOTRUN -> [SKIP][16] ([i915#1072]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-rkl-11600:       NOTRUN -> [SKIP][17] ([i915#3555] / [i915#4098])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-read:
    - fi-rkl-11600:       NOTRUN -> [SKIP][18] ([fdo#109295] / [i915#3291] / [i915#3708]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-userptr:
    - fi-rkl-11600:       NOTRUN -> [SKIP][19] ([fdo#109295] / [i915#3301] / [i915#3708])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - bat-adlp-4:         NOTRUN -> [FAIL][20] ([i915#4312])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/bat-adlp-4/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-rplp-1}:       [DMESG-WARN][21] ([i915#2867]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12447/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@migrate:
    - {bat-atsm-1}:       [INCOMPLETE][23] ([i915#7535]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12447/bat-atsm-1/igt@i915_selftest@live@migrate.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/bat-atsm-1/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-1}:       [DMESG-FAIL][25] ([i915#4983]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12447/bat-rpls-1/igt@i915_selftest@live@reset.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/bat-rpls-1/igt@i915_selftest@live@reset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6471]: https://gitlab.freedesktop.org/drm/intel/issues/6471
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7308]: https://gitlab.freedesktop.org/drm/intel/issues/7308
  [i915#7348]: https://gitlab.freedesktop.org/drm/intel/issues/7348
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7535]: https://gitlab.freedesktop.org/drm/intel/issues/7535
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7075 -> IGTPW_8173

  CI-20190529: 20190529
  CI_DRM_12447: 34a81694f23e8e18a3b3275c0ec2f58ba0c93072 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8173: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/index.html
  IGT_7075: ae0ad0ffa147445cdf9d33c96a018f5a8b21a5ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@v3d_get_bo_offset@create-get-offsets
+igt@v3d_get_bo_offset@get-bad-handle
+igt@v3d_get_param@base-params
+igt@v3d_get_param@get-bad-flags
+igt@v3d_get_param@get-bad-param
+igt@v3d_mmap@mmap-bad-handle
-igt@v3d/v3d_create_bo@create-bo-0
-igt@v3d/v3d_create_bo@create-bo-4096
-igt@v3d/v3d_create_bo@create-bo-invalid-flags
-igt@v3d/v3d_create_bo@create-bo-zeroed
-igt@v3d/v3d_get_bo_offset@create-get-offsets
-igt@v3d/v3d_get_bo_offset@get-bad-handle
-igt@v3d/v3d_get_param@base-params
-igt@v3d/v3d_get_param@get-bad-flags
-igt@v3d/v3d_get_param@get-bad-param
-igt@v3d/v3d_mmap@mmap-bad-handle
-igt@v3d/v3d_perfmon@create-perfmon-0
-igt@v3d/v3d_perfmon@create-perfmon-exceed
-igt@v3d/v3d_perfmon@create-perfmon-invalid-counters
-igt@v3d/v3d_perfmon@create-single-perfmon
-igt@v3d/v3d_perfmon@create-two-perfmon
-igt@v3d/v3d_perfmon@destroy-invalid-perfmon
-igt@v3d/v3d_perfmon@destroy-valid-perfmon
-igt@v3d/v3d_perfmon@get-values-invalid-pad
-igt@v3d/v3d_perfmon@get-values-invalid-perfmon
-igt@v3d/v3d_perfmon@get-values-invalid-pointer
-igt@v3d/v3d_perfmon@get-values-valid-perfmon

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/index.html

--===============8271054995214737401==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane: check before calling i915 libraries</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111455/">https://patchwork.freedesktop.org/series/111455/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12447 -&gt; IGTPW_8173</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/index.html</p>
<h2>Participating hosts (36 -&gt; 36)</h2>
<p>Additional (1): fi-rkl-11600 <br />
  Missing    (1): fi-tgl-dsi </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8173:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{bat-atsm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/bat-atsm-1/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>{bat-atsm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/bat-atsm-1/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8173 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12447/fi-cfl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-cfl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12447/bat-adlp-4/igt@i915_selftest@live@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/bat-adlp-4/igt@i915_selftest@live@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7308">i915#7308</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7348">i915#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/fi-rkl-11600/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/bat-adlp-4/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12447/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>{bat-atsm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12447/bat-atsm-1/igt@i915_selftest@live@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7535">i915#7535</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/bat-atsm-1/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12447/bat-rpls-1/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7075 -&gt; IGTPW_8173</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12447: 34a81694f23e8e18a3b3275c0ec2f58ba0c93072 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8173: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8173/index.html<br />
  IGT_7075: ae0ad0ffa147445cdf9d33c96a018f5a8b21a5ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@v3d_get_bo_offset@create-get-offsets<br />
+igt@v3d_get_bo_offset@get-bad-handle<br />
+igt@v3d_get_param@base-params<br />
+igt@v3d_get_param@get-bad-flags<br />
+igt@v3d_get_param@get-bad-param<br />
+igt@v3d_mmap@mmap-bad-handle<br />
-igt@v3d/v3d_create_bo@create-bo-0<br />
-igt@v3d/v3d_create_bo@create-bo-4096<br />
-igt@v3d/v3d_create_bo@create-bo-invalid-flags<br />
-igt@v3d/v3d_create_bo@create-bo-zeroed<br />
-igt@v3d/v3d_get_bo_offset@create-get-offsets<br />
-igt@v3d/v3d_get_bo_offset@get-bad-handle<br />
-igt@v3d/v3d_get_param@base-params<br />
-igt@v3d/v3d_get_param@get-bad-flags<br />
-igt@v3d/v3d_get_param@get-bad-param<br />
-igt@v3d/v3d_mmap@mmap-bad-handle<br />
-igt@v3d/v3d_perfmon@create-perfmon-0<br />
-igt@v3d/v3d_perfmon@create-perfmon-exceed<br />
-igt@v3d/v3d_perfmon@create-perfmon-invalid-counters<br />
-igt@v3d/v3d_perfmon@create-single-perfmon<br />
-igt@v3d/v3d_perfmon@create-two-perfmon<br />
-igt@v3d/v3d_perfmon@destroy-invalid-perfmon<br />
-igt@v3d/v3d_perfmon@destroy-valid-perfmon<br />
-igt@v3d/v3d_perfmon@get-values-invalid-pad<br />
-igt@v3d/v3d_perfmon@get-values-invalid-perfmon<br />
-igt@v3d/v3d_perfmon@get-values-invalid-pointer<br />
-igt@v3d/v3d_perfmon@get-values-valid-perfmon</p>

</body>
</html>

--===============8271054995214737401==--
