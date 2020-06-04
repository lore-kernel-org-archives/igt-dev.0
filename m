Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 04 Jun 2020 06:28:39 -0000
Message-ID: <159125211944.14554.4670496591567546123@emeril.freedesktop.org>
References: <20200603183417.14626-1-imre.deak@intel.com>
In-Reply-To: <20200603183417.14626-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fchamelium=3A_Force_reprobe_after_replugging_the_connector?=
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_chamelium: Force reprobe after replugging the connector
URL   : https://patchwork.freedesktop.org/series/77965/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8579_full -> IGTPW_4646_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/index.html

Known issues
------------

  Here are the changes found in IGTPW_4646_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-tglb:         [PASS][1] -> [DMESG-WARN][2] ([i915#402])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb7/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-tglb3/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#1982]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][5] -> [DMESG-FAIL][6] ([i915#118] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [PASS][7] -> [DMESG-FAIL][8] ([i915#54] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-rapid-movement:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#93] / [i915#95]) +37 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-rapid-movement.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-rapid-movement.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#54])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen.html
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#54])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#95]) +29 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl3/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-apl4/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-glk:          [PASS][17] -> [DMESG-FAIL][18] ([i915#1925] / [i915#1926])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk9/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-glk8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled:
    - shard-glk:          [PASS][19] -> [TIMEOUT][20] ([i915#1958]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-glk1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-tglb:         [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#83])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb4/igt@kms_panel_fitting@atomic-fastset.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-iclb3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [PASS][27] -> [DMESG-FAIL][28] ([i915#95]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [PASS][29] -> [DMESG-FAIL][30] ([i915#95]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#31])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@kms_setmode@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-apl6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +4 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][37] -> [INCOMPLETE][38] ([i915#155])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@vcs0}:
    - shard-kbl:          [INCOMPLETE][39] -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * {igt@gem_exec_fence@syncobj-channel}:
    - shard-hsw:          [DMESG-WARN][41] ([i915#1927]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-hsw4/igt@gem_exec_fence@syncobj-channel.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-hsw4/igt@gem_exec_fence@syncobj-channel.html

  * {igt@gem_exec_reloc@basic-concurrent0}:
    - shard-glk:          [FAIL][43] ([i915#1930]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk4/igt@gem_exec_reloc@basic-concurrent0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-glk7/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [DMESG-WARN][45] ([i915#118] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk7/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@gem_workarounds@suspend-resume-context.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-apl2/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [TIMEOUT][49] ([i915#1635]) -> [PASS][50] +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl4/igt@i915_suspend@sysfs-reader.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-apl6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][51] ([i915#1982]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl2/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-apl6/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-tglb:         [DMESG-WARN][53] ([i915#402]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [DMESG-FAIL][55] ([i915#54] / [i915#95]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:
    - shard-apl:          [DMESG-WARN][57] ([i915#95]) -> [PASS][58] +29 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl1/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-apl3/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][59] ([i915#72]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@pipe-a-torture-move:
    - shard-hsw:          [INCOMPLETE][61] ([i915#61]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-hsw4/igt@kms_cursor_legacy@pipe-a-torture-move.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-hsw1/igt@kms_cursor_legacy@pipe-a-torture-move.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-apl:          [DMESG-FAIL][63] ([i915#54] / [i915#95]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * {igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][65] ([i915#1982]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-kbl4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         [DMESG-WARN][67] ([i915#1982]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          [FAIL][69] ([i915#49]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-glk:          [FAIL][71] ([i915#49]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-apl:          [DMESG-FAIL][73] ([i915#49] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [DMESG-WARN][75] ([i915#1982]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-hang:
    - shard-glk:          [INCOMPLETE][81] ([i915#1927] / [i915#58] / [k.org#198133]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk9/igt@kms_vblank@pipe-c-ts-continuation-modeset-hang.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-glk4/igt@kms_vblank@pipe-c-ts-continuation-modeset-hang.html

  * {igt@perf@blocking-parameterized}:
    - shard-tglb:         [FAIL][83] ([i915#1542]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb7/igt@perf@blocking-parameterized.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-tglb2/igt@perf@blocking-parameterized.html

  * igt@perf_pmu@rc6-runtime-pm:
    - shard-glk:          [TIMEOUT][85] ([i915#1958]) -> [PASS][86] +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk5/igt@perf_pmu@rc6-runtime-pm.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-glk5/igt@perf_pmu@rc6-runtime-pm.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-kbl:          [DMESG-WARN][87] ([i915#93] / [i915#95]) -> [PASS][88] +43 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl1/igt@syncobj_wait@invalid-wait-zero-handles.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-kbl6/igt@syncobj_wait@invalid-wait-zero-handles.html

  
#### Warnings ####

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-glk:          [SKIP][89] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][90] ([i915#1366] / [i915#1958])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk4/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-glk1/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][91] ([i915#1319]) -> [TIMEOUT][92] ([i915#1319] / [i915#1635])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl1/igt@kms_content_protection@atomic-dpms.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-apl1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][93] ([i915#1319] / [i915#1635]) -> [FAIL][94] ([fdo#110321])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@kms_content_protection@lic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-apl6/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [DMESG-FAIL][95] ([i915#357] / [i915#95]) -> [FAIL][96] ([i915#357])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl2/igt@kms_content_protection@uevent.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-kbl6/igt@kms_content_protection@uevent.html
    - shard-apl:          [DMESG-FAIL][97] ([i915#357] / [i915#95]) -> [FAIL][98] ([i915#357])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl1/igt@kms_content_protection@uevent.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-apl1/igt@kms_content_protection@uevent.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][99] ([i915#93] / [i915#95]) -> [DMESG-WARN][100] ([i915#180] / [i915#93] / [i915#95])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-glk:          [SKIP][101] ([fdo#109271]) -> [TIMEOUT][102] ([i915#1958]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-glk1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][103] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][104] ([fdo#108145] / [i915#95])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][105] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][106] ([fdo#108145] / [i915#95])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_vblank@pipe-d-query-idle-hang:
    - shard-apl:          [TIMEOUT][107] ([i915#1635] / [i915#1640]) -> [SKIP][108] ([fdo#109271])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl4/igt@kms_vblank@pipe-d-query-idle-hang.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-apl4/igt@kms_vblank@pipe-d-query-idle-hang.html
    - shard-glk:          [TIMEOUT][109] ([i915#1640] / [i915#1958]) -> [SKIP][110] ([fdo#109271])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk5/igt@kms_vblank@pipe-d-query-idle-hang.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/shard-glk9/igt@kms_vblank@pipe-d-query-idle-hang.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1366]: https://gitlab.freedesktop.org/drm/intel/issues/1366
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1640]: https://gitlab.freedesktop.org/drm/intel/issues/1640
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5694 -> IGTPW_4646
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8579: 289eb12c88c49a4ac8d325dc457d8878c7f5bdc0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4646: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/index.html
  IGT_5694: a9b6c4c74bfddf7d3d2da3be08804fe315945cea @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4646/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
