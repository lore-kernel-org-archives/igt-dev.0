Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 06 Jul 2020 11:49:32 -0000
Message-ID: <159403617230.17683.18205038558885708238@emeril.freedesktop.org>
References: <20200706095900.802304-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200706095900.802304-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fclose=3A_Adapt_to_allow_duplicate_handles?=
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

Series: i915/gem_close: Adapt to allow duplicate handles
URL   : https://patchwork.freedesktop.org/series/79148/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5724_full -> IGTPW_4739_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4739_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4739_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4739_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_userptr_blits@stress-purge:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw7/igt@gem_userptr_blits@stress-purge.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-hsw1/igt@gem_userptr_blits@stress-purge.html

  * igt@kms_plane@plane-panning-bottom-right-pipe-b-planes:
    - shard-iclb:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb7/igt@kms_plane@plane-panning-bottom-right-pipe-b-planes.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-iclb7/igt@kms_plane@plane-panning-bottom-right-pipe-b-planes.html

  
Known issues
------------

  Here are the changes found in IGTPW_4739_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@bonded-early:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#2079])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl3/igt@gem_exec_balancer@bonded-early.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-kbl2/igt@gem_exec_balancer@bonded-early.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#1930])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk9/igt@gem_exec_reloc@basic-concurrent0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-glk3/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#118] / [i915#95]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk1/igt@gem_exec_whisper@basic-contexts-forked.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1436] / [i915#716])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-apl6/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [PASS][13] -> [DMESG-FAIL][14] ([i915#1635] / [i915#95]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#1982])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl4/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-apl6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][17] -> [DMESG-FAIL][18] ([i915#118] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_color@pipe-c-gamma:
    - shard-glk:          [PASS][19] -> [TIMEOUT][20] ([i915#1958] / [i915#2119]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk2/igt@kms_color@pipe-c-gamma.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-glk5/igt@kms_color@pipe-c-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [PASS][21] -> [DMESG-FAIL][22] ([i915#54] / [i915#95]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1635] / [i915#95]) +32 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl1/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-apl4/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#64])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl4/igt@kms_fbcon_fbt@fbc.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-kbl6/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#1525])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl4/igt@kms_fbcon_fbt@fbc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-apl2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][31] -> [INCOMPLETE][32] ([i915#2055])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-iclb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1226])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb1/igt@kms_flip_tiling@flip-changes-tiling.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-iclb2/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-iclb:         [PASS][35] -> [DMESG-WARN][36] ([i915#1982])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-tglb:         [PASS][37] -> [DMESG-WARN][38] ([i915#1982])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [PASS][39] -> [FAIL][40] ([i915#83])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-tglb8/igt@kms_panel_fitting@atomic-fastset.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-tglb3/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [PASS][41] -> [FAIL][42] ([i915#83])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb3/igt@kms_panel_fitting@atomic-fastset.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-iclb7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [PASS][43] -> [DMESG-FAIL][44] ([i915#95]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-kbl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-c-overlay-size-64:
    - shard-hsw:          [PASS][45] -> [TIMEOUT][46] ([i915#1958] / [i915#2119]) +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw4/igt@kms_plane_cursor@pipe-c-overlay-size-64.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-hsw7/igt@kms_plane_cursor@pipe-c-overlay-size-64.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109441]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-iclb5/igt@kms_psr@psr2_suspend.html

  * igt@kms_rmfb@rmfb-ioctl:
    - shard-kbl:          [PASS][49] -> [DMESG-WARN][50] ([i915#93] / [i915#95]) +38 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl7/igt@kms_rmfb@rmfb-ioctl.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-kbl7/igt@kms_rmfb@rmfb-ioctl.html

  * igt@kms_universal_plane@cursor-fb-leak-pipe-d:
    - shard-tglb:         [PASS][51] -> [DMESG-WARN][52] ([i915#402])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-tglb3/igt@kms_universal_plane@cursor-fb-leak-pipe-d.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-tglb2/igt@kms_universal_plane@cursor-fb-leak-pipe-d.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][53] -> [FAIL][54] ([i915#1542])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb3/igt@perf@blocking-parameterized.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-iclb6/igt@perf@blocking-parameterized.html

  
#### Possible fixes ####

  * igt@gem_exec_params@readonly:
    - shard-kbl:          [DMESG-WARN][55] ([i915#93] / [i915#95]) -> [PASS][56] +31 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl2/igt@gem_exec_params@readonly.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-kbl1/igt@gem_exec_params@readonly.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [DMESG-WARN][57] ([i915#402]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-tglb8/igt@i915_module_load@reload.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-tglb7/igt@i915_module_load@reload.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][59] ([i915#118] / [i915#95]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-glk7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][61] ([i915#1982]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-apl2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:
    - shard-glk:          [DMESG-WARN][63] ([i915#1982]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk7/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-hsw:          [TIMEOUT][65] ([i915#1958] / [i915#2119]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-hsw2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-hsw:          [SKIP][67] ([fdo#109271]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-hsw1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled:
    - shard-glk:          [FAIL][69] ([i915#52] / [i915#54]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-glk6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [DMESG-FAIL][71] ([i915#54] / [i915#95]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [DMESG-FAIL][73] ([i915#1635] / [i915#54] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][75] ([i915#79]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [DMESG-FAIL][79] ([i915#1635] / [i915#95]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling.html
    - shard-kbl:          [DMESG-FAIL][81] ([i915#95]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack:
    - shard-glk:          [FAIL][83] ([i915#49]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-glk:          [FAIL][85] ([i915#1559]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-glk2/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb7/igt@kms_psr@psr2_no_drrs.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@testdisplay:
    - shard-glk:          [DMESG-WARN][89] ([i915#118] / [i915#95]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk1/igt@testdisplay.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-glk4/igt@testdisplay.html

  * igt@tools_test@tools_test:
    - shard-apl:          [DMESG-WARN][91] ([i915#1635] / [i915#95]) -> [PASS][92] +22 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl6/igt@tools_test@tools_test.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-apl6/igt@tools_test@tools_test.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-glk:          [INCOMPLETE][93] ([i915#1958] / [i915#58] / [k.org#198133]) -> [TIMEOUT][94] ([i915#1958] / [i915#2119])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk2/igt@gem_exec_reloc@basic-concurrent16.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-glk5/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@kms_color_chamelium@pipe-a-gamma:
    - shard-apl:          [SKIP][95] ([fdo#109271] / [fdo#111827]) -> [SKIP][96] ([fdo#109271] / [fdo#111827] / [i915#1635])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl8/igt@kms_color_chamelium@pipe-a-gamma.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-apl7/igt@kms_color_chamelium@pipe-a-gamma.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][97] ([i915#1226]) -> [SKIP][98] ([fdo#109349])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-hsw:          [TIMEOUT][99] ([i915#1958] / [i915#2119]) -> [SKIP][100] ([fdo#109271])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-hsw1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-apl:          [SKIP][101] ([fdo#109271] / [i915#1635]) -> [SKIP][102] ([fdo#109271]) +13 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [FAIL][103] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][104] ([fdo#108145] / [i915#1635] / [i915#95])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          [DMESG-FAIL][105] ([fdo#108145] / [i915#1635] / [i915#95]) -> [FAIL][106] ([fdo#108145] / [i915#265]) +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-kbl:          [DMESG-FAIL][107] ([fdo#108145] / [i915#95]) -> [FAIL][108] ([fdo#108145] / [i915#265]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-kbl:          [DMESG-FAIL][109] ([i915#95]) -> [FAIL][110] ([i915#265])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_vblank@pipe-b-wait-forked-hang:
    - shard-kbl:          [DMESG-WARN][111] ([i915#93] / [i915#95]) -> [DMESG-WARN][112] ([i915#1982])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl1/igt@kms_vblank@pipe-b-wait-forked-hang.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-kbl2/igt@kms_vblank@pipe-b-wait-forked-hang.html

  * igt@perf@polling-parameterized:
    - shard-hsw:          [INCOMPLETE][113] -> [FAIL][114] ([i915#1542])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw5/igt@perf@polling-parameterized.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-hsw6/igt@perf@polling-parameterized.html

  * igt@prime_vgem@fence-write-hang:
    - shard-apl:          [SKIP][115] ([fdo#109271]) -> [SKIP][116] ([fdo#109271] / [i915#1635]) +15 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl7/igt@prime_vgem@fence-write-hang.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-apl4/igt@prime_vgem@fence-write-hang.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][117], [FAIL][118]) ([i915#1784] / [i915#2110]) -> [FAIL][119] ([i915#1436] / [i915#1784] / [i915#2110])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl1/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl3/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-kbl2/igt@runner@aborted.html
    - shard-apl:          [FAIL][120] ([i915#1610] / [i915#1635] / [i915#2110]) -> ([FAIL][121], [FAIL][122]) ([fdo#109271] / [i915#1635] / [i915#2110] / [i915#716])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl2/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-apl6/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/shard-apl7/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2079]: https://gitlab.freedesktop.org/drm/intel/issues/2079
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5724 -> IGTPW_4739

  CI-20190529: 20190529
  CI_DRM_8708: 170e94a1430fd0a4f0841ad0f7366904d52e49be @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4739: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/index.html
  IGT_5724: bfbf195bd0c35fd73d1ee95e79249151aa248f2e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4739/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
