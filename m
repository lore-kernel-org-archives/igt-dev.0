Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 16 Feb 2020 20:32:28 -0000
Message-ID: <158188514822.23351.11411103898695387782@emeril.freedesktop.org>
References: <20200213045004.28209-1-sravan.kumar.nedunoori@intel.com>
In-Reply-To: <20200213045004.28209-1-sravan.kumar.nedunoori@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fwrite=5Fread=5Fring=5Fswitch_Removal_of_IGT_Test?=
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
To: "Nedunoori, Sravan Kumar" <sravan.kumar.nedunoori@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_write_read_ring_switch Removal of IGT Test
URL   : https://patchwork.freedesktop.org/series/73391/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7926_full -> IGTPW_4142_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/index.html

Known issues
------------

  Here are the changes found in IGTPW_4142_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +11 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112146]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-iclb3/igt@gem_exec_schedule@in-order-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-iclb7/igt@gem_exec_schedule@pi-common-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +12 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-iclb1/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-iclb3/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-hsw:          [PASS][9] -> [FAIL][10] ([i915#694])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#644])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-tglb:         [PASS][13] -> [FAIL][14] ([i915#1172])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-tglb5/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-tglb3/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([fdo#111703])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
    - shard-tglb:         [PASS][17] -> [DMESG-FAIL][18] ([i915#402]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-tglb3/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-tglb5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled:
    - shard-snb:          [PASS][19] -> [DMESG-WARN][20] ([i915#478])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-snb4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-snb6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#559])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html

  * igt@kms_mmap_write_crc@main:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#1180])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-tglb8/igt@kms_mmap_write_crc@main.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-tglb8/igt@kms_mmap_write_crc@main.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +5 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#899])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109642] / [fdo#111068])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-iclb4/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-tglb:         [PASS][35] -> [FAIL][36] ([i915#65])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-tglb8/igt@kms_rotation_crc@sprite-rotation-270.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-tglb6/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [PASS][37] -> [INCOMPLETE][38] ([i915#1176] / [i915#61])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-hsw7/igt@perf_pmu@cpu-hotplug.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-hsw5/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_busy@wait-hang-vebox:
    - shard-hsw:          [PASS][39] -> [INCOMPLETE][40] ([i915#61])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-hsw1/igt@prime_busy@wait-hang-vebox.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-hsw5/igt@prime_busy@wait-hang-vebox.html

  * igt@prime_vgem@sync-bsd:
    - shard-apl:          [PASS][41] -> [INCOMPLETE][42] ([fdo#103927] / [i915#409])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-apl3/igt@prime_vgem@sync-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-apl1/igt@prime_vgem@sync-bsd.html

  
#### Possible fixes ####

  * igt@gem_caching@reads:
    - shard-hsw:          [FAIL][43] ([i915#694]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-hsw6/igt@gem_caching@reads.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-hsw1/igt@gem_caching@reads.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][45] ([fdo#110854]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-iclb3/igt@gem_exec_balancer@smoke.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][47] ([fdo#112146]) -> [PASS][48] +5 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][49] ([i915#644]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][51] ([fdo#111870] / [i915#478]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-snb5/igt@gem_userptr_blits@sync-unmap.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-snb6/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][53] ([i915#454]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [INCOMPLETE][55] ([fdo#103665] / [fdo#112219]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-kbl4/igt@i915_suspend@forcewake.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-kbl7/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-tglb:         [FAIL][57] ([fdo#111703]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge:
    - shard-tglb:         [FAIL][61] ([i915#70]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-tglb1/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-tglb5/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:
    - shard-tglb:         [DMESG-FAIL][63] ([i915#402]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-tglb2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-tglb3/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:
    - shard-tglb:         [FAIL][65] ([i915#559]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled:
    - shard-glk:          [FAIL][67] ([i915#52] / [i915#54]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-glk7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-glk2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-apl:          [FAIL][69] ([i915#49]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
    - shard-kbl:          [FAIL][71] ([i915#49]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-tglb:         [FAIL][75] ([i915#1139]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-tglb7/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-tglb1/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][79] ([fdo#112080]) -> [PASS][80] +13 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-iclb8/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][81] ([fdo#109276]) -> [PASS][82] +25 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-iclb7/igt@prime_busy@hang-bsd2.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-iclb4/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][83] ([fdo#112080]) -> [FAIL][84] ([IGT#28])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][85] ([i915#818]) -> [FAIL][86] ([i915#694])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-hsw2/igt@gem_tiled_blits@interruptible.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-hsw5/igt@gem_tiled_blits@interruptible.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][87] ([i915#974]) -> ([FAIL][88], [FAIL][89]) ([i915#1176] / [i915#974])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/shard-hsw2/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-hsw6/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/shard-hsw5/igt@runner@aborted.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112219]: https://bugs.freedesktop.org/show_bug.cgi?id=112219
  [i915#1139]: https://gitlab.freedesktop.org/drm/intel/issues/1139
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#1176]: https://gitlab.freedesktop.org/drm/intel/issues/1176
  [i915#1180]: https://gitlab.freedesktop.org/drm/intel/issues/1180
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#974]: https://gitlab.freedesktop.org/drm/intel/issues/974


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5437 -> IGTPW_4142
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7926: 6b2fe829d300abf285e9db8b252ffacd216df3ed @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4142: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/index.html
  IGT_5437: ae42fedfd0c536c560e8e17b06d9c7b94a4e8f0c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
