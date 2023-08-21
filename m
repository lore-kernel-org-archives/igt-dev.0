Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2542007772228682252=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Date: Mon, 21 Aug 2023 13:58:13 -0000
Message-ID: <169262629347.22806.5937870897126799303@emeril.freedesktop.org>
References: <20230821125759.3872898-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20230821125759.3872898-1-sujaritha.sundaresan@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915=5Fpm=5Frc6=5Fresidency=3A_Add_mutli-gt_functionality_to_rc?=
 =?utf-8?q?6=5Fidle_and_rc6=5Ffence_test?=
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

--===============2542007772228682252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915_pm_rc6_residency: Add mutli-gt functionality to rc6_idle and rc6_fence test
URL   : https://patchwork.freedesktop.org/series/122703/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7448 -> IGTPW_9626
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9626 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9626, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/index.html

Participating hosts (40 -> 39)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (2): fi-snb-2520m fi-pnv-d510 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9626:

### IGT changes ###

#### Possible regressions ####

  * igt@dmabuf@all-tests@sanitycheck:
    - fi-cfl-8109u:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7448/fi-cfl-8109u/igt@dmabuf@all-tests@sanitycheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/fi-cfl-8109u/igt@dmabuf@all-tests@sanitycheck.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - bat-dg2-9:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7448/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html

  
Known issues
------------

  Here are the changes found in IGTPW_9626 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@basic-auth:
    - bat-adlp-11:        NOTRUN -> [ABORT][5] ([i915#9164])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/bat-adlp-11/igt@core_auth@basic-auth.html

  * igt@dmabuf@all-tests@dma_fence:
    - fi-cfl-8109u:       [PASS][6] -> [DMESG-FAIL][7] ([i915#8189])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7448/fi-cfl-8109u/igt@dmabuf@all-tests@dma_fence.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/fi-cfl-8109u/igt@dmabuf@all-tests@dma_fence.html
    - bat-atsm-1:         [PASS][8] -> [DMESG-FAIL][9] ([i915#8189])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7448/bat-atsm-1/igt@dmabuf@all-tests@dma_fence.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/bat-atsm-1/igt@dmabuf@all-tests@dma_fence.html

  * igt@dmabuf@all-tests@sanitycheck:
    - bat-atsm-1:         [PASS][10] -> [ABORT][11] ([i915#7699])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7448/bat-atsm-1/igt@dmabuf@all-tests@sanitycheck.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/bat-atsm-1/igt@dmabuf@all-tests@sanitycheck.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-rpls-2:         [PASS][12] -> [ABORT][13] ([i915#6687] / [i915#7978] / [i915#8668])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7448/bat-rpls-2/igt@gem_exec_suspend@basic-s3@smem.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/bat-rpls-2/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#2190])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#4613]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][16] ([i915#1886] / [i915#7913])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@migrate:
    - bat-adlp-9:         [PASS][17] -> [DMESG-FAIL][18] ([i915#7699] / [i915#7913])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7448/bat-adlp-9/igt@i915_selftest@live@migrate.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/bat-adlp-9/igt@i915_selftest@live@migrate.html

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - fi-kbl-soraka:      NOTRUN -> [INCOMPLETE][19] ([i915#8617])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/fi-kbl-soraka/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][20] ([fdo#109271]) +8 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:
    - fi-ivb-3770:        NOTRUN -> [DMESG-WARN][21] ([i915#8841]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/fi-ivb-3770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-x1275:       [DMESG-FAIL][22] ([i915#5334] / [i915#7872]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7448/fi-kbl-x1275/igt@i915_selftest@live@gt_heartbeat.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/fi-kbl-x1275/igt@i915_selftest@live@gt_heartbeat.html

  
#### Warnings ####

  * igt@i915_module_load@load:
    - bat-adlp-11:        [ABORT][24] ([i915#4423]) -> [DMESG-WARN][25] ([i915#4423])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7448/bat-adlp-11/igt@i915_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/bat-adlp-11/igt@i915_module_load@load.html

  * igt@kms_psr@cursor_plane_move:
    - bat-rplp-1:         [SKIP][26] ([i915#1072]) -> [ABORT][27] ([i915#8469] / [i915#8668])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7448/bat-rplp-1/igt@kms_psr@cursor_plane_move.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/bat-rplp-1/igt@kms_psr@cursor_plane_move.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#8189]: https://gitlab.freedesktop.org/drm/intel/issues/8189
  [i915#8469]: https://gitlab.freedesktop.org/drm/intel/issues/8469
  [i915#8617]: https://gitlab.freedesktop.org/drm/intel/issues/8617
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#9164]: https://gitlab.freedesktop.org/drm/intel/issues/9164


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7448 -> IGTPW_9626

  CI-20190529: 20190529
  CI_DRM_13538: 19f1cd24387fc8bbb63a2c1a74080e73a8f53f5f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9626: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/index.html
  IGT_7448: 84aa6d50648d9349fb4f1520f37e5374908c9f4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/index.html

--===============2542007772228682252==
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
<tr><td><b>Series:</b></td><td>tests/i915_pm_rc6_residency: Add mutli-gt functionality to rc6_idle and rc6_fence test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122703/">https://patchwork.freedesktop.org/series/122703/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7448 -&gt; IGTPW_9626</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9626 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9626, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (2): fi-snb-2520m fi-pnv-d510 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9626:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@sanitycheck:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7448/fi-cfl-8109u/igt@dmabuf@all-tests@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/fi-cfl-8109u/igt@dmabuf@all-tests@sanitycheck.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7448/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9626 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/bat-adlp-11/igt@core_auth@basic-auth.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9164">i915#9164</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@dma_fence:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7448/fi-cfl-8109u/igt@dmabuf@all-tests@dma_fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/fi-cfl-8109u/igt@dmabuf@all-tests@dma_fence.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8189">i915#8189</a>)</p>
</li>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7448/bat-atsm-1/igt@dmabuf@all-tests@dma_fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/bat-atsm-1/igt@dmabuf@all-tests@dma_fence.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8189">i915#8189</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@sanitycheck:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7448/bat-atsm-1/igt@dmabuf@all-tests@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/bat-atsm-1/igt@dmabuf@all-tests@sanitycheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7448/bat-rpls-2/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/bat-rpls-2/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7448/bat-adlp-9/igt@i915_selftest@live@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/bat-adlp-9/igt@i915_selftest@live@migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-bad-modifier:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/fi-kbl-soraka/igt@kms_addfb_basic@addfb25-bad-modifier.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8617">i915#8617</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/fi-ivb-3770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_heartbeat:<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7448/fi-kbl-x1275/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7872">i915#7872</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/fi-kbl-x1275/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7448/bat-adlp-11/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/bat-adlp-11/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7448/bat-rplp-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/bat-rplp-1/igt@kms_psr@cursor_plane_move.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8469">i915#8469</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7448 -&gt; IGTPW_9626</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13538: 19f1cd24387fc8bbb63a2c1a74080e73a8f53f5f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9626: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9626/index.html<br />
  IGT_7448: 84aa6d50648d9349fb4f1520f37e5374908c9f4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2542007772228682252==--
