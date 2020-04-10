Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 10 Apr 2020 06:05:18 -0000
Message-ID: <158649871864.10043.17474301903026872578@emeril.freedesktop.org>
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

  * igt@gem_ctx_param@vm:
    - shard-apl:          [PASS][5] -> [FAIL][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl3/igt@gem_ctx_param@vm.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl2/igt@gem_ctx_param@vm.html
    - shard-tglb:         [PASS][7] -> [FAIL][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-tglb8/igt@gem_ctx_param@vm.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-tglb2/igt@gem_ctx_param@vm.html
    - shard-kbl:          [PASS][9] -> [FAIL][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl6/igt@gem_ctx_param@vm.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl2/igt@gem_ctx_param@vm.html

  * igt@gem_ctx_persistence@engines-hang:
    - shard-iclb:         NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@gem_ctx_persistence@engines-hang.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-iclb:         [PASS][12] -> [SKIP][13] +18 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb4/igt@gem_exec_flush@basic-uc-pro-default.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:
    - shard-glk:          [PASS][14] -> [FAIL][15] +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk7/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-glk4/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-iclb:         [PASS][16] -> [FAIL][17] +6 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:
    - shard-iclb:         [PASS][18] -> [WARN][19] +8 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb5/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> ([FAIL][20], [FAIL][21], [FAIL][22])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-hsw4/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-hsw4/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-hsw2/igt@runner@aborted.html
    - shard-tglb:         NOTRUN -> [FAIL][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-tglb6/igt@runner@aborted.html
    - shard-snb:          NOTRUN -> [FAIL][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-snb2/igt@runner@aborted.html

  * igt@testdisplay:
    - shard-apl:          [PASS][25] -> [INCOMPLETE][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl8/igt@testdisplay.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl7/igt@testdisplay.html
    - shard-kbl:          [PASS][27] -> [INCOMPLETE][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl4/igt@testdisplay.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl6/igt@testdisplay.html

  
#### Warnings ####

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:
    - shard-snb:          [SKIP][29] ([fdo#109271]) -> [FAIL][30] +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-snb1/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-snb2/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-iclb:         [SKIP][31] ([fdo#109289]) -> [SKIP][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb7/igt@gen7_exec_parse@basic-allocation.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@gen7_exec_parse@basic-allocation.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_schedule@preempt-other-chain}:
    - shard-iclb:         NOTRUN -> [SKIP][33] +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain.html

  
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

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][34] -> [SKIP][35] ([fdo#109276])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb2/igt@gem_exec_params@invalid-bsd-ring.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb7/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][36] -> [DMESG-WARN][37] ([i915#180])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl2/igt@gem_softpin@noreloc-s3.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl4/igt@gem_softpin@noreloc-s3.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-apl:          [PASS][38] -> [DMESG-WARN][39] ([i915#180]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl7/igt@i915_suspend@fence-restore-untiled.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl6/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_color@pipe-b-ctm-green-to-red:
    - shard-iclb:         [PASS][40] -> [WARN][41] ([i915#1149]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb8/igt@kms_color@pipe-b-ctm-green-to-red.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@kms_color@pipe-b-ctm-green-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [PASS][42] -> [FAIL][43] ([i915#54] / [i915#93] / [i915#95])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen:
    - shard-apl:          [PASS][44] -> [FAIL][45] ([i915#54])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html
    - shard-kbl:          [PASS][46] -> [FAIL][47] ([i915#54])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:
    - shard-iclb:         [PASS][48] -> [FAIL][49] ([i915#70])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb2/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][50] -> [FAIL][51] ([i915#52] / [i915#54]) +5 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [PASS][52] -> [FAIL][53] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [PASS][54] -> [FAIL][55] ([i915#52] / [i915#54] / [i915#95])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [PASS][56] -> [FAIL][57] ([i915#699] / [i915#93] / [i915#95])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [PASS][58] -> [FAIL][59] ([i915#95])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-apl:          [PASS][60] -> [FAIL][61] ([i915#49])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
    - shard-kbl:          [PASS][62] -> [FAIL][63] ([i915#49])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-glk:          [PASS][64] -> [FAIL][65] ([i915#49])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt:
    - shard-iclb:         [PASS][66] -> [FAIL][67] ([i915#1564]) +8 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][68] -> [FAIL][69] ([i915#1559] / [i915#95])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [PASS][70] -> [FAIL][71] ([i915#1559] / [i915#93] / [i915#95])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][72] -> [FAIL][73] ([i915#899])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][74] -> [SKIP][75] ([fdo#109441]) +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][76] -> [FAIL][77] ([i915#31])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl2/igt@kms_setmode@basic.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-wait-forked-busy-hang:
    - shard-iclb:         [PASS][78] -> [SKIP][79] ([fdo#109278])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb2/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb1/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-apl:          [TIMEOUT][80] ([i915#1340]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl6/igt@gem_ctx_persistence@close-replace-race.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl7/igt@gem_ctx_persistence@close-replace-race.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         [SKIP][82] ([i915#1316] / [i915#579]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-tglb2/igt@i915_pm_rpm@cursor.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-tglb2/igt@i915_pm_rpm@cursor.html
    - shard-iclb:         [SKIP][84] ([i915#1316] / [i915#579]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb7/igt@i915_pm_rpm@cursor.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb4/igt@i915_pm_rpm@cursor.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][86] ([i915#180]) -> [PASS][87] +3 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl4/igt@i915_suspend@sysfs-reader.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][88] ([i915#180]) -> [PASS][89] +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
    - shard-snb:          [SKIP][90] ([fdo#109271]) -> [PASS][91] +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [FAIL][92] ([i915#1566] / [i915#93] / [i915#95]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][94] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [FAIL][96] ([i915#52] / [i915#54]) -> [PASS][97] +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][98] ([i915#79]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [FAIL][100] ([i915#93] / [i915#95]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl2/igt@kms_mmap_write_crc@main.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl3/igt@kms_mmap_write_crc@main.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [FAIL][102] ([i915#53] / [i915#95]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [FAIL][104] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][105] +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][106] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [FAIL][108] ([i915#1559] / [i915#95]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [FAIL][110] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][112] ([i915#1542]) -> [PASS][113] +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-hsw6/igt@perf@blocking-parameterized.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-hsw1/igt@perf@blocking-parameterized.html

  * igt@perf@oa-formats:
    - shard-iclb:         [SKIP][114] ([i915#405]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb4/igt@perf@oa-formats.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-iclb3/igt@perf@oa-formats.html
    - shard-glk:          [SKIP][116] ([fdo#109271]) -> [PASS][117] +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk9/igt@perf@oa-formats.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-glk5/igt@perf@oa-formats.html
    - shard-apl:          [SKIP][118] ([fdo#109271]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl2/igt@perf@oa-formats.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl1/igt@perf@oa-formats.html
    - shard-kbl:          [SKIP][120] ([fdo#109271]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl2/igt@perf@oa-formats.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl7/igt@perf@oa-formats.html
    - shard-hsw:          [SKIP][122] ([fdo#109271]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-hsw2/igt@perf@oa-formats.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-hsw6/igt@perf@oa-formats.html
    - shard-tglb:         [SKIP][124] ([i915#405]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-tglb7/igt@perf@oa-formats.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-tglb8/igt@perf@oa-formats.html

  
#### Warnings ####

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [INCOMPLETE][126] ([CI#80] / [i915#155]) -> [DMESG-WARN][127] ([i915#180])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl2/igt@i915_suspend@sysfs-reader.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][128] ([i915#180] / [i915#95]) -> [DMESG-WARN][129] ([i915#180])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-kbl:          [DMESG-WARN][130] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][131] ([i915#180])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          [FAIL][132] ([fdo#108145] / [i915#265]) -> [FAIL][133] ([fdo#108145] / [i915#265] / [i915#95])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][134] ([fdo#108145] / [i915#265]) -> [FAIL][135] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  
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
  [i915#1564]: https://gitlab.freedesktop.org/drm/intel/issues/1564
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
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
