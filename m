Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 17 Feb 2020 13:14:23 -0000
Message-ID: <158194526324.16569.2628927305266563466@emeril.freedesktop.org>
References: <20200213192606.63025-1-dale.b.stimson@intel.com>
In-Reply-To: <20200213192606.63025-1-dale.b.stimson@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2k5?=
 =?utf-8?q?15/gem=5Fengine=5Ftopology=2Ec_-_intel=5Fget=5Fcurrent=5Fengine?=
 =?utf-8?q?_invalid_result?=
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
To: Dale B Stimson <dale.b.stimson@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/i915/gem_engine_topology.c - intel_get_current_engine invalid result
URL   : https://patchwork.freedesktop.org/series/73424/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7934_full -> IGTPW_4149_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4149_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_ctx_persistence@close-replace-race}:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb2/igt@gem_ctx_persistence@close-replace-race.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-tglb1/igt@gem_ctx_persistence@close-replace-race.html

  
Known issues
------------

  Here are the changes found in IGTPW_4149_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +12 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb1/igt@gem_busy@busy-vcs1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-iclb8/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276]) +13 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb2/igt@gem_exec_schedule@out-order-bsd2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-iclb6/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-kbl1/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_mmap_gtt@basic-write-gtt:
    - shard-snb:          [PASS][11] -> [DMESG-WARN][12] ([i915#478]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-snb2/igt@gem_mmap_gtt@basic-write-gtt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-snb4/igt@gem_mmap_gtt@basic-write-gtt.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#644])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-apl8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([fdo#111703])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:
    - shard-tglb:         [PASS][19] -> [FAIL][20] ([i915#1183])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb5/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-tglb7/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html

  * igt@kms_plane@plane-panning-top-left-pipe-a-planes:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#1171]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb2/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-tglb3/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#1139])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb8/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-tglb5/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-iclb5/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#56])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@exec-shared-gtt-default:
    - shard-tglb:         [FAIL][29] ([i915#616]) -> [PASS][30] +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb1/igt@gem_ctx_shared@exec-shared-gtt-default.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-tglb7/igt@gem_ctx_shared@exec-shared-gtt-default.html

  * igt@gem_ctx_shared@exec-shared-gtt-render:
    - shard-tglb:         [FAIL][31] ([i915#607] / [i915#616]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb6/igt@gem_ctx_shared@exec-shared-gtt-render.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-tglb2/igt@gem_ctx_shared@exec-shared-gtt-render.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [DMESG-WARN][33] ([i915#180]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-kbl4/igt@gem_eio@in-flight-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-kbl3/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][35] ([fdo#112146]) -> [PASS][36] +10 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-iclb7/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][37] ([i915#677]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-iclb7/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][39] ([i915#644]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][41] ([fdo#111870] / [i915#478]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][43] ([i915#413]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb7/igt@i915_pm_rps@reset.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-iclb3/igt@i915_pm_rps@reset.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-tglb:         [FAIL][45] ([i915#1172]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb7/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-tglb5/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-iclb:         [SKIP][47] ([i915#1140]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-iclb6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding:
    - shard-tglb:         [FAIL][49] ([fdo#111703]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-apl:          [FAIL][51] ([i915#54]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
    - shard-kbl:          [FAIL][53] ([i915#54]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][55] ([i915#72]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled:
    - shard-tglb:         [FAIL][57] ([i915#559]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          [FAIL][59] ([i915#49]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-glk:          [FAIL][61] ([i915#49]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-apl:          [FAIL][63] ([i915#49]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglb:         [SKIP][65] ([i915#668]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][69] ([fdo#109441]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb3/igt@kms_psr@psr2_primary_mmap_gtt.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-tglb:         [FAIL][71] ([i915#65]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-tglb3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][73] ([i915#31]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-kbl1/igt@kms_setmode@basic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-kbl7/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [SKIP][75] ([fdo#112080]) -> [PASS][76] +10 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb5/igt@perf_pmu@busy-check-all-vcs1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-iclb4/igt@perf_pmu@busy-check-all-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][77] ([fdo#109276]) -> [PASS][78] +8 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb7/igt@prime_busy@hang-bsd2.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][79] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][80] ([fdo#111870] / [i915#478]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][81] ([i915#468]) -> [FAIL][82] ([i915#454])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-snb:          [INCOMPLETE][83] ([i915#82]) -> [SKIP][84] ([fdo#109271])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-snb6/igt@i915_pm_dc@dc6-psr.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/shard-snb6/igt@i915_pm_dc@dc6-psr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1139]: https://gitlab.freedesktop.org/drm/intel/issues/1139
  [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
  [i915#1171]: https://gitlab.freedesktop.org/drm/intel/issues/1171
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#1183]: https://gitlab.freedesktop.org/drm/intel/issues/1183
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#607]: https://gitlab.freedesktop.org/drm/intel/issues/607
  [i915#616]: https://gitlab.freedesktop.org/drm/intel/issues/616
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5440 -> IGTPW_4149
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7934: 16668f8cd3512f56f626acaed0dd9245692ea3dc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4149: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/index.html
  IGT_5440: 860924b6ccbed75b66ab4b65897bb9abc91763ea @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4149/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
