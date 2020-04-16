Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 16 Apr 2020 10:04:10 -0000
Message-ID: <158703145086.20886.9830695196970697896@emeril.freedesktop.org>
References: <20200415131515.7507-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200415131515.7507-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHM6?=
 =?utf-8?q?_Add_a_test_for_device_hot_unplug_=28rev4=29?=
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

Series: tests: Add a test for device hot unplug (rev4)
URL   : https://patchwork.freedesktop.org/series/75692/
State : success

== Summary ==

CI Bug Log - changes from IGT_5591_full -> IGTPW_4468_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/index.html

New tests
---------

  New tests have been introduced between IGT_5591_full and IGTPW_4468_full:

### New IGT tests (14) ###

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.53] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.49] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.48] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.19] s

  * igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.27] s

  * igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.27] s

  * igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.25] s

  * igt@kms_flip@dpms-off-confusion-interruptible@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [8.70] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [2.26] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.65] s

  

Known issues
------------

  Here are the changes found in IGTPW_4468_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl1/igt@gem_eio@in-flight-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-kbl3/igt@gem_eio@in-flight-suspend.html
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl3/igt@gem_eio@in-flight-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-apl6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-iclb7/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-snb:          [PASS][7] -> [FAIL][8] ([i915#1066])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-snb1/igt@i915_pm_rc6_residency@rc6-idle.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-snb5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#54] / [i915#93] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#52] / [i915#54]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling.html
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#699] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#53] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#53] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([fdo#108145] / [i915#265] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#1559] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#1559] / [i915#93] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#1085])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-tglb7/igt@perf@gen12-mi-rpc.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-tglb5/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][31] ([i915#716]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl3/igt@gen9_exec_parse@allowed-all.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-kbl4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][33] ([i915#454]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-iclb7/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [FAIL][35] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-kbl6/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [FAIL][37] ([i915#1119] / [i915#95]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-apl1/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][39] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][43] ([i915#72]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][45] ([i915#52] / [i915#54]) -> [PASS][46] +6 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][47] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglb:         [INCOMPLETE][49] ([i915#456] / [i915#460]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-tglb8/igt@kms_fbcon_fbt@psr-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-tglb2/igt@kms_fbcon_fbt@psr-suspend.html

  * {igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1}:
    - shard-glk:          [FAIL][51] -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +7 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][55] ([i915#49]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [FAIL][57] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-apl:          [FAIL][59] ([i915#53] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-apl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [FAIL][61] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [FAIL][63] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][65] ([fdo#109441]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][67] ([i915#468]) -> [FAIL][68] ([i915#454])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-snb:          [INCOMPLETE][69] ([i915#82]) -> [SKIP][70] ([fdo#109271])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-snb5/igt@i915_pm_dc@dc6-psr.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-snb6/igt@i915_pm_dc@dc6-psr.html
    - shard-tglb:         [FAIL][71] ([i915#454]) -> [SKIP][72] ([i915#468])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][73], [FAIL][74]) ([i915#1423] / [i915#716] / [i915#92]) -> [FAIL][75] ([i915#1423] / [i915#92])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl4/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl3/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/shard-kbl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1066]: https://gitlab.freedesktop.org/drm/intel/issues/1066
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5591 -> IGTPW_4468

  CI-20190529: 20190529
  CI_DRM_8301: 7d2bdd2df0d18945bb274de8bc7560e14779e346 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4468: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/index.html
  IGT_5591: f57b7fdbe8d04ce3edf0433a03c7d9d5c3d96680 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
