Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 06 Feb 2020 17:50:20 -0000
Message-ID: <158101142010.15033.14960229283148740599@emeril.freedesktop.org>
References: <20200204171428.16466-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200204171428.16466-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fset=5Ftiling=5Fvs=5Fpwrite=3A_disable_test_on_gens_w?=
 =?utf-8?q?ithout_fences?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_set_tiling_vs_pwrite: disable test on gens without fences
URL   : https://patchwork.freedesktop.org/series/72984/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7864_full -> IGTPW_4094_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4094_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4094_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4094_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-iclb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  
Known issues
------------

  Here are the changes found in IGTPW_4094_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +11 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb3/igt@gem_exec_schedule@in-order-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-iclb4/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +17 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb1/igt@gem_exec_schedule@out-order-bsd2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-iclb7/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#644])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#413])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb5/igt@i915_pm_rps@waitboost.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-iclb2/igt@i915_pm_rps@waitboost.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#1140])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb5/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-iclb7/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_busy@basic-flip-pipe-a:
    - shard-tglb:         [PASS][15] -> [DMESG-WARN][16] ([i915#402])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-tglb1/igt@kms_busy@basic-flip-pipe-a.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-tglb8/igt@kms_busy@basic-flip-pipe-a.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-hsw:          [PASS][19] -> [INCOMPLETE][20] ([i915#61])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-hsw7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-snb:          [PASS][21] -> [DMESG-WARN][22] ([i915#478])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109642] / [fdo#111068])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-iclb1/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@pi-common-bsd1:
    - shard-iclb:         [SKIP][29] ([fdo#109276]) -> [PASS][30] +17 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][31] ([i915#677]) -> [PASS][32] +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][33] ([fdo#112146]) -> [PASS][34] +9 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-snb:          [DMESG-WARN][35] ([i915#478]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb6/igt@gem_mmap_gtt@big-copy-odd.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-snb2/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-hsw:          [FAIL][37] ([i915#694]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][39] ([i915#180]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-apl6/igt@gem_softpin@noreloc-s3.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-apl7/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][41] ([i915#818]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw2/igt@gem_tiled_blits@interruptible.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-hsw4/igt@gem_tiled_blits@interruptible.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][43] ([i915#725]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw7/igt@i915_selftest@live_blt.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-hsw6/igt@i915_selftest@live_blt.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-iclb:         [SKIP][45] ([i915#1140]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-iclb8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][49] ([i915#79]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][51] ([i915#899]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][53] ([fdo#109441]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][55] ([fdo#112080]) -> [PASS][56] +12 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb7/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][57] ([i915#831]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-hsw7/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][59] ([i915#818]) -> [FAIL][60] ([i915#694])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw7/igt@gem_tiled_blits@normal.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-hsw7/igt@gem_tiled_blits@normal.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][61] ([fdo#109349]) -> [DMESG-WARN][62] ([fdo#107724])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][63], [FAIL][64], [FAIL][65], [FAIL][66], [FAIL][67], [FAIL][68], [FAIL][69], [FAIL][70]) ([fdo#111870] / [i915#1077]) -> ([FAIL][71], [FAIL][72], [FAIL][73], [FAIL][74], [FAIL][75], [FAIL][76], [FAIL][77], [FAIL][78], [FAIL][79]) ([fdo#111870] / [i915#1077] / [i915#698])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb5/igt@runner@aborted.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb5/igt@runner@aborted.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb4/igt@runner@aborted.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb4/igt@runner@aborted.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb6/igt@runner@aborted.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb6/igt@runner@aborted.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb5/igt@runner@aborted.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb2/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-snb4/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-snb5/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-snb6/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-snb5/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-snb6/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-snb2/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-snb2/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-snb1/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/shard-snb2/igt@runner@aborted.html

  
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5417 -> IGTPW_4094
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7864: 5a140e2fc771e4c8b10d14e2db7bfb4996ee9d8a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4094: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/index.html
  IGT_5417: 33cc93c8ba5daa0b7498f297a4f626844d895d06 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4094/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
