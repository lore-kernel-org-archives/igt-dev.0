Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 02 Jun 2020 02:24:32 -0000
Message-ID: <159106467207.21428.8644018446596175612@emeril.freedesktop.org>
References: <20200601190809.1174616-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200601190809.1174616-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fschedule=3A_Try_to_spot_unfairness?=
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

Series: i915/gem_exec_schedule: Try to spot unfairness
URL   : https://patchwork.freedesktop.org/series/77887/
State : success

== Summary ==

CI Bug Log - changes from IGT_5690_full -> IGTPW_4631_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4631_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_schedule@fairness@bcs0} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-glk4/igt@gem_exec_schedule@fairness@bcs0.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-iclb8/igt@gem_exec_schedule@fairness@bcs0.html
    - shard-apl:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-apl7/igt@gem_exec_schedule@fairness@bcs0.html
    - shard-kbl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-kbl3/igt@gem_exec_schedule@fairness@bcs0.html
    - shard-tglb:         NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-tglb8/igt@gem_exec_schedule@fairness@bcs0.html

  * {igt@gem_exec_schedule@fairness@rcs0} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-iclb8/igt@gem_exec_schedule@fairness@rcs0.html

  
New tests
---------

  New tests have been introduced between IGT_5690_full and IGTPW_4631_full:

### New IGT tests (6) ###

  * igt@gem_exec_schedule@fairness:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fairness@bcs0:
    - Statuses : 3 fail(s) 2 incomplete(s)
    - Exec time: [0.0, 3.37] s

  * igt@gem_exec_schedule@fairness@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [3.34, 13.39] s

  * igt@gem_exec_schedule@fairness@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [13.20, 13.36] s

  * igt@gem_exec_schedule@fairness@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [13.18] s

  * igt@gem_exec_schedule@fairness@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [13.18, 13.34] s

  

Known issues
------------

  Here are the changes found in IGTPW_4631_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-hsw:          [PASS][7] -> [INCOMPLETE][8] ([i915#151] / [i915#61])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-hsw1/igt@i915_pm_rpm@gem-execbuf.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-hsw1/igt@i915_pm_rpm@gem-execbuf.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#54] / [i915#93] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding:
    - shard-apl:          [PASS][11] -> [TIMEOUT][12] ([i915#1635]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
    - shard-glk:          [PASS][13] -> [TIMEOUT][14] ([i915#1958]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#52] / [i915#54] / [i915#95]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-apl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Possible fixes ####

  * {igt@gem_exec_reloc@basic-concurrent16}:
    - shard-snb:          [FAIL][25] ([i915#1930]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-glk:          [TIMEOUT][27] ([i915#1958]) -> [PASS][28] +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-glk9/igt@gem_exec_reloc@basic-cpu-read.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-glk5/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][29] ([i915#1436] / [i915#716]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-glk7/igt@gen9_exec_parse@allowed-all.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-glk4/igt@gen9_exec_parse@allowed-all.html
    - shard-kbl:          [DMESG-WARN][31] ([i915#1436] / [i915#716]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-kbl6/igt@gen9_exec_parse@allowed-all.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-kbl7/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [FAIL][33] ([i915#1119] / [i915#118] / [i915#95]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-glk2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_color@pipe-b-degamma:
    - shard-hsw:          [DMESG-WARN][35] ([i915#1927]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-hsw1/igt@kms_color@pipe-b-degamma.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-hsw4/igt@kms_color@pipe-b-degamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][37] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][38] +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:
    - shard-apl:          [FAIL][39] ([i915#70] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-apl6/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-apl7/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
    - shard-kbl:          [FAIL][41] ([i915#70] / [i915#93] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-kbl6/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-kbl3/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][43] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [FAIL][45] ([i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-apl7/igt@kms_draw_crc@fill-fb.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-apl7/igt@kms_draw_crc@fill-fb.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][47] ([i915#64] / [i915#93] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-kbl2/igt@kms_fbcon_fbt@fbc.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-kbl3/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][49] ([i915#1525] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-apl4/igt@kms_fbcon_fbt@fbc.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-apl7/igt@kms_fbcon_fbt@fbc.html

  * {igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2}:
    - shard-glk:          [FAIL][51] ([i915#79]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * {igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2}:
    - shard-glk:          [FAIL][53] ([i915#46]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [FAIL][57] ([i915#83]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-tglb1/igt@kms_panel_fitting@atomic-fastset.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-tglb7/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [FAIL][59] ([i915#83]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-iclb3/igt@kms_panel_fitting@atomic-fastset.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-iclb7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][63] ([fdo#109441]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-iclb1/igt@kms_psr@psr2_basic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@kms_vblank@pipe-c-wait-idle-hang:
    - shard-apl:          [TIMEOUT][65] ([i915#1635]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-apl6/igt@kms_vblank@pipe-c-wait-idle-hang.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-apl6/igt@kms_vblank@pipe-c-wait-idle-hang.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][67] ([i915#1542]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-hsw8/igt@perf@blocking-parameterized.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-hsw1/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][69] ([i915#1899]) -> [SKIP][70] ([i915#468])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][71] ([i915#1515]) -> [FAIL][72] ([i915#1515])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [FAIL][73] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][74] ([i915#1319] / [i915#1635])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-apl1/igt@kms_content_protection@atomic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-apl1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][75] ([i915#1319] / [i915#1635]) -> [FAIL][76] ([fdo#110321] / [fdo#110336])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-apl8/igt@kms_content_protection@atomic-dpms.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-apl1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][77] ([i915#1319] / [i915#1635]) -> [FAIL][78] ([fdo#110321])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-apl6/igt@kms_content_protection@srm.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-apl7/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [DMESG-WARN][79] ([i915#1926]) -> [DMESG-FAIL][80] ([i915#1925] / [i915#1926])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-glk5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-glk4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-glk:          [DMESG-FAIL][81] ([i915#1925] / [i915#1926]) -> [DMESG-WARN][82] ([i915#1926])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-glk7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-glk5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-apl:          [FAIL][83] ([fdo#108145] / [i915#265]) -> [FAIL][84] ([fdo#108145] / [i915#265] / [i915#95])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_lowres@pipe-d-tiling-none:
    - shard-apl:          [SKIP][85] ([fdo#109271]) -> [TIMEOUT][86] ([i915#1635])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-apl7/igt@kms_plane_lowres@pipe-d-tiling-none.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-apl4/igt@kms_plane_lowres@pipe-d-tiling-none.html
    - shard-glk:          [SKIP][87] ([fdo#109271]) -> [TIMEOUT][88] ([i915#1958])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-glk8/igt@kms_plane_lowres@pipe-d-tiling-none.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-glk1/igt@kms_plane_lowres@pipe-d-tiling-none.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][89] ([fdo#109642] / [fdo#111068]) -> [FAIL][90] ([i915#608])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5690/shard-iclb1/igt@kms_psr2_su@page_flip.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/shard-iclb2/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
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
  * IGT: IGT_5690 -> IGTPW_4631

  CI-20190529: 20190529
  CI_DRM_8566: fed6b89dd6f3c4e2e909805815c5728b1fd65ce5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4631: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/index.html
  IGT_5690: bea881189520a9cccbb1c1cb454ac5b6fdaea40e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4631/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
