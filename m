Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 06 Feb 2020 14:32:40 -0000
Message-ID: <158099956073.15031.7105673186729229481@emeril.freedesktop.org>
References: <20200204100855.27627-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200204100855.27627-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHM6?=
 =?utf-8?q?_add_i915-query_perf_tests_=28rev4=29?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests: add i915-query perf tests (rev4)
URL   : https://patchwork.freedesktop.org/series/72235/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7864_full -> IGTPW_4089_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4089_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4089_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4089_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_query@query-perf-configs (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-kbl6/igt@i915_query@query-perf-configs.html
    - shard-hsw:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-hsw2/igt@i915_query@query-perf-configs.html
    - shard-iclb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-iclb3/igt@i915_query@query-perf-configs.html
    - shard-glk:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-glk2/igt@i915_query@query-perf-configs.html
    - shard-apl:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-apl2/igt@i915_query@query-perf-configs.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7864_full and IGTPW_4089_full:

### New IGT tests (9) ###

  * igt@gem_ctx_sseu@engines:
    - Statuses : 1 pass(s) 5 skip(s)
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
    - Exec time: [0.04, 0.15] s

  * igt@i915_query@query-perf-config-data-invalid:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_query@query-perf-config-list-invalid:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_query@query-perf-configs:
    - Statuses : 5 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.23] s

  * igt@i915_selftest@live_active:
    - Statuses : 7 pass(s)
    - Exec time: [0.39, 0.72] s

  

Known issues
------------

  Here are the changes found in IGTPW_4089_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#112080]) +15 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][8] -> [DMESG-WARN][9] ([i915#180]) +8 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#110841])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#109276]) +19 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb4/igt@gem_exec_schedule@fifo-bsd1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-iclb7/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#859])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-glk2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-glk5/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([i915#677])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb3/igt@gem_exec_schedule@pi-userfault-bsd.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([fdo#112146]) +5 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][20] -> [INCOMPLETE][21] ([fdo#103665])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-kbl4/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_partial_pwrite_pread@write-snoop:
    - shard-hsw:          [PASS][22] -> [FAIL][23] ([i915#694]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw2/igt@gem_partial_pwrite_pread@write-snoop.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-hsw7/igt@gem_partial_pwrite_pread@write-snoop.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#644])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [PASS][26] -> [DMESG-WARN][27] ([fdo#111870] / [i915#478])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][28] -> [FAIL][29] ([i915#454])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-iclb:         [PASS][30] -> [SKIP][31] ([i915#1140])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-iclb5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][32] -> [FAIL][33] ([i915#54]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-apl:          [PASS][34] -> [FAIL][35] ([i915#54]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding:
    - shard-glk:          [PASS][36] -> [FAIL][37] ([i915#54])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-apl:          [PASS][38] -> [DMESG-WARN][39] ([i915#180])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#109642] / [fdo#111068])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-iclb8/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][42] -> [FAIL][43] ([i915#173])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb6/igt@kms_psr@no_drrs.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#109441])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][46] ([i915#677]) -> [PASS][47] +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][48] ([fdo#112146]) -> [PASS][49] +6 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-snb:          [DMESG-WARN][50] ([i915#478]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb6/igt@gem_mmap_gtt@big-copy-odd.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-snb6/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-hsw:          [FAIL][52] ([i915#694]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][54] ([i915#180]) -> [PASS][55] +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-apl6/igt@gem_softpin@noreloc-s3.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-apl4/igt@gem_softpin@noreloc-s3.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][56] ([i915#725]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw7/igt@i915_selftest@live_blt.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-hsw2/igt@i915_selftest@live_blt.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-iclb:         [SKIP][58] ([i915#1140]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-iclb8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][60] ([i915#180]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][62] ([i915#79]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][64] ([i915#899]) -> [PASS][65] +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][66] ([fdo#109642] / [fdo#111068]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb8/igt@kms_psr2_su@frontbuffer.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][68] ([fdo#109441]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][70] ([i915#31]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-apl2/igt@kms_setmode@basic.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-apl4/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][72] ([fdo#112080]) -> [PASS][73] +14 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb7/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][74] ([fdo#109276]) -> [PASS][75] +18 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb7/igt@prime_busy@hang-bsd2.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-iclb4/igt@prime_busy@hang-bsd2.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][76] ([i915#831]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][78] ([fdo#112080]) -> [FAIL][79] ([IGT#28])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][80] ([i915#818]) -> [FAIL][81] ([i915#694])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw7/igt@gem_tiled_blits@normal.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/shard-hsw1/igt@gem_tiled_blits@normal.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#859]: https://gitlab.freedesktop.org/drm/intel/issues/859
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5417 -> IGTPW_4089
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7864: 5a140e2fc771e4c8b10d14e2db7bfb4996ee9d8a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4089: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/index.html
  IGT_5417: 33cc93c8ba5daa0b7498f297a4f626844d895d06 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4089/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
