Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 09 Apr 2020 03:20:53 -0000
Message-ID: <158640245362.11551.18278088964275082813@emeril.freedesktop.org>
References: <20200408151213.30717-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200408151213.30717-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fsync=2Ec_=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5Fengi?=
 =?utf-8?q?ne_to_utilize_all_available_=28rev6=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_sync.c :Added __for_each_physical_engine to utilize all available (rev6)
URL   : https://patchwork.freedesktop.org/series/75536/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8277_full -> IGTPW_4433_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/index.html

Known issues
------------

  Here are the changes found in IGTPW_4433_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-iclb2/igt@gem_exec_params@invalid-bsd-ring.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-iclb8/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-snb:          [PASS][3] -> [INCOMPLETE][4] ([i915#82])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-snb4/igt@gem_fenced_exec_thrash@no-spare-fences.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-snb5/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#716])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-glk5/igt@gen9_exec_parse@allowed-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-glk7/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#1119] / [i915#93] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#1566] / [i915#93] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#177] / [i915#52] / [i915#54])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#52] / [i915#54]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#79])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-hsw:          [PASS][19] -> [INCOMPLETE][20] ([i915#61])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-hsw5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-hsw1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#93] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl1/igt@kms_mmap_write_crc@main.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-kbl4/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#1559] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-apl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#1559] / [i915#93] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#173])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-iclb5/igt@kms_psr@no_drrs.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#31])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl3/igt@kms_setmode@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-apl7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-snb:          [FAIL][37] ([i915#1066]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-snb5/igt@i915_pm_rc6_residency@rc6-idle.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-snb7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_busy@basic-flip-pipe-a:
    - shard-kbl:          [INCOMPLETE][39] -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl7/igt@kms_busy@basic-flip-pipe-a.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-kbl4/igt@kms_busy@basic-flip-pipe-a.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-kbl:          [FAIL][41] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][43] ([i915#54]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-apl:          [FAIL][45] ([i915#54]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
    - shard-apl:          [FAIL][47] ([i915#54] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [FAIL][49] ([i915#52] / [i915#54]) -> [PASS][50] +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled:
    - shard-apl:          [FAIL][51] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [FAIL][53] ([i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-apl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][59] ([fdo#109441]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-iclb5/igt@kms_psr@psr2_cursor_blt.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][61] ([i915#1542]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-iclb7/igt@perf@blocking-parameterized.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-iclb1/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][63] ([i915#64]) -> [FAIL][64] ([i915#93] / [i915#95])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl4/igt@kms_fbcon_fbt@fbc.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-kbl4/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][65] ([i915#1525]) -> [FAIL][66] ([i915#95])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl2/igt@kms_fbcon_fbt@fbc.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-apl6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-FAIL][67] ([i915#180] / [i915#95]) -> [FAIL][68] ([i915#93] / [i915#95])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-kbl:          [FAIL][69] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][70] ([fdo#108145] / [i915#265])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
    - shard-apl:          [FAIL][71] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][72] ([fdo#108145] / [i915#265])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [FAIL][73] ([i915#608]) -> [SKIP][74] ([fdo#109642] / [fdo#111068])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/shard-iclb1/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1066]: https://gitlab.freedesktop.org/drm/intel/issues/1066
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5581 -> IGTPW_4433
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8277: f7d56913e1668f3a269db391189a7888a4b22570 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4433: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/index.html
  IGT_5581: ab0620e555119ec55f12ba9ab9e6e9246d407648 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4433/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
