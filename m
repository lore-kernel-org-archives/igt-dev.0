Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 06 Jul 2020 13:48:41 -0000
Message-ID: <159404332126.17682.5541732485335051625@emeril.freedesktop.org>
References: <20200706121520.967972-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200706121520.967972-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_lib/i915=3A_Report_unknown_dev?=
 =?utf-8?q?ice_as_the_future?=
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

Series: series starting with [i-g-t,1/3] lib/i915: Report unknown device as the future
URL   : https://patchwork.freedesktop.org/series/79153/
State : success

== Summary ==

CI Bug Log - changes from IGT_5724_full -> IGTPW_4740_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/index.html

Known issues
------------

  Here are the changes found in IGTPW_4740_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_shared@disjoint-timelines:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#93] / [i915#95]) +40 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl4/igt@gem_ctx_shared@disjoint-timelines.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-kbl4/igt@gem_ctx_shared@disjoint-timelines.html

  * igt@gem_exec_balancer@invalid-balancer:
    - shard-tglb:         [PASS][5] -> [DMESG-WARN][6] ([i915#402]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-tglb1/igt@gem_exec_balancer@invalid-balancer.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-tglb8/igt@gem_exec_balancer@invalid-balancer.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#1930])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk9/igt@gem_exec_reloc@basic-concurrent0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-normal:
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#118] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk7/igt@gem_exec_whisper@basic-normal.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-glk4/igt@gem_exec_whisper@basic-normal.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#1899])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb5/igt@i915_pm_dc@dc5-psr.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-iclb5/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [PASS][13] -> [FAIL][14] ([i915#1899])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-tglb6/igt@i915_pm_dc@dc5-psr.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-tglb1/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-hsw:          [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw4/igt@i915_pm_rpm@gem-execbuf-stress.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-hsw1/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl6/igt@i915_suspend@sysfs-reader.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-kbl2/igt@i915_suspend@sysfs-reader.html

  * igt@kms_addfb_basic@bad-pitch-0:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#1635] / [i915#95]) +36 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl4/igt@kms_addfb_basic@bad-pitch-0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-apl4/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - shard-glk:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk1/igt@kms_big_fb@linear-8bpp-rotate-0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-glk3/igt@kms_big_fb@linear-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-apl6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl3/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-kbl3/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [PASS][27] -> [DMESG-FAIL][28] ([i915#54] / [i915#95]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#54]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#54])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([IGT#5])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [PASS][35] -> [DMESG-FAIL][36] ([i915#1635] / [i915#54] / [i915#95]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#79])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][39] -> [INCOMPLETE][40] ([i915#155])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [PASS][41] -> [INCOMPLETE][42] ([i915#2055])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite:
    - shard-tglb:         [PASS][43] -> [DMESG-WARN][44] ([i915#1982]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-tglb8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][45] -> [SKIP][46] ([i915#433])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [PASS][47] -> [FAIL][48] ([i915#83])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb3/igt@kms_panel_fitting@atomic-fastset.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-iclb3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right-pipe-a-planes:
    - shard-iclb:         [PASS][49] -> [DMESG-WARN][50] ([i915#1982])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb7/igt@kms_plane@plane-panning-bottom-right-pipe-a-planes.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][51] -> [DMESG-FAIL][52] ([i915#1635] / [i915#95]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [PASS][53] -> [DMESG-FAIL][54] ([i915#95])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][55] -> [SKIP][56] ([fdo#109441]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-iclb5/igt@kms_psr@psr2_suspend.html

  * igt@kms_universal_plane@universal-plane-pipe-b-sanity:
    - shard-hsw:          [PASS][57] -> [TIMEOUT][58] ([i915#1958] / [i915#2119]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw2/igt@kms_universal_plane@universal-plane-pipe-b-sanity.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-hsw1/igt@kms_universal_plane@universal-plane-pipe-b-sanity.html

  * igt@kms_vblank@pipe-b-wait-busy:
    - shard-snb:          [PASS][59] -> [TIMEOUT][60] ([i915#1958] / [i915#2119]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-snb6/igt@kms_vblank@pipe-b-wait-busy.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-snb4/igt@kms_vblank@pipe-b-wait-busy.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_exec_params@readonly:
    - shard-kbl:          [DMESG-WARN][63] ([i915#93] / [i915#95]) -> [PASS][64] +29 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl2/igt@gem_exec_params@readonly.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-kbl2/igt@gem_exec_params@readonly.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-apl:          [FAIL][65] ([i915#1930]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl6/igt@gem_exec_reloc@basic-concurrent0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-apl1/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [DMESG-WARN][67] ([i915#402]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-tglb8/igt@i915_module_load@reload.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-tglb7/igt@i915_module_load@reload.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][69] ([i915#118] / [i915#95]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-glk4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][71] ([i915#1982]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-apl8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:
    - shard-glk:          [DMESG-WARN][73] ([i915#1982]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk7/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-hsw:          [TIMEOUT][75] ([i915#1958] / [i915#2119]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-hsw7/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-hsw:          [SKIP][77] ([fdo#109271]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-hsw2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled:
    - shard-glk:          [FAIL][79] ([i915#52] / [i915#54]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-glk8/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [DMESG-FAIL][81] ([i915#54] / [i915#95]) -> [PASS][82] +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [DMESG-FAIL][83] ([i915#1635] / [i915#54] / [i915#95]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][85] ([i915#79]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [DMESG-FAIL][87] ([i915#1635] / [i915#95]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack:
    - shard-glk:          [FAIL][89] ([i915#49]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [DMESG-WARN][91] ([i915#1982]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-glk:          [FAIL][93] ([i915#1559]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-glk6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [SKIP][95] ([fdo#109441]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb4/igt@kms_psr@psr2_primary_render.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-iclb2/igt@kms_psr@psr2_primary_render.html

  * igt@testdisplay:
    - shard-glk:          [DMESG-WARN][97] ([i915#118] / [i915#95]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk1/igt@testdisplay.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-glk5/igt@testdisplay.html

  * igt@tools_test@tools_test:
    - shard-apl:          [DMESG-WARN][99] ([i915#1635] / [i915#95]) -> [PASS][100] +25 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl6/igt@tools_test@tools_test.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-apl6/igt@tools_test@tools_test.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][101] ([i915#1930]) -> [TIMEOUT][102] ([i915#1958] / [i915#2119])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][103] ([i915#658]) -> [SKIP][104] ([i915#588])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-apl:          [SKIP][105] ([fdo#109271] / [fdo#111827]) -> [SKIP][106] ([fdo#109271] / [fdo#111827] / [i915#1635])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl2/igt@kms_color_chamelium@pipe-d-ctm-max.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-apl1/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-offscreen:
    - shard-snb:          [SKIP][107] ([fdo#109271]) -> [TIMEOUT][108] ([i915#1958] / [i915#2119]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-snb4/igt@kms_cursor_crc@pipe-c-cursor-64x64-offscreen.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-snb4/igt@kms_cursor_crc@pipe-c-cursor-64x64-offscreen.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][109] ([i915#1226]) -> [SKIP][110] ([fdo#109349])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-hsw:          [SKIP][111] ([fdo#109271]) -> [TIMEOUT][112] ([i915#1958] / [i915#2119]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-hsw1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-hsw:          [TIMEOUT][113] ([i915#1958] / [i915#2119]) -> [SKIP][114] ([fdo#109271]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-hsw7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-apl:          [SKIP][115] ([fdo#109271] / [i915#1635]) -> [SKIP][116] ([fdo#109271]) +15 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          [DMESG-FAIL][117] ([fdo#108145] / [i915#1635] / [i915#95]) -> [FAIL][118] ([fdo#108145] / [i915#265]) +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-kbl:          [DMESG-FAIL][119] ([fdo#108145] / [i915#95]) -> [FAIL][120] ([fdo#108145] / [i915#265]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-apl:          [FAIL][121] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][122] ([fdo#108145] / [i915#1635] / [i915#95])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@perf@polling-parameterized:
    - shard-hsw:          [INCOMPLETE][123] ([i915#1958]) -> [FAIL][124] ([i915#1542])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw5/igt@perf@polling-parameterized.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-hsw6/igt@perf@polling-parameterized.html

  * igt@prime_vgem@fence-write-hang:
    - shard-apl:          [SKIP][125] ([fdo#109271]) -> [SKIP][126] ([fdo#109271] / [i915#1635]) +12 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl7/igt@prime_vgem@fence-write-hang.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-apl7/igt@prime_vgem@fence-write-hang.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][127], [FAIL][128]) ([i915#1784] / [i915#2110]) -> [FAIL][129] ([i915#1436] / [i915#1784] / [i915#2110])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl1/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl3/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-kbl6/igt@runner@aborted.html
    - shard-apl:          [FAIL][130] ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][131] ([i915#1635] / [i915#2110])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl2/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/shard-apl6/igt@runner@aborted.html

  
  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
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
  * IGT: IGT_5724 -> IGTPW_4740

  CI-20190529: 20190529
  CI_DRM_8708: 170e94a1430fd0a4f0841ad0f7366904d52e49be @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4740: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/index.html
  IGT_5724: bfbf195bd0c35fd73d1ee95e79249151aa248f2e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4740/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
