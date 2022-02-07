Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7577245801648152453=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 07 Feb 2022 19:01:40 -0000
Message-ID: <164426050038.23830.11172137830849829844@emeril.freedesktop.org>
References: <20220207182152.31211-1-jeevan.b@intel.com>
In-Reply-To: <20220207182152.31211-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgREcyIHBs?=
 =?utf-8?q?atform_definition_and_Tile_4_plane_format_support?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============7577245801648152453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DG2 platform definition and Tile 4 plane format support
URL   : https://patchwork.freedesktop.org/series/99784/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11197 -> IGTPW_6599
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/index.html

Participating hosts (44 -> 41)
------------------------------

  Additional (4): fi-kbl-soraka fi-kbl-guc fi-apl-guc fi-pnv-d510 
  Missing    (7): fi-bxt-dsi shard-tglu fi-tgl-dsi fi-bsw-cyan fi-ilk-650 shard-rkl fi-bsw-nick 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6599:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_suspend@basic-s3@smem:
    - {fi-rkl-11600}:     [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html

  
Known issues
------------

  Here are the changes found in IGTPW_6599 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@read_all_entries:
    - fi-apl-guc:         NOTRUN -> [DMESG-WARN][3] ([i915#1610])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-apl-guc/igt@debugfs_test@read_all_entries.html

  * igt@fbdev@nullptr:
    - fi-kbl-guc:         NOTRUN -> [SKIP][4] ([fdo#109271]) +18 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-kbl-guc/igt@fbdev@nullptr.html

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][5] ([fdo#109271]) +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_huc_copy@huc-copy:
    - fi-skl-6600u:       NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#2190])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][7] ([fdo#109271]) +57 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#2190])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-guc:         NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#4613]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-kbl-guc/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#4613]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-kbl-soraka/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-skl-6600u:       NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#4613]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-skl-6600u/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][12] ([i915#1886] / [i915#2291])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_busy@basic:
    - fi-kbl-guc:         NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#1845])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-kbl-guc/igt@kms_busy@basic.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][14] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-kbl-soraka/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-guc:         NOTRUN -> [SKIP][15] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-kbl-guc/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-skl-6600u:       NOTRUN -> [SKIP][16] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-skl-6600u/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-skl-6600u:       NOTRUN -> [SKIP][17] ([fdo#109271]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-skl-6600u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-skl-6600u:       NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#533])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#533])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_psr@primary_page_flip:
    - fi-skl-6600u:       NOTRUN -> [FAIL][20] ([i915#4547])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-skl-6600u/igt@kms_psr@primary_page_flip.html

  * igt@runner@aborted:
    - fi-apl-guc:         NOTRUN -> [FAIL][21] ([i915#2426] / [i915#4312])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-apl-guc/igt@runner@aborted.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][22] ([i915#2426] / [i915#4312])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-bdw-5557u/igt@runner@aborted.html

  
#### Warnings ####

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-5:          [DMESG-FAIL][23] ([i915#4494] / [i915#4957]) -> [DMESG-FAIL][24] ([i915#4957])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/bat-dg1-5/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4897]: https://gitlab.freedesktop.org/drm/intel/issues/4897
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6339 -> IGTPW_6599

  CI-20190529: 20190529
  CI_DRM_11197: 3d72770ba26d63ddb15d5495317d43292acdf974 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6599: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/index.html
  IGT_6339: 9cd99d763440ae75d9981ce4e361d3deb5edb4e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/index.html

--===============7577245801648152453==
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
<tr><td><b>Series:</b></td><td>DG2 platform definition and Tile 4 plane format support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/99784/">https://patchwork.freedesktop.org/series/99784/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11197 -&gt; IGTPW_6599</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/index.html</p>
<h2>Participating hosts (44 -&gt; 41)</h2>
<p>Additional (4): fi-kbl-soraka fi-kbl-guc fi-apl-guc fi-pnv-d510 <br />
  Missing    (7): fi-bxt-dsi shard-tglu fi-tgl-dsi fi-bsw-cyan fi-ilk-650 shard-rkl fi-bsw-nick </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6599:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_exec_suspend@basic-s3@smem:<ul>
<li>{fi-rkl-11600}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6599 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-apl-guc/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-kbl-guc/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +57 similar issues</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-kbl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-kbl-soraka/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-skl-6600u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-kbl-guc/igt@kms_busy@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-kbl-soraka/igt@kms_chamelium@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-kbl-guc/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-skl-6600u/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-skl-6600u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-apl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6339 -&gt; IGTPW_6599</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11197: 3d72770ba26d63ddb15d5495317d43292acdf974 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6599: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/index.html<br />
  IGT_6339: 9cd99d763440ae75d9981ce4e361d3deb5edb4e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
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

--===============7577245801648152453==--
