Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 17 Feb 2020 08:57:50 -0000
Message-ID: <158192987014.7224.14038932736169599756@emeril.freedesktop.org>
References: <20200212190509.30369-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200212190509.30369-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbig=5Ffb=3A_Set_plane_position_and_framebuffer_dimensions?=
 =?utf-8?q?_before_commit?=
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_big_fb: Set plane position and framebuffer dimensions before commit
URL   : https://patchwork.freedesktop.org/series/73393/
State : success

== Summary ==

CI Bug Log - changes from IGT_5439_full -> IGTPW_4143_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/index.html

Known issues
------------

  Here are the changes found in IGTPW_4143_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +10 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb4/igt@gem_ctx_isolation@vcs1-none.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-iclb3/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276]) +17 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb1/igt@gem_exec_schedule@independent-bsd2.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-iclb8/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@promotion-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb8/igt@gem_exec_schedule@promotion-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-iclb2/igt@gem_exec_schedule@promotion-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-tglb:         [PASS][7] -> [FAIL][8] ([i915#644])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-tglb6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [PASS][9] -> [DMESG-WARN][10] ([fdo#110789] / [fdo#111870] / [i915#478])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@gem_userptr_blits@sync-unmap.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-snb6/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#454])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#413])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb3/igt@i915_pm_rps@waitboost.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-iclb4/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-apl7/igt@i915_suspend@sysfs-reader.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-apl4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([i915#1140])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-iclb7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
    - shard-tglb:         [PASS][19] -> [FAIL][20] ([i915#1172])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-tglb6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_color@pipe-a-gamma:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#1149])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb3/igt@kms_color@pipe-a-gamma.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-tglb1/igt@kms_color@pipe-a-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-size-change:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([fdo#111703])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-size-change.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-size-change.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-random:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:
    - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#70])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb1/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-tglb8/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled:
    - shard-tglb:         [PASS][29] -> [DMESG-FAIL][30] ([i915#402]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
    - shard-kbl:          [PASS][31] -> [INCOMPLETE][32] ([CI#80] / [fdo#103665])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#49])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [PASS][35] -> [INCOMPLETE][36] ([fdo#103665])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_multiple@atomic-pipe-a-tiling-x:
    - shard-tglb:         [PASS][37] -> [FAIL][38] ([i915#778])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-a-tiling-x.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-a-tiling-x.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-iclb1/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#31])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-apl2/igt@kms_setmode@basic.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-apl7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][45] ([fdo#112080]) -> [PASS][46] +9 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb5/igt@gem_busy@busy-vcs1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-iclb1/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][47] ([fdo#110841]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@independent-bsd:
    - shard-iclb:         [SKIP][49] ([fdo#112146]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb4/igt@gem_exec_schedule@independent-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-iclb3/igt@gem_exec_schedule@independent-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][51] ([i915#677]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][53] ([fdo#109276]) -> [PASS][54] +19 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb7/igt@gem_exec_schedule@promotion-bsd1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-hsw:          [FAIL][55] ([i915#694]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-hsw1/igt@gen7_exec_parse@basic-offset.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-hsw5/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][57] ([i915#716]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-glk4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][59] ([i915#447]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-iclb5/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-hsw:          [INCOMPLETE][61] ([i915#151] / [i915#61]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-hsw5/igt@i915_pm_rpm@gem-evict-pwrite.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-hsw1/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-tglb:         [FAIL][63] ([i915#1172]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb1/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-tglb1/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-tglb:         [FAIL][65] ([fdo#111703]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:
    - shard-apl:          [FAIL][67] ([i915#54]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
    - shard-kbl:          [FAIL][69] ([i915#54]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip_tiling@flip-to-y-tiled:
    - shard-glk:          [FAIL][73] ([i915#167]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-glk7/igt@kms_flip_tiling@flip-to-y-tiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-glk8/igt@kms_flip_tiling@flip-to-y-tiled.html
    - shard-tglb:         [DMESG-FAIL][75] ([i915#402]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb2/igt@kms_flip_tiling@flip-to-y-tiled.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-tglb8/igt@kms_flip_tiling@flip-to-y-tiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-snb:          [DMESG-WARN][77] ([i915#478]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane@plane-panning-top-left-pipe-a-planes:
    - shard-tglb:         [FAIL][81] ([i915#1171]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-tglb1/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-tglb7/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][83] ([i915#899]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][85] ([fdo#109642] / [fdo#111068]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb6/igt@kms_psr2_su@frontbuffer.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [INCOMPLETE][89] ([fdo#103665]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][91] ([fdo#112080]) -> [FAIL][92] ([IGT#28])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][93] ([IGT#28]) -> [SKIP][94] ([fdo#112080])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][95] ([i915#818]) -> [FAIL][96] ([i915#694])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-hsw1/igt@gem_tiled_blits@interruptible.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-hsw1/igt@gem_tiled_blits@interruptible.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][97], [FAIL][98], [FAIL][99], [FAIL][100], [FAIL][101], [FAIL][102], [FAIL][103], [FAIL][104], [FAIL][105]) ([fdo#111870] / [i915#1077] / [i915#698] / [i915#974]) -> ([FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115]) ([fdo#111870] / [i915#1077] / [i915#974])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb6/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb5/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb5/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb2/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5439/shard-snb5/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-snb6/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-snb6/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-snb2/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-snb6/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-snb2/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-snb6/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-snb2/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-snb4/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-snb2/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/shard-snb4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1171]: https://gitlab.freedesktop.org/drm/intel/issues/1171
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#167]: https://gitlab.freedesktop.org/drm/intel/issues/167
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#778]: https://gitlab.freedesktop.org/drm/intel/issues/778
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#974]: https://gitlab.freedesktop.org/drm/intel/issues/974


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5439 -> IGTPW_4143

  CI-20190529: 20190529
  CI_DRM_7927: 3a98ab302e50571e7815a0092e344ffe730688bb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4143: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/index.html
  IGT_5439: ed1f7d96d4d5d4565bcd3adb3a23b2002a25419e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4143/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
