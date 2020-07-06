Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 06 Jul 2020 19:40:27 -0000
Message-ID: <159406442766.17684.15229931430507769723@emeril.freedesktop.org>
References: <20200706155059.ulofxodc2gee2fz7@smtp.gmail.com>
In-Reply-To: <20200706155059.ulofxodc2gee2fz7@smtp.gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Ffb=3A_remove_extra_parameters_from_igt=5Fput=5Fcairo=5Fctx?=
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
To: Melissa Wen <melissa.srw@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_fb: remove extra parameters from igt_put_cairo_ctx
URL   : https://patchwork.freedesktop.org/series/79162/
State : success

== Summary ==

CI Bug Log - changes from IGT_5725_full -> IGTPW_4743_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/index.html

Known issues
------------

  Here are the changes found in IGTPW_4743_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-apl:          [PASS][1] -> [DMESG-WARN][2] ([i915#1635] / [i915#95]) +29 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-apl7/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-apl1/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@kms_addfb_basic@too-wide:
    - shard-hsw:          [PASS][3] -> [TIMEOUT][4] ([i915#1958] / [i915#2119]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-hsw2/igt@kms_addfb_basic@too-wide.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-hsw1/igt@kms_addfb_basic@too-wide.html

  * igt@kms_atomic_transition@2x-modeset-transitions-nonblocking:
    - shard-hsw:          [PASS][5] -> [TIMEOUT][6] ([i915#1320] / [i915#1958] / [i915#2119])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-hsw4/igt@kms_atomic_transition@2x-modeset-transitions-nonblocking.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-hsw1/igt@kms_atomic_transition@2x-modeset-transitions-nonblocking.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#1982]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-apl8/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-apl4/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][9] -> [DMESG-FAIL][10] ([i915#54] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-dpms:
    - shard-snb:          [PASS][11] -> [TIMEOUT][12] ([i915#1958] / [i915#2119]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-snb6/igt@kms_cursor_crc@pipe-b-cursor-dpms.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-snb1/igt@kms_cursor_crc@pipe-b-cursor-dpms.html

  * igt@kms_cursor_legacy@pipe-b-torture-bo:
    - shard-tglb:         [PASS][13] -> [DMESG-WARN][14] ([i915#128])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-tglb7/igt@kms_cursor_legacy@pipe-b-torture-bo.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-tglb8/igt@kms_cursor_legacy@pipe-b-torture-bo.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#93] / [i915#95]) +44 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-kbl3/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-kbl6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#52] / [i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#1525])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#79])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-tglb:         [PASS][23] -> [INCOMPLETE][24] ([i915#456])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-tglb6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#83])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-tglb8/igt@kms_panel_fitting@atomic-fastset.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-tglb6/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#83])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-iclb6/igt@kms_panel_fitting@atomic-fastset.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-iclb3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][31] -> [DMESG-FAIL][32] ([i915#1635] / [i915#95]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][33] -> [DMESG-FAIL][34] ([i915#95]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [PASS][37] -> [DMESG-FAIL][38] ([fdo#108145] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [PASS][39] -> [DMESG-FAIL][40] ([fdo#108145] / [i915#1635] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-y:
    - shard-iclb:         [PASS][41] -> [FAIL][42] ([i915#1779])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-iclb6/igt@kms_plane_multiple@atomic-pipe-c-tiling-y.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-iclb7/igt@kms_plane_multiple@atomic-pipe-c-tiling-y.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [PASS][43] -> [SKIP][44] ([i915#1911])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-tglb1/igt@kms_psr2_su@page_flip.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-tglb1/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-glk:          [DMESG-WARN][47] ([i915#118] / [i915#95]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-glk3/igt@gem_exec_whisper@basic-fds-all.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-glk7/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync@gtt:
    - shard-iclb:         [INCOMPLETE][49] ([i915#2119]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-iclb2/igt@gem_userptr_blits@invalid-mmap-offset-unsync@gtt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-iclb1/igt@gem_userptr_blits@invalid-mmap-offset-unsync@gtt.html

  * igt@gem_userptr_blits@stress-mm-invalidate-close:
    - shard-hsw:          [TIMEOUT][51] ([i915#1958] / [i915#2119]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-hsw7/igt@gem_userptr_blits@stress-mm-invalidate-close.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-hsw2/igt@gem_userptr_blits@stress-mm-invalidate-close.html

  * igt@kms_atomic_transition@1x-modeset-transitions-nonblocking:
    - shard-apl:          [DMESG-WARN][53] ([i915#1635] / [i915#95]) -> [PASS][54] +37 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-apl7/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-apl8/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][55] ([i915#118] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-glk6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][57] ([i915#54] / [i915#95]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen:
    - shard-kbl:          [FAIL][59] ([i915#54]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
    - shard-apl:          [FAIL][61] ([i915#54]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
    - shard-glk:          [FAIL][63] ([i915#54]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html

  * igt@kms_flip@2x-modeset-vs-vblank-race@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [DMESG-WARN][65] ([i915#1982]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-glk1/igt@kms_flip@2x-modeset-vs-vblank-race@ab-hdmi-a1-hdmi-a2.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-glk3/igt@kms_flip@2x-modeset-vs-vblank-race@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +6 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-tglb:         [DMESG-WARN][69] ([i915#1982]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-glk:          [FAIL][71] ([i915#49]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [DMESG-FAIL][73] ([fdo#108145] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [DMESG-FAIL][75] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-a-wait-forked-busy-hang:
    - shard-snb:          [TIMEOUT][79] ([i915#1958] / [i915#2119]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-snb6/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-snb6/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html

  * igt@kms_vblank@pipe-c-accuracy-idle:
    - shard-apl:          [DMESG-WARN][81] ([i915#1982]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-apl2/igt@kms_vblank@pipe-c-accuracy-idle.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-apl2/igt@kms_vblank@pipe-c-accuracy-idle.html

  * igt@kms_vblank@pipe-c-wait-forked:
    - shard-kbl:          [DMESG-WARN][83] ([i915#93] / [i915#95]) -> [PASS][84] +45 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-kbl4/igt@kms_vblank@pipe-c-wait-forked.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-kbl2/igt@kms_vblank@pipe-c-wait-forked.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [FAIL][85] ([i915#1542]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-iclb1/igt@perf@blocking-parameterized.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-iclb4/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-spin-others@vcs0:
    - shard-snb:          [WARN][87] ([i915#2021]) -> [WARN][88] ([i915#2036])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-snb5/igt@gem_exec_reloc@basic-spin-others@vcs0.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-snb6/igt@gem_exec_reloc@basic-spin-others@vcs0.html

  * igt@kms_atomic_transition@2x-modeset-transitions-nonblocking:
    - shard-snb:          [SKIP][89] ([fdo#109271]) -> [TIMEOUT][90] ([i915#1958] / [i915#2119])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-snb5/igt@kms_atomic_transition@2x-modeset-transitions-nonblocking.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-snb1/igt@kms_atomic_transition@2x-modeset-transitions-nonblocking.html

  * igt@kms_chamelium@hdmi-edid-read:
    - shard-apl:          [SKIP][91] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][92] ([fdo#109271] / [fdo#111827])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-apl4/igt@kms_chamelium@hdmi-edid-read.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-apl4/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-5:
    - shard-apl:          [SKIP][93] ([fdo#109271] / [fdo#111827]) -> [SKIP][94] ([fdo#109271] / [fdo#111827] / [i915#1635])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-apl8/igt@kms_color_chamelium@pipe-b-ctm-0-5.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-apl1/igt@kms_color_chamelium@pipe-b-ctm-0-5.html

  * igt@kms_concurrent@pipe-c:
    - shard-snb:          [TIMEOUT][95] ([i915#1958] / [i915#2119]) -> [SKIP][96] ([fdo#109271]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-snb6/igt@kms_concurrent@pipe-c.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-snb2/igt@kms_concurrent@pipe-c.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][97] ([i915#1319] / [i915#2119]) -> [TIMEOUT][98] ([i915#1319] / [i915#1958] / [i915#2119])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-kbl3/igt@kms_content_protection@lic.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-kbl4/igt@kms_content_protection@lic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][99] ([i915#180]) -> [FAIL][100] ([i915#64])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-hsw:          [SKIP][101] ([fdo#109271]) -> [TIMEOUT][102] ([i915#1958] / [i915#2119])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-hsw2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-hsw:          [TIMEOUT][103] ([i915#1958] / [i915#2119]) -> [SKIP][104] ([fdo#109271]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-hsw7/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-hsw4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-apl:          [SKIP][105] ([fdo#109271]) -> [SKIP][106] ([fdo#109271] / [i915#1635]) +9 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-apl2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-apl4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_plane_cursor@pipe-d-viewport-size-128:
    - shard-apl:          [SKIP][107] ([fdo#109271] / [i915#1635]) -> [SKIP][108] ([fdo#109271]) +19 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-apl4/igt@kms_plane_cursor@pipe-d-viewport-size-128.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-apl1/igt@kms_plane_cursor@pipe-d-viewport-size-128.html

  * igt@kms_setmode@basic:
    - shard-apl:          [DMESG-FAIL][109] ([i915#1635] / [i915#31] / [i915#95]) -> [FAIL][110] ([i915#31])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-apl7/igt@kms_setmode@basic.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-apl6/igt@kms_setmode@basic.html
    - shard-kbl:          [DMESG-WARN][111] ([i915#93] / [i915#95]) -> [FAIL][112] ([i915#31])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-kbl7/igt@kms_setmode@basic.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-kbl4/igt@kms_setmode@basic.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][113], [FAIL][114]) ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][115] ([i915#1635] / [i915#2110])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-apl2/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5725/shard-apl6/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/shard-apl8/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1320]: https://gitlab.freedesktop.org/drm/intel/issues/1320
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1779]: https://gitlab.freedesktop.org/drm/intel/issues/1779
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2021]: https://gitlab.freedesktop.org/drm/intel/issues/2021
  [i915#2036]: https://gitlab.freedesktop.org/drm/intel/issues/2036
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5725 -> IGTPW_4743

  CI-20190529: 20190529
  CI_DRM_8708: 170e94a1430fd0a4f0841ad0f7366904d52e49be @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4743: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/index.html
  IGT_5725: d31a5ba83d7f548c86d0e5486f1f44a5563020d6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4743/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
