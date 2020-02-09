Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 09 Feb 2020 02:04:46 -0000
Message-ID: <158121388651.18126.765933088411073575@emeril.freedesktop.org>
References: <20200206100639.2386558-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200206100639.2386558-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/i915=3A_for=5Feach=5Fmmap?=
 =?utf-8?b?X29mZnNldF90eXBlKCk=?=
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

Series: series starting with [i-g-t,1/2] lib/i915: for_each_mmap_offset_type()
URL   : https://patchwork.freedesktop.org/series/73088/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7874_full -> IGTPW_4108_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4108_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4108_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4108_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_ctx_sseu@mmap-args} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-tglb2/igt@gem_ctx_sseu@mmap-args.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-tglb:         [PASS][2] -> [FAIL][3] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][4] ([i915#836]) -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-kbl2/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-kbl6/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7874_full and IGTPW_4108_full:

### New IGT tests (5) ###

  * igt@gem_ctx_sseu@mmap-args:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_sseu@mmap-args@gtt:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_sseu@mmap-args@uc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_sseu@mmap-args@wb:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_sseu@mmap-args@wc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4108_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#112080]) +11 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb2/igt@gem_ctx_isolation@vcs1-none.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-iclb6/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#110854])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb2/igt@gem_exec_balancer@smoke.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-iclb3/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#109276]) +17 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb1/igt@gem_exec_schedule@out-order-bsd2.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-iclb6/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#112146]) +4 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#644])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [PASS][16] -> [FAIL][17] ([i915#818])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-hsw6/igt@gem_tiled_blits@interruptible.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-hsw1/igt@gem_tiled_blits@interruptible.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-hsw:          [PASS][18] -> [FAIL][19] ([i915#694])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-hsw8/igt@gen7_exec_parse@basic-allocation.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-hsw8/igt@gen7_exec_parse@basic-allocation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][20] -> [FAIL][21] ([i915#454]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][22] -> [INCOMPLETE][23] ([fdo#103665])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [PASS][24] -> [DMESG-WARN][25] ([i915#180]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-kbl6/igt@i915_suspend@sysfs-reader.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-kbl3/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-random:
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#54])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
    - shard-apl:          [PASS][28] -> [FAIL][29] ([i915#54])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
    - shard-kbl:          [PASS][30] -> [FAIL][31] ([i915#54])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge:
    - shard-tglb:         [PASS][32] -> [FAIL][33] ([i915#70])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb3/igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-tglb5/igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][34] -> [FAIL][35] ([i915#79])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-iclb:         [PASS][36] -> [INCOMPLETE][37] ([i915#123])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb8/igt@kms_frontbuffer_tracking@psr-suspend.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-iclb7/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][38] -> [DMESG-WARN][39] ([i915#180]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][40] -> [FAIL][41] ([i915#899]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][42] -> [SKIP][43] ([fdo#109642] / [fdo#111068])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-iclb5/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#109441]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_rotation_crc@primary-rotation-180:
    - shard-tglb:         [PASS][46] -> [FAIL][47] ([i915#65])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb5/igt@kms_rotation_crc@primary-rotation-180.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-tglb5/igt@kms_rotation_crc@primary-rotation-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-tglb:         [PASS][48] -> [DMESG-FAIL][49] ([i915#402] / [i915#65])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-tglb8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  
#### Possible fixes ####

  * igt@gem_blits@basic:
    - shard-kbl:          [DMESG-WARN][50] ([i915#836]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-kbl2/igt@gem_blits@basic.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-kbl2/igt@gem_blits@basic.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][52] ([i915#677]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][54] ([fdo#112146]) -> [PASS][55] +5 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][56] ([fdo#109276]) -> [PASS][57] +12 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb7/igt@gem_exec_schedule@promotion-bsd1.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-iclb1/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-hsw:          [FAIL][58] ([i915#694]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][60] ([fdo#111870] / [i915#478]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [FAIL][62] ([i915#413]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb3/igt@i915_pm_rps@waitboost.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-tglb1/igt@i915_pm_rps@waitboost.html
    - shard-iclb:         [FAIL][64] ([i915#413]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb7/igt@i915_pm_rps@waitboost.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-iclb5/igt@i915_pm_rps@waitboost.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-tglb:         [FAIL][66] ([i915#1172]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-tglb7/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-iclb:         [SKIP][68] ([i915#1140]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb5/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-iclb8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-apl:          [FAIL][70] ([i915#54]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][72] ([i915#180]) -> [PASS][73] +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-render-xtiled:
    - shard-snb:          [SKIP][74] ([fdo#109271]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-snb4/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled:
    - shard-tglb:         [FAIL][76] ([i915#559]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled:
    - shard-tglb:         [DMESG-FAIL][78] ([i915#402]) -> [PASS][79] +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [FAIL][80] ([i915#79]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-glk6/igt@kms_flip@flip-vs-expired-vblank.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-glk6/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][82] ([i915#180]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][84] ([fdo#109441]) -> [PASS][85] +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb8/igt@kms_psr@psr2_cursor_blt.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_vblank@pipe-c-query-forked-hang:
    - shard-hsw:          [INCOMPLETE][86] ([CI#80] / [i915#61]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-hsw8/igt@kms_vblank@pipe-c-query-forked-hang.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-hsw1/igt@kms_vblank@pipe-c-query-forked-hang.html

  * igt@perf_pmu@busy-start-vcs1:
    - shard-iclb:         [SKIP][88] ([fdo#112080]) -> [PASS][89] +6 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb8/igt@perf_pmu@busy-start-vcs1.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-iclb2/igt@perf_pmu@busy-start-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][90] ([IGT#28]) -> [SKIP][91] ([fdo#112080])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][92] ([i915#468]) -> [FAIL][93] ([i915#454])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@universal-planes-dpms:
    - shard-snb:          [SKIP][94] ([fdo#109271]) -> [INCOMPLETE][95] ([i915#82])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-snb2/igt@i915_pm_rpm@universal-planes-dpms.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/shard-snb6/igt@i915_pm_rpm@universal-planes-dpms.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#836]: https://gitlab.freedesktop.org/drm/intel/issues/836
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5420 -> IGTPW_4108
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7874: 3f234d1ab91ec2321312150116c1285bcb0a260b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4108: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/index.html
  IGT_5420: 497e13d2b4c1053bcd01bd15739fef55e7694a03 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4108/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
