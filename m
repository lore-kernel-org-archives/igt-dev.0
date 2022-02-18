Return-path: <SRS0=2yIq=TB=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Content-Type: multipart/alternative;
 boundary="===============6833012587207151377=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Fri, 18 Feb 2022 10:21:16 -0000
Message-ID: <164517967600.25451.4100206247871238473@emeril.freedesktop.org>
References: <20220218090936.15857-1-jeevan.b@intel.com>
In-Reply-To: <20220218090936.15857-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgREcyIHBs?=
 =?utf-8?q?atform_definition_and_Tile_4_plane_format_support_=28rev4=29?=
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

--===============6833012587207151377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DG2 platform definition and Tile 4 plane format support (rev4)
URL   : https://patchwork.freedesktop.org/series/99784/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11246 -> IGTPW_6652
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_6652 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6652, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/index.html

Participating hosts (44 -> 44)
------------------------------

  Additional (2): bat-adlp-4 fi-pnv-d510 
  Missing    (2): fi-bsw-cyan shard-tglu 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6652:

### IGT changes ###

#### Warnings ####

  * igt@kms_chamelium@vga-hpd-fast:
    - fi-kbl-soraka:      [SKIP][1] ([fdo#109271] / [fdo#111827]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11246/fi-kbl-soraka/igt@kms_chamelium@vga-hpd-fast.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-kbl-soraka/igt@kms_chamelium@vga-hpd-fast.html

  
Known issues
------------

  Here are the changes found in IGTPW_6652 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-pnv-d510:        NOTRUN -> [SKIP][3] ([fdo#109271]) +57 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - bat-adlp-4:         NOTRUN -> [SKIP][4] ([i915#4613]) +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/bat-adlp-4/igt@gem_lmem_swapping@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-adlp-4:         NOTRUN -> [SKIP][5] ([i915#3282])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/bat-adlp-4/igt@gem_tiled_pread_basic.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][6] -> [INCOMPLETE][7] ([i915#3303])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11246/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
    - fi-bdw-5557u:       NOTRUN -> [INCOMPLETE][8] ([i915#3921])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-bdw-5557u/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][9] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-bdw-5557u/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_chamelium@vga-hpd-fast:
    - bat-adlp-4:         NOTRUN -> [SKIP][10] ([fdo#111827]) +8 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/bat-adlp-4/igt@kms_chamelium@vga-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-adlp-4:         NOTRUN -> [SKIP][11] ([i915#4103]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/bat-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-adlp-4:         NOTRUN -> [SKIP][12] ([fdo#109285])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/bat-adlp-4/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_psr@cursor_plane_move:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][13] ([fdo#109271]) +13 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-bdw-5557u/igt@kms_psr@cursor_plane_move.html

  * igt@prime_vgem@basic-fence-read:
    - bat-adlp-4:         NOTRUN -> [SKIP][14] ([i915#3291] / [i915#3708]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/bat-adlp-4/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-userptr:
    - bat-adlp-4:         NOTRUN -> [SKIP][15] ([i915#3301] / [i915#3708])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/bat-adlp-4/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][16] ([fdo#109271] / [i915#1436] / [i915#4312])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-hsw-4770/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - {fi-rkl-11600}:     [INCOMPLETE][17] ([i915#5127]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11246/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-5:          [DMESG-FAIL][19] ([i915#4494] / [i915#4957]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11246/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
    - {fi-jsl-1}:         [INCOMPLETE][21] -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11246/fi-jsl-1/igt@i915_selftest@live@hangcheck.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-jsl-1/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@reset:
    - {bat-adlp-6}:       [INCOMPLETE][23] ([i915#4983]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11246/bat-adlp-6/igt@i915_selftest@live@reset.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/bat-adlp-6/igt@i915_selftest@live@reset.html

  
#### Warnings ####

  * igt@kms_psr@primary_page_flip:
    - fi-skl-6600u:       [INCOMPLETE][25] ([i915#4547] / [i915#4838]) -> [FAIL][26] ([i915#4547])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11246/fi-skl-6600u/igt@kms_psr@primary_page_flip.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-skl-6600u/igt@kms_psr@primary_page_flip.html

  * igt@runner@aborted:
    - fi-skl-6600u:       [FAIL][27] ([i915#2722] / [i915#4312]) -> [FAIL][28] ([i915#4312])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11246/fi-skl-6600u/igt@runner@aborted.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-skl-6600u/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4838]: https://gitlab.freedesktop.org/drm/intel/issues/4838
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5127]: https://gitlab.freedesktop.org/drm/intel/issues/5127
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6347 -> IGTPW_6652

  CI-20190529: 20190529
  CI_DRM_11246: c8b8123a8f012fb43dfa6531dc62d30afcb64683 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6652: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/index.html
  IGT_6347: 37ea4c86f97c0e05fcb6b04cff72ec927930536e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_addfb_basic@addfb25-4-tiled
+igt@kms_big_fb@4-tiled-8bpp-rotate-0
+igt@kms_big_fb@4-tiled-8bpp-rotate-90
+igt@kms_big_fb@4-tiled-8bpp-rotate-180
+igt@kms_big_fb@4-tiled-8bpp-rotate-270
+igt@kms_big_fb@4-tiled-16bpp-rotate-0
+igt@kms_big_fb@4-tiled-16bpp-rotate-90
+igt@kms_big_fb@4-tiled-16bpp-rotate-180
+igt@kms_big_fb@4-tiled-16bpp-rotate-270
+igt@kms_big_fb@4-tiled-32bpp-rotate-0
+igt@kms_big_fb@4-tiled-32bpp-rotate-90
+igt@kms_big_fb@4-tiled-32bpp-rotate-180
+igt@kms_big_fb@4-tiled-32bpp-rotate-270
+igt@kms_big_fb@4-tiled-64bpp-rotate-0
+igt@kms_big_fb@4-tiled-64bpp-rotate-90
+igt@kms_big_fb@4-tiled-64bpp-rotate-180
+igt@kms_big_fb@4-tiled-64bpp-rotate-270
+igt@kms_big_fb@4-tiled-addfb
+igt@kms_big_fb@4-tiled-addfb-size-offset-overflow
+igt@kms_big_fb@4-tiled-addfb-size-overflow
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
+igt@kms_draw_crc@draw-method-rgb565-blt-4tiled
+igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled
+igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled
+igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled
+igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled
+igt@kms_draw_crc@draw-method-rgb565-render-4tiled
+igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled
+igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled
+igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled
+igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled
+igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled
+igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled
+igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled
+igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled
+igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled
+igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled
+igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled
+igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled
+igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4
+igt@kms_frontbuffer_tracking@fbcpsrdrrs-tiling-4
+igt@kms_frontbuffer_tracking@fbcpsr-tiling-4
+igt@kms_frontbuffer_tracking@fbc-tiling-4
+igt@kms_plane_lowres@pipe-a-tiling-4
+igt@kms_plane_lowres@pipe-b-tiling-4
+igt@kms_plane_lowres@pipe-c-tiling-4
+igt@kms_plane_lowres@pipe-d-tiling-4
+igt@kms_plane_lowres@pipe-e-tiling-4
+igt@kms_plane_lowres@pipe-f-tiling-4
+igt@kms_plane_multiple@atomic-pipe-a-tiling-4
+igt@kms_plane_multiple@atomic-pipe-b-tiling-4
+igt@kms_plane_multiple@atomic-pipe-c-tiling-4
+igt@kms_plane_multiple@atomic-pipe-d-tiling-4
+igt@kms_plane_multiple@atomic-pipe-e-tiling-4
+igt@kms_plane_multiple@atomic-pipe-f-tiling-4
+igt@kms_rotation_crc@primary-4-tiled-reflect-x-0
+igt@kms_rotation_crc@primary-4-tiled-reflect-x-180

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/index.html

--===============6833012587207151377==
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
<tr><td><b>Series:</b></td><td>DG2 platform definition and Tile 4 plane format support (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/99784/">https://patchwork.freedesktop.org/series/99784/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11246 -&gt; IGTPW_6652</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_6652 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6652, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/index.html</p>
<h2>Participating hosts (44 -&gt; 44)</h2>
<p>Additional (2): bat-adlp-4 fi-pnv-d510 <br />
  Missing    (2): fi-bsw-cyan shard-tglu </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6652:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_chamelium@vga-hpd-fast:<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11246/fi-kbl-soraka/igt@kms_chamelium@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-kbl-soraka/igt@kms_chamelium@vga-hpd-fast.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6652 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +57 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/bat-adlp-4/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/bat-adlp-4/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11246/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-bdw-5557u/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-bdw-5557u/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/bat-adlp-4/igt@kms_chamelium@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/bat-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/bat-adlp-4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-bdw-5557u/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/bat-adlp-4/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/bat-adlp-4/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{fi-rkl-11600}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11246/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5127">i915#5127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11246/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11246/fi-jsl-1/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-jsl-1/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11246/bat-adlp-6/igt@i915_selftest@live@reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/bat-adlp-6/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11246/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4838">i915#4838</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11246/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6347 -&gt; IGTPW_6652</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11246: c8b8123a8f012fb43dfa6531dc62d30afcb64683 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6652: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6652/index.html<br />
  IGT_6347: 37ea4c86f97c0e05fcb6b04cff72ec927930536e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_addfb_basic@addfb25-4-tiled<br />
+igt@kms_big_fb@4-tiled-8bpp-rotate-0<br />
+igt@kms_big_fb@4-tiled-8bpp-rotate-90<br />
+igt@kms_big_fb@4-tiled-8bpp-rotate-180<br />
+igt@kms_big_fb@4-tiled-8bpp-rotate-270<br />
+igt@kms_big_fb@4-tiled-16bpp-rotate-0<br />
+igt@kms_big_fb@4-tiled-16bpp-rotate-90<br />
+igt@kms_big_fb@4-tiled-16bpp-rotate-180<br />
+igt@kms_big_fb@4-tiled-16bpp-rotate-270<br />
+igt@kms_big_fb@4-tiled-32bpp-rotate-0<br />
+igt@kms_big_fb@4-tiled-32bpp-rotate-90<br />
+igt@kms_big_fb@4-tiled-32bpp-rotate-180<br />
+igt@kms_big_fb@4-tiled-32bpp-rotate-270<br />
+igt@kms_big_fb@4-tiled-64bpp-rotate-0<br />
+igt@kms_big_fb@4-tiled-64bpp-rotate-90<br />
+igt@kms_big_fb@4-tiled-64bpp-rotate-180<br />
+igt@kms_big_fb@4-tiled-64bpp-rotate-270<br />
+igt@kms_big_fb@4-tiled-addfb<br />
+igt@kms_big_fb@4-tiled-addfb-size-offset-overflow<br />
+igt@kms_big_fb@4-tiled-addfb-size-overflow<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip<br />
+igt@kms_draw_crc@draw-method-rgb565-blt-4tiled<br />
+igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled<br />
+igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled<br />
+igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled<br />
+igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled<br />
+igt@kms_draw_crc@draw-method-rgb565-render-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled<br />
+igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4<br />
+igt@kms_frontbuffer_tracking@fbcpsrdrrs-tiling-4<br />
+igt@kms_frontbuffer_tracking@fbcpsr-tiling-4<br />
+igt@kms_frontbuffer_tracking@fbc-tiling-4<br />
+igt@kms_plane_lowres@pipe-a-tiling-4<br />
+igt@kms_plane_lowres@pipe-b-tiling-4<br />
+igt@kms_plane_lowres@pipe-c-tiling-4<br />
+igt@kms_plane_lowres@pipe-d-tiling-4<br />
+igt@kms_plane_lowres@pipe-e-tiling-4<br />
+igt@kms_plane_lowres@pipe-f-tiling-4<br />
+igt@kms_plane_multiple@atomic-pipe-a-tiling-4<br />
+igt@kms_plane_multiple@atomic-pipe-b-tiling-4<br />
+igt@kms_plane_multiple@atomic-pipe-c-tiling-4<br />
+igt@kms_plane_multiple@atomic-pipe-d-tiling-4<br />
+igt@kms_plane_multiple@atomic-pipe-e-tiling-4<br />
+igt@kms_plane_multiple@atomic-pipe-f-tiling-4<br />
+igt@kms_rotation_crc@primary-4-tiled-reflect-x-0<br />
+igt@kms_rotation_crc@primary-4-tiled-reflect-x-180</p>

</body>
</html>

--===============6833012587207151377==--
