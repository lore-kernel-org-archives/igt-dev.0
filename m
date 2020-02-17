Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 17 Feb 2020 13:23:40 -0000
Message-ID: <158194582024.16572.17648104513088051672@emeril.freedesktop.org>
References: <20200213194152.63495-1-dale.b.stimson@intel.com>
In-Reply-To: <20200213194152.63495-1-dale.b.stimson@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbW1pb19i?=
 =?utf-8?q?ase_via_debugfs_infrastructure_+_gem=5Fctx=5Fisolation?=
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

Series: mmio_base via debugfs infrastructure + gem_ctx_isolation
URL   : https://patchwork.freedesktop.org/series/73426/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7934_full -> IGTPW_4150_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4150_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4150_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4150_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-glk:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-glk8/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-glk4/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_ctx_persistence@close-replace-race}:
    - shard-tglb:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb2/igt@gem_ctx_persistence@close-replace-race.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-tglb1/igt@gem_ctx_persistence@close-replace-race.html

  
Known issues
------------

  Here are the changes found in IGTPW_4150_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112080]) +11 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb1/igt@gem_busy@busy-vcs1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-iclb5/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +20 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb2/igt@gem_exec_schedule@out-order-bsd2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-iclb8/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#677])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-kbl1/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-tglb:         [PASS][17] -> [FAIL][18] ([i915#1172])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb8/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-tglb7/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen:
    - shard-tglb:         [PASS][19] -> [FAIL][20] ([fdo#111703])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
    - shard-tglb:         [PASS][21] -> [DMESG-FAIL][22] ([i915#402])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb7/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-tglb1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#559])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#49])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-tglb:         [PASS][29] -> [SKIP][30] ([i915#668]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#899]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-iclb6/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-tglb:         [PASS][35] -> [DMESG-WARN][36] ([i915#402])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb1/igt@kms_rotation_crc@bad-tiling.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-tglb8/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-tglb:         [PASS][37] -> [FAIL][38] ([i915#65])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb1/igt@kms_rotation_crc@sprite-rotation-90.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-tglb1/igt@kms_rotation_crc@sprite-rotation-90.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-tglb:         [FAIL][39] ([IGT#28]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb7/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-tglb8/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * {igt@gem_ctx_persistence@close-replace-race}:
    - shard-apl:          [FAIL][41] -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-apl6/igt@gem_ctx_persistence@close-replace-race.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-apl1/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-shared-gtt-default:
    - shard-tglb:         [FAIL][43] ([i915#616]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb1/igt@gem_ctx_shared@exec-shared-gtt-default.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-tglb1/igt@gem_ctx_shared@exec-shared-gtt-default.html

  * igt@gem_ctx_shared@exec-shared-gtt-render:
    - shard-tglb:         [FAIL][45] ([i915#607] / [i915#616]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb6/igt@gem_ctx_shared@exec-shared-gtt-render.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-tglb5/igt@gem_ctx_shared@exec-shared-gtt-render.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][47] ([fdo#110841]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-iclb7/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][49] ([fdo#112146]) -> [PASS][50] +9 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-iclb8/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][51] ([i915#644]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][53] ([i915#413]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb7/igt@i915_pm_rps@reset.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-iclb5/igt@i915_pm_rps@reset.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-tglb:         [FAIL][55] ([i915#1172]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb7/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-tglb3/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-iclb:         [SKIP][57] ([i915#1140]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-iclb1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding:
    - shard-tglb:         [FAIL][59] ([fdo#111703]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-apl:          [FAIL][61] ([i915#54]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
    - shard-kbl:          [FAIL][63] ([i915#54]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][67] ([i915#72]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled:
    - shard-tglb:         [FAIL][69] ([i915#559]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          [FAIL][71] ([i915#49]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-glk:          [FAIL][73] ([i915#49]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-apl:          [FAIL][75] ([i915#49]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglb:         [SKIP][77] ([i915#668]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][81] ([fdo#109642] / [fdo#111068]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb4/igt@kms_psr2_su@frontbuffer.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][83] ([fdo#109441]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-tglb:         [FAIL][85] ([i915#65]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-tglb2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][87] ([fdo#112080]) -> [PASS][88] +11 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb7/igt@perf_pmu@init-busy-vcs1.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-iclb4/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][89] ([fdo#109276]) -> [PASS][90] +12 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-iclb7/igt@prime_busy@hang-bsd2.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-iclb1/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][91] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][92] ([fdo#111870] / [i915#478])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][93] ([i915#468]) -> [FAIL][94] ([i915#454])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-snb:          [INCOMPLETE][95] ([i915#82]) -> [SKIP][96] ([fdo#109271])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/shard-snb6/igt@i915_pm_dc@dc6-psr.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/shard-snb5/igt@i915_pm_dc@dc6-psr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
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
  [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#607]: https://gitlab.freedesktop.org/drm/intel/issues/607
  [i915#616]: https://gitlab.freedesktop.org/drm/intel/issues/616
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5440 -> IGTPW_4150
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7934: 16668f8cd3512f56f626acaed0dd9245692ea3dc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4150: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/index.html
  IGT_5440: 860924b6ccbed75b66ab4b65897bb9abc91763ea @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4150/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
