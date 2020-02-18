Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 18 Feb 2020 01:16:28 -0000
Message-ID: <158198858800.31433.9413106065108687984@emeril.freedesktop.org>
References: <20200214194016.4054376-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200214194016.4054376-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/4=5D_i915/gem=5Fctx=5Fengines=3A_Ex?=
 =?utf-8?q?ercise_0_engines=5B=5D?=
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

Series: series starting with [i-g-t,1/4] i915/gem_ctx_engines: Exercise 0 engines[]
URL   : https://patchwork.freedesktop.org/series/73485/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7942_full -> IGTPW_4157_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/index.html

Known issues
------------

  Here are the changes found in IGTPW_4157_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@close-race:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2] ([i915#977])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-tglb7/igt@gem_busy@close-race.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-tglb2/igt@gem_busy@close-race.html

  * igt@gem_ctx_isolation@vcs1-s3:
    - shard-kbl:          [PASS][3] -> [INCOMPLETE][4] ([fdo#103665])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-kbl1/igt@gem_ctx_isolation@vcs1-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-kbl3/igt@gem_ctx_isolation@vcs1-s3.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [PASS][5] -> [TIMEOUT][6] ([fdo#112271])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-iclb4/igt@gem_exec_balancer@hang.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-iclb4/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#677])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd2:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +15 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd2.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +7 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#694]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-hsw1/igt@gem_partial_pwrite_pread@reads-uncached.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-hsw4/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([fdo#111870] / [i915#478])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-snb1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#62] / [i915#92]) +11 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-kbl6/igt@i915_pm_rpm@gem-idle.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-kbl3/igt@i915_pm_rpm@gem-idle.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-tglb:         [PASS][19] -> [FAIL][20] ([i915#1172])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-tglb7/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-tglb5/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([i915#1140])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-iclb5/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-iclb1/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_color@pipe-a-ctm-green-to-red:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#129])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-apl1/igt@kms_color@pipe-a-ctm-green-to-red.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-apl3/igt@kms_color@pipe-a-ctm-green-to-red.html

  * igt@kms_color@pipe-b-degamma:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#71])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-kbl7/igt@kms_color@pipe-b-degamma.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-kbl1/igt@kms_color@pipe-b-degamma.html
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#71])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-apl8/igt@kms_color@pipe-b-degamma.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-apl2/igt@kms_color@pipe-b-degamma.html
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#71])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-glk6/igt@kms_color@pipe-b-degamma.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-glk2/igt@kms_color@pipe-b-degamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([fdo#111703])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#56] / [i915#62] / [i915#92]) +5 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-kbl2/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-kbl3/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled:
    - shard-tglb:         [PASS][39] -> [FAIL][40] ([i915#559]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#79])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][43] -> [DMESG-WARN][44] ([i915#62] / [i915#74] / [i915#92])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-tglb:         [PASS][45] -> [FAIL][46] ([i915#1139])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-tglb7/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-tglb5/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_plane_multiple@atomic-pipe-a-tiling-x:
    - shard-tglb:         [PASS][47] -> [FAIL][48] ([i915#778])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-tglb8/igt@kms_plane_multiple@atomic-pipe-a-tiling-x.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-tglb8/igt@kms_plane_multiple@atomic-pipe-a-tiling-x.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-tglb:         [PASS][49] -> [FAIL][50] ([i915#65])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-tglb6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-tglb5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#112080]) +8 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-iclb2/igt@perf_pmu@busy-vcs1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-iclb3/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][53] ([fdo#110841]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][55] ([fdo#110854]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-iclb8/igt@gem_exec_balancer@smoke.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][57] ([fdo#112080]) -> [PASS][58] +13 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-iclb5/igt@gem_exec_parallel@vcs1-fds.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][59] ([i915#677]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][61] ([fdo#109276]) -> [PASS][62] +14 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-iclb7/igt@gem_exec_schedule@promotion-bsd1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][63] ([fdo#112146]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-iclb8/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-hsw:          [FAIL][65] ([i915#694]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-hsw4/igt@gem_partial_pwrite_pread@write-display.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-hsw7/igt@gem_partial_pwrite_pread@write-display.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][67] ([i915#413]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-iclb7/igt@i915_pm_rps@waitboost.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-iclb5/igt@i915_pm_rps@waitboost.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-glk:          [FAIL][69] -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-glk1/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-glk5/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * {igt@kms_busy@basic@flip}:
    - shard-tglb:         [DMESG-WARN][71] ([i915#402]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-tglb2/igt@kms_busy@basic@flip.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-tglb8/igt@kms_busy@basic@flip.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:
    - shard-tglb:         [FAIL][73] ([i915#70]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-tglb6/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-tglb1/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled:
    - shard-tglb:         [FAIL][75] ([i915#559]) -> [PASS][76] +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-tglb2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-tglb3/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-snb:          [DMESG-WARN][77] ([i915#478]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +5 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][81] ([i915#899]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][83] ([fdo#109642] / [fdo#111068]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-iclb4/igt@kms_psr2_su@frontbuffer.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [SKIP][85] ([fdo#109441]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-iclb5/igt@kms_psr@psr2_sprite_render.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-iclb2/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][87] ([i915#31]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-kbl4/igt@kms_setmode@basic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-kbl7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][89] ([i915#180]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-apl8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-apl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][91] ([fdo#112271] / [i915#1085]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-tglb5/igt@perf@gen12-mi-rpc.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-tglb1/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [INCOMPLETE][93] ([i915#1176] / [i915#61]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-hsw5/igt@perf_pmu@cpu-hotplug.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-hsw8/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][95] ([i915#831]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-hsw7/igt@prime_mmap_coherency@ioctl-errors.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][97] ([i915#818]) -> [FAIL][98] ([i915#694])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-hsw6/igt@gem_tiled_blits@interruptible.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-hsw2/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][99] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][100] ([fdo#111870] / [i915#478]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-snb:          [INCOMPLETE][101] ([i915#82]) -> [SKIP][102] ([fdo#109271])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-snb5/igt@i915_pm_rpm@gem-evict-pwrite.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-snb6/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-kbl:          [FAIL][103] ([fdo#108145]) -> [DMESG-FAIL][104] ([fdo#108145] / [i915#56] / [i915#62])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][105], [FAIL][106]) ([i915#1176] / [i915#974]) -> [FAIL][107] ([i915#974])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-hsw5/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-hsw6/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-hsw2/igt@runner@aborted.html
    - shard-snb:          ([FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116]) ([fdo#111870] / [i915#1077] / [i915#698] / [i915#974]) -> ([FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126]) ([fdo#111870] / [i915#1077] / [i915#974])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-snb2/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-snb6/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-snb4/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-snb4/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-snb2/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-snb6/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-snb7/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-snb7/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7942/shard-snb4/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-snb7/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-snb2/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-snb4/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-snb5/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-snb5/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-snb5/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-snb4/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-snb1/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-snb6/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/shard-snb6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1139]: https://gitlab.freedesktop.org/drm/intel/issues/1139
  [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#1176]: https://gitlab.freedesktop.org/drm/intel/issues/1176
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#74]: https://gitlab.freedesktop.org/drm/intel/issues/74
  [i915#778]: https://gitlab.freedesktop.org/drm/intel/issues/778
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#974]: https://gitlab.freedesktop.org/drm/intel/issues/974
  [i915#977]: https://gitlab.freedesktop.org/drm/intel/issues/977


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5442 -> IGTPW_4157
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7942: f4805f5a516d0a107438ff0f236c9f4187434819 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4157: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/index.html
  IGT_5442: 3f6080996885b997685f08ecb8b416b2dc485290 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4157/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
