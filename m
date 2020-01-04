Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 04 Jan 2020 04:54:42 -0000
Message-ID: <157811368216.3253.13452492801329797081@emeril.freedesktop.org>
References: <20200103174133.2078500-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200103174133.2078500-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9w?=
 =?utf-8?q?erf=3A_Find_the_associated_perf-type_for_a_particular_device?=
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

Series: i915/perf: Find the associated perf-type for a particular device
URL   : https://patchwork.freedesktop.org/series/71609/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7674_full -> IGTPW_3897_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/index.html

Known issues
------------

  Here are the changes found in IGTPW_3897_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@processes:
    - shard-tglb:         [PASS][1] -> [FAIL][2] ([i915#570])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-tglb1/igt@gem_ctx_persistence@processes.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-tglb1/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_persistence@vcs1-hostile-preempt:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-iclb4/igt@gem_ctx_persistence@vcs1-hostile-preempt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-iclb7/igt@gem_ctx_persistence@vcs1-hostile-preempt.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd1:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276]) +10 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd1.html

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([fdo#111735])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-tglb7/igt@gem_ctx_shared@q-smoketest-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-tglb6/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-iclb7/igt@gem_exec_schedule@reorder-wide-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-tglb:         [PASS][11] -> [TIMEOUT][12] ([fdo#112126] / [i915#530])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-tglb5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-tglb1/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-iclb:         [PASS][13] -> [TIMEOUT][14] ([i915#530])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-iclb5/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-iclb1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_ppgtt@blt-vs-render-ctxn:
    - shard-tglb:         [PASS][15] -> [INCOMPLETE][16] ([i915#470] / [i915#475])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-tglb5/igt@gem_ppgtt@blt-vs-render-ctxn.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-tglb3/igt@gem_ppgtt@blt-vs-render-ctxn.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#644])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_sync@basic-all:
    - shard-tglb:         [PASS][19] -> [INCOMPLETE][20] ([i915#470] / [i915#472])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-tglb7/igt@gem_sync@basic-all.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-tglb1/igt@gem_sync@basic-all.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [PASS][21] -> [DMESG-WARN][22] ([fdo#111870]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@i915_selftest@live_gt_timelines:
    - shard-tglb:         [PASS][23] -> [INCOMPLETE][24] ([i915#455])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-tglb2/igt@i915_selftest@live_gt_timelines.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-tglb3/igt@i915_selftest@live_gt_timelines.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#72])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:
    - shard-snb:          [PASS][27] -> [DMESG-WARN][28] ([i915#478])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-snb7/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-snb5/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-kbl6/igt@kms_flip@flip-vs-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-kbl7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([i915#49])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#31])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-apl4/igt@kms_setmode@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-apl6/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#112080]) +9 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-iclb1/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-iclb6/igt@perf_pmu@busy-accuracy-2-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][41] ([fdo#112080]) -> [PASS][42] +14 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-iclb5/igt@gem_busy@busy-vcs1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-iclb1/igt@gem_busy@busy-vcs1.html

  * igt@gem_busy@close-race:
    - shard-tglb:         [INCOMPLETE][43] ([i915#435]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-tglb5/igt@gem_busy@close-race.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-tglb7/igt@gem_busy@close-race.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +5 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html
    - shard-iclb:         [DMESG-WARN][47] ([fdo#111764]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-iclb5/igt@gem_ctx_isolation@rcs0-s3.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-iclb5/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][49] ([fdo#109276] / [fdo#112080]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-iclb7/igt@gem_ctx_persistence@vcs1-queued.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-iclb1/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-snb:          [TIMEOUT][51] ([fdo#111518]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-snb4/igt@gem_eio@in-flight-contexts-10ms.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-snb2/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_balancer@nop:
    - shard-tglb:         [INCOMPLETE][53] ([fdo#111736]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-tglb6/igt@gem_exec_balancer@nop.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-tglb8/igt@gem_exec_balancer@nop.html

  * {igt@gem_exec_schedule@pi-userfault-bsd}:
    - shard-iclb:         [SKIP][55] ([i915#677]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-iclb6/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][57] ([fdo#109276]) -> [PASS][58] +15 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-chain-render:
    - shard-tglb:         [INCOMPLETE][59] ([fdo#111606] / [fdo#111677]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-tglb3/igt@gem_exec_schedule@preempt-queue-chain-render.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-tglb6/igt@gem_exec_schedule@preempt-queue-chain-render.html

  * igt@gem_exec_schedule@preempt-self-bsd:
    - shard-iclb:         [SKIP][61] ([fdo#112146]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-iclb1/igt@gem_exec_schedule@preempt-self-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-iclb8/igt@gem_exec_schedule@preempt-self-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-tglb:         [INCOMPLETE][63] ([fdo#111736] / [i915#460]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-tglb3/igt@gem_exec_suspend@basic-s3.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-tglb1/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][65] ([i915#644]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][67] ([fdo#111870]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html

  * {igt@gen9_exec_parse@allowed-all}:
    - shard-glk:          [DMESG-WARN][69] ([i915#716]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-glk9/igt@gen9_exec_parse@allowed-all.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-glk1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][71] ([i915#454]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [FAIL][73] ([i915#54]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [FAIL][75] ([i915#54]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
    - shard-glk:          [FAIL][77] ([i915#54]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-tglb:         [FAIL][81] ([i915#49]) -> [PASS][82] +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [INCOMPLETE][83] ([fdo#103665]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][85] ([fdo#109441]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-iclb6/igt@kms_psr@psr2_cursor_blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][87] ([fdo#109276] / [fdo#112080]) -> [FAIL][88] ([IGT#28])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_ctx_isolation@vcs2-dirty-create:
    - shard-tglb:         [SKIP][89] ([fdo#112080]) -> [SKIP][90] ([fdo#111912] / [fdo#112080])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-tglb9/igt@gem_ctx_isolation@vcs2-dirty-create.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-tglb7/igt@gem_ctx_isolation@vcs2-dirty-create.html

  * igt@gem_ctx_isolation@vcs2-dirty-switch:
    - shard-tglb:         [SKIP][91] ([fdo#111912] / [fdo#112080]) -> [SKIP][92] ([fdo#112080])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-tglb2/igt@gem_ctx_isolation@vcs2-dirty-switch.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-tglb9/igt@gem_ctx_isolation@vcs2-dirty-switch.html

  * igt@kms_atomic_transition@6x-modeset-transitions:
    - shard-tglb:         [SKIP][93] ([fdo#112021]) -> [SKIP][94] ([fdo#112016] / [fdo#112021])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7674/shard-tglb9/igt@kms_atomic_transition@6x-modeset-transitions.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/shard-tglb5/igt@kms_atomic_transition@6x-modeset-transitions.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111518]: https://bugs.freedesktop.org/show_bug.cgi?id=111518
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#111912]: https://bugs.freedesktop.org/show_bug.cgi?id=111912
  [fdo#112016]: https://bugs.freedesktop.org/show_bug.cgi?id=112016
  [fdo#112021]: https://bugs.freedesktop.org/show_bug.cgi?id=112021
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112126]: https://bugs.freedesktop.org/show_bug.cgi?id=112126
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#455]: https://gitlab.freedesktop.org/drm/intel/issues/455
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#475]: https://gitlab.freedesktop.org/drm/intel/issues/475
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#570]: https://gitlab.freedesktop.org/drm/intel/issues/570
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5357 -> IGTPW_3897
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7674: 6cdc2db5a5641dd00f47fcc80b83bb8adb777797 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3897: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/index.html
  IGT_5357: a555a4b98f90dab655d24bb3d07e9291a8b8dac8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3897/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
