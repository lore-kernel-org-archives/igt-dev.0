Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2223619067030533502=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Wed, 03 Aug 2022 05:01:37 -0000
Message-ID: <165950289752.15010.6201918504098804426@emeril.freedesktop.org>
References: <20220803042002.1929-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220803042002.1929-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fdraw=5Fcrc=3A_Test_Cleanup_=28rev3=29?=
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

--===============2223619067030533502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_draw_crc: Test Cleanup (rev3)
URL   : https://patchwork.freedesktop.org/series/106898/
State : success

== Summary ==

CI Bug Log - changes from IGT_6610 -> IGTPW_7599
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/index.html

Participating hosts (44 -> 43)
------------------------------

  Additional (2): bat-dg2-8 fi-ilk-650 
  Missing    (3): fi-ctg-p8600 fi-icl-u2 fi-hsw-4200u 

Known issues
------------

  Here are the changes found in IGTPW_7599 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-ilk-650:         NOTRUN -> [SKIP][1] ([fdo#109271]) +19 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/fi-ilk-650/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_selftest@live@hangcheck:
    - fi-ivb-3770:        [PASS][2] -> [INCOMPLETE][3] ([i915#3303] / [i915#5370])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6610/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-rkl-11600:       NOTRUN -> [SKIP][4] ([fdo#111827])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/fi-rkl-11600/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-ilk-650:         NOTRUN -> [SKIP][5] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/fi-ilk-650/igt@kms_chamelium@dp-hpd-fast.html

  * igt@runner@aborted:
    - fi-ivb-3770:        NOTRUN -> [FAIL][6] ([fdo#109271] / [i915#4312])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/fi-ivb-3770/igt@runner@aborted.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][7] ([i915#4312])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/fi-bdw-5557u/igt@runner@aborted.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][8] ([i915#4312])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/fi-cfl-8700k/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - {bat-adlm-1}:       [DMESG-WARN][9] ([i915#2867]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6610/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_selftest@live@hangcheck:
    - {fi-jsl-1}:         [INCOMPLETE][11] ([i915#6106]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6610/fi-jsl-1/igt@i915_selftest@live@hangcheck.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/fi-jsl-1/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [INCOMPLETE][13] ([i915#5982]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6610/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
    - fi-bdw-5557u:       [INCOMPLETE][15] ([i915#146]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6610/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5370]: https://gitlab.freedesktop.org/drm/intel/issues/5370
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#5982]: https://gitlab.freedesktop.org/drm/intel/issues/5982
  [i915#6106]: https://gitlab.freedesktop.org/drm/intel/issues/6106


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6610 -> IGTPW_7599

  CI-20190529: 20190529
  CI_DRM_11963: d0b86a71849272bc47e5434cd0b0c428c1c6b2f5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7599: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/index.html
  IGT_6610: c93f93dfe91a77e6a884f826d61f927106988b5f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_draw_crc@draw-method
-igt@kms_draw_crc@draw-method-rgb565-blt-4tiled
-igt@kms_draw_crc@draw-method-rgb565-blt-untiled
-igt@kms_draw_crc@draw-method-rgb565-blt-xtiled
-igt@kms_draw_crc@draw-method-rgb565-blt-ytiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled
-igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled
-igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled
-igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled
-igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled
-igt@kms_draw_crc@draw-method-rgb565-render-4tiled
-igt@kms_draw_crc@draw-method-rgb565-render-untiled
-igt@kms_draw_crc@draw-method-rgb565-render-xtiled
-igt@kms_draw_crc@draw-method-rgb565-render-ytiled
-igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled
-igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled
-igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled
-igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-ytiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-xtiled
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-ytiled
-igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled
-igt@kms_draw_crc@draw-method-xrgb8888-render-untiled
-igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled
-igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled
-igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled
-igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled
-igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled
-igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/index.html

--===============2223619067030533502==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_draw_crc: Test Cleanup (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/106898/">https://patchwork.freedesktop.org/series/106898/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6610 -&gt; IGTPW_7599</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/index.html</p>
<h2>Participating hosts (44 -&gt; 43)</h2>
<p>Additional (2): bat-dg2-8 fi-ilk-650 <br />
  Missing    (3): fi-ctg-p8600 fi-icl-u2 fi-hsw-4200u </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7599 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/fi-ilk-650/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6610/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5370">i915#5370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/fi-rkl-11600/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/fi-ilk-650/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/fi-ivb-3770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/fi-cfl-8700k/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6610/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6610/fi-jsl-1/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6106">i915#6106</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/fi-jsl-1/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6610/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5982">i915#5982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6610/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6610 -&gt; IGTPW_7599</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11963: d0b86a71849272bc47e5434cd0b0c428c1c6b2f5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7599: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7599/index.html<br />
  IGT_6610: c93f93dfe91a77e6a884f826d61f927106988b5f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_draw_crc@draw-method<br />
-igt@kms_draw_crc@draw-method-rgb565-blt-4tiled<br />
-igt@kms_draw_crc@draw-method-rgb565-blt-untiled<br />
-igt@kms_draw_crc@draw-method-rgb565-blt-xtiled<br />
-igt@kms_draw_crc@draw-method-rgb565-blt-ytiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled<br />
-igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled<br />
-igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled<br />
-igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled<br />
-igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled<br />
-igt@kms_draw_crc@draw-method-rgb565-render-4tiled<br />
-igt@kms_draw_crc@draw-method-rgb565-render-untiled<br />
-igt@kms_draw_crc@draw-method-rgb565-render-xtiled<br />
-igt@kms_draw_crc@draw-method-rgb565-render-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-render-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled</p>

</body>
</html>

--===============2223619067030533502==--
