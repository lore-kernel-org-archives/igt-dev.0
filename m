Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 06 Jul 2020 16:20:05 -0000
Message-ID: <159405240580.17681.13220080895003549271@emeril.freedesktop.org>
References: <20200706133917.1577451-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200706133917.1577451-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQnVpbGQg?=
 =?utf-8?q?api=5Fintel=5Fbb_with_Autotools_too?=
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Build api_intel_bb with Autotools too
URL   : https://patchwork.freedesktop.org/series/79159/
State : success

== Summary ==

CI Bug Log - changes from IGT_5724_full -> IGTPW_4742_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/index.html

Known issues
------------

  Here are the changes found in IGTPW_4742_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2] ([i915#1373] / [i915#1602] / [i915#1887])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-tglb7/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-tglb8/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#1635] / [i915#95]) +21 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl4/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-apl7/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#1436] / [i915#716])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-apl2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180] / [i915#93] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-kbl7/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl1/igt@i915_suspend@forcewake.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-kbl7/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [PASS][11] -> [DMESG-FAIL][12] ([i915#1635] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-apl1/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [PASS][13] -> [DMESG-FAIL][14] ([i915#54] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [PASS][15] -> [INCOMPLETE][16] ([i915#155])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-hsw:          [PASS][17] -> [TIMEOUT][18] ([i915#1958] / [i915#2119])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-hsw7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-tglb:         [PASS][19] -> [DMESG-WARN][20] ([i915#402]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-tglb3/igt@kms_cursor_legacy@pipe-d-torture-bo.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-tglb8/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#926])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb1/igt@kms_fbcon_fbt@fbc.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-iclb2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [PASS][23] -> [INCOMPLETE][24] ([i915#2055])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_getfb@getfb2-into-addfb2:
    - shard-snb:          [PASS][27] -> [TIMEOUT][28] ([i915#1958] / [i915#2119])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-snb6/igt@kms_getfb@getfb2-into-addfb2.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-snb6/igt@kms_getfb@getfb2-into-addfb2.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [PASS][29] -> [DMESG-FAIL][30] ([i915#95]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-iclb6/igt@kms_psr@psr2_suspend.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#93] / [i915#95]) +37 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl1/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-kbl3/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@kms_vblank@pipe-a-wait-busy-hang:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#1982])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl6/igt@kms_vblank@pipe-a-wait-busy-hang.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-apl6/igt@kms_vblank@pipe-a-wait-busy-hang.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][37] -> [FAIL][38] ([i915#1542])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb3/igt@perf@blocking-parameterized.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-iclb8/igt@perf@blocking-parameterized.html

  * igt@perf@disabled-read-error:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#1982])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl4/igt@perf@disabled-read-error.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-kbl2/igt@perf@disabled-read-error.html

  
#### Possible fixes ####

  * igt@gem_exec_params@readonly:
    - shard-kbl:          [DMESG-WARN][41] ([i915#93] / [i915#95]) -> [PASS][42] +33 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl2/igt@gem_exec_params@readonly.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-kbl7/igt@gem_exec_params@readonly.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][43] ([i915#1982]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-apl2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen:
    - shard-kbl:          [DMESG-FAIL][45] ([i915#54] / [i915#95]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:
    - shard-glk:          [DMESG-WARN][47] ([i915#1982]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk7/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-glk3/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-glk:          [DMESG-FAIL][49] ([i915#118] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-glk5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-hsw:          [TIMEOUT][51] ([i915#1958] / [i915#2119]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-hsw2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-hsw:          [SKIP][53] ([fdo#109271]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-hsw2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled:
    - shard-glk:          [FAIL][55] ([i915#52] / [i915#54]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-glk4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +4 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [DMESG-FAIL][59] ([i915#1635] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling.html
    - shard-kbl:          [DMESG-FAIL][61] ([i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack:
    - shard-glk:          [FAIL][63] ([i915#49]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [DMESG-WARN][65] ([i915#1982]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-glk:          [FAIL][67] ([i915#1559]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-glk2/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][69] ([fdo#109642] / [fdo#111068]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb6/igt@kms_psr2_su@frontbuffer.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][71] ([fdo#109441]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][73] ([i915#1820]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl6/igt@perf_pmu@semaphore-busy@rcs0.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html

  * igt@testdisplay:
    - shard-glk:          [DMESG-WARN][75] ([i915#118] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk1/igt@testdisplay.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-glk7/igt@testdisplay.html

  * igt@tools_test@tools_test:
    - shard-apl:          [DMESG-WARN][77] ([i915#1635] / [i915#95]) -> [PASS][78] +25 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl6/igt@tools_test@tools_test.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-apl1/igt@tools_test@tools_test.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][79] ([i915#1930]) -> [TIMEOUT][80] ([i915#1958] / [i915#2119])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@kms_chamelium@dp-edid-change-during-suspend:
    - shard-apl:          [SKIP][81] ([fdo#109271] / [fdo#111827]) -> [SKIP][82] ([fdo#109271] / [fdo#111827] / [i915#1635])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl2/igt@kms_chamelium@dp-edid-change-during-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-apl6/igt@kms_chamelium@dp-edid-change-during-suspend.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][83] ([i915#1319] / [i915#1958] / [i915#2119]) -> [TIMEOUT][84] ([i915#1319] / [i915#2119])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl2/igt@kms_content_protection@lic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-kbl1/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][85] ([i915#2105]) -> [DMESG-FAIL][86] ([i915#95])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl1/igt@kms_content_protection@uevent.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-kbl3/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][87] ([i915#2105]) -> [DMESG-FAIL][88] ([i915#1635] / [i915#95])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl6/igt@kms_content_protection@uevent.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-apl6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
    - shard-kbl:          [DMESG-WARN][89] ([i915#93] / [i915#95]) -> [FAIL][90] ([i915#54])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
    - shard-apl:          [DMESG-WARN][91] ([i915#1635] / [i915#95]) -> [FAIL][92] ([i915#54])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][93] ([i915#1226]) -> [SKIP][94] ([fdo#109349])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-apl:          [SKIP][95] ([fdo#109271]) -> [SKIP][96] ([fdo#109271] / [i915#1635]) +16 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-apl7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-hsw:          [TIMEOUT][97] ([i915#1958] / [i915#2119]) -> [SKIP][98] ([fdo#109271]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-hsw1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-apl:          [SKIP][99] ([fdo#109271] / [i915#1635]) -> [SKIP][100] ([fdo#109271]) +15 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-apl2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          [DMESG-FAIL][101] ([fdo#108145] / [i915#1635] / [i915#95]) -> [FAIL][102] ([fdo#108145] / [i915#265]) +2 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-kbl:          [DMESG-FAIL][103] ([fdo#108145] / [i915#95]) -> [FAIL][104] ([fdo#108145] / [i915#265]) +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-kbl:          [DMESG-FAIL][105] ([i915#95]) -> [FAIL][106] ([i915#265])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_psr@suspend:
    - shard-snb:          [SKIP][107] ([fdo#109271]) -> [TIMEOUT][108] ([i915#1958] / [i915#2119]) +4 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-snb6/igt@kms_psr@suspend.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-snb6/igt@kms_psr@suspend.html
    - shard-hsw:          [SKIP][109] ([fdo#109271]) -> [TIMEOUT][110] ([i915#1958] / [i915#2119]) +3 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw2/igt@kms_psr@suspend.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-hsw7/igt@kms_psr@suspend.html

  * igt@perf@polling-parameterized:
    - shard-hsw:          [INCOMPLETE][111] ([i915#1958]) -> [FAIL][112] ([i915#1542])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw5/igt@perf@polling-parameterized.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-hsw4/igt@perf@polling-parameterized.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][113], [FAIL][114]) ([i915#1784] / [i915#2110]) -> [FAIL][115] ([i915#1436] / [i915#1784] / [i915#2110])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl1/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl3/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-kbl6/igt@runner@aborted.html
    - shard-apl:          [FAIL][116] ([i915#1610] / [i915#1635] / [i915#2110]) -> ([FAIL][117], [FAIL][118]) ([fdo#109271] / [i915#1635] / [i915#2110] / [i915#716])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl2/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-apl2/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-apl6/igt@runner@aborted.html
    - shard-tglb:         [FAIL][119] ([i915#2110]) -> ([FAIL][120], [FAIL][121]) ([i915#2110] / [i915#402])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-tglb6/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-tglb1/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/shard-tglb8/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#926]: https://gitlab.freedesktop.org/drm/intel/issues/926
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5724 -> IGTPW_4742

  CI-20190529: 20190529
  CI_DRM_8708: 170e94a1430fd0a4f0841ad0f7366904d52e49be @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4742: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/index.html
  IGT_5724: bfbf195bd0c35fd73d1ee95e79249151aa248f2e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4742/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
