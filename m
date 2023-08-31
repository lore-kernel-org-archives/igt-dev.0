Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7378748754684559351=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Thu, 31 Aug 2023 04:18:55 -0000
Message-ID: <169345553535.12509.11403352393084192819@emeril.freedesktop.org>
References: <20230831033128.454032-1-vitaly.prosyak@amd.com>
In-Reply-To: <20230831033128.454032-1-vitaly.prosyak@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?amdgpu=3A_add_sync_object_tests_=28rev7=29?=
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

--===============7378748754684559351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: add sync object tests (rev7)
URL   : https://patchwork.freedesktop.org/series/119304/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13578 -> IGTPW_9687
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/index.html

Participating hosts (39 -> 36)
------------------------------

  Missing    (3): fi-kbl-soraka bat-adlp-6 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9687 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - bat-dg2-9:          [PASS][1] -> [INCOMPLETE][2] ([i915#6311])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@kms_psr@primary_mmap_gtt:
    - bat-rplp-1:         NOTRUN -> [SKIP][3] ([i915#1072]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-rplp-1:         NOTRUN -> [ABORT][4] ([i915#8260] / [i915#8668])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-jsl-1:          [ABORT][5] ([i915#5122]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/bat-jsl-1/igt@gem_exec_suspend@basic-s0@smem.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/bat-jsl-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_selftest@live@mman:
    - bat-rpls-2:         [TIMEOUT][7] ([i915#6794] / [i915#7392]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/bat-rpls-2/igt@i915_selftest@live@mman.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/bat-rpls-2/igt@i915_selftest@live@mman.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-rpls-2:         [WARN][9] ([i915#8747]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-jsl-1:          [FAIL][11] ([fdo#103375]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/bat-jsl-1/igt@i915_suspend@basic-s3-without-i915.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/bat-jsl-1/igt@i915_suspend@basic-s3-without-i915.html

  
#### Warnings ####

  * igt@kms_psr@cursor_plane_move:
    - bat-rplp-1:         [ABORT][13] ([i915#9243]) -> [SKIP][14] ([i915#1072])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/bat-rplp-1/igt@kms_psr@cursor_plane_move.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/bat-rplp-1/igt@kms_psr@cursor_plane_move.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#485]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/485
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
  [i915#8260]: https://gitlab.freedesktop.org/drm/intel/issues/8260
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8747]: https://gitlab.freedesktop.org/drm/intel/issues/8747
  [i915#9243]: https://gitlab.freedesktop.org/drm/intel/issues/9243


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7459 -> IGTPW_9687

  CI-20190529: 20190529
  CI_DRM_13578: 14f06805d217f849b16778b5051b69e27759a0f6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9687: 9687
  IGT_7459: 7459

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/index.html

--===============7378748754684559351==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: add sync object tests (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/119304/">https://patchwork.freedesktop.org/series/119304/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13578 -&gt; IGTPW_9687</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/index.html</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Missing    (3): fi-kbl-soraka bat-adlp-6 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9687 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6311">i915#6311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8260">i915#8260</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/bat-jsl-1/igt@gem_exec_suspend@basic-s0@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5122">i915#5122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/bat-jsl-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/bat-rpls-2/igt@i915_selftest@live@mman.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6794">i915#6794</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7392">i915#7392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/bat-rpls-2/igt@i915_selftest@live@mman.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8747">i915#8747</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/bat-jsl-1/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/bat-jsl-1/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@cursor_plane_move:<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13578/bat-rplp-1/igt@kms_psr@cursor_plane_move.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9243">i915#9243</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9687/bat-rplp-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7459 -&gt; IGTPW_9687</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13578: 14f06805d217f849b16778b5051b69e27759a0f6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9687: 9687<br />
  IGT_7459: 7459</p>

</body>
</html>

--===============7378748754684559351==--
