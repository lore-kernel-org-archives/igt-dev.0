Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2906424535234411073=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Wed, 30 Mar 2022 06:22:35 -0000
Message-ID: <164862135529.8654.15302475693964187700@emeril.freedesktop.org>
References: <20220328064722.127301-1-riana.tauro@intel.com>
In-Reply-To: <20220328064722.127301-1-riana.tauro@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQmFzaWMg?=
 =?utf-8?q?Suspend/Resume_with_i915_unload_=28rev5=29?=
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

--===============2906424535234411073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Basic Suspend/Resume with i915 unload (rev5)
URL   : https://patchwork.freedesktop.org/series/101730/
State : success

== Summary ==

CI Bug Log - changes from IGT_6400 -> IGTPW_6845
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/index.html

Participating hosts (44 -> 43)
------------------------------

  Additional (3): fi-kbl-soraka fi-kbl-8809g fi-pnv-d510 
  Missing    (4): fi-hsw-4770 fi-bdw-samus fi-bsw-cyan bat-adlp-4 

New tests
---------

  New tests have been introduced between IGT_6400 and IGTPW_6845:

### New IGT tests (1) ###

  * igt@i915_suspend@system-suspend-without-i915:
    - Statuses : 37 pass(s)
    - Exec time: [1.10, 34.72] s

  

Known issues
------------

  Here are the changes found in IGTPW_6845 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][1] ([fdo#109271]) +9 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - fi-kbl-8809g:       NOTRUN -> [DMESG-WARN][2] ([i915#4962]) +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-8809g/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#2190])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#4613]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-ivb-3770:        NOTRUN -> [SKIP][6] ([fdo#109271]) +36 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-ivb-3770/igt@gem_lmem_swapping@random-engines.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#4613]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-8809g/igt@gem_lmem_swapping@random-engines.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][8] ([i915#1886])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-6:          [PASS][9] -> [DMESG-FAIL][10] ([i915#4494] / [i915#4957])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6400/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][11] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-ivb-3770:        NOTRUN -> [SKIP][12] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-ivb-3770/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][13] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-8809g/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
    - fi-pnv-d510:        NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#5341])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-pnv-d510/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#5341])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-8809g/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#533])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#533])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-8809g/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_psr@cursor_plane_move:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][18] ([fdo#109271]) +54 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-8809g/igt@kms_psr@cursor_plane_move.html

  * igt@prime_vgem@basic-userptr:
    - fi-pnv-d510:        NOTRUN -> [SKIP][19] ([fdo#109271]) +57 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-pnv-d510/igt@prime_vgem@basic-userptr.html

  
#### Possible fixes ####

  * igt@dmabuf@all@dma_fence_chain:
    - bat-dg1-6:          [INCOMPLETE][20] -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6400/bat-dg1-6/igt@dmabuf@all@dma_fence_chain.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/bat-dg1-6/igt@dmabuf@all@dma_fence_chain.html

  * igt@i915_pm_rpm@module-reload:
    - {bat-rpls-2}:       [FAIL][22] ([i915#5323]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6400/bat-rpls-2/igt@i915_pm_rpm@module-reload.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/bat-rpls-2/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_timelines:
    - {bat-rpls-2}:       [DMESG-WARN][24] ([i915#4391]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6400/bat-rpls-2/igt@i915_selftest@live@gt_timelines.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/bat-rpls-2/igt@i915_selftest@live@gt_timelines.html

  * igt@i915_selftest@live@hugepages:
    - {bat-rpls-2}:       [DMESG-WARN][26] ([i915#5278]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6400/bat-rpls-2/igt@i915_selftest@live@hugepages.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/bat-rpls-2/igt@i915_selftest@live@hugepages.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-2}:       [INCOMPLETE][28] ([i915#4983]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6400/bat-rpls-2/igt@i915_selftest@live@reset.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/bat-rpls-2/igt@i915_selftest@live@reset.html

  * igt@kms_busy@basic@flip:
    - fi-tgl-u2:          [DMESG-WARN][30] ([i915#402]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6400/fi-tgl-u2/igt@kms_busy@basic@flip.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-tgl-u2/igt@kms_busy@basic@flip.html

  * igt@kms_frontbuffer_tracking@basic:
    - {bat-dg2-9}:        [DMESG-WARN][32] ([i915#5195]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6400/bat-dg2-9/igt@kms_frontbuffer_tracking@basic.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/bat-dg2-9/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#4962]: https://gitlab.freedesktop.org/drm/intel/issues/4962
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5087]: https://gitlab.freedesktop.org/drm/intel/issues/5087
  [i915#5193]: https://gitlab.freedesktop.org/drm/intel/issues/5193
  [i915#5195]: https://gitlab.freedesktop.org/drm/intel/issues/5195
  [i915#5270]: https://gitlab.freedesktop.org/drm/intel/issues/5270
  [i915#5275]: https://gitlab.freedesktop.org/drm/intel/issues/5275
  [i915#5278]: https://gitlab.freedesktop.org/drm/intel/issues/5278
  [i915#5323]: https://gitlab.freedesktop.org/drm/intel/issues/5323
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5341]: https://gitlab.freedesktop.org/drm/intel/issues/5341


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6400 -> IGTPW_6845

  CI-20190529: 20190529
  CI_DRM_11416: 1dc2c6953e2689a0e5b7cca8450da14059d35f03 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6845: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/index.html
  IGT_6400: 1478f8f698b97256a7da2fafd4fc2675358d40c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@i915_suspend@system-suspend-without-i915

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/index.html

--===============2906424535234411073==
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
<tr><td><b>Series:</b></td><td>Basic Suspend/Resume with i915 unload (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/101730/">https://patchwork.freedesktop.org/series/101730/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6400 -&gt; IGTPW_6845</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/index.html</p>
<h2>Participating hosts (44 -&gt; 43)</h2>
<p>Additional (3): fi-kbl-soraka fi-kbl-8809g fi-pnv-d510 <br />
  Missing    (4): fi-hsw-4770 fi-bdw-samus fi-bsw-cyan bat-adlp-4 </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6400 and IGTPW_6845:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@i915_suspend@system-suspend-without-i915:<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [1.10, 34.72] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6845 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-8809g/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4962">i915#4962</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-ivb-3770/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +36 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-8809g/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6400/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-ivb-3770/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-8809g/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:</p>
<ul>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-pnv-d510/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5341">i915#5341</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-8809g/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5341">i915#5341</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-8809g/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-kbl-8809g/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +54 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-pnv-d510/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +57 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dmabuf@all@dma_fence_chain:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6400/bat-dg1-6/igt@dmabuf@all@dma_fence_chain.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/bat-dg1-6/igt@dmabuf@all@dma_fence_chain.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6400/bat-rpls-2/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5323">i915#5323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/bat-rpls-2/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6400/bat-rpls-2/igt@i915_selftest@live@gt_timelines.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4391">i915#4391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/bat-rpls-2/igt@i915_selftest@live@gt_timelines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6400/bat-rpls-2/igt@i915_selftest@live@hugepages.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5278">i915#5278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/bat-rpls-2/igt@i915_selftest@live@hugepages.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6400/bat-rpls-2/igt@i915_selftest@live@reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6400/fi-tgl-u2/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/fi-tgl-u2/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6400/bat-dg2-9/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5195">i915#5195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/bat-dg2-9/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6400 -&gt; IGTPW_6845</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11416: 1dc2c6953e2689a0e5b7cca8450da14059d35f03 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6845: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6845/index.html<br />
  IGT_6400: 1478f8f698b97256a7da2fafd4fc2675358d40c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@i915_suspend@system-suspend-without-i915</p>

</body>
</html>

--===============2906424535234411073==--
