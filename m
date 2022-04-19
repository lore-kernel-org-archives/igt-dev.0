Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5019355846696200785=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alex Hung" <alex.hung@amd.com>
Date: Tue, 19 Apr 2022 03:18:26 -0000
Message-ID: <165033830623.19109.9405039807918643958@emeril.freedesktop.org>
References: <20220419022929.1771545-1-alex.hung@amd.com>
In-Reply-To: <20220419022929.1771545-1-alex.hung@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=3A_Skip_kms_test_cases_for_DCC_and_DCC=5FRETILE_=28rev4=29?=
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

--===============5019355846696200785==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms: Skip kms test cases for DCC and DCC_RETILE (rev4)
URL   : https://patchwork.freedesktop.org/series/102357/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11512 -> IGTPW_6943
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/index.html

Participating hosts (47 -> 46)
------------------------------

  Additional (1): fi-tgl-u2 
  Missing    (2): fi-bsw-cyan fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_6943 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-tgl-u2:          NOTRUN -> [SKIP][1] ([i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/fi-tgl-u2/igt@gem_huc_copy@huc-copy.html

  * igt@kms_busy@basic@flip:
    - fi-tgl-u2:          NOTRUN -> [DMESG-WARN][2] ([i915#402])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/fi-tgl-u2/igt@kms_busy@basic@flip.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-tgl-u2:          NOTRUN -> [SKIP][3] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/fi-tgl-u2/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-tgl-u2:          NOTRUN -> [SKIP][4] ([i915#4103]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/fi-tgl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-tgl-u2:          NOTRUN -> [SKIP][5] ([fdo#109285])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/fi-tgl-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-tgl-u2:          NOTRUN -> [SKIP][6] ([i915#3555])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/fi-tgl-u2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@runner@aborted:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][7] ([i915#4312])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-bdw-5557u:       [INCOMPLETE][8] ([i915#146]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@hangcheck:
    - {fi-jsl-1}:         [INCOMPLETE][10] ([i915#5153]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/fi-jsl-1/igt@i915_selftest@live@hangcheck.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/fi-jsl-1/igt@i915_selftest@live@hangcheck.html
    - bat-dg1-6:          [DMESG-FAIL][12] ([i915#4494] / [i915#4957]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
    - fi-snb-2600:        [INCOMPLETE][14] ([i915#3921]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5153]: https://gitlab.freedesktop.org/drm/intel/issues/5153


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6439 -> IGTPW_6943

  CI-20190529: 20190529
  CI_DRM_11512: eaa63ceada3c12c39ce37a11ec2bfb9be060841a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6943: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/index.html
  IGT_6439: 0c6c92745d89c8244d6af8732a0dd03f45ac2030 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/index.html

--===============5019355846696200785==
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
<tr><td><b>Series:</b></td><td>tests/kms: Skip kms test cases for DCC and DCC_RETILE (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/102357/">https://patchwork.freedesktop.org/series/102357/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11512 -&gt; IGTPW_6943</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/index.html</p>
<h2>Participating hosts (47 -&gt; 46)</h2>
<p>Additional (1): fi-tgl-u2 <br />
  Missing    (2): fi-bsw-cyan fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6943 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/fi-tgl-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/fi-tgl-u2/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/fi-tgl-u2/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/fi-tgl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/fi-tgl-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/fi-tgl-u2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/fi-jsl-1/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5153">i915#5153</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/fi-jsl-1/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11512/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6439 -&gt; IGTPW_6943</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11512: eaa63ceada3c12c39ce37a11ec2bfb9be060841a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6943: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6943/index.html<br />
  IGT_6439: 0c6c92745d89c8244d6af8732a0dd03f45ac2030 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5019355846696200785==--
