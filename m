Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 16 Apr 2020 10:55:36 -0000
Message-ID: <158703453623.20884.13269089597183658328@emeril.freedesktop.org>
References: <20200414190509.2868509-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200414190509.2868509-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliOiBV?=
 =?utf-8?q?se_read=28=29_for_timerfd_timeout_detection_=28rev3=29?=
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

Series: lib: Use read() for timerfd timeout detection (rev3)
URL   : https://patchwork.freedesktop.org/series/75940/
State : success

== Summary ==

CI Bug Log - changes from IGT_5591_full -> IGTPW_4469_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/index.html

New tests
---------

  New tests have been introduced between IGT_5591_full and IGTPW_4469_full:

### New IGT tests (14) ###

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.71] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.49] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.50] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.54] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.17] s

  * igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.28] s

  * igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.28] s

  * igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.26] s

  * igt@kms_flip@dpms-off-confusion-interruptible@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [8.70] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.65] s

  

Known issues
------------

  Here are the changes found in IGTPW_4469_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-iclb7/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-kbl4/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-snb:          [PASS][5] -> [FAIL][6] ([i915#1066])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-snb1/igt@i915_pm_rc6_residency@rc6-idle.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-snb6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_cursor_crc@pipe-b-cursor-dpms:
    - shard-apl:          [PASS][7] -> [FAIL][8] ([i915#54]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-dpms.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-dpms.html
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#54])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-dpms.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-dpms.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#52] / [i915#54]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#52] / [i915#54] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-snb:          [PASS][19] -> [SKIP][20] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-snb6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-snb1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling.html
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#699] / [i915#93] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180] / [i915#93] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][27] -> [INCOMPLETE][28] ([i915#155])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#1085])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-tglb7/igt@perf@gen12-mi-rpc.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-tglb7/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][31] ([i915#716]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl3/igt@gen9_exec_parse@allowed-all.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-kbl7/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][33] ([i915#454]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          [DMESG-WARN][35] ([i915#180]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl4/igt@i915_suspend@debugfs-reader.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-apl2/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][37] ([i915#1119] / [i915#95]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][39] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][41] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][43] ([i915#72]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][45] ([fdo#109349]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-iclb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][47] ([i915#52] / [i915#54]) -> [PASS][48] +5 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglb:         [INCOMPLETE][49] ([i915#456] / [i915#460]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-tglb8/igt@kms_fbcon_fbt@psr-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-tglb1/igt@kms_fbcon_fbt@psr-suspend.html

  * {igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1}:
    - shard-glk:          [FAIL][51] -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +4 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][55] ([i915#49]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [FAIL][57] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-kbl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-apl:          [FAIL][59] ([i915#53] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-apl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [FAIL][61] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [FAIL][63] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][65] ([fdo#109441]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][67] ([i915#31]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl2/igt@kms_setmode@basic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-apl2/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][69] ([i915#468]) -> [FAIL][70] ([i915#454])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-snb:          [INCOMPLETE][71] ([i915#82]) -> [SKIP][72] ([fdo#109271])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-snb5/igt@i915_pm_dc@dc6-psr.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-snb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][73] ([i915#357]) -> [FAIL][74] ([i915#357] / [i915#93] / [i915#95])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl7/igt@kms_content_protection@uevent.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-kbl1/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][75] ([i915#357]) -> [FAIL][76] ([i915#357] / [i915#95])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl3/igt@kms_content_protection@uevent.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-apl8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [FAIL][77] ([i915#54] / [i915#93] / [i915#95]) -> [FAIL][78] ([i915#54])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][79], [FAIL][80]) ([i915#1423] / [i915#716] / [i915#92]) -> [FAIL][81] ([i915#1423] / [i915#92])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl4/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl3/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/shard-kbl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1066]: https://gitlab.freedesktop.org/drm/intel/issues/1066
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
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
  * IGT: IGT_5591 -> IGTPW_4469

  CI-20190529: 20190529
  CI_DRM_8301: 7d2bdd2df0d18945bb274de8bc7560e14779e346 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4469: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/index.html
  IGT_5591: f57b7fdbe8d04ce3edf0433a03c7d9d5c3d96680 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4469/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
