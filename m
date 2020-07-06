Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 06 Jul 2020 15:28:16 -0000
Message-ID: <159404929652.17684.10417983842398242697@emeril.freedesktop.org>
References: <20200706130842.9534-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200706130842.9534-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2J1?=
 =?utf-8?q?fops=3A_add_surface_array_to_cover_ccs_pgtable?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/bufops: add surface array to cover ccs pgtable
URL   : https://patchwork.freedesktop.org/series/79158/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5724_full -> IGTPW_4741_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4741_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4741_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4741_full:

### IGT changes ###

#### Possible regressions ####

  * igt@perf_pmu@most-busy-check-all@bcs0:
    - shard-hsw:          [PASS][1] -> [FAIL][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw4/igt@perf_pmu@most-busy-check-all@bcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-hsw6/igt@perf_pmu@most-busy-check-all@bcs0.html
    - shard-snb:          [PASS][3] -> [FAIL][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-snb5/igt@perf_pmu@most-busy-check-all@bcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-snb2/igt@perf_pmu@most-busy-check-all@bcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4741_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@kms:
    - shard-snb:          [PASS][5] -> [DMESG-WARN][6] ([i915#1982])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-snb6/igt@gem_eio@kms.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-snb4/igt@gem_eio@kms.html

  * igt@gem_exec_create@madvise:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#118] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk6/igt@gem_exec_create@madvise.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-glk2/igt@gem_exec_create@madvise.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#1930])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk9/igt@gem_exec_reloc@basic-concurrent0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-glk9/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-tglb:         [PASS][11] -> [DMESG-WARN][12] ([i915#402]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-tglb7/igt@gem_madvise@dontneed-before-pwrite.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-tglb7/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_mmap_wc@copy:
    - shard-hsw:          [PASS][13] -> [TIMEOUT][14] ([i915#1958] / [i915#2119]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw1/igt@gem_mmap_wc@copy.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-hsw6/igt@gem_mmap_wc@copy.html
    - shard-snb:          [PASS][15] -> [TIMEOUT][16] ([i915#1958] / [i915#2119]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-snb1/igt@gem_mmap_wc@copy.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-snb2/igt@gem_mmap_wc@copy.html

  * igt@gem_pread@bench:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#93] / [i915#95]) +41 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl3/igt@gem_pread@bench.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-kbl6/igt@gem_pread@bench.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#1436] / [i915#716])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-apl2/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-kbl:          [PASS][21] -> [DMESG-FAIL][22] ([i915#95]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl2/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-kbl1/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][23] -> [DMESG-FAIL][24] ([i915#118] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-kbl:          [PASS][25] -> [DMESG-FAIL][26] ([i915#54] / [i915#95]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#54])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#1635] / [i915#95]) +45 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-apl6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-tglb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1982]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-tglb8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-tglb8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-apl:          [PASS][35] -> [DMESG-FAIL][36] ([i915#1635] / [i915#95]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-apl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#1559])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk9/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-glk8/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][41] -> [FAIL][42] ([i915#173])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb6/igt@kms_psr@no_drrs.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-iclb4/igt@kms_psr@psr2_suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][45] -> [INCOMPLETE][46] ([i915#155] / [i915#794])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf_pmu@module-unload:
    - shard-apl:          [PASS][47] -> [DMESG-WARN][48] ([i915#1982])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl6/igt@perf_pmu@module-unload.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-apl7/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@most-busy-check-all@vcs0:
    - shard-snb:          [PASS][49] -> [DMESG-FAIL][50] ([i915#2119])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-snb5/igt@perf_pmu@most-busy-check-all@vcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-snb2/igt@perf_pmu@most-busy-check-all@vcs0.html

  * igt@perf_pmu@most-busy-check-all@vecs0:
    - shard-hsw:          [PASS][51] -> [DMESG-FAIL][52] ([i915#2119])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw4/igt@perf_pmu@most-busy-check-all@vecs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-hsw6/igt@perf_pmu@most-busy-check-all@vecs0.html

  * igt@syncobj_wait@wait-all-for-submit-delayed-submit:
    - shard-iclb:         [PASS][53] -> [DMESG-WARN][54] ([i915#1226])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb7/igt@syncobj_wait@wait-all-for-submit-delayed-submit.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-iclb2/igt@syncobj_wait@wait-all-for-submit-delayed-submit.html

  
#### Possible fixes ####

  * igt@gem_exec_params@readonly:
    - shard-kbl:          [DMESG-WARN][55] ([i915#93] / [i915#95]) -> [PASS][56] +33 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl2/igt@gem_exec_params@readonly.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-kbl2/igt@gem_exec_params@readonly.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][57] ([i915#118] / [i915#95]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-glk4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-apl2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:
    - shard-glk:          [DMESG-WARN][61] ([i915#1982]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk7/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-hsw:          [TIMEOUT][63] ([i915#1958] / [i915#2119]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-hsw2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-hsw:          [SKIP][65] ([fdo#109271]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-hsw6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled:
    - shard-glk:          [FAIL][67] ([i915#52] / [i915#54]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-glk2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [DMESG-FAIL][69] ([i915#54] / [i915#95]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [DMESG-FAIL][71] ([i915#1635] / [i915#54] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][73] ([i915#79]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [DMESG-FAIL][77] ([i915#1635] / [i915#95]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling.html
    - shard-kbl:          [DMESG-FAIL][79] ([i915#95]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [DMESG-WARN][81] ([i915#1982]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-glk:          [FAIL][83] ([i915#1559]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-glk6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][85] ([fdo#109642] / [fdo#111068]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb6/igt@kms_psr2_su@frontbuffer.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88] +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb7/igt@kms_psr@psr2_no_drrs.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][89] ([i915#1820]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl6/igt@perf_pmu@semaphore-busy@rcs0.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html

  * igt@testdisplay:
    - shard-glk:          [DMESG-WARN][91] ([i915#118] / [i915#95]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-glk1/igt@testdisplay.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-glk1/igt@testdisplay.html

  * igt@tools_test@tools_test:
    - shard-apl:          [DMESG-WARN][93] ([i915#1635] / [i915#95]) -> [PASS][94] +25 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl6/igt@tools_test@tools_test.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-apl1/igt@tools_test@tools_test.html

  
#### Warnings ####

  * igt@gem_ctx_sseu@invalid-args:
    - shard-apl:          [SKIP][95] ([fdo#109271]) -> [SKIP][96] ([fdo#109271] / [i915#1635]) +18 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl4/igt@gem_ctx_sseu@invalid-args.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-apl1/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][97] ([i915#1930]) -> [TIMEOUT][98] ([i915#1958] / [i915#2119])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][99] ([i915#658]) -> [SKIP][100] ([i915#588])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          [SKIP][101] ([fdo#109271] / [fdo#111827]) -> [SKIP][102] ([fdo#109271] / [fdo#111827] / [i915#1635])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl8/igt@kms_chamelium@hdmi-edid-change-during-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-apl6/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [FAIL][103] ([fdo#110321] / [fdo#110336]) -> [DMESG-FAIL][104] ([fdo#110321] / [i915#1635] / [i915#95])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl7/igt@kms_content_protection@atomic.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-apl1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          [TIMEOUT][105] ([i915#1319] / [i915#1958] / [i915#2119]) -> [TIMEOUT][106] ([i915#1319] / [i915#2119])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl1/igt@kms_content_protection@srm.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-kbl6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-snb:          [SKIP][107] ([fdo#109271]) -> [TIMEOUT][108] ([i915#1958] / [i915#2119]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-snb2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-snb2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][109] ([i915#1226]) -> [SKIP][110] ([fdo#109349])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack:
    - shard-hsw:          [SKIP][111] ([fdo#109271]) -> [TIMEOUT][112] ([i915#1958] / [i915#2119])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw2/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-hsw6/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-hsw:          [TIMEOUT][113] ([i915#1958] / [i915#2119]) -> [SKIP][114] ([fdo#109271]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-hsw1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-apl:          [SKIP][115] ([fdo#109271] / [i915#1635]) -> [SKIP][116] ([fdo#109271]) +15 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          [DMESG-FAIL][117] ([fdo#108145] / [i915#1635] / [i915#95]) -> [FAIL][118] ([fdo#108145] / [i915#265]) +2 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-kbl:          [DMESG-FAIL][119] ([fdo#108145] / [i915#95]) -> [FAIL][120] ([fdo#108145] / [i915#265]) +2 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-kbl:          [DMESG-FAIL][121] ([i915#95]) -> [FAIL][122] ([i915#265])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@perf@polling-parameterized:
    - shard-hsw:          [INCOMPLETE][123] ([i915#1958]) -> [FAIL][124] ([i915#1542])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-hsw5/igt@perf@polling-parameterized.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-hsw6/igt@perf@polling-parameterized.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][125], [FAIL][126]) ([i915#1784] / [i915#2110]) -> [FAIL][127] ([i915#1436] / [i915#1784] / [i915#2110])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl1/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-kbl3/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-kbl2/igt@runner@aborted.html
    - shard-apl:          [FAIL][128] ([i915#1610] / [i915#1635] / [i915#2110]) -> ([FAIL][129], [FAIL][130]) ([fdo#109271] / [i915#1635] / [i915#2110] / [i915#716])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5724/shard-apl2/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-apl2/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/shard-apl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5724 -> IGTPW_4741

  CI-20190529: 20190529
  CI_DRM_8708: 170e94a1430fd0a4f0841ad0f7366904d52e49be @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4741: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/index.html
  IGT_5724: bfbf195bd0c35fd73d1ee95e79249151aa248f2e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4741/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
