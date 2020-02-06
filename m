Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 06 Feb 2020 16:59:51 -0000
Message-ID: <158100839137.15032.1689768004271740418@emeril.freedesktop.org>
References: <20200204162732.1299743-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200204162732.1299743-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgYmVuY2ht?=
 =?utf-8?q?arks=3A_Drop_gem=5Fmmap?=
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

Series: benchmarks: Drop gem_mmap
URL   : https://patchwork.freedesktop.org/series/72983/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7864_full -> IGTPW_4093_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4093_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4093_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4093_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb5/igt@kms_fbcon_fbt@fbc-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-iclb1/igt@kms_fbcon_fbt@fbc-suspend.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7864_full and IGTPW_4093_full:

### New IGT tests (5) ###

  * igt@gem_ctx_sseu@engines:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@gem_ctx_sseu@ggtt-args:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_sseu@invalid-args:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_sseu@invalid-sseu:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_media_vme:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.05, 0.24] s

  

Known issues
------------

  Here are the changes found in IGTPW_4093_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +9 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-iclb3/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-apl2/igt@gem_ctx_isolation@rcs0-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-apl4/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [PASS][7] -> [TIMEOUT][8] ([fdo#112271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-tglb3/igt@gem_exec_balancer@hang.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-tglb3/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +5 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb3/igt@gem_exec_schedule@in-order-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-iclb4/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +18 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb1/igt@gem_exec_schedule@promotion-bsd1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-iclb7/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#644])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-iclb:         [PASS][15] -> [INCOMPLETE][16] ([fdo#109100])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb2/igt@gem_softpin@noreloc-s3.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-iclb3/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [PASS][17] -> [DMESG-WARN][18] ([fdo#111870] / [i915#478])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#413])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb5/igt@i915_pm_rps@waitboost.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-iclb7/igt@i915_pm_rps@waitboost.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([i915#1140])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-iclb5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#72])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-snb:          [PASS][27] -> [DMESG-WARN][28] ([i915#478])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-snb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][29] -> [INCOMPLETE][30] ([fdo#103665])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109642] / [fdo#111068])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-iclb6/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-iclb6/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-tglb:         [PASS][35] -> [INCOMPLETE][36] ([i915#472] / [i915#750])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-tglb1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-tglb6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  
#### Possible fixes ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [SKIP][37] ([fdo#112080]) -> [PASS][38] +12 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb5/igt@gem_busy@extended-parallel-vcs1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-iclb4/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [SKIP][39] ([fdo#112146]) -> [PASS][40] +4 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb2/igt@gem_exec_async@concurrent-writes-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-iclb6/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][41] ([i915#677]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-iclb6/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-snb:          [DMESG-WARN][43] ([i915#478]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb6/igt@gem_mmap_gtt@big-copy-odd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-snb5/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-hsw:          [FAIL][45] ([i915#694]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-apl6/igt@gem_softpin@noreloc-s3.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-apl3/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][49] ([i915#818]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw2/igt@gem_tiled_blits@interruptible.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-hsw8/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][51] ([fdo#111870] / [i915#478]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-iclb:         [SKIP][53] ([i915#1140]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-iclb1/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][57] ([i915#79]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][59] ([fdo#109441]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb7/igt@kms_psr@psr2_no_drrs.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][61] ([fdo#109276]) -> [PASS][62] +22 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb7/igt@prime_busy@hang-bsd2.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-iclb2/igt@prime_busy@hang-bsd2.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][63] ([i915#831]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][65] ([i915#818]) -> [FAIL][66] ([i915#694])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw7/igt@gem_tiled_blits@normal.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-hsw7/igt@gem_tiled_blits@normal.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][67] ([fdo#109349]) -> [DMESG-WARN][68] ([fdo#107724])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][69], [FAIL][70], [FAIL][71], [FAIL][72], [FAIL][73], [FAIL][74], [FAIL][75], [FAIL][76]) ([fdo#111870] / [i915#1077]) -> ([FAIL][77], [FAIL][78], [FAIL][79], [FAIL][80], [FAIL][81], [FAIL][82], [FAIL][83], [FAIL][84]) ([fdo#111870] / [i915#1077] / [i915#698])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb5/igt@runner@aborted.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb5/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb4/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb4/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb6/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb6/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb5/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb2/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-snb2/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-snb5/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-snb5/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-snb6/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-snb2/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-snb1/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-snb2/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/shard-snb1/igt@runner@aborted.html

  
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109100]: https://bugs.freedesktop.org/show_bug.cgi?id=109100
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#750]: https://gitlab.freedesktop.org/drm/intel/issues/750
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5417 -> IGTPW_4093
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7864: 5a140e2fc771e4c8b10d14e2db7bfb4996ee9d8a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4093: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/index.html
  IGT_5417: 33cc93c8ba5daa0b7498f297a4f626844d895d06 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4093/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
