Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 15 Feb 2020 17:55:02 -0000
Message-ID: <158178930281.4011.6179401694862618851@emeril.freedesktop.org>
References: <20200211023108.25369-1-imre.deak@intel.com>
In-Reply-To: <20200211023108.25369-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bv2=2C1/8=5D_lib/igt=5Fdraw=3A_Refactor_get=5F?=
 =?utf-8?q?tiling_calls_=28rev4=29?=
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

Series: series starting with [v2,1/8] lib/igt_draw: Refactor get_tiling calls (rev4)
URL   : https://patchwork.freedesktop.org/series/73268/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7925_full -> IGTPW_4139_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/index.html

New tests
---------

  New tests have been introduced between CI_DRM_7925_full and IGTPW_4139_full:

### New IGT tests (3) ###

  * igt@kms_content_protection@atomic-dpms:
    - Statuses : 2 fail(s) 5 skip(s)
    - Exec time: [0.0, 126.73] s

  * igt@kms_psr2_su@frontbuffer:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.48] s

  * igt@kms_psr2_su@page_flip:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.29] s

  

Known issues
------------

  Here are the changes found in IGTPW_4139_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +13 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-iclb1/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112146]) +7 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-iclb7/igt@gem_exec_schedule@in-order-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-iclb4/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-hsw:          [PASS][5] -> [FAIL][6] ([i915#694])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-hsw1/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][7] -> [FAIL][8] ([i915#644])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-apl8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-apl3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][9] -> [FAIL][10] ([i915#447])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-iclb8/igt@i915_pm_dc@dc5-dpms.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-kbl:          [PASS][11] -> [INCOMPLETE][12] ([fdo#103665] / [i915#151])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-kbl4/igt@i915_pm_rpm@system-suspend-modeset.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-kbl2/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#413])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-iclb1/igt@i915_pm_rps@reset.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-iclb6/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live_gtt:
    - shard-kbl:          [PASS][15] -> [TIMEOUT][16] ([fdo#112271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-kbl7/igt@i915_selftest@live_gtt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-kbl1/igt@i915_selftest@live_gtt.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][17] -> [INCOMPLETE][18] ([fdo#103665])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-kbl3/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-tglb:         [PASS][19] -> [FAIL][20] ([i915#1172])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-tglb6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-tglb8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([i915#1140])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-iclb4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-iclb2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#70])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-tglb2/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-tglb8/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled:
    - shard-tglb:         [PASS][25] -> [DMESG-FAIL][26] ([i915#402])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#79])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-kbl2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-kbl1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +5 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#1184])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-tglb7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-tglb5/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-tglb:         [PASS][35] -> [FAIL][36] ([i915#1139])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-tglb8/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-tglb1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-iclb8/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-tglb:         [PASS][39] -> [DMESG-FAIL][40] ([i915#402] / [i915#65])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-tglb7/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-tglb8/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109276]) +14 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-iclb2/igt@prime_busy@hang-bsd2.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-iclb6/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][43] ([fdo#112080]) -> [PASS][44] +6 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-iclb7/igt@gem_exec_parallel@vcs1-fds.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][45] ([i915#677]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][47] ([fdo#109276]) -> [PASS][48] +18 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-iclb6/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-iclb2/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][49] ([fdo#112146]) -> [PASS][50] +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-iclb3/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-hsw:          [FAIL][51] ([i915#694]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-hsw1/igt@gem_partial_pwrite_pread@reads.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-hsw6/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][53] ([fdo#111870] / [i915#478]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][55] ([i915#454]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][57] ([i915#413]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-iclb8/igt@i915_pm_rps@waitboost.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-iclb8/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live_gtt:
    - shard-hsw:          [TIMEOUT][59] ([fdo#112271]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-hsw5/igt@i915_selftest@live_gtt.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-hsw5/igt@i915_selftest@live_gtt.html

  * igt@i915_suspend@debugfs-reader:
    - shard-iclb:         [INCOMPLETE][61] -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-iclb3/igt@i915_suspend@debugfs-reader.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-iclb3/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-tglb:         [FAIL][63] ([fdo#111703]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge:
    - shard-tglb:         [FAIL][69] ([i915#70]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-tglb7/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-tglb2/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:
    - shard-tglb:         [DMESG-FAIL][71] ([i915#402]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-tglb5/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-tglb2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:
    - shard-tglb:         [FAIL][73] ([i915#559]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][75] ([i915#79]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-hsw:          [INCOMPLETE][77] ([i915#61]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-hsw5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-apl:          [FAIL][79] ([i915#49]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
    - shard-kbl:          [FAIL][81] ([i915#49]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-tglb:         [FAIL][83] ([i915#1139]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-tglb3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-tglb6/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_psr2_su@frontbuffer (NEW):
    - shard-iclb:         [SKIP][85] ([fdo#109642] / [fdo#111068]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-iclb6/igt@kms_psr2_su@frontbuffer.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@primary_mmap_cpu:
    - shard-tglb:         [SKIP][87] ([i915#668]) -> [PASS][88] +3 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-tglb3/igt@kms_psr@primary_mmap_cpu.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-tglb2/igt@kms_psr@primary_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][91] ([i915#31]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-apl2/igt@kms_setmode@basic.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-apl7/igt@kms_setmode@basic.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][93] ([fdo#112271] / [i915#1085]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-tglb7/igt@perf@gen12-mi-rpc.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-tglb8/igt@perf@gen12-mi-rpc.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][95] ([IGT#28]) -> [SKIP][96] ([fdo#112080])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][97] ([fdo#112080]) -> [FAIL][98] ([IGT#28])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][99] ([i915#694]) -> [FAIL][100] ([i915#818])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-hsw7/igt@gem_tiled_blits@interruptible.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-hsw5/igt@gem_tiled_blits@interruptible.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][101] ([i915#818]) -> [INCOMPLETE][102] ([i915#61])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-hsw7/igt@gem_tiled_blits@normal.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-hsw1/igt@gem_tiled_blits@normal.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-snb:          [SKIP][103] ([fdo#109271]) -> [INCOMPLETE][104] ([i915#82])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7925/shard-snb5/igt@i915_pm_rpm@system-suspend.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/shard-snb2/igt@i915_pm_rpm@system-suspend.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1139]: https://gitlab.freedesktop.org/drm/intel/issues/1139
  [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#1184]: https://gitlab.freedesktop.org/drm/intel/issues/1184
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5437 -> IGTPW_4139
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7925: b266b79c3de9874e0f991b6a9cc284a424094649 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4139: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/index.html
  IGT_5437: ae42fedfd0c536c560e8e17b06d9c7b94a4e8f0c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4139/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
