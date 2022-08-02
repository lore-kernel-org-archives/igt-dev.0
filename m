Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6114505385048946539=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Tue, 02 Aug 2022 07:57:09 -0000
Message-ID: <165942702914.13190.4459178460153470987@emeril.freedesktop.org>
References: <20220802065350.26410-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220802065350.26410-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fdraw=5Fcrc=3A_Test_Cleanup?=
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

--===============6114505385048946539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_draw_crc: Test Cleanup
URL   : https://patchwork.freedesktop.org/series/106898/
State : success

== Summary ==

CI Bug Log - changes from IGT_6608 -> IGTPW_7594
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/index.html

Participating hosts (41 -> 38)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (4): fi-hsw-4770 fi-icl-u2 fi-bdw-samus bat-jsl-3 

Known issues
------------

  Here are the changes found in IGTPW_7594 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][1] ([fdo#109271]) +8 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-kbl-soraka/igt@gem_exec_gttfill@basic.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#2190])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#4613]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][4] ([i915#1886])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-g3258:       [PASS][5] -> [INCOMPLETE][6] ([i915#3303] / [i915#4785])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6608/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
    - bat-dg1-6:          [PASS][7] -> [DMESG-FAIL][8] ([i915#4494] / [i915#4957])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6608/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [INCOMPLETE][9] ([i915#6483])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-kbl-soraka/igt@i915_selftest@live@late_gt_pm.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][10] ([fdo#109271] / [fdo#111827])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-bdw-5557u/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][11] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-kbl-soraka/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - fi-bsw-kefka:       [PASS][12] -> [FAIL][13] ([i915#6298])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6608/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  * igt@runner@aborted:
    - fi-hsw-g3258:       NOTRUN -> [FAIL][14] ([fdo#109271] / [i915#4312] / [i915#6246])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-hsw-g3258/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - {bat-dg2-9}:        [DMESG-WARN][15] ([i915#5763]) -> [PASS][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6608/bat-dg2-9/igt@i915_module_load@reload.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/bat-dg2-9/igt@i915_module_load@reload.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-kefka:       [FAIL][17] ([i915#6298]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6608/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5270]: https://gitlab.freedesktop.org/drm/intel/issues/5270
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#6246]: https://gitlab.freedesktop.org/drm/intel/issues/6246
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6477]: https://gitlab.freedesktop.org/drm/intel/issues/6477
  [i915#6483]: https://gitlab.freedesktop.org/drm/intel/issues/6483


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6608 -> IGTPW_7594

  CI-20190529: 20190529
  CI_DRM_11962: 05ddc78d99dff0d2066992cb371eb68d803bdc49 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7594: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/index.html
  IGT_6608: c558dafb6c0e905cfaa02466e6bfb2a9f9cfaffe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/index.html

--===============6114505385048946539==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_draw_crc: Test Cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/106898/">https://patchwork.freedesktop.org/series/106898/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6608 -&gt; IGTPW_7594</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/index.html</p>
<h2>Participating hosts (41 -&gt; 38)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (4): fi-hsw-4770 fi-icl-u2 fi-bdw-samus bat-jsl-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7594 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-kbl-soraka/igt@gem_exec_gttfill@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6608/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</p>
</li>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6608/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-kbl-soraka/igt@i915_selftest@live@late_gt_pm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6483">i915#6483</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-bdw-5557u/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-kbl-soraka/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6608/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-hsw-g3258/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6246">i915#6246</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6608/bat-dg2-9/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5763">i915#5763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/bat-dg2-9/igt@i915_module_load@reload.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6608/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6608 -&gt; IGTPW_7594</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11962: 05ddc78d99dff0d2066992cb371eb68d803bdc49 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7594: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7594/index.html<br />
  IGT_6608: c558dafb6c0e905cfaa02466e6bfb2a9f9cfaffe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
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

--===============6114505385048946539==--
