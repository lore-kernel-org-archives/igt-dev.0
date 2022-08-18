Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2883333767099356332=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 18 Aug 2022 07:05:37 -0000
Message-ID: <166080633749.16681.6208564613845886371@emeril.freedesktop.org>
References: <20220810122023.1816804-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220810122023.1816804-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fcursor=3A_Convert_tests_to_dynamic_=28rev2=29?=
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

--===============2883333767099356332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_cursor: Convert tests to dynamic (rev2)
URL   : https://patchwork.freedesktop.org/series/107119/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11996 -> IGTPW_7657
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/index.html

Participating hosts (31 -> 33)
------------------------------

  Additional (2): bat-rpls-1 bat-adls-5 

Known issues
------------

  Here are the changes found in IGTPW_7657 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-bdw-gvtdvm:      NOTRUN -> [INCOMPLETE][1] ([i915#4817])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/fi-bdw-gvtdvm/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][2] ([fdo#109271]) +19 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/fi-bdw-gvtdvm/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - fi-bdw-gvtdvm:      [DMESG-WARN][3] ([i915#6540]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-bdw-gvtdvm/igt@i915_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/fi-bdw-gvtdvm/igt@i915_module_load@load.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-6:          [DMESG-FAIL][5] ([i915#4494] / [i915#4957]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-bdw-gvtdvm:      [DMESG-WARN][7] ([i915#5922]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-bdw-gvtdvm/igt@kms_force_connector_basic@force-connector-state.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/fi-bdw-gvtdvm/igt@kms_force_connector_basic@force-connector-state.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-skl-6700k2:      [INCOMPLETE][9] ([i915#4939]) -> [INCOMPLETE][10] ([i915#4939] / [i915#6598])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-skl-6700k2/igt@gem_exec_suspend@basic-s3@smem.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/fi-skl-6700k2/igt@gem_exec_suspend@basic-s3@smem.html
    - fi-bdw-5557u:       [INCOMPLETE][11] ([i915#146]) -> [INCOMPLETE][12] ([i915#146] / [i915#6598])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@runner@aborted:
    - fi-cfl-8109u:       [FAIL][13] ([i915#4312]) -> [FAIL][14] ([i915#4312] / [i915#6599])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-cfl-8109u/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/fi-cfl-8109u/igt@runner@aborted.html
    - fi-adl-ddr5:        [FAIL][15] ([i915#4312]) -> [FAIL][16] ([i915#4312] / [i915#6599])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-adl-ddr5/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/fi-adl-ddr5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5922]: https://gitlab.freedesktop.org/drm/intel/issues/5922
  [i915#6540]: https://gitlab.freedesktop.org/drm/intel/issues/6540
  [i915#6598]: https://gitlab.freedesktop.org/drm/intel/issues/6598
  [i915#6599]: https://gitlab.freedesktop.org/drm/intel/issues/6599


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6630 -> IGTPW_7657

  CI-20190529: 20190529
  CI_DRM_11996: 79088b3740cb8192a131fae2c0d335b456557088 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7657: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/index.html
  IGT_6630: b5e2222c9a988015bdf237e6ebb9f5b6d87ac7e1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_plane_cursor@overlay
+igt@kms_plane_cursor@primary
+igt@kms_plane_cursor@viewport
-igt@kms_plane_cursor@pipe-a-overlay-size-64
-igt@kms_plane_cursor@pipe-a-overlay-size-128
-igt@kms_plane_cursor@pipe-a-overlay-size-256
-igt@kms_plane_cursor@pipe-a-primary-size-64
-igt@kms_plane_cursor@pipe-a-primary-size-128
-igt@kms_plane_cursor@pipe-a-primary-size-256
-igt@kms_plane_cursor@pipe-a-viewport-size-64
-igt@kms_plane_cursor@pipe-a-viewport-size-128
-igt@kms_plane_cursor@pipe-a-viewport-size-256
-igt@kms_plane_cursor@pipe-b-overlay-size-64
-igt@kms_plane_cursor@pipe-b-overlay-size-128
-igt@kms_plane_cursor@pipe-b-overlay-size-256
-igt@kms_plane_cursor@pipe-b-primary-size-64
-igt@kms_plane_cursor@pipe-b-primary-size-128
-igt@kms_plane_cursor@pipe-b-primary-size-256
-igt@kms_plane_cursor@pipe-b-viewport-size-64
-igt@kms_plane_cursor@pipe-b-viewport-size-128
-igt@kms_plane_cursor@pipe-b-viewport-size-256
-igt@kms_plane_cursor@pipe-c-overlay-size-64
-igt@kms_plane_cursor@pipe-c-overlay-size-128
-igt@kms_plane_cursor@pipe-c-overlay-size-256
-igt@kms_plane_cursor@pipe-c-primary-size-64
-igt@kms_plane_cursor@pipe-c-primary-size-128
-igt@kms_plane_cursor@pipe-c-primary-size-256
-igt@kms_plane_cursor@pipe-c-viewport-size-64
-igt@kms_plane_cursor@pipe-c-viewport-size-128
-igt@kms_plane_cursor@pipe-c-viewport-size-256
-igt@kms_plane_cursor@pipe-d-overlay-size-64
-igt@kms_plane_cursor@pipe-d-overlay-size-128
-igt@kms_plane_cursor@pipe-d-overlay-size-256
-igt@kms_plane_cursor@pipe-d-primary-size-64
-igt@kms_plane_cursor@pipe-d-primary-size-128
-igt@kms_plane_cursor@pipe-d-primary-size-256
-igt@kms_plane_cursor@pipe-d-viewport-size-64
-igt@kms_plane_cursor@pipe-d-viewport-size-128
-igt@kms_plane_cursor@pipe-d-viewport-size-256
-igt@kms_plane_cursor@pipe-e-overlay-size-64
-igt@kms_plane_cursor@pipe-e-overlay-size-128
-igt@kms_plane_cursor@pipe-e-overlay-size-256
-igt@kms_plane_cursor@pipe-e-primary-size-64
-igt@kms_plane_cursor@pipe-e-primary-size-128
-igt@kms_plane_cursor@pipe-e-primary-size-256
-igt@kms_plane_cursor@pipe-e-viewport-size-64
-igt@kms_plane_cursor@pipe-e-viewport-size-128
-igt@kms_plane_cursor@pipe-e-viewport-size-256
-igt@kms_plane_cursor@pipe-f-overlay-size-64
-igt@kms_plane_cursor@pipe-f-overlay-size-128
-igt@kms_plane_cursor@pipe-f-overlay-size-256
-igt@kms_plane_cursor@pipe-f-primary-size-64
-igt@kms_plane_cursor@pipe-f-primary-size-128
-igt@kms_plane_cursor@pipe-f-primary-size-256
-igt@kms_plane_cursor@pipe-f-viewport-size-64
-igt@kms_plane_cursor@pipe-f-viewport-size-128
-igt@kms_plane_cursor@pipe-f-viewport-size-256

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/index.html

--===============2883333767099356332==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_cursor: Convert tests to dynamic (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/107119/">https://patchwork.freedesktop.org/series/107119/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11996 -&gt; IGTPW_7657</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/index.html</p>
<h2>Participating hosts (31 -&gt; 33)</h2>
<p>Additional (2): bat-rpls-1 bat-adls-5 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7657 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/fi-bdw-gvtdvm/igt@i915_suspend@basic-s2idle-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/fi-bdw-gvtdvm/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +19 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-bdw-gvtdvm/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6540">i915#6540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/fi-bdw-gvtdvm/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-bdw-gvtdvm/igt@kms_force_connector_basic@force-connector-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5922">i915#5922</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/fi-bdw-gvtdvm/igt@kms_force_connector_basic@force-connector-state.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-skl-6700k2/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4939">i915#4939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/fi-skl-6700k2/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4939">i915#4939</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6599">i915#6599</a>)</p>
</li>
<li>
<p>fi-adl-ddr5:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-adl-ddr5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/fi-adl-ddr5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6599">i915#6599</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6630 -&gt; IGTPW_7657</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11996: 79088b3740cb8192a131fae2c0d335b456557088 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7657: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7657/index.html<br />
  IGT_6630: b5e2222c9a988015bdf237e6ebb9f5b6d87ac7e1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_plane_cursor@overlay<br />
+igt@kms_plane_cursor@primary<br />
+igt@kms_plane_cursor@viewport<br />
-igt@kms_plane_cursor@pipe-a-overlay-size-64<br />
-igt@kms_plane_cursor@pipe-a-overlay-size-128<br />
-igt@kms_plane_cursor@pipe-a-overlay-size-256<br />
-igt@kms_plane_cursor@pipe-a-primary-size-64<br />
-igt@kms_plane_cursor@pipe-a-primary-size-128<br />
-igt@kms_plane_cursor@pipe-a-primary-size-256<br />
-igt@kms_plane_cursor@pipe-a-viewport-size-64<br />
-igt@kms_plane_cursor@pipe-a-viewport-size-128<br />
-igt@kms_plane_cursor@pipe-a-viewport-size-256<br />
-igt@kms_plane_cursor@pipe-b-overlay-size-64<br />
-igt@kms_plane_cursor@pipe-b-overlay-size-128<br />
-igt@kms_plane_cursor@pipe-b-overlay-size-256<br />
-igt@kms_plane_cursor@pipe-b-primary-size-64<br />
-igt@kms_plane_cursor@pipe-b-primary-size-128<br />
-igt@kms_plane_cursor@pipe-b-primary-size-256<br />
-igt@kms_plane_cursor@pipe-b-viewport-size-64<br />
-igt@kms_plane_cursor@pipe-b-viewport-size-128<br />
-igt@kms_plane_cursor@pipe-b-viewport-size-256<br />
-igt@kms_plane_cursor@pipe-c-overlay-size-64<br />
-igt@kms_plane_cursor@pipe-c-overlay-size-128<br />
-igt@kms_plane_cursor@pipe-c-overlay-size-256<br />
-igt@kms_plane_cursor@pipe-c-primary-size-64<br />
-igt@kms_plane_cursor@pipe-c-primary-size-128<br />
-igt@kms_plane_cursor@pipe-c-primary-size-256<br />
-igt@kms_plane_cursor@pipe-c-viewport-size-64<br />
-igt@kms_plane_cursor@pipe-c-viewport-size-128<br />
-igt@kms_plane_cursor@pipe-c-viewport-size-256<br />
-igt@kms_plane_cursor@pipe-d-overlay-size-64<br />
-igt@kms_plane_cursor@pipe-d-overlay-size-128<br />
-igt@kms_plane_cursor@pipe-d-overlay-size-256<br />
-igt@kms_plane_cursor@pipe-d-primary-size-64<br />
-igt@kms_plane_cursor@pipe-d-primary-size-128<br />
-igt@kms_plane_cursor@pipe-d-primary-size-256<br />
-igt@kms_plane_cursor@pipe-d-viewport-size-64<br />
-igt@kms_plane_cursor@pipe-d-viewport-size-128<br />
-igt@kms_plane_cursor@pipe-d-viewport-size-256<br />
-igt@kms_plane_cursor@pipe-e-overlay-size-64<br />
-igt@kms_plane_cursor@pipe-e-overlay-size-128<br />
-igt@kms_plane_cursor@pipe-e-overlay-size-256<br />
-igt@kms_plane_cursor@pipe-e-primary-size-64<br />
-igt@kms_plane_cursor@pipe-e-primary-size-128<br />
-igt@kms_plane_cursor@pipe-e-primary-size-256<br />
-igt@kms_plane_cursor@pipe-e-viewport-size-64<br />
-igt@kms_plane_cursor@pipe-e-viewport-size-128<br />
-igt@kms_plane_cursor@pipe-e-viewport-size-256<br />
-igt@kms_plane_cursor@pipe-f-overlay-size-64<br />
-igt@kms_plane_cursor@pipe-f-overlay-size-128<br />
-igt@kms_plane_cursor@pipe-f-overlay-size-256<br />
-igt@kms_plane_cursor@pipe-f-primary-size-64<br />
-igt@kms_plane_cursor@pipe-f-primary-size-128<br />
-igt@kms_plane_cursor@pipe-f-primary-size-256<br />
-igt@kms_plane_cursor@pipe-f-viewport-size-64<br />
-igt@kms_plane_cursor@pipe-f-viewport-size-128<br />
-igt@kms_plane_cursor@pipe-f-viewport-size-256</p>

</body>
</html>

--===============2883333767099356332==--
