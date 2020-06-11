Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 11 Jun 2020 10:19:29 -0000
Message-ID: <159187076915.22714.8504807958901536703@emeril.freedesktop.org>
References: <20200610160417.3402896-1-lyude@redhat.com>
In-Reply-To: <20200610160417.3402896-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Fix_handling_of_metadata_values_containing_spaces?=
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
To: Lyude <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: runner: Fix handling of metadata values containing spaces
URL   : https://patchwork.freedesktop.org/series/78189/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8610_full -> IGTPW_4661_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/index.html

Known issues
------------

  Here are the changes found in IGTPW_4661_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@implicit-boths@rcs0:
    - shard-snb:          [PASS][1] -> [INCOMPLETE][2] ([i915#82])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-snb6/igt@gem_exec_schedule@implicit-boths@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-snb2/igt@gem_exec_schedule@implicit-boths@rcs0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#1436] / [i915#716])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-apl1/igt@gen9_exec_parse@allowed-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-apl8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [PASS][5] -> [DMESG-WARN][6] ([i915#402]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-tglb3/igt@i915_module_load@reload-with-fault-injection.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-tglb7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-apl:          [PASS][7] -> [DMESG-FAIL][8] ([i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-apl1/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_color@pipe-c-ctm-max:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#93] / [i915#95]) +48 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-kbl3/igt@kms_color@pipe-c-ctm-max.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-kbl3/igt@kms_color@pipe-c-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][11] -> [DMESG-FAIL][12] ([i915#54] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
    - shard-apl:          [PASS][13] -> [DMESG-FAIL][14] ([i915#54] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +7 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#95]) +36 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-apl1/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-apl1/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html

  * igt@kms_cursor_legacy@pipe-b-torture-move:
    - shard-hsw:          [PASS][19] -> [TIMEOUT][20] ([i915#1958]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-hsw6/igt@kms_cursor_legacy@pipe-b-torture-move.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-hsw2/igt@kms_cursor_legacy@pipe-b-torture-move.html

  * igt@kms_cursor_legacy@pipe-c-torture-move:
    - shard-hsw:          [PASS][21] -> [DMESG-WARN][22] ([i915#128])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-hsw4/igt@kms_cursor_legacy@pipe-c-torture-move.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-hsw1/igt@kms_cursor_legacy@pipe-c-torture-move.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-apl6/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-apl6/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-apl:          [PASS][29] -> [DMESG-FAIL][30] ([i915#49] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#49])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [PASS][33] -> [DMESG-WARN][34] ([i915#1982]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-glk5/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-glk1/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [PASS][35] -> [DMESG-FAIL][36] ([i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-kbl6/igt@kms_mmap_write_crc@main.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-kbl1/igt@kms_mmap_write_crc@main.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
    - shard-tglb:         [PASS][37] -> [INCOMPLETE][38] ([i915#1602])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-tglb8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#31])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-apl7/igt@kms_setmode@basic.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-apl3/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@disjoint-timelines:
    - shard-kbl:          [DMESG-WARN][43] ([i915#93] / [i915#95]) -> [PASS][44] +46 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-kbl7/igt@gem_ctx_shared@disjoint-timelines.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-kbl7/igt@gem_ctx_shared@disjoint-timelines.html

  * igt@gem_exec_schedule@implicit-read-write@rcs0:
    - shard-snb:          [INCOMPLETE][45] ([i915#82]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-snb2/igt@gem_exec_schedule@implicit-read-write@rcs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-snb6/igt@gem_exec_schedule@implicit-read-write@rcs0.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-kbl7/igt@i915_suspend@debugfs-reader.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-kbl6/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@bad-pitch-32:
    - shard-hsw:          [TIMEOUT][49] ([i915#1958]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-hsw2/igt@kms_addfb_basic@bad-pitch-32.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-hsw6/igt@kms_addfb_basic@bad-pitch-32.html
    - shard-snb:          [TIMEOUT][51] ([i915#1958]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-snb4/igt@kms_addfb_basic@bad-pitch-32.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-snb6/igt@kms_addfb_basic@bad-pitch-32.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][53] ([i915#1982]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-apl4/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-apl2/igt@kms_big_fb@linear-8bpp-rotate-180.html
    - shard-kbl:          [DMESG-WARN][55] ([i915#1982]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-kbl1/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-kbl1/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][57] ([i915#118] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-glk5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [DMESG-FAIL][59] ([i915#54] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding:
    - shard-tglb:         [DMESG-WARN][61] ([i915#402]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - shard-apl:          [DMESG-WARN][63] ([i915#95]) -> [PASS][64] +35 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-apl6/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-apl1/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [DMESG-FAIL][67] ([i915#95]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][69] ([i915#433]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [INCOMPLETE][71] ([i915#155]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-apl:          [DMESG-FAIL][73] ([i915#95]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [SKIP][75] ([i915#1911]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-tglb2/igt@kms_psr2_su@frontbuffer.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-tglb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][79] ([i915#1958]) -> [FAIL][80] ([i915#1930])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][81] ([i915#588]) -> [SKIP][82] ([i915#658])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [FAIL][83] ([i915#1515]) -> [WARN][84] ([i915#1515])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_busy@basic-flip-pipe-d:
    - shard-hsw:          [TIMEOUT][85] ([i915#1958]) -> [SKIP][86] ([fdo#109271]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-hsw2/igt@kms_busy@basic-flip-pipe-d.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-hsw1/igt@kms_busy@basic-flip-pipe-d.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][87] ([i915#1319] / [i915#1635]) -> [FAIL][88] ([fdo#110321] / [fdo#110336])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-apl3/igt@kms_content_protection@atomic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-apl2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][89] ([i915#1319]) -> [FAIL][90] ([fdo#110321])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-apl4/igt@kms_content_protection@lic.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-apl4/igt@kms_content_protection@lic.html
    - shard-kbl:          [TIMEOUT][91] ([i915#1319]) -> [TIMEOUT][92] ([i915#1319] / [i915#1958])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-kbl4/igt@kms_content_protection@lic.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-kbl4/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          [DMESG-FAIL][93] ([fdo#110321] / [i915#95]) -> [TIMEOUT][94] ([i915#1319])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-kbl2/igt@kms_content_protection@srm.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-kbl6/igt@kms_content_protection@srm.html
    - shard-apl:          [DMESG-FAIL][95] ([fdo#110321] / [i915#95]) -> [FAIL][96] ([fdo#110321])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-apl6/igt@kms_content_protection@srm.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-apl2/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][97] ([i915#357]) -> [DMESG-FAIL][98] ([i915#357] / [i915#95])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-kbl2/igt@kms_content_protection@uevent.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-kbl2/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][99] ([i915#357]) -> [DMESG-FAIL][100] ([i915#357] / [i915#95])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-apl8/igt@kms_content_protection@uevent.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-apl4/igt@kms_content_protection@uevent.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][101] ([fdo#109349]) -> [DMESG-WARN][102] ([i915#1226])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_flip_tiling@flip-y-tiled:
    - shard-hsw:          [SKIP][103] ([fdo#109271]) -> [TIMEOUT][104] ([i915#1958]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-hsw1/igt@kms_flip_tiling@flip-y-tiled.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-hsw2/igt@kms_flip_tiling@flip-y-tiled.html

  * igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:
    - shard-snb:          [TIMEOUT][105] ([i915#1958]) -> [SKIP][106] ([fdo#109271]) +3 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8610/shard-snb4/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/shard-snb2/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5702 -> IGTPW_4661
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8610: 5a778c71b283ff1a2af242f02e602c11b9490e3a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4661: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/index.html
  IGT_5702: d16ad07e7f2a028e14d61f570931c87fa5ce404c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4661/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
