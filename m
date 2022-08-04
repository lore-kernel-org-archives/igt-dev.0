Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6548913009118437924=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Thu, 04 Aug 2022 04:23:51 -0000
Message-ID: <165958703134.14885.6096894777277476454@emeril.freedesktop.org>
References: <20220804034029.17355-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220804034029.17355-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fdraw=5Fcrc=3A_Test_Cleanup_=28rev4=29?=
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

--===============6548913009118437924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_draw_crc: Test Cleanup (rev4)
URL   : https://patchwork.freedesktop.org/series/106898/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11966 -> IGTPW_7603
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/index.html

Participating hosts (41 -> 38)
------------------------------

  Additional (2): bat-rpls-1 bat-jsl-3 
  Missing    (5): fi-kbl-soraka fi-rkl-11600 bat-dg1-5 bat-dg2-9 bat-rpls-2 

Known issues
------------

  Here are the changes found in IGTPW_7603 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#4613]) +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][3] -> [INCOMPLETE][4] ([i915#4785])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11966/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
    - fi-snb-2600:        [PASS][5] -> [INCOMPLETE][6] ([i915#3921])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11966/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
    - bat-dg1-6:          [PASS][7] -> [DMESG-FAIL][8] ([i915#4494] / [i915#4957])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11966/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][9] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/fi-kbl-8809g/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][10] ([fdo#109271]) +25 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/fi-kbl-8809g/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * igt@runner@aborted:
    - fi-kbl-8809g:       NOTRUN -> [FAIL][11] ([i915#4312] / [i915#6219])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/fi-kbl-8809g/igt@runner@aborted.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][12] ([i915#4312])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-kefka:       [FAIL][13] ([i915#6298]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11966/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3003]: https://gitlab.freedesktop.org/drm/intel/issues/3003
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#6219]: https://gitlab.freedesktop.org/drm/intel/issues/6219
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6503]: https://gitlab.freedesktop.org/drm/intel/issues/6503


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6613 -> IGTPW_7603

  CI-20190529: 20190529
  CI_DRM_11966: f3c1d1b53388aaa69e20a1b72f8307ad57116565 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7603: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/index.html
  IGT_6613: 209230467200f2fa63a6f71fe6299996470dd813 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/index.html

--===============6548913009118437924==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_draw_crc: Test Cleanup (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/106898/">https://patchwork.freedesktop.org/series/106898/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11966 -&gt; IGTPW_7603</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/index.html</p>
<h2>Participating hosts (41 -&gt; 38)</h2>
<p>Additional (2): bat-rpls-1 bat-jsl-3 <br />
  Missing    (5): fi-kbl-soraka fi-rkl-11600 bat-dg1-5 bat-dg2-9 bat-rpls-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7603 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11966/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11966/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</p>
</li>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11966/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/fi-kbl-8809g/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/fi-kbl-8809g/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/fi-kbl-8809g/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6219">i915#6219</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11966/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6613 -&gt; IGTPW_7603</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11966: f3c1d1b53388aaa69e20a1b72f8307ad57116565 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7603: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7603/index.html<br />
  IGT_6613: 209230467200f2fa63a6f71fe6299996470dd813 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
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

--===============6548913009118437924==--
