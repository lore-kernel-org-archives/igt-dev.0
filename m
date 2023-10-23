Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6690659818162905344=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Date: Mon, 23 Oct 2023 22:39:09 -0000
Message-ID: <169810074971.19839.15864840265614053186@emeril.freedesktop.org>
References: <20231020060503.870173-1-kunal1.joshi@intel.com>
In-Reply-To: <20231020060503.870173-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgZXh0ZW5k?=
 =?utf-8?q?_kms=5Fpsr_test_to_validate_pr?=
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

--===============6690659818162905344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: extend kms_psr test to validate pr
URL   : https://patchwork.freedesktop.org/series/125379/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7551 -> IGTPW_10037
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10037 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10037, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/index.html

Participating hosts (36 -> 36)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (1): fi-hsw-4770 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10037:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_psr@sprite_plane_onoff:
    - bat-jsl-1:          [PASS][1] -> [SKIP][2] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-jsl-1/igt@kms_psr@sprite_plane_onoff.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-jsl-1/igt@kms_psr@sprite_plane_onoff.html
    - bat-jsl-3:          [PASS][3] -> [SKIP][4] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html

  
#### Warnings ####

  * igt@kms_psr@cursor_plane_move:
    - bat-adlm-1:         [SKIP][5] ([i915#1072]) -> [SKIP][6] +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-adlm-1/igt@kms_psr@cursor_plane_move.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-adlm-1/igt@kms_psr@cursor_plane_move.html
    - fi-tgl-1115g4:      [SKIP][7] ([fdo#110189]) -> [SKIP][8] +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/fi-tgl-1115g4/igt@kms_psr@cursor_plane_move.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/fi-tgl-1115g4/igt@kms_psr@cursor_plane_move.html
    - bat-rpls-1:         [SKIP][9] ([i915#1072]) -> [SKIP][10] +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-rpls-1/igt@kms_psr@cursor_plane_move.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-rpls-1/igt@kms_psr@cursor_plane_move.html
    - bat-mtlp-6:         [SKIP][11] ([i915#1072]) -> [SKIP][12] +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-mtlp-6/igt@kms_psr@cursor_plane_move.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-mtlp-6/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-adlp-9:         [SKIP][13] ([i915#1072]) -> [SKIP][14] +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-adlp-9/igt@kms_psr@sprite_plane_onoff.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-adlp-9/igt@kms_psr@sprite_plane_onoff.html
    - fi-rkl-11600:       [SKIP][15] ([i915#1072]) -> [SKIP][16] +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/fi-rkl-11600/igt@kms_psr@sprite_plane_onoff.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/fi-rkl-11600/igt@kms_psr@sprite_plane_onoff.html
    - bat-adls-5:         [SKIP][17] ([i915#1072]) -> [SKIP][18] +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-adls-5/igt@kms_psr@sprite_plane_onoff.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-adls-5/igt@kms_psr@sprite_plane_onoff.html
    - bat-dg1-5:          [SKIP][19] ([i915#1072] / [i915#4078]) -> [SKIP][20] +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-dg1-5/igt@kms_psr@sprite_plane_onoff.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-dg1-5/igt@kms_psr@sprite_plane_onoff.html
    - bat-dg2-9:          [SKIP][21] ([i915#1072]) -> [SKIP][22] +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-dg2-9/igt@kms_psr@sprite_plane_onoff.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-dg2-9/igt@kms_psr@sprite_plane_onoff.html
    - bat-dg2-11:         [SKIP][23] ([i915#1072]) -> [SKIP][24] +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html

  
Known issues
------------

  Here are the changes found in IGTPW_10037 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#2190])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][27] ([i915#1886])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_dsc@dsc-basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][28] ([fdo#109271]) +13 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-dg2-9:          NOTRUN -> [SKIP][29] ([i915#1845] / [i915#9197])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_psr@cursor_plane_move:
    - fi-skl-6600u:       [PASS][30] -> [SKIP][31] ([fdo#109271]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/fi-skl-6600u/igt@kms_psr@cursor_plane_move.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/fi-skl-6600u/igt@kms_psr@cursor_plane_move.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-dg2-9:          [INCOMPLETE][32] ([i915#9275]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#7359]: https://gitlab.freedesktop.org/drm/intel/issues/7359
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952
  [i915#8981]: https://gitlab.freedesktop.org/drm/intel/issues/8981
  [i915#9197]: https://gitlab.freedesktop.org/drm/intel/issues/9197
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7551 -> IGTPW_10037

  CI-20190529: 20190529
  CI_DRM_13777: 1b4fd688d213556268c50f853746c94c9a0cfee7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10037: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/index.html
  IGT_7551: 15e7d92ca5f98d10feffa27a76724c33cbd68da5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_psr@pr_basic
+igt@kms_psr@pr_cursor_blt
+igt@kms_psr@pr_cursor_mmap_cpu
+igt@kms_psr@pr_cursor_mmap_gtt
+igt@kms_psr@pr_cursor_plane_move
+igt@kms_psr@pr_cursor_plane_onoff
+igt@kms_psr@pr_cursor_render
+igt@kms_psr@pr_dpms
+igt@kms_psr@pr_no_drrs
+igt@kms_psr@pr_primary_blt
+igt@kms_psr@pr_primary_mmap_cpu
+igt@kms_psr@pr_primary_mmap_gtt
+igt@kms_psr@pr_primary_page_flip
+igt@kms_psr@pr_primary_render
+igt@kms_psr@pr_sprite_blt
+igt@kms_psr@pr_sprite_mmap_cpu
+igt@kms_psr@pr_sprite_mmap_gtt
+igt@kms_psr@pr_sprite_plane_move
+igt@kms_psr@pr_sprite_plane_onoff
+igt@kms_psr@pr_sprite_render
+igt@kms_psr@pr_suspend
-igt@xe_access_counter@invalid-param

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/index.html

--===============6690659818162905344==
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
<tr><td><b>Series:</b></td><td>extend kms_psr test to validate pr</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125379/">https://patchwork.freedesktop.org/series/125379/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7551 -&gt; IGTPW_10037</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10037 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10037, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/index.html</p>
<h2>Participating hosts (36 -&gt; 36)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (1): fi-hsw-4770 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10037:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-jsl-1/igt@kms_psr@sprite_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-jsl-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> +3 other tests skip</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-adlm-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-adlm-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/fi-tgl-1115g4/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/fi-tgl-1115g4/igt@kms_psr@cursor_plane_move.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-rpls-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-rpls-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-mtlp-6/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-mtlp-6/igt@kms_psr@cursor_plane_move.html">SKIP</a> +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-adlp-9/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-adlp-9/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/fi-rkl-11600/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/fi-rkl-11600/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-adls-5/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-adls-5/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-dg1-5/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-dg1-5/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-dg2-9/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-dg2-9/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-dg2-11/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> +3 other tests skip</p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10037 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9197">i915#9197</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/fi-skl-6600u/igt@kms_psr@cursor_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/fi-skl-6600u/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s0@smem:<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7551/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7551 -&gt; IGTPW_10037</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13777: 1b4fd688d213556268c50f853746c94c9a0cfee7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10037: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10037/index.html<br />
  IGT_7551: 15e7d92ca5f98d10feffa27a76724c33cbd68da5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_psr@pr_basic<br />
+igt@kms_psr@pr_cursor_blt<br />
+igt@kms_psr@pr_cursor_mmap_cpu<br />
+igt@kms_psr@pr_cursor_mmap_gtt<br />
+igt@kms_psr@pr_cursor_plane_move<br />
+igt@kms_psr@pr_cursor_plane_onoff<br />
+igt@kms_psr@pr_cursor_render<br />
+igt@kms_psr@pr_dpms<br />
+igt@kms_psr@pr_no_drrs<br />
+igt@kms_psr@pr_primary_blt<br />
+igt@kms_psr@pr_primary_mmap_cpu<br />
+igt@kms_psr@pr_primary_mmap_gtt<br />
+igt@kms_psr@pr_primary_page_flip<br />
+igt@kms_psr@pr_primary_render<br />
+igt@kms_psr@pr_sprite_blt<br />
+igt@kms_psr@pr_sprite_mmap_cpu<br />
+igt@kms_psr@pr_sprite_mmap_gtt<br />
+igt@kms_psr@pr_sprite_plane_move<br />
+igt@kms_psr@pr_sprite_plane_onoff<br />
+igt@kms_psr@pr_sprite_render<br />
+igt@kms_psr@pr_suspend<br />
-igt@xe_access_counter@invalid-param</p>

</body>
</html>

--===============6690659818162905344==--
