Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 06 Jun 2020 11:44:50 -0000
Message-ID: <159144389083.20628.17679830949205815342@emeril.freedesktop.org>
References: <20200606090858.2137564-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200606090858.2137564-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fhuc=5Fcopy=3A_Enable_a_HuC_copy_test?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_huc_copy: Enable a HuC copy test
URL   : https://patchwork.freedesktop.org/series/78063/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8596_full -> IGTPW_4654_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4654_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_huc_copy@huc-copy} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-tglb7/igt@gem_huc_copy@huc-copy.html

  * {igt@gem_huc_copy@huc-load} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-iclb2/igt@gem_huc_copy@huc-load.html
    - shard-tglb:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-tglb6/igt@gem_huc_copy@huc-load.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8596_full and IGTPW_4654_full:

### New IGT tests (2) ###

  * igt@gem_huc_copy@huc-copy:
    - Statuses : 1 fail(s) 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_huc_copy@huc-load:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4654_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@close-race:
    - shard-tglb:         [PASS][4] -> [DMESG-WARN][5] ([i915#402]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-tglb2/igt@gem_busy@close-race.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-tglb1/igt@gem_busy@close-race.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-snb:          [PASS][6] -> [TIMEOUT][7] ([i915#1958]) +4 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-snb1/igt@gem_exec_reloc@basic-cpu-gtt.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-snb2/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-apl:          [PASS][8] -> [DMESG-WARN][9] ([i915#1982])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-apl8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-apl3/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-hsw:          [PASS][10] -> [TIMEOUT][11] ([i915#1958]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-hsw7/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-hsw5/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen:
    - shard-kbl:          [PASS][12] -> [DMESG-FAIL][13] ([i915#54] / [i915#95]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-tglb:         [PASS][14] -> [INCOMPLETE][15] ([i915#1602] / [i915#456])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-apl:          [PASS][16] -> [DMESG-WARN][17] ([i915#95]) +32 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-apl1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-apl7/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [PASS][18] -> [DMESG-FAIL][19] ([i915#95]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [PASS][20] -> [DMESG-FAIL][21] ([i915#95]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][22] -> [DMESG-WARN][23] ([i915#180]) +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [PASS][24] -> [DMESG-FAIL][25] ([fdo#108145] / [i915#95])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [PASS][26] -> [DMESG-FAIL][27] ([fdo#108145] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#109441])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html

  * igt@syncobj_basic@bad-flags-fd-to-handle:
    - shard-kbl:          [PASS][30] -> [DMESG-WARN][31] ([i915#93] / [i915#95]) +36 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-kbl2/igt@syncobj_basic@bad-flags-fd-to-handle.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-kbl2/igt@syncobj_basic@bad-flags-fd-to-handle.html

  
#### Possible fixes ####

  * {igt@gem_exec_schedule@implicit-write-read@rcs0}:
    - shard-snb:          [INCOMPLETE][32] ([i915#82]) -> [PASS][33] +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-snb4/igt@gem_exec_schedule@implicit-write-read@rcs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-snb2/igt@gem_exec_schedule@implicit-write-read@rcs0.html

  * igt@gem_exec_whisper@basic-normal:
    - shard-glk:          [DMESG-WARN][34] ([i915#118] / [i915#95]) -> [PASS][35] +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-glk7/igt@gem_exec_whisper@basic-normal.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-glk8/igt@gem_exec_whisper@basic-normal.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-tglb:         [INCOMPLETE][36] ([i915#1602] / [i915#456]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-tglb3/igt@gem_workarounds@suspend-resume-fd.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-tglb2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][38] ([i915#1904]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [FAIL][40] ([i915#1899]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-iclb8/igt@i915_pm_dc@dc5-psr.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-iclb1/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          [INCOMPLETE][42] ([i915#58] / [k.org#198133]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-glk9/igt@i915_suspend@forcewake.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-glk2/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-glk:          [DMESG-WARN][44] ([i915#1982]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-glk5/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-glk4/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_color@pipe-d-ctm-0-5:
    - shard-tglb:         [DMESG-WARN][46] ([i915#1149] / [i915#402]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-tglb1/igt@kms_color@pipe-d-ctm-0-5.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-tglb2/igt@kms_color@pipe-d-ctm-0-5.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [DMESG-FAIL][48] ([i915#54] / [i915#95]) -> [PASS][49] +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_legacy@pipe-c-torture-move:
    - shard-hsw:          [DMESG-WARN][50] ([i915#128]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-hsw1/igt@kms_cursor_legacy@pipe-c-torture-move.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-hsw1/igt@kms_cursor_legacy@pipe-c-torture-move.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
    - shard-apl:          [DMESG-WARN][52] ([i915#1982]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-apl6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-apl7/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:
    - shard-snb:          [TIMEOUT][54] ([i915#1958]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-snb5/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-snb5/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [DMESG-FAIL][56] ([i915#54] / [i915#95]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][58] ([i915#180]) -> [PASS][59] +5 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
    - shard-apl:          [DMESG-WARN][60] ([i915#180]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_tiling@flip-x-tiled:
    - shard-apl:          [DMESG-WARN][62] ([i915#95]) -> [PASS][63] +37 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-apl7/igt@kms_flip_tiling@flip-x-tiled.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-apl1/igt@kms_flip_tiling@flip-x-tiled.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][64] ([fdo#109642] / [fdo#111068]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-iclb7/igt@kms_psr2_su@page_flip.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_vblank@pipe-a-query-forked:
    - shard-kbl:          [DMESG-WARN][66] ([i915#93] / [i915#95]) -> [PASS][67] +41 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-kbl4/igt@kms_vblank@pipe-a-query-forked.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-kbl4/igt@kms_vblank@pipe-a-query-forked.html

  * igt@kms_vblank@pipe-a-wait-forked-hang:
    - shard-hsw:          [INCOMPLETE][68] ([i915#61]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-hsw4/igt@kms_vblank@pipe-a-wait-forked-hang.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-hsw8/igt@kms_vblank@pipe-a-wait-forked-hang.html

  * igt@kms_vblank@pipe-b-wait-busy:
    - shard-kbl:          [DMESG-WARN][70] ([i915#1982]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-kbl7/igt@kms_vblank@pipe-b-wait-busy.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-kbl6/igt@kms_vblank@pipe-b-wait-busy.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][72] ([i915#658]) -> [SKIP][73] ([i915#588])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][74] ([i915#454]) -> [SKIP][75] ([i915#468])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-tglb3/igt@i915_pm_dc@dc6-psr.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][76] ([i915#1515]) -> [FAIL][77] ([i915#1515])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
    - shard-snb:          [INCOMPLETE][78] ([CI#80] / [i915#82]) -> [SKIP][79] ([fdo#109271] / [fdo#111827])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-snb5/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-snb6/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][80] ([i915#1319] / [i915#1958]) -> [TIMEOUT][81] ([i915#1319]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-kbl4/igt@kms_content_protection@atomic.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-kbl1/igt@kms_content_protection@atomic.html
    - shard-apl:          [TIMEOUT][82] ([i915#1319]) -> [TIMEOUT][83] ([i915#1319] / [i915#1635])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-apl2/igt@kms_content_protection@atomic.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-apl7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][84] ([i915#1319] / [i915#1635]) -> [FAIL][85] ([fdo#110321] / [fdo#110336])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-apl1/igt@kms_content_protection@atomic-dpms.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-apl6/igt@kms_content_protection@atomic-dpms.html
    - shard-kbl:          [TIMEOUT][86] ([i915#1319]) -> [TIMEOUT][87] ([i915#1319] / [i915#1958])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-kbl2/igt@kms_content_protection@atomic-dpms.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-kbl4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][88] ([i915#1319] / [i915#1635]) -> [FAIL][89] ([fdo#110321])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-apl4/igt@kms_content_protection@lic.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-apl6/igt@kms_content_protection@lic.html
    - shard-kbl:          [DMESG-FAIL][90] ([fdo#110321] / [i915#95]) -> [TIMEOUT][91] ([i915#1319])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-kbl2/igt@kms_content_protection@lic.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-kbl3/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [DMESG-FAIL][92] ([fdo#110321] / [i915#95]) -> [TIMEOUT][93] ([i915#1319] / [i915#1635])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-apl6/igt@kms_content_protection@srm.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-apl3/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@pipe-d-forked-move:
    - shard-snb:          [SKIP][94] ([fdo#109271]) -> [TIMEOUT][95] ([i915#1958])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-snb4/igt@kms_cursor_legacy@pipe-d-forked-move.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-snb2/igt@kms_cursor_legacy@pipe-d-forked-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-hsw:          [SKIP][96] ([fdo#109271]) -> [TIMEOUT][97] ([i915#1958]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-hsw8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-hsw5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][98] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][99] ([i915#93] / [i915#95])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping:
    - shard-snb:          [TIMEOUT][100] ([i915#1958]) -> [SKIP][101] ([fdo#109271]) +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/shard-snb5/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/shard-snb1/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5695 -> IGTPW_4654
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8596: ac91b8351ce380da73dbe8b87d1e4f95aa0c4409 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4654: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/index.html
  IGT_5695: 53e8c878a6fb5708e63c99403691e8960b86ea9c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
