Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 10 Apr 2020 09:19:01 -0000
Message-ID: <158651034173.10045.8032636268341939874@emeril.freedesktop.org>
References: <20200409121812.9029-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200409121812.9029-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHM6?=
 =?utf-8?q?_Add_a_test_for_device_hot_unplug_=28rev2=29?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests: Add a test for device hot unplug (rev2)
URL   : https://patchwork.freedesktop.org/series/75692/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5586_full -> IGTPW_4440_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4440_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4440_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4440_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@core_hotunplug@hotunplug-lateclose} (NEW):
    - shard-tglb:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-tglb6/igt@core_hotunplug@hotunplug-lateclose.html
    - shard-apl:          NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl8/igt@core_hotunplug@hotunplug-lateclose.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@core_hotunplug@hotunplug-lateclose.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl6/igt@core_hotunplug@hotunplug-lateclose.html

  * igt@gem_ctx_bad_destroy@invalid-ctx:
    - shard-iclb:         [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb3/igt@gem_ctx_bad_destroy@invalid-ctx.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@gem_ctx_bad_destroy@invalid-ctx.html

  * igt@i915_pm_rpm@fences:
    - shard-iclb:         [PASS][7] -> [FAIL][8] +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb2/igt@i915_pm_rpm@fences.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@i915_pm_rpm@fences.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-none:
    - shard-iclb:         [PASS][9] -> [WARN][10] +7 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb2/igt@kms_plane_multiple@atomic-pipe-b-tiling-none.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@kms_plane_multiple@atomic-pipe-b-tiling-none.html

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> ([FAIL][11], [FAIL][12], [FAIL][13])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-hsw4/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-hsw4/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-hsw2/igt@runner@aborted.html
    - shard-tglb:         NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-tglb6/igt@runner@aborted.html
    - shard-snb:          NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-snb2/igt@runner@aborted.html

  
#### Warnings ####

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:
    - shard-snb:          [SKIP][16] ([fdo#109271]) -> [FAIL][17] +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-snb1/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-snb2/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html

  
New tests
---------

  New tests have been introduced between IGT_5586_full and IGTPW_4440_full:

### New IGT tests (4) ###

  * igt@core_hotunplug@hotunbind-lateclose:
    - Statuses : 1 incomplete(s) 6 pass(s)
    - Exec time: [0.0, 1.81] s

  * igt@core_hotunplug@hotunplug-lateclose:
    - Statuses : 7 incomplete(s)
    - Exec time: [0.0] s

  * igt@core_hotunplug@unbind-rebind:
    - Statuses : 1 incomplete(s) 6 pass(s)
    - Exec time: [0.0, 1.97] s

  * igt@core_hotunplug@unplug-rescan:
    - Statuses : 2 incomplete(s) 5 pass(s)
    - Exec time: [0.0, 3.97] s

  

Known issues
------------

  Here are the changes found in IGTPW_4440_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_param@vm:
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#1690]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl3/igt@gem_ctx_param@vm.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl2/igt@gem_ctx_param@vm.html
    - shard-tglb:         [PASS][20] -> [FAIL][21] ([i915#1690]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-tglb8/igt@gem_ctx_param@vm.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-tglb2/igt@gem_ctx_param@vm.html
    - shard-kbl:          [PASS][22] -> [FAIL][23] ([i915#1690]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl6/igt@gem_ctx_param@vm.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl2/igt@gem_ctx_param@vm.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([i915#1570]) +17 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb4/igt@gem_exec_flush@basic-uc-pro-default.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([fdo#109276])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb2/igt@gem_exec_params@invalid-bsd-ring.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb7/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:
    - shard-glk:          [PASS][28] -> [FAIL][29] ([i915#1690]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk7/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-glk4/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][30] -> [DMESG-WARN][31] ([i915#180])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl2/igt@gem_softpin@noreloc-s3.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl4/igt@gem_softpin@noreloc-s3.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-apl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl7/igt@i915_suspend@fence-restore-untiled.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl6/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-iclb:         [PASS][34] -> [FAIL][35] ([i915#1563]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_color@pipe-b-ctm-green-to-red:
    - shard-iclb:         [PASS][36] -> [WARN][37] ([i915#1149]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb8/igt@kms_color@pipe-b-ctm-green-to-red.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@kms_color@pipe-b-ctm-green-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [PASS][38] -> [FAIL][39] ([i915#54] / [i915#93] / [i915#95])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen:
    - shard-apl:          [PASS][40] -> [FAIL][41] ([i915#54])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html
    - shard-kbl:          [PASS][42] -> [FAIL][43] ([i915#54])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:
    - shard-iclb:         [PASS][44] -> [FAIL][45] ([i915#70])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb2/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:
    - shard-iclb:         [PASS][46] -> [WARN][47] ([i915#1691])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb5/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][48] -> [FAIL][49] ([i915#52] / [i915#54]) +5 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [PASS][50] -> [FAIL][51] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [PASS][52] -> [FAIL][53] ([i915#52] / [i915#54] / [i915#95])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [PASS][54] -> [FAIL][55] ([i915#699] / [i915#93] / [i915#95])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [PASS][56] -> [FAIL][57] ([i915#95])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-apl:          [PASS][58] -> [FAIL][59] ([i915#49])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
    - shard-kbl:          [PASS][60] -> [FAIL][61] ([i915#49])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-glk:          [PASS][62] -> [FAIL][63] ([i915#49])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt:
    - shard-iclb:         [PASS][64] -> [FAIL][65] ([i915#1564]) +8 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][66] -> [FAIL][67] ([i915#1559] / [i915#95])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [PASS][68] -> [FAIL][69] ([i915#1559] / [i915#93] / [i915#95])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][70] -> [FAIL][71] ([i915#899])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][72] -> [SKIP][73] ([fdo#109441]) +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][74] -> [FAIL][75] ([i915#31])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl2/igt@kms_setmode@basic.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-wait-forked-busy-hang:
    - shard-iclb:         [PASS][76] -> [SKIP][77] ([fdo#109278])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb2/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html

  * igt@testdisplay:
    - shard-apl:          [PASS][78] -> [INCOMPLETE][79] ([i915#1692])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl8/igt@testdisplay.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl7/igt@testdisplay.html
    - shard-kbl:          [PASS][80] -> [INCOMPLETE][81] ([i915#1692])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl4/igt@testdisplay.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl6/igt@testdisplay.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-apl:          [TIMEOUT][82] ([i915#1340]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl6/igt@gem_ctx_persistence@close-replace-race.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl7/igt@gem_ctx_persistence@close-replace-race.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         [SKIP][84] ([i915#1316] / [i915#579]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-tglb2/igt@i915_pm_rpm@cursor.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-tglb2/igt@i915_pm_rpm@cursor.html
    - shard-iclb:         [SKIP][86] ([i915#1316] / [i915#579]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb7/igt@i915_pm_rpm@cursor.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb4/igt@i915_pm_rpm@cursor.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][88] ([i915#180]) -> [PASS][89] +3 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl4/igt@i915_suspend@sysfs-reader.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][90] ([i915#180]) -> [PASS][91] +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
    - shard-snb:          [SKIP][92] ([fdo#109271]) -> [PASS][93] +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [FAIL][94] ([i915#1566] / [i915#93] / [i915#95]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][96] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [FAIL][98] ([i915#52] / [i915#54]) -> [PASS][99] +2 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][100] ([i915#79]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [FAIL][102] ([i915#93] / [i915#95]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl2/igt@kms_mmap_write_crc@main.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl3/igt@kms_mmap_write_crc@main.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [FAIL][104] ([i915#53] / [i915#95]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [FAIL][106] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][107] +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][108] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [FAIL][110] ([i915#1559] / [i915#95]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [FAIL][112] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][114] ([i915#1542]) -> [PASS][115] +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-hsw6/igt@perf@blocking-parameterized.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-hsw1/igt@perf@blocking-parameterized.html

  * igt@perf@oa-formats:
    - shard-iclb:         [SKIP][116] ([i915#405]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb4/igt@perf@oa-formats.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb3/igt@perf@oa-formats.html
    - shard-glk:          [SKIP][118] ([fdo#109271]) -> [PASS][119] +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk9/igt@perf@oa-formats.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-glk5/igt@perf@oa-formats.html
    - shard-apl:          [SKIP][120] ([fdo#109271]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl2/igt@perf@oa-formats.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl1/igt@perf@oa-formats.html
    - shard-kbl:          [SKIP][122] ([fdo#109271]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl2/igt@perf@oa-formats.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl7/igt@perf@oa-formats.html
    - shard-hsw:          [SKIP][124] ([fdo#109271]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-hsw2/igt@perf@oa-formats.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-hsw6/igt@perf@oa-formats.html
    - shard-tglb:         [SKIP][126] ([i915#405]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-tglb7/igt@perf@oa-formats.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-tglb8/igt@perf@oa-formats.html

  
#### Warnings ####

  * igt@gen7_exec_parse@basic-allocation:
    - shard-iclb:         [SKIP][128] ([fdo#109289]) -> [SKIP][129] ([i915#1570])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb7/igt@gen7_exec_parse@basic-allocation.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@gen7_exec_parse@basic-allocation.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [INCOMPLETE][130] ([CI#80] / [i915#155]) -> [DMESG-WARN][131] ([i915#180])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl2/igt@i915_suspend@sysfs-reader.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][132] ([i915#180] / [i915#95]) -> [DMESG-WARN][133] ([i915#180])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-kbl:          [DMESG-WARN][134] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][135] ([i915#180])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          [FAIL][136] ([fdo#108145] / [i915#265]) -> [FAIL][137] ([fdo#108145] / [i915#265] / [i915#95])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][138] ([fdo#108145] / [i915#265]) -> [FAIL][139] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1340]: https://gitlab.freedesktop.org/drm/intel/issues/1340
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1563]: https://gitlab.freedesktop.org/drm/intel/issues/1563
  [i915#1564]: https://gitlab.freedesktop.org/drm/intel/issues/1564
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#1570]: https://gitlab.freedesktop.org/drm/intel/issues/1570
  [i915#1690]: https://gitlab.freedesktop.org/drm/intel/issues/1690
  [i915#1691]: https://gitlab.freedesktop.org/drm/intel/issues/1691
  [i915#1692]: https://gitlab.freedesktop.org/drm/intel/issues/1692
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5586 -> IGTPW_4440

  CI-20190529: 20190529
  CI_DRM_8283: a6f4f55d343fea03e11e754b1094dda8cf2538ac @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4440: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/index.html
  IGT_5586: 29fad328e6a1b105c8d688cafe19b1b5c19ad0c8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
