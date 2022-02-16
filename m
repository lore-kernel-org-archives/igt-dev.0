Return-path: <SRS0=u8tb=S7=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Content-Type: multipart/alternative;
 boundary="===============2818240131242145237=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>
Date: Wed, 16 Feb 2022 13:05:47 -0000
Message-ID: <164501674750.16091.13981864881407219930@emeril.freedesktop.org>
References: <20220216102633.26949-1-jeevan.b@intel.com>
In-Reply-To: <20220216102633.26949-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgREcyIHBs?=
 =?utf-8?q?atform_definition_and_Tile_4_plane_format_support_=28rev3=29?=
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

--===============2818240131242145237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DG2 platform definition and Tile 4 plane format support (rev3)
URL   : https://patchwork.freedesktop.org/series/99784/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11233 -> IGTPW_6635
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6635 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6635, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/index.html

Participating hosts (47 -> 46)
------------------------------

  Additional (1): fi-icl-u2 
  Missing    (2): fi-bsw-cyan shard-tglu 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6635:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@workarounds:
    - fi-rkl-guc:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/fi-rkl-guc/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-rkl-guc/igt@i915_selftest@live@workarounds.html

  
Known issues
------------

  Here are the changes found in IGTPW_6635 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-hsw-4770:        NOTRUN -> [SKIP][3] ([fdo#109271] / [fdo#109315]) +17 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-hsw-4770/igt@amdgpu/amd_basic@semaphore.html

  * igt@amdgpu/amd_cs_nop@fork-gfx0:
    - fi-icl-u2:          NOTRUN -> [SKIP][4] ([fdo#109315]) +17 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-icl-u2/igt@amdgpu/amd_cs_nop@fork-gfx0.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-blb-e6850:       [PASS][5] -> [FAIL][6] ([i915#3194])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/fi-blb-e6850/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-blb-e6850/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_huc_copy@huc-copy:
    - fi-skl-6600u:       NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#2190])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html
    - fi-icl-u2:          NOTRUN -> [SKIP][8] ([i915#2190])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-icl-u2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-icl-u2:          NOTRUN -> [SKIP][9] ([i915#4613]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-icl-u2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-skl-6600u:       NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#4613]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-skl-6600u/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_selftest@live:
    - fi-skl-6600u:       NOTRUN -> [FAIL][11] ([i915#4547])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-skl-6600u/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gem:
    - fi-pnv-d510:        [PASS][12] -> [DMESG-FAIL][13] ([i915#2927])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/fi-pnv-d510/igt@i915_selftest@live@gem.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-pnv-d510/igt@i915_selftest@live@gem.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-5:          [PASS][14] -> [DMESG-FAIL][15] ([i915#4494] / [i915#4957])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
    - fi-snb-2600:        [PASS][16] -> [INCOMPLETE][17] ([i915#3921])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          NOTRUN -> [SKIP][18] ([fdo#111827]) +8 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-skl-6600u:       NOTRUN -> [SKIP][19] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-skl-6600u/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-icl-u2:          NOTRUN -> [SKIP][20] ([fdo#109278]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-skl-6600u:       NOTRUN -> [SKIP][21] ([fdo#109271]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-skl-6600u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-icl-u2:          NOTRUN -> [SKIP][22] ([fdo#109285])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-skl-6600u:       NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#533])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@prime_vgem@basic-userptr:
    - fi-icl-u2:          NOTRUN -> [SKIP][24] ([i915#3301])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-icl-u2/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-pnv-d510:        NOTRUN -> [FAIL][25] ([fdo#109271] / [i915#2403] / [i915#4312])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-pnv-d510/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@debugfs_test@read_all_entries:
    - fi-cfl-8109u:       [DMESG-WARN][26] ([i915#203] / [i915#262] / [i915#295]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/fi-cfl-8109u/igt@debugfs_test@read_all_entries.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-cfl-8109u/igt@debugfs_test@read_all_entries.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - fi-cfl-8109u:       [DMESG-WARN][28] ([i915#203] / [i915#295]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/fi-cfl-8109u/igt@gem_exec_suspend@basic-s0@smem.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-cfl-8109u/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_flink_basic@bad-flink:
    - fi-skl-6600u:       [INCOMPLETE][30] ([i915#4547]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html

  * igt@i915_selftest@live@gt_heartbeat:
    - {fi-ehl-2}:         [DMESG-FAIL][32] -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/fi-ehl-2/igt@i915_selftest@live@gt_heartbeat.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-ehl-2/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][34] ([i915#3303]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-skl-6600u:       [FAIL][36] ([i915#2722] / [i915#4312]) -> [FAIL][37] ([i915#1436] / [i915#4312])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/fi-skl-6600u/igt@runner@aborted.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-skl-6600u/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#203]: https://gitlab.freedesktop.org/drm/intel/issues/203
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2927]: https://gitlab.freedesktop.org/drm/intel/issues/2927
  [i915#295]: https://gitlab.freedesktop.org/drm/intel/issues/295
  [i915#3194]: https://gitlab.freedesktop.org/drm/intel/issues/3194
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4897]: https://gitlab.freedesktop.org/drm/intel/issues/4897
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5127]: https://gitlab.freedesktop.org/drm/intel/issues/5127
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6347 -> IGTPW_6635

  CI-20190529: 20190529
  CI_DRM_11233: 7bb15e416a5fa97dcbfe36f1461939a42266831e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6635: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/index.html
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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/index.html

--===============2818240131242145237==
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
<tr><td><b>Series:</b></td><td>DG2 platform definition and Tile 4 plane format support (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/99784/">https://patchwork.freedesktop.org/series/99784/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11233 -&gt; IGTPW_6635</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6635 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6635, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/index.html</p>
<h2>Participating hosts (47 -&gt; 46)</h2>
<p>Additional (1): fi-icl-u2 <br />
  Missing    (2): fi-bsw-cyan shard-tglu </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6635:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/fi-rkl-guc/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-rkl-guc/igt@i915_selftest@live@workarounds.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6635 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-hsw-4770/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@fork-gfx0:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-icl-u2/igt@amdgpu/amd_cs_nop@fork-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/fi-blb-e6850/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-blb-e6850/igt@core_hotunplug@unbind-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3194">i915#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-icl-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-icl-u2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-skl-6600u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-skl-6600u/igt@i915_selftest@live.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/fi-pnv-d510/igt@i915_selftest@live@gem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-pnv-d510/igt@i915_selftest@live@gem.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2927">i915#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-skl-6600u/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-skl-6600u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-icl-u2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-pnv-d510/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/fi-cfl-8109u/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/203">i915#203</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/295">i915#295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-cfl-8109u/igt@debugfs_test@read_all_entries.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/fi-cfl-8109u/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/203">i915#203</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/295">i915#295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-cfl-8109u/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_flink_basic@bad-flink:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/fi-ehl-2/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-ehl-2/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11233/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6347 -&gt; IGTPW_6635</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11233: 7bb15e416a5fa97dcbfe36f1461939a42266831e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6635: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6635/index.html<br />
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

--===============2818240131242145237==--
